@implementation SiriSharedUIContentLabel

+ (id)label
{
  return (id)objc_msgSend((id)objc_opt_class(), "labelWithLightWeightRegularFont");
}

+ (id)labelWithLightWeightFontSize:(double)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_lightWeightFontWithSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  return v4;
}

+ (id)labelWithThinWeightFontSize:(double)a3
{
  id v4;
  void *v5;

  v4 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_thinWeightFontWithSize:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFont:", v5);

  return v4;
}

+ (id)labelWithThinWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_thinWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithLightWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_lightWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithMediumWeightRegularFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_mediumWeightBodySizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithThinWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_thinWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithLightWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_lightWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithMediumWeightSubtextFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_mediumWeightBodySubtextSizeFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

+ (id)labelWithHeaderFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_headerFont");
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
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_subtitleFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  objc_msgSend(v2, "setTextAlignment:", 1);
  return v2;
}

- (SiriSharedUIContentLabel)initWithFrame:(CGRect)a3
{
  SiriSharedUIContentLabel *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SiriSharedUIContentLabel;
  v3 = -[SiriSharedUIContentLabel initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentLabel setTextColor:](v3, "setTextColor:", v4);

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SiriSharedUIContentLabel setBackgroundColor:](v3, "setBackgroundColor:", v5);

  }
  return v3;
}

+ (id)labelWithBodyFont
{
  id v2;
  void *v3;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(MEMORY[0x1E0DC1350], "sirisharedui_dynamicBodyFont");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFont:", v3);

  return v2;
}

@end
