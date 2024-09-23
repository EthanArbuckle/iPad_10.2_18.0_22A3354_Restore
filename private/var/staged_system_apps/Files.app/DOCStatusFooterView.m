@implementation DOCStatusFooterView

- (void)dealloc
{
  _TtC5Files19DOCStatusFooterView *v2;

  v2 = self;
  sub_100170568();
}

- (void).cxx_destruct
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_delegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_nodeCollection);
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration);
  v4 = *(void **)&self->nodeCollection[OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration];
  v5 = *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration
                                                   + 16];
  v6 = *(void **)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration
                                                  + 24];
  v7 = *(_QWORD *)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration
                                                   + 32];
  v8 = *(void **)&self->itemCollectionConfiguration[OBJC_IVAR____TtC5Files19DOCStatusFooterView_itemCollectionConfiguration
                                                  + 40];

  swift_bridgeObjectRelease(v5);
  swift_unknownObjectRelease(v7);

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView_quotaLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView____lazy_storage___folderInformationLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_gestureDelegate);
  swift_unknownObjectRelease(*(Class *)((char *)&self->super.super.super.super.super.isa
                                      + OBJC_IVAR____TtC5Files19DOCStatusFooterView_folderNode));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files19DOCStatusFooterView_syncStateFooterView));
}

- (void)willMoveToSuperview:(id)a3
{
  id v4;
  _TtC5Files19DOCStatusFooterView *v5;

  v4 = a3;
  v5 = self;
  sub_100170D78();

}

- (void)didMoveToWindow
{
  _TtC5Files19DOCStatusFooterView *v2;

  v2 = self;
  sub_10017088C();

}

- (_TtC5Files19DOCStatusFooterView)initWithFrame:(CGRect)a3
{
  _TtC5Files19DOCStatusFooterView *result;

  result = (_TtC5Files19DOCStatusFooterView *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCStatusFooterView", 25, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  char *v6;
  uint64_t Strong;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t ObjectType;
  uint64_t (*v12)(uint64_t, uint64_t);
  id v13;
  _TtC5Files19DOCStatusFooterView *v14;
  void *v15;

  v6 = (char *)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_gestureDelegate;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC5Files19DOCStatusFooterView_gestureDelegate, a2);
  if (Strong)
  {
    v9 = Strong;
    v10 = *((_QWORD *)v6 + 1);
    ObjectType = swift_getObjectType(Strong, v8);
    v12 = *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8);
    v13 = a3;
    v14 = self;
    v15 = (void *)v12(ObjectType, v10);

    swift_unknownObjectRelease(v9);
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)contextMenuInteraction:(id)a3 previewForHighlightingMenuWithConfiguration:(id)a4
{
  id v6;
  id v7;
  _TtC5Files19DOCStatusFooterView *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_100170E54(v6);
  v10 = v9;

  return v10;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  uint64_t v5;
  void *v6;
  id v10;
  id v11;
  _TtC5Files19DOCStatusFooterView *v12;
  id v13;

  v5 = OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview;
  v6 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC5Files19DOCStatusFooterView_emptyTargetedPreview);
  if (v6)
  {
    v10 = a3;
    v11 = a4;
    swift_unknownObjectRetain(a5);
    v12 = self;
    objc_msgSend(v6, "removeFromSuperview");
    v13 = *(Class *)((char *)&self->super.super.super.super.super.isa + v5);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = 0;

    swift_unknownObjectRelease(a5);
  }
}

@end
