@implementation SearchLandingCell

- (_TtC16MusicApplication17SearchLandingCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication17SearchLandingCell *)sub_8B05F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication17SearchLandingCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_8B1A50();
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  _TtC16MusicApplication17SearchLandingCell *v8;
  id v9;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v7 = v6;
  v9 = a3;
  v8 = self;
  sub_8B0574(v5, v7);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication17SearchLandingCell *v2;

  v2 = self;
  sub_8B0DE8();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication17SearchLandingCell *v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_artworkComponent);
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

- (BOOL)isHighlighted
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  sub_8B1430(self, (uint64_t)a2, a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);
}

- (BOOL)isSelected
{
  return sub_188BF8(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  sub_8B1430(self, (uint64_t)a2, a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);
}

- (id)title
{
  uint64_t v1;
  NSString v2;

  v1 = *(_QWORD *)(a1 + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_title + 8);
  swift_bridgeObjectRetain(v1);
  v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v1);
  return v2;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->title[OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_title]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_lockupImageArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17SearchLandingCell_titleLabel));
}

@end
