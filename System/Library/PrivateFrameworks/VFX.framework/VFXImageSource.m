@implementation VFXImageSource

- (id)textureSource
{
  NSString *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = NSStringFromSelector(a2);
  sub_1B17C4408(16, (uint64_t)CFSTR("Error: VFXImageSource astract method invoked %@"), v3, v4, v5, v6, v7, v8, (uint64_t)v2);
  return 0;
}

- (BOOL)isOpaque
{
  return 1;
}

- (BOOL)isPremultiplied
{
  return 1;
}

- (void)connectToProxy:(__CFXImageProxy *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD v15[2];

  sub_1B181F31C((uint64_t)a3, self, 0, v3, v4, v5, v6, v7);
  v15[0] = xmmword_1E63D80C8;
  v15[1] = *(_OWORD *)&off_1E63D80D8;
  sub_1B181F3A4((uint64_t)a3, (uint64_t)v15, v9, v10, v11, v12, v13, v14);
}

@end
