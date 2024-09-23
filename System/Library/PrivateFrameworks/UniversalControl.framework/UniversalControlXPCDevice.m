@implementation UniversalControlXPCDevice

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UniversalControlXPCDevice)initWithCoder:(id)a3
{
  id v3;
  UniversalControlXPCDevice *result;

  v3 = a3;
  UniversalControlXPCDevice.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UniversalControlXPCDevice *v5;

  v4 = a3;
  v5 = self;
  UniversalControlXPCDevice.encode(with:)((NSCoder)v4);

}

- (UniversalControlXPCDevice)init
{
  UniversalControlXPCDevice.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_57_0();
}

@end
