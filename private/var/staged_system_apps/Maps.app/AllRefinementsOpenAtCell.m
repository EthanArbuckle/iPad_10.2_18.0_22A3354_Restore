@implementation AllRefinementsOpenAtCell

+ (NSString)reuseIdentifier
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSString v5;
  uint64_t ObjCClassMetadata;

  ObjCClassMetadata = swift_getObjCClassMetadata(a1);
  v2 = sub_100008B04(&qword_1014A0AD8);
  String.init<A>(describing:)(&ObjCClassMetadata, v2);
  v4 = v3;
  v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease(v4);
  return (NSString *)v5;
}

- (id)dateSelectionHandler
{
  uint64_t v2;
  void *v3;
  _QWORD v5[6];

  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler))
    return 0;
  v2 = *(_QWORD *)&self->$__lazy_storage_$_openAtLabel[OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler];
  v5[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v5[5] = v2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 1107296256;
  v5[2] = sub_100204BCC;
  v5[3] = &unk_1011ABF50;
  v3 = _Block_copy(v5);
  swift_retain();
  swift_release();
  return v3;
}

- (void)setDateSelectionHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void (*v6)(char, double);
  void (**v7)(char, double);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_1011ABF38, 24, 7);
    v4[2] = v5;
    v6 = sub_100205C48;
  }
  else
  {
    v6 = 0;
  }
  v7 = (void (**)(char, double))((char *)self
                                          + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v8 = *(_QWORD *)&self->$__lazy_storage_$_openAtLabel[OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler];
  *v7 = v6;
  v7[1] = (void (*)(char, double))v4;
  sub_10000BF74(v9, v8);
}

- (_TtC4Maps24AllRefinementsOpenAtCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _QWORD *v8;
  objc_class *v9;
  _TtC4Maps24AllRefinementsOpenAtCell *v10;
  objc_super v12;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker) = 0;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v9 = (objc_class *)type metadata accessor for AllRefinementsOpenAtCell();
  *v8 = 0;
  v8[1] = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[AllRefinementsOpenAtCell initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  sub_100204CAC();

  return v10;
}

- (_TtC4Maps24AllRefinementsOpenAtCell)initWithCoder:(id)a3
{
  _QWORD *v5;
  objc_class *v6;
  objc_super v8;

  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker) = 0;
  v5 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler);
  v6 = (objc_class *)type metadata accessor for AllRefinementsOpenAtCell();
  *v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return -[AllRefinementsOpenAtCell initWithCoder:](&v8, "initWithCoder:", a3);
}

- (void)updatedContentsWithTime:(double)a3 displayName:(id)a4 openAtSelected:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _TtC4Maps24AllRefinementsOpenAtCell *v11;

  v5 = a5;
  v8 = static String._unconditionallyBridgeFromObjectiveC(_:)(a4);
  v10 = v9;
  v11 = self;
  sub_100205454(a3, v8, v10, v5);

  swift_bridgeObjectRelease(v10);
}

- (void)datePickedValueChanged:(id)a3
{
  id v4;
  _TtC4Maps24AllRefinementsOpenAtCell *v5;

  v4 = a3;
  v5 = self;
  sub_1002056D0(v4);

}

- (void)datePickerTapped:(id)a3
{
  id v4;
  _TtC4Maps24AllRefinementsOpenAtCell *v5;

  v4 = a3;
  v5 = self;
  sub_10020572C(v4);

}

- (void)shouldEnableControl:(BOOL)a3
{
  _BOOL8 v3;
  _TtC4Maps24AllRefinementsOpenAtCell *v4;
  id v5;
  id v6;

  v3 = a3;
  v4 = self;
  v5 = sub_100204970();
  objc_msgSend(v5, "setEnabled:", v3);

  v6 = sub_1002049F4();
  objc_msgSend(v6, "setUserInteractionEnabled:", v3);

}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___openAtLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell____lazy_storage___datePicker));
  sub_10000BF74(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler), *(_QWORD *)&self->$__lazy_storage_$_openAtLabel[OBJC_IVAR____TtC4Maps24AllRefinementsOpenAtCell_dateSelectionHandler]);
}

@end
