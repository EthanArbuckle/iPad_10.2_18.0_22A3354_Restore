@implementation DescriptionTemplateView.DescriptionTemplateContentView

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  double height;
  double width;
  _TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  v7 = self;
  v8 = sub_1DA04B0C8(a4, width, height);
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithFrame:(CGRect)a3
{
  _TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView *result;

  sub_1DA04B268();
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (_TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView)initWithCoder:(id)a3
{
  _TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView *result;

  sub_1DA04B2F8(a3);
  OUTLINED_FUNCTION_2_1();
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCC8VideosUI23DescriptionTemplateView30DescriptionTemplateContentView_descriptionTextView));
}

@end
