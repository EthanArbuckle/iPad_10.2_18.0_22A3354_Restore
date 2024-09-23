@implementation AEAPolicyStore

- (BOOL)exists
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSString v13;
  uint64_t v15;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1000060F4(self->fileSystem, *(_QWORD *)&self->fileSystem[24]);
  v8 = (void *)objc_opt_self(AEFileSystem);
  swift_retain(self);
  v9 = objc_msgSend(v8, "assessmentAgentPolicyStoreDirectoryURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v10 = *(void **)(*v7 + 16);
  URL.path.getter();
  v12 = v11;
  v13 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v12);
  LOBYTE(v10) = objc_msgSend(v10, "fileExistsAtPath:", v13);

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_release(self);
  return (char)v10;
}

- (BOOL)hasPersistentData
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  id v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  v3 = type metadata accessor for URL(0);
  v4 = *(_QWORD *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060F4(self->fileSystem, *(_QWORD *)&self->fileSystem[24]);
  v7 = (void *)objc_opt_self(AEFileSystem);
  swift_retain(self);
  v8 = objc_msgSend(v7, "assessmentAgentPolicyStoreDirectoryURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  v9 = sub_100015088((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v10 = v9[2];
  swift_release(self);
  swift_bridgeObjectRelease(v9);
  return v10 != 0;
}

- (id)writeOnlyScratchpadForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  v7 = sub_10002F9B0(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (id)readOnlyScratchpadForIdentifier:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v6 = v5;
  swift_retain(self);
  v7 = (void *)sub_10002FC28(v4, v6);
  swift_release(self);
  swift_bridgeObjectRelease(v6);
  return v7;
}

- (BOOL)cleanUpPolicyStoreWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  void *v8;
  id v9;
  uint64_t v11;

  v4 = type metadata accessor for URL(0);
  v5 = *(_QWORD *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000060F4(self->fileSystem, *(_QWORD *)&self->fileSystem[24]);
  v8 = (void *)objc_opt_self(AEFileSystem);
  swift_retain(self);
  v9 = objc_msgSend(v8, "assessmentAgentPolicyStoreDirectoryURL");
  static URL._unconditionallyBridgeFromObjectiveC(_:)();

  sub_100014F24();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  swift_release(self);
  return 1;
}

@end
