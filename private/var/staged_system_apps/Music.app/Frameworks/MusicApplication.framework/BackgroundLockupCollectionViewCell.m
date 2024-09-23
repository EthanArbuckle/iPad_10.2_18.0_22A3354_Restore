@implementation BackgroundLockupCollectionViewCell

- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication34BackgroundLockupCollectionViewCell *)BackgroundLockupCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication34BackgroundLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication34BackgroundLockupCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_782048(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  BackgroundLockupCollectionViewCell.frame.setter(x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_782048(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  BackgroundLockupCollectionViewCell.bounds.setter(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v2;

  v2 = self;
  BackgroundLockupCollectionViewCell.layoutSubviews()();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkComponent);
  v3 = (void *)v2[18];
  v4 = self;
  objc_msgSend(v3, "clearArtworkCatalogs");
  *(_QWORD *)((char *)v2
            + OBJC_IVAR____TtCE16MusicApplicationV11MusicCoreUI7Artwork9Component_representationsUpdatedFromConfigurationBlock) = 0;
  v5 = v2[30];
  v2[29] = 0;
  v2[30] = 0;

  swift_bridgeObjectRelease(v5);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v6;
  _TtC16MusicApplication34BackgroundLockupCollectionViewCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  BackgroundLockupCollectionViewCell.traitCollectionDidChange(_:)(v8);

}

- (BOOL)isHighlighted
{
  return sub_782048(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_7826A0(self, (uint64_t)a2, a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_782048(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_7826A0(self, (uint64_t)a2, a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (void).cxx_destruct
{
  sub_18A2AC((uint64_t)self + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkCornerTreatment);
  sub_9AFF4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder), *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkPlaceholder+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_lockupImageArtworkCatalog));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkComponent));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication34BackgroundLockupCollectionViewCell_textDrawingCache));
}

@end
