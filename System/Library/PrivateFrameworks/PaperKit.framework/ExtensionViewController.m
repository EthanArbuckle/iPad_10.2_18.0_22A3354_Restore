@implementation ExtensionViewController

- (void)dealloc
{
  NSObject *v3;
  _TtC8PaperKit23ExtensionViewController *v4;
  _TtC8PaperKit23ExtensionViewController *v5;
  objc_super v6;

  if (*((_BYTE *)&self->super.super.super.isa
       + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueueSuspended) == 1)
  {
    v3 = *(NSObject **)((char *)&self->super.super.super.isa
                      + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueue);
    v4 = self;
    dispatch_resume(v3);
  }
  else
  {
    v5 = self;
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ExtensionViewController();
  -[ExtensionViewController dealloc](&v6, sel_dealloc);
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperTextCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperCanvasView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_paperDocumentViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_tool);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ExtensionViewController_hostRequestQueue));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)loadPaper:(id)a3 paperURL:(id)a4 coherenceContextURL:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7
{
  _BOOL4 v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _TtC8PaperKit23ExtensionViewController *v23;
  uint64_t v24;
  uint64_t v25;

  v25 = a7;
  v7 = a6;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  MEMORY[0x1E0C80A78](v10, v11);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for URL();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14, v16);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v21 = v20;
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  if (a5)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, v22, 1, v14);
  v23 = self;
  ExtensionViewController.loadPaper(_:paperURL:coherenceContextURL:encrypted:userInterfaceState:)(v19, v21, (uint64_t)v18, (uint64_t)v13, v7, v25);
  swift_bridgeObjectRelease();

  outlined destroy of StocksKitCurrencyCache.Provider?((uint64_t)v13, &demangling cache variable for type metadata for URL?);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v18, v14);
}

- (void)loadPaper:(id)a3 paperBookmark:(id)a4 coherenceContextBookmark:(id)a5 encrypted:(BOOL)a6 userInterfaceState:(int64_t)a7
{
  _BOOL4 v8;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  char *v22;
  _TtC8PaperKit23ExtensionViewController *v23;

  v8 = a6;
  v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v14 = v13;
  v15 = a4;
  v23 = self;
  v16 = a5;
  v17 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v19 = v18;

  if (v16)
  {
    v20 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    v22 = v21;

  }
  else
  {
    v20 = 0;
    v22 = (char *)0xF000000000000000;
  }
  ExtensionViewController.loadPaper(_:paperBookmark:coherenceContextBookmark:encrypted:userInterfaceState:)(v12, v14, v17, v19, v20, v22, v8, a7);
  outlined consume of Data?(v20, (unint64_t)v22);
  outlined consume of Data._Representation(v17, v19);
  swift_bridgeObjectRelease();

}

- (void)loadBookmark:(id)a3 readOnly:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _TtC8PaperKit23ExtensionViewController *v10;

  v4 = a4;
  v6 = a3;
  v10 = self;
  v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = v8;

  ExtensionViewController.loadBookmark(_:readOnly:)(v7, v9, v4);
  outlined consume of Data._Representation(v7, v9);

}

- (void)receiveMulticastData:(id)a3
{
  @objc ExtensionViewController.receiveMulticastData(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_1EA83DF60, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.receiveMulticastData(_:));
}

- (void)receiveLiveStreamData:(id)a3
{
  @objc ExtensionViewController.receiveMulticastData(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_1EA83DF38, (uint64_t)&closure #1 in ExtensionViewController.receiveLiveStreamData(_:)partial apply);
}

- (void)setupWithData:(id)a3 transparentBackground:(BOOL)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  _TtC8PaperKit23ExtensionViewController *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  _TtC8PaperKit23ExtensionViewController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v7, v8);
  v10 = (char *)&v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = a3;
  v12 = self;
  v13 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v15 = v14;

  v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v10, 1, 1, v16);
  type metadata accessor for MainActor();
  v17 = v12;
  outlined copy of Data._Representation(v13, v15);
  v18 = static MainActor.shared.getter();
  v19 = swift_allocObject();
  v20 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = v20;
  *(_QWORD *)(v19 + 32) = v17;
  *(_BYTE *)(v19 + 40) = a4;
  *(_QWORD *)(v19 + 48) = v13;
  *(_QWORD *)(v19 + 56) = v15;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v10, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setupWithData(_:transparentBackground:), v19);
  swift_release();
  outlined consume of Data._Representation(v13, v15);

}

