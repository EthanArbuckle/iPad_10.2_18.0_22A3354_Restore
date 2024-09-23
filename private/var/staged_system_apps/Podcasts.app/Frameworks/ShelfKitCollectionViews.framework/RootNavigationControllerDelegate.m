@implementation RootNavigationControllerDelegate

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  char *v9;
  void (*v10)(id, _BOOL8);
  uint64_t v11;
  id v12;
  id v13;
  _TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate *v14;
  _BYTE v15[24];

  v5 = a5;
  v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler, v15, 0, 0);
  v10 = *(void (**)(id, _BOOL8))v9;
  if (*(_QWORD *)v9)
  {
    v11 = *((_QWORD *)v9 + 1);
    v12 = a3;
    v13 = a4;
    v14 = self;
    sub_2C690((uint64_t)v10, v11);
    v10(v12, v5);
    sub_1D618((uint64_t)v10, v11);

  }
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9;
  id v10;
  id v11;
  _TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate *v12;
  id v13;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = self;
  v13 = sub_297978(v9, (uint64_t)v10);

  return v13;
}

- (_TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate)init
{
  _QWORD *v3;
  objc_class *v4;
  objc_super v6;

  v3 = (Class *)((char *)&self->super.isa
               + OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler);
  v4 = (objc_class *)type metadata accessor for RootNavigationControllerDelegate();
  *v3 = 0;
  v3[1] = 0;
  v6.receiver = self;
  v6.super_class = v4;
  return -[RootNavigationControllerDelegate init](&v6, "init");
}

- (void).cxx_destruct
{
  sub_1D618(*(uint64_t *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler), *(_QWORD *)&self->stackUpdateHandler[OBJC_IVAR____TtC23ShelfKitCollectionViews32RootNavigationControllerDelegate_stackUpdateHandler]);
}

@end
