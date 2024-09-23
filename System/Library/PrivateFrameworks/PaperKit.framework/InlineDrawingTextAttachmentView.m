@implementation InlineDrawingTextAttachmentView

- (void)didMoveToWindow
{
  _TtC8PaperKit31InlineDrawingTextAttachmentView *v2;

  v2 = self;
  InlineDrawingTextAttachmentView.didMoveToWindow()();

}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v6;
  _TtC8PaperKit31InlineDrawingTextAttachmentView *v7;
  char v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = specialized InlineDrawingTextAttachmentView.dropInteraction(_:canHandle:)(a4);

  swift_unknownObjectRelease();
  return v8 & 1;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v6;
  _TtC8PaperKit31InlineDrawingTextAttachmentView *v7;
  id v8;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  v8 = specialized InlineDrawingTextAttachmentView.dropInteraction(_:sessionDidUpdate:)(a4);

  swift_unknownObjectRelease();
  return v8;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  id v6;
  _TtC8PaperKit31InlineDrawingTextAttachmentView *v7;

  v6 = a3;
  swift_unknownObjectRetain();
  v7 = self;
  specialized InlineDrawingTextAttachmentView.dropInteraction(_:performDrop:)(a4);

  swift_unknownObjectRelease();
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return (int64_t)-[InlineDrawingTextAttachmentView _dropDataOwner](self, sel__dropDataOwner, a3, a4);
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithAttachment:(id)a3 drawingClass:(Class)a4 inserted:(BOOL)a5
{
  _BOOL8 v5;
  objc_super v9;

  v5 = a5;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropSessionType) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView____lazy_storage___acceptedDropLayouts) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InlineDrawingTextAttachmentView();
  return -[PKTextAttachmentDrawingView initWithAttachment:drawingClass:inserted:](&v9, sel_initWithAttachment_drawingClass_inserted_, a3, a4, v5);
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithFrame:(CGRect)a3 drawing:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for PKDrawing?);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    v13 = a4;
    static PKDrawing._unconditionallyBridgeFromObjectiveC(_:)();

    v14 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    v15 = type metadata accessor for PKDrawing();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  return (_TtC8PaperKit31InlineDrawingTextAttachmentView *)InlineDrawingTextAttachmentView.init(frame:drawing:)((uint64_t)v12, x, y, width, height);
}

- (_TtC8PaperKit31InlineDrawingTextAttachmentView)initWithCoder:(id)a3
{
  objc_super v5;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction) = 0;
  *((_BYTE *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropSessionType) = 3;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView____lazy_storage___acceptedDropLayouts) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for InlineDrawingTextAttachmentView();
  return -[PKTextAttachmentDrawingView initWithCoder:](&v5, sel_initWithCoder_, a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit31InlineDrawingTextAttachmentView_dropInteraction));
  swift_bridgeObjectRelease();
}

@end
