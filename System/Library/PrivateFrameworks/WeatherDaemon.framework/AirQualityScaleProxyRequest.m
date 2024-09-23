@implementation AirQualityScaleProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static AirQualityScaleProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AirQualityScaleProxyRequest.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon27AirQualityScaleProxyRequest *v5;

  v4 = a3;
  v5 = self;
  AirQualityScaleProxyRequest.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon27AirQualityScaleProxyRequest *)AirQualityScaleProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon27AirQualityScaleProxyRequest)init
{
  AirQualityScaleProxyRequest.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A62B6F18((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon27AirQualityScaleProxyRequest_options);
}

@end
