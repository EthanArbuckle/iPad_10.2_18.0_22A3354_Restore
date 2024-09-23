@implementation AttributeStylingButton

- (_TtC8PaperKit22AttributeStylingButton)initWithCoder:(id)a3
{
  _TtC8PaperKit22AttributeStylingButton *result;

  result = (_TtC8PaperKit22AttributeStylingButton *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _TtC8PaperKit22AttributeStylingButton *v12;
  CGFloat v13;
  void *v14;
  CGRect v16;

  v8 = one-time initialization token for spacing;
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  if (v8 != -1)
    swift_once();
  v13 = -*(double *)&static AttributeStylingButton.spacing;
  objc_msgSend(v11, sel_rect);
  CGRectInset(v16, v13, v13);
  type metadata accessor for UIPointerRegion();
  v14 = (void *)UIPointerRegion.init(rect:identifier:)();

  return v14;
}

- (BOOL)isSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return -[AttributeStylingControl isSelected](&v3, sel_isSelected);
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
  -[AttributeStylingControl setSelected:](&v5, sel_setSelected_, v3);
  AttributeStylingButton.isSelected.didset();

}

@end
