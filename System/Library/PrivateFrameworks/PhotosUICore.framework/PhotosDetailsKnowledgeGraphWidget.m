@implementation PhotosDetailsKnowledgeGraphWidget

- (PXWidgetInteractionDelegate)widgetInteractionDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget_widgetInteractionDelegate;
  swift_beginAccess();
  return (PXWidgetInteractionDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setWidgetInteractionDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PXPhotosDetailsContext)context
{
  _TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A6B29214();

  return (PXPhotosDetailsContext *)v3;
}

- (void)setContext:(id)a3
{
  _TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1A6C44CA0(v5);

}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (int64_t)contentLayoutStyle
{
  uint64_t (*v2)(void);
  _TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget *v3;
  void *v4;
  _BOOL4 v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.super.isa) + 0x108);
  v3 = self;
  v4 = (void *)v2();
  v5 = objc_msgSend(v4, sel_sizeClass) != (id)2;

  return 2 * v5;
}

- (_TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget_contextObservation);
  v4 = (objc_class *)type metadata accessor for PhotosDetailsKnowledgeGraphWidget();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[PhotosDetailsWidget init](&v6, sel_init);
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore33PhotosDetailsKnowledgeGraphWidget_widgetInteractionDelegate);
  swift_unknownObjectRelease();
}

@end
