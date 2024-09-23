@implementation DIPTopekaWebService

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);

  v3 = (char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_redirectRetrier;
  v4 = type metadata accessor for DIPRetrier(0);
  v5 = *(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_authRetrier, v4);
  v5((char *)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_retrier, v4);
  sub_10001D07C((uint64_t)self + OBJC_IVAR____TtC8coreidvd19DIPTopekaWebService_selfHealer);
}

@end
