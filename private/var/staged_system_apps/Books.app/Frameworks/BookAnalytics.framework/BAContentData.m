@implementation BAContentData

- (BAContentData)initWithContentID:(id)a3 contentType:(int64_t)a4 contentPrivateID:(id)a5 contentUserID:(id)a6 contentAcquisitionType:(int64_t)a7 contentSubType:(id)a8 contentLength:(id)a9 supplementalContentCount:(id)a10 seriesType:(int64_t)a11 productionType:(int64_t)a12 isUnified:(id)a13 contentKind:(id)a14
{
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  BAContentData *v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v17 = a14;
  v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v36 = v19;
  v37 = v18;
  v20 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v19);
  v34 = v21;
  v35 = v20;
  v22 = static String._unconditionallyBridgeFromObjectiveC(_:)(a6, v21);
  v32 = v23;
  v33 = v22;
  if (a14)
  {
    v17 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)(a14, v23);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  v26 = a13;
  v27 = a10;
  v28 = a9;
  v29 = a8;
  v30 = (BAContentData *)sub_B3408(v37, v36, a4, v35, v34, v33, v32, a7, a8, a9, a10, a11, a12, a13, (uint64_t)v17, v25);

  return v30;
}

- (BAContentData)init
{
  BAContentData *result;

  result = (BAContentData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedContentData", 32, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentID[OBJC_IVAR___BAContentData_contentID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentID[OBJC_IVAR___BAContentData_contentPrivateID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->contentID[OBJC_IVAR___BAContentData_contentUserID]);

  swift_bridgeObjectRelease(*(_QWORD *)&self->contentID[OBJC_IVAR___BAContentData_contentKind]);
}

@end
