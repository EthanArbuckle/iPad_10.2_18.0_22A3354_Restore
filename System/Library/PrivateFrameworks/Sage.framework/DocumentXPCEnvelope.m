@implementation DocumentXPCEnvelope

- (NSURL)_url
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  void *v6;
  uint64_t v8;

  v2 = sub_2457BAA68();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24575BD88((uint64_t)v5);
  v6 = (void *)sub_2457BAA44();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (NSURL *)v6;
}

- (void)set_url:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  _TtC4Sage19DocumentXPCEnvelope *v7;
  uint64_t v8;

  v4 = sub_2457BAA68();
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2457BAA5C();
  v7 = self;
  sub_24575BE6C((uint64_t)v6);

}

- (NSData)_bookmark
{
  return (NSData *)sub_24575D080((uint64_t)self, (uint64_t)a2, sub_24575BEE4);
}

- (void)set_bookmark:(id)a3
{
  sub_2457594DC(self, (uint64_t)a2, a3, &OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__bookmark);
}

+ (BOOL)supportsSecureCoding
{
  char v2;

  static DocumentXPCEnvelope.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static DocumentXPCEnvelope.supportsSecureCoding.setter(a3);
}

- (_TtC4Sage19DocumentXPCEnvelope)initWithCoder:(id)a3
{
  id v3;
  _TtC4Sage19DocumentXPCEnvelope *result;

  v3 = a3;
  DocumentXPCEnvelope.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC4Sage19DocumentXPCEnvelope *v5;

  v4 = a3;
  v5 = self;
  DocumentXPCEnvelope.encode(with:)((NSCoder)v4);

}

- (_TtC4Sage19DocumentXPCEnvelope)init
{
  DocumentXPCEnvelope.init()();
}

- (void).cxx_destruct
{
  char *v3;
  uint64_t v4;

  v3 = (char *)self + OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__url;
  v4 = sub_245767BB4();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  sub_24574E14C(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__bookmark), *(_QWORD *)&self->_anon_0[OBJC_IVAR____TtC4Sage19DocumentXPCEnvelope__bookmark]);
}

@end
