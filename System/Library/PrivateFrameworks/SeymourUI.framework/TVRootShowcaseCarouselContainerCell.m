@implementation TVRootShowcaseCarouselContainerCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;

  __swift_instantiateConcreteTypeFromMangledName(&qword_255B84960);
  v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_22BA90150;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_carouselView);
  *(_QWORD *)(v3 + 32) = v4;
  sub_22BA808D4();
  v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_255B83DD0);
  v6 = (void *)sub_22BA808A4();
  swift_bridgeObjectRelease();
  return (NSArray *)v6;
}

- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *)sub_22B3082E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B30AEF4();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVRootShowcaseCarouselContainerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVRootShowcaseCarouselContainerCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)layoutSubviews
{
  _TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *v2;

  v2 = self;
  sub_22B30917C();

}

- (void)didMoveToWindow
{
  char *v2;
  char *v3;
  char *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootShowcaseCarouselContainerCell();
  v2 = (char *)v5.receiver;
  -[TVRootShowcaseCarouselContainerCell didMoveToWindow](&v5, sel_didMoveToWindow);
  v3 = (char *)objc_msgSend(v2, sel_window, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;

    v2 = v4;
  }
  else
  {
    *(_QWORD *)&v2[OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_impressionElements] = MEMORY[0x24BEE4AF8];
    swift_bridgeObjectRelease();
    v2[OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_isUpdatingImpression] = 0;
  }

}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_itemInfo, &qword_255B861D0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_carouselView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_pageControl));
  swift_bridgeObjectRelease();
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onElementAppearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onElementDisappearance));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onImpressionableBoundsChange));
  sub_22B0FAA68(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onVisibleBoundsChange));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_leftArrowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_rightArrowButton));
}

- (int64_t)numberOfItemsInCarouselView:(id)a3
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_items))[2];
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4
{
  id v6;
  _TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *v7;
  id v8;

  v6 = a3;
  v7 = self;
  v8 = sub_22B30B548(a4);

  return v8;
}

- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3
{
  if (*((_BYTE *)&self->super.super.super.super._responderFlags
       + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_preferredCenterIndex) == 1)
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_pageControl), sel_currentPage, a3);
  else
    return *(int64_t *)((char *)&self->super.super.super.super.super.isa
                             + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_preferredCenterIndex);
}

- (void)carouselView:(id)a3 didCenterItemAtIndex:(int64_t)a4
{
  id v6;
  _TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *v7;

  v6 = a3;
  v7 = self;
  sub_22B30BA60(a4);

}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8;
  id v9;
  _TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *v10;

  v8 = a3;
  v9 = a4;
  v10 = self;
  sub_22B30BC04(a5);

}

@end
