@implementation TSSStyle

- (float)floatValueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  float result;
  TSSStyle *mParent;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (-[TSSPropertyMap floatValueForProperty:](mOverridePropertyMap, "floatValueForProperty:", *(_QWORD *)&a3),
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
      -[TSSStyle floatValueForProperty:](mParent, "floatValueForProperty:", v3);
    else
      objc_msgSend((id)objc_opt_class(), "defaultFloatValueForProperty:", v3);
  }
  return result;
}

- (int)intValueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  int result;
  TSSStyle *mParent;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (result = -[TSSPropertyMap intValueForProperty:](mOverridePropertyMap, "intValueForProperty:", *(_QWORD *)&a3),
        result == 0x80000000))
  {
    mParent = self->mParent;
    if (mParent)
      return -[TSSStyle intValueForProperty:](mParent, "intValueForProperty:", v3);
    else
      return objc_msgSend((id)objc_opt_class(), "defaultIntValueForProperty:", v3);
  }
  return result;
}

+ (int)defaultIntValueForProperty:(int)a3
{
  return 0x80000000;
}

- (id)valueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  id result;
  TSSStyle *mParent;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (result = -[TSSPropertyMap objectForProperty:](mOverridePropertyMap, "objectForProperty:", *(_QWORD *)&a3)) == 0)
  {
    mParent = self->mParent;
    if (mParent)
      return -[TSSStyle valueForProperty:](mParent, "valueForProperty:", v3);
    else
      return (id)objc_msgSend((id)objc_opt_class(), "defaultValueForProperty:", v3);
  }
  return result;
}

- (id)boxedValueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  id result;
  TSSStyle *mParent;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (result = -[TSSPropertyMap boxedObjectForProperty:](mOverridePropertyMap, "boxedObjectForProperty:", *(_QWORD *)&a3)) == 0)
  {
    mParent = self->mParent;
    if (mParent)
      return -[TSSStyle boxedValueForProperty:](mParent, "boxedValueForProperty:", v3);
    else
      return (id)objc_msgSend((id)objc_opt_class(), "boxedDefaultValueForProperty:", v3);
  }
  return result;
}

+ (id)defaultValueForProperty:(int)a3
{
  return 0;
}

+ (id)boxedDefaultValueForProperty:(int)a3
{
  uint64_t v3;
  id result;
  float v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  switch(String(a3))
  {
    case 0u:
      result = (id)objc_msgSend(a1, "defaultValueForProperty:", v3);
      break;
    case 1u:
      v10 = objc_msgSend(a1, "defaultIntValueForProperty:", v3);
      if ((_DWORD)v10 == 0x80000000)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      break;
    case 2u:
      objc_msgSend(a1, "defaultFloatValueForProperty:", v3);
      if (v6 == INFINITY)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
      break;
    case 3u:
      objc_msgSend(a1, "defaultDoubleValueForProperty:", v3);
      if (v7 == INFINITY)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      break;
    default:
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSSStyle boxedDefaultValueForProperty:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 433, CFSTR("Unexpected property type"));
LABEL_9:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)definesProperty:(int)a3
{
  uint64_t v3;

  v3 = *(_QWORD *)&a3;
  return -[TSSPropertyMap containsProperty:](self->mOverridePropertyMap, "containsProperty:")
      || -[TSSStyle definesProperty:](self->mParent, "definesProperty:", v3);
}

- (id)newOverridePropertyMapWithPropertyMap:(id)a3
{
  TSSStyle *mParent;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  TSSPropertyMap *mOverridePropertyMap;
  void *v11;
  id v12;

  mParent = self;
  if (self->mIsVariation)
  {
    mParent = self->mParent;
    if (!mParent)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle newOverridePropertyMapWithPropertyMap:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1197, CFSTR("Can't create variation of a nil base style."));
      mParent = 0;
    }
  }
  if (-[TSSStyle isVariation](mParent, "isVariation"))
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle newOverridePropertyMapWithPropertyMap:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1198, CFSTR("Can't create variation of a variation base style."));
  }
  if (self->mIsVariation && (mOverridePropertyMap = self->mOverridePropertyMap) != 0)
  {
    v11 = (void *)-[TSSPropertyMap copy](mOverridePropertyMap, "copy");
    objc_msgSend(v11, "addValuesFromPropertyMap:", a3);
  }
  else
  {
    v11 = (void *)objc_msgSend(a3, "copy");
  }
  v12 = -[TSSStyle copyPropertyMap](mParent, "copyPropertyMap");
  objc_msgSend(v11, "removeValuesFromPropertyMap:", v12);

  return v11;
}

- (BOOL)isVariation
{
  return self->mIsVariation;
}

- (BOOL)overridePropertyMapIsEqualTo:(id)a3
{
  TSSPropertyMap *mOverridePropertyMap;

  mOverridePropertyMap = self->mOverridePropertyMap;
  return mOverridePropertyMap == a3 || -[TSSPropertyMap isEqual:](mOverridePropertyMap, "isEqual:");
}

- (id)copyPropertyMap
{
  TSSStyle *mParent;
  id v4;

  mParent = self->mParent;
  if (mParent)
    v4 = -[TSSStyle copyPropertyMap](mParent, "copyPropertyMap");
  else
    v4 = 0;
  if (!-[TSSPropertyMap count](self->mOverridePropertyMap, "count"))
    return v4;
  if (v4)
  {
    objc_msgSend(v4, "addValuesFromPropertyMap:", self->mOverridePropertyMap);
    return v4;
  }
  return (id)-[TSSPropertyMap copy](self->mOverridePropertyMap, "copy");
}

