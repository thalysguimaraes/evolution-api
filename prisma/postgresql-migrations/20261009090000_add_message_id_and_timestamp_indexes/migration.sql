-- History-sync dedup looks up key->>'id' per batch; windowed reads (findMessages with only a
-- messageTimestamp range, as Tutti's candidate scan does) need instanceId + timestamp.
CREATE INDEX IF NOT EXISTS "Message_instanceId_keyId_idx"
  ON "Message" ("instanceId", ("key"->>'id'));
CREATE INDEX IF NOT EXISTS "Message_instanceId_messageTimestamp_idx"
  ON "Message" ("instanceId", "messageTimestamp" DESC);
ANALYZE "Message";
