@implementation VFXCoreView

+ (Class)layerClass
{
  sub_1B1B9DAD4(0, (unint64_t *)&unk_1ED4B79A0);
  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)isHidden
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXCoreView();
  return -[VFXCoreView isHidden](&v3, sel_isHidden);
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  id v4;
  id v5;
  unsigned __int8 v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for VFXCoreView();
  v4 = v7.receiver;
  -[VFXCoreView setHidden:](&v7, sel_setHidden_, v3);
  v5 = objc_msgSend(v4, sel_window, v7.receiver, v7.super_class);

  if (v5)
    v6 = objc_msgSend(v4, sel_isHidden);
  else
    v6 = 1;
  *((_BYTE *)v4 + OBJC_IVAR____TtC3VFX11VFXCoreView_paused) = v6;
  sub_1B1E50854();

}

- (_TtC3VFX11VFXCoreView)initWithCoder:(id)a3
{
  return (_TtC3VFX11VFXCoreView *)sub_1B1E50B7C(a3);
}

- (void)dealloc
{
  _TtC3VFX11VFXCoreView *v2;

  v2 = self;
  sub_1B1E51074();
}

- (void).cxx_destruct
{
  sub_1B1B0D8D0((uint64_t)self + OBJC_IVAR____TtC3VFX11VFXCoreView_delegate);
  swift_release();

  sub_1B19E5A18(*(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC3VFX11VFXCoreView_postRenderCallback));
  swift_weakDestroy();
  swift_weakDestroy();
}

- (void)didMoveToWindow
{
  _TtC3VFX11VFXCoreView *v2;
  id v3;
  id v4;
  objc_super v5;

  v2 = self;
  v3 = -[VFXCoreView window](v2, sel_window);
  v4 = v3;
  if (v3)

  sub_1B1E5133C(v4 != 0);
  v5.receiver = v2;
  v5.super_class = (Class)type metadata accessor for VFXCoreView();
  -[VFXCoreView didMoveToWindow](&v5, sel_didMoveToWindow);

}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXCoreView();
  v2 = v3.receiver;
  -[VFXCoreView layoutSubviews](&v3, sel_layoutSubviews);
  sub_1B1E516E0();

}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  objc_super v6;
  CGRect result;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXCoreView();
  -[VFXCoreView frame](&v6, sel_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v7;
  objc_super v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for VFXCoreView();
  v7 = v8.receiver;
  -[VFXCoreView setFrame:](&v8, sel_setFrame_, x, y, width, height);
  sub_1B1E516E0();

}

- (UIColor)backgroundColor
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for VFXCoreView();
  return -[VFXCoreView backgroundColor](&v3, sel_backgroundColor);
}

- (void)setBackgroundColor:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for VFXCoreView();
  v4 = a3;
  v5 = v6.receiver;
  -[VFXCoreView setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
  sub_1B1E51888();

}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  sub_1B1E51C18(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesBegan_withEvent_);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B1E51C18(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesEnded_withEvent_);
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1B1E51C18(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesMoved_withEvent_);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  sub_1B1E51C18(self, (uint64_t)a2, (uint64_t)a3, a4, (SEL *)&selRef_touchesCancelled_withEvent_);
}

- (_TtC3VFX11VFXCoreView)initWithFrame:(CGRect)a3
{
  _TtC3VFX11VFXCoreView *result;

  result = (_TtC3VFX11VFXCoreView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end
