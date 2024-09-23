@implementation ColorSwatch

- (_TtC8PaperKit11ColorSwatch)init
{
  objc_class *ObjectType;
  _TtC8PaperKit11ColorSwatch *v4;
  objc_super v6;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ColorSwatch_selectedColor) = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  v4 = -[ColorSwatch initWithFrame:](&v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  ColorSwatch.updateUI()();

  return v4;
}

- (_TtC8PaperKit11ColorSwatch)initWithCoder:(id)a3
{
  id v4;
  _TtC8PaperKit11ColorSwatch *result;

  *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8PaperKit11ColorSwatch_selectedColor) = 0;
  v4 = a3;

  result = (_TtC8PaperKit11ColorSwatch *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)layoutSubviews
{
  id v2;
  id v3;
  double Width;
  double Height;
  objc_super v6;
  CGRect v7;
  CGRect v8;

  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  v2 = v6.receiver;
  -[ColorSwatch layoutSubviews](&v6, sel_layoutSubviews);
  v3 = objc_msgSend(v2, sel_layer, v6.receiver, v6.super_class);
  objc_msgSend(v2, sel_bounds);
  Width = CGRectGetWidth(v7);
  objc_msgSend(v2, sel_bounds);
  Height = CGRectGetHeight(v8);
  if (Height >= Width)
    Height = Width;
  objc_msgSend(v3, sel_setCornerRadius_, Height * 0.5);

}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[ColorSwatch isSelected](&v3, sel_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v4 = v5.receiver;
  -[ColorSwatch setSelected:](&v5, sel_setSelected_, v3);
  ColorSwatch.updateUI()();

}

- (void)didMoveToWindow
{
  id v2;
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = v4.receiver;
  -[ColorSwatch didMoveToWindow](&v4, sel_didMoveToWindow);
  v3 = objc_msgSend(v2, sel_window, v4.receiver, v4.super_class);

  if (v3)
    ColorSwatch.updateUI()();

}

- (void)traitCollectionDidChange:(id)a3
{
  objc_class *ObjectType;
  id v6;
  _TtC8PaperKit11ColorSwatch *v7;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v6 = a3;
  v7 = self;
  ColorSwatch.updateUI()();
  v8.receiver = v7;
  v8.super_class = ObjectType;
  -[ColorSwatch traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v6);

}

- (_TtC8PaperKit11ColorSwatch)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit11ColorSwatch *result;

  result = (_TtC8PaperKit11ColorSwatch *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
