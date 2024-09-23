@implementation VUICollectionHeaderViewLayout

- (VUITextLayout)titleTextLayout
{
  return self->_titleTextLayout;
}

- (VUICollectionHeaderViewLayout)init
{
  VUICollectionHeaderViewLayout *v2;
  VUITextLayout *v3;
  void *v4;
  VUITextLayout *titleTextLayout;
  VUITextLayout *v6;
  VUITextLayout *v7;
  void *v8;
  VUITextLayout *subtitleTextLayout;
  VUITextLayout *v10;
  void *v11;
  TVImageLayout *imageViewLayout;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)VUICollectionHeaderViewLayout;
  v2 = -[TVViewLayout init](&v14, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v3, "setTextStyle:", 2);
    -[VUITextLayout setFontWeight:](v3, "setFontWeight:", 10);
    -[VUITextLayout setNumberOfLines:](v3, "setNumberOfLines:", 2);
    -[VUITextLayout setMinimumScaleFactor:](v3, "setMinimumScaleFactor:", 0.67);
    objc_msgSend(MEMORY[0x1E0DC3658], "vui_primaryTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v3, "setColor:", v4);

    titleTextLayout = v2->_titleTextLayout;
    v2->_titleTextLayout = v3;
    v6 = v3;

    v7 = objc_alloc_init(VUITextLayout);
    -[VUITextLayout setTextStyle:](v7, "setTextStyle:", 14);
    -[VUITextLayout setNumberOfLines:](v7, "setNumberOfLines:", 2);
    -[VUITextLayout setMinimumScaleFactor:](v7, "setMinimumScaleFactor:", 0.67);
    objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VUITextLayout setColor:](v7, "setColor:", v8);

    subtitleTextLayout = v2->_subtitleTextLayout;
    v2->_subtitleTextLayout = v7;
    v10 = v7;

    v11 = (void *)objc_opt_new();
    objc_msgSend(v11, "setScaleMode:", 1);
    imageViewLayout = v2->_imageViewLayout;
    v2->_imageViewLayout = (TVImageLayout *)v11;

  }
  return v2;
}

+ (id)maxImageContentSizeCategory
{
  return (id)*MEMORY[0x1E0DC48C8];
}

- (VUITextLayout)subtitleTextLayout
{
  return self->_subtitleTextLayout;
}

- (TVImageLayout)imageViewLayout
{
  return self->_imageViewLayout;
}

- (void)setImageViewLayout:(id)a3
{
  objc_storeStrong((id *)&self->_imageViewLayout, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageViewLayout, 0);
  objc_storeStrong((id *)&self->_subtitleTextLayout, 0);
  objc_storeStrong((id *)&self->_titleTextLayout, 0);
}

@end
