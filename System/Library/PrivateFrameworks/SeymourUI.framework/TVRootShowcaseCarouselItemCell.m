@implementation TVRootShowcaseCarouselItemCell

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_layout
                 + 8);
  v3 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_layout);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return (*(_QWORD **)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonActions))[2] == 0;
}

- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell *)sub_22B6110E8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_22B6146C8();
}

- (void)prepareForReuse
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  objc_class *v6;
  _TtC9SeymourUI30TVRootShowcaseCarouselItemCell *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  objc_super v11;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_255B861D0);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVRootShowcaseCarouselItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  -[TVFocusableCollectionViewCell prepareForReuse](&v11, sel_prepareForReuse);
  v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_itemInfo;
  swift_beginAccess();
  sub_22B16882C((uint64_t)v5, v9);
  swift_endAccess();

}

- (void)didMoveToWindow
{
  _TtC9SeymourUI30TVRootShowcaseCarouselItemCell *v2;

  v2 = self;
  sub_22B612484();

}

- (void)handleTappedButton:(id)a3
{
  id v4;
  _TtC9SeymourUI30TVRootShowcaseCarouselItemCell *v5;

  v4 = a3;
  v5 = self;
  sub_22B613758((uint64_t)v4);

}

- (void)restartVideo
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _TtC9SeymourUI30TVRootShowcaseCarouselItemCell *v8;
  void *v9;
  _TtC9SeymourUI30TVRootShowcaseCarouselItemCell *v10;
  _QWORD v11[3];

  v3 = OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer);
  if (v4)
  {
    v5 = MEMORY[0x24BDC0D88];
    v6 = *MEMORY[0x24BDC0D88];
    v7 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    v8 = self;
    v11[0] = v6;
    v11[1] = *(_QWORD *)(v5 + 8);
    v11[2] = v7;
    objc_msgSend(v4, sel_seekToTime_, v11);
    v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  else
  {
    v10 = self;
    v9 = 0;
  }
  objc_msgSend(v9, sel_play);

}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_captionLabel));
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_subtitleLabel));
}

- (void).cxx_destruct
{
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_delegate);
  sub_22B0FB1DC((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_itemInfo, &qword_255B861D0);
  sub_22B119BC0((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_carouselItemDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_focusContainerGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonWidthConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
