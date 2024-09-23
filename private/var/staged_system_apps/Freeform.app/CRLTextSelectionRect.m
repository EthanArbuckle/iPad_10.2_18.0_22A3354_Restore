@implementation CRLTextSelectionRect

- (BOOL)containsStart
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsStart);
}

- (void)setContainsStart:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsStart) = a3;
}

- (BOOL)containsEnd
{
  return *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsEnd);
}

- (void)setContainsEnd:(BOOL)a3
{
  *((_BYTE *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__containsEnd) = a3;
}

- (int64_t)writingDirection
{
  _TtC8Freeform20CRLTextSelectionRect *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_100610140();

  return v3;
}

- (void)setWritingDirection:(int64_t)a3
{
  _TtC8Freeform20CRLTextSelectionRect *v4;

  v4 = self;
  sub_100610254(a3);

}

- (CGRect)rect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *(double *)((char *)&self->super.super.isa + OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect);
  v3 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect];
  v4 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect + 8];
  v5 = *(double *)&self->_rect[OBJC_IVAR____TtC8Freeform20CRLTextSelectionRect__rect + 16];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  return sub_100610434(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_100610348);
}

- (NSString)debugDescription
{
  return (NSString *)sub_100571634(self, (uint64_t)a2, (void (*)(void))sub_100610534);
}

- (_TtC8Freeform20CRLTextSelectionRect)init
{
  _TtC8Freeform20CRLTextSelectionRect *result;

  result = (_TtC8Freeform20CRLTextSelectionRect *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLTextSelectionRect", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

@end
