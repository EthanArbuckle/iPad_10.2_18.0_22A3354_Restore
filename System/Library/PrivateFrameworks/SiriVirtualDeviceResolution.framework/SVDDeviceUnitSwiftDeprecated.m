@implementation SVDDeviceUnitSwiftDeprecated

+ (BOOL)supportsSecureCoding
{
  char v2;

  static SVDDeviceUnit.supportsSecureCoding.getter();
  return v2 & 1;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static SVDDeviceUnit.supportsSecureCoding.setter(a3);
}

- (SVDDeviceUnitSwiftDeprecated)initWithCoder:(id)a3
{
  return (SVDDeviceUnitSwiftDeprecated *)SVDDeviceUnit.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  SVDDeviceUnitSwiftDeprecated *v5;

  v4 = a3;
  v5 = self;
  sub_1C2ED7CCC();

}

- (BOOL)isEqual:(id)a3
{
  return sub_1C2ED8004(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_1C2ED7F28);
}

- (int64_t)hash
{
  SVDDeviceUnitSwiftDeprecated *v2;
  int64_t v3;

  v2 = self;
  v3 = sub_1C2ED80B0();

  return v3;
}

- (SVDDeviceUnitSwiftDeprecated)init
{
  SVDDeviceUnit.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_86();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_14_1();
  OUTLINED_FUNCTION_50_0();
}

@end
