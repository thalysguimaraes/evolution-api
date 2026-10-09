-- Prisma's key.path ['remoteJid'] filter compiles to ("key"->'remoteJid') = '"…"'::jsonb (jsonb, not text),
-- so the ->> text index does not apply to findMessages. Cover that form too.
CREATE INDEX IF NOT EXISTS "Message_instanceId_key_remoteJid_jsonb_messageTimestamp_idx"
  ON "Message" ("instanceId", ("key"->'remoteJid'), "messageTimestamp" DESC);
