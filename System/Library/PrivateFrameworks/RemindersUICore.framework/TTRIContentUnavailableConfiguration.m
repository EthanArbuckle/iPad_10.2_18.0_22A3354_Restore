@implementation TTRIContentUnavailableConfiguration

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

+ (id)emptyConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)emptyProminentConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3698], "emptyProminentConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)loadingConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3698], "loadingConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)searchConfiguration
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "asTTRI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (UIImage)image
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setImage:", v4);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (NSAttributedString)attributedText
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "attributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributedText:", v4);

}

- (TTRIContentUnavailableTextProperties)textProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "textProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asTTRI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTRIContentUnavailableTextProperties *)v4;
}

- (NSString)secondaryText
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setSecondaryText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryText:", v4);

}

- (NSAttributedString)secondaryAttributedText
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryAttributedText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSAttributedString *)v3;
}

- (void)setSecondaryAttributedText:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSecondaryAttributedText:", v4);

}

- (TTRIContentUnavailableTextProperties)secondaryTextProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "secondaryTextProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asTTRI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTRIContentUnavailableTextProperties *)v4;
}

- (TTRIContentUnavailableButtonProperties)buttonProperties
{
  void *v2;
  void *v3;
  void *v4;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buttonProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asTTRI");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (TTRIContentUnavailableButtonProperties *)v4;
}

- (id)makeContentView
{
  void *v2;
  void *v3;

  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "makeContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)updatedConfigurationForState:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[TTRIContentUnavailableConfiguration asUIKit](self, "asUIKit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "updatedConfigurationForState:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "instanceWrappingImpl:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
