@implementation OITSUMutableRetainedPointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (OITSUMutableRetainedPointerSet)init
{
  objc_super v4;

  if (-[OITSUMutableRetainedPointerSet isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return -[OITSUMutableRetainedPointerSet initWithCapacity:](self, "initWithCapacity:", 0);
  v4.receiver = self;
  v4.super_class = (Class)OITSUMutableRetainedPointerSet;
  return -[OITSUMutablePointerSet init](&v4, sel_init);
}

- (OITSUMutableRetainedPointerSet)initWithCapacity:(unint64_t)a3
{
  OITSUMutableRetainedPointerSet *v4;
  CFStringRef (__cdecl *v5)(const void *);
  CFSetCallBacks v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)OITSUMutableRetainedPointerSet;
  v4 = -[OITSUMutablePointerSet init](&v8, sel_init);
  if (v4)
  {
    v7.version = 0;
    *(_OWORD *)&v7.retain = *(_OWORD *)(MEMORY[0x24BDBD6B8] + 8);
    v5 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x24BDBD6B8] + 24);
    v7.equal = 0;
    v7.hash = 0;
    v7.copyDescription = v5;
    v4->super.mSet = CFSetCreateMutable(0, a3, &v7);
  }
  return v4;
}

- (id)allObjects
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[OITSUMutablePointerSet count](self, "count");
  v4 = v3;
  if (v3 >= 0x41)
    v5 = 1;
  else
    v5 = v3;
  v6 = (char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v3 >= 0x41)
  {
    v6 = (char *)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v4);
  }
  -[OITSUMutablePointerSet getObjects:](self, "getObjects:", v6);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, v4);
  if (v4 >= 0x41)
    free(v6);
  return v7;
}

@end
