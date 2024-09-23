@implementation BAEventReporter

- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10
{
  sub_52050(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))EventReporter.emitAddToCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:));
}

- (void)emitAddToCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5
{
  sub_52530(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void *, uint64_t, uint64_t, id))_s13BookAnalytics13EventReporterC019emitAddToCollectionC05using3for4withyAA9BATrackerCSg_SSAA18BridgedContentDataCtF_0);
}

- (void)emitCollectionAddEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v7;
  objc_class *v8;
  objc_class *v9;
  BAEventReporter *v10;
  id v11;
  id v12;
  BAEventReporter *v13;
  BAEventReporter *v14;
  id v15;
  SEL v16;
  id v17;
  id v18;
  int64_t v19;
  id v20;
  BOOL v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v9 = v8;
  v10 = self;
  v11 = a3;
  if (!a3)
  {
    v12 = sub_CB320();
    if (!v12)
    {

      swift_bridgeObjectRelease(v9);
      goto LABEL_5;
    }
    v11 = v12;
  }
  v13 = (BAEventReporter *)swift_allocObject(&unk_26E668, 40, 7);
  v13[1].super.isa = (Class)a5;
  *(_QWORD *)v13[1].dataProviders = v7;
  v13[2].super.isa = v9;
  v14 = (BAEventReporter *)swift_allocObject(&unk_26E690, 32, 7);
  v14[1].super.isa = (Class)sub_54C24;
  *(_QWORD *)v14[1].dataProviders = v13;
  v15 = a3;
  swift_bridgeObjectRetain(v9);
  swift_retain(v13);
  Tracker.transaction(block:)(sub_54CC0, v14);

  swift_bridgeObjectRelease(v9);
  swift_release(v13, v16, v17, v18, v19, v20, v21, v22);
  swift_release(v14, v23, v24, v25, v26, v27, v28, v29);
LABEL_5:

}

- (void)emitCollectionDescriptionEventWithTracker:(id)a3 collectionID:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  BAEventReporter *v12;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v8 = v7;
  v9 = swift_allocObject(&unk_26E618, 32, 7);
  *(_QWORD *)(v9 + 16) = v6;
  *(_QWORD *)(v9 + 24) = v8;
  v10 = swift_allocObject(&unk_26E640, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_54CC4;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = a3;
  v12 = self;
  swift_bridgeObjectRetain(v8);
  swift_retain(v9);
  Tracker.transaction(block:)(sub_54CC0, v10);

  swift_bridgeObjectRelease(v8);
  swift_release(v9);
  swift_release(v10);
}

- (void)emitCollectionRemoveEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v7;
  objc_class *v8;
  objc_class *v9;
  BAEventReporter *v10;
  id v11;
  id v12;
  BAEventReporter *v13;
  BAEventReporter *v14;
  id v15;
  SEL v16;
  id v17;
  id v18;
  int64_t v19;
  id v20;
  BOOL v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;

  v7 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v9 = v8;
  v10 = self;
  v11 = a3;
  if (!a3)
  {
    v12 = sub_CB320();
    if (!v12)
    {

      swift_bridgeObjectRelease(v9);
      goto LABEL_5;
    }
    v11 = v12;
  }
  v13 = (BAEventReporter *)swift_allocObject(&unk_26E5C8, 40, 7);
  v13[1].super.isa = (Class)a5;
  *(_QWORD *)v13[1].dataProviders = v7;
  v13[2].super.isa = v9;
  v14 = (BAEventReporter *)swift_allocObject(&unk_26E5F0, 32, 7);
  v14[1].super.isa = (Class)sub_54C20;
  *(_QWORD *)v14[1].dataProviders = v13;
  v15 = a3;
  swift_bridgeObjectRetain(v9);
  swift_retain(v13);
  Tracker.transaction(block:)(sub_54CC0, v14);

  swift_bridgeObjectRelease(v9);
  swift_release(v13, v16, v17, v18, v19, v20, v21, v22);
  swift_release(v14, v23, v24, v25, v26, v27, v28, v29);
LABEL_5:

}

- (void)emitLibraryDataEditEventWithTracker:(id)a3 contentIDs:(id)a4 actionType:(int64_t)a5 result:(BOOL)a6
{
  uint64_t v9;
  BAEventReporter *v10;
  id v11;
  id v12;
  BAEventReporter *v13;
  BAEventReporter *v14;
  id v15;
  id v16;
  SEL v17;
  id v18;
  id v19;
  int64_t v20;
  id v21;
  BOOL v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  int64_t v27;
  id v28;
  BOOL v29;
  id v30;

  v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for String);
  v10 = self;
  v11 = a3;
  if (!a3)
  {
    v12 = sub_CB320();
    if (!v12)
    {

      swift_bridgeObjectRelease(v9);
      goto LABEL_5;
    }
    v11 = v12;
  }
  v13 = (BAEventReporter *)swift_allocObject(&unk_26E578, 41, 7);
  v13[1].super.isa = (Class)v9;
  *(_QWORD *)v13[1].dataProviders = v11;
  v13[2].super.isa = (Class)a5;
  v13[2].dataProviders[0] = a6;
  v14 = (BAEventReporter *)swift_allocObject(&unk_26E5A0, 32, 7);
  v14[1].super.isa = (Class)sub_54C30;
  *(_QWORD *)v14[1].dataProviders = v13;
  v15 = a3;
  swift_bridgeObjectRetain(v9);
  v16 = v11;
  swift_retain(v13);
  Tracker.transaction(block:)(sub_54CC0, v14);

  swift_bridgeObjectRelease(v9);
  swift_release(v13, v17, v18, v19, v20, v21, v22, v23);
  swift_release(v14, v24, v25, v26, v27, v28, v29, v30);
LABEL_5:

}

- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9
{
  sub_538F4(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, a9, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))EventReporter.emitMarkAsFinishedEvent(using:for:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:));
}

- (void)emitMarkAsFinishedEventWithTracker:(id)a3 contentData:(id)a4 markedData:(id)a5
{
  id v9;
  id v10;
  id v11;
  BAEventReporter *v12;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  _s13BookAnalytics13EventReporterC018emitMarkAsFinishedC05using4with10markedDatayAA9BATrackerCSg_AA014BridgedContentL0CAA0n6MarkedL0CSgtF_0(a3, (uint64_t)v10, (uint64_t)a5);

}

- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 seriesType:(int64_t)a9 productionType:(int64_t)a10
{
  sub_52050(self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8, a9, a10, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))EventReporter.emitRemoveFromCollectionEvent(using:for:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:));
}

- (void)emitRemoveFromCollectionEventWithTracker:(id)a3 collectionID:(id)a4 contentData:(id)a5
{
  sub_52530(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void *, uint64_t, uint64_t, id))_s13BookAnalytics13EventReporterC024emitRemoveFromCollectionC05using3for4withyAA9BATrackerCSg_SSAA18BridgedContentDataCtF_0);
}

- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentID:(id)a4 contentType:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  BAEventReporter *v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject(&unk_26E528, 48, 7);
  v11[2] = a3;
  v11[3] = v8;
  v11[4] = v10;
  v11[5] = a5;
  v12 = swift_allocObject(&unk_26E550, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_54C2C;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain(v10);
  swift_retain(v11);
  Tracker.transaction(block:)(sub_54CC0, v12);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
  swift_release(v12);
}

- (void)emitRemoveFromWantListEventWithTracker:(id)a3 contentData:(id)a4
{
  id v6;
  id v7;
  BAEventReporter *v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  BAEventReporter *v13;
  SEL v14;
  id v15;
  id v16;
  int64_t v17;
  id v18;
  BOOL v19;
  id v20;
  SEL v21;
  id v22;
  id v23;
  int64_t v24;
  id v25;
  BOOL v26;
  id v27;
  _OWORD v28[6];

  v6 = a3;
  v7 = a4;
  v8 = self;
  sub_AF27C((uint64_t)v28);
  v9 = swift_allocObject(&unk_26E4D8, 112, 7);
  v10 = v28[3];
  *(_OWORD *)(v9 + 48) = v28[2];
  *(_OWORD *)(v9 + 64) = v10;
  v11 = v28[5];
  *(_OWORD *)(v9 + 80) = v28[4];
  *(_OWORD *)(v9 + 96) = v11;
  v12 = v28[1];
  *(_OWORD *)(v9 + 16) = v28[0];
  *(_OWORD *)(v9 + 32) = v12;
  v13 = (BAEventReporter *)swift_allocObject(&unk_26E500, 32, 7);
  v13[1].super.isa = (Class)sub_54CB8;
  *(_QWORD *)v13[1].dataProviders = v9;
  sub_53FBC(v28);
  swift_retain(v9);
  Tracker.transaction(block:)(sub_54CC0, v13);
  swift_release((BAEventReporter *)v9, v14, v15, v16, v17, v18, v19, v20);
  swift_release(v13, v21, v22, v23, v24, v25, v26, v27);
  sub_54654(v28);

}

- (void)emitWantListAddEventWithTracker:(id)a3 contentID:(id)a4 contentAcquisitionType:(int64_t)a5 contentType:(int64_t)a6 supplementalContentCount:(id)a7 seriesType:(int64_t)a8 productionType:(int64_t)a9
{
  sub_538F4(self, (uint64_t)a2, a3, (uint64_t)a4, a5, a6, a7, a8, a9, (void (*)(void *, uint64_t, uint64_t, uint64_t, uint64_t, void *, uint64_t, uint64_t))EventReporter.emitWantListAddEvent(using:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:));
}

- (void)emitWantListAddEventWithTracker:(id)a3 contentData:(id)a4
{
  id v7;
  id v8;
  BAEventReporter *v9;

  v7 = a3;
  v8 = a4;
  v9 = self;
  _s13BookAnalytics13EventReporterC015emitWantListAddC05using4withyAA9BATrackerCSg_AA18BridgedContentDataCtF_0(a3);

}

+ (BAEventReporter)sharedReporter
{
  if (qword_2956E0 != -1)
    swift_once(&qword_2956E0, sub_85F88);
  return (BAEventReporter *)(id)qword_299F50;
}

- (int64_t)seriesTypeForContentID:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  BAEventReporter *v7;
  int64_t v8;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v6 = v5;
  v7 = self;
  v8 = sub_88638(v4, v6);

  swift_bridgeObjectRelease(v6);
  return v8;
}

- (void)emitAccountDidChangeEventWithTracker:(id)a3 type:(unint64_t)a4 reason:(unint64_t)a5
{
  id v8;
  BAEventReporter *v9;

  v8 = a3;
  v9 = self;
  sub_88718((uint64_t)v8, a4, a5);

}

- (void)emitDragDropEventWithContentIDs:(id)a3
{
  objc_class *v4;
  BAEventReporter *v5;

  v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, &type metadata for String);
  v5 = self;
  sub_8892C(v4);

  swift_bridgeObjectRelease(v4);
}

