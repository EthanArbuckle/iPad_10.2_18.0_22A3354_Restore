@implementation TSSPropertyMap

- (float)floatValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (int)intValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (id)objectForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (id)boxedObjectForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (void)setIntValue:(int)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (void)setBoolValue:(BOOL)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (void)setBoxedObject:(id)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (BOOL)containsProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (void)setFloatValue:(float)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;

  v4 = (_QWORD *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  if (v4)
  {
    v4[1] = String((uint64_t)self->mStore);
    if (!self->mStore)
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  String(self->mStore);
  v3.receiver = self;
  v3.super_class = (Class)TSSPropertyMap;
  -[TSSPropertyMap dealloc](&v3, sel_dealloc);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  double v5;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
    LOBYTE(v4) = String((unint64_t *)self->mStore, *(unint64_t **)(v4 + 8), v5);
  return v4;
}

- (unint64_t)count
{
  return String((uint64_t)self->mStore);
}

- (void)removeValuesFromPropertyMap:(id)a3
{
  double v3;

  if (a3)
    String((unint64_t *)self->mStore, *((uint64_t **)a3 + 1), v3);
}

- (TSSPropertyMap)initWithPropertyMap:(id)a3
{
  TSSPropertyMap *v4;
  unint64_t *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSSPropertyMap;
  v4 = -[TSSPropertyMap init](&v7, sel_init);
  if (v4)
  {
    if (a3)
    {
      v5 = String(*((_QWORD *)a3 + 1));
      v4->mStore = (TSSPropertyStore *)v5;
      if (!v5)
      {

        return 0;
      }
    }
    else
    {
      v4->mStore = (TSSPropertyStore *)String();
    }
  }
  return v4;
}

- (void)setObject:(id)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (TSSPropertyMap)initWithPropertiesAndValues:(int)a3
{
  uint64_t v4;

  return -[TSSPropertyMap initWithFirstKey:andArgumentList:](self, "initWithFirstKey:andArgumentList:", *(_QWORD *)&a3, &v4);
}

+ (id)propertyMapWithPropertiesAndValues:(int)a3
{
  uint64_t v4;

  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithFirstKey:andArgumentList:", *(_QWORD *)&a3, &v4);
}

- (TSSPropertyMap)initWithFirstKey:(int)a3 andArgumentList:(char *)a4
{
  uint64_t v5;
  TSSPropertyMap *v6;
  TSSPropertyStore *PropertyAndArgumentList;
  objc_super v9;

  v5 = *(_QWORD *)&a3;
  v9.receiver = self;
  v9.super_class = (Class)TSSPropertyMap;
  v6 = -[TSSPropertyMap init](&v9, sel_init);
  if (v6)
  {
    PropertyAndArgumentList = (TSSPropertyStore *)i_TSSPropertyStoreCreateWithFirstPropertyAndArgumentList(v5, (void **)a4);
    v6->mStore = PropertyAndArgumentList;
    if (!PropertyAndArgumentList)
    {

      return 0;
    }
  }
  return v6;
}

+ (id)propertyMap
{
  return objc_alloc_init((Class)a1);
}

- (TSSPropertyMap)init
{
  TSSPropertyMap *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSSPropertyMap;
  v2 = -[TSSPropertyMap init](&v4, sel_init);
  if (v2)
    v2->mStore = (TSSPropertyStore *)String();
  return v2;
}

- (id)propertyMapByRemovingValuesForProperties:(id)a3
{
  id v4;
  void *v5;
  _QWORD v7[5];

  v4 = (id)-[TSSPropertyMap copy](self, "copy");
  v5 = v4;
  if (a3)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __59__TSSPropertyMap_propertyMapByRemovingValuesForProperties___block_invoke;
    v7[3] = &unk_24D82AF28;
    v7[4] = v4;
    objc_msgSend(a3, "enumeratePropertiesUsingBlock:", v7);
  }
  return v5;
}