- (TSSStyle)initWithContext:(id)a3 name:(id)a4 overridePropertyMap:(id)a5 isVariation:(BOOL)a6
{
  TSSStyle *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  objc_class *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TSSStyle;
  v9 = -[TSPObject initWithContext:](&v18, sel_initWithContext_, a3);
  if (v9)
  {
    if ((objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", objc_msgSend(a5, "allProperties")) & 1) != 0)
    {
      if (objc_msgSend(a4, "isEqual:", &stru_24D82FEB0))
      {
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]");
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 502, CFSTR("Style name may not be the empty string."));
        a4 = 0;
      }
      v9->mName = (NSString *)objc_msgSend(a4, "copy");
      if (a5)
        v9->mOverridePropertyMap = -[TSSPropertyMap initWithPropertyMap:]([TSSPropertyMap alloc], "initWithPropertyMap:", a5);
      v9->mIsVariation = a6;
    }
    else
    {
      v12 = objc_msgSend((id)objc_msgSend(a5, "allProperties"), "propertySetByRemovingPropertiesFromSet:", objc_msgSend((id)objc_opt_class(), "properties"));
      v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle initWithContext:name:overridePropertyMap:isVariation:]");
      v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m");
      v16 = (objc_class *)objc_opt_class();
      objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 496, CFSTR("Attempt to initialize a style of class %@ with an override of one or more unsupported properties : %@"), NSStringFromClass(v16), v12);

      return 0;
    }
  }
  return v9;
}

- (void)setValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4;
  TSSPropertyMap *mOverridePropertyMap;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  -[TSPObject willModify](self, "willModify");
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    -[TSSPropertyMap setObject:forProperty:](mOverridePropertyMap, "setObject:forProperty:", a3, v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setValue:forProperty:]");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m");
    v11 = String(v4);
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 884, CFSTR("Tried to set property %@ of style %@ to an undefined value."), v11, TSUObjectReferenceDescription());
  }
}

+ (float)defaultFloatValueForProperty:(int)a3
{
  return INFINITY;
}

+ (id)defaultPropertyMap
{
  TSSPropertyMap *v3;
  void *v4;
  _QWORD v6[6];

  v3 = objc_alloc_init(TSSPropertyMap);
  v4 = (void *)objc_msgSend(a1, "properties");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __30__TSSStyle_defaultPropertyMap__block_invoke;
  v6[3] = &unk_24D82AF00;
  v6[4] = a1;
  v6[5] = v3;
  objc_msgSend(v4, "enumeratePropertiesUsingBlock:", v6);
  return v3;
}

uint64_t __30__TSSStyle_defaultPropertyMap__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 40), "setBoxedObject:forProperty:", objc_msgSend(*(id *)(a1 + 32), "boxedDefaultValueForProperty:", a2), a2);
}

- (TSSStylesheet)stylesheet
{
  return self->mStylesheet;
}

- (void)setStylesheet:(id)a3
{
  self->mStylesheet = (TSSStylesheet *)a3;
}

- (TSSStyle)parent
{
  return self->mParent;
}

- (void)setParent:(id)a3
{
  id v5;

  if (self->mParent != a3)
  {
    -[TSPObject willModify](self, "willModify");
    v5 = a3;

    self->mParent = (TSSStyle *)a3;
  }
}

- (NSString)styleIdentifier
{
  return self->mStyleIdentifier;
}

- (void)setStyleIdentifier:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mStyleIdentifier = v5;
}

- (NSString)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  NSString *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (NSString *)objc_msgSend(a3, "copy");

  self->mName = v5;
}

+ (id)properties
{
  void *v2;
  uint64_t v3;

  v2 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v3 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSSStyle properties]");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 372, CFSTR("Abstract method"));
  objc_exception_throw((id)objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Abstract method"), "+[TSSStyle properties]"), 0));
}

+ (id)description
{
  void *v3;
  void *i;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[6];
  _QWORD v10[6];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@"), NSStringFromClass((Class)a1));
  for (i = (void *)objc_msgSend(a1, "superclass"); i != (void *)objc_opt_class(); i = (void *)objc_msgSend(i, "superclass"))objc_msgSend(v3, "appendFormat:", CFSTR(" : %@"), NSStringFromClass((Class)i));
  v5 = objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3052000000;
  v10[3] = __Block_byref_object_copy__7;
  v10[4] = __Block_byref_object_dispose__7;
  v10[5] = &stru_24D82FEB0;
  v6 = (void *)objc_msgSend(a1, "properties");
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __23__TSSStyle_description__block_invoke;
  v9[3] = &unk_24D82B020;
  v9[4] = v5;
  v9[5] = v10;
  objc_msgSend(v6, "enumeratePropertiesUsingBlock:", v9);
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<%@> = {\n%@\n}"), v3, objc_msgSend(MEMORY[0x24BDD17C8], "tsu_stringByIndentingString:", v5));
  _Block_object_dispose(v10, 8);
  return v7;
}

