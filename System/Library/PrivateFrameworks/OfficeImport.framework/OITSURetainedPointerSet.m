@implementation OITSURetainedPointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (OITSURetainedPointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  OITSURetainedPointerSet *v6;
  CFStringRef (__cdecl *v7)(const void *);
  CFSetCallBacks v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)OITSURetainedPointerSet;
  v6 = -[OITSURetainedPointerSet init](&v10, sel_init);
  if (v6)
  {
    v9.version = 0;
    *(_OWORD *)&v9.retain = *(_OWORD *)(MEMORY[0x24BDBD6B8] + 8);
    v7 = *(CFStringRef (__cdecl **)(const void *))(MEMORY[0x24BDBD6B8] + 24);
    v9.equal = 0;
    v9.hash = 0;
    v9.copyDescription = v7;
    v6->super.mSet = CFSetCreate(0, a3, a4, &v9);
  }
  return v6;
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
  v3 = -[OITSUPointerSet count](self, "count");
  if (!v3)
    return (id)objc_msgSend(MEMORY[0x24BDBCE30], "array");
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
  -[OITSUPointerSet getObjects:](self, "getObjects:", v6);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, v4);
  if (v4 >= 0x41)
    free(v6);
  return v7;
}

@end
