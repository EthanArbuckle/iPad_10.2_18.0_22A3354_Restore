@implementation BKLibraryBookshelfInfoBadge

- (NSString)badgeText
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
}

- (void)setBadgeText:(id)a3
{
  sub_1004DF694((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
}

- (NSString)fallbackBadgeText
{
  return (NSString *)sub_1001FE0E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
}

- (void)setFallbackBadgeText:(id)a3
{
  sub_1004DF694((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
}

- (BKLibraryBookshelfInfoBadge)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  _QWORD *v9;
  objc_class *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
  *v8 = 0;
  v8[1] = 0;
  v9 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
  v10 = (objc_class *)type metadata accessor for LibraryBookshelfInfoBadge();
  *v9 = 0;
  v9[1] = 0;
  v12.receiver = self;
  v12.super_class = v10;
  return -[BKLibraryBookshelfInfoBadge initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
}

- (BKLibraryBookshelfInfoBadge)initWithCoder:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  id v6;
  BKLibraryBookshelfInfoBadge *result;

  v4 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText);
  *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText);
  *v5 = 0;
  v5[1] = 0;
  v6 = a3;

  result = (BKLibraryBookshelfInfoBadge *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001007B93A0, "Books/LibraryBookshelfInfoBadge.swift", 37, 2, 33, 0);
  __break(1u);
  return result;
}

- (NSAttributedString)attributedBadgeText
{
  BKLibraryBookshelfInfoBadge *v2;
  id v3;

  v2 = self;
  v3 = sub_1004DF85C();

  return (NSAttributedString *)v3;
}

- (void)setAttributedBadgeText:(id)a3
{
  BKLibraryBookshelfInfoBadge *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1004DFDCC(a3);

}

- (void)layoutSubviews
{
  BKLibraryBookshelfInfoBadge *v2;

  v2 = self;
  sub_1004DFAC0();

}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->badgeText[OBJC_IVAR___BKLibraryBookshelfInfoBadge_badgeText]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->badgeText[OBJC_IVAR___BKLibraryBookshelfInfoBadge_fallbackBadgeText]);
}

@end
