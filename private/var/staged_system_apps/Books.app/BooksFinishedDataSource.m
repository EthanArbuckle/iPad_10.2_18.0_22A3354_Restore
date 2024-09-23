@implementation BooksFinishedDataSource

- (_TtC5Books23BooksFinishedDataSource)init
{
  _TtC5Books23BooksFinishedDataSource *result;

  result = (_TtC5Books23BooksFinishedDataSource *)_swift_stdlib_reportUnimplementedInitializer("Books.BooksFinishedDataSource", 29, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10002AD00(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange), *(_QWORD *)&self->onChange[OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange]);

  swift_bridgeObjectRelease(*(Class *)((char *)&self->super.isa
                                     + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_sortDescriptors));

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  void (*v4)(uint64_t);
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _TtC5Books23BooksFinishedDataSource *v11;

  v4 = *(void (**)(uint64_t))((char *)&self->super.isa
                                      + OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange);
  if (v4)
  {
    v7 = *(_QWORD *)&self->onChange[OBJC_IVAR____TtC5Books23BooksFinishedDataSource_onChange];
    v8 = a3;
    v9 = a4;
    v11 = self;
    v10 = sub_10002ACF0((uint64_t)v4, v7);
    v4(v10);
    sub_10002AD00((uint64_t)v4, v7);

  }
}

@end
