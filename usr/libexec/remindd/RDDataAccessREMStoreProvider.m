@implementation RDDataAccessREMStoreProvider

- (id)rem_storeForDataAccess
{
  uint64_t v3;
  id v4;
  id v5;

  v3 = *(_QWORD *)self->rdDaemonController;
  v4 = objc_allocWithZone((Class)REMStore);
  swift_retain(self);
  v5 = objc_msgSend(v4, "initWithDaemonController:", v3);
  objc_msgSend(v5, "setMode:", 2);
  swift_release(self);
  return v5;
}

- (BOOL)rem_supportsClearingOrphanedStores
{
  return objc_msgSend(*(id *)self->storeController, "supportsAccountUtils");
}

- (id)rem_saveRequestForDataAccess
{
  uint64_t v3;
  id v4;
  id v5;
  id v6;

  v3 = *(_QWORD *)self->rdDaemonController;
  v4 = objc_allocWithZone((Class)REMStore);
  swift_retain(self);
  v5 = objc_msgSend(v4, "initWithDaemonController:", v3);
  objc_msgSend(v5, "setMode:", 2);
  v6 = objc_msgSend(objc_allocWithZone((Class)REMSaveRequest), "initWithStore:", v5);

  objc_msgSend(v6, "setAuthor:", DADREMSaveRequestAuthorKey);
  swift_release(self);
  return v6;
}

- (id)rd_observePrimaryCloudKitAccountPersonIDSaltChangesOnQueue:(id)a3 successHandler:(id)a4 errorHandler:(id)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;

  v8 = _Block_copy(a4);
  v9 = _Block_copy(a5);
  v10 = swift_allocObject(&unk_1007FDD88, 24, 7);
  *(_QWORD *)(v10 + 16) = v8;
  v11 = swift_allocObject(&unk_1007FDDB0, 24, 7);
  *(_QWORD *)(v11 + 16) = v9;
  v12 = a3;
  swift_retain();
  v13 = sub_100675D88((uint64_t)v12, (uint64_t)sub_100676A7C, v10, (uint64_t)sub_100676ABC, v11);

  swift_release(self);
  swift_release(v10);
  swift_release(v11);
  return v13;
}

- (void)rd_unobservePrimaryCloudKitAccountPersonIDSaltChanges:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v5 = type metadata accessor for Logger(0);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = type metadata accessor for RDAccountPersonIDSaltObserver(0);
  v10 = swift_dynamicCastClass(a3, v9);
  if (v10)
  {
    objc_msgSend(*(id *)self->storeController, "unobservePrimaryCloudKitAccountPersonIDSaltChanges:", v10);
  }
  else
  {
    v11 = qword_1008379E0;
    swift_unknownObjectRetain(a3);
    swift_retain();
    if (v11 != -1)
      swift_once(&qword_1008379E0, sub_100673EB8);
    v12 = sub_10001AAA8(v5, (uint64_t)qword_100851ED0);
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v12, v5);
    v13 = sub_10016E7E4((uint64_t)_swiftEmptyArrayStorage);
    v14 = sub_10016E7E4((uint64_t)_swiftEmptyArrayStorage);
    sub_1004A14D8((uint64_t)"Implementation of REMDAAccountPropertiesObserving must be actually RDAccountPersonIDSaltObserver", 96, 2uLL, v13, v14);
    __break(1u);
  }
}

- (BOOL)rd_isPersonIDSaltInitiallyNilError:(id)a3
{
  id v5;
  void *v6;
  char v7;

  sub_1000151B0(0, (unint64_t *)&qword_100838010, NSObject_ptr);
  v5 = a3;
  swift_retain();
  v6 = (void *)_convertErrorToNSError(_:)(v5);
  if (qword_100837768 != -1)
    swift_once(&qword_100837768, sub_1004EDADC);
  v7 = static NSObject.== infix(_:_:)(v6);
  swift_release(self);

  return v7 & 1;
}

- (id)rd_base64EncodedHMACStringFromString:(id)a3 usingPersonIDSalt:(id)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSString v15;

  v6 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v8 = v7;
  v9 = a4;
  swift_retain();
  v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v12 = v11;

  String.base64EncodedHMACString(using:)(v10, v12, v6, v8);
  v14 = v13;
  sub_1000A71C8(v10, v12);
  swift_release(self);
  swift_bridgeObjectRelease();
  if (v14)
  {
    v15 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  return v15;
}

@end
