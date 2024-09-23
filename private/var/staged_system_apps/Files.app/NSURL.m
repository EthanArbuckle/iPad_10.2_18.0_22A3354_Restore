@implementation NSURL

- (void)bumpLastOpenDateWithCompletionHandler:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  uint64_t v10;
  NSURL *v11;
  uint64_t v12;

  v5 = type metadata accessor for URL(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  v10 = swift_allocObject(&unk_1005E1678, 24, 7);
  *(_QWORD *)(v10 + 16) = v9;
  static URL._unconditionallyBridgeFromObjectiveC(_:)(self);
  v11 = self;
  URL.bumpLastOpenDate(delay:completionHandler:)(sub_100241430, v10, 0.0);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  swift_release(v10);
}

- (void)fetchItemWithBumpLastOpenDate:(BOOL)a3 configuration:(id)a4 completionHandler:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSURL *v17;
  id v18;
  uint64_t v19;
  id v20;
  __n128 v21;
  uint64_t v22;

  v9 = type metadata accessor for URL(0);
  v10 = *(_QWORD *)(v9 - 8);
  __chkstk_darwin(v9);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = _Block_copy(a5);
  v14 = swift_allocObject(&unk_1005E1628, 24, 7);
  *(_QWORD *)(v14 + 16) = v13;
  v15 = (void *)objc_opt_self(FPItemManager);
  v16 = a4;
  v17 = self;
  v18 = objc_msgSend(v15, "defaultManager");
  static URL._unconditionallyBridgeFromObjectiveC(_:)(v17);
  v19 = swift_allocObject(&unk_1005E1650, 41, 7);
  *(_QWORD *)(v19 + 16) = sub_100365A44;
  *(_QWORD *)(v19 + 24) = v14;
  *(_QWORD *)(v19 + 32) = v16;
  *(_BYTE *)(v19 + 40) = a3;
  v20 = v16;
  swift_retain();
  FPItemManager.doc_fetchItem(for:completionHandler:)(v12, sub_100365AFC, v19);

  v21 = swift_release(v19);
  (*(void (**)(char *, uint64_t, __n128))(v10 + 8))(v12, v9, v21);

  swift_release(v14);
}

@end
