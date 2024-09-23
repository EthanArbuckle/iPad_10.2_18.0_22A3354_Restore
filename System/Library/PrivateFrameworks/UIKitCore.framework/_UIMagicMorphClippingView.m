@implementation _UIMagicMorphClippingView

- (_TtC5UIKit25_UIMagicMorphClippingView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5UIKit25_UIMagicMorphClippingView *result;

  v5 = OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformView;
  type metadata accessor for _UIMagicMorphTransformView();
  v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC5UIKit25_UIMagicMorphClippingView *)sub_186507E04();
  __break(1u);
  return result;
}

- (_TtC5UIKit25_UIMagicMorphClippingView)initWithFrame:(CGRect)a3
{
  return (_TtC5UIKit25_UIMagicMorphClippingView *)sub_18579A680(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5UIKit25_UIMagicMorphClippingView_transformViewLayer));
}

@end
