@implementation PXScrollBehavior

+ (id)normalBehaviorWithAxis:(int64_t)a3
{
  swift_getObjCClassMetadata();
  return (id)static PXScrollBehavior.normal(axis:)(a3);
}

+ (id)normalBehaviorWithAxis:(int64_t)a3 intrinsicContentOffset:(double)a4
{
  swift_getObjCClassMetadata();
  return (id)static PXScrollBehavior.normal(axis:intrinsicContentOffset:)(a3, a4);
}

+ (id)pagingBehaviorWithAxis:(int64_t)a3 pagingOrigin:(double)a4 pageOffset:(double)a5 decelerationRate:(int64_t)a6
{
  swift_getObjCClassMetadata();
  return (id)static PXScrollBehavior.paging(axis:pagingOrigin:pageOffset:decelerationRate:)(a3, a6, a4, a5);
}

+ (id)detentsBehaviorWithAxis:(int64_t)a3 detents:(id)a4 intrinsicContentOffset:(double)a5
{
  unint64_t v7;
  void *v8;

  type metadata accessor for PXScrollDetent((uint64_t)a1);
  v7 = sub_1A7AE3A10();
  swift_getObjCClassMetadata();
  v8 = (void *)static PXScrollBehavior.detents(axis:detents:intrinsicContentOffset:)(a3, v7, a5);
  swift_bridgeObjectRelease();
  return v8;
}

- (int64_t)axis
{
  if ((~*(_DWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 32) & 0xFELL) != 0)
    return *(_QWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior);
  __break(1u);
  return self;
}

- (int64_t)decelerationRate
{
  if ((~*(_DWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 32) & 0xFELL) != 0)
    return *(_QWORD *)(self + OBJC_IVAR___PXScrollBehavior_behavior + 8);
  __break(1u);
  return self;
}

- (BOOL)pagingEnabled
{
  unsigned int v2;

  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    v2 = *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24];
    if (v2 <= 0x3F)
      sub_1A6A4352C(*(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 8], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 16], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    LOBYTE(self) = v2 < 0x40;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (double)pagingOrigin
{
  char *v2;
  uint64_t v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___PXScrollBehavior_behavior;
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    v3 = 0;
    if (*(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] <= 0x3Fu)
    {
      v3 = *((_QWORD *)v2 + 2);
      sub_1A6A4352C(v3, *((_QWORD *)v2 + 3), *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    }
    return *(double *)&v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (double)pageOffset
{
  char *v2;
  uint64_t v3;
  double result;

  v2 = (char *)self + OBJC_IVAR___PXScrollBehavior_behavior;
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    v3 = 0;
    if (*(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] <= 0x3Fu)
    {
      v3 = *((_QWORD *)v2 + 3);
      sub_1A6A4352C(*((_QWORD *)v2 + 2), v3, *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
    }
    return *(double *)&v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)allowFlickAcrossMultiplePages
{
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24];
  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
  {
    if (*(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] > 0x3Fu)
    {
      v3 = 0;
    }
    else
    {
      v3 = v2 & 1;
      sub_1A6A4352C(*(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 8], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 16], v2);
    }
    LOBYTE(self) = v3;
  }
  else
  {
    __break(1u);
  }
  return (char)self;
}

- (double)intrinsicContentOffset
{
  double result;

  if ((~*(_DWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24] & 0xFELL) != 0)
    return *(double *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 32];
  __break(1u);
  return result;
}

- (id)detentAtContentOffset:(double)a3
{
  PXScrollBehavior *v3;
  void *v4;
  void *v5;

  v3 = self;
  PXScrollBehavior.detent(atContentOffset:)();
  v5 = v4;

  return v5;
}

- (CGPoint)adjustedScrollTargetContentOffsetForProposedTargetContentOffset:(CGPoint)a3 velocity:(CGPoint)a4 currentContentOffset:(CGPoint)a5 decelerationRate:(int64_t *)a6
{
  double y;
  double x;
  PXScrollBehavior *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v9 = self;
  PXScrollBehavior.adjustedScrollTargetContentOffset(forProposedTargetContentOffset:velocity:currentContentOffset:decelerationRate:)(a6, x, y);
  v11 = v10;
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.y = v15;
  result.x = v14;
  return result;
}

- (PXScrollBehavior)init
{
  _OWORD *v2;
  objc_super v4;

  v2 = (_OWORD *)((char *)self + OBJC_IVAR___PXScrollBehavior_behavior);
  *v2 = 0u;
  v2[1] = 0u;
  v2[2] = xmmword_1A7BB2500;
  v4.receiver = self;
  v4.super_class = (Class)PXScrollBehavior;
  return -[PXScrollBehavior init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1A6A42FA8(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___PXScrollBehavior_behavior), *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 8], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 16], *(_QWORD *)&self->behavior[OBJC_IVAR___PXScrollBehavior_behavior + 24]);
}

@end
