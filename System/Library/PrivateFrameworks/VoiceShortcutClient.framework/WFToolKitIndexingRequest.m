@implementation WFToolKitIndexingRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  WFToolKitIndexingRequest *v5;

  v4 = a3;
  v5 = self;
  sub_1AF6CD95C(v4);

}

- (WFToolKitIndexingRequest)initWithCoder:(id)a3
{
  return (WFToolKitIndexingRequest *)ToolKitIndexingRequest.init(coder:)(a3);
}

- (NSString)debugDescription
{
  WFToolKitIndexingRequest *v2;
  void *v3;

  v2 = self;
  sub_1AF6CDD4C();

  v3 = (void *)sub_1AF76A558();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (WFToolKitIndexingRequest)init
{
  ToolKitIndexingRequest.init()();
}

- (void).cxx_destruct
{
  uint64_t v2;
  uint64_t v3;

  v2 = OUTLINED_FUNCTION_18_7();
  OUTLINED_FUNCTION_49_2(v2);
  v3 = OUTLINED_FUNCTION_138();
  OUTLINED_FUNCTION_49_2(v3);
  swift_bridgeObjectRelease();
}

@end
