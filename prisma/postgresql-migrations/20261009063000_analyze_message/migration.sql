-- Expression index stats are only collected by ANALYZE; without it the planner keeps seq-scanning.
ANALYZE "Message";
ANALYZE "MessageUpdate";
