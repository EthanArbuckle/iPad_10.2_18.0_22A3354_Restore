@implementation SceneMetricsRequest

- (_TtC15SiriInteractive23SceneItemMetricsRequest)lockScreenMetrics
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)sub_24645FCE8();
}

- (void)setLockScreenMetrics:(id)a3
{
  id v4;
  _TtC15SiriInteractive19SceneMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_24645FD40(v4);

}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithLockScreenMetrics:(id)a3
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(lockScreenMetrics:)((uint64_t)a3);
}

- (int64_t)hash
{
  _TtC15SiriInteractive19SceneMetricsRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_24645FF5C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC15SiriInteractive19SceneMetricsRequest *v4;
  _TtC15SiriInteractive19SceneMetricsRequest *v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_2464825FC();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  v6 = sub_24645FFA4((uint64_t)v8);

  sub_24645E148((uint64_t)v8);
  return v6 & 1;
}

- (NSString)description
{
  _TtC15SiriInteractive19SceneMetricsRequest *v2;
  void *v3;

  v2 = self;
  sub_246460174();

  v3 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(xpcDictionary:)();
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC15SiriInteractive19SceneMetricsRequest *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_246460370((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (id)copyWithZone:(void *)a3
{
  _TtC15SiriInteractive19SceneMetricsRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2464603E8(v6);

  __swift_project_boxed_opaque_existential_0(v6, v6[3]);
  v4 = (void *)sub_246482758();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC15SiriInteractive19SceneMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_2464604C4(v4);

}

- (_TtC15SiriInteractive19SceneMetricsRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive19SceneMetricsRequest *)SceneMetricsRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive19SceneMetricsRequest)init
{
  SceneMetricsRequest.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SiriInteractive19SceneMetricsRequest__lockScreenMetrics));
}

@end
