-- findChats runs DISTINCT ON (key->>'remoteJid') ORDER BY remoteJid, messageTimestamp DESC
-- filtered by instanceId; without this it sequential-scans the whole Message table
-- (3M+ rows, ~110 GB read in 6h observed 2026-10-09).
CREATE INDEX IF NOT EXISTS "Message_instanceId_remoteJid_messageTimestamp_idx"
  ON "Message" ("instanceId", ("key"->>'remoteJid'), "messageTimestamp" DESC);
