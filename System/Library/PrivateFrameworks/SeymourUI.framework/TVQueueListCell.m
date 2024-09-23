@implementation TVQueueListCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  void *v2;

  sub_22B3BA8E0();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v2 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (_TtC9SeymourUI15TVQueueListCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI15TVQueueListCell *)sub_22B3BAAB0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI15TVQueueListCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B3BC81C();
}

- (void)handleGrab
{
  _TtC9SeymourUI15TVQueueListCell *v2;

  v2 = self;
  sub_22B3BB974();

}

- (void)handleDelete
{
  _TtC9SeymourUI15TVQueueListCell *v2;

  v2 = self;
  sub_22B3BBAB8();

}

- (void)prepareForReuse
{
  _TtC9SeymourUI15TVQueueListCell *v2;

  v2 = self;
  sub_22B3BBBE4();

}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  sub_22B168AF8((uint64_t)self + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super._constraintsExceptingSubviewAutoresizingConstraints
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_layout));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_horizontalStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_lockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_deleteButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_grabButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI15TVQueueListCell_focusGuide));
}

@end
