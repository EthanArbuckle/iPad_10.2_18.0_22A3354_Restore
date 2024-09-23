@implementation TVQueueListLockupView

- (_TtC9SeymourUI21TVQueueListLockupView)init
{
  return -[TVQueueListLockupView initWithFrame:](self, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
}

- (_TtC9SeymourUI21TVQueueListLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21TVQueueListLockupView *)sub_22B756C6C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21TVQueueListLockupView)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B7599C4();
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return (*((_BYTE *)&self->super.super.super.super.super.super.super.isa
          + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabbed) & 1) == 0;
}

- (void)prepareForReuse
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TVQueueListLockupView();
  v2 = v3.receiver;
  -[TVFocusableCollectionViewCell prepareForReuse](&v3, sel_prepareForReuse);
  sub_22B757C00();
  sub_22B7580E8();
  objc_msgSend(v2, sel_setNeedsFocusUpdate, v3.receiver, v3.super_class);

}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _TtC9SeymourUI21TVQueueListLockupView *v8;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_22B757D9C((uint64_t)v6, v7);

}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  unint64_t v6;
  id v7;
  _TtC9SeymourUI21TVQueueListLockupView *v8;

  sub_22B0F1718(0, &qword_255B8A790);
  sub_22B483CF8();
  v6 = sub_22BA80AF0();
  v7 = a4;
  v8 = self;
  sub_22B757F34(v6, (uint64_t)a4);

  swift_bridgeObjectRelease();
}

- (void)handleTap:(id)a3
{
  id v4;
  _TtC9SeymourUI21TVQueueListLockupView *v5;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, sel_state) == (id)3
    && MEMORY[0x22E2F3FFC]((char *)v5 + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_delegate))
  {
    sub_22B3BC068();

    swift_unknownObjectRelease();
  }
  else
  {

  }
}

- (void)handlePan:(id)a3
{
  id v4;
  _TtC9SeymourUI21TVQueueListLockupView *v5;

  v4 = a3;
  v5 = self;
  sub_22B75824C(v4);

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_delegate);
  v3 = *(id *)((char *)&self->super.super.super.super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  v4 = *(_UITraitChangeRegistry **)((char *)&self->super.super.super.super.super._traitChangeRegistry
                                  + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  v5 = *(CALayer **)((char *)&self->super.super.super.super.super._layerRetained
                   + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  v6 = *(NSArray **)((char *)&self->super.super.super.super.super._subviewCache
                   + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super.super._window
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_layout));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListLockupView_grabImageView));
}

@end
