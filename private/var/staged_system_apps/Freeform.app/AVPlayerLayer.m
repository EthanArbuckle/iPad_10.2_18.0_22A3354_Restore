@implementation AVPlayerLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class(CRLAVPlayerRenderable, a2);
}

@end
