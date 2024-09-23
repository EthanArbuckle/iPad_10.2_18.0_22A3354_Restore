@implementation ScrollOffsetObserver

- (void)_observeScrollViewDidScroll:(id)a3
{
  void (*v4)(void);
  id v5;
  _TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver *v6;

  v4 = *(void (**)(void))((char *)&self->super.isa
                        + OBJC_IVAR____TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver_scrollViewDidScroll);
  v5 = a3;
  v6 = self;
  v4();

}

- (_TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver)init
{
  _TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver *result;

  result = (_TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver *)_swift_stdlib_reportUnimplementedInitializer("Reminders.ScrollOffsetObserver", 30, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release(*(_QWORD *)&self->scrollViewDidScroll[OBJC_IVAR____TtC9RemindersP33_F0C3DF1C7E2DDC19EDE9BABCDF547B2B20ScrollOffsetObserver_scrollViewDidScroll]);
}

@end
