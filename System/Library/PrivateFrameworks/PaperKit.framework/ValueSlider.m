@implementation ValueSlider

- (_TtC8PaperKit11ValueSlider)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized ValueSlider.init(coder:)();
}

- (void)didStartChangingSlider
{
  -[ValueSlider sendActionsForControlEvents:](self, sel_sendActionsForControlEvents_, 1);
}

- (void)didFinishChangingSlider
{
  -[ValueSlider sendActionsForControlEvents:](self, sel_sendActionsForControlEvents_, 448);
}

- (void)didChangeSlider
{
  _TtC8PaperKit11ValueSlider *v2;

  v2 = self;
  ValueSlider.didChangeSlider()();

}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  _TtC8PaperKit11ValueSlider *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v2 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ValueSlider_contentStackView);
  v3 = *MEMORY[0x1E0DC4FF8];
  v4 = *(double *)(MEMORY[0x1E0DC4FF8] + 8);
  v5 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  v7 = v6;
  v9 = v8;
  v10 = *(double *)((char *)&v5->super.super.super.super.isa
                  + OBJC_IVAR____TtC8PaperKit11ValueSlider_minimumContentSizeHeight);

  if (v10 > v9)
    v11 = v10;
  else
    v11 = v9;
  v12 = v7;
  result.height = v11;
  result.width = v12;
  return result;
}

- (_TtC8PaperKit11ValueSlider)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit11ValueSlider *result;

  result = (_TtC8PaperKit11ValueSlider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit11ValueSlider_leadingContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit11ValueSlider_trailingContentView));

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit11ValueSlider_contentStackView));
}

@end
