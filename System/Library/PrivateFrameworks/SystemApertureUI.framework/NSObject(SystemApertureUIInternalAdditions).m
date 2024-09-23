@implementation NSObject(SystemApertureUIInternalAdditions)

- (void)uniquelyIdentifyElement
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138543618;
  v4 = a1;
  v5 = 2114;
  v6 = a2;
  _os_log_error_impl(&dword_247C5B000, log, OS_LOG_TYPE_ERROR, "Attempt to uniquely identify element that already has a unique identifier – ignoring: element: %{public}@; uniqueID: %{public}@",
    (uint8_t *)&v3,
    0x16u);
}

@end
