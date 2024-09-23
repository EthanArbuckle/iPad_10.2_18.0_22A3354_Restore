@implementation _UISoftOutlineView

+ (Class)layerClass
{
  type metadata accessor for _UISoftOutlineView.Layer();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC5UIKit18_UISoftOutlineView)initWithCoder:(id)a3
{
  uint64_t v5;
  id v6;
  id v7;
  _TtC5UIKit18_UISoftOutlineView *result;

  v5 = OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_outlineLayer;
  v6 = objc_allocWithZone(MEMORY[0x1E0CD27A8]);
  v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);

  result = (_TtC5UIKit18_UISoftOutlineView *)sub_186507E04();
  __break(1u);
  return result;
}

- (void)didMoveToWindow
{
  char *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for _UISoftOutlineView();
  v2 = (char *)v9.receiver;
  -[UIView didMoveToWindow](&v9, sel_didMoveToWindow);
  v3 = sub_1856969C4();
  v5 = v4;
  v6 = *(void **)&v2[OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_outlineLayer];
  v7 = objc_msgSend(v3, sel_CGColor, v9.receiver, v9.super_class);
  objc_msgSend(v6, sel_setBorderColor_, v7);

  v8 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(v6, sel_setShadowColor_, v8);

}

- (void)layoutSubviews
{
  _TtC5UIKit18_UISoftOutlineView *v2;

  v2 = self;
  sub_185697508();

}

- (void)_updateColors
{
  _TtC5UIKit18_UISoftOutlineView *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v2 = self;
  v3 = sub_1856969C4();
  v5 = v4;
  v6 = *(Class *)((char *)&v2->super.super.super.isa + OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_outlineLayer);
  v7 = objc_msgSend(v3, sel_CGColor);
  objc_msgSend(v6, sel_setBorderColor_, v7);

  v8 = objc_msgSend(v5, sel_CGColor);
  objc_msgSend(v6, sel_setShadowColor_, v8);

}

- (_TtC5UIKit18_UISoftOutlineView)initWithFrame:(CGRect)a3
{
  _TtC5UIKit18_UISoftOutlineView *result;

  result = (_TtC5UIKit18_UISoftOutlineView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  void *v3;

  v3 = *(void **)((char *)&self->super.super._responderFlags + OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_configuration);
  objc_release(*(id *)((char *)&self->super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC5UIKit18_UISoftOutlineView_configuration));

}

@end
