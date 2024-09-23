@implementation CRLInsertionAnimationHelper

+ (void)addInsertionAnimationsToInfo:(id)a3 onInteractiveCanvasController:(id)a4
{
  id v6;

  swift_getObjCClassMetadata(a1);
  swift_unknownObjectRetain(a3);
  v6 = a4;
  sub_10075039C((uint64_t)a3, v6);
  swift_unknownObjectRelease(a3);

}

+ (void)addInsertionAnimationsToInfo:(id)a3 connectionLineLayout:(id)a4 onInteractiveCanvasController:(id)a5
{
  uint64_t ObjCClassMetadata;
  id v9;
  id v10;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  swift_getObjectType(a3);
  swift_unknownObjectRetain(a3);
  v9 = a4;
  v10 = a5;
  sub_100756E18((uint64_t)a3, v9, v10, ObjCClassMetadata);
  swift_unknownObjectRelease(a3);

}

+ (void)addInsertionAnimationsToInfos:(id)a3 onInteractiveCanvasController:(id)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t ObjCClassMetadata;
  id v10;
  id v11;
  _QWORD *v12;
  void *v13;
  _QWORD *v14;
  id v15;
  _QWORD v16[5];
  _QWORD *v17;

  v7 = sub_1004B804C(&qword_1013E0670);
  v8 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v7);
  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v10 = a4;
  v11 = objc_msgSend(v10, "canvas");
  v12 = (_QWORD *)swift_allocObject(&unk_10127B7E8, 48, 7);
  v12[2] = v8;
  v12[3] = v10;
  v12[4] = 0;
  v12[5] = ObjCClassMetadata;
  v16[4] = sub_100757DD8;
  v17 = v12;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = *(_QWORD *)"";
  v16[2] = sub_1005D2FC0;
  v16[3] = &unk_10127B800;
  v13 = _Block_copy(v16);
  v14 = v17;
  v15 = v10;
  swift_bridgeObjectRetain(v8);
  objc_msgSend(v11, "afterLayoutIncludingLayers:performBlock:", 1, v13, swift_release(v14).n128_f64[0]);
  _Block_release(v13);

  swift_bridgeObjectRelease(v8);
}

+ (void)addChangeShapeAnimationsWithAnimateOutInfos:(id)a3 animateInInfos:(id)a4 interactiveCanvasController:(id)a5 completionHandler:(id)a6
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  _QWORD *v18;
  id v19;
  _QWORD v20[5];
  _QWORD *v21;

  v9 = _Block_copy(a6);
  v10 = sub_1004B804C(&qword_1013E0670);
  v11 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a3, v10);
  v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, v10);
  v13 = swift_allocObject(&unk_10127B770, 24, 7);
  *(_QWORD *)(v13 + 16) = v9;
  v14 = a5;
  v15 = objc_msgSend(v14, "canvas");
  v16 = (_QWORD *)swift_allocObject(&unk_10127B798, 56, 7);
  v16[2] = v11;
  v16[3] = v14;
  v16[4] = v12;
  v16[5] = sub_100565828;
  v16[6] = v13;
  v20[4] = sub_100757D8C;
  v21 = v16;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = *(_QWORD *)"";
  v20[2] = sub_1005D2FC0;
  v20[3] = &unk_10127B7B0;
  v17 = _Block_copy(v20);
  v18 = v21;
  v19 = v14;
  swift_bridgeObjectRetain(v11);
  swift_bridgeObjectRetain(v12);
  swift_retain(v13);
  objc_msgSend(v15, "afterLayoutIncludingLayers:performBlock:", 1, v17, swift_release(v18).n128_f64[0]);
  _Block_release(v17);

  swift_bridgeObjectRelease(v11);
  swift_bridgeObjectRelease(v12);
  swift_release(v13);

}

+ (void)addGhostDuplicatePreviewAnimationsWithGhostGroupItem:(id)a3 invisibleAnchorItem:(id)a4 ghostDuplicatedItem:(id)a5 ghostConnectionLineLayout:(id)a6 interactiveCanvasController:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;

  swift_getObjCClassMetadata(a1);
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  sub_100753DB0(v12, v13, v14, v15, v16);

}

+ (void)addCommitDuplicateAnimationsWithCommittedBoardItem:(id)a3 committedConnectionLineLayout:(id)a4 interactiveCanvasController:(id)a5
{
  uint64_t ObjCClassMetadata;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  void *v14;
  _QWORD *v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[5];
  _QWORD *v20;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = objc_msgSend(v11, "canvas");
  v13 = (_QWORD *)swift_allocObject(&unk_10127B720, 48, 7);
  v13[2] = v10;
  v13[3] = v11;
  v13[4] = v9;
  v13[5] = ObjCClassMetadata;
  v19[4] = sub_100757D20;
  v20 = v13;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = *(_QWORD *)"";
  v19[2] = sub_1005D2FC0;
  v19[3] = &unk_10127B738;
  v14 = _Block_copy(v19);
  v15 = v20;
  v16 = v9;
  v17 = v10;
  v18 = v11;
  objc_msgSend(v12, "afterLayoutIncludingLayers:performBlock:", 1, v14, swift_release(v15).n128_f64[0]);
  _Block_release(v14);

}

- (_TtC8Freeform27CRLInsertionAnimationHelper)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CRLInsertionAnimationHelper();
  return -[CRLInsertionAnimationHelper init](&v3, "init");
}

@end
