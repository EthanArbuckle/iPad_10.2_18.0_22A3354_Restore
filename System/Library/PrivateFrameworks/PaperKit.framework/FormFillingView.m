@implementation FormFillingView

- (_TtC8PaperKit15FormFillingView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  specialized FormFillingView.init(coder:)();
}

- (void)tap:(id)a3
{
  UITapGestureRecognizer *v4;
  _TtC8PaperKit15FormFillingView *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  FormFillingView.tap(_:)(v4);

}

- (void)doubleTap:(id)a3
{
  UITapGestureRecognizer *v4;
  _TtC8PaperKit15FormFillingView *v5;

  v4 = (UITapGestureRecognizer *)a3;
  v5 = self;
  FormFillingView.doubleTap(_:)(v4);

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v8;
  _TtC8PaperKit15FormFillingView *v9;
  UIView_optional *v10;
  void *v11;
  void *v12;
  UIEvent_optional v14;

  y = a3.y;
  x = a3.x;
  v8 = a4;
  v9 = self;
  v14.value.super.isa = (Class)a4;
  FormFillingView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v14);
  v12 = v11;

  return v12;
}

- (id)editMenuInteraction:(id)a3 menuForConfiguration:(id)a4 suggestedActions:(id)a5
{
  id v7;
  id v8;
  _TtC8PaperKit15FormFillingView *v9;
  Class isa;

  v7 = a3;
  v8 = a4;
  v9 = self;
  isa = specialized FormFillingView.editMenuInteraction(_:menuFor:suggestedActions:)().super.super.isa;

  return isa;
}

- (_TtC8PaperKit15FormFillingView)initWithFrame:(CGRect)a3
{
  _TtC8PaperKit15FormFillingView *result;

  result = (_TtC8PaperKit15FormFillingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit15FormFillingView_editMenuInteraction));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
}

@end
