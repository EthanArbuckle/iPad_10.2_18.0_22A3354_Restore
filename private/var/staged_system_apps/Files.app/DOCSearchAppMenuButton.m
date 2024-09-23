@implementation DOCSearchAppMenuButton

- (_TtC5Files22DOCSearchAppMenuButton)initWithCoder:(id)a3
{
  id v4;
  _TtC5Files22DOCSearchAppMenuButton *result;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files22DOCSearchAppMenuButton_attachedMenu) = 0;
  v4 = a3;

  result = (_TtC5Files22DOCSearchAppMenuButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0, 0xE000000000000000, "Files/DOCSearchAppMenuButton.swift", 34, 2, 15, 0);
  __break(1u);
  return result;
}

- (_TtC5Files22DOCSearchAppMenuButton)init
{
  _TtC5Files22DOCSearchAppMenuButton *v2;
  objc_super v4;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC5Files22DOCSearchAppMenuButton_attachedMenu) = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  v2 = -[DOCSearchAppMenuButton initWithFrame:](&v4, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[DOCSearchAppMenuButton setPointerInteractionEnabled:](v2, "setPointerInteractionEnabled:", 1);
  return v2;
}

- (UIMenu)menu
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  return -[DOCSearchAppMenuButton menu](&v3, "menu");
}

- (void)setMenu:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCSearchAppMenuButton();
  -[DOCSearchAppMenuButton setMenu:](&v4, "setMenu:", a3);
}

- (_TtC5Files22DOCSearchAppMenuButton)initWithFrame:(CGRect)a3
{
  _TtC5Files22DOCSearchAppMenuButton *result;

  result = (_TtC5Files22DOCSearchAppMenuButton *)_swift_stdlib_reportUnimplementedInitializer("Files.DOCSearchAppMenuButton", 28, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files22DOCSearchAppMenuButton_attachedMenu));
}

@end
