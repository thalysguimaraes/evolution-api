-- Add archived-chat flag so the findChats API and Tutti can filter archived chats.
ALTER TABLE "Chat" ADD COLUMN "isArchived" BOOLEAN NOT NULL DEFAULT false;