- (void)setTool:(id)a3
{
  _TtC8PaperKit23ExtensionViewController *v4;
  id v5;

  v5 = a3;
  v4 = self;
  ExtensionViewController.setTool(_:)((NSDictionary)v5);

}

- (void)setLinedPaperWithHorizontalLineSpacing:(double)a3 verticalLineSpacing:(double)a4 horizontalInset:(double)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  _TtC8PaperKit23ExtensionViewController *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v9, v10);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v12, 1, 1, v13);
  v14 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  v15 = self;
  swift_retain();
  v16 = static MainActor.shared.getter();
  v17 = swift_allocObject();
  v18 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v17 + 16) = v16;
  *(_QWORD *)(v17 + 24) = v18;
  *(_QWORD *)(v17 + 32) = v14;
  *(double *)(v17 + 40) = a3;
  *(double *)(v17 + 48) = a4;
  *(double *)(v17 + 56) = a5;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v12, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setLinedPaper(horizontalLineSpacing:verticalLineSpacing:horizontalInset:), v17);
  swift_release();

}

- (void)setHasLiveStreamMessenger:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _TtC8PaperKit23ExtensionViewController *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  type metadata accessor for MainActor();
  v10 = self;
  v11 = static MainActor.shared.getter();
  v12 = swift_allocObject();
  v13 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v12 + 16) = v11;
  *(_QWORD *)(v12 + 24) = v13;
  *(_BYTE *)(v12 + 32) = a3;
  *(_QWORD *)(v12 + 40) = v10;
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setHasLiveStreamMessenger(_:), v12);
  swift_release();

}

- (void)setCanvasContentMode:(int64_t)a3
{
  @objc ExtensionViewController.setCanvasContentMode(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_1EA83DE98, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setCanvasContentMode(_:));
}

- (void)setUserInterfaceStyleWithUserInterfaceStyle:(int64_t)a3
{
  @objc ExtensionViewController.setCanvasContentMode(_:)(self, (uint64_t)a2, a3, (uint64_t)&unk_1EA83DE70, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setUserInterfaceStyle(userInterfaceStyle:));
}

- (void)setPaperDocumentInlineThumbnailsVisible:(BOOL)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _TtC8PaperKit23ExtensionViewController *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v5, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 1, 1, v9);
  v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  v11 = self;
  swift_retain();
  v12 = static MainActor.shared.getter();
  v13 = swift_allocObject();
  v14 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v13 + 16) = v12;
  *(_QWORD *)(v13 + 24) = v14;
  *(_QWORD *)(v13 + 32) = v10;
  *(_BYTE *)(v13 + 40) = a3;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCytSg_Tgm5((uint64_t)v8, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.setPaperDocumentInlineThumbnailsVisible(_:), v13);
  swift_release();

}

- (void)reportSafeAreaInsetsWithTop:(double)a3 left:(double)a4 bottom:(double)a5 right:(double)a6
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  _TtC8PaperKit23ExtensionViewController *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v11 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v11, v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  v16 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  v17 = self;
  swift_retain();
  v18 = static MainActor.shared.getter();
  v19 = swift_allocObject();
  v20 = MEMORY[0x1E0DF06E8];
  *(_QWORD *)(v19 + 16) = v18;
  *(_QWORD *)(v19 + 24) = v20;
  *(double *)(v19 + 32) = a3;
  *(double *)(v19 + 40) = a4;
  *(double *)(v19 + 48) = a5;
  *(double *)(v19 + 56) = a6;
  *(_QWORD *)(v19 + 64) = v16;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v14, (uint64_t)&async function pointer to partial apply for closure #1 in ExtensionViewController.reportSafeAreaInsets(top:left:bottom:right:), v19);
  swift_release();

}

