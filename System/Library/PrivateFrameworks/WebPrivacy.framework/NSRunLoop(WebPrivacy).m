@implementation NSRunLoop(WebPrivacy)

- (void)_wp_runUntil:()WebPrivacy
{
  uint64_t v5;
  void *v6;
  char v7;
  char v8;

  v5 = *MEMORY[0x24BDBCA90];
  do
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(a1, "runMode:beforeDate:", v5, v6);

    if (*a3)
      v8 = 0;
    else
      v8 = v7;
  }
  while ((v8 & 1) != 0);
}

@end
