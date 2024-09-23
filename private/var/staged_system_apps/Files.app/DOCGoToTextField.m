@implementation DOCGoToTextField

- (_TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  char *v7;
  objc_super v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customPlaceholderColor) = 0;
  v7 = (char *)self + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customBlendMode;
  *(_DWORD *)v7 = 0;
  v7[4] = 1;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder) = 0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
  return -[DOCTokenTextField initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
}

- (NSArray)keyCommands
{
  _TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField *v2;
  uint64_t v3;
  NSArray v4;

  v2 = self;
  v3 = sub_10025AC08();

  if (v3)
  {
    sub_10004F2F0(0, &qword_1006445C0, UIKeyCommand_ptr);
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease(v3);
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSArray *)v4.super.isa;
}

- (UIResponder)nextResponder
{
  UIResponder *v3;
  _TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField *v4;
  UIResponder *v5;
  _TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField *v6;
  UIResponder *v7;
  objc_super v9;

  v3 = *(UIResponder **)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder);
  if (v3)
  {
    v4 = self;
    v5 = v3;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)type metadata accessor for DOCGoToTextField();
    v6 = self;
    v5 = -[DOCGoToTextField nextResponder](&v9, "nextResponder");
  }
  v7 = v3;

  return v5;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_customPlaceholderColor));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5FilesP33_EBE2DA6178484455F79AECAF4845EF6C16DOCGoToTextField_coresponder));
}

@end
