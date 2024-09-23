@implementation _TFTextFormattingContentView

- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithCoder:(id)a3
{
  id v5;
  _TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *result;

  swift_weakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView____lazy_storage___childView) = 0;
  v5 = a3;

  result = (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *)sub_247F8F678();
  __break(1u);
  return result;
}

- (UIEdgeInsets)safeAreaInsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = *MEMORY[0x24BEBE158];
  v3 = *(double *)(MEMORY[0x24BEBE158] + 8);
  v4 = *(double *)(MEMORY[0x24BEBE158] + 16);
  v5 = *(double *)(MEMORY[0x24BEBE158] + 24);
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView)initWithFrame:(CGRect)a3
{
  _TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *result;

  result = (_TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_weakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16TextFormattingUIP33_BDE70E073124A1E87C81AA7137722CAE28_TFTextFormattingContentView____lazy_storage___childView));
}

@end
