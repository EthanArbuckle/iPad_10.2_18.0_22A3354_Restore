@implementation WeatherDataProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static WeatherDataProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static WeatherDataProxyResponse.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon24WeatherDataProxyResponse *v5;

  v4 = a3;
  v5 = self;
  WeatherDataProxyResponse.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon24WeatherDataProxyResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC13WeatherDaemon24WeatherDataProxyResponse *)WeatherDataProxyResponse.init(coder:)();
}

- (_TtC13WeatherDaemon24WeatherDataProxyResponse)init
{
  WeatherDataProxyResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A62B130C((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon24WeatherDataProxyResponse_error);
}

@end