uint64_t __23__TSSStyle_description__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "appendFormat:", CFSTR("%@%3d %@"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2, String(a2));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = CFSTR("\n");
  return result;
}

+ (double)defaultDoubleValueForProperty:(int)a3
{
  return INFINITY;
}

+ (id)defaultStyleWithContext:(id)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, 0, 0);
}

- (TSSStyle)initWithContext:(id)a3
{
  return -[TSSStyle initWithContext:name:overridePropertyMap:isVariation:](self, "initWithContext:name:overridePropertyMap:isVariation:", a3, 0, 0, 0);
}

- (TSSStyle)init
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle init]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 529, CFSTR("Must init with an object context."));

  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSSStyle;
  -[TSSStyle dealloc](&v3, sel_dealloc);
}

- (unint64_t)hash
{
  return objc_msgSend((id)objc_opt_class(), "hash");
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v7;
  NSString *v9;
  int v10;
  NSString *v11;
  void *v12;
  id v13;
  void *v14;
  TSSStyle *v15;
  TSSPropertyMap *v16;
  TSSStyle *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  if (a3 == self)
    return 1;
  v19 = v3;
  v20 = v4;
  if (!a3)
    return 0;
  v7 = objc_opt_class();
  if (v7 != objc_opt_class())
    return 0;
  v9 = (NSString *)*((_QWORD *)a3 + 7);
  v10 = v9 == self->mName || -[NSString isEqualToString:](v9, "isEqualToString:");
  v11 = (NSString *)*((_QWORD *)a3 + 8);
  if ((v11 == self->mStyleIdentifier || -[NSString isEqualToString:](v11, "isEqualToString:"))
    && *((unsigned __int8 *)a3 + 80) == self->mIsVariation)
  {
    v12 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17F0], "currentThread"), "threadDictionary");
    v13 = (id)objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("TSSStyleIsEqualStylesBeingCompared"));
    if (!v13)
    {
      v13 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v13, CFSTR("TSSStyleIsEqualStylesBeingCompared"));

    }
    v17 = self;
    v18 = a3;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1968]), "initWithBytes:objCType:", &v17, "{?=@@}");
    if ((objc_msgSend(v13, "containsObject:", v14, v17, v18) & 1) == 0)
    {
      objc_msgSend(v13, "addObject:", v14);
      v15 = (TSSStyle *)*((_QWORD *)a3 + 9);
      if (v15 == self->mParent || -[TSSStyle isEqual:](v15, "isEqual:"))
      {
        v16 = (TSSPropertyMap *)*((_QWORD *)a3 + 6);
        if (v16 == self->mOverridePropertyMap)
        {
          v10 = 1;
        }
        else if (!-[TSSPropertyMap isEqual:](v16, "isEqual:"))
        {
          v10 = 0;
        }
      }
      else
      {
        v10 = 0;
      }
      objc_msgSend(v13, "removeObject:", v14);
    }

  }
  else
  {
    v10 = 0;
  }
  return v10 != 0;
}

- (id)copyFlattenedWithContext:(id)a3
{
  return (id)objc_msgSend(objc_allocWithZone((Class)objc_opt_class()), "initWithContext:name:overridePropertyMap:isVariation:", a3, self->mName, -[TSSStyle propertyMap](self, "propertyMap"), 0);
}

- (id)copyWithZone:(_NSZone *)a3 context:(id)a4
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithContext:name:overridePropertyMap:isVariation:", a4, self->mName, self->mOverridePropertyMap, self->mIsVariation);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[TSSStyle copyWithZone:context:](self, "copyWithZone:context:", a3, -[TSPObject context](self, "context"));
}

- (id)copyWithContext:(id)a3
{
  return -[TSSStyle copyWithZone:context:](self, "copyWithZone:context:", 0, a3);
}

- (double)doubleValueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  double result;
  TSSStyle *mParent;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (-[TSSPropertyMap doubleValueForProperty:](mOverridePropertyMap, "doubleValueForProperty:", *(_QWORD *)&a3),
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
      -[TSSStyle doubleValueForProperty:](mParent, "doubleValueForProperty:", v3);
    else
      objc_msgSend((id)objc_opt_class(), "defaultDoubleValueForProperty:", v3);
  }
  return result;
}

- (double)CGFloatValueForProperty:(int)a3
{
  uint64_t v3;
  TSSPropertyMap *mOverridePropertyMap;
  double result;
  TSSStyle *mParent;
  int v8;
  float v9;

  v3 = *(_QWORD *)&a3;
  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap
    || (-[TSSPropertyMap CGFloatValueForProperty:](mOverridePropertyMap, "CGFloatValueForProperty:", *(_QWORD *)&a3),
        result == INFINITY))
  {
    mParent = self->mParent;
    if (mParent)
    {
      -[TSSStyle CGFloatValueForProperty:](mParent, "CGFloatValueForProperty:", v3);
    }
    else
    {
      v8 = String(v3);
      if (v8 == 3)
      {
        objc_msgSend((id)objc_opt_class(), "defaultDoubleValueForProperty:", v3);
      }
      else if (v8 == 2)
      {
        objc_msgSend((id)objc_opt_class(), "defaultFloatValueForProperty:", v3);
        return v9;
      }
      else
      {
        return INFINITY;
      }
    }
  }
  return result;
}

