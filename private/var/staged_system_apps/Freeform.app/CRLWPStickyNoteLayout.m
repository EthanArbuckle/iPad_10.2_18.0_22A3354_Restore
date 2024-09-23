@implementation CRLWPStickyNoteLayout

- (CGSize)minimumSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 100.0;
  v3 = 100.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBeIntersected
{
  return 0;
}

- (BOOL)canResetTextAndObjectHandles
{
  return 0;
}

- (CRLFill)instructionalTextCharacterFill
{
  return (CRLFill *)objc_msgSend(objc_allocWithZone((Class)CRLColorFill), "initWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.25);
}

- (_TtC8Freeform21CRLWPStickyNoteLayout)initWithInfo:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CRLWPStickyNoteLayout();
  return -[CRLWPShapeLayout initWithInfo:](&v5, "initWithInfo:", a3);
}

@end
