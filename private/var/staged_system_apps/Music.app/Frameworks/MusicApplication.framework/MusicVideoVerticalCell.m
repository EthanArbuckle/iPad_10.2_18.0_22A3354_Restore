@implementation MusicVideoVerticalCell

- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication22MusicVideoVerticalCell *)sub_695E20(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication22MusicVideoVerticalCell)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_6976EC();
}

- (NSString)headline
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_headline);
}

- (void)setHeadline:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_696434);
}

- (NSString)title
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_title);
}

- (void)setTitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_696508);
}

- (NSString)subtitle
{
  return (NSString *)sub_CA6A8((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_subtitle);
}

- (void)setSubtitle:(id)a3
{
  sub_185C50(self, (uint64_t)a2, a3, (void (*)(uint64_t, uint64_t))sub_6965E0);
}

- (CGRect)frame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_6966CC(self, (uint64_t)a2, (SEL *)&selRef_frame);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  sub_696720(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_frame, (SEL *)&selRef_setFrame_);
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  sub_6966CC(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  sub_696720(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_);
}

- (void)layoutSubviews
{
  _TtC16MusicApplication22MusicVideoVerticalCell *v2;

  v2 = self;
  sub_69693C();

}

- (void)traitCollectionDidChange:(id)a3
{
  id v5;
  _TtC16MusicApplication22MusicVideoVerticalCell *v6;

  v5 = a3;
  v6 = self;
  sub_696C18((uint64_t)a3);

}

- (BOOL)accessibilityIsExplicit
{
  uint64_t v2;
  char v3;

  v2 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_badgeView);
  if (v2)
    v3 = sub_A32CDC(0, *(_QWORD *)(v2 + OBJC_IVAR____TtC16MusicApplication9BadgeView_badgeSet));
  else
    v3 = 0;
  return v3 & 1;
}

- (void).cxx_destruct
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_headline]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_title]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.super.artworkEdgeInsets[OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_subtitle]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_badgeView));
  v3 = (Class *)((char *)&self->super.super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_textComponents);
  v4 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC16MusicApplication22MusicVideoVerticalCell_textComponents);
  v5 = v3[1];
  v6 = v3[2];
  swift_bridgeObjectRelease(v3[3]);
  swift_release(v6);
  swift_release(v5);
  swift_release(v4);
}

+ (void)visualContentInsets
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  v0 = sub_697040();
  v2 = v1;
  v4 = v3;
  v6 = v5;
  if (qword_14AB6D0 != -1)
    swift_once(&qword_14AB6D0, sub_696D90);
  if (!((unint64_t)v6 >> 62))
  {
    v7 = *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_5;
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  if (v6 < 0)
    v10 = v6;
  else
    v10 = v6 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v7 = _CocoaArrayWrapper.endIndex.getter(v10);
  if (!v7)
    goto LABEL_15;
LABEL_5:
  v8 = v7 - 1;
  if (__OFSUB__(v7, 1))
  {
    __break(1u);
    goto LABEL_18;
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
LABEL_18:
    v9 = specialized _ArrayBuffer._getElementSlowPath(_:)(v8, v6);
    goto LABEL_10;
  }
  if ((v8 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (v8 < *(_QWORD *)((char *)&dword_10 + (v6 & 0xFFFFFFFFFFFFF8)))
  {
    v9 = *(_QWORD *)(v6 + 8 * v8 + 32);
    swift_retain(v9);
LABEL_10:
    swift_bridgeObjectRelease();
    swift_beginAccess(v9 + 32, v11, 0, 0);
    swift_release(v9);
LABEL_16:
    swift_bridgeObjectRelease();
    swift_release(v4);
    swift_release(v2);
    swift_release(v0);
    return;
  }
  __break(1u);
}

@end
