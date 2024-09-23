@implementation WebDarkSystemBackdropLayer

- (WebDarkSystemBackdropLayer)init
{
  WebDarkSystemBackdropLayer *v2;
  unint64_t v3;
  CGColorRef v4;
  objc_super v6;
  objc_super v7;
  char v8;
  char **v9;
  char *v10;
  CGFloat components[2];
  __int128 v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)WebDarkSystemBackdropLayer;
  v2 = -[WebDarkSystemBackdropLayer init](&v7, sel_init);
  if (v2)
  {
    *(_OWORD *)components = xmmword_1968DD118;
    v12 = unk_1968DD128;
    {
      WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace = 0;
    }
    v3 = atomic_load(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag);
    if (v3 != -1)
    {
      v10 = &v8;
      v9 = &v10;
      std::__call_once(&WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::onceFlag, &v9, (void (__cdecl *)(void *))std::__call_once_proxy[abi:sn180100]<std::tuple<CGColorSpace * WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::{lambda(void)#1} &&>>);
    }
    v4 = CGColorCreate((CGColorSpaceRef)WebCore::namedColorSpace<kCGColorSpaceSRGB>(void)::colorSpace, components);
    v6.receiver = v2;
    v6.super_class = (Class)WebDarkSystemBackdropLayer;
    -[WebDarkSystemBackdropLayer setBackgroundColor:](&v6, sel_setBackgroundColor_, v4);
    if (v4)
      CFRelease(v4);
  }
  return v2;
}

@end
