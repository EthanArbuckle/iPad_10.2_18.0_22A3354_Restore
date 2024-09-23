@implementation TTRIMenuButtonAttachmentProvider

- (_TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider)initWithTextAttachment:(id)a3 parentView:(id)a4 textLayoutManager:(id)a5 location:(id)a6
{
  objc_class *ObjectType;
  id v12;
  id v13;
  id v14;
  _TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider *v15;
  objc_super v17;

  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider_lightBackgroundAlpha) = (Class)0x3FB999999999999ALL;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider_darkBackgroundAlpha) = (Class)0x3FB999999999999ALL;
  v17.receiver = self;
  v17.super_class = ObjectType;
  v12 = a3;
  v13 = a4;
  v14 = a5;
  swift_unknownObjectRetain();
  v15 = -[NSTextAttachmentViewProvider initWithTextAttachment:parentView:textLayoutManager:location:](&v17, sel_initWithTextAttachment_parentView_textLayoutManager_location_, v12, v13, v14, a6);
  -[NSTextAttachmentViewProvider setTracksTextAttachmentViewBounds:](v15, sel_setTracksTextAttachmentViewBounds_, 1, v17.receiver, v17.super_class);

  swift_unknownObjectRelease();
  return v15;
}

- (CGRect)attachmentBoundsForAttributes:(id)a3 location:(id)a4 textContainer:(id)a5 proposedLineFragment:(CGRect)a6 position:(CGPoint)a7
{
  double y;
  double x;
  double height;
  double width;
  double v11;
  double v12;
  uint64_t v16;
  id v17;
  _TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGRect result;

  y = a7.y;
  x = a7.x;
  height = a6.size.height;
  width = a6.size.width;
  v11 = a6.origin.y;
  v12 = a6.origin.x;
  type metadata accessor for Key(0);
  sub_1B421E608();
  v16 = sub_1B4906818();
  swift_unknownObjectRetain();
  v17 = a5;
  v18 = self;
  v19 = TTRIMenuButtonAttachmentProvider.attachmentBounds(for:location:textContainer:proposedLineFragment:position:)(v12, v11, width, height, x, y, v16, (uint64_t)a4, (uint64_t)a5);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v26 = v19;
  v27 = v21;
  v28 = v23;
  v29 = v25;
  result.size.height = v29;
  result.size.width = v28;
  result.origin.y = v27;
  result.origin.x = v26;
  return result;
}

- (void)loadView
{
  _TtC15RemindersUICore32TTRIMenuButtonAttachmentProvider *v2;

  v2 = self;
  TTRIMenuButtonAttachmentProvider.loadView()();

}

@end
