@implementation ForceDoubleZerosDateComponentsFormatter

- (id)stringFromTimeInterval:(double)a3
{
  id v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  v4 = v10.receiver;
  v5 = -[NSDateComponentsFormatter stringFromTimeInterval:](&v10, sel_stringFromTimeInterval_, a3);
  if (v5)
  {
    v6 = sub_1A9CE82E0();
    v8 = v7;

    sub_1A9C0D818(v6, v8);
    swift_bridgeObjectRelease();
    v5 = (id)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
  }
  else
  {

  }
  return v5;
}

- (id)stringFromDateComponents:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter *v9;
  void *v10;
  objc_class *v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  void *v16;
  objc_super v18;

  v4 = sub_1A9CE60C0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4, v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1A9CE6024();
  v9 = self;
  v10 = (void *)sub_1A9CE6018();
  v11 = (objc_class *)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  v18.receiver = v9;
  v18.super_class = v11;
  v12 = -[NSDateComponentsFormatter stringFromDateComponents:](&v18, sel_stringFromDateComponents_, v10);

  if (v12)
  {
    v13 = sub_1A9CE82E0();
    v15 = v14;

    sub_1A9C0D818(v13, v15);
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    v16 = (void *)sub_1A9CE82B0();
    swift_bridgeObjectRelease();
    return v16;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
    return 0;
  }
}

- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  return -[NSDateComponentsFormatter init](&v3, sel_init);
}

- (_TtC13SleepHealthUI39ForceDoubleZerosDateComponentsFormatter)initWithCoder:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ForceDoubleZerosDateComponentsFormatter();
  return -[NSDateComponentsFormatter initWithCoder:](&v5, sel_initWithCoder_, a3);
}

@end
