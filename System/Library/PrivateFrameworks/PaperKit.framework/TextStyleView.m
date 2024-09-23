@implementation TextStyleView

- (_TtC8PaperKit13TextStyleView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized TextStyleView.init(coder:)();
}

- (void)layoutSubviews
{
  _TtC8PaperKit13TextStyleView *v2;

  v2 = self;
  TextStyleView.layoutSubviews()();

}

- (_TtC8PaperKit13TextStyleView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit13TextStyleView *result;

  result = (_TtC8PaperKit13TextStyleView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TextStyleView_underlineStyleButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit13TextStyleView_strikethroughStyleButton));
}

@end