- (void)emitHideBookEventWithTracker:(id)a3 contentData:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  BAEventReporter *v11;

  v7 = swift_allocObject(&unk_271D40, 24, 7);
  *(_QWORD *)(v7 + 16) = a4;
  v8 = swift_allocObject(&unk_271D68, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_892B8;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a4;
  v10 = a3;
  v11 = self;
  swift_retain(v7);
  Tracker.transaction(block:)(sub_54CC0, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)emitInBookSearchEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5
{
  id v8;
  id v9;
  int v10;
  char v11;
  int v12;
  char v13;
  char v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  BAEventReporter *v19;
  SEL v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;
  BOOL v25;
  id v26;
  SEL v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  BOOL v32;
  id v33;
  id v34;
  BAEventReporter *v35;
  int v36;
  char v37;
  int v38;
  char v39;
  char v40;
  char v41;
  _OWORD v42[6];

  v34 = a3;
  v8 = a4;
  v9 = a5;
  v35 = self;
  sub_B15F4((uint64_t)&v36);
  v10 = v36;
  v11 = v37;
  v12 = v38;
  v13 = v39;
  LOBYTE(self) = v40;
  v14 = v41;
  sub_AF27C((uint64_t)v42);
  v15 = swift_allocObject(&unk_271CF0, 128, 7);
  *(_DWORD *)(v15 + 16) = v10;
  *(_BYTE *)(v15 + 20) = v11;
  *(_DWORD *)(v15 + 24) = v12;
  *(_BYTE *)(v15 + 28) = v13;
  *(_BYTE *)(v15 + 29) = (_BYTE)self;
  *(_BYTE *)(v15 + 30) = v14;
  v16 = v42[5];
  *(_OWORD *)(v15 + 96) = v42[4];
  *(_OWORD *)(v15 + 112) = v16;
  v17 = v42[3];
  *(_OWORD *)(v15 + 64) = v42[2];
  *(_OWORD *)(v15 + 80) = v17;
  v18 = v42[1];
  *(_OWORD *)(v15 + 32) = v42[0];
  *(_OWORD *)(v15 + 48) = v18;
  v19 = (BAEventReporter *)swift_allocObject(&unk_271D18, 32, 7);
  v19[1].super.isa = (Class)sub_88A58;
  *(_QWORD *)v19[1].dataProviders = v15;
  sub_53FBC(v42);
  swift_retain(v15);
  Tracker.transaction(block:)(sub_54CC0, v19);
  swift_release((BAEventReporter *)v15, v20, v21, v22, v23, v24, v25, v26);
  swift_release(v19, v27, v28, v29, v30, v31, v32, v33);
  sub_54654(v42);

}

- (void)emitRatingEventWithTracker:(id)a3 rating:(id)a4 contentID:(id)a5 contentAcquisitionType:(int64_t)a6 contentType:(int64_t)a7 supplementalContentCount:(id)a8 productionType:(int64_t)a9
{
  uint64_t v14;
  objc_class *v15;
  objc_class *v16;
  id v17;
  objc_class *v18;
  id v19;
  BAEventReporter *v20;
  SEL v21;
  id v22;
  id v23;
  id v24;
  int64_t v25;
  int64_t v26;
  id v27;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, a2);
  v16 = v15;
  v17 = a3;
  v18 = (objc_class *)a4;
  v19 = a8;
  v20 = self;
  sub_87510(a3, v18, v14, v16, (objc_class *)a6, a7, (objc_class *)a8, a9);

  swift_bridgeObjectRelease((BAEventReporter *)v16, v21, v22, v23, v24, v25, v26, v27, a9);
}

- (void)emitShareEventWithTracker:(id)a3 propertyProvider:(id)a4
{
  id v7;
  BAEventReporter *v8;

  v7 = a3;
  swift_unknownObjectRetain(a4);
  v8 = self;
  sub_87B74(a3, (uint64_t)a4);

  swift_unknownObjectRelease(a4);
}

- (void)emitWidgetEngagementEventWithTracker:(id)a3 widgetData:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  BAEventReporter *v11;

  v7 = swift_allocObject(&unk_271CA0, 24, 7);
  *(_QWORD *)(v7 + 16) = a4;
  v8 = swift_allocObject(&unk_271CC8, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_892B4;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a4;
  v10 = a3;
  v11 = self;
  swift_retain(v7);
  Tracker.transaction(block:)(sub_54CC0, v8);

  swift_release(v7);
  swift_release(v8);
}

- (BAEventReporter)init
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  objc_super v7;

  v3 = OBJC_IVAR___BAEventReporter_dataProviders;
  v4 = sub_71B4(&qword_299F98);
  v5 = swift_allocObject(v4, 28, 7);
  *(_DWORD *)(v5 + 24) = 0;
  *(_QWORD *)(v5 + 16) = &_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + v3) = (Class)v5;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for EventReporter();
  return -[BAEventReporter init](&v7, "init");
}

- (void).cxx_destruct
{
  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR___BAEventReporter_dataProviders));
}

- (void)emitReadEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 readingSessionData:(BAReadingSessionData *)a4 contentData:(BAContentData *)a5 readingSettingsData:(BAReadingSettingsData *)a6 upSellData:(BAUpSellData *)a7 contentSettingsData:(BAContentSettingsData *)a8 doNotDisturbData:(BADoNotDisturbData *)a9 startTime:(NSDate *)a10 completion:(id)a11
{
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  _QWORD *v20;
  BAContentSettingsData *v21;
  BAEventReporter *v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  _TtC13BookAnalytics9BATracker *v26;
  BAReadingSessionData *v27;
  BAContentData *v28;
  BAReadingSettingsData *v29;
  BAUpSellData *v30;
  BAContentSettingsData *v31;
  BADoNotDisturbData *v32;
  NSDate *v33;
  BAEventReporter *v34;
  BAEventReporter *v35;
  SEL v36;
  id v37;
  id v38;
  int64_t v39;
  id v40;
  BOOL v41;
  id v42;
  BAEventReporter *v43;
  BAContentSettingsData *v44;

  v43 = self;
  v44 = a8;
  v16 = sub_71B4(&qword_29AAB0);
  __chkstk_darwin(v16);
  v18 = (char *)&v43 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = _Block_copy(a11);
  v20 = (_QWORD *)swift_allocObject(&unk_273DF0, 96, 7);
  v20[2] = a3;
  v20[3] = a4;
  v20[4] = a5;
  v20[5] = a6;
  v21 = v44;
  v20[6] = a7;
  v20[7] = v21;
  v20[8] = a9;
  v20[9] = a10;
  v22 = v43;
  v20[10] = v19;
  v20[11] = v22;
  v23 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, 1, 1, v23);
  v24 = (_QWORD *)swift_allocObject(&unk_273E18, 48, 7);
  v24[2] = 0;
  v24[3] = 0;
  v24[4] = &unk_29AAC0;
  v24[5] = v20;
  v25 = (_QWORD *)swift_allocObject(&unk_273E40, 48, 7);
  v25[2] = 0;
  v25[3] = 0;
  v25[4] = &unk_29AAC8;
  v25[5] = v24;
  v26 = a3;
  v27 = a4;
  v28 = a5;
  v29 = a6;
  v30 = a7;
  v31 = v44;
  v32 = a9;
  v33 = a10;
  v34 = v43;
  v35 = (BAEventReporter *)sub_DD01C((uint64_t)v18, (uint64_t)&unk_29AAD0, (uint64_t)v25);
  swift_release(v35, v36, v37, v38, v39, v40, v41, v42);
}

- (void)emitReadingAutoNightSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 isOn:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  BAEventReporter *v14;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  _s13BookAnalytics13EventReporterC033emitReadingAutoNightSettingChangeC05using18readingSessionData07contentN04isOnyAA9BATrackerCSg_AA07BridgedfmN0CAA0s7ContentN0CSbtF_0(a3, (uint64_t)v12, (uint64_t)v13, a6);

}

- (void)emitReadingBackgroundColorChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 backgroundColorData:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  BAEventReporter *v15;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = self;
  _s13BookAnalytics13EventReporterC032emitReadingBackgroundColorChangeC05using18readingSessionData07contentM0010backgroundhM0yAA9BATrackerCSg_AA07BridgedflM0CAA0q7ContentM0CAA0qghM0CtF_0(a3, (uint64_t)v12, (uint64_t)v13, (uint64_t)v14);

}

- (void)emitReadingBrightnessChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 brightness:(int)a6
{
  id v10;
  BAEventReporter *v11;
  id v12;
  id v13;
  uint64_t v14;
  BAEventReporter *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  SEL v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;
  BOOL v25;
  id v26;
  SEL v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  BOOL v32;
  id v33;
  id v34;

  v34 = a4;
  v10 = a5;
  v11 = self;
  v12 = a3;
  if (!a3)
  {
    v13 = sub_CB320();
    if (!v13)
    {

      goto LABEL_5;
    }
    v12 = v13;
  }
  v14 = swift_allocObject(&unk_273DA0, 36, 7);
  *(_QWORD *)(v14 + 16) = v34;
  *(_QWORD *)(v14 + 24) = v10;
  *(_DWORD *)(v14 + 32) = a6;
  v15 = (BAEventReporter *)swift_allocObject(&unk_273DC8, 32, 7);
  v15[1].super.isa = (Class)sub_9DA9C;
  *(_QWORD *)v15[1].dataProviders = v14;
  v16 = a3;
  v17 = v34;
  v18 = v10;
  v19 = v16;
  swift_retain(v14);
  Tracker.transaction(block:)(sub_54CC0, v15);

  swift_release((BAEventReporter *)v14, v20, v21, v22, v23, v24, v25, v26);
  swift_release(v15, v27, v28, v29, v30, v31, v32, v33);
LABEL_5:

}

- (void)emitReadingFontChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontName:(id)a6
{
  uint64_t v10;
  BAEventReporter *v11;
  BAEventReporter *v12;
  id v13;
  id v14;
  id v15;
  BAEventReporter *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  id v23;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, a2);
  v12 = v11;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  _s13BookAnalytics13EventReporterC021emitReadingFontChangeC05using18readingSessionData07contentL08fontNameyAA9BATrackerCSg_AA07BridgedfkL0CAA0q7ContentL0CSStF_0(a3, (uint64_t)v14, (uint64_t)v15, v10, (uint64_t)v12);

  swift_bridgeObjectRelease(v12, v17, v18, v19, v20, v21, v22, v23);
}

- (void)emitReadingOrientationChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5
{
  id v9;
  id v10;
  id v11;
  BAEventReporter *v12;
  BAEventReporter *v13;
  BAEventReporter *v14;
  BAEventReporter *v15;
  BAEventReporter *v16;
  SEL v17;
  id v18;
  id v19;
  id v20;
  int64_t v21;
  int64_t v22;
  id v23;
  SEL v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;
  id v30;
  SEL v31;
  id v32;
  id v33;
  id v34;
  int64_t v35;
  int64_t v36;
  id v37;
  SEL v38;
  id v39;
  id v40;
  id v41;
  int64_t v42;
  int64_t v43;
  id v44;
  __int128 v45;
  char v46;
  uint64_t v47;
  BAEventReporter *v48;
  uint64_t v49;
  BAEventReporter *v50;
  __int16 v51;
  int v52;
  char v53;
  int v54;
  char v55;
  int v56;
  char v57;
  uint64_t v58;
  BAEventReporter *v59;
  __int128 v60;
  char v61;
  uint64_t v62;
  BAEventReporter *v63;
  uint64_t v64;
  BAEventReporter *v65;
  __int16 v66;
  int v67;
  char v68;
  int v69;
  char v70;
  int v71;
  char v72;
  uint64_t v73;
  BAEventReporter *v74;
  int v75;
  char v76;
  int v77;
  char v78;
  char v79;
  char v80;
  int v81;
  char v82;
  int v83;
  char v84;
  char v85;
  char v86;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = self;
  sub_B15F4((uint64_t)&v81);
  v75 = v81;
  v76 = v82;
  v77 = v83;
  v78 = v84;
  v79 = v85;
  v80 = v86;
  sub_AF27C((uint64_t)&v60);
  v13 = (BAEventReporter *)*((_QWORD *)&v60 + 1);
  v14 = v63;
  v15 = v65;
  v16 = v74;
  v45 = v60;
  v46 = v61;
  v47 = v62;
  v48 = v63;
  v49 = v64;
  v50 = v65;
  v51 = v66;
  v52 = v67;
  v53 = v68;
  v54 = v69;
  v55 = v70;
  v56 = v71;
  v57 = v72;
  v58 = v73;
  v59 = v74;
  _s13BookAnalytics13EventReporterC028emitReadingOrientationChangeC05using18readingSessionData07contentL0yAA9BATrackerCSg_AA0fkL0VAA07ContentL0VtF_0(a3, &v75, &v45);

  swift_bridgeObjectRelease(v15, v17, v18, v19, v20, v21, v22, v23);
  swift_bridgeObjectRelease(v14, v24, v25, v26, v27, v28, v29, v30);
  swift_bridgeObjectRelease(v13, v31, v32, v33, v34, v35, v36, v37);
  swift_bridgeObjectRelease(v16, v38, v39, v40, v41, v42, v43, v44);
}

- (void)emitReadingFontSizeChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6
{
  id v11;
  id v12;
  id v13;
  BAEventReporter *v14;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = self;
  _s13BookAnalytics13EventReporterC025emitReadingFontSizeChangeC05using18readingSessionData07contentM004fontH0yAA9BATrackerCSg_AA07BridgedflM0CAA0q7ContentM0CSftF_0(a3, a6);

}

- (void)emitReadingScrollViewSettingChangeEventWithTracker:(id)a3 readingSessionData:(id)a4 contentData:(id)a5 fontSize:(float)a6 isOn:(BOOL)a7
{
  id v13;
  id v14;
  id v15;
  BAEventReporter *v16;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = self;
  _s13BookAnalytics13EventReporterC034emitReadingScrollViewSettingChangeC05using18readingSessionData07contentN08fontSize4isOnyAA9BATrackerCSg_AA07BridgedfmN0CAA0u7ContentN0CSfSbtF_0(a3, a6, (uint64_t)v14, (uint64_t)v15, a7);

}

