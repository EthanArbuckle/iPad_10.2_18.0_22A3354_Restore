@implementation CRLUSDRenderingCoreRESharedTextureHandle

- (CRLUSDRenderingCoreRESharedTextureHandle)initWithCoder:(id)a3
{
  return (CRLUSDRenderingCoreRESharedTextureHandle *)sub_10004D484(a3);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  CRLUSDRenderingCoreRESharedTextureHandle *v6;
  NSString v7;

  v4 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CRLUSDRenderingCoreRESharedTextureHandle_handle);
  v5 = a3;
  v6 = self;
  v7 = String._bridgeToObjectiveC()();
  objc_msgSend(v5, "encodeObject:forKey:", v4, v7);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CRLUSDRenderingCoreRESharedTextureHandle)init
{
  CRLUSDRenderingCoreRESharedTextureHandle *result;

  result = (CRLUSDRenderingCoreRESharedTextureHandle *)_swift_stdlib_reportUnimplementedInitializer("USDRendererExtension.SharedTextureHandle", 40, "init()", 6, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{

}

@end
