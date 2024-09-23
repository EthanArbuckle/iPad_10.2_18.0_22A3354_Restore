@implementation BSUICardAuxiliaryNavigationBarManager

- (BSUICardAuxiliaryNavigationBarManager)init
{
  objc_super v4;

  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR___BSUICardAuxiliaryNavigationBarManager_wrappedViewController);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___BSUICardAuxiliaryNavigationBarManager_pendingClosures) = (Class)_swiftEmptyArrayStorage;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CardAuxiliaryNavigationBarManager();
  return -[BSUICardAuxiliaryNavigationBarManager init](&v4, "init");
}

- (void)createViewControllerForFeedViewController:(BSUIFeedViewController *)a3 shouldReportFigaro:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  BSUIFeedViewController *v17;
  BSUICardAuxiliaryNavigationBarManager *v18;
  uint64_t v19;
  uint64_t v20;

  v9 = sub_5C154(&qword_329740);
  __chkstk_darwin(v9);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = swift_allocObject(&unk_2F5648, 48, 7);
  *(_QWORD *)(v13 + 16) = a3;
  *(_BYTE *)(v13 + 24) = a4;
  *(_QWORD *)(v13 + 32) = v12;
  *(_QWORD *)(v13 + 40) = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_2F5670, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_32B728;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_2F5698, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_3206B0;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  v19 = sub_174AF8((uint64_t)v11, (uint64_t)&unk_3206B8, (uint64_t)v16);
  swift_release(v19);
}

- (void)viewControllerWhenAvailable:(id)a3
{
  _QWORD *v4;
  BSUICardAuxiliaryNavigationBarManager *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_21AB80(v5, v4);
  _Block_release(v4);
  _Block_release(v4);

}

- (id)viewControllerIfAvailable
{
  BSUICardAuxiliaryNavigationBarManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_217208();

  return v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR___BSUICardAuxiliaryNavigationBarManager_pendingClosures));
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR___BSUICardAuxiliaryNavigationBarManager_wrappedViewController);
}

@end
