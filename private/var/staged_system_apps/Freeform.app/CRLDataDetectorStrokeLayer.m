@implementation CRLDataDetectorStrokeLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLCanvasDataDetectorStrokeRenderable, a2);
}

@end
