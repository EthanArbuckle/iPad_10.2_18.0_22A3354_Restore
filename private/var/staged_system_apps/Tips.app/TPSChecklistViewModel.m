@implementation TPSChecklistViewModel

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void (*v14)(char *, uint64_t);
  char *v15;
  uint64_t v16;

  v3 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__appInBackground;
  v4 = sub_1000187A4(&qword_1000B44D8);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v6 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__collection;
  v7 = sub_1000187A4(&qword_1000B4938);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  v5((char *)self + OBJC_IVAR___TPSChecklistViewModel__viewCollapsed, v4);
  v8 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__selectedTipIdentifier;
  v9 = sub_1000187A4(&qword_1000B4930);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__currentTip;
  v11 = sub_1000187A4(&qword_1000B4928);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__suggestedTips;
  v13 = sub_1000187A4(&qword_1000B4920);
  v14 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  v14((char *)self + OBJC_IVAR___TPSChecklistViewModel__completedTips, v13);
  v15 = (char *)self + OBJC_IVAR___TPSChecklistViewModel__collectionEntity;
  v16 = sub_1000187A4(&qword_1000B4918);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v16 - 8) + 8))(v15, v16);
  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips));
  sub_100005500(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler), *(_QWORD *)&self->appController[OBJC_IVAR___TPSChecklistViewModel_actionHandler]);
}

- (TPSChecklistViewModel)init
{
  return (TPSChecklistViewModel *)sub_10000C34C();
}

- (TPSUIAppController)appController
{
  return (TPSUIAppController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                       + OBJC_IVAR___TPSChecklistViewModel_appController));
}

- (TPSAnalyticsChecklistSessionController)checkListSessionController
{
  return (TPSAnalyticsChecklistSessionController *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                                           + OBJC_IVAR___TPSChecklistViewModel_checkListSessionController));
}

- (BOOL)appInBackground
{
  return sub_100013378(self, (uint64_t)a2, (uint64_t)&unk_1000794F8, (uint64_t)&unk_100079520);
}

- (void)setAppInBackground:(BOOL)a3
{
  sub_100013618(self, (uint64_t)a2, a3, (uint64_t)&unk_1000794F8, (uint64_t)&unk_100079520);
}

- (TPSCollection)collection
{
  return (TPSCollection *)sub_100035AF0(self, (uint64_t)a2, (uint64_t)&unk_100079300, (uint64_t)&unk_100079328);
}

- (void)setCollection:(id)a3
{
  uint64_t KeyPath;
  uint64_t v6;
  id v7;
  TPSChecklistViewModel *v8;
  id v9;
  id v10;

  KeyPath = swift_getKeyPath(&unk_100079300);
  v6 = swift_getKeyPath(&unk_100079328);
  v10 = a3;
  v7 = a3;
  v8 = self;
  v9 = v7;
  static Published.subscript.setter(&v10, v8, KeyPath, v6);
  sub_1000354B4();

}

- (BOOL)viewCollapsed
{
  return sub_100013378(self, (uint64_t)a2, (uint64_t)&unk_1000794B0, (uint64_t)&unk_1000794D8);
}

- (void)setViewCollapsed:(BOOL)a3
{
  sub_100013618(self, (uint64_t)a2, a3, (uint64_t)&unk_1000794B0, (uint64_t)&unk_1000794D8);
}

- (NSString)selectedTipIdentifier
{
  uint64_t KeyPath;
  uint64_t v4;
  TPSChecklistViewModel *v5;
  uint64_t v6;
  NSString v7;
  uint64_t v9;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100079390);
  v4 = swift_getKeyPath(&unk_1000793B8);
  v5 = self;
  static Published.subscript.getter(&v9, v5, KeyPath, v4);

  swift_release(KeyPath);
  swift_release(v4);
  v6 = v10;
  if (!v10)
    return (NSString *)0;
  v7 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v6);
  return (NSString *)v7;
}

- (void)setSelectedTipIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSChecklistViewModel *v7;

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
  v7 = self;
  sub_10003586C(v4, v6);

}

- (TPSTip)currentTip
{
  return (TPSTip *)sub_100035AF0(self, (uint64_t)a2, (uint64_t)&unk_1000793D8, (uint64_t)&unk_100079400);
}

- (void)setCurrentTip:(id)a3
{
  TPSChecklistViewModel *v5;
  id v6;

  v6 = a3;
  v5 = self;
  sub_1000379FC(a3);

}

- (NSArray)suggestedTips
{
  return (NSArray *)sub_100035C64(self, (uint64_t)a2, (uint64_t)&unk_100079420, (uint64_t)&unk_100079448);
}

- (void)setSuggestedTips:(id)a3
{
  sub_100035DAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100079420, (uint64_t)&unk_100079448);
}

- (NSArray)completedTips
{
  return (NSArray *)sub_100035C64(self, (uint64_t)a2, (uint64_t)&unk_100079468, (uint64_t)&unk_100079490);
}

- (void)setCompletedTips:(id)a3
{
  sub_100035DAC(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&unk_100079468, (uint64_t)&unk_100079490);
}

- (NSArray)tips
{
  TPSChecklistViewModel *v2;
  _QWORD *v3;
  Class isa;

  v2 = self;
  v3 = sub_100006178();

  sub_100006578(0, (unint64_t *)&qword_1000B42F0, TPSTip_ptr);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v3);
  return (NSArray *)isa;
}

