@implementation BYBackupMetadata(SetupAssistantSupport)

- (void)expressSettings
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A4E92000, log, OS_LOG_TYPE_ERROR, "Failed to parse settings data from backup metadata", v1, 2u);
}

@end
