@implementation STIntroductionViewControllersFactory

+ (id)makeIntroductionWelcomeViewControllerWithChildName:(id)a3 forceParentalControls:(BOOL)a4 continueHandler:(id)a5 endHandler:(id)a6
{
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;

  v9 = _Block_copy(a5);
  v10 = _Block_copy(a6);
  if (a3)
  {
    a3 = (id)sub_219B99CF4();
    v12 = v11;
  }
  else
  {
    v12 = 0;
  }
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = v9;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  v15 = objc_allocWithZone((Class)STIntroWelcomeViewController);
  return sub_219B7A62C((uint64_t)a3, v12, a4, (uint64_t)sub_219B7A984, v13, (uint64_t)sub_219B7A984, v14);
}

+ (BOOL)isOfTypeWelcomeViewController:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroPresetsViewControllerWithIntroductionModel:(id)a3 settingsPresetViewModel:(id)a4 name:(id)a5 updateExistingSettings:(BOOL)a6 continueHandler:(id)a7
{
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  id v15;

  v10 = _Block_copy(a7);
  v11 = sub_219B99CF4();
  v13 = v12;
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v10;
  v15 = objc_allocWithZone((Class)type metadata accessor for STIntroPresetsViewController());
  swift_unknownObjectRetain();
  return STIntroPresetsViewController.init(introductionModel:settingsPresetViewModel:name:updateExistingSettings:onContinue:)((uint64_t)a3, a4, v11, v13, a6, (uint64_t)sub_219B7A984, v14);
}

+ (BOOL)isOfTypePresetsViewController:(id)a3
{
  type metadata accessor for STIntroPresetsViewController();
  return swift_dynamicCastClass() != 0;
}

+ (id)makeIntroductionAppAndWebsiteActivityViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  return sub_219B7A034((int)a1, (int)a2, a3, (int)a4, a5, (int)&unk_24DB89720, (uint64_t)sub_219B7A984, (Class *)off_24DB85680, (uint64_t)&block_descriptor_36);
}

+ (BOOL)isOfTypeAppAndWebsiteActivityViewController:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionDowntimeViewControllerWithIntroductionModel:(id)a3 continueHandler:(id)a4
{
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[6];

  v5 = _Block_copy(a4);
  v6 = swift_allocObject();
  *(_QWORD *)(v6 + 16) = v5;
  v7 = objc_allocWithZone((Class)STIntroDowntimeViewController);
  v12[4] = sub_219B7A984;
  v12[5] = v6;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 1107296256;
  v12[2] = sub_219B7A74C;
  v12[3] = &block_descriptor_11;
  v8 = _Block_copy(v12);
  v9 = a3;
  swift_retain();
  v10 = objc_msgSend(v7, sel_initWithIntroductionModel_continueHandler_, v9, v8);
  _Block_release(v8);

  swift_release();
  swift_release();
  return v10;
}

+ (BOOL)isOfTypeDowntimeViewController:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionCommunicationSafetyViewControllerWithIntroductionModel:(id)a3 childName:(id)a4 continueHandler:(id)a5
{
  return sub_219B7A034((int)a1, (int)a2, a3, (int)a4, a5, (int)&unk_24DB896A8, (uint64_t)sub_219B7A984, (Class *)off_24DB85688, (uint64_t)&block_descriptor_33);
}

+ (BOOL)isOfTypeCommunicationSafetyViewController:(id)a3
{
  objc_opt_self();
  return swift_dynamicCastObjCClass() != 0;
}

+ (id)makeIntroductionPasscodeViewControllerWithIntroductionModel:(id)a3 askForRecoveryForAppleID:(BOOL)a4 altDSID:(id)a5 userURI:(id)a6 isChildOrNotSignedIntoiCloud:(BOOL)a7 continueHandler:(id)a8
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v26;

  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_2550ADA70);
  MEMORY[0x24BDAC7A8](v14, v15);
  v17 = (char *)&v26 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  if (!a5)
  {
    v20 = 0;
    if (a6)
      goto LABEL_3;
LABEL_5:
    v22 = sub_219B99274();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v17, 1, 1, v22);
    goto LABEL_6;
  }
  a5 = (id)sub_219B99CF4();
  v20 = v19;
  if (!a6)
    goto LABEL_5;
LABEL_3:
  sub_219B99268();
  v21 = sub_219B99274();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v17, 0, 1, v21);
LABEL_6:
  v23 = swift_allocObject();
  *(_QWORD *)(v23 + 16) = v18;
  sub_219B7A88C();
  v24 = sub_219B7A1FC(a3, a4, (uint64_t)a5, v20, a7, (uint64_t)sub_219B7A90C, v23);
  sub_219B7A914((uint64_t)v17);
  return v24;
}

+ (id)makeControllerUsing:(id)a3 creatingNavigationController:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v5 = objc_allocWithZone(MEMORY[0x24BEBDB08]);
  v6 = v5;
  if (v4)
  {
    swift_unknownObjectRetain();
    v7 = objc_msgSend(v6, sel_init);
    v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE6E420]), sel_initWithRootViewController_, v7);
    swift_unknownObjectRelease();

  }
  else
  {
    v8 = objc_msgSend(v5, sel_init);
  }
  return v8;
}

- (_TtC20ScreenTimeSettingsUI36STIntroductionViewControllersFactory)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for STIntroductionViewControllersFactory();
  return -[STIntroductionViewControllersFactory init](&v3, sel_init);
}

@end
