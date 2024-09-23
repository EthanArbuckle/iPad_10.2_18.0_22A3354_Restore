@implementation UndoButton

- (UIControl)undoButton
{
  return (UIControl *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR____TtC7Measure10UndoButton_undoButton));
}

- (void)setUndoButton:(id)a3
{
  id v3;
  id v4;

  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton) = (Class)a3;
  v3 = a3;

}

- (_TtC7Measure10UndoButton)initWithCoder:(id)a3
{
  char *v5;
  id v6;
  _TtC7Measure10UndoButton *result;

  v5 = (char *)self + OBJC_IVAR____TtC7Measure10UndoButton_delegate;
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_undoButton) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_isEnabled) = 0;
  *((_BYTE *)&self->super.super.super.isa + OBJC_IVAR____TtC7Measure10UndoButton_controlType) = 0;
  v6 = a3;

  result = (_TtC7Measure10UndoButton *)_assertionFailure(_:_:file:line:flags:)("Fatal error", 11, 2, 0xD000000000000025, 0x80000001003D8190, "Measure/UndoButton.swift", 24, 2, 55, 0);
  __break(1u);
  return result;
}

- (_TtC7Measure10UndoButton)initWithFrame:(CGRect)a3
{
  _TtC7Measure10UndoButton *result;

  result = (_TtC7Measure10UndoButton *)_swift_stdlib_reportUnimplementedInitializer("Measure.UndoButton", 18, "init(frame:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001ADF4((uint64_t)self + OBJC_IVAR____TtC7Measure10UndoButton_delegate);

}

- (void)undoFrom:(id)a3
{
  id v4;
  uint64_t v5;
  _TtC7Measure10UndoButton *v6;

  v4 = a3;
  v6 = self;
  sub_1001C9EA4((uint64_t)v6, v5);

}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  id v6;
  id v7;
  _TtC7Measure10UndoButton *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_100083160();

  return v9;
}

@end
