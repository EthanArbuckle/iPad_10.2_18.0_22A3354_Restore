@implementation SongCell

- (_TtC12NowPlayingUI8SongCell)initWithFrame:(CGRect)a3
{
  return (_TtC12NowPlayingUI8SongCell *)sub_148398(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC12NowPlayingUI8SongCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_151298();
}

- (NSString)title
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_title);
}

- (void)setTitle:(id)a3
{
  sub_148D94(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_148A34);
}

- (NSString)artistName
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_artistName);
}

- (void)setArtistName:(id)a3
{
  sub_148D94(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_148BE4);
}

- (NSString)albumTitle
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_albumTitle);
}

- (void)setAlbumTitle:(id)a3
{
  sub_148D94(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t, uint64_t))sub_148DF4);
}

- (double)duration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_duration];
}

- (void)setDuration:(double)a3
{
  _TtC12NowPlayingUI8SongCell *v4;

  v4 = self;
  sub_148FE0(a3);

}

- (BOOL)isProminentItem
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem];
}

- (void)setIsProminentItem:(BOOL)a3
{
  void *v3;
  _TtC12NowPlayingUI8SongCell *v4;

  v3 = (void *)self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isProminentItem] = a3;
  v4 = self;
  sub_14916C(v3);

}

- (BOOL)isExplicit
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isExplicit];
}

- (void)setIsExplicit:(BOOL)a3
{
  _BOOL8 v3;
  _TtC12NowPlayingUI8SongCell *v4;

  v3 = a3;
  v4 = self;
  sub_1494A4((id)v3);

}

- (BOOL)isPopular
{
  double v4;
  void *v5;
  _TtC12NowPlayingUI8SongCell *v6;
  id v7;
  float v8;

  if ((self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity] & 1) != 0)
    return 0;
  v4 = *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity];
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = self;
  v7 = objc_msgSend(v5, "standardUserDefaults");
  v8 = sub_F59A0();

  return v4 >= v8;
}

- (BOOL)wantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
}

- (void)setWantsNowPlayingIndicator:(BOOL)a3
{
  int v3;

  v3 = self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
  self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator] = a3;
  if (v3 != a3)
    -[SongCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isAddButtonSelected
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isAddButtonSelected];
}

- (void)setIsAddButtonSelected:(BOOL)a3
{
  _TtC12NowPlayingUI8SongCell *v4;

  v4 = self;
  sub_149970(a3);

}

- (int64_t)playbackState
{
  return *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
}

- (void)setPlaybackState:(int64_t)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
  *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState] = a3;
  if (v3 != a3)
    -[SongCell setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isHighlighted
{
  return sub_149D20(self, (uint64_t)a2, (SEL *)&selRef_isHighlighted);
}

- (void)setHighlighted:(BOOL)a3
{
  _TtC12NowPlayingUI8SongCell *v4;

  v4 = self;
  sub_149BD0(a3, (SEL *)&selRef_isHighlighted, (SEL *)&selRef_setHighlighted_);

}

- (BOOL)isSelected
{
  return sub_149D20(self, (uint64_t)a2, (SEL *)&selRef_isSelected);
}

- (void)setSelected:(BOOL)a3
{
  _TtC12NowPlayingUI8SongCell *v4;

  v4 = self;
  sub_149BD0(a3, (SEL *)&selRef_isSelected, (SEL *)&selRef_setSelected_);

}

- (void)prepareForReuse
{
  uint64_t v2;
  _TtC12NowPlayingUI8SongCell *v3;
  id v4;

  v2 = *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI34HorizontalLockupCollectionViewCell_artworkComponent];
  v4 = *(id *)(v2 + 80);
  *(_QWORD *)(v2 + 80) = 0;
  v3 = self;
  sub_FFC90(v4);

}

