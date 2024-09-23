@implementation OITSUMutablePointerSet

+ (Class)privateNonMutableClass
{
  return (Class)objc_opt_class();
}

+ (Class)privateMutableClass
{
  return (Class)objc_opt_class();
}

- (void)dealloc
{
  __CFSet *mSet;
  objc_super v4;

  mSet = self->mSet;
  if (mSet)
  {
    CFRelease(mSet);
    self->mSet = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)OITSUMutablePointerSet;
  -[OITSUMutablePointerSet dealloc](&v4, sel_dealloc);
}

- (OITSUMutablePointerSet)init
{
  objc_super v4;

  if (-[OITSUMutablePointerSet isMemberOfClass:](self, "isMemberOfClass:", objc_opt_class()))
    return -[OITSUMutablePointerSet initWithCapacity:](self, "initWithCapacity:", 0);
  v4.receiver = self;
  v4.super_class = (Class)OITSUMutablePointerSet;
  return -[OITSUMutablePointerSet init](&v4, sel_init);
}

- (OITSUMutablePointerSet)initWithCapacity:(unint64_t)a3
{
  OITSUMutablePointerSet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)OITSUMutablePointerSet;
  v4 = -[OITSUMutablePointerSet init](&v6, sel_init);
  if (v4)
    v4->mSet = CFSetCreateMutable(0, a3, 0);
  return v4;
}

- (OITSUMutablePointerSet)initWithObjects:(const void *)a3 count:(unint64_t)a4
{
  unint64_t v4;
  OITSUMutablePointerSet *v6;
  const void *v7;

  v4 = a4;
  v6 = -[OITSUMutablePointerSet initWithCapacity:](self, "initWithCapacity:", a4);
  if (v6 && v4)
  {
    do
    {
      v7 = *a3++;
      CFSetAddValue(v6->mSet, v7);
      --v4;
    }
    while (v4);
  }
  return v6;
}

- (OITSUMutablePointerSet)initWithCFSet:(__CFSet *)a3
{
  OITSUMutablePointerSet *v4;
  objc_super v6;

  if (!a3)
    return -[OITSUMutablePointerSet initWithCapacity:](self, "initWithCapacity:");
  v6.receiver = self;
  v6.super_class = (Class)OITSUMutablePointerSet;
  v4 = -[OITSUMutablePointerSet init](&v6, sel_init);
  if (v4)
    v4->mSet = CFSetCreateMutableCopy(0, 0, a3);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass")), "initWithCFSet:", self->mSet);
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_msgSend((id)objc_opt_class(), "privateMutableClass")), "initWithCFSet:", self->mSet);
}

- (unint64_t)count
{
  return CFSetGetCount(self->mSet);
}

- (id)member:(id)a3
{
  void *value;

  value = 0;
  if (!a3)
    return 0;
  if (CFSetGetValueIfPresent(self->mSet, a3, (const void **)&value))
    return value;
  return 0;
}

- (id)objectEnumerator
{
  return -[OITSUCFSetEnumerator initWithCFSet:]([OITSUCFSetEnumerator alloc], "initWithCFSet:", self->mSet);
}

- (void)addObject:(id)a3
{
  CFSetAddValue(self->mSet, a3);
}

- (void)removeObject:(id)a3
{
  CFSetRemoveValue(self->mSet, a3);
}

- (void)removeAllObjects
{
  CFSetRemoveAllValues(self->mSet);
}

- (void)getObjects:(id *)a3
{
  CFIndex Count;

  Count = CFSetGetCount(self->mSet);
  if (a3)
  {
    if (Count)
      CFSetGetValues(self->mSet, (const void **)a3);
  }
}

- (id)allObjects
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  const void **v6;
  CFArrayRef v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = -[OITSUMutablePointerSet count](self, "count");
  v4 = v3;
  if (v3 >= 0x41)
    v5 = 1;
  else
    v5 = v3;
  v6 = (const void **)((char *)v9 - ((8 * v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3 >= 0x41)
  {
    v6 = (const void **)malloc_type_malloc(8 * v3, 0x80040B8603338uLL);
    if (!v6)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v4);
  }
  -[OITSUMutablePointerSet getObjects:](self, "getObjects:", v6);
  v7 = CFArrayCreate(0, v6, v4, 0);
  if (v4 >= 0x41)
    free(v6);
  return (id)(id)CFMakeCollectable(v7);
}

- (id)setByAddingObject:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[OITSUMutablePointerSet count](self, "count");
  v6 = v5;
  v7 = v5 + 1;
  v8 = 1;
  if (v5 + 1 < 0x41)
    v8 = v5 + 1;
  v9 = (char *)v12 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v7);
  }
  -[OITSUMutablePointerSet getObjects:](self, "getObjects:", v9);
  *(_QWORD *)&v9[8 * v6] = a3;
  v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41)
    free(v9);
  return v10;
}

- (id)setByAddingObjectsFromSet:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = -[OITSUMutablePointerSet count](self, "count");
  v6 = objc_msgSend(a3, "count");
  v7 = v6 + v5;
  if (v6 + v5 >= 0x41)
    v8 = 1;
  else
    v8 = v6 + v5;
  v9 = (char *)&v17 - ((8 * v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v7 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v7);
  }
  -[OITSUMutablePointerSet getObjects:](self, "getObjects:", v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a3, "getObjects:", &v9[8 * v5]);
  }
  else
  {
    v19 = 0u;
    v20 = 0u;
    v18 = 0u;
    v17 = 0u;
    v10 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = &v9[8 * v5];
      v13 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v13)
            objc_enumerationMutation(a3);
          *(_QWORD *)v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          v12 += 8;
        }
        v11 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }
  }
  v15 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41)
    free(v9);
  return v15;
}

- (id)setByAddingObjectsFromArray:(id)a3
{
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v5 = -[OITSUMutablePointerSet count](self, "count");
  v6 = objc_msgSend(a3, "count");
  v7 = v6 + v5;
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v12 - v8;
  if (v6 + v5 >= 0x41)
  {
    v9 = (char *)malloc_type_malloc(8 * v7, 0x80040B8603338uLL);
    if (!v9)
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCB70], CFSTR("*** attempt to create a temporary id buffer of length (%lu) failed"), v7);
  }
  -[OITSUMutablePointerSet getObjects:](self, "getObjects:", v9);
  objc_msgSend(a3, "getObjects:range:", &v9[8 * v5], 0, v6);
  v10 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "privateNonMutableClass"), "setWithObjects:count:", v9, v7);
  if (v7 >= 0x41)
    free(v9);
  return v10;
}

@end
