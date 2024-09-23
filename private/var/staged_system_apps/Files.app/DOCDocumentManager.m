@implementation DOCDocumentManager

- (void)setUiBrowserDelegate:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_uiBrowserDelegate, a3);
}

- (void)setDocumentBrowser:(id)a3
{
  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_documentBrowser, a3);
}

- (_TtC5Files18DOCDocumentManager)initWithConfiguration:(id)a3 sourceObserver:(id)a4 hierarchyController:(id)a5
{
  id v9;
  id v10;
  id v11;
  objc_super v13;

  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_activeDocumentCreationSession) = 0;
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_uiBrowserDelegate);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_documentBrowser);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_configuration) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_sourceObserver) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_hierarchyController) = (Class)a5;
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for DOCDocumentManager();
  v9 = a3;
  v10 = a4;
  v11 = a5;
  return -[DOCDocumentManager init](&v13, "init");
}

- (_TtCC5Files18DOCDocumentManager23DocumentCreationSession)activeDocumentCreationSession
{
  return (_TtCC5Files18DOCDocumentManager23DocumentCreationSession *)*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_activeDocumentCreationSession);
}

- (void)setActiveDocumentCreationSession:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_activeDocumentCreationSession);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_activeDocumentCreationSession) = (Class)a3;
  v3 = a3;

}

- (UIDocumentBrowserViewControllerDelegate)uiBrowserDelegate
{
  return (UIDocumentBrowserViewControllerDelegate *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files18DOCDocumentManager_uiBrowserDelegate, a2);
}

- (DOCFullDocumentManagerViewController)documentBrowser
{
  return (DOCFullDocumentManagerViewController *)(id)swift_unknownObjectWeakLoadStrong((char *)self+ OBJC_IVAR____TtC5Files18DOCDocumentManager_documentBrowser, a2);
}

- (void)importDocumentAt:(id)a3 nextTo:(id)a4 mode:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  _TtC5Files18DOCDocumentManager *v22;
  id v23;
  char *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  char *v32;
  _TtC5Files18DOCDocumentManager *v33;
  id v34;
  char *v35;
  void (*v36)(char *, uint64_t);
  char *v37;
  char *v38;
  char *v39;
  unint64_t v40;

  v40 = a5;
  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = v10;
  v13 = *(_QWORD *)(v11 + 64);
  __chkstk_darwin(v10);
  v37 = (char *)&v37 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v39 = (char *)&v37 - v15;
  __chkstk_darwin(v16);
  v18 = (char *)&v37 - v17;
  v19 = _Block_copy(a6);
  v38 = v18;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v20 = swift_allocObject(&unk_1005EA720, 24, 7);
  *(_QWORD *)(v20 + 16) = v19;
  v21 = (void *)objc_opt_self(FPItemManager);
  v22 = self;
  v23 = objc_msgSend(v21, "defaultManager");
  v24 = v37;
  v25 = v18;
  v26 = v12;
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v37, v25, v12);
  v27 = *(unsigned __int8 *)(v11 + 80);
  v28 = (v27 + 48) & ~v27;
  v29 = (v13 + v28 + 7) & 0xFFFFFFFFFFFFFFF8;
  v30 = (v29 + 23) & 0xFFFFFFFFFFFFFFF8;
  v31 = (char *)swift_allocObject(&unk_1005EA748, v30 + 8, v27 | 7);
  *((_QWORD *)v31 + 2) = sub_10041F9B4;
  *((_QWORD *)v31 + 3) = v20;
  *((_QWORD *)v31 + 4) = v23;
  *((_QWORD *)v31 + 5) = v22;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v31[v28], v24, v26);
  v32 = &v31[v29];
  *(_QWORD *)v32 = 0;
  *((_QWORD *)v32 + 1) = 0;
  *(_QWORD *)&v31[v30] = v40;
  v33 = v22;
  swift_retain();
  v34 = v23;
  v35 = v39;
  FPItemManager.doc_fetchItem(for:completionHandler:)(v39, sub_10041F6E0, v31);

  swift_release(v20);
  swift_release(v31);

  v36 = *(void (**)(char *, uint64_t))(v11 + 8);
  v36(v35, v26);
  v36(v38, v26);
}

- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toDefaultLocationWithCompletion:(id)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  _TtC5Files18DOCDocumentManager *v23;
  __n128 v24;
  void *v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;

  v28 = a4;
  v8 = type metadata accessor for URL(0);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  __chkstk_darwin(v8);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v14 = (char *)&v25 - v13;
  v15 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v16 = swift_allocObject(&unk_1005EA608, 24, 7);
  *(_QWORD *)(v16 + 16) = v15;
  v17 = type metadata accessor for DOCHierarchyController(0);
  v26 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_configuration);
  v27 = v17;
  v25 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC5Files18DOCDocumentManager_sourceObserver);
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  v18 = *(unsigned __int8 *)(v9 + 80);
  v19 = (v18 + 32) & ~v18;
  v20 = (v10 + v19 + 7) & 0xFFFFFFFFFFFFFFF8;
  v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF8;
  v22 = swift_allocObject(&unk_1005EA630, v21 + 8, v18 | 7);
  *(_QWORD *)(v22 + 16) = sub_10041F9B4;
  *(_QWORD *)(v22 + 24) = v16;
  (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v22 + v19, v11, v8);
  *(_QWORD *)(v22 + v20) = self;
  *(_QWORD *)(v22 + v21) = v28;
  v23 = self;
  swift_retain();
  sub_1001E44F4(v26, v25, 0, (uint64_t)sub_1003162B8, v22);

  swift_release(v16);
  v24 = swift_release(v22);
  (*(void (**)(char *, uint64_t, __n128))(v9 + 8))(v14, v8, v24);
}

- (void)importDocumentAt:(id)a3 mode:(unint64_t)a4 toCurrentBrowserLocationWithCompletion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  _TtC5Files18DOCDocumentManager *v15;
  __n128 v16;
  uint64_t v17;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v14 = swift_allocObject(&unk_1005EA5E0, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  v15 = self;
  sub_10041C5BC((uint64_t)v12, a4, (uint64_t)sub_10041F4B8, v14);

  v16 = swift_release(v14);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v16);
}

- (_TtC5Files18DOCDocumentManager)init
{
  _TtC5Files18DOCDocumentManager *result;

  result = (_TtC5Files18DOCDocumentManager *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCDocumentManager", 24, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC5Files18DOCDocumentManager_activeDocumentCreationSession));
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_uiBrowserDelegate);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC5Files18DOCDocumentManager_documentBrowser);
}

@end