- (id)allProperties
{
  unint64_t v3;
  char *v4;
  id v5;
  uint64_t v6;
  unsigned int v7;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v3 = String((uint64_t)self->mStore);
  v4 = (char *)v10 - ((4 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = +[TSSPropertySet propertySet](TSSMutablePropertySet, "propertySet");
  String(self->mStore, (uint64_t)v4);
  if (v3)
  {
    v6 = 0;
    v7 = 1;
    do
    {
      objc_msgSend(v5, "addProperty:", *(unsigned int *)&v4[4 * v6]);
      v6 = v7;
    }
    while (v3 > v7++);
  }
  return v5;
}

uint64_t __59__TSSPropertyMap_propertyMapByRemovingValuesForProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeValueForProperty:", a2);
}

- (void)removeValueForProperty:(int)a3
{
  String((unint64_t *)self->mStore, a3);
}

+ (id)propertyMapWithPropertyMap:(id)a3
{
  return (id)objc_msgSend(a3, "copy");
}

- (unint64_t)hash
{
  return (unint64_t)String(self->mStore);
}

- (id)allKeys
{
  unint64_t v3;
  char *v4;
  uint64_t v5;
  unsigned int v6;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = String((uint64_t)self->mStore);
  v4 = (char *)v9 - ((8 * v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  String(self->mStore, (uint64_t)v9);
  if (v3)
  {
    v5 = 0;
    v6 = 1;
    do
    {
      *(_QWORD *)&v4[8 * v5] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", *(unsigned int *)((char *)v9 + 4 * v5 - ((4 * v3 + 15) & 0xFFFFFFFFFFFFFFF0)));
      v5 = v6;
    }
    while (v3 > v6++);
  }
  return (id)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, v3);
}

- (void)p_getAllKeys:(int *)a3
{
  String(self->mStore, (uint64_t)a3);
}

- (id)old_description
{
  void *v3;
  objc_class *v4;
  NSString *v5;

  if (!self)
    return &stru_24D82FEB0;
  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("(%@*)%p {\n%@\n}"), v5, self, objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByIndentingString:", String((uint64_t *)self->mStore)));
}

- (void)enumeratePropertiesAndObjectsUsingBlock:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = -[TSSPropertyMap allProperties](self, "allProperties");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__TSSPropertyMap_enumeratePropertiesAndObjectsUsingBlock___block_invoke;
  v6[3] = &unk_24D82AE40;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "enumeratePropertiesUsingBlock:", v6);
}

uint64_t __58__TSSPropertyMap_enumeratePropertiesAndObjectsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = *(_QWORD *)(a1 + 40);
  v7 = String(a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v6 + 16))(v6, a2, v7, objc_msgSend(*(id *)(a1 + 32), "boxedObjectForProperty:", a2), a3);
}

- (NSString)description
{
  void *v3;
  _QWORD v5[5];

  if (!self)
    return (NSString *)&stru_24D82FEB0;
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __29__TSSPropertyMap_description__block_invoke;
  v5[3] = &unk_24D82AE68;
  v5[4] = v3;
  -[TSSPropertyMap enumeratePropertiesAndObjectsUsingBlock:](self, "enumeratePropertiesAndObjectsUsingBlock:", v5);
  objc_msgSend(v3, "sortUsingComparator:", &__block_literal_global_19);
  return (NSString *)objc_msgSend((id)objc_msgSend(v3, "componentsJoinedByString:", CFSTR("$")), "tsu_stringByExpandingTableFormatting");
}

uint64_t __29__TSSPropertyMap_description__block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;

  v6 = *(void **)(a1 + 32);
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = String(a2);
  v9 = p_summaryFromPropertyValue(0, a4);
  v10 = CFSTR("int");
  switch(a3)
  {
    case 0:
      v10 = (const __CFString *)TSUObjectReferenceDescription();
      break;
    case 1:
      return objc_msgSend(v6, "addObject:", objc_msgSend(v7, "stringWithFormat:", CFSTR("%@|%@|%@"), v8, v9, v10));
    case 2:
      v10 = CFSTR("float");
      break;
    case 3:
      v10 = CFSTR("double");
      break;
    default:
      v10 = &stru_24D82FEB0;
      break;
  }
  return objc_msgSend(v6, "addObject:", objc_msgSend(v7, "stringWithFormat:", CFSTR("%@|%@|%@"), v8, v9, v10));
}

uint64_t __29__TSSPropertyMap_description__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (double)doubleValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (double)CGFloatValueForProperty:(int)a3
{
  return String((size_t *)self->mStore, a3);
}

- (void)setDoubleValue:(double)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (void)setCGFloatValue:(double)a3 forProperty:(int)a4
{
  String((size_t *)self->mStore, *(uint64_t *)&a4, a3);
}

- (void)addValuesFromPropertyMap:(id)a3
{
  if (a3)
    String((uint64_t *)self->mStore, *((int64_t **)a3 + 1));
}

