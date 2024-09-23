@implementation _UIMagicMorphAnimation.ReparentingView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  void *v7;
  id v8;
  _TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView *v9;
  id v10;

  y = a3.y;
  x = a3.x;
  v7 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal);
  v8 = a4;
  v9 = self;
  -[UIView convertPoint:toCoordinateSpace:](v9, sel_convertPoint_toCoordinateSpace_, v7, x, y);
  v10 = objc_msgSend(v7, sel_hitTest_withEvent_, v8);

  return v10;
}

- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v8;
  id v9;
  _TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView *v10;
  _QWORD *v11;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal;
  v9 = objc_allocWithZone((Class)_UIPortalView);
  v10 = self;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(v9, sel_init);
  v11 = (Class *)((char *)&v10->super.super.super.isa
                + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_OpacityPairInputAmount);
  *v11 = 0xD00000000000001FLL;
  v11[1] = 0x8000000186685ED0;

  v13.receiver = v10;
  v13.super_class = (Class)type metadata accessor for _UIMagicMorphAnimation.ReparentingView();
  return -[UIView initWithFrame:](&v13, sel_initWithFrame_, x, y, width, height);
}

- (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView)initWithCoder:(id)a3
{
  return (_TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView *)sub_18564EDE0(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC5UIKit22_UIMagicMorphAnimationP33_27010C79BBE8436D7F6A5CD454B184E515ReparentingView_portal));
  swift_bridgeObjectRelease();
}

@end
