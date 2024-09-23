@implementation SceneItemMetricsRequest

- (_TtC15SiriInteractive20SizeDimensionRequest)widthRequest
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)sub_2464656AC();
}

- (void)setWidthRequest:(id)a3
{
  id v4;
  _TtC15SiriInteractive23SceneItemMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_246465700(v4);

}

- (_TtC15SiriInteractive20SizeDimensionRequest)heightRequest
{
  return (_TtC15SiriInteractive20SizeDimensionRequest *)sub_2464657A8();
}

- (void)setHeightRequest:(id)a3
{
  id v4;
  _TtC15SiriInteractive23SceneItemMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_2464657FC(v4);

}

- (double)cornerRadius
{
  return sub_246465970();
}

- (void)setCornerRadius:(double)a3
{
  sub_2464659CC(a3);
}

- (CGSize)initialSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_246465A80();
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)maximumSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = sub_246465AFC();
  result.height = v3;
  result.width = v2;
  return result;
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithWidth:(id)a3 height:(id)a4 cornerRadius:(double)a5
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(width:height:cornerRadius:)(a3, a4, a5);
}

- (BOOL)isValid
{
  return sub_246465CE0();
}

- (int64_t)hash
{
  _TtC15SiriInteractive23SceneItemMetricsRequest *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_246465E1C();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _TtC15SiriInteractive23SceneItemMetricsRequest *v4;
  _TtC15SiriInteractive23SceneItemMetricsRequest *v5;
  BOOL v6;
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
  v6 = sub_246465F2C((uint64_t)v8);

  sub_24645E148((uint64_t)v8);
  return v6;
}

- (NSString)description
{
  _TtC15SiriInteractive23SceneItemMetricsRequest *v2;
  void *v3;

  v2 = self;
  sub_246466120();

  v3 = (void *)sub_2464823E0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  _TtC15SiriInteractive23SceneItemMetricsRequest *v5;

  swift_unknownObjectRetain();
  v5 = self;
  sub_246466210((uint64_t)a3);
  swift_unknownObjectRelease();

}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithXPCDictionary:(id)a3
{
  swift_unknownObjectRetain();
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(xpcDictionary:)();
}

- (id)copyWithZone:(void *)a3
{
  _TtC15SiriInteractive23SceneItemMetricsRequest *v3;
  void *v4;
  _QWORD v6[4];

  v3 = self;
  sub_2464664B0(v6);

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
  _TtC15SiriInteractive23SceneItemMetricsRequest *v5;

  v4 = a3;
  v5 = self;
  sub_2464665AC(v4);

}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)initWithCoder:(id)a3
{
  return (_TtC15SiriInteractive23SceneItemMetricsRequest *)SceneItemMetricsRequest.init(coder:)(a3);
}

- (_TtC15SiriInteractive23SceneItemMetricsRequest)init
{
  SceneItemMetricsRequest.init()();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__widthRequest));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15SiriInteractive23SceneItemMetricsRequest__heightRequest));
}

@end