- (BOOL)containsAnyPropertyInProperties:(id)a3
{
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __50__TSSPropertyMap_containsAnyPropertyInProperties___block_invoke;
  v5[3] = &unk_24D82AEB0;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(a3, "enumeratePropertiesUsingBlock:", v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

BOOL __50__TSSPropertyMap_containsAnyPropertyInProperties___block_invoke(uint64_t a1, unsigned __int16 a2, _BYTE *a3)
{
  _BOOL8 result;

  result = String(*(size_t **)(*(_QWORD *)(a1 + 32) + 8), a2);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

- (void)removeValuesForProperties:(id)a3
{
  size_t v5;
  unint64_t v6;
  _BYTE *v7;
  _QWORD v8[6];
  _QWORD v9[4];
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "count");
  if (v5)
  {
    v6 = v5;
    if (v5 < 0x21)
    {
      v7 = v10;
    }
    else
    {
      v7 = malloc_type_calloc(v5, 4uLL, 0x100004052888210uLL);
      if (!v7)
        return;
    }
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __44__TSSPropertyMap_removeValuesForProperties___block_invoke;
    v8[3] = &unk_24D82AED8;
    v8[4] = v9;
    v8[5] = v7;
    objc_msgSend(a3, "enumeratePropertiesUsingBlock:", v8);
    String((unint64_t *)self->mStore, (uint64_t)v7, v6);
    if (v7 != v10)
      free(v7);
    _Block_object_dispose(v9, 8);
  }
}

uint64_t __44__TSSPropertyMap_removeValuesForProperties___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

- (void)removeAllPropertyValues
{
  String((unint64_t *)self->mStore);
}

- (void)filterWithProperties:(id)a3
{
  id v5;
  id v6;
  _QWORD v7[6];

  v5 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v6 = -[TSSPropertyMap allProperties](self, "allProperties");
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __39__TSSPropertyMap_filterWithProperties___block_invoke;
  v7[3] = &unk_24D82AF00;
  v7[4] = a3;
  v7[5] = self;
  objc_msgSend(v6, "enumeratePropertiesUsingBlock:", v7);

}

void __39__TSSPropertyMap_filterWithProperties___block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "containsProperty:", a2) & 1) == 0)
    String(*(unint64_t **)(*(_QWORD *)(a1 + 40) + 8), v2);
}

- (void)minusPropertyMap:(id)a3
{
  double v3;

  if (a3)
    String((unint64_t *)self->mStore, *((uint64_t **)a3 + 1), v3);
}

- (id)diff:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = TSUObjectReferenceDescription();
  v7 = TSUObjectReferenceDescription();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("\nDiff %@ vs. %@:\n%@\n"), v6, v7, String(self->mStore, *((_QWORD **)a3 + 1), 1));
}

- (id)diffOnlyDifferences:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = TSUObjectReferenceDescription();
  v7 = TSUObjectReferenceDescription();
  return (id)objc_msgSend(v5, "stringWithFormat:", CFSTR("\nDiff %@ vs. %@:\n%@\n"), v6, v7, String(self->mStore, *((_QWORD **)a3 + 1), 0));
}

- (id)diffPropertyNames:(id)a3
{
  return (id)String(self->mStore, *((_QWORD **)a3 + 1));
}

- (id)propertyMapByAddingValuesFromPropertyMap:(id)a3
{
  id v4;
  void *v5;

  v4 = (id)-[TSSPropertyMap copy](self, "copy");
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "addValuesFromPropertyMap:", a3);
  return v5;
}

- (id)propertyMapByRemovingValuesFromPropertyMap:(id)a3
{
  id v4;
  void *v5;

  v4 = (id)-[TSSPropertyMap copy](self, "copy");
  v5 = v4;
  if (a3)
    objc_msgSend(v4, "removeValuesFromPropertyMap:", a3);
  return v5;
}

- (TSSPropertyMap)propertyMapWithProperties:(id)a3
{
  TSSPropertyMap *v4;

  v4 = (TSSPropertyMap *)(id)-[TSSPropertyMap copy](self, "copy");
  -[TSSPropertyMap filterWithProperties:](v4, "filterWithProperties:", a3);
  return v4;
}

- (void)pSetArrayOfObjects:(id)a3[9] forProperty:(int)a4
{
  uint64_t v4;
  id v6;

  v4 = *(_QWORD *)&a4;
  v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:count:", a3, 9);
  -[TSSPropertyMap setObject:forProperty:](self, "setObject:forProperty:", v6, v4);

}

- (void)pSetArrayOfFloats:(double)a3[9] forProperty:(int)a4
{
  uint64_t v4;
  uint64_t v7;
  _BYTE v8[72];
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  v7 = 0;
  v9 = *MEMORY[0x24BDAC8D0];
  do
  {
    *(_QWORD *)&v8[v7 * 8] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3[v7]);
    ++v7;
  }
  while (v7 != 9);
  -[TSSPropertyMap pSetArrayOfObjects:forProperty:](self, "pSetArrayOfObjects:forProperty:", v8, v4);
}

@end
