@implementation CRLiOSMiniFormatterTextBuilder

- (void).cxx_destruct
{
  void *v3;

  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_dataProvider));
  v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_textSizeManager);
  swift_bridgeObjectRelease(*(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_textSizeManager]);

  sub_1004C1024(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_closeButtonClosure), *(_QWORD *)&self->super.presenter[OBJC_IVAR____TtC8Freeform30CRLiOSMiniFormatterTextBuilder_closeButtonClosure]);
}

- (void)fontPickerViewControllerDidPickFont:(id)a3
{
  id v4;
  _TtC8Freeform30CRLiOSMiniFormatterTextBuilder *v5;

  v4 = a3;
  v5 = self;
  sub_1004FF388(v4);

}

- (void)fontPickerViewControllerDidCancel:(id)a3
{
  char *v5;
  uint64_t Strong;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _TtC8Freeform30CRLiOSMiniFormatterTextBuilder *v10;
  uint64_t ObjectType;

  v5 = (char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter;
  Strong = swift_unknownObjectWeakLoadStrong((char *)self + OBJC_IVAR____TtC8Freeform26CRLiOSMiniFormatterBuilder_presenter);
  if (Strong)
  {
    v7 = Strong;
    v8 = *((_QWORD *)v5 + 2);
    v9 = a3;
    v10 = self;
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 1, 0);
    ObjectType = swift_getObjectType(v7);
    (*(void (**)(id, uint64_t, uint64_t))(v8 + 40))(v9, ObjectType, v8);

    swift_unknownObjectRelease(v7);
  }
}

@end