- (void)emitAllInSeriesViewEventWithTracker:(id)a3 collectionID:(id)a4 collectionItemCount:(int64_t)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  id v13;
  BAEventReporter *v14;

  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v10 = v9;
  v11 = (_QWORD *)swift_allocObject(&unk_2748A0, 40, 7);
  v11[2] = a5;
  v11[3] = v8;
  v11[4] = v10;
  v12 = swift_allocObject(&unk_2748C8, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_A2798;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = a3;
  v14 = self;
  swift_bridgeObjectRetain(v10);
  swift_retain(v11);
  Tracker.transaction(block:)(sub_54CC0, v12);

  swift_bridgeObjectRelease(v10);
  swift_release(v11);
  swift_release(v12);
}

- (void)emitBrowseCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 summaryData:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  BAEventReporter *v23;
  uint64_t v24;

  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v24 - v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = (v16 + 16) & ~v16;
  v18 = (v11 + v17 + 7) & 0xFFFFFFFFFFFFFFF8;
  v19 = swift_allocObject(&unk_274850, v18 + 8, v16 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v10 + 32))(v19 + v17, v13, v9);
  *(_QWORD *)(v19 + v18) = a5;
  v20 = swift_allocObject(&unk_274878, 32, 7);
  *(_QWORD *)(v20 + 16) = sub_A20BC;
  *(_QWORD *)(v20 + 24) = v19;
  v21 = a5;
  v22 = a3;
  v23 = self;
  swift_retain(v19);
  Tracker.transaction(block:)(sub_54CC0, v20);

  swift_release(v19);
  swift_release(v20);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)emitCollectionScreenViewEventWithTracker:(id)a3 startDate:(id)a4 collectionID:(id)a5 collectionItemCount:(int64_t)a6
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  BAEventReporter *v18;
  BAEventReporter *v19;
  uint64_t v20;
  uint64_t v21;
  BAEventReporter *v22;
  BAEventReporter *v23;
  id v24;
  BAEventReporter *v25;
  SEL v26;
  id v27;
  id v28;
  id v29;
  int64_t v30;
  int64_t v31;
  id v32;
  SEL v33;
  id v34;
  id v35;
  int64_t v36;
  id v37;
  BOOL v38;
  id v39;
  SEL v40;
  id v41;
  id v42;
  int64_t v43;
  id v44;
  BOOL v45;
  id v46;
  int64_t v47;
  BAEventReporter *v48;

  v47 = a6;
  v48 = self;
  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v47 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v47 - v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v16);
  v19 = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v20 = *(unsigned __int8 *)(v10 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (BAEventReporter *)swift_allocObject(&unk_274800, v21 + v11, v20 | 7);
  v22[1].super.isa = (Class)v47;
  *(_QWORD *)v22[1].dataProviders = v17;
  v22[2].super.isa = (Class)v19;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v22 + v21, v13, v9);
  v23 = (BAEventReporter *)swift_allocObject(&unk_274828, 32, 7);
  v23[1].super.isa = (Class)sub_A20C4;
  *(_QWORD *)v23[1].dataProviders = v22;
  v24 = a3;
  v25 = v48;
  swift_bridgeObjectRetain(v19);
  swift_retain(v22);
  Tracker.transaction(block:)(sub_54CC0, v23);

  swift_bridgeObjectRelease(v19, v26, v27, v28, v29, v30, v31, v32);
  swift_release(v22, v33, v34, v35, v36, v37, v38, v39);
  swift_release(v23, v40, v41, v42, v43, v44, v45, v46);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)emitContextualActionSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  BAEventReporter *v18;
  BAEventReporter *v19;
  id v20;
  BAEventReporter *v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;
  SEL v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;
  BOOL v35;
  id v36;
  uint64_t v37;

  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v37 - v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = (v16 + 40) & ~v16;
  v18 = (BAEventReporter *)swift_allocObject(&unk_2747B0, v17 + v11, v16 | 7);
  v18[1].super.isa = (Class)self;
  *(_QWORD *)v18[1].dataProviders = a5;
  v18[2].super.isa = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v18 + v17, v13, v9);
  v19 = (BAEventReporter *)swift_allocObject(&unk_2747D8, 32, 7);
  v19[1].super.isa = (Class)sub_A20D4;
  *(_QWORD *)v19[1].dataProviders = v18;
  v20 = a3;
  swift_unknownObjectRetain_n(a5, 2);
  v21 = self;
  v22 = v20;
  swift_retain(v18);
  Tracker.transaction(block:)(sub_54CC0, v19);

  swift_unknownObjectRelease(a5);
  swift_release(v18, v23, v24, v25, v26, v27, v28, v29);
  swift_release(v19, v30, v31, v32, v33, v34, v35, v36);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)emitGetStartedViewEventWithTracker:(id)a3 startDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  BAEventReporter *v16;
  BAEventReporter *v17;
  id v18;
  BAEventReporter *v19;
  SEL v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;
  BOOL v25;
  id v26;
  SEL v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  BOOL v32;
  id v33;
  uint64_t v34;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v34 - v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 16) & ~v14;
  v16 = (BAEventReporter *)swift_allocObject(&unk_274760, v15 + v9, v14 | 7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v16 + v15, v11, v7);
  v17 = (BAEventReporter *)swift_allocObject(&unk_274788, 32, 7);
  v17[1].super.isa = (Class)sub_A20E4;
  *(_QWORD *)v17[1].dataProviders = v16;
  v18 = a3;
  v19 = self;
  swift_retain(v16);
  Tracker.transaction(block:)(sub_54CC0, v17);

  swift_release(v16, v20, v21, v22, v23, v24, v25, v26);
  swift_release(v17, v27, v28, v29, v30, v31, v32, v33);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)emitLibraryViewEventWithTracker:(id)a3 startDate:(id)a4 librarySummary:(id)a5 displayType:(int64_t)a6 sortType:(int64_t)a7
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  BAEventReporter *v19;
  uint64_t v20;
  uint64_t v21;
  BAEventReporter *v22;
  uint64_t v23;
  BAEventReporter *v24;
  id v25;
  BAEventReporter *v26;
  SEL v27;
  id v28;
  id v29;
  id v30;
  int64_t v31;
  int64_t v32;
  id v33;
  SEL v34;
  id v35;
  id v36;
  int64_t v37;
  id v38;
  BOOL v39;
  id v40;
  SEL v41;
  id v42;
  id v43;
  int64_t v44;
  id v45;
  BOOL v46;
  id v47;
  int64_t v48;
  BAEventReporter *v49;

  v48 = a7;
  v49 = self;
  v11 = type metadata accessor for Date(0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(_QWORD *)(v12 + 64);
  v14 = __chkstk_darwin(v11);
  v15 = (char *)&v48 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v14);
  v17 = (char *)&v48 - v16;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v18 = type metadata accessor for BridgedLibraryItemTypeData();
  v19 = (BAEventReporter *)static Array._unconditionallyBridgeFromObjectiveC(_:)(a5, v18);
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v11);
  v20 = *(unsigned __int8 *)(v12 + 80);
  v21 = (v20 + 40) & ~v20;
  v22 = (BAEventReporter *)swift_allocObject(&unk_274710, v21 + v13, v20 | 7);
  v22[1].super.isa = (Class)v19;
  *(_QWORD *)v22[1].dataProviders = a6;
  v22[2].super.isa = (Class)v48;
  v23 = v11;
  (*(void (**)(char *, char *, uint64_t))(v12 + 32))((char *)v22 + v21, v15, v11);
  v24 = (BAEventReporter *)swift_allocObject(&unk_274738, 32, 7);
  v24[1].super.isa = (Class)sub_A2104;
  *(_QWORD *)v24[1].dataProviders = v22;
  v25 = a3;
  v26 = v49;
  swift_bridgeObjectRetain(v19);
  swift_retain(v22);
  Tracker.transaction(block:)(sub_54CC0, v24);

  swift_bridgeObjectRelease(v19, v27, v28, v29, v30, v31, v32, v33);
  swift_release(v22, v34, v35, v36, v37, v38, v39, v40);
  swift_release(v24, v41, v42, v43, v44, v45, v46, v47);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v23);
}

