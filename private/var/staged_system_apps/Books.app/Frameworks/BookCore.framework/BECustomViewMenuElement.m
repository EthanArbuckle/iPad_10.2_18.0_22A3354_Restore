@implementation BECustomViewMenuElement

+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 delegate:(id)a5
{
  id v8;
  id v9;

  v8 = a4;
  swift_unknownObjectRetain(a5);
  v9 = _s8BookCore23BECustomViewMenuElementC015createHighlighteF03for14annotationUUID8delegateSo06UIMenuF0CSo022AEAnnotationTheme_PageO0V_So8NSStringCSgAA0heF8Delegate_ptFZ_0(a3, a4, (uint64_t)a5);

  swift_unknownObjectRelease(a5);
  return v9;
}

+ (id)createHighlightMenuElementFor:(int64_t)a3 annotationUUID:(id)a4 view:(id)a5 rect:(CGRect)a6 delegate:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  id v17;

  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  swift_getObjCClassMetadata(a1);
  v15 = a4;
  v16 = a5;
  swift_unknownObjectRetain(a7);
  v17 = static BECustomViewMenuElement.createHighlightMenuElement(for:annotationUUID:view:rect:delegate:)(a3, a4, v16, (uint64_t)a7, x, y, width, height);

  swift_unknownObjectRelease(a7);
  return v17;
}

- (_TtC8BookCore23BECustomViewMenuElement)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BECustomViewMenuElement();
  return -[BECustomViewMenuElement initWithCoder:](&v5, "initWithCoder:", a3);
}

@end
