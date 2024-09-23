@implementation SBApplicationShortcutReportRecipe

- (id)title
{
  return CFSTR("Application Shortcut Log Dump");
}

- (void)_dumpReport
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "***WARNING*** SBSuppressAppShortcutTruncation is enabled.  You probably don't want this on.", v1, 2u);
}

@end