- (void)emitShareSheetExposureEventWithTracker:(id)a3 startDate:(id)a4 propertyProvider:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  BAEventReporter *v18;
  BAEventReporter *v19;
  id v20;
  BAEventReporter *v21;
  id v22;
  SEL v23;
  id v24;
  id v25;
  int64_t v26;
  id v27;
  BOOL v28;
  id v29;
  SEL v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;
  BOOL v35;
  id v36;
  uint64_t v37;

  v9 = type metadata accessor for Date(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  v12 = __chkstk_darwin(v9);
  v13 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  v15 = (char *)&v37 - v14;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v9);
  v16 = *(unsigned __int8 *)(v10 + 80);
  v17 = (v16 + 40) & ~v16;
  v18 = (BAEventReporter *)swift_allocObject(&unk_2746C0, v17 + v11, v16 | 7);
  v18[1].super.isa = (Class)self;
  *(_QWORD *)v18[1].dataProviders = a5;
  v18[2].super.isa = (Class)a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))((char *)v18 + v17, v13, v9);
  v19 = (BAEventReporter *)swift_allocObject(&unk_2746E8, 32, 7);
  v19[1].super.isa = (Class)sub_A2114;
  *(_QWORD *)v19[1].dataProviders = v18;
  v20 = a3;
  swift_unknownObjectRetain_n(a5, 2);
  v21 = self;
  v22 = v20;
  swift_retain(v18);
  Tracker.transaction(block:)(sub_54CC0, v19);

  swift_unknownObjectRelease(a5);
  swift_release(v18, v23, v24, v25, v26, v27, v28, v29);
  swift_release(v19, v30, v31, v32, v33, v34, v35, v36);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v9);
}

- (void)emitTabViewEventWithTracker:(id)a3 startDate:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  BAEventReporter *v16;
  BAEventReporter *v17;
  id v18;
  BAEventReporter *v19;
  SEL v20;
  id v21;
  id v22;
  int64_t v23;
  id v24;
  BOOL v25;
  id v26;
  SEL v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  BOOL v32;
  id v33;
  uint64_t v34;

  v7 = type metadata accessor for Date(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v34 - v12;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 16) & ~v14;
  v16 = (BAEventReporter *)swift_allocObject(&unk_274670, v15 + v9, v14 | 7);
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))((char *)v16 + v15, v11, v7);
  v17 = (BAEventReporter *)swift_allocObject(&unk_274698, 32, 7);
  v17[1].super.isa = (Class)sub_A2124;
  *(_QWORD *)v17[1].dataProviders = v16;
  v18 = a3;
  v19 = self;
  swift_retain(v16);
  Tracker.transaction(block:)(sub_54CC0, v17);

  swift_release(v16, v20, v21, v22, v23, v24, v25, v26);
  swift_release(v17, v27, v28, v29, v30, v31, v32, v33);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)emitUnifiedMessageExposureEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  id v31;
  BAEventReporter *v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _BOOL4 v36;
  id v37;
  BAEventReporter *v38;

  v36 = a7;
  v35 = a5;
  v37 = a3;
  v38 = self;
  v12 = type metadata accessor for Date(0);
  v13 = *(_QWORD *)(v12 - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = __chkstk_darwin(v12);
  v16 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  v18 = (char *)&v33 - v17;
  static Date._unconditionallyBridgeFromObjectiveC(_:)(a4);
  if (!a6)
  {
    v33 = 0;
    v20 = 0;
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, v19);
  v20 = v19;
  if (a8)
LABEL_3:
    a8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a8, &type metadata for String);
