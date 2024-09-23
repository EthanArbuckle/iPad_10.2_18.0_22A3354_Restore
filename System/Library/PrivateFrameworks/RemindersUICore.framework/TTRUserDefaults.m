@implementation TTRUserDefaults

- (_TtC15RemindersUICore15TTRUserDefaults)init
{
  objc_class *ObjectType;
  uint64_t v4;
  _TtC15RemindersUICore15TTRUserDefaults *v5;
  objc_super v7;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = OBJC_IVAR____TtC15RemindersUICore15TTRUserDefaults_userDefaults;
  v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)_s15RemindersUICore15TTRUserDefaultsC04userD033_39AC9311353E6C87A3BD9840BFFEE925LLSo06NSUserD0CSgvpfi_0();
  *(Class *)((char *)&v5->super.isa + OBJC_IVAR____TtC15RemindersUICore15TTRUserDefaults_observers) = (Class)MEMORY[0x1E0DEE9E0];

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return -[TTRUserDefaults init](&v7, sel_init);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  id v12;
  _TtC15RemindersUICore15TTRUserDefaults *v13;
  id v14;
  _TtC15RemindersUICore15TTRUserDefaults *v15;
  _OWORD v16[2];

  if (a3)
  {
    v9 = sub_1B4906A64();
    v11 = v10;
    if (a4)
      goto LABEL_3;
LABEL_6:
    memset(v16, 0, sizeof(v16));
    v14 = a5;
    v15 = self;
    if (!a5)
      goto LABEL_7;
    goto LABEL_4;
  }
  v9 = 0;
  v11 = 0;
  if (!a4)
    goto LABEL_6;
LABEL_3:
  swift_unknownObjectRetain();
  v12 = a5;
  v13 = self;
  sub_1B4907C4C();
  swift_unknownObjectRelease();
  if (a5)
  {
LABEL_4:
    type metadata accessor for NSKeyValueChangeKey(0);
    sub_1B41E11F0(&qword_1EF099550, (uint64_t (*)(uint64_t))type metadata accessor for NSKeyValueChangeKey, (uint64_t)&unk_1B4911C00);
    sub_1B4906818();

  }
LABEL_7:
  _s15RemindersUICore15TTRUserDefaultsC12observeValue10forKeyPath2of6change7contextySSSg_ypSgSDySo05NSKeyf6ChangeH0aypGSgSvSgtF_0(v9, v11, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B41EA560((uint64_t)v16, &qword_1ED4ED170);
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

}

@end
