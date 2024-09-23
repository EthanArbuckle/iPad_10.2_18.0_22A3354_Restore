@implementation TSSPropertySet

uint64_t __48__TSSPropertySet_enumeratePropertiesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)containsProperties:(id)a3
{
  if (a3 && *((_QWORD *)a3 + 1))
    return objc_msgSend(self->mIndexSet, "containsIndexes:");
  else
    return 1;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSPropertySet;
  -[TSSPropertySet dealloc](&v3, sel_dealloc);
}

- (void)enumeratePropertiesUsingBlock:(id)a3
{
  id mIndexSet;
  _QWORD v4[5];

  mIndexSet = self->mIndexSet;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__TSSPropertySet_enumeratePropertiesUsingBlock___block_invoke;
  v4[3] = &unk_24D82B230;
  v4[4] = a3;
  objc_msgSend(mIndexSet, "enumerateIndexesUsingBlock:", v4);
}

- (id)propertySetByAddingPropertiesFromSet:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(self->mIndexSet, "mutableCopy");
  objc_msgSend(v4, "addIndexes:", *((_QWORD *)a3 + 1));
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);
}

- (TSSPropertySet)initWithProperties:(int)a3
{
  uint64_t v4;

  return -[TSSPropertySet initWithFirstProperty:argumentList:](self, "initWithFirstProperty:argumentList:", *(_QWORD *)&a3, &v4);
}

- (TSSPropertySet)initWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  return -[TSSPropertySet initWithIndexSet:](self, "initWithIndexSet:", (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(_QWORD *)&a3, a4), "copy"));
}

+ (id)p_mutableIndexSetWithFirstProperty:(int)a3 argumentList:(char *)a4
{
  void *i;
  char *v5;
  int v6;

  if (!a3)
    goto LABEL_6;
  for (i = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndex:", a3); ; objc_msgSend(i, "addIndex:", v6))
  {
    v5 = a4;
    a4 += 8;
    v6 = *(_DWORD *)v5;
    if (!v6)
      break;
  }
  if (!i)
LABEL_6:
    i = (void *)objc_opt_new();
  return i;
}

+ (id)propertySet
{
  objc_opt_class();
  return (id)objc_opt_new();
}

- (TSSPropertySet)initWithIndexSet:(id)a3
{
  TSSPropertySet *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSSPropertySet;
  v4 = -[TSSPropertySet init](&v6, sel_init);
  if (v4)
    v4->mIndexSet = a3;
  return v4;
}

- (TSSPropertySet)init
{
  return -[TSSPropertySet initWithIndexSet:](self, "initWithIndexSet:", objc_msgSend(MEMORY[0x24BDD15E0], "indexSet"));
}

- (TSSPropertySet)initWithPropertySet:(id)a3
{
  return -[TSSPropertySet initWithIndexSet:](self, "initWithIndexSet:", (id)objc_msgSend(*((id *)a3 + 1), "copy"));
}

+ (id)propertySetWithProperty:(int)a3
{
  return (id)objc_msgSend(a1, "propertySetWithProperties:", *(_QWORD *)&a3, 0);
}

+ (id)propertySetWithProperties:(int)a3
{
  uint64_t v4;

  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFirstProperty:argumentList:", *(_QWORD *)&a3, &v4);
}

- (unint64_t)count
{
  return objc_msgSend(self->mIndexSet, "count");
}

- (BOOL)containsProperty:(int)a3
{
  return objc_msgSend(self->mIndexSet, "containsIndex:", a3);
}

- (BOOL)intersectsProperties:(id)a3
{
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  if (a3 && objc_msgSend(a3, "count"))
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __39__TSSPropertySet_intersectsProperties___block_invoke;
    v7[3] = &unk_24D82AEB0;
    v7[4] = a3;
    v7[5] = &v8;
    -[TSSPropertySet enumeratePropertiesUsingBlock:](self, "enumeratePropertiesUsingBlock:", v7);
  }
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __39__TSSPropertySet_intersectsProperties___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (id)propertySetByAddingProperties:(int)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(_QWORD *)&a3, &v6);
  objc_msgSend(v4, "addIndexes:", self->mIndexSet);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);
}

- (id)propertySetByAddingProperty:(int)a3
{
  id v4;

  v4 = (id)objc_msgSend(self->mIndexSet, "mutableCopy");
  objc_msgSend(v4, "addIndex:", a3);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);
}

- (id)propertySetByRemovingProperty:(int)a3
{
  id v4;

  v4 = (id)objc_msgSend(self->mIndexSet, "mutableCopy");
  objc_msgSend(v4, "removeIndex:", a3);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);
}

- (id)propertySetByRemovingProperties:(int)a3
{
  uint64_t v4;
  id v5;
  uint64_t v7;

  v4 = objc_msgSend((id)objc_opt_class(), "p_mutableIndexSetWithFirstProperty:argumentList:", *(_QWORD *)&a3, &v7);
  v5 = (id)objc_msgSend(self->mIndexSet, "mutableCopy");
  objc_msgSend(v5, "removeIndexes:", v4);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v5);
}

- (id)propertySetByRemovingPropertiesFromSet:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(self->mIndexSet, "mutableCopy");
  objc_msgSend(v4, "removeIndexes:", *((_QWORD *)a3 + 1));
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v4);
}

- (id)propertySetByIntersectingWithPropertySet:(id)a3
{
  unint64_t v5;
  _QWORD *p_isa;
  void *v7;
  unint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[6];

  v5 = -[TSSPropertySet count](self, "count");
  if (v5 >= objc_msgSend(a3, "count"))
    p_isa = a3;
  else
    p_isa = &self->super.isa;
  v7 = (void *)p_isa[1];
  v8 = -[TSSPropertySet count](self, "count");
  if (v8 >= objc_msgSend(a3, "count"))
    v9 = &self->super.isa;
  else
    v9 = a3;
  v10 = v9[1];
  v11 = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __59__TSSPropertySet_propertySetByIntersectingWithPropertySet___block_invoke;
  v13[3] = &unk_24D82B258;
  v13[4] = v10;
  v13[5] = v11;
  objc_msgSend(v7, "enumerateIndexesUsingBlock:", v13);
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIndexSet:", v11);
}

uint64_t __59__TSSPropertySet_propertySetByIntersectingWithPropertySet___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "addIndex:", a2);
  return result;
}

- (id)propertyStrings
{
  void *v3;
  _QWORD v5[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", -[TSSPropertySet count](self, "count"));
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__TSSPropertySet_propertyStrings__block_invoke;
  v5[3] = &unk_24D82AF28;
  v5[4] = v3;
  -[TSSPropertySet enumeratePropertiesUsingBlock:](self, "enumeratePropertiesUsingBlock:", v5);
  return v3;
}

uint64_t __33__TSSPropertySet_propertyStrings__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", String(a2));
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[TSSMutablePropertySet initWithPropertySet:]([TSSMutablePropertySet alloc], "initWithPropertySet:", self);
}

- (unint64_t)hash
{
  return objc_msgSend(self->mIndexSet, "hash");
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return objc_msgSend(self->mIndexSet, "isEqual:", *((_QWORD *)a3 + 1));
  else
    return 0;
}

@end
