@implementation UniContext

- (UniContext)init
{
  const char *v2;
  uint64_t v3;
  UniContext *v4;
  uint64_t v5;
  NSPointerArray *weakArray;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UniContext;
  v4 = -[UniContext init](&v8, sel_init);
  if (v4)
  {
    objc_msgSend_strongObjectsPointerArray(MEMORY[0x24BDD1748], v2, v3);
    v5 = objc_claimAutoreleasedReturnValue();
    weakArray = v4->weakArray;
    v4->weakArray = (NSPointerArray *)v5;

  }
  return v4;
}

- (id)renderOrder
{
  return self->weakArray;
}

- (void)empty
{
  const char *v3;
  uint64_t v4;
  char isKindOfClass;
  NSPointerArray *weakArray;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;

  if (self->weakArray)
  {
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    weakArray = self->weakArray;
    if ((isKindOfClass & 1) != 0)
    {
      v9 = objc_msgSend_count(weakArray, v3, v4);
      weakArray = self->weakArray;
      if (v9)
      {
        v11 = objc_msgSend_count(weakArray, v7, v8) - 1;
        do
          objc_msgSend_removePointerAtIndex_(self->weakArray, v10, v11--);
        while (v11 != -1);
        weakArray = self->weakArray;
      }
    }
  }
  else
  {
    weakArray = 0;
  }
  self->weakArray = 0;

}

- (void)dealloc
{
  uint64_t v2;
  objc_super v4;

  objc_msgSend_empty(self, a2, v2);
  v4.receiver = self;
  v4.super_class = (Class)UniContext;
  -[UniContext dealloc](&v4, sel_dealloc);
}

- (NSPointerArray)weakArray
{
  return (NSPointerArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setWeakArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->weakArray, 0);
}

@end