- (NSArray)currentDisplayTips
{
  uint64_t v2;
  NSArray v3;

  v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips);
  if (v2)
  {
    sub_100006578(0, (unint64_t *)&qword_1000B42F0, TPSTip_ptr);
    swift_bridgeObjectRetain(v2);
    v3.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v2);
  }
  else
  {
    v3.super.isa = 0;
  }
  return (NSArray *)v3.super.isa;
}

- (void)setCurrentDisplayTips:(id)a3
{
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;

  if (a3)
  {
    v5 = sub_100006578(0, (unint64_t *)&qword_1000B42F0, TPSTip_ptr);
    v6 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v5);
  }
  else
  {
    v6 = 0;
  }
  v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_currentDisplayTips) = v6;
  swift_bridgeObjectRelease(v7);
}

- (id)actionHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler))
    return 0;
  v2 = *(_QWORD *)&self->appController[OBJC_IVAR___TPSChecklistViewModel_actionHandler];
  v6[4] = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_10003AC78;
  v6[3] = &unk_1000A35F8;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setActionHandler:(id)a3
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
    v4 = (_QWORD *)swift_allocObject(&unk_1000A35E0, 24, 7);
    v4[2] = v5;
    v6 = sub_100037E84;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
  v9 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___TPSChecklistViewModel_actionHandler);
  v8 = *(_QWORD *)&self->appController[OBJC_IVAR___TPSChecklistViewModel_actionHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;
  sub_100005500(v9, v8);
}

- (BOOL)hasContent
{
  TPSChecklistViewModel *v2;
  char v3;

  v2 = self;
  v3 = sub_100036220();

  return v3 & 1;
}

- (int64_t)suggestedTipsCount
{
  uint64_t KeyPath;
  uint64_t v4;
  TPSChecklistViewModel *v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v9;
  uint64_t v10;

  KeyPath = swift_getKeyPath(&unk_100079420);
  v4 = swift_getKeyPath(&unk_100079448);
  v5 = self;
  static Published.subscript.getter(&v10, v5, KeyPath, v4);
  swift_release(KeyPath);
  swift_release(v4);
  v6 = v10;
  if (v10)
  {
    if ((unint64_t)v10 >> 62)
    {
      if (v10 >= 0)
        v9 = v10 & 0xFFFFFFFFFFFFFF8;
      else
        v9 = v10;
      swift_bridgeObjectRetain(v10);
      v7 = _CocoaArrayWrapper.endIndex.getter(v9);

      swift_bridgeObjectRelease_n(v6, 2);
    }
    else
    {
      v7 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease(v6);
    }
  }
  else
  {

    return 0;
  }
  return v7;
}

- (void)updateTips
{
  TPSChecklistViewModel *v2;

  v2 = self;
  sub_10000FA94();

}

- (id)tipWithIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  TPSChecklistViewModel *v7;
  void *v8;

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
  v7 = self;
  v8 = (void *)sub_100036580(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)updateSelectionIfNeeded
{
  TPSChecklistViewModel *v2;

  v2 = self;
  sub_100006B58();

}

- (id)firstTip
{
  TPSChecklistViewModel *v2;
  void *v3;

  v2 = self;
  v3 = (void *)sub_100036840();

  return v3;
}

- (void)reset
{
  TPSChecklistViewModel *v2;

  v2 = self;
  sub_100036A0C();

}

- (id)assetsBaseURLFor:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  TPSChecklistViewModel *v9;
  uint64_t v10;
  uint64_t v11;
  NSURL *v12;
  void *v13;
  void *v14;
  uint64_t v16;

  v5 = sub_1000187A4(&qword_1000B4698);
  __chkstk_darwin(v5);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = a3;
  v9 = self;
  sub_100036D2C(v8, (uint64_t)v7);

  v10 = type metadata accessor for URL(0);
  v11 = *(_QWORD *)(v10 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) != 1)
  {
    URL._bridgeToObjectiveC()(v12);
    v13 = v14;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  return v13;
}

- (id)titleFor:(id)a3
{
  id v4;
  TPSChecklistViewModel *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  NSString v11;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "checklistContent");
  if (v6 && (v7 = v6, v8 = objc_msgSend(v6, "title"), v7, v8))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v8);
    v10 = v9;

  }
  else
  {

    v10 = 0xE000000000000000;
  }
  v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v10);
  return v11;
}

- (id)subtitleFor:(id)a3
{
  id v4;
  TPSChecklistViewModel *v5;
  uint64_t v6;
  uint64_t v7;
  NSString v8;

  v4 = a3;
  v5 = self;
  sub_100037024(v4);
  v7 = v6;

  v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v7);
  return v8;
}

- (id)bodyContentFor:(id)a3
{
  id v4;
  TPSChecklistViewModel *v5;
  _QWORD *v6;
  Class isa;

  v4 = a3;
  v5 = self;
  v6 = sub_100037AF8(v4);

  sub_1000187A4(&qword_1000B48D8);
  isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease(v6);
  return isa;
}

- (id)symbolIdentifierFor:(id)a3
{
  id v4;
  TPSChecklistViewModel *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  NSString v12;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "checklistContent");
  if (v6
    && (v7 = v6, v8 = objc_msgSend(v6, "assets"), v7, v8)
    && (v9 = objc_msgSend(v8, "symbolId"), v8, v9))
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(v9);
    v11 = v10;

  }
  else
  {

    v11 = 0xE90000000000006CLL;
  }
  v12 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v11);
  return v12;
}

- (BOOL)isSuggestedFor:(id)a3
{
  return objc_msgSend(a3, "contentStatus") != (id)1;
}

- (BOOL)isCompletedFor:(id)a3
{
  return objc_msgSend(a3, "contentStatus") == (id)1;
}

@end
