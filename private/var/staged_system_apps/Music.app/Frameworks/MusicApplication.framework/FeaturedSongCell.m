@implementation FeaturedSongCell

- (_TtC16MusicApplication16FeaturedSongCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication16FeaturedSongCell *)sub_46BE14(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication16FeaturedSongCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_46D740();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_headline);
}

- (void)setHeadline:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication16FeaturedSongCell *v9;
  uint64_t v10;
  Swift::String v11;
  id v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_headline);
  v7 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_headline];
  *v6 = v5;
  v6[1] = v8;
  v12 = a3;
  v9 = self;
  swift_bridgeObjectRelease(v7);
  v10 = v6[1];
  swift_bridgeObjectRetain();
  v11 = String.trim()();
  swift_bridgeObjectRelease(v10);
  TextStackView.Component.textValue.setter(v11._countAndFlagsBits, (uint64_t)v11._object);

}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_title);
}

- (void)setTitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication16FeaturedSongCell *v9;
  uint64_t v10;
  Swift::String v11;
  id v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_title);
  v7 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_title];
  *v6 = v5;
  v6[1] = v8;
  v12 = a3;
  v9 = self;
  swift_bridgeObjectRelease(v7);
  v10 = v6[1];
  swift_bridgeObjectRetain();
  v11 = String.trim()();
  swift_bridgeObjectRelease(v10);
  TextStackView.Component.textValue.setter(v11._countAndFlagsBits, (uint64_t)v11._object);

}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC16MusicApplication16FeaturedSongCell *v9;
  uint64_t v10;
  Swift::String v11;
  id v12;

  v5 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = (uint64_t *)((char *)self + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_subtitle);
  v7 = *(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_subtitle];
  *v6 = v5;
  v6[1] = v8;
  v12 = a3;
  v9 = self;
  swift_bridgeObjectRelease(v7);
  v10 = v6[1];
  swift_bridgeObjectRetain();
  v11 = String.trim()();
  swift_bridgeObjectRelease(v10);
  TextStackView.Component.textValue.setter(v11._countAndFlagsBits, (uint64_t)v11._object);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication16FeaturedSongCell *v2;

  v2 = self;
  sub_46C96C();

}

- (void)clearArtworkCatalogs
{
  _QWORD *v2;
  void *v3;
  _TtC16MusicApplication16FeaturedSongCell *v4;
  uint64_t v5;

  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_artworkComponent);
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
  _TtC16MusicApplication16FeaturedSongCell *v6;

  v5 = a3;
  v6 = self;
  sub_46CC50(a3);

}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->headline[OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_featuredArtworkCatalog));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_artworkCachingReference));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_textDrawingCache));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_textStackView));
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_artworkComponent));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_addButton));
  v3 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_textComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication16FeaturedSongCell_textComponents);
  v5 = v3[1];
  v6 = v3[2];
  swift_bridgeObjectRelease(v3[3]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

@end