LABEL_4:
  v21 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9, v19);
  v23 = v22;
  (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v16, v18, v12);
  v24 = *(unsigned __int8 *)(v13 + 80);
  v25 = v12;
  v34 = v12;
  v26 = (v24 + 72) & ~v24;
  v27 = swift_allocObject(&unk_274620, v26 + v14, v24 | 7);
  v28 = v33;
  *(_QWORD *)(v27 + 16) = v35;
  *(_QWORD *)(v27 + 24) = v28;
  *(_QWORD *)(v27 + 32) = v20;
  *(_BYTE *)(v27 + 40) = v36;
  *(_QWORD *)(v27 + 48) = a8;
  *(_QWORD *)(v27 + 56) = v21;
  *(_QWORD *)(v27 + 64) = v23;
  (*(void (**)(uint64_t, char *, uint64_t))(v13 + 32))(v27 + v26, v16, v25);
  v29 = v37;
  v30 = swift_allocObject(&unk_274648, 32, 7);
  *(_QWORD *)(v30 + 16) = sub_A2144;
  *(_QWORD *)(v30 + 24) = v27;
  swift_bridgeObjectRetain(a8);
  swift_bridgeObjectRetain(v23);
  swift_retain(v27);
  v31 = v29;
  v32 = v38;
  swift_bridgeObjectRetain(v20);
  Tracker.transaction(block:)(sub_54CC0, v30);

  swift_bridgeObjectRelease(v20);
  swift_bridgeObjectRelease(a8);
  swift_bridgeObjectRelease(v23);
  swift_release(v27);
  swift_release(v30);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v18, v34);
}

- (void)emitPurchaseAttemptEventWithTracker:(id)a3 contentData:(id)a4 purchaseData:(id)a5 upSellData:(id)a6
{
  _QWORD *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BAEventReporter *v20;

  v11 = (_QWORD *)swift_allocObject(&unk_277F80, 40, 7);
  v11[2] = a4;
  v11[3] = a5;
  v11[4] = a6;
  v12 = swift_allocObject(&unk_277FA8, 32, 7);
  *(_QWORD *)(v12 + 16) = sub_DD604;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = v13;
  v17 = v14;
  v18 = v15;
  v19 = a3;
  v20 = self;
  swift_retain(v11);
  Tracker.transaction(block:)(sub_54CC0, v12);

  swift_release(v11);
  swift_release(v12);
}

- (void)emitPurchaseSuccessEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 completion:(id)a7
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  _TtC13BookAnalytics9BATracker *v21;
  BAContentData *v22;
  BAPurchaseData *v23;
  BAUpSellData *v24;
  BAEventReporter *v25;
  BAEventReporter *v26;
  SEL v27;
  id v28;
  id v29;
  int64_t v30;
  id v31;
  BOOL v32;
  id v33;
  uint64_t v34;

  v13 = sub_71B4(&qword_29AAB0);
  __chkstk_darwin(v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  v17 = (_QWORD *)swift_allocObject(&unk_277F08, 64, 7);
  v17[2] = a3;
  v17[3] = a4;
  v17[4] = a5;
  v17[5] = a6;
  v17[6] = v16;
  v17[7] = self;
  v18 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (_QWORD *)swift_allocObject(&unk_277F30, 48, 7);
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_29D530;
  v19[5] = v17;
  v20 = (_QWORD *)swift_allocObject(&unk_277F58, 48, 7);
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_29D538;
  v20[5] = v19;
  v21 = a3;
  v22 = a4;
  v23 = a5;
  v24 = a6;
  v25 = self;
  v26 = (BAEventReporter *)sub_DD01C((uint64_t)v15, (uint64_t)&unk_29D540, (uint64_t)v20);
  swift_release(v26, v27, v28, v29, v30, v31, v32, v33);
}

- (void)emitPurchaseFailEventWithTracker:(_TtC13BookAnalytics9BATracker *)a3 contentData:(BAContentData *)a4 purchaseData:(BAPurchaseData *)a5 upSellData:(BAUpSellData *)a6 failData:(BAPurchaseFailData *)a7 completion:(id)a8
{
  uint64_t v15;
  uint64_t v16;
  char *v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  _QWORD *v21;
  _QWORD *v22;
  _TtC13BookAnalytics9BATracker *v23;
  BAContentData *v24;
  BAPurchaseData *v25;
  BAUpSellData *v26;
  BAPurchaseFailData *v27;
  BAEventReporter *v28;
  BAEventReporter *v29;
  SEL v30;
  id v31;
  id v32;
  int64_t v33;
  id v34;
  BOOL v35;
  id v36;
  uint64_t v37;

  v15 = sub_71B4(&qword_29AAB0);
  __chkstk_darwin(v15);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = _Block_copy(a8);
  v19 = (_QWORD *)swift_allocObject(&unk_277E68, 72, 7);
  v19[2] = a3;
  v19[3] = a4;
  v19[4] = a5;
  v19[5] = a6;
  v19[6] = a7;
  v19[7] = v18;
  v19[8] = self;
  v20 = type metadata accessor for TaskPriority(0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v17, 1, 1, v20);
  v21 = (_QWORD *)swift_allocObject(&unk_277E90, 48, 7);
  v21[2] = 0;
  v21[3] = 0;
  v21[4] = &unk_29D500;
  v21[5] = v19;
  v22 = (_QWORD *)swift_allocObject(&unk_277EB8, 48, 7);
  v22[2] = 0;
  v22[3] = 0;
  v22[4] = &unk_29AAC8;
  v22[5] = v21;
  v23 = a3;
  v24 = a4;
  v25 = a5;
  v26 = a6;
  v27 = a7;
  v28 = self;
  v29 = (BAEventReporter *)sub_DD01C((uint64_t)v17, (uint64_t)&unk_29AAD0, (uint64_t)v22);
  swift_release(v29, v30, v31, v32, v33, v34, v35, v36);
}

- (void)emitAnnotationActionEventWithTracker:(id)a3 contentData:(id)a4 viewData:(id)a5
{
  id v8;
  id v9;
  id v10;
  BAEventReporter *v11;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  _s13BookAnalytics13EventReporterC020emitAnnotationActionC05using11contentData04viewJ0yAA9BATrackerC_AA014BridgedContentJ0CAA0m4ViewJ0CtF_0();

}

- (void)emitExitLinkTapEventWithTracker:(id)a3 url:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  BAEventReporter *v19;
  uint64_t v20;

  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  v10 = __chkstk_darwin(v7);
  v11 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10);
  v13 = (char *)&v20 - v12;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(a4);
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
  v14 = *(unsigned __int8 *)(v8 + 80);
  v15 = (v14 + 16) & ~v14;
  v16 = swift_allocObject(&unk_279048, v15 + v9, v14 | 7);
  (*(void (**)(uint64_t, char *, uint64_t))(v8 + 32))(v16 + v15, v11, v7);
  v17 = swift_allocObject(&unk_279070, 32, 7);
  *(_QWORD *)(v17 + 16) = sub_ED1F8;
  *(_QWORD *)(v17 + 24) = v16;
  v18 = a3;
  v19 = self;
  swift_retain(v16);
  Tracker.transaction(block:)(sub_54CC0, v17);

  swift_release(v16);
  swift_release(v17);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
}

