@implementation PaginationQueue

- (_TtC8BookEPUB15PaginationQueue)init
{
  return (_TtC8BookEPUB15PaginationQueue *)PaginationQueue.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC8BookEPUB15PaginationQueue_log;
  v4 = type metadata accessor for Logger(0);
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
}

@end
