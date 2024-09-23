@implementation BALinkData

- (BALinkData)initWithPreviousSectionID:(id)a3 previousSectionName:(id)a4 previousContentID:(id)a5 linkActionType:(int64_t)a6 previousSeriesID:(id)a7 previousGenreID:(id)a8 previousCollectionID:(id)a9 previousAuthorID:(id)a10 previousFlowcaseID:(id)a11 previousBrickID:(id)a12
{
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;

  v16 = static String._unconditionallyBridgeFromObjectiveC(_:)(a3, a2);
  v50 = v17;
  v51 = v16;
  if (a4)
  {
    v49 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4, v17);
    v48 = v17;
  }
  else
  {
    v49 = 0;
    v48 = 0;
  }
  if (a5)
  {
    v18 = static String._unconditionallyBridgeFromObjectiveC(_:)(a5, v17);
    v46 = v17;
    v47 = v18;
    if (a7)
    {
LABEL_6:
      v19 = static String._unconditionallyBridgeFromObjectiveC(_:)(a7, v17);
      v44 = v20;
      v45 = v19;
      goto LABEL_9;
    }
  }
  else
  {
    v46 = 0;
    v47 = 0;
    if (a7)
      goto LABEL_6;
  }
  v44 = 0;
  v45 = 0;
LABEL_9:
  v21 = a12;
  v22 = a11;
  v23 = a10;
  v24 = a9;
  v25 = a8;
  if (v25)
  {
    v27 = v25;
    v43 = static String._unconditionallyBridgeFromObjectiveC(_:)(a8, v26);
    v29 = v28;

    if (v24)
      goto LABEL_11;
  }
  else
  {
    v43 = 0;
    v29 = 0;
    if (v24)
    {
LABEL_11:
      v30 = static String._unconditionallyBridgeFromObjectiveC(_:)(a9, v26);
      v32 = v31;

      if (v23)
        goto LABEL_12;
      goto LABEL_17;
    }
  }
  v30 = 0;
  v32 = 0;
  if (v23)
  {
LABEL_12:
    v33 = static String._unconditionallyBridgeFromObjectiveC(_:)(a10, v26);
    v35 = v34;

    if (v22)
      goto LABEL_13;
LABEL_18:
    v36 = 0;
    v38 = 0;
    if (v21)
      goto LABEL_14;
LABEL_19:
    v39 = 0;
    v41 = 0;
    return (BALinkData *)BridgedLinkData.init(previousSectionID:previousSectionName:previousContentID:linkActionType:previousSeriesID:previousGenreID:previousCollectionID:previousAuthorID:previousFlowcaseID:previousBrickID:)(v51, v50, v49, v48, v47, v46, a6, v45, v44, v43, v29, v30, v32, v33, v35, v36, v38, v39, v41);
  }
LABEL_17:
  v33 = 0;
  v35 = 0;
  if (!v22)
    goto LABEL_18;
LABEL_13:
  v36 = static String._unconditionallyBridgeFromObjectiveC(_:)(a11, v26);
  v38 = v37;

  if (!v21)
    goto LABEL_19;
LABEL_14:
  v39 = static String._unconditionallyBridgeFromObjectiveC(_:)(a12, v26);
  v41 = v40;

  return (BALinkData *)BridgedLinkData.init(previousSectionID:previousSectionName:previousContentID:linkActionType:previousSeriesID:previousGenreID:previousCollectionID:previousAuthorID:previousFlowcaseID:previousBrickID:)(v51, v50, v49, v48, v47, v46, a6, v45, v44, v43, v29, v30, v32, v33, v35, v36, v38, v39, v41);
}

- (BALinkData)init
{
  BALinkData *result;

  result = (BALinkData *)_swift_stdlib_reportUnimplementedInitializer("BookAnalytics.BridgedLinkData", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousSectionID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousSectionName]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousContentID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousSeriesID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousGenreID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousCollectionID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousAuthorID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousFlowcaseID]);
  swift_bridgeObjectRelease(*(_QWORD *)&self->previousSectionID[OBJC_IVAR___BALinkData_previousBrickID]);
}

@end
