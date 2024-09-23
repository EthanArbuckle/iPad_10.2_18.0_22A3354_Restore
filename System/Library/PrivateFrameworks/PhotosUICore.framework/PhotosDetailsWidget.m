@implementation PhotosDetailsWidget

- (PXWidgetDelegate)widgetDelegate
{
  char *v2;

  v2 = (char *)self + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget_widgetDelegate;
  swift_beginAccess();
  return (PXWidgetDelegate *)(id)MEMORY[0x1A85CED04](v2);
}

- (void)setWidgetDelegate:(id)a3
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
}

- (PXPhotosDetailsContext)context
{
  uint64_t (*v2)(void);
  _TtC12PhotosUICore19PhotosDetailsWidget *v3;
  PXPhotosDetailsContext *result;
  PXPhotosDetailsContext *v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0x90);
  v3 = self;
  result = (PXPhotosDetailsContext *)v2();
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setContext:(id)a3
{
  id v4;
  _TtC12PhotosUICore19PhotosDetailsWidget *v5;

  v4 = a3;
  v5 = self;
  sub_1A6B29290(v4);

}

- (PXWidgetSpec)spec
{
  uint64_t (*v2)(void);
  _TtC12PhotosUICore19PhotosDetailsWidget *v3;
  PXWidgetSpec *result;
  PXWidgetSpec *v5;

  v2 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xF0);
  v3 = self;
  result = (PXWidgetSpec *)v2();
  if (result)
  {
    v5 = result;

    return v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)setSpec:(id)a3
{
  id v4;
  _TtC12PhotosUICore19PhotosDetailsWidget *v5;

  v4 = a3;
  v5 = self;
  sub_1A6B298A8(v4);

}

- (double)preferredContentHeightForWidth:(double)a3
{
  _TtC12PhotosUICore19PhotosDetailsWidget *v4;
  double v5;

  v4 = self;
  v5 = sub_1A6B29CC4(a3);

  return v5;
}

- (PXAnonymousView)contentView
{
  _TtC12PhotosUICore19PhotosDetailsWidget *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = self;
  v3 = sub_1A6B29AE4();
  if (!v3 || (v4 = v3, v5 = objc_msgSend(v3, sel_view), v4, !v5))
    v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  return (PXAnonymousView *)v5;
}

- (void)contentViewDidDisappear
{
  _QWORD *v2;
  uint64_t (*v3)(void);
  _TtC12PhotosUICore19PhotosDetailsWidget *v4;
  _TtC12PhotosUICore19PhotosDetailsWidget *v5;
  _TtC12PhotosUICore19PhotosDetailsWidget *v6;
  _TtC12PhotosUICore19PhotosDetailsWidget *v7;

  v2 = (_QWORD *)MEMORY[0x1E0DEEDD8];
  v3 = *(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & (uint64_t)self->super.isa) + 0xD8);
  v7 = self;
  v4 = (_TtC12PhotosUICore19PhotosDetailsWidget *)v3();
  if (v4)
  {
    v5 = v4;
    (*(void (**)(void))((*v2 & (uint64_t)v4->super.isa) + 0x140))();

    v6 = v5;
  }
  else
  {
    v6 = v7;
  }

}

- (_TtC12PhotosUICore19PhotosDetailsWidget)init
{
  objc_super v4;

  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__context) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__viewModel) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget__spec) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget____lazy_storage___contentViewController) = (Class)1;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for PhotosDetailsWidget();
  return -[PhotosDetailsWidget init](&v4, sel_init);
}

- (void).cxx_destruct
{
  sub_1A688D368((uint64_t)self + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget_widgetDelegate);

  sub_1A6A430C8(*(id *)((char *)&self->super.isa
                      + OBJC_IVAR____TtC12PhotosUICore19PhotosDetailsWidget____lazy_storage___contentViewController));
}

@end
