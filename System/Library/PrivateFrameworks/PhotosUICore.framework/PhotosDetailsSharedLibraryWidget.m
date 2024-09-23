@implementation PhotosDetailsSharedLibraryWidget

- (PXWidgetInteractionDelegate)widgetInteractionDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_widgetInteractionDelegate;
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
  _TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_1A6B29214();

  return (PXPhotosDetailsContext *)v3;
}

- (void)setContext:(id)a3
{
  _TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget *v4;
  id v5;

  v5 = a3;
  v4 = self;
  sub_1A6FD1A00(v5);

}

- (NSString)snappableWidgetIdentifier
{
  return (NSString *)(id)sub_1A7AE3734();
}

- (_TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget)init
{
  _QWORD *v3;
  objc_super v5;

  swift_unknownObjectWeakInit();
  v3 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_contextObservation);
  *v3 = 0;
  v3[1] = 0;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget____lazy_storage___hasSiblingWidgetAbove) = 2;
  *((_BYTE *)&self->super.super.isa
  + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget____lazy_storage___hasSiblingWidgetBelow) = 2;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for PhotosDetailsSharedLibraryWidget();
  return -[PhotosDetailsWidget init](&v5, sel_init);
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore32PhotosDetailsSharedLibraryWidget_widgetInteractionDelegate);
  swift_unknownObjectRelease();
}

@end
