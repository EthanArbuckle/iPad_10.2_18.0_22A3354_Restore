@implementation CardTransitioningDelegate

- (_TtC23ShelfKitCollectionViews25CardTransitioningDelegate)init
{
  objc_class *v3;
  char *v4;
  char *v5;
  _TtC23ShelfKitCollectionViews25CardTransitioningDelegate *v6;
  uint64_t ObjectType;
  objc_super v9;

  v3 = (objc_class *)type metadata accessor for CardTransitioningDelegate();
  v4 = (char *)objc_allocWithZone(v3);
  v5 = &v4[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration];
  *(_QWORD *)v5 = 1;
  *((_QWORD *)v5 + 1) = 0;
  *((_QWORD *)v5 + 2) = 0;
  *((_QWORD *)v5 + 3) = 0;
  *((_WORD *)v5 + 16) = 1;
  *((_QWORD *)v5 + 5) = 0;
  *((_QWORD *)v5 + 6) = 0;
  *(_OWORD *)(v5 + 56) = xmmword_2F61B0;
  v5[72] = 0;
  *((_QWORD *)v5 + 10) = 15;
  v9.receiver = v4;
  v9.super_class = v3;
  v6 = -[CardTransitioningDelegate init](&v9, "init");
  ObjectType = swift_getObjectType();
  swift_deallocPartialClassInstance(self, ObjectType, 96, 7);
  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  __int128 v8;
  __int128 v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _OWORD v15[5];
  uint64_t v16;

  v8 = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                     + 40];
  v15[2] = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                         + 24];
  v15[3] = v8;
  v15[4] = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                         + 56];
  v16 = *(_QWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                      + 72];
  v9 = *(_OWORD *)&self->configuration[OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration
                                     + 8];
  v15[0] = *(_OWORD *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews25CardTransitioningDelegate_configuration);
  v15[1] = v9;
  objc_allocWithZone((Class)type metadata accessor for CardPresentationController());
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = sub_279490((uint64_t)v10, (uint64_t)a4, v12, (uint64_t)v15);

  return v13;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v5;
  id v6;
  _TtC23ShelfKitCollectionViews25CardTransitioningDelegate *v7;
  id v8;

  v5 = objc_allocWithZone((Class)type metadata accessor for CardDismissalAnimator());
  v6 = a3;
  v7 = self;
  v8 = objc_msgSend(v5, "init");

  return v8;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  _TtC23ShelfKitCollectionViews25CardTransitioningDelegate *v13;
  id v14;

  v9 = objc_allocWithZone((Class)type metadata accessor for CardPresentationAnimator());
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = self;
  v14 = objc_msgSend(v9, "init");

  return v14;
}

@end