- (id)valuesForProperties:(id)a3
{
  id v4;

  v4 = -[TSSStyle copyPropertyMap](self, "copyPropertyMap");
  objc_msgSend(v4, "filterWithProperties:", a3);
  return v4;
}

- (void)setBoxedValue:(id)a3 forProperty:(int)a4
{
  uint64_t v4;
  TSSPropertyMap *mOverridePropertyMap;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = *(_QWORD *)&a4;
  -[TSPObject willModify](self, "willModify");
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    -[TSSPropertyMap setBoxedObject:forProperty:](mOverridePropertyMap, "setBoxedObject:forProperty:", a3, v4);
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setBoxedValue:forProperty:]");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m");
    v11 = String(v4);
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, v10, 868, CFSTR("Tried to set property %@ of style %@ to an undefined value."), v11, TSUObjectReferenceDescription());
  }
}

- (void)setIntValue:(int)a3 forProperty:(int)a4
{
  uint64_t v4;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  TSSPropertyMap *mOverridePropertyMap;

  v4 = *(_QWORD *)&a4;
  v5 = *(_QWORD *)&a3;
  -[TSPObject willModify](self, "willModify");
  if ((_DWORD)v5 == 0x80000000)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setIntValue:forProperty:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 900, CFSTR("Int property value must be defined."));
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    -[TSSPropertyMap setIntValue:forProperty:](mOverridePropertyMap, "setIntValue:forProperty:", v5, v4);
  }
}

- (void)setFloatValue:(float)a3 forProperty:(int)a4
{
  uint64_t v4;
  double v7;
  TSSPropertyMap *mOverridePropertyMap;
  void *v9;
  uint64_t v10;

  v4 = *(_QWORD *)&a4;
  -[TSPObject willModify](self, "willModify");
  if (a3 == INFINITY)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setFloatValue:forProperty:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 915, CFSTR("Float property value must be defined."));
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    *(float *)&v7 = a3;
    -[TSSPropertyMap setFloatValue:forProperty:](mOverridePropertyMap, "setFloatValue:forProperty:", v4, v7);
  }
}

- (void)setDoubleValue:(double)a3 forProperty:(int)a4
{
  uint64_t v4;
  TSSPropertyMap *mOverridePropertyMap;
  void *v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  -[TSPObject willModify](self, "willModify");
  if (a3 == INFINITY)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setDoubleValue:forProperty:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 930, CFSTR("Double property value must be defined."));
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    -[TSSPropertyMap setDoubleValue:forProperty:](mOverridePropertyMap, "setDoubleValue:forProperty:", v4, a3);
  }
}

- (void)setCGFloatValue:(double)a3 forProperty:(int)a4
{
  uint64_t v4;
  TSSPropertyMap *mOverridePropertyMap;
  void *v8;
  uint64_t v9;

  v4 = *(_QWORD *)&a4;
  -[TSPObject willModify](self, "willModify");
  if (a3 == INFINITY)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle setCGFloatValue:forProperty:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 945, CFSTR("CGFloat property value must be defined."));
  }
  else
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (!mOverridePropertyMap)
    {
      mOverridePropertyMap = objc_alloc_init(TSSPropertyMap);
      self->mOverridePropertyMap = mOverridePropertyMap;
    }
    -[TSSPropertyMap setCGFloatValue:forProperty:](mOverridePropertyMap, "setCGFloatValue:forProperty:", v4, a3);
  }
}

- (void)setValuesForProperties:(id)a3
{
  TSSPropertyMap *mOverridePropertyMap;

  -[TSPObject willModify](self, "willModify");
  if (a3)
  {
    mOverridePropertyMap = self->mOverridePropertyMap;
    if (mOverridePropertyMap)
      -[TSSPropertyMap addValuesFromPropertyMap:](mOverridePropertyMap, "addValuesFromPropertyMap:", a3);
    else
      self->mOverridePropertyMap = (TSSPropertyMap *)objc_msgSend(a3, "copy");
  }
}

- (void)removeValueForProperty:(int)a3
{
  uint64_t v3;
  void *v5;
  uint64_t v6;

  v3 = *(_QWORD *)&a3;
  -[TSPObject willModify](self, "willModify");
  if (v3 >> 4 >= 0x121)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle removeValueForProperty:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 967, CFSTR("Property ID <%d> out of range."), v3);
  }
  if (-[TSSStyle overridesProperty:](self, "overridesProperty:", v3))
  {
    -[TSSPropertyMap removeValueForProperty:](self->mOverridePropertyMap, "removeValueForProperty:", v3);
    if (!-[TSSPropertyMap count](self->mOverridePropertyMap, "count"))
    {

      self->mOverridePropertyMap = 0;
    }
  }
}

- (void)removeAllValues
{
  -[TSPObject willModify](self, "willModify");

  self->mOverridePropertyMap = 0;
}

- (BOOL)isNamed
{
  return self->mName != 0;
}

- (BOOL)isIdentified
{
  return self->mStyleIdentifier != 0;
}

- (BOOL)overridesProperty:(int)a3
{
  return -[TSSPropertyMap containsProperty:](self->mOverridePropertyMap, "containsProperty:", *(_QWORD *)&a3);
}

- (BOOL)overridesAnyProperty
{
  TSSPropertyMap *mOverridePropertyMap;

  mOverridePropertyMap = self->mOverridePropertyMap;
  if (mOverridePropertyMap)
    LOBYTE(mOverridePropertyMap) = -[TSSPropertyMap count](mOverridePropertyMap, "count") != 0;
  return (char)mOverridePropertyMap;
}

