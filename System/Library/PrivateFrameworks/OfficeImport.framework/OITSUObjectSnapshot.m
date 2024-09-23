@implementation OITSUObjectSnapshot

- (OITSUObjectSnapshot)init
{
  OITSUObjectSnapshot *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)OITSUObjectSnapshot;
  result = -[OITSUObjectSnapshot init](&v3, sel_init);
  if (result)
  {
    result->mEntryCount = 0;
    result->mSnapshot = 0;
    result->mCompared = 0;
  }
  return result;
}

- (void)calibrate:(id)a3
{
  unint64_t v5;
  unint64_t v6;
  objc_class *v7;
  size_t InstanceSize;

  -[OITSUObjectSnapshot p_clear](self, "p_clear");
  self->mCompared = (NSArray *)a3;
  v5 = objc_msgSend(a3, "count");
  self->mEntryCount = v5;
  if (a3)
  {
    if (v5)
    {
      self->mSnapshot = (void **)malloc_type_malloc(8 * v5, 0x80040B8603338uLL);
      if (self->mEntryCount)
      {
        v6 = 0;
        do
        {
          objc_msgSend(a3, "objectAtIndex:", v6);
          v7 = (objc_class *)objc_opt_class();
          InstanceSize = class_getInstanceSize(v7);
          self->mSnapshot[v6] = malloc_type_malloc(InstanceSize, 0x3484A610uLL);
          memcpy(self->mSnapshot[v6], (const void *)objc_msgSend(a3, "objectAtIndex:", v6), InstanceSize);
          ++v6;
        }
        while (v6 < self->mEntryCount);
      }
    }
  }
}

- (void)compare
{
  unint64_t v3;
  id v4;
  objc_class *Superclass;
  void *v6;
  Ivar *v7;
  unint64_t i;
  objc_ivar *v9;
  unsigned int outCount;

  if (self->mEntryCount)
  {
    v3 = 0;
    do
    {
      v4 = -[NSArray objectAtIndex:](self->mCompared, "objectAtIndex:", v3);
      Superclass = (objc_class *)objc_opt_class();
      v6 = self->mSnapshot[v3];
      do
      {
        outCount = 0;
        v7 = class_copyIvarList(Superclass, &outCount);
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            v9 = v7[i];
            object_getIvar(v6, v9);
            object_getIvar(v4, v9);
          }
        }
        free(v7);
        Superclass = class_getSuperclass(Superclass);
      }
      while (Superclass != (objc_class *)objc_opt_class());
      ++v3;
    }
    while (v3 < self->mEntryCount);
  }
}

- (void)p_clear
{
  unint64_t v3;

  if (self->mEntryCount)
  {
    v3 = 0;
    do
      free(self->mSnapshot[v3++]);
    while (v3 < self->mEntryCount);
  }

  self->mCompared = 0;
  free(self->mSnapshot);
  self->mSnapshot = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[OITSUObjectSnapshot p_clear](self, "p_clear");
  v3.receiver = self;
  v3.super_class = (Class)OITSUObjectSnapshot;
  -[OITSUObjectSnapshot dealloc](&v3, sel_dealloc);
}

@end
