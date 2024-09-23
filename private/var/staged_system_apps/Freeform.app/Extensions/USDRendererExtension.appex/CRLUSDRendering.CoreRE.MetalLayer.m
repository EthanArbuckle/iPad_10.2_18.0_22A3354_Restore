@implementation CRLUSDRendering.CoreRE.MetalLayer

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)init
{
  return (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer *)sub_1000475A8();
}

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithCoder:(id)a3
{
  id v3;

  v3 = a3;
  sub_100048C34();
}

+ (id)defaultActionForKey:(id)a3
{
  return objc_msgSend(objc_allocWithZone((Class)NSNull), "init");
}

- (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer)initWithLayer:(id)a3
{
  _TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer *result;
  _QWORD v5[4];

  swift_unknownObjectRetain(a3);
  _bridgeAnyObjectToAny(_:)(v5, a3);
  swift_unknownObjectRelease(a3);
  result = (_TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer *)_swift_stdlib_reportUnimplementedInitializer("USDRendererExtension.MetalLayer", 31, "init(layer:)", 12, 0);
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100034528(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(uint64_t *)((char *)&self->super._priv+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData), *(_QWORD *)&self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData], *(void **)&self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_textureData+ 8]);
  swift_release(*(Class *)((char *)&self->super.super.super.isa
                         + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_frameNumber));
  sub_100048C08(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext), *(uint64_t *)((char *)&self->super._priv+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_metalContext));
  sub_100048738(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState), *(uint64_t *)((char *)&self->super._priv+ OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState), self->textureData[OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_signalState]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCOO20USDRendererExtension15CRLUSDRendering6CoreRE10MetalLayer_listener));
}

@end
