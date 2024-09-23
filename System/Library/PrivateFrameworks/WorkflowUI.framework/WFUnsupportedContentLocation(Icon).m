@implementation WFUnsupportedContentLocation(Icon)

- (uint64_t)icon
{
  NSObject *v0;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  getWFWorkflowExecutionLogObject();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
  {
    v2 = 136315138;
    v3 = "-[WFUnsupportedContentLocation(Icon) icon]";
    _os_log_impl(&dword_22007E000, v0, OS_LOG_TYPE_FAULT, "%s The UI should never attempt to display a WFUnsupportedContentLocation", (uint8_t *)&v2, 0xCu);
  }

  return 0;
}

@end
