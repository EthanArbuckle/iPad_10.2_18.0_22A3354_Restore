@implementation CollectionListViewModel

- (void)setUserGuideHandler:(id)a3
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
    v4 = (_QWORD *)swift_allocObject(&unk_1000A36F0, 24, 7);
    v4[2] = v5;
    v6 = sub_10003B588;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)())((char *)self + OBJC_IVAR___CollectionListViewModel_userGuideHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler);
  v8 = *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_userGuideHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)())v4;
  sub_100005500(v9, v8);
}

- (void)setChecklistHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1000A3740, 24, 7);
    v4[2] = v5;
    v6 = sub_100037E84;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___CollectionListViewModel_checklistHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler);
  v8 = *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_checklistHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;
  sub_100005500(v9, v8);
}

- (void)setActionHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)();
  void (**v7)();
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1000A3790, 24, 7);
    v4[2] = v5;
    v6 = sub_10003B598;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)())((char *)self + OBJC_IVAR___CollectionListViewModel_actionHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler);
  v8 = *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_actionHandler];
  *v7 = v6;
  v7[1] = (void (*)())v4;
  sub_100005500(v9, v8);
}

- (id)assetsInfoFor:(id)a3 userInterfaceStyle:(int64_t)a4
{
  id v6;
  CollectionListViewModel *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  v8 = (void *)sub_100009394(v6, a4);

  return v8;
}

- (id)assetsInfoFor:(id)a3
{
  id v4;
  CollectionListViewModel *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_100004950((uint64_t)v4);

  return v6;
}

- (void)setUserGuides:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  uint64_t v9;

  v5 = type metadata accessor for UserGuide(0, a2);
  v6 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  KeyPath = swift_getKeyPath(&unk_100079940);
  v8 = swift_getKeyPath(&unk_100079968);
  v9 = v6;
  static Published.subscript.setter(&v9, self, KeyPath, v8);
}

- (void)setChecklistCollection:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  CollectionListViewModel *v8;
  id v9;
  id v10;

  KeyPath = swift_getKeyPath(&unk_1000796E0);
  v6 = swift_getKeyPath(&unk_100079708);
  v10 = a3;
  v7 = a3;
  v8 = self;
  v9 = v7;
  static Published.subscript.setter(&v10, v8, KeyPath, v6);
  sub_1000071A4();

}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v3 = (char *)self + OBJC_IVAR___CollectionListViewModel__appInBackground;
  v4 = sub_1000187A4(&qword_1000B44D8);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR___CollectionListViewModel__viewCollapsed, v4);
  v6 = (char *)self + OBJC_IVAR___CollectionListViewModel__currentCollectionID;
  v7 = sub_1000187A4(&qword_1000B4930);
  v8 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8((char *)self + OBJC_IVAR___CollectionListViewModel__selectedCollectionID, v7);
  v9 = (char *)self + OBJC_IVAR___CollectionListViewModel__featuredCollection;
  v10 = sub_1000187A4(&qword_1000B4938);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR___CollectionListViewModel__checklistCollection, v10);
  v12 = (char *)self + OBJC_IVAR___CollectionListViewModel__checklistViewModel;
  v13 = sub_1000187A4(&qword_1000B4B28);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v12, v13);
  v11((char *)self + OBJC_IVAR___CollectionListViewModel__savedTipsCollection, v10);
  v14 = (char *)self + OBJC_IVAR___CollectionListViewModel__collections;
  v15 = sub_1000187A4(&qword_1000B4AF0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v15 - 8) + 8))(v14, v15);
  v16 = (char *)self + OBJC_IVAR___CollectionListViewModel__collectionSections;
  v17 = sub_1000187A4(&qword_1000B4AE8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v16, v17);
  v18 = (char *)self + OBJC_IVAR___CollectionListViewModel__userGuides;
  v19 = sub_1000187A4(&qword_1000B4AE0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v19 - 8) + 8))(v18, v19);
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_featuredAssetViewModel));
  sub_100005500(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_actionHandler), *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_actionHandler]);
  sub_100005500(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_checklistHandler), *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_checklistHandler]);
  sub_100005500(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_userGuideHandler), *(_QWORD *)&self->featuredAssetViewModel[OBJC_IVAR___CollectionListViewModel_userGuideHandler]);
  v20 = (char *)self + OBJC_IVAR___CollectionListViewModel_colorScheme;
  v21 = type metadata accessor for ColorScheme(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v21 - 8) + 8))(v20, v21);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___CollectionListViewModel_cancellables));
}

