@implementation AvailabilityProxyRequest

+ (BOOL)supportsSecureCoding
{
  return static AvailabilityProxyRequest.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AvailabilityProxyRequest.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon24AvailabilityProxyRequest *v5;

  v4 = a3;
  v5 = self;
  AvailabilityProxyRequest.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon24AvailabilityProxyRequest)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon24AvailabilityProxyRequest *)AvailabilityProxyRequest.init(coder:)(a3);
}

- (_TtC13WeatherDaemon24AvailabilityProxyRequest)init
{
  AvailabilityProxyRequest.init()();
}

- (void).cxx_destruct
{
  sub_1A62B6F18((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon24AvailabilityProxyRequest_options);
}

@end
