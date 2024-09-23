@implementation BKContextMenuProvider

+ (id)getInstance
{
  if (qword_1009CE1F0 != -1)
    swift_once(&qword_1009CE1F0, sub_100007B98);
  return (id)static ContextMenuProvider.shared;
}

- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4
{
  id v6;
  id v7;
  BKContextMenuProvider *v8;
  _QWORD *v9;
  Class isa;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1003762F8(v7, v6);

  sub_100009E04(0, (unint64_t *)&qword_1009D7700, UIMenu_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)analyticsAssetPropertyProviderForDataModel:(id)a3
{
  id v4;
  BKContextMenuProvider *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s5Books19ContextMenuProviderC022analyticsAssetPropertyD03forSo07BAAssetgD0_pSg11BookStoreUI0B15ActionDataModelC_tF_0(v4);

  return v6;
}

- (void)showShareSheetWithDataModel:(BSUIContextActionDataModel *)a3 forViewController:(UIViewController *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  BSUIContextActionDataModel *v17;
  UIViewController *v18;
  BKContextMenuProvider *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1008FFEA8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1008FFED0, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1009DDE70;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1008FFEF8, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1009DDE78;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1005D61EC((uint64_t)v11, (uint64_t)&unk_1009DDE80, (uint64_t)v16);
  swift_release(v20);
}

- (void)performRemoveWithDataModel:(id)a3 forViewController:(id)a4 completion:(id)a5
{
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  BKContextMenuProvider *v12;

  v8 = _Block_copy(a5);
  if (v8)
  {
    v9 = swift_allocObject(&unk_1008FFE80, 24, 7);
    *(_QWORD *)(v9 + 16) = v8;
    v8 = sub_1002028E0;
  }
  else
  {
    v9 = 0;
  }
  v10 = a3;
  v11 = a4;
  v12 = self;
  ContextMenuProvider.performRemove(with:for:on:)(v10, v11, (uint64_t)v8, v9);
  sub_10002AD00((uint64_t)v8, v9);

}

- (BKContextMenuProvider)init
{
  BKContextMenuProvider *result;

  result = (BKContextMenuProvider *)_swift_stdlib_reportUnimplementedInitializer("Books.ContextMenuProvider", 25, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  _s5Books15CurrentPageViewVwxx_0((Class *)((char *)&self->super.isa + OBJC_IVAR___BKContextMenuProvider_figaroProvider));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContextMenuProvider_swipeActionItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BKContextMenuProvider_actionItems));
}

- (void)menuElementsWithDataModel:(BSUIContextActionDataModel *)a3 viewController:(UIViewController *)a4 completion:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  BSUIContextActionDataModel *v17;
  UIViewController *v18;
  BKContextMenuProvider *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_10004CFD4(&qword_1009D3150);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_1008FFE08, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_1008FFE30, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1009DDE58;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_1008FFE58, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1009D76E0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_1005D61EC((uint64_t)v11, (uint64_t)&unk_1009E5570, (uint64_t)v16);
  swift_release(v20);
}

@end
