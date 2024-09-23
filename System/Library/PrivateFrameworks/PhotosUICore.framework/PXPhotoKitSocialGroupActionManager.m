@implementation PXPhotoKitSocialGroupActionManager

- (PXPhotoKitSocialGroupActionManager)initWithSocialGroups:(id)a3 photoLibrary:(id)a4
{
  objc_class *ObjectType;
  id v7;
  objc_super v9;

  ObjectType = (objc_class *)swift_getObjectType();
  sub_1A6856488(0, (unint64_t *)&qword_1EE8D8AE0);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotoKitSocialGroupActionManager_socialGroups) = (Class)sub_1A7AE3A10();
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___PXPhotoKitSocialGroupActionManager_photoLibrary) = (Class)a4;
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = a4;
  return -[PXPhotoKitSocialGroupActionManager init](&v9, sel_init);
}

- (id)actionTypeForGenericType:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;
  id v11;
  PXPhotoKitSocialGroupActionManager *v12;
  void *v13;
  id v14;
  PXPhotoKitSocialGroupActionManager *v15;

  v5 = sub_1A7AE3764();
  v7 = v6;
  if (v5 == sub_1A7AE3764() && v7 == v8)
  {
    v14 = a3;
    v15 = self;
    swift_bridgeObjectRelease_n();
    goto LABEL_8;
  }
  v10 = sub_1A7AE4DB4();
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v10 & 1) != 0)
  {
LABEL_8:

    v13 = (void *)sub_1A7AE3734();
    return v13;
  }

  v13 = 0;
  return v13;
}

- (id)actionPerformerForActionType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PXPhotoKitSocialGroupActionManager *v7;
  void *v8;

  v4 = sub_1A7AE3764();
  v6 = v5;
  v7 = self;
  v8 = (void *)sub_1A6F73160(v4, v6);

  swift_bridgeObjectRelease();
  return v8;
}

- (id)actionPerformerForActionType:(id)a3 parameters:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  PXPhotoKitSocialGroupActionManager *v9;
  void *v10;

  v5 = sub_1A7AE3764();
  v7 = v6;
  type metadata accessor for PXActionParameterKey(0);
  sub_1A6F75540((unint64_t *)&unk_1EE8F8490, (uint64_t)&unk_1A7C041B0);
  v8 = sub_1A7AE3584();
  v9 = self;
  v10 = (void *)sub_1A6F73BA4(v5, v7, v8);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v10;
}

- (BOOL)canPerformActionType:(id)a3
{
  return sub_1A6F74720(self, (uint64_t)a2, (uint64_t)a3, sub_1A6F74344);
}

- (id)localizedTitleForActionType:(id)a3 useCase:(unint64_t)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  PXPhotoKitSocialGroupActionManager *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v5 = sub_1A7AE3764();
  v7 = v6;
  v8 = self;
  sub_1A6F753D0(v5, v7);
  v10 = v9;

  swift_bridgeObjectRelease();
  if (v10)
  {
    v11 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)systemImageNameForActionType:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  PXPhotoKitSocialGroupActionManager *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v4 = sub_1A7AE3764();
  v6 = v5;
  v7 = self;
  sub_1A6F744BC(v4, v6);
  v9 = v8;

  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_1A7AE3734();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)isDestructiveActionType:(id)a3
{
  return sub_1A6F74720(self, (uint64_t)a2, (uint64_t)a3, sub_1A6F74630);
}

- (id)contextMenuElementsWithHandler:(id)a3
{
  void *v4;
  uint64_t v5;
  PXPhotoKitSocialGroupActionManager *v6;
  void *v7;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A6F74780((uint64_t)sub_1A6F75500, v5);

  swift_release();
  sub_1A686E9D4(0, (unint64_t *)&qword_1EE90D900);
  v7 = (void *)sub_1A7AE39F8();
  swift_bridgeObjectRelease();
  return v7;
}

- (PXPhotoKitSocialGroupActionManager)init
{
  PXPhotoKitSocialGroupActionManager *result;

  result = (PXPhotoKitSocialGroupActionManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
