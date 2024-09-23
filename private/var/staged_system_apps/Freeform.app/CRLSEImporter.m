@implementation CRLSEImporter

- (void)exportLibrarySnapshot
{
  _TtC8Freeform13CRLSEImporter *v2;

  v2 = self;
  sub_1008E5B70();

}

- (NSURL)presentedItemURL
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  NSURL *v9;
  void *v10;
  void *v11;
  _BYTE v14[24];

  v3 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v3);
  v5 = &v14[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  v6 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL;
  swift_beginAccess(v6, v14, 0, 0);
  sub_1004CB7BC((uint64_t)v6, (uint64_t)v5, &qword_1013E04D0);
  v7 = type metadata accessor for URL(0);
  v8 = *(_QWORD *)(v7 - 8);
  v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    URL._bridgeToObjectiveC()(v9);
    v10 = v11;
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v10;
}

- (void)setPresentedItemURL:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _TtC8Freeform13CRLSEImporter *v11;
  _BYTE v13[24];

  v5 = sub_1004B804C(&qword_1013E04D0);
  __chkstk_darwin(v5);
  v7 = &v13[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  if (a3)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v8 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    v9 = type metadata accessor for URL(0);
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL;
  swift_beginAccess((char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL, v13, 33, 0);
  v11 = self;
  sub_10067E7F4((uint64_t)v7, (uint64_t)v10);
  swift_endAccess(v13);

}

- (NSOperationQueue)presentedItemOperationQueue
{
  return (NSOperationQueue *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue));
}

- (void)setPresentedItemOperationQueue:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemOperationQueue) = (Class)a3;
  v3 = a3;

}

- (void)relinquishPresentedItemToWriter:(id)a3
{
  void (**v4)(void *, void *, __n128);
  uint64_t v5;
  void *v6;
  uint64_t v7;
  _TtC8Freeform13CRLSEImporter *v8;
  __n128 v9;
  _QWORD v10[5];
  uint64_t v11;

  v4 = (void (**)(void *, void *, __n128))_Block_copy(a3);
  v5 = swift_allocObject(&unk_101286AA0, 24, 7);
  *(_QWORD *)(v5 + 16) = self;
  v10[4] = sub_1008EBDB0;
  v11 = v5;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = *(_QWORD *)"";
  v10[2] = sub_1005D2FC0;
  v10[3] = &unk_101286AB8;
  v6 = _Block_copy(v10);
  v7 = v11;
  v8 = self;
  swift_retain(v5);
  v9 = swift_release(v7);
  v4[2](v4, v6, v9);
  _Block_release(v6);
  swift_release(v5);
  _Block_release(v4);

}

- (_TtC8Freeform13CRLSEImporter)init
{
  _TtC8Freeform13CRLSEImporter *result;

  result = (_TtC8Freeform13CRLSEImporter *)_swift_stdlib_reportUnimplementedInitializer("Freeform.CRLSEImporter", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_importFailureURL;
  v4 = type metadata accessor for URL(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_librarySnapshotURL, v4);
  v5((char *)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_pendingBoardsURL, v4);
  sub_1004CB800((uint64_t)self + OBJC_IVAR____TtC8Freeform13CRLSEImporter_presentedItemURL, &qword_1013E04D0);

}

@end
