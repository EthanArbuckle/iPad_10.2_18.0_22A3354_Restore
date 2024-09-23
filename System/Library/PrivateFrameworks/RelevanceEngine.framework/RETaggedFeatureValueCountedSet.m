@implementation RETaggedFeatureValueCountedSet

- (RETaggedFeatureValueCountedSet)init
{
  RETaggedFeatureValueCountedSet *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RETaggedFeatureValueCountedSet;
  v2 = -[RETaggedFeatureValueCountedSet init](&v4, sel_init);
  if (v2)
    v2->_bag = CFBagCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &kTaggedFeatureValueCallbacks_0);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  CFRelease(self->_bag);
  v3.receiver = self;
  v3.super_class = (Class)RETaggedFeatureValueCountedSet;
  -[RETaggedFeatureValueCountedSet dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return CFHash(self->_bag);
}

- (BOOL)isEqual:(id)a3
{
  RETaggedFeatureValueCountedSet *v4;
  BOOL v5;

  v4 = (RETaggedFeatureValueCountedSet *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0 && CFEqual(self->_bag, v4->_bag) != 0;
  }

  return v5;
}

- (unint64_t)count
{
  JUMPOUT(0x2199B18C4);
}

- (unint64_t)countForFeatureValue:(unint64_t)a3
{
  JUMPOUT(0x2199B18D0);
}

- (BOOL)containsFeatureValue:(unint64_t)a3
{
  return CFBagContainsValue(self->_bag, (const void *)a3) != 0;
}

- (void)addFeatureValue:(unint64_t)a3
{
  CFBagAddValue(self->_bag, (const void *)a3);
}

- (void)removeFeatureValue:(unint64_t)a3
{
  CFBagRemoveValue(self->_bag, (const void *)a3);
}

- (void)enumerateFeatureValuesUsingBlock:(id)a3
{
  id v4;
  RETaggedFeatureValueCountedSet *v5;
  RETaggedFeatureValueCountedSet *v6;
  _QWORD v7[4];
  RETaggedFeatureValueCountedSet *v8;
  id v9;
  id context;
  uint64_t v11;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init(RETaggedFeatureValueCountedSet);
    v11 = 0;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __67__RETaggedFeatureValueCountedSet_enumerateFeatureValuesUsingBlock___block_invoke;
    v7[3] = &unk_24CF8DB78;
    v6 = v5;
    v8 = v6;
    v9 = v4;
    context = (id)MEMORY[0x2199B2434](v7);
    LOBYTE(v11) = 0;
    CFBagApplyFunction(self->_bag, (CFBagApplierFunction)kTaggedFeatureCFApplier, &context);

  }
}

uint64_t __67__RETaggedFeatureValueCountedSet_enumerateFeatureValuesUsingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsFeatureValue:", a2);
  if ((result & 1) == 0)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    return objc_msgSend(*(id *)(a1 + 32), "addFeatureValue:", a2);
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  CFTypeRef *v4;

  v4 = (CFTypeRef *)objc_opt_new();
  CFRelease(v4[1]);
  v4[1] = CFBagCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, self->_bag);
  return v4;
}

@end
