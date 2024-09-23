@implementation UILabel(SiriUITextStyles)

+ (id)siriui_configuredLabel
{
  id v0;
  void *v1;
  void *v2;

  v0 = objc_alloc(MEMORY[0x24BDF6B68]);
  v1 = (void *)objc_msgSend(v0, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterTextColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTextColor:", v2);

  return v1;
}

+ (id)siriui_configuredBodyLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77B0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

+ (id)siriui_configuredHeadlineLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

+ (id)siriui_configuredSubheadLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

+ (id)siriui_configuredCaptionLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77C0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  objc_msgSend(v0, "setNumberOfLines:", 0);
  return v0;
}

+ (id)siriui_configuredPriceLabel
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_alloc(MEMORY[0x24BDF6A78]);
  v6 = *MEMORY[0x24BDF7768];
  v7[0] = *MEMORY[0x24BDF77B0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v1, "initWithFontAttributes:", v2);

  objc_msgSend(MEMORY[0x24BDF6A70], "fontWithDescriptor:size:", v3, 70.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v4);

  return v0;
}

+ (id)siriui_configuredTitleLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7848]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

+ (id)siriui_configuredTitle3Label
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7858]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

+ (id)siriui_configuredFootnoteLabel
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDF6B68], "siriui_configuredLabel");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77D0]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setFont:", v1);

  return v0;
}

- (void)setUseSecondaryTextColor
{
  id v2;

  objc_msgSend(MEMORY[0x24BDF6950], "siriui_platterSemiTransparentTextColor");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setTextColor:", v2);

}

@end