- (void)emitGetStartedActionEventWithTracker:(id)a3 type:(int64_t)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  BAEventReporter *v10;

  v7 = swift_allocObject(&unk_278FF8, 24, 7);
  *(_QWORD *)(v7 + 16) = a4;
  v8 = swift_allocObject(&unk_279020, 32, 7);
  *(_QWORD *)(v8 + 16) = sub_ED808;
  *(_QWORD *)(v8 + 24) = v7;
  v9 = a3;
  v10 = self;
  swift_retain(v7);
  Tracker.transaction(block:)(sub_54CC0, v8);

  swift_release(v7);
  swift_release(v8);
}

- (void)emitNotificationEngagementEventWithTracker:(id)a3 engagementData:(id)a4 notificationData:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  BAEventReporter *v15;

  v9 = swift_allocObject(&unk_278FA8, 32, 7);
  *(_QWORD *)(v9 + 16) = a5;
  *(_QWORD *)(v9 + 24) = a4;
  v10 = swift_allocObject(&unk_278FD0, 32, 7);
  *(_QWORD *)(v10 + 16) = sub_ED840;
  *(_QWORD *)(v10 + 24) = v9;
  v11 = a4;
  v12 = a5;
  v13 = v11;
  v14 = a3;
  v15 = self;
  swift_retain(v9);
  Tracker.transaction(block:)(sub_54CC0, v10);

  swift_release(v9);
  swift_release(v10);
}

- (void)emitScrubEventWithTracker:(id)a3 contentData:(id)a4 readingSettingsData:(id)a5 startPosition:(id)a6 endPosition:(id)a7 totalLength:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  BAEventReporter *v20;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = self;
  _s13BookAnalytics13EventReporterC09emitScrubC05using11contentData015readingSettingsI013startPosition03endM011totalLengthyAA9BATrackerC_AA014BridgedContentI0CAA0r7ReadingkI0CSo8NSNumberCA2RtF_0((uint64_t)v14, (uint64_t)v15, (uint64_t)v16, v17, v18, v19);

}

- (void)emitUnifiedMessageActionEventWithTracker:(id)a3 startDate:(id)a4 messageType:(int64_t)a5 messageIdentifier:(id)a6 hasActionable:(BOOL)a7 actionIdentifier:(id)a8 placementName:(id)a9
{
  objc_class *v13;
  uint64_t v14;
  objc_class *v15;
  objc_class *v16;
  uint64_t v17;
  objc_class *v18;
  objc_class *v19;
  BAEventReporter *v20;
  BAEventReporter *v21;
  id v22;
  BAEventReporter *v23;
  SEL v24;
  id v25;
  id v26;
  int64_t v27;
  id v28;
  BOOL v29;
  id v30;
  SEL v31;
  id v32;
  id v33;
  int64_t v34;
  id v35;
  BOOL v36;
  id v37;

  v14 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v15 = v13;
  if (!a6)
  {
    v16 = 0;
    if (!a8)
      goto LABEL_4;
    goto LABEL_3;
  }
  a6 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a6, v13);
  v16 = v13;
  if (a8)
LABEL_3:
    a8 = (id)static Array._unconditionallyBridgeFromObjectiveC(_:)(a8, &type metadata for String);
LABEL_4:
  v17 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9, v13);
  v19 = v18;
  v20 = (BAEventReporter *)swift_allocObject(&unk_278F58, 88, 7);
  v20[1].super.isa = (Class)a5;
  *(_QWORD *)v20[1].dataProviders = v14;
  v20[2].super.isa = v15;
  *(_QWORD *)v20[2].dataProviders = a6;
  v20[3].super.isa = v16;
  v20[3].dataProviders[0] = a7;
  v20[4].super.isa = (Class)a8;
  *(_QWORD *)v20[4].dataProviders = v17;
  v20[5].super.isa = v19;
  v21 = (BAEventReporter *)swift_allocObject(&unk_278F80, 32, 7);
  v21[1].super.isa = (Class)sub_ED43C;
  *(_QWORD *)v21[1].dataProviders = v20;
  swift_bridgeObjectRetain(a8);
  swift_bridgeObjectRetain(v19);
  swift_retain(v20);
  v22 = a3;
  v23 = self;
  swift_bridgeObjectRetain(v15);
  swift_bridgeObjectRetain(v16);
  Tracker.transaction(block:)(sub_54CC0, v21);

  swift_bridgeObjectRelease(v15);
  swift_bridgeObjectRelease(v16);
  swift_bridgeObjectRelease(a8);
  swift_bridgeObjectRelease(v19);
  swift_release(v20, v24, v25, v26, v27, v28, v29, v30);
  swift_release(v21, v31, v32, v33, v34, v35, v36, v37);
}

- (void)emitViewSupplementalContentWithTracker:(id)a3 contentID:(id)a4 sourceIsAction:(BOOL)a5 supplementalContentCount:(id)a6
{
  uint64_t v10;
  BAEventReporter *v11;
  BAEventReporter *v12;
  id v13;
  id v14;
  BAEventReporter *v15;
  SEL v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  int64_t v21;
  id v22;

  v10 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, a2);
  v12 = v11;
  v13 = a3;
  v14 = a6;
  v15 = self;
  EventReporter.emitViewSupplementalContent(using:for:sourceIsAction:with:)(a3, v10, (uint64_t)v12, a5, a6);

  swift_bridgeObjectRelease(v12, v16, v17, v18, v19, v20, v21, v22);
}

- (void)emitCloseSupplementalContentPDFPickerWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5
{
  sub_1BE544(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void *, uint64_t, uint64_t, void *))EventReporter.emitCloseSupplementalContentPDFPicker(using:for:with:));
}

- (void)emitPageViewEventForSupplementalContentPDFWithTracker:(id)a3 contentID:(id)a4 supplementalContentCount:(id)a5
{
  sub_1BE544(self, (uint64_t)a2, a3, (uint64_t)a4, a5, (void (*)(void *, uint64_t, uint64_t, void *))EventReporter.emitPageViewEventForSupplementalContentPDF(using:for:with:));
}

@end
