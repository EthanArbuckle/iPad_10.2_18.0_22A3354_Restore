@implementation SongCell

- (_TtC16MusicApplication8SongCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication8SongCell *)sub_327820(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication8SongCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_331114();
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication8SongCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_327D40);
}

- (NSString)artistName
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication8SongCell_artistName);
}

- (void)setArtistName:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_327E18);
}

- (NSString)albumTitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication8SongCell_albumTitle);
}

- (void)setAlbumTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_327EF0);
}

- (double)duration
{
  return *(double *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_duration];
}

- (void)setDuration:(double)a3
{
  _TtC16MusicApplication8SongCell *v4;

  v4 = self;
  sub_328004(a3);

}

- (BOOL)isProminentItem
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_isProminentItem];
}

- (void)setIsProminentItem:(BOOL)a3
{
  _TtC16MusicApplication8SongCell *v4;

  v4 = self;
  sub_32815C(a3);

}

- (BOOL)isFavorite
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isFavorite];
}

- (void)setIsFavorite:(BOOL)a3
{
  _TtC16MusicApplication8SongCell *v4;

  v4 = self;
  sub_3282A4(a3);

}

- (BOOL)isPopular
{
  double v4;
  void *v5;
  _TtC16MusicApplication8SongCell *v6;
  id v7;
  float v8;

  if ((self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_popularity] & 1) != 0)
    return 0;
  v4 = *(double *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_popularity];
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = self;
  v7 = objc_msgSend(v5, "standardUserDefaults");
  v8 = sub_263760();

  return v4 >= v8;
}

- (BOOL)isHighlighted
{
  return sub_32886C(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC16MusicApplication8SongCell *v4;

  v4 = self;
  sub_3288FC(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);

}

- (BOOL)isSelected
{
  return sub_32886C(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC16MusicApplication8SongCell *v4;

  v4 = self;
  sub_3288FC(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);

}

- (BOOL)isDisabled
{
  return self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled];
}

- (void)setIsDisabled:(BOOL)a3
{
  _TtC16MusicApplication8SongCell *v3;

  self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication34HorizontalLockupCollectionViewCell_isDisabled] = a3;
  v3 = self;
  sub_4C5898();
  sub_328A84();

}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4;
  _TtC16MusicApplication8SongCell *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  v4 = a3;
  v5 = self;
  objc_msgSend(v4, "size");
  v7 = v6;
  v9 = v8;
  -[SongCell music_inheritedLayoutInsets](v5, "music_inheritedLayoutInsets");
  v14 = CGSize.inset(by:)(v10, v11, v12, v13, v7, v9);
  v15 = -[SongCell traitCollection](v5, "traitCollection");
  sub_330E78(v15, 0, v14);

  objc_msgSend(v4, "size");
  objc_msgSend(v4, "setSize:");

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication8SongCell *v6;

  v5 = a3;
  v6 = self;
  sub_329634(a3);

}

- (void)layoutSubviews
{
  _TtC16MusicApplication8SongCell *v2;

  v2 = self;
  sub_329840();

}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  char *v9;
  id v10;
  _TtC16MusicApplication8SongCell *v11;
  uint64_t v12;

  v5 = type metadata accessor for UICellConfigurationState(0);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = __chkstk_darwin(v5);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  v10 = a3;
  v11 = self;
  sub_32EDC4();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (NSString)accessibilityTrackNumberString
{
  uint64_t v2;
  uint64_t v3;
  NSString v4;
  _BYTE v6[24];

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents];
  swift_beginAccess(v2 + 112, v6, 0, 0);
  v3 = *(_QWORD *)(v2 + 120);
  swift_bridgeObjectRetain(v3);
  v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v3);
  return (NSString *)v4;
}

- (BOOL)accessibilityIsVideoTrack
{
  unsigned int v2;

  v2 = *(unsigned __int16 *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_layoutStyle];
  return (v2 >> 13 == 3 || v2 >> 13 == 1) && (v2 & 1) != 0;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeView];
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_artistName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_albumTitle]);

  sub_9AFF4(*(void **)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder + 8], *(void **)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_badgeArtworkPlaceholder + 16]);
  swift_release(*(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell____lazy_storage___badgeArtworkComponent]);

  v3 = *(_QWORD *)&self->super.UICollectionViewTableCell_opaque[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents];
  v5 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents + 8];
  v6 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents + 16];
  swift_release(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication8SongCell_textComponents
                                                        + 24]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);

}

@end
