@implementation AirQualityScaleProxyResponse

+ (BOOL)supportsSecureCoding
{
  return static AirQualityScaleProxyResponse.supportsSecureCoding.getter() & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static AirQualityScaleProxyResponse.supportsSecureCoding.setter(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _TtC13WeatherDaemon28AirQualityScaleProxyResponse *v5;

  v4 = a3;
  v5 = self;
  AirQualityScaleProxyResponse.encode(with:)((NSCoder)v4);

}

- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)initWithCoder:(id)a3
{
  return (_TtC13WeatherDaemon28AirQualityScaleProxyResponse *)AirQualityScaleProxyResponse.init(coder:)(a3);
}

- (_TtC13WeatherDaemon28AirQualityScaleProxyResponse)init
{
  AirQualityScaleProxyResponse.init()();
}

- (void).cxx_destruct
{
  _QWORD v3[22];

  sub_1A62D246C((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon28AirQualityScaleProxyResponse_scale, (uint64_t)v3, &qword_1ED219A00);
  sub_1A62D2028(v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))sub_1A62D208C);
  sub_1A62B130C((uint64_t)self + OBJC_IVAR____TtC13WeatherDaemon28AirQualityScaleProxyResponse_error);
  OUTLINED_FUNCTION_11_27();
}

@end
