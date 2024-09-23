@implementation UniversalControlXPCEdgeRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UniversalControlXPCEdgeRegion)initWithCoder:(id)a3
{
  id v3;
  UniversalControlXPCEdgeRegion *result;

  v3 = a3;
  UniversalControlXPCEdgeRegion.init(coder:)();
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  UniversalControlXPCEdgeRegion *v5;

  v4 = a3;
  v5 = self;
  UniversalControlXPCEdgeRegion.encode(with:)((NSCoder)v4);

}

- (UniversalControlXPCEdgeRegion)init
{
  UniversalControlXPCEdgeRegion.init()();
}

- (void).cxx_destruct
{
  OUTLINED_FUNCTION_57_0();
}

@end