- (NSString)currentCollectionID
{
  return (NSString *)sub_100039FF4(self, (uint64_t)a2, (uint64_t)&unk_1000799D0, (uint64_t)&unk_1000799F8);
}

- (CollectionListViewModel)init
{
  return (CollectionListViewModel *)sub_10000B9F8();
}

- (NSArray)collections
{
  return (NSArray *)sub_100012790(self, (uint64_t)a2, (uint64_t)&unk_1000798F8, (uint64_t)&unk_100079920, (unint64_t *)&qword_1000B61F0, TPSCollection_ptr);
}

- (void)setCollectionSections:(id)a3
{
  sub_100013404(self, (uint64_t)a2, (uint64_t)a3, &qword_1000B4B20, TPSCollectionSection_ptr, (uint64_t)&unk_1000798B0, (uint64_t)&unk_1000798D8);
}

- (BOOL)viewCollapsed
{
  return sub_100013378(self, (uint64_t)a2, (uint64_t)&unk_100079A18, (uint64_t)&unk_100079A40);
}

- (void)setFeaturedCollection:(id)a3
{
  sub_100013490(self, (uint64_t)a2, a3, (uint64_t)&unk_100079868, (uint64_t)&unk_100079890);
}

- (void)setViewCollapsed:(BOOL)a3
{
  sub_100013690(self, (uint64_t)a2, a3, (uint64_t)&unk_100079A18, (uint64_t)&unk_100079A40, (uint64_t)&unk_100079A60, (uint64_t)&unk_100079A88);
}

- (BOOL)shouldDisplayCheckmarkFor:(id)a3
{
  id v4;
  CollectionListViewModel *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_100014870(v4);

  return self & 1;
}

- (BOOL)shouldDisplayBadgeFor:(id)a3
{
  id v4;
  CollectionListViewModel *v5;

  v4 = a3;
  v5 = self;
  LOBYTE(self) = sub_1000149AC(v4);

  return self & 1;
}

- (id)titleFor:(id)a3
{
  id v4;
  CollectionListViewModel *v5;
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;
  NSString v10;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "title");
  if (v6)
  {
    v7 = v6;
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    v9 = v8;

  }
  else
  {

    v9 = 0xE000000000000000;
  }
  v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v9);
  return v10;
}

- (void)setCollections:(id)a3
{
  sub_100013404(self, (uint64_t)a2, (uint64_t)a3, (unint64_t *)&qword_1000B61F0, TPSCollection_ptr, (uint64_t)&unk_1000798F8, (uint64_t)&unk_100079920);
}

- (void)setSavedTipsCollection:(id)a3
{
  sub_100013490(self, (uint64_t)a2, a3, (uint64_t)&unk_1000797C8, (uint64_t)&unk_1000797F0);
}

- (BOOL)appInBackground
{
  return sub_100013378(self, (uint64_t)a2, (uint64_t)&unk_100079AA8, (uint64_t)&unk_100079AD0);
}

- (void)setAppInBackground:(BOOL)a3
{
  sub_100013690(self, (uint64_t)a2, a3, (uint64_t)&unk_100079AA8, (uint64_t)&unk_100079AD0, (uint64_t)&unk_100079AF0, (uint64_t)&unk_100079B18);
}

- (void)setCurrentCollectionID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  CollectionListViewModel *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CollectionListViewModel *v14;
  uint64_t v15;
  uint64_t v16;

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  KeyPath = swift_getKeyPath(&unk_1000799D0);
  v8 = swift_getKeyPath(&unk_1000799F8);
  v9 = self;
  static Published.subscript.getter(&v15, v9, KeyPath, v8);
  swift_release(KeyPath);
  swift_release(v8);
  v10 = v15;
  v11 = v16;
  v12 = swift_getKeyPath(&unk_1000799D0);
  v13 = swift_getKeyPath(&unk_1000799F8);
  v15 = v4;
  v16 = v6;
  v14 = v9;
  static Published.subscript.setter(&v15, v14, v12, v13);
  sub_100039D14(v10, v11);

  swift_bridgeObjectRelease(v11);
}

- (NSString)selectedCollectionID
{
  return (NSString *)sub_100039FF4(self, (uint64_t)a2, (uint64_t)&unk_100079988, (uint64_t)&unk_1000799B0);
}

