@implementation RadioShowCell

- (_TtC16MusicApplication13RadioShowCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication13RadioShowCell *)RadioShowCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication13RadioShowCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication13RadioShowCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)title
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_title);
}

- (void)setTitle:(id)a3
{
  sub_319C5C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_title);
}

- (NSString)subtitle
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_319FB4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_subtitle);
}

- (NSString)overlayTitle
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTitle);
}

- (void)setOverlayTitle:(id)a3
{
  sub_319C5C((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTitle);
}

- (NSString)overlaySubtitle
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlaySubtitle);
}

- (void)setOverlaySubtitle:(id)a3
{
  sub_319FB4((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlaySubtitle);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication13RadioShowCell *v2;

  v2 = self;
  RadioShowCell.layoutSubviews()();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication13RadioShowCell *v6;
  _TtC16MusicApplication13RadioShowCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  RadioShowCell.traitCollectionDidChange(_:)(v8);

}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _BYTE v12[24];
  UIEdgeInsets result;

  v2 = _s16MusicApplication13RadioShowCellC14textComponents33_2439E203BF4E5EEB2159C351D10618FFLLAC04TextG0AELLVvpfi_0();
  v4 = v3;
  v6 = v5;
  swift_beginAccess(v3 + 32, v12, 0, 0);
  v7 = *(double *)(v4 + 104);
  swift_bridgeObjectRelease(v6);
  swift_release(v4);
  swift_release(v2);
  v8 = v7 + -2.0;
  v9 = 0.0;
  v10 = 0.0;
  v11 = 0.0;
  result.right = v11;
  result.bottom = v8;
  result.left = v10;
  result.top = v9;
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_subtitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTitle]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlaySubtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_backdropView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_textComponents);
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_textComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_textComponents
                                                                    + 8]);
  swift_release(v4);
  swift_release(v3);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTextComponents);
  v6 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTextComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTextComponents
                                                                    + 8]);
  swift_release(v6);
  swift_release(v5);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication13RadioShowCell_overlayTextStackView));
}

@end
