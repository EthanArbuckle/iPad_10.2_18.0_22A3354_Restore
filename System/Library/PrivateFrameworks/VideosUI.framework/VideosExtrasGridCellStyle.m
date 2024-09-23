@implementation VideosExtrasGridCellStyle

- (id)copyWithZone:(_NSZone *)a3
{
  VideosExtrasGridCellStyle *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = objc_alloc_init(VideosExtrasGridCellStyle);
  -[VideosExtrasGridCellStyle imageSize](self, "imageSize");
  -[VideosExtrasGridCellStyle setImageSize:](v4, "setImageSize:");
  -[VideosExtrasGridCellStyle titleFirstBaselineHeight](self, "titleFirstBaselineHeight");
  -[VideosExtrasGridCellStyle setTitleFirstBaselineHeight:](v4, "setTitleFirstBaselineHeight:");
  -[VideosExtrasGridCellStyle subtitleFirstBaselineHeight](self, "subtitleFirstBaselineHeight");
  -[VideosExtrasGridCellStyle setSubtitleFirstBaselineHeight:](v4, "setSubtitleFirstBaselineHeight:");
  -[VideosExtrasGridCellStyle titleTextStyle](self, "titleTextStyle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  -[VideosExtrasGridCellStyle setTitleTextStyle:](v4, "setTitleTextStyle:", v6);

  -[VideosExtrasGridCellStyle subtitleTextStyle](self, "subtitleTextStyle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  -[VideosExtrasGridCellStyle setSubtitleTextStyle:](v4, "setSubtitleTextStyle:", v8);

  -[VideosExtrasGridCellStyle titleDefaultFontAttributes](self, "titleDefaultFontAttributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  -[VideosExtrasGridCellStyle setTitleDefaultFontAttributes:](v4, "setTitleDefaultFontAttributes:", v10);

  -[VideosExtrasGridCellStyle subtitleDefaultFontAttributes](self, "subtitleDefaultFontAttributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  -[VideosExtrasGridCellStyle setSubtitleDefaultFontAttributes:](v4, "setSubtitleDefaultFontAttributes:", v12);

  -[VideosExtrasGridCellStyle titleTextColor](self, "titleTextColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  -[VideosExtrasGridCellStyle setTitleTextColor:](v4, "setTitleTextColor:", v14);

  -[VideosExtrasGridCellStyle subtitleTextColor](self, "subtitleTextColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  -[VideosExtrasGridCellStyle setSubtitleTextColor:](v4, "setSubtitleTextColor:", v16);

  -[VideosExtrasGridCellStyle textFirstBaselineToBottom](self, "textFirstBaselineToBottom");
  -[VideosExtrasGridCellStyle setTextFirstBaselineToBottom:](v4, "setTextFirstBaselineToBottom:");
  -[VideosExtrasGridCellStyle textLastBaselineToBottom](self, "textLastBaselineToBottom");
  -[VideosExtrasGridCellStyle setTextLastBaselineToBottom:](v4, "setTextLastBaselineToBottom:");
  -[VideosExtrasGridCellStyle setDefaultTextAlignment:](v4, "setDefaultTextAlignment:", -[VideosExtrasGridCellStyle defaultTextAlignment](self, "defaultTextAlignment"));
  return v4;
}

- (CGSize)imageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

- (double)titleFirstBaselineHeight
{
  return self->_titleFirstBaselineHeight;
}

- (void)setTitleFirstBaselineHeight:(double)a3
{
  self->_titleFirstBaselineHeight = a3;
}

- (double)subtitleFirstBaselineHeight
{
  return self->_subtitleFirstBaselineHeight;
}

- (void)setSubtitleFirstBaselineHeight:(double)a3
{
  self->_subtitleFirstBaselineHeight = a3;
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (void)setTitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)subtitleTextStyle
{
  return self->_subtitleTextStyle;
}

- (void)setSubtitleTextStyle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSDictionary)titleDefaultFontAttributes
{
  return self->_titleDefaultFontAttributes;
}

- (void)setTitleDefaultFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)subtitleDefaultFontAttributes
{
  return self->_subtitleDefaultFontAttributes;
}

- (void)setSubtitleDefaultFontAttributes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (UIColor)titleTextColor
{
  return self->_titleTextColor;
}

- (void)setTitleTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (UIColor)subtitleTextColor
{
  return self->_subtitleTextColor;
}

- (void)setSubtitleTextColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (double)textFirstBaselineToBottom
{
  return self->_textFirstBaselineToBottom;
}

- (void)setTextFirstBaselineToBottom:(double)a3
{
  self->_textFirstBaselineToBottom = a3;
}

- (double)textLastBaselineToBottom
{
  return self->_textLastBaselineToBottom;
}

- (void)setTextLastBaselineToBottom:(double)a3
{
  self->_textLastBaselineToBottom = a3;
}

- (int64_t)defaultTextAlignment
{
  return self->_defaultTextAlignment;
}

- (void)setDefaultTextAlignment:(int64_t)a3
{
  self->_defaultTextAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleTextColor, 0);
  objc_storeStrong((id *)&self->_titleTextColor, 0);
  objc_storeStrong((id *)&self->_subtitleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_titleDefaultFontAttributes, 0);
  objc_storeStrong((id *)&self->_subtitleTextStyle, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
}

@end
