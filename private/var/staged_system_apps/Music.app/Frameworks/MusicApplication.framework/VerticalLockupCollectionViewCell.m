@implementation VerticalLockupCollectionViewCell

- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication32VerticalLockupCollectionViewCell *)VerticalLockupCollectionViewCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication32VerticalLockupCollectionViewCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication32VerticalLockupCollectionViewCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_7A4940(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  VerticalLockupCollectionViewCell.frame.setter(x, y, width, height);

}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_7A4940(self, (uint64_t)a2, (SEL *)&selRef_bounds);
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
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v7;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = self;
  VerticalLockupCollectionViewCell.bounds.setter(x, y, width, height);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v2;

  v2 = self;
  VerticalLockupCollectionViewCell.layoutSubviews()();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkComponent);
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
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v6;
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  VerticalLockupCollectionViewCell.traitCollectionDidChange(_:)(v8);

}

- (BOOL)isHighlighted
{
  return sub_7A4940(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for VerticalLockupCollectionViewCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[VerticalLockupCollectionViewCell isHighlighted](&v9, "isHighlighted");
  v8.receiver = v6;
  v8.super_class = v5;
  -[VerticalLockupCollectionViewCell setHighlighted:](&v8, "setHighlighted:", v3);
  if (v7 != -[VerticalLockupCollectionViewCell isHighlighted](v6, "isHighlighted"))
    sub_7A3B50();

}

- (BOOL)isSelected
{
  return sub_7A4940(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC16MusicApplication32VerticalLockupCollectionViewCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for VerticalLockupCollectionViewCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[VerticalLockupCollectionViewCell isSelected](&v9, "isSelected");
  v8.receiver = v6;
  v8.super_class = v5;
  -[VerticalLockupCollectionViewCell setSelected:](&v8, "setSelected:", v3);
  if (v7 != -[VerticalLockupCollectionViewCell isSelected](v6, "isSelected"))
  {
    sub_7A3B50();
    sub_7A3938();
  }

}

- (void).cxx_destruct
{
  void *v3;

  sub_56024((uint64_t)self + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkCornerTreatment, &qword_14C0170);
  sub_9AFF4(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder), *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder+ 8], *(void **)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkPlaceholder+ 16]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_lockupImageArtworkCatalog));
  sub_15BC34(*(id *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkAccessoryStyle));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_layoutInvalidationHandler), *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_layoutInvalidationHandler]);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkComponent));
  sub_5C198(*(uint64_t *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_imageDidChangeHandler), *(_QWORD *)&self->artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_imageDidChangeHandler]);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_selectedBackgroundViewConfiguration);

  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_artworkCachingReference));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32VerticalLockupCollectionViewCell____lazy_storage___selectedIndicatorView));
}

@end
