@implementation ICTagOperatorCell

- (id)selectionChangeHandler
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];
  uint64_t v7;

  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler))
    return 0;
  v2 = *(_QWORD *)&self->selectionChangeHandler[OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler];
  v6[4] = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                   + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  v7 = v2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 1107296256;
  v6[2] = sub_1002489AC;
  v6[3] = &unk_1005667A0;
  v3 = _Block_copy(v6);
  v4 = v7;
  swift_retain(v2);
  swift_release(v4);
  return v3;
}

- (void)setSelectionChangeHandler:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t (*v6)(uint64_t);
  uint64_t (**v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;

  v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = v4;
    v4 = (_QWORD *)swift_allocObject(&unk_100566788, 24, 7);
    v4[2] = v5;
    v6 = sub_10022AA34;
  }
  else
  {
    v6 = 0;
  }
  v7 = (uint64_t (**)(uint64_t))((char *)self + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  v9 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  v8 = *(_QWORD *)&self->selectionChangeHandler[OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler];
  *v7 = v6;
  v7[1] = (uint64_t (*)(uint64_t))v4;
  sub_100012C50(v9, v8);
}

- (ICTagSelection)tagSelection
{
  return (ICTagSelection *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                                   + OBJC_IVAR___ICTagOperatorCell_tagSelection));
}

- (void)setTagSelection:(id)a3
{
  void *v4;
  ICTagOperatorCell *v5;
  id v6;

  v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection) = (Class)a3;
  v6 = a3;
  v5 = self;

  sub_1002E2DD4();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  ICTagOperatorCell *v9;
  uint64_t v10;

  v5 = type metadata accessor for UICellConfigurationState(0, a2);
  v6 = *(_QWORD *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v10 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)(a3);
  v9 = self;
  sub_1002E2F48((uint64_t)v8);

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (ICTagOperatorCell)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_class *ObjectType;
  _QWORD *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType(self);
  v9 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler);
  *v9 = 0;
  v9[1] = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + OBJC_IVAR___ICTagOperatorCell_tagSelection) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___menu) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___anyAction) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR___ICTagOperatorCell____lazy_storage___allAction) = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[ICTagOperatorCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (ICTagOperatorCell)initWithCoder:(id)a3
{
  return (ICTagOperatorCell *)sub_1002E3B78(a3);
}

- (void).cxx_destruct
{
  sub_100012C50(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa+ OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler), *(_QWORD *)&self->selectionChangeHandler[OBJC_IVAR___ICTagOperatorCell_selectionChangeHandler]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell_tagSelection));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell____lazy_storage___menu));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell____lazy_storage___anyAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR___ICTagOperatorCell____lazy_storage___allAction));
}

@end
