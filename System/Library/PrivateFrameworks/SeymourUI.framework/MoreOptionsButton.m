@implementation MoreOptionsButton

- (_TtC9SeymourUI17MoreOptionsButton)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI17MoreOptionsButton *)sub_22B6D0EA8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  char *v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MoreOptionsButton();
  v2 = (char *)v3.receiver;
  -[MoreOptionsButton layoutSubviews](&v3, sel_layoutSubviews);
  if (*(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_visualEffectView])
    objc_msgSend(v2, sel_sendSubviewToBack_, v3.receiver, v3.super_class);

}

- (_TtC9SeymourUI17MoreOptionsButton)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6D2428();
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8;
  id v9;
  char *v10;
  void (*v11)(uint64_t);
  uint64_t v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for MoreOptionsButton();
  v8 = a3;
  v9 = a4;
  v10 = (char *)v13.receiver;
  swift_unknownObjectRetain();
  -[MoreOptionsButton contextMenuInteraction:willEndForConfiguration:animator:](&v13, sel_contextMenuInteraction_willEndForConfiguration_animator_, v8, v9, a5);
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_onMenuDismissed];
  if (v11)
  {
    v12 = swift_retain();
    v11(v12);
    sub_22B0FAA68((uint64_t)v11);
  }
  swift_unknownObjectRelease();

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_onMenuDismissed));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v4 = *(NSMutableArray **)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                          + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v5 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v6 = *(UIViewAnimationInfo **)((char *)&self->super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  v7 = *(UIWindow **)((char *)&self->super.super.super._window + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance);
  objc_release(*(id *)((char *)&self->super.super.super._gestureRecognizers
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_appearance));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_normalTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_scrollEdgeTintColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI17MoreOptionsButton_visualEffectView));
}

@end