- (id)overriddenProperties
{
  return -[TSSPropertyMap allProperties](self->mOverridePropertyMap, "allProperties");
}

- (unint64_t)overrideCount
{
  unint64_t result;

  result = (unint64_t)self->mOverridePropertyMap;
  if (result)
    return objc_msgSend((id)result, "count");
  return result;
}

- (id)boxedOverrideValueForProperty:(int)a3
{
  uint64_t v3;
  id result;
  float v6;
  double v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  switch(String(a3))
  {
    case 0u:
      result = -[TSSStyle overrideValueForProperty:](self, "overrideValueForProperty:", v3);
      break;
    case 1u:
      v10 = -[TSSStyle overrideIntValueForProperty:](self, "overrideIntValueForProperty:", v3);
      if ((_DWORD)v10 == 0x80000000)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v10);
      break;
    case 2u:
      -[TSSStyle overrideFloatValueForProperty:](self, "overrideFloatValueForProperty:", v3);
      if (v6 == INFINITY)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:");
      break;
    case 3u:
      -[TSSStyle overrideDoubleValueForProperty:](self, "overrideDoubleValueForProperty:", v3);
      if (v7 == INFINITY)
        goto LABEL_9;
      result = (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      break;
    default:
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle boxedOverrideValueForProperty:]");
      objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1064, CFSTR("Unexpected property type"));
LABEL_9:
      result = 0;
      break;
  }
  return result;
}

- (id)overrideValueForProperty:(int)a3
{
  id result;

  result = self->mOverridePropertyMap;
  if (result)
    return (id)objc_msgSend(result, "objectForProperty:", *(_QWORD *)&a3);
  return result;
}

- (int)overrideIntValueForProperty:(int)a3
{
  TSSPropertyMap *mOverridePropertyMap;

  mOverridePropertyMap = self->mOverridePropertyMap;
  if (mOverridePropertyMap)
    return -[TSSPropertyMap intValueForProperty:](mOverridePropertyMap, "intValueForProperty:", *(_QWORD *)&a3);
  else
    return 0x80000000;
}

- (float)overrideFloatValueForProperty:(int)a3
{
  TSSPropertyMap *mOverridePropertyMap;
  float result;

  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap)
    return INFINITY;
  -[TSSPropertyMap floatValueForProperty:](mOverridePropertyMap, "floatValueForProperty:", *(_QWORD *)&a3);
  return result;
}

- (double)overrideDoubleValueForProperty:(int)a3
{
  TSSPropertyMap *mOverridePropertyMap;
  double result;

  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap)
    return INFINITY;
  -[TSSPropertyMap doubleValueForProperty:](mOverridePropertyMap, "doubleValueForProperty:", *(_QWORD *)&a3);
  return result;
}

- (double)overrideCGFloatValueForProperty:(int)a3
{
  TSSPropertyMap *mOverridePropertyMap;
  double result;

  mOverridePropertyMap = self->mOverridePropertyMap;
  if (!mOverridePropertyMap)
    return INFINITY;
  -[TSSPropertyMap CGFloatValueForProperty:](mOverridePropertyMap, "CGFloatValueForProperty:", *(_QWORD *)&a3);
  return result;
}

- (id)propertyMap
{
  TSSStyle *mParent;
  id v4;

  mParent = self->mParent;
  if (mParent)
    v4 = -[TSSStyle propertyMap](mParent, "propertyMap");
  else
    v4 = 0;
  if (!-[TSSPropertyMap count](self->mOverridePropertyMap, "count"))
    return v4;
  if (v4)
  {
    objc_msgSend(v4, "addValuesFromPropertyMap:", self->mOverridePropertyMap);
    return v4;
  }
  return (id)-[TSSPropertyMap copy](self->mOverridePropertyMap, "copy");
}

- (id)propertyMapIgnoringStyle:(id)a3
{
  TSSStyle *mParent;
  id v6;

  mParent = self->mParent;
  if (mParent)
    v6 = -[TSSStyle propertyMapIgnoringStyle:](mParent, "propertyMapIgnoringStyle:", a3);
  else
    v6 = 0;
  if (self == a3 || !-[TSSPropertyMap count](self->mOverridePropertyMap, "count"))
    return v6;
  if (v6)
  {
    objc_msgSend(v6, "addValuesFromPropertyMap:", self->mOverridePropertyMap);
    return v6;
  }
  return (id)-[TSSPropertyMap copy](self->mOverridePropertyMap, "copy");
}

