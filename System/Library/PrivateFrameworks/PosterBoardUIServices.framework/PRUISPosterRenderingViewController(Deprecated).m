@implementation PRUISPosterRenderingViewController(Deprecated)

- (void)_cachedImageForRequest:()Deprecated .cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_2445ED000, v0, OS_LOG_TYPE_ERROR, "Error fetching latest snapshot bundle: %{public}@", v1, 0xCu);
}

@end
