@implementation STSSuggestionTableViewCell

- (STSSuggestionTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  STSSuggestionTableViewCell *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)STSSuggestionTableViewCell;
  v4 = -[STSSuggestionTableViewCell initWithStyle:reuseIdentifier:](&v16, sel_initWithStyle_reuseIdentifier_, a3, a4);
  if (v4)
  {
    _UIImageGetSearchGlass();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BEBD640];
    objc_msgSend(v5, "size");
    v8 = v7;
    v10 = v9;
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _UIImageGetSearchGlass();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_tintedImageForSize:withTint:effectsImage:maskImage:style:", v11, 0, v12, 0, v8, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    -[STSSuggestionTableViewCell imageView](v4, "imageView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setImage:", v13);

  }
  return v4;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)STSSuggestionTableViewCell;
  -[STSSuggestionTableViewCell layoutSubviews](&v13, sel_layoutSubviews);
  -[STSSuggestionTableViewCell imageView](self, "imageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");

  -[STSSuggestionTableViewCell imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrame:", 14.0, 22.0, 18.0, 18.0);

  -[STSSuggestionTableViewCell textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[STSSuggestionTableViewCell textLabel](self, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 38.0, v7, v9, v11);

}

@end