- (BOOL)isEditing
{
  return sub_149D20(self, (uint64_t)a2, (SEL *)&selRef_isEditing);
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_class *v5;
  _TtC12NowPlayingUI8SongCell *v6;
  unsigned int v7;
  objc_super v8;
  objc_super v9;

  v3 = a3;
  v5 = (objc_class *)type metadata accessor for SongCell(0);
  v9.receiver = self;
  v9.super_class = v5;
  v6 = self;
  v7 = -[SongCell isEditing](&v9, "isEditing");
  v8.receiver = v6;
  v8.super_class = v5;
  -[SongCell setEditing:](&v8, "setEditing:", v3);
  if (v7 != -[SongCell isEditing](v6, "isEditing"))
  {
    -[SongCell setClipsToBounds:](v6, "setClipsToBounds:", -[SongCell isEditing](v6, "isEditing"));
    -[SongCell setNeedsLayout](v6, "setNeedsLayout");
  }

}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for SongCell(0);
  v4 = a3;
  v5 = v7.receiver;
  -[HorizontalLockupCollectionViewCell traitCollectionDidChange:](&v7, "traitCollectionDidChange:", v4);
  v6 = objc_msgSend(v5, "traitCollection", v7.receiver, v7.super_class);
  if (objc_msgSend(v6, "horizontalSizeClass"))
    objc_msgSend(v5, "setNeedsLayout");

}

- (void)layoutSubviews
{
  _TtC12NowPlayingUI8SongCell *v2;

  v2 = self;
  sub_149FDC();

}

- (void)preferredContentSizeDidChangeWithNewContentSizeCategory:(id)a3
{
  id v4;
  _TtC12NowPlayingUI8SongCell *v5;

  v4 = a3;
  v5 = self;
  sub_151800();

}

- (NSString)accessibilityTrackNumberString
{
  uint64_t v2;
  NSString v3;

  v2 = *(_QWORD *)(*(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents] + 136);
  swift_bridgeObjectRetain(v2);
  v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v2);
  return (NSString *)v3;
}

- (BOOL)accessibilityIsVideoTrack
{
  unsigned int v2;

  v2 = *(unsigned __int16 *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_layoutStyle];
  return (v2 >> 13 == 2 || !(v2 >> 13)) && (v2 & 1) != 0;
}

- (NSString)accessibilityTitle
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_title);
}

- (NSString)accessibilityArtistName
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_artistName);
}

- (NSString)accessibilityAlbumTitle
{
  return (NSString *)sub_761B8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NowPlayingUI8SongCell_albumTitle);
}

- (double)accessibilityDuration
{
  return *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_duration];
}

- (BOOL)accessibilityIsExplicit
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isExplicit];
}

- (BOOL)accessibilityIsPopular
{
  double v4;
  void *v5;
  _TtC12NowPlayingUI8SongCell *v6;
  id v7;
  float v8;

  if ((self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity] & 1) != 0)
    return 0;
  v4 = *(double *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_popularity];
  v5 = (void *)objc_opt_self(NSUserDefaults);
  v6 = self;
  v7 = objc_msgSend(v5, "standardUserDefaults");
  v8 = sub_F59A0();

  return v4 >= v8;
}

- (BOOL)accessibilityIsAddButtonSelected
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_isAddButtonSelected];
}

- (BOOL)accessibilityWantsNowPlayingIndicator
{
  return self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_wantsNowPlayingIndicator];
}

- (int64_t)accessibilityPlaybackState
{
  return *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_playbackState];
}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_artistName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_albumTitle]);

  sub_145A0(*(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_addButtonHandler], *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_addButtonHandler]);
  swift_release(*(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell____lazy_storage___badgeArtworkComponent]);

  v3 = *(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents];
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents];
  v5 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents + 8];
  v6 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents + 16];
  v7 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents + 24];
  v8 = *(_QWORD *)&self->super.artworkSize[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents];
  swift_release(*(_QWORD *)&self->super.artworkSize[OBJC_IVAR____TtC12NowPlayingUI8SongCell_textComponents + 8]);
  swift_release(v8);
  swift_release(v7);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
  swift_release(v3);
  swift_release(*(_QWORD *)&self->super._anon_0[OBJC_IVAR____TtC12NowPlayingUI8SongCell_darkerSystemColorsNotificationObserver]);

}

@end
