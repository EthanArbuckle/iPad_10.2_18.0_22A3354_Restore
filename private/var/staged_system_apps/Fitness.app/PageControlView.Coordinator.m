@implementation PageControlView.Coordinator

- (void)updateCurrentPageWithSender:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _TtCV10FitnessApp15PageControlView11Coordinator *v9;
  uint64_t v10;
  _QWORD v11[4];

  v5 = *(_QWORD *)&self->control[OBJC_IVAR____TtCV10FitnessApp15PageControlView11Coordinator_control];
  v6 = *(_QWORD *)&self->control[OBJC_IVAR____TtCV10FitnessApp15PageControlView11Coordinator_control + 8];
  v7 = *(_QWORD *)&self->control[OBJC_IVAR____TtCV10FitnessApp15PageControlView11Coordinator_control + 16];
  swift_retain(v5);
  swift_retain(v6);
  v8 = a3;
  v9 = self;
  v11[1] = v5;
  v11[2] = v6;
  v11[3] = v7;
  v11[0] = objc_msgSend(v8, "currentPage");
  v10 = sub_100047110(&qword_100823EE8);
  Binding.wrappedValue.setter(v11, v10);

  swift_release(v6);
  swift_release(v5);
}

- (_TtCV10FitnessApp15PageControlView11Coordinator)init
{
  _TtCV10FitnessApp15PageControlView11Coordinator *result;

  result = (_TtCV10FitnessApp15PageControlView11Coordinator *)_swift_stdlib_reportUnimplementedInitializer("FitnessApp.Coordinator", 22, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v2;

  v2 = *(_QWORD *)&self->control[OBJC_IVAR____TtCV10FitnessApp15PageControlView11Coordinator_control];
  swift_release(*(_QWORD *)&self->control[OBJC_IVAR____TtCV10FitnessApp15PageControlView11Coordinator_control + 8]);
  swift_release(v2);
}

@end
