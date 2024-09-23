@implementation CRLStyledItem

- (BOOL)shouldForceStrokesToPencilKit
{
  return 0;
}

- (CRLStroke)stroke
{
  _TtC8Freeform13CRLStyledItem *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100A14240();

  return (CRLStroke *)v3;
}

- (void)setStroke:(id)a3
{
  id v5;
  _TtC8Freeform13CRLStyledItem *v6;

  v5 = a3;
  v6 = self;
  sub_100A14388(a3);

}

- (void)_clearStrokeCache
{
  void *v2;

  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform13CRLStyledItem__stroke);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8Freeform13CRLStyledItem__stroke) = 0;

}

- (BOOL)canCopyStyle
{
  return (*(unsigned __int8 (**)(void))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0x440))() != 6;
}

- (void).cxx_destruct
{

}

@end
