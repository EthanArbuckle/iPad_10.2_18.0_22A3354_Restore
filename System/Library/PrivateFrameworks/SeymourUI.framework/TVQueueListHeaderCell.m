@implementation TVQueueListHeaderCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90850;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButton);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButton);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  sub_22BA808D4();
  v6 = v4;
  v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v8 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v8;
}

- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21TVQueueListHeaderCell *)sub_22B941440();
}

- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B942C5C();
}

- (void)handleMainActionButtonTapped
{
  _TtC9SeymourUI21TVQueueListHeaderCell *v2;

  v2 = self;
  sub_22B93FC50();

}

- (void).cxx_destruct
{
  void *v3;
  void *v4;

  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_itemInfo, &qword_255B861D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_buttonFocusGuide));
  v3 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout);
  v4 = *(UIViewAnimationInfo **)((char *)&self->super.super.super._animationInfo
                               + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super._swiftAnimationInfo
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_overviewLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_durationLabel));
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButtonAction, (uint64_t *)&unk_255B8A3B0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButtonTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButtonContentView));
}

@end
