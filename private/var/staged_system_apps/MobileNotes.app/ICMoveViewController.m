@implementation ICMoveViewController

- (NSArray)sourceObjectIds
{
  uint64_t v2;
  Class isa;

  v2 = *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_sourceObjectIds];
  sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  swift_bridgeObjectRetain(v2);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v2);
  return (NSArray *)isa;
}

- (id)completionHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler])
    return 0;
  v2 = *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler + 8];
  v6[4] = *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10015AC08;
  v6[3] = &unk_1005699A0;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setCompletionHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)();
  uint64_t (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_100569988, 24, 7);
    v4[2] = v5;
    v6 = sub_100166BB0;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
  v9 = *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler];
  v8 = *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler + 8];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100012C50(v9, v8);
}

- (ICMoveViewController)initWithViewControllerManager:(id)a3 sourceObjectIds:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  id v8;
  ICMoveViewController *v9;

  v6 = sub_1000163BC(0, (unint64_t *)&qword_1005D2500, NSManagedObjectID_ptr);
  v7 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v6);
  v8 = a3;
  v9 = (ICMoveViewController *)sub_10033A3A4((uint64_t)v8, v7);

  return v9;
}

- (ICMoveViewController)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_10033A4B4();
}

- (void)loadView
{
  ICMoveViewController *v2;
  id v3;

  v2 = self;
  v3 = sub_100339EBC(&OBJC_IVAR___ICMoveViewController____lazy_storage___collectionView, (uint64_t (*)(uint64_t))sub_1003394E8);
  -[ICMoveViewController setView:](v2, "setView:", v3);

}

- (void)viewDidLoad
{
  ICMoveViewController *v2;

  v2 = self;
  sub_100338C38();

}

- (ICDataSource)dataSource
{
  ICMoveViewController *v2;
  char *v3;

  v2 = self;
  v3 = sub_1003393C0();

  return (ICDataSource *)v3;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ICMoveViewController *v12;
  Class isa;
  id v14;
  uint64_t v15;
  void *v16;
  unsigned __int8 v17;
  char v18;
  uint64_t v20;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v14 = objc_msgSend(v11, "cellForItemAtIndexPath:", isa);

  if (!v14)
  {

LABEL_6:
    v18 = 1;
    goto LABEL_7;
  }
  v15 = objc_opt_self(ICFolderOutlineCollectionViewCell);
  v16 = (void *)swift_dynamicCastObjCClass(v14, v15);
  if (!v16)
  {

    goto LABEL_6;
  }
  v17 = objc_msgSend(v16, "forceDisabledAppearance");

  v18 = v17 ^ 1;
LABEL_7:
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  return v18;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  ICMoveViewController *v12;
  uint64_t v13;

  v7 = type metadata accessor for IndexPath(0);
  v8 = *(_QWORD *)(v7 - 8);
  __chkstk_darwin(v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v11 = a3;
  v12 = self;
  sub_100339800(v11);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)promptToAddFolderIn:(id)a3
{
  id v5;
  ICMoveViewController *v6;

  v5 = a3;
  v6 = self;
  sub_100339AC8(a3);

}

- (ICMoveViewController)initWithViewMode:(int64_t)a3 viewControllerManager:(id)a4 viewControllerType:(int64_t)a5
{
  id v5;
  ICMoveViewController *result;

  v5 = a4;
  result = (ICMoveViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveViewController", 30, "init(viewMode:viewControllerManager:viewControllerType:)", 56, 0);
  __break(1u);
  return result;
}

- (ICMoveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4;
  ICMoveViewController *result;

  v4 = a4;
  result = (ICMoveViewController *)_swift_stdlib_reportUnimplementedInitializer("MobileNotes.MoveViewController", 30, "init(nibName:bundle:)", 21, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_sourceObjectIds]);
  sub_100012C50(*(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler], *(_QWORD *)&self->super.ICNAViewController_opaque[OBJC_IVAR___ICMoveViewController_completionHandler + 8]);

}

@end
