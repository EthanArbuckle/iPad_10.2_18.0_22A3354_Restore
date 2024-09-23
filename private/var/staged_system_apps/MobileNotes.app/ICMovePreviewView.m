@implementation ICMovePreviewView

- (ICMovePreviewView)initWithFrame:(CGRect)a3
{
  return (ICMovePreviewView *)sub_1001BC484(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (ICMovePreviewView)initWithCoder:(id)a3
{
  return (ICMovePreviewView *)sub_1001BC83C(a3);
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_size);
  v3 = v2;
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = *(double *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_size);
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (NSManagedObjectContext)modernContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___ICMovePreviewView_modernContext));
}

- (void)setModernContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_modernContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_modernContext) = (Class)a3;
  v3 = a3;

}

- (NSManagedObjectContext)htmlContext
{
  return (NSManagedObjectContext *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                                           + OBJC_IVAR___ICMovePreviewView_htmlContext));
}

- (void)setHtmlContext:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_htmlContext);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_htmlContext) = (Class)a3;
  v3 = a3;

}

- (NSArray)objectIds
{
  uint64_t v2;
  Class isa;

  v2 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_objectIds);
  sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (void)setObjectIds:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  ICMovePreviewView *v8;

  v5 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_objectIds);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_objectIds) = v6;
  v8 = self;
  swift_bridgeObjectRelease(v7);
  sub_1001BD0B0();

}

- (void)reloadImages
{
  ICMovePreviewView *v2;

  v2 = self;
  sub_1001BD0B0();

}

- (void).cxx_destruct
{

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___ICMovePreviewView_objectIds));
}

@end
