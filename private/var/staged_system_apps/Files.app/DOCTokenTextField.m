@implementation DOCTokenTextField

- (UIFont)font
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCTokenTextField();
  return -[DOCTokenTextField font](&v3, "font");
}

- (void)setFont:(id)a3
{
  id v4;
  id v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCTokenTextField();
  v4 = a3;
  v5 = v11.receiver;
  -[DOCTokenTextField setFont:](&v11, "setFont:", v4);
  v6 = (char *)sub_10033BC84();
  v7 = objc_msgSend(v5, "font", v11.receiver, v11.super_class);
  v8 = *(void **)&v6[OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_font];
  *(_QWORD *)&v6[OBJC_IVAR____TtC5FilesP33_D8D362724F0696B48319604C3F2D1F0417DOCTokenChainView_font] = v7;
  v9 = v7;

  v10 = v6;
  sub_10034016C(v10, (uint64_t)v10);

}

- (NSString)text
{
  id v2;
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  NSString v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCTokenTextField();
  v2 = v9.receiver;
  v3 = -[DOCTokenTextField text](&v9, "text");
  if (v3)
  {
    v4 = v3;
    static String._unconditionallyBridgeFromObjectiveC(_:)(v3);
    v6 = v5;

    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v6);
    return (NSString *)v7;
  }
  else
  {

    return (NSString *)0;
  }
}

- (void)setText:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  _TtC5Files17DOCTokenTextField *v6;
  NSString v7;
  _TtC5Files17DOCTokenTextField *v8;
  objc_super v9;

  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v5 = v4;
    v6 = self;
    v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease(v5);
  }
  else
  {
    v8 = self;
    v7 = 0;
  }
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCTokenTextField();
  -[DOCTokenTextField setText:](&v9, "setText:", v7);

  sub_10033C46C();
}

- (_TtC5Files17DOCTokenTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v8;
  _TtC5Files17DOCTokenTextField *v9;
  objc_super v11;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = (char *)self + OBJC_IVAR____TtC5Files17DOCTokenTextField_dataSource;
  *((_QWORD *)v8 + 1) = 0;
  swift_unknownObjectWeakInit(v8);
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___tokenChainView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___tokenContainerContainerView) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___suggestionLabel) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCTokenTextField();
  v9 = -[DOCTokenTextField initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  sub_10033C088();

  return v9;
}

- (_TtC5Files17DOCTokenTextField)initWithCoder:(id)a3
{
  return (_TtC5Files17DOCTokenTextField *)sub_10033EFD4(a3);
}

- (void)selectAll:(id)a3
{
  sub_10033FD90(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_10033F080);
}

- (NSArray)keyCommands
{
  return (NSArray *)sub_10033F198(self, (uint64_t)a2, sub_10033F208);
}

- (BOOL)canPerformAction:(SEL)a3 withSender:(id)a4
{
  _TtC5Files17DOCTokenTextField *v7;
  uint64_t v8;
  _TtC5Files17DOCTokenTextField *v9;
  char v10;
  _OWORD v12[2];

  if (a4)
  {
    v7 = self;
    v8 = swift_unknownObjectRetain(a4);
    _bridgeAnyObjectToAny(_:)(v12, v8);
    swift_unknownObjectRelease(a4);
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v9 = self;
  }
  v10 = sub_10033F470((uint64_t)a3, (uint64_t)v12);

  sub_10007EB54((uint64_t)v12);
  return v10 & 1;
}

- (CGRect)textRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10033F7EC(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_textRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)editingRectForBounds:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  v3 = sub_10033F7EC(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, (SEL *)&selRef_editingRectForBounds_);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (void)deleteBackward
{
  _TtC5Files17DOCTokenTextField *v2;

  v2 = self;
  sub_10033F86C();

}

- (void)directionKeyCommand
{
  -[DOCTokenTextField fieldEditorDidChangeSelection:](self, "fieldEditorDidChangeSelection:", 0);
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textDidChange:(id)a3
{
  id v4;
  _TtC5Files17DOCTokenTextField *v5;

  v4 = a3;
  v5 = self;
  sub_1003403E4();

}

- (void)fieldEditorDidChangeSelection:(id)a3
{
  sub_10033FD90(self, (uint64_t)a2, (uint64_t)a3, (void (*)(_OWORD *, __n128))sub_10033FC44);
}

- (void).cxx_destruct
{
  sub_10008F5C0((uint64_t)self + OBJC_IVAR____TtC5Files17DOCTokenTextField_dataSource);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___tokenChainView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___tokenContainerContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files17DOCTokenTextField____lazy_storage___suggestionLabel));
}

@end
