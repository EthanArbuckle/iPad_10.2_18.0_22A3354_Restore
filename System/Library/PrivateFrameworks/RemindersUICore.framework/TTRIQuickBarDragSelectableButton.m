@implementation TTRIQuickBarDragSelectableButton

- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  _TtC15RemindersUICore32TTRIQuickBarDragSelectableButton *v8;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  *(_QWORD *)((char *)&self->super.super.super.super._responderFlags
            + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_draggingSession) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for TTRIQuickBarDragSelectableButton();
  v8 = -[TTRIQuickBarDragSelectableButton initWithFrame:](&v10, sel_initWithFrame_, x, y, width, height);
  -[TTRIQuickBarDragSelectableButton setMultipleTouchEnabled:](v8, sel_setMultipleTouchEnabled_, 0);
  return v8;
}

- (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore32TTRIQuickBarDragSelectableButton *)sub_1B43EE670(a3);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC15RemindersUICore32TTRIQuickBarDragSelectableButton *v6;

  v5 = a4;
  v6 = self;
  sub_1B43EEC04();

}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_1B43EE86C(self, (uint64_t)a2, (uint64_t)a3, a4, sub_1B43EED3C);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  sub_1B43EE86C(self, (uint64_t)a2, (uint64_t)a3, a4, (void (*)(uint64_t))sub_1B43EEF18);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v5;
  _TtC15RemindersUICore32TTRIQuickBarDragSelectableButton *v6;

  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_draggingSession) = 0;
  v5 = a4;
  v6 = self;
  swift_release();
  -[TTRIQuickBarDragSelectableButton setHighlighted:](v6, sel_setHighlighted_, 0);
  -[TTRIQuickBarDragSelectableButton setSelected:](v6, sel_setSelected_, 0);

}

- (void).cxx_destruct
{
  sub_1B41F4748((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore32TTRIQuickBarDragSelectableButton_delegate);
  swift_release();
}

@end