- (void)setSelectedCollectionID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t KeyPath;
  uint64_t v8;
  CollectionListViewModel *v9;
  _QWORD v10[2];

  if (a3)
  {
    v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v6 = v5;
  }
  else
  {
    v4 = 0;
    v6 = 0;
  }
  KeyPath = swift_getKeyPath(&unk_100079988);
  v8 = swift_getKeyPath(&unk_1000799B0);
  v10[0] = v4;
  v10[1] = v6;
  v9 = self;
  static Published.subscript.setter(v10, v9, KeyPath, v8);
  sub_10003A1B0();

}

- (TPSCollection)featuredCollection
{
  return (TPSCollection *)sub_100035AF0(self, (uint64_t)a2, (uint64_t)&unk_100079868, (uint64_t)&unk_100079890);
}

- (TPSCollection)checklistCollection
{
  return (TPSCollection *)sub_100035AF0(self, (uint64_t)a2, (uint64_t)&unk_1000796E0, (uint64_t)&unk_100079708);
}

- (TPSChecklistViewModel)checklistViewModel
{
  uint64_t KeyPath;
  uint64_t v4;
  CollectionListViewModel *v5;
  id v7;

  KeyPath = swift_getKeyPath(&unk_100079728);
  v4 = swift_getKeyPath(&unk_100079750);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  return (TPSChecklistViewModel *)v7;
}

- (void)setChecklistViewModel:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  id v8;

  KeyPath = swift_getKeyPath(&unk_100079728);
  v6 = swift_getKeyPath(&unk_100079750);
  v8 = a3;
  v7 = a3;
  static Published.subscript.setter(&v8, self, KeyPath, v6);
}

- (TPSCollection)savedTipsCollection
{
  return (TPSCollection *)sub_100035AF0(self, (uint64_t)a2, (uint64_t)&unk_1000797C8, (uint64_t)&unk_1000797F0);
}

- (NSArray)collectionSections
{
  return (NSArray *)sub_100012790(self, (uint64_t)a2, (uint64_t)&unk_1000798B0, (uint64_t)&unk_1000798D8, &qword_1000B4B20, TPSCollectionSection_ptr);
}

- (NSArray)userGuides
{
  uint64_t KeyPath;
  uint64_t v4;
  CollectionListViewModel *v5;
  uint64_t v6;
  uint64_t v7;
  Class isa;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100079940);
  v4 = swift_getKeyPath(&unk_100079968);
  v5 = self;
  static Published.subscript.getter(&v10, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  v6 = v10;
  type metadata accessor for UserGuide(0, v7);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return (NSArray *)isa;
}

- (BOOL)isChecklistFeatured
{
  CollectionListViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_10003A9D0();

  return v3 & 1;
}

- (id)actionHandler
{
  return sub_10003ABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CollectionListViewModel_actionHandler, (uint64_t)sub_10003AB64, (uint64_t)&unk_1000A37A8);
}

- (id)checklistHandler
{
  return sub_10003ABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CollectionListViewModel_checklistHandler, (uint64_t)sub_10003AC78, (uint64_t)&unk_1000A3758);
}

- (id)userGuideHandler
{
  return sub_10003ABF0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___CollectionListViewModel_userGuideHandler, (uint64_t)sub_10003AC78, (uint64_t)&unk_1000A3708);
}

- (BOOL)hasCollections
{
  CollectionListViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_10000ABE8();

  return v3 & 1;
}

- (void)resetChecklist
{
  uint64_t KeyPath;
  uint64_t v4;
  CollectionListViewModel *v5;
  void *v6;
  void *v7;

  KeyPath = swift_getKeyPath(&unk_100079728);
  v4 = swift_getKeyPath(&unk_100079750);
  v5 = self;
  static Published.subscript.getter(&v7, v5, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v6 = v7;
  sub_100036A0C();

}

- (TPSAssetsInfo)featuredCollectionAssetsInfo
{
  CollectionListViewModel *v2;
  id v3;

  v2 = self;
  v3 = sub_10003AE6C();

  return (TPSAssetsInfo *)v3;
}

- (int64_t)tipCountFor:(id)a3
{
  id v4;
  CollectionListViewModel *v5;
  id v6;

  v4 = a3;
  v5 = self;
  v6 = sub_10003B024(v4);

  return (int64_t)v6;
}

@end
