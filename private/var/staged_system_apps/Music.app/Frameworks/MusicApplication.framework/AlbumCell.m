@implementation AlbumCell

- (_TtC16MusicApplication9AlbumCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication9AlbumCell *)AlbumCell.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication9AlbumCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  _s16MusicApplication9AlbumCellC5coderACSgSo7NSCoderC_tcfc_0();
}

- (NSString)title
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication9AlbumCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))AlbumCell.title.setter);
}

- (NSString)artistName
{
  return (NSString *)sub_319EE0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication9AlbumCell_artistName);
}

- (void)setArtistName:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))AlbumCell.artistName.setter);
}

+ (UIEdgeInsets)visualContentInsets
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned __int128 v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  _BYTE v14[24];
  UIEdgeInsets result;

  v2 = _s16MusicApplication9AlbumCellC20detailTextComponents33_697C9E9A5E5CEA31E6831E8C6D513A7BLLAC06DetailfG0AELLVvpfi_0();
  v4 = v3;
  v6 = v5;
  if (qword_14AB200 != -1)
    swift_once(&qword_14AB200, sub_427C38);
  v7 = xmmword_14C8EA0;
  swift_beginAccess(v4 + 32, v14, 0, 0);
  v8 = *(double *)(v4 + 104);
  v9 = qword_14C8EB8;
  swift_bridgeObjectRelease(v6);
  swift_release(v4);
  swift_release(v2);
  *(_QWORD *)&v11 = v7 >> 64;
  *(_QWORD *)&v10 = v7;
  v12 = v8;
  v13 = *(double *)&v9;
  result.right = v13;
  result.bottom = v12;
  result.left = v11;
  result.top = v10;
  return result;
}

- (void)layoutSubviews
{
  id v2;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = v3.receiver;
  -[VerticalLockupCollectionViewCell layoutSubviews](&v3, "layoutSubviews");
  sub_426E14();

}

- (NSString)accessibilityRankString
{
  _TtC16MusicApplication9AlbumCell *v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  _BYTE v7[24];

  v2 = self;
  v3 = sub_42724C();
  swift_beginAccess(v3 + 112, v7, 0, 0);
  v4 = *(_QWORD *)(v3 + 120);
  swift_bridgeObjectRetain();

  swift_release(v3);
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9AlbumCell_badgeView);
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication9AlbumCell *v6;
  _TtC16MusicApplication9AlbumCell *v7;
  UITraitCollection_optional v8;

  v5 = a3;
  v6 = self;
  v8.is_nil = (char)v6;
  v7 = v6;
  v8.value.super.isa = (Class)a3;
  AlbumCell.traitCollectionDidChange(_:)(v8);

}

- (void).cxx_destruct
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication9AlbumCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication9AlbumCell_artistName]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication9AlbumCell_badgeView));
  v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9AlbumCell_detailTextComponents);
  v4 = *(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication9AlbumCell_detailTextComponents];
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication9AlbumCell_detailTextComponents
                                                                    + 8]);
  swift_release(v4);
  swift_release(v3);
  v5 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication9AlbumCell_twoLineTitleTextComponents);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication9AlbumCell_twoLineTitleTextComponents]);
  swift_release(v5);
  swift_release(*(Class *)((char *)&self->super.super.super.super.super.super.isa
                         + OBJC_IVAR____TtC16MusicApplication9AlbumCell____lazy_storage___rankedTextComponent));
}

@end
