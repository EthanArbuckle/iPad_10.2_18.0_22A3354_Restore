@implementation InlineMenuButtonTextAttachmentViewProvider

- (_TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  id v10;
  id v11;
  id v12;
  _TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider *v13;
  uint64_t v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType(self);
  v10 = a3;
  v11 = a4;
  v12 = a5;
  swift_unknownObjectRetain(a6);
  v13 = -[InlineMenuButtonTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v16, "initWithTextAttachment:parentView:textLayoutManager:location:", v10, v11, v12, a6);
  -[InlineMenuButtonTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](v13, "setTracksTextAttachmentViewBounds:", 1, v16.receiver, v16.super_class);

  swift_unknownObjectRelease(a6, v14);
  return v13;
}

- (void)loadView
{
  _TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider *v2;

  v2 = self;
  sub_1001F7E1C();

}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  _TtC11MobileNotes42InlineMenuButtonTextAttachmentViewProvider *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v11 = a6.origin.y;
  v12 = a6.origin.x;
  type metadata accessor for Key(0);
  v18 = v17;
  v19 = sub_1001797A4();
  v20 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)(a3, v18, (char *)&type metadata for Any + 8, v19);
  swift_unknownObjectRetain(a4);
  v21 = a5;
  v22 = self;
  v23 = sub_1001F7F70(v12, v11, width, height, x, y, v20, (uint64_t)a4, (uint64_t)a5);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  swift_unknownObjectRelease(a4, v30);

  swift_bridgeObjectRelease(v20);
  v31 = v23;
  v32 = v25;
  v33 = v27;
  v34 = v29;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

@end
