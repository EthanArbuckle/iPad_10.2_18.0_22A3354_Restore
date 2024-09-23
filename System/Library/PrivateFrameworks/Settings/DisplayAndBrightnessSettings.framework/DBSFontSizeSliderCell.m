@implementation DBSFontSizeSliderCell

- (id)newControl
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = objc_alloc(MEMORY[0x24BE75580]);
  v3 = (void *)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BE75530], "appearance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "altTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BE75530], "appearance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "altTextColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.596078431, 1.0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v3, "setMinimumTrackTintColor:", v7);
  objc_msgSend(v3, "setMaximumTrackTintColor:", v7);

  return v3;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:", 5, 22.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("textformat.size.smaller"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "imageWithTintColor:renderingMode:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("textformat.size.larger"), v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "imageWithTintColor:renderingMode:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[PSControlTableCell control](self, "control");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMinimumValueImage:", v6);
  objc_msgSend(v10, "setMaximumValueImage:", v9);
  v11.receiver = self;
  v11.super_class = (Class)DBSFontSizeSliderCell;
  -[PSTableCell layoutSubviews](&v11, sel_layoutSubviews);

}

@end
