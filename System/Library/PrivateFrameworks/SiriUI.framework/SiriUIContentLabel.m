@implementation SiriUIContentLabel

+ (id)label
{
  return (id)objc_msgSend((id)objc_opt_class(), "labelWithLightWeightRegularFont");
}

+ (id)labelWithLightWeightFontSize:(double)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_lightWeightFontWithSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  return v4;
}

+ (id)labelWithThinWeightFontSize:(double)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_thinWeightFontWithSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  return v4;
}

+ (id)labelWithThinWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_thinWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithLightWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_lightWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithMediumWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_mediumWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithThinWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_thinWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithLightWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_lightWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithMediumWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_mediumWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithHeaderFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_headerFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

+ (id)labelWithSubtitleFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (SiriUIContentLabel)initWithFrame:(CGRect)a3
{
  SiriUIContentLabel *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriUIContentLabel;
  v3 = -[SiriUIContentLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDF6950], "siriui_textColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentLabel setTextColor:](v3, "setTextColor:", v4);

    objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriUIContentLabel setBackgroundColor:](v3, "setBackgroundColor:", v5);

  }
  return v3;
}

+ (id)labelWithBodyFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x24BDF6A70], "siriui_dynamicBodyFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

@end
