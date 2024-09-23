@implementation ModelViewOverflowTransitioning

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  uint64_t v9;
  uint64_t v10;

  swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentedViewController, a3);
  v9 = objc_opt_self(UICollectionViewController);
  v10 = swift_dynamicCastObjCClass(a5, v9);
  if (v10)
    swift_unknownObjectWeakAssign((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentingViewController, v10);
  return objc_msgSend(objc_allocWithZone((Class)type metadata accessor for ModelViewOverflowPresentationController()), "initWithPresentedViewController:presentingViewController:", a3, a4);
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning *v11;
  char *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  v12 = sub_1C0D18();

  return v12;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  _TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning *v5;
  char *v6;

  v4 = a3;
  v5 = self;
  v6 = sub_1C0454(v4);

  return v6;
}

- (_TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning)init
{
  objc_class *ObjectType;
  char *v4;
  uint64_t v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentedViewController, 0);
  swift_unknownObjectWeakInit((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentingViewController, 0);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_animationView) = 0;
  v4 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_selectedIndexPath;
  v5 = type metadata accessor for IndexPath(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 56))(v4, 1, 1, v5);
  *((_BYTE *)&self->super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_transitionFromAccessoryView) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return -[ModelViewOverflowTransitioning init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentedViewController);
  swift_unknownObjectWeakDestroy((char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_presentingViewController);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_animationView));
  sub_1C0CD8((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews30ModelViewOverflowTransitioning_selectedIndexPath);
}

@end
