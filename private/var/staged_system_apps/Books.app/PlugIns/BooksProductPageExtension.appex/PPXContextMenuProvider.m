@implementation PPXContextMenuProvider

- (id)menuElementsForViewController:(id)a3 dataModel:(id)a4
{
  id v6;
  id v7;
  _TtC25BooksProductPageExtension22PPXContextMenuProvider *v8;
  void *v9;
  Class isa;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = sub_1000166D8(v7, v6);

  sub_10000F62C(0, &qword_1000355D8, UIMenu_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v9);
  return isa;
}

- (id)analyticsAssetPropertyProviderForDataModel:(id)a3
{
  id v4;
  _TtC25BooksProductPageExtension22PPXContextMenuProvider *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  v6 = (void *)_s25BooksProductPageExtension22PPXContextMenuProviderC022analyticsAssetPropertyG03forSo07BAAssetjG0_pSg11BookStoreUI22ContextActionDataModelC_tF_0(v4);

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
  _TtC25BooksProductPageExtension22PPXContextMenuProvider *v19;
  uint64_t v20;
  uint64_t v21;

  v9 = sub_1000089B0(&qword_100035590);
  __chkstk_darwin(v9);
  v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (_QWORD *)swift_allocObject(&unk_10002E0E8, 48, 7);
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  v14 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (_QWORD *)swift_allocObject(&unk_10002E110, 48, 7);
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1000355A0;
  v15[5] = v13;
  v16 = (_QWORD *)swift_allocObject(&unk_10002E138, 48, 7);
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1000355B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  v20 = sub_10001A6EC((uint64_t)v11, (uint64_t)&unk_1000355C0, (uint64_t)v16);
  swift_release(v20);
}

- (_TtC25BooksProductPageExtension22PPXContextMenuProvider)init
{
  _TtC25BooksProductPageExtension22PPXContextMenuProvider *result;

  result = (_TtC25BooksProductPageExtension22PPXContextMenuProvider *)_swift_stdlib_reportUnimplementedInitializer("BooksProductPageExtension.PPXContextMenuProvider", 48, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100008DE4((Class *)((char *)&self->super.isa
                        + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_figaroProvider));
  swift_release(*(Class *)((char *)&self->super.isa
                         + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_objectGraph));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_swipeActionItems));
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC25BooksProductPageExtension22PPXContextMenuProvider_actionItems));
}

@end