- (id)overridePropertyMapWithPropertyMap:(id)a3 overridePropertyMap:(id)a4 collapseSourceOverrides:(BOOL)a5
{
  _BOOL4 v5;
  TSSStyle *mParent;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  TSSPropertyMap *v14;
  TSSPropertyMap *v15;
  TSSPropertyMap *v16;

  v5 = a5;
  mParent = self;
  if (self->mIsVariation)
  {
    mParent = self->mParent;
    if (!mParent)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle overridePropertyMapWithPropertyMap:overridePropertyMap:collapseSourceOverrides:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1167, CFSTR("Can't create variation of a nil base style."));
      mParent = 0;
    }
  }
  if (-[TSSStyle isVariation](mParent, "isVariation"))
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle overridePropertyMapWithPropertyMap:overridePropertyMap:collapseSourceOverrides:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1168, CFSTR("Can't create variation of a variation base style."));
  }
  v14 = objc_alloc_init(TSSPropertyMap);
  v15 = objc_alloc_init(TSSPropertyMap);
  v16 = v15;
  if (self->mIsVariation)
  {
    if (v5)
      v15 = v14;
    -[TSSPropertyMap addValuesFromPropertyMap:](v15, "addValuesFromPropertyMap:", self->mOverridePropertyMap);
  }
  -[TSSPropertyMap addValuesFromPropertyMap:](v16, "addValuesFromPropertyMap:", a4);
  -[TSSPropertyMap addValuesFromPropertyMap:](v14, "addValuesFromPropertyMap:", a3);
  -[TSSPropertyMap removeValuesForProperties:](v14, "removeValuesForProperties:", -[TSSPropertyMap allProperties](v16, "allProperties"));
  -[TSSPropertyMap removeValuesFromPropertyMap:](v14, "removeValuesFromPropertyMap:", -[TSSStyle propertyMap](mParent, "propertyMap"));
  -[TSSPropertyMap addValuesFromPropertyMap:](v16, "addValuesFromPropertyMap:", v14);

  return v16;
}

- (BOOL)hasEqualPropertyValues:(id)a3
{
  return -[TSSStyle hasEqualValues:forProperties:](self, "hasEqualValues:forProperties:", a3, objc_msgSend((id)objc_opt_class(), "properties"));
}

- (BOOL)p_hasEqualValuesTo:(id)a3 forProperty:(int)a4
{
  uint64_t v4;
  id v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;
  int v12;
  float v13;
  float v14;
  float v15;
  double v16;
  double v17;
  double v18;

  v4 = *(_QWORD *)&a4;
  switch(String(a4))
  {
    case 0u:
      v7 = -[TSSStyle valueForProperty:](self, "valueForProperty:", v4);
      v8 = (void *)objc_msgSend(a3, "objectForProperty:", v4);
      if (!v7 || (v9 = objc_msgSend(v7, "isEqual:", v8)) != 0)
      {
        if (!v8 || (objc_msgSend(v8, "isEqual:", v7) & 1) != 0)
          goto LABEL_9;
        goto LABEL_11;
      }
      return v9;
    case 1u:
      v12 = -[TSSStyle intValueForProperty:](self, "intValueForProperty:", v4);
      if (v12 != objc_msgSend(a3, "intValueForProperty:", v4))
        goto LABEL_11;
      goto LABEL_9;
    case 2u:
      -[TSSStyle floatValueForProperty:](self, "floatValueForProperty:", v4);
      v14 = v13;
      objc_msgSend(a3, "floatValueForProperty:", v4);
      if (v14 != v15)
        goto LABEL_11;
      goto LABEL_9;
    case 3u:
      -[TSSStyle doubleValueForProperty:](self, "doubleValueForProperty:", v4);
      v17 = v16;
      objc_msgSend(a3, "doubleValueForProperty:", v4);
      if (v17 != v18)
        goto LABEL_11;
LABEL_9:
      LOBYTE(v9) = 1;
      break;
    default:
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSSStyle p_hasEqualValuesTo:forProperty:]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/styles/TSSStyle.m"), 1257, CFSTR("Comparing property values for unknown property %@ (%d) of unknown type."), String(v4), v4);
LABEL_11:
      LOBYTE(v9) = 0;
      break;
  }
  return v9;
}

- (BOOL)hasEqualValuesToPropertyMap:(id)a3 forProperties:(id)a4
{
  BOOL v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4)
    || !objc_msgSend((id)objc_msgSend(a3, "allProperties"), "containsProperties:", a4))
  {
    return 0;
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __54__TSSStyle_hasEqualValuesToPropertyMap_forProperties___block_invoke;
  v9[3] = &unk_24D82B048;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = &v10;
  objc_msgSend(a4, "enumeratePropertiesUsingBlock:", v9);
  v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __54__TSSStyle_hasEqualValuesToPropertyMap_forProperties___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "p_hasEqualValuesTo:forProperty:", *(_QWORD *)(a1 + 40), a2);
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)hasEqualValues:(id)a3 forProperties:(id)a4
{
  BOOL v7;
  _QWORD v9[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  if (!objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4)
    || !objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "properties"), "containsProperties:", a4))
  {
    return 0;
  }
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 1;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __41__TSSStyle_hasEqualValues_forProperties___block_invoke;
  v9[3] = &unk_24D82B048;
  v9[4] = self;
  v9[5] = a3;
  v9[6] = &v10;
  objc_msgSend(a4, "enumeratePropertiesUsingBlock:", v9);
  v7 = *((_BYTE *)v11 + 24) != 0;
  _Block_object_dispose(&v10, 8);
  return v7;
}

uint64_t __41__TSSStyle_hasEqualValues_forProperties___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "p_hasEqualValuesTo:forProperty:", *(_QWORD *)(a1 + 40), a2);
  if ((result & 1) == 0)
  {
    *a3 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }
  return result;
}

- (TSSPropertyMap)overridePropertyMap
{
  return (TSSPropertyMap *)(id)-[TSSPropertyMap copy](self->mOverridePropertyMap, "copy");
}

