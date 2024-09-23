@implementation CRLiOSPencilHoverToolPreviewer

- (CALayer)layer
{
  return (CALayer *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                            + OBJC_IVAR____TtC8Freeform30CRLiOSPencilHoverToolPreviewer_shapeLayer));
}

- (void)clearPreview
{
  _TtC8Freeform30CRLiOSPencilHoverToolPreviewer *v2;

  v2 = self;
  sub_10066EF14();

}

- (_TtC8Freeform30CRLiOSPencilHoverToolPreviewer)init
{
  return (_TtC8Freeform30CRLiOSPencilHoverToolPreviewer *)sub_10066F16C();
}

- (void).cxx_destruct
{

}

@end
