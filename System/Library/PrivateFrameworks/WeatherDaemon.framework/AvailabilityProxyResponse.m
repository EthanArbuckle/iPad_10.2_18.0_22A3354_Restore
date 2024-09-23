@implementation AvailabilityProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static AvailabilityProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AvailabilityProxyResponse.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon25AvailabilityProxyResponse *v5;

  v4 = a3;
  v5 = self;
  AvailabilityProxyResponse.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon25AvailabilityProxyResponse)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  return (_TtC13WeatherDaemon25AvailabilityProxyResponse *)AvailabilityProxyResponse.init(coder:)();
}

- (_TtC13WeatherDaemon25AvailabilityProxyResponse)init
{
  AvailabilityProxyResponse.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1A62B130C((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon25AvailabilityProxyResponse_error);
}

@end