- (void)setOverridePropertyMap:(id)a3
{
  TSSPropertyMap *v5;

  -[TSPObject willModify](self, "willModify");
  v5 = (TSSPropertyMap *)objc_msgSend(a3, "copy");

  self->mOverridePropertyMap = v5;
}

- (TSSStyle)rootAncestor
{
  TSSStyle *v2;

  while (1)
  {
    v2 = self;
    if (!-[TSSStyle parent](self, "parent"))
      break;
    self = -[TSSStyle parent](v2, "parent");
  }
  return v2;
}

- (TSSStyle)baseStyleForVariation
{
  TSSStyle *v2;

  v2 = self;
  if (-[TSSStyle isVariation](self, "isVariation"))
  {
    do
      v2 = -[TSSStyle parent](v2, "parent");
    while (-[TSSStyle isVariation](v2, "isVariation"));
  }
  return v2;
}

- (TSSStyle)firstIdentifiedAncestor
{
  TSSStyle *v2;

  while (1)
  {
    v2 = self;
    if (!self || -[TSSStyle styleIdentifier](self, "styleIdentifier"))
      break;
    self = -[TSSStyle parent](v2, "parent");
  }
  return v2;
}

- (TSSStyle)rootIdentifiedAncestor
{
  TSSStyle *v2;
  TSSStyle *v3;

  if (!self)
    return 0;
  v2 = self;
  v3 = 0;
  do
  {
    if (-[TSSStyle isIdentified](v2, "isIdentified"))
      v3 = v2;
    v2 = -[TSSStyle parent](v2, "parent");
  }
  while (v2);
  return v3;
}

- (NSSet)children
{
  TSSStylesheet *v3;
  TSSStylesheet *v4;
  id v5;
  id v6;
  void *v7;

  v3 = -[TSSStyle stylesheet](self, "stylesheet");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    do
    {
      v6 = -[TSSStylesheet childrenOfStyle:](v4, "childrenOfStyle:", self);
      if (v6)
      {
        v7 = v6;
        if (objc_msgSend(v6, "count"))
        {
          if (!v5)
            v5 = objc_alloc_init(MEMORY[0x24BEB3CB0]);
          objc_msgSend(v5, "unionSet:", v7);
        }
      }
      v4 = -[TSSStylesheet child](v4, "child");
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }
  return (NSSet *)v5;
}

- (BOOL)isChildOf:(id)a3
{
  return self->mParent == a3;
}

- (BOOL)isParentOf:(id)a3
{
  return objc_msgSend(a3, "parent") == (_QWORD)self;
}

- (BOOL)isDescendentOf:(id)a3
{
  TSSStyle *mParent;

  mParent = self->mParent;
  if (mParent)
    LOBYTE(mParent) = mParent == a3 || -[TSSStyle isDescendentOf:](mParent, "isDescendentOf:");
  return (char)mParent;
}

- (BOOL)isAncestorOf:(id)a3
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "parent");
  if (v5)
    LOBYTE(v5) = (TSSStyle *)objc_msgSend(a3, "parent") == self
              || -[TSSStyle isAncestorOf:](self, "isAncestorOf:", objc_msgSend(a3, "parent"));
  return v5;
}

+ (id)propertiesAllowingNSNull
{
  return 0;
}

+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4
{
  return a3 && *a3 != 0x80000000;
}

