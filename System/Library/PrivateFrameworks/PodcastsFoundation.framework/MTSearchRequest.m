@implementation MTSearchRequest

- (MTSearchRequest)initWithTerm:(id)a3 contentTypes:(id)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = sub_1A93F8040();
  v6 = v5;
  v7 = sub_1A93F8310();
  return (MTSearchRequest *)SearchRequest.init(term:contentTypes:)(v4, v6, v7);
}

- (void)setLimit:(int64_t)a3
{
  char *v3;

  v3 = (char *)self + OBJC_IVAR___MTSearchRequest_limit;
  *(_QWORD *)v3 = a3;
  v3[8] = 0;
}

- (void)performWithCompletion:(id)a3
{
  void *v4;
  uint64_t v5;
  MTSearchRequest *v6;

  v4 = _Block_copy(a3);
  v5 = swift_allocObject();
  *(_QWORD *)(v5 + 16) = v4;
  v6 = self;
  sub_1A926217C((uint64_t)sub_1A90CAB4C, v5);

  swift_release();
}

- (MTSearchRequest)init
{
  MTSearchRequest *result;

  result = (MTSearchRequest *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end
