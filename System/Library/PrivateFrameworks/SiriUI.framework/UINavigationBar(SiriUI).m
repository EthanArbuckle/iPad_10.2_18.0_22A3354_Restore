@implementation UINavigationBar(SiriUI)

- (void)siriui_customizeAppearance
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc_init(MEMORY[0x24BDF6AC8]);
  objc_msgSend(a1, "setBackgroundImage:forBarMetrics:", v2, 0);

  objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTintColor:", v3);
  v6 = *MEMORY[0x24BDF6600];
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTitleTextAttributes:", v4);

  objc_msgSend(a1, "backItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", &stru_24D7DA7D8);

  objc_msgSend(a1, "_setHidesShadow:", 1);
}

@end
