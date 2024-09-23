@implementation CRLScenesPopoverState

- (_TtC8Freeform21CRLScenesPopoverState)init
{
  return (_TtC8Freeform21CRLScenesPopoverState *)sub_10087D654();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  void (*v11)(char *, uint64_t);

  swift_release(*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState_objectDidChange));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__sceneInfos;
  v4 = sub_1004B804C(&qword_1013F67F8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__sceneThumbnailImageSizeAspectRatio;
  v6 = sub_1004B804C(&qword_1013F67F0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__activeScene;
  v8 = sub_1004B804C(&qword_1013F67E8);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = (char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__isReadOnly;
  v10 = sub_1004B804C(&qword_10140B9D0);
  v11 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v10 - 8) + 8);
  v11(v9, v10);
  v11((char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__isCurrentlyEditing, v10);
  v11((char *)self + OBJC_IVAR____TtC8Freeform21CRLScenesPopoverState__toggleToUpdateSceneThumbnails, v10);
}

@end