+ (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6
{
  int v6;

  if (!a3)
    return 0;
  v6 = *a3;
  if (*a3 == 0x80000000)
    return 0;
  if (v6 < a5 || (a5 = a6, v6 > a6))
    *a3 = a5;
  return 1;
}

+ (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4
{
  BOOL result;

  if (!a3 || *a3 == 0x80000000)
    return 0;
  result = 1;
  if (*a3 > 1)
    *a3 = 1;
  return result;
}

+ (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  return a3 && *a3 != INFINITY;
}

+ (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4
{
  return a3 && *a3 != INFINITY;
}

+ (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5
{
  id v5;

  if (a3)
  {
    v5 = *a3;
    if (*a3)
      LOBYTE(v5) = (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0);
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return (char)v5;
}

- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4
{
  return objc_msgSend((id)objc_opt_class(), "validateIntValue:forProperty:", a3, *(_QWORD *)&a4);
}

- (BOOL)validateIntValue:(int *)a3 forProperty:(int)a4 min:(int)a5 max:(int)a6
{
  return objc_msgSend((id)objc_opt_class(), "validateIntValue:forProperty:min:max:", a3, *(_QWORD *)&a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (BOOL)validateIntValueAsBool:(int *)a3 forProperty:(int)a4
{
  return objc_msgSend((id)objc_opt_class(), "validateIntValueAsBool:forProperty:", a3, *(_QWORD *)&a4);
}

- (BOOL)validateFloatValue:(float *)a3 forProperty:(int)a4
{
  return objc_msgSend((id)objc_opt_class(), "validateFloatValue:forProperty:", a3, *(_QWORD *)&a4);
}

- (BOOL)validateDoubleValue:(double *)a3 forProperty:(int)a4
{
  return objc_msgSend((id)objc_opt_class(), "validateDoubleValue:forProperty:", a3, *(_QWORD *)&a4);
}

- (BOOL)validateObjectValue:(id *)a3 withClass:(Class)a4 forProperty:(int)a5
{
  return objc_msgSend((id)objc_opt_class(), "validateObjectValue:withClass:forProperty:", a3, a4, *(_QWORD *)&a5);
}

- (BOOL)isThemeEquivalent:(id)a3
{
  return a3 == self;
}

- (SEL)mapThemeAssetSelector
{
  return sel_mapStyle_;
}

- (BOOL)transformsFontSizes
{
  return 0;
}

+ (double)fontSizeForFontSize:(double)a3 scalingFactor:(double)a4
{
  double v4;
  double v5;
  double v6;
  double v7;

  v4 = a3 * a4;
  v5 = floor(v4);
  v6 = floor(v4 * 0.5);
  v7 = v6 + v6;
  if (v4 >= 12.5)
    return v7;
  else
    return v5;
}

- (id)boxedValueForProperty:(int)a3 oldBoxedValue:(id)a4 transformedByTransform:(CGAffineTransform *)a5
{
  uint64_t v5;
  float v9;
  double v10;

  v5 = *(_QWORD *)&a3;
  if (a3 != 17 || !-[TSSStyle transformsFontSizes](self, "transformsFontSizes"))
    return -[TSSStyle boxedObjectForProperty:](self, "boxedObjectForProperty:", v5);
  objc_msgSend(a4, "floatValue");
  +[TSSStyle fontSizeForFontSize:scalingFactor:](TSSStyle, "fontSizeForFontSize:scalingFactor:", v9, a5->d);
  *(float *)&v10 = v10;
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v10);
}

- (id)referencedStyles
{
  void *v3;
  id v4;
  _QWORD v6[5];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = -[TSSStyle propertyMap](self, "propertyMap");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __28__TSSStyle_referencedStyles__block_invoke;
  v6[3] = &unk_24D82AE68;
  v6[4] = v3;
  objc_msgSend(v4, "enumeratePropertiesAndObjectsUsingBlock:", v6);
  return v3;
}

uint64_t __28__TSSStyle_referencedStyles__block_invoke(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;

  if (!a3)
  {
    v5 = result;
    objc_opt_class();
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(v5 + 32), "addObject:", a4);
  }
  return result;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  id v5;
  _QWORD v6[6];

  v5 = -[TSSStyle propertyMap](self, "propertyMap");
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __46__TSSStyle_replaceReferencedStylesUsingBlock___block_invoke;
  v6[3] = &unk_24D82AFD0;
  v6[4] = self;
  v6[5] = a3;
  objc_msgSend(v5, "enumeratePropertiesAndObjectsUsingBlock:", v6);
}

uint64_t __46__TSSStyle_replaceReferencedStylesUsingBlock___block_invoke(uint64_t result, uint64_t a2, int a3, void *a4)
{
  uint64_t v6;

  if (!a3)
  {
    v6 = result;
    result = objc_msgSend(a4, "conformsToProtocol:", &unk_254F658D8);
    if ((_DWORD)result)
    {
      result = (*(uint64_t (**)(void))(*(_QWORD *)(v6 + 40) + 16))();
      if ((void *)result != a4)
        return objc_msgSend(*(id *)(v6 + 32), "setValue:forProperty:", result, a2);
    }
  }
  return result;
}

- (void)fadeReflectionForSwatchGeneration
{
  id v3;
  id v4;

  v3 = -[TSSStyle boxedValueForProperty:](self, "boxedValueForProperty:", 519);
  if (v3)
  {
    v4 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v4, "setFadeAcceleration:", 5.0);
    -[TSSStyle setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", v4, 519);

  }
}

- (void)constrainShadowForSwatchGeneration
{
  id v3;

  v3 = (id)objc_msgSend(-[TSSStyle boxedValueForProperty:](self, "boxedValueForProperty:", 520), "newShadowClampedForSwatches");
  -[TSSStyle setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", v3, 520);

}

- (void)constrainStrokeForSwatchGeneration
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  v3 = -[TSSStyle boxedValueForProperty:](self, "boxedValueForProperty:", 517);
  objc_opt_class();
  v4 = (void *)TSUDynamicCast();
  if (v4 && (v5 = v4, objc_msgSend(v4, "assetScale"), v6 > 0.3))
  {
    v8 = (id)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(v8, "setAssetScale:", 0.3);
  }
  else
  {
    objc_msgSend(v3, "width");
    if (v7 <= 5.0)
      return;
    v8 = (id)objc_msgSend(v3, "mutableCopy");
    objc_msgSend(v8, "setWidth:", 5.0);
  }
  -[TSSStyle setBoxedValue:forProperty:](self, "setBoxedValue:forProperty:", v8, 517);

}

- (id)constrainShapeStyleForContext:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = -[TSSStyle copyWithContext:](self, "copyWithContext:", a3);
  v4 = objc_msgSend(v3, "boxedValueForProperty:", 520);
  if (v4 && v4 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v3, "constrainShadowForSwatchGeneration");
  v5 = objc_msgSend(v3, "boxedValueForProperty:", 517);
  if (v5 && v5 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v3, "constrainStrokeForSwatchGeneration");
  v6 = objc_msgSend(v3, "boxedObjectForProperty:", 519);
  if (v6 && v6 != objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    objc_msgSend(v3, "fadeReflectionForSwatchGeneration");
  return v3;
}

@end