- (void)revertAllChanges
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  _TtC8PaperKit23ExtensionViewController *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for TaskPriority?);
  MEMORY[0x1E0C80A78](v3, v4);
  v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v6, 1, 1, v7);
  v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  type metadata accessor for MainActor();
  v9 = self;
  swift_retain();
  v10 = static MainActor.shared.getter();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x1E0DF06E8];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v8;
  swift_release();
  _sScTss5NeverORs_rlE8priority9operationScTyxABGScPSg_xyYaYAcntcfCyt_Tgm5((uint64_t)v6, (uint64_t)&closure #1 in ExtensionViewController.revertAllChanges()partial apply, (uint64_t)v11);
  swift_release();

}

- (void)setMathDocument:(id)a3
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  _TtC8PaperKit23ExtensionViewController *v8;

  v4 = a3;
  v8 = self;
  v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  v7 = v6;

  ExtensionViewController.setMathDocument(_:)();
  outlined consume of Data._Representation(v5, v7);

}

- (void)setMathResult:(id)a3 expressionUUID:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _TtC8PaperKit23ExtensionViewController *v13;
  uint64_t v14;

  v5 = type metadata accessor for UUID();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5, v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  static UUID._unconditionallyBridgeFromObjectiveC(_:)();
  v13 = self;
  ExtensionViewController.setMathResult(_:expressionUUID:)(v10, v12, (uint64_t)v9);
  swift_bridgeObjectRelease();

  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);
}

- (void)setMathEnabled:(BOOL)a3
{
  _TtC8PaperKit23ExtensionViewController *v4;

  v4 = self;
  ExtensionViewController.setMathEnabled(_:)(a3);

}

- (void)searchFor:(id)a3 ignoreCase:(BOOL)a4 wholeWords:(BOOL)a5 reply:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _TtC8PaperKit23ExtensionViewController *v13;

  v9 = _Block_copy(a6);
  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v12 = v11;
  _Block_copy(v9);
  v13 = self;
  specialized ExtensionViewController.search(for:ignoreCase:wholeWords:reply:)(v10, v12, a4, a5, (char *)v13, (void (**)(_QWORD, _QWORD))v9);
  _Block_release(v9);
  _Block_release(v9);
  swift_bridgeObjectRelease();

}

- (void)endSearch
{
  _TtC8PaperKit23ExtensionViewController *v2;

  v2 = self;
  ExtensionViewController.endSearch()();

}

- (void)searchFrameFor:(int64_t)a3 reply:(id)a4
{
  @objc ExtensionViewController.searchFrame(for:reply:)(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))specialized ExtensionViewController.searchFrame(for:reply:));
}

- (void)searchScrollToVisible:(int64_t)a3
{
  _TtC8PaperKit23ExtensionViewController *v4;

  v4 = self;
  ExtensionViewController.searchScrollToVisible(_:)(a3);

}

- (void)searchDrawImageFor:(int64_t)a3 reply:(id)a4
{
  @objc ExtensionViewController.searchFrame(for:reply:)(self, (int)a2, a3, a4, (void (*)(uint64_t, id, void *))specialized ExtensionViewController.searchDrawImage(for:reply:));
}

- (void)handleLink:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC8PaperKit23ExtensionViewController *v9;
  uint64_t v10;

  v4 = type metadata accessor for Notification();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  ExtensionViewController.handleLink(_:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
}

- (_TtC8PaperKit23ExtensionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    v7 = v6;
  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  v8 = a4;
  return (_TtC8PaperKit23ExtensionViewController *)ExtensionViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit23ExtensionViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit23ExtensionViewController *)ExtensionViewController.init(coder:)(a3);
}

@end
