@implementation PRUISPosterSnapshotFilesystemCache(IncomingCallAdditions)

+ (void)incomingCallSnapshotCache
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2445ED000, log, OS_LOG_TYPE_ERROR, "Unable to create cache directory at URL %@: %@", (uint8_t *)&v3, 0x16u);
}

@end
