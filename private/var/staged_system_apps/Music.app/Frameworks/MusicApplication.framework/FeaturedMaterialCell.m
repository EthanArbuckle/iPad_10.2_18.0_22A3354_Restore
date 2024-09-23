@implementation FeaturedMaterialCell

- (_TtC16MusicApplication20FeaturedMaterialCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication20FeaturedMaterialCell *)sub_9DC844(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication20FeaturedMaterialCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_9DDD60();
}

- (BOOL)isHighlighted
{
  return sub_9DD774(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC16MusicApplication20FeaturedMaterialCell *v4;

  v4 = self;
  sub_9DD804(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);

}

- (BOOL)isSelected
{
  return sub_9DD774(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC16MusicApplication20FeaturedMaterialCell *v4;

  v4 = self;
  sub_9DD804(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);

}

- (void)layoutSubviews
{
  char *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for FeaturedMaterialCell(0);
  v2 = (char *)v12.receiver;
  -[VerticalLockupCollectionViewCell layoutSubviews](&v12, "layoutSubviews");
  v3 = objc_msgSend(v2, "contentView", v12.receiver, v12.super_class);
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_roundedArtworkView], "setFrame:", v5, v7, v9, v11);
  sub_9DC660();
  sub_9DC220();

}

- (UIButton)accessibilityPlayButton
{
  _TtC16MusicApplication20FeaturedMaterialCell *v2;
  id v3;

  v2 = self;
  v3 = sub_9DC0B0();

  return (UIButton *)v3;
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_presentationBeginObserver));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_presentationEndedObserver));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_roundedArtworkView));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_artworkAspectRatioDidChangeHandler), *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_artworkAspectRatioDidChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_lockupVideoArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialLoadingView));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_playButtonHandler), *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_playButtonHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell____lazy_storage___playButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_renderer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialViewSnapshot));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication20FeaturedMaterialCell_materialHighlightOverlayView));
}

@end
