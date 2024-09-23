@implementation WeatherDataProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static WeatherDataProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static WeatherDataProxyRequest.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon23WeatherDataProxyRequest *v5;

  v4 = a3;
  v5 = self;
  WeatherDataProxyRequest.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon23WeatherDataProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon23WeatherDataProxyRequest *)WeatherDataProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon23WeatherDataProxyRequest)init
{
  WeatherDataProxyRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A62B6F18((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon23WeatherDataProxyRequest_options);
}

@end
