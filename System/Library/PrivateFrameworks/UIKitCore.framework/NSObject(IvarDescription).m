@implementation NSObject(IvarDescription)

- (void)__ivarDescriptionForClass:()IvarDescription
{
  void *v5;
  Ivar *v6;
  unint64_t i;
  char *TypeEncoding;
  const char *Name;
  ptrdiff_t Offset;
  void *Ivar;
  void *v12;
  Class Class;
  unsigned int outCount;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v5, "appendFormat:", CFSTR("\nin %@:"), a3);
  outCount = 0;
  v6 = class_copyIvarList(a3, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ++i)
    {
      TypeEncoding = (char *)ivar_getTypeEncoding(v6[i]);
      Name = ivar_getName(v6[i]);
      Offset = ivar_getOffset(v6[i]);
      objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%s (%@): "), Name, _UIDebugObjectTypeDescription(TypeEncoding));
      if (*TypeEncoding == 35)
      {
        if (!i && (objc_class *)objc_opt_class() == a3)
        {
          v12 = (void *)MEMORY[0x1E0CB3940];
          Class = object_getClass(a1);
          Ivar = (void *)objc_msgSend(v12, "stringWithFormat:", CFSTR("%@ (isa, %p)"), Class, object_getIvar(a1, *v6));
        }
        else
        {
          Ivar = object_getIvar(a1, v6[i]);
        }
      }
      else
      {
        Ivar = _UIDebugIvarValue((__CFString *)&a1[Offset], TypeEncoding, 0);
      }
      objc_msgSend(v5, "appendFormat:", CFSTR("%@"), Ivar);
    }
  }
  free(v6);
  return v5;
}

- (void)_ivarDescription
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)MEMORY[0x186DC9484]();
  objc_msgSend(v2, "appendFormat:", CFSTR("%@:"), ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_description))(a1, sel_description));
  v4 = objc_opt_class();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__ivarDescriptionForClass:", v5));
      v5 = (void *)objc_msgSend(v5, "superclass");
    }
    while (v5);
  }
  objc_autoreleasePoolPop(v3);
  return v2;
}

- (void)__propertyDescriptionForClass:()IvarDescription
{
  void *v4;
  objc_property_t *v5;
  unint64_t i;
  unsigned int outCount;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v4, "appendFormat:", CFSTR("\n\nin %@:"), a3);
  outCount = 0;
  v5 = class_copyPropertyList(a3, &outCount);
  if (outCount)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n\tProperties:"));
    if (outCount)
    {
      for (i = 0; i < outCount; objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\t%@"), _UIKitPropertyDescription(v5[i++])));
    }
  }
  free(v5);
  objc_msgSend(v4, "appendString:", CFSTR("\n"));
  return v4;
}

- (void)_propertyDescription
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v2, "appendFormat:", CFSTR("%@:"), ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_description))(a1, sel_description));
  v3 = objc_opt_class();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__propertyDescriptionForClass:", v4));
      v4 = (void *)objc_msgSend(v4, "superclass");
    }
    while (v4);
  }
  return v2;
}

- (void)__methodDescriptionForClass:()IvarDescription
{
  void *v4;
  const char *Name;
  objc_class *MetaClass;
  Method *v7;
  unint64_t i;
  objc_property_t *v9;
  unint64_t j;
  Method *v11;
  unint64_t k;
  unsigned int v14;
  unsigned int v15;
  unsigned int outCount;

  v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v4, "appendFormat:", CFSTR("\nin %@:"), a3);
  outCount = 0;
  Name = class_getName(a3);
  MetaClass = objc_getMetaClass(Name);
  v7 = class_copyMethodList(MetaClass, &outCount);
  if (outCount)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n\tClass Methods:"));
    if (outCount)
    {
      for (i = 0; i < outCount; objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\t%@"), _UIKitMethodDescription(v7[i++], 0)));
    }
  }
  free(v7);
  v15 = 0;
  v9 = class_copyPropertyList(a3, &v15);
  if (v15)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n\tProperties:"));
    if (v15)
    {
      for (j = 0; j < v15; objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\t%@"), _UIKitPropertyDescription(v9[j++])))
        ;
    }
  }
  free(v9);
  v14 = 0;
  v11 = class_copyMethodList(a3, &v14);
  if (v14)
  {
    objc_msgSend(v4, "appendString:", CFSTR("\n\tInstance Methods:"));
    if (v14)
    {
      for (k = 0; k < v14; objc_msgSend(v4, "appendFormat:", CFSTR("\n\t\t%@"), _UIKitMethodDescription(v11[k++], 1)))
        ;
    }
  }
  free(v11);
  return v4;
}

- (void)_methodDescription
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v2, "appendFormat:", CFSTR("%@:"), ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_description))(a1, sel_description));
  v3 = objc_opt_class();
  if (v3)
  {
    v4 = (void *)v3;
    do
    {
      objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__methodDescriptionForClass:", v4));
      v4 = (void *)objc_msgSend(v4, "superclass");
    }
    while (v4);
  }
  return v2;
}

- (void)_shortMethodDescription
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  objc_msgSend(v2, "appendFormat:", CFSTR("%@:"), ((uint64_t (*)(void *, char *))objc_msgSend(MEMORY[0x1E0DE7910], "instanceMethodForSelector:", sel_description))(a1, sel_description));
  v3 = (void *)objc_opt_class();
  while (v3)
  {
    objc_msgSend(v2, "appendString:", objc_msgSend(a1, "__methodDescriptionForClass:", v3));
    v3 = (void *)objc_msgSend(v3, "superclass");
    v4 = objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", v3);
    if (v4 != objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle"))
    {
      objc_msgSend(v2, "appendFormat:", CFSTR("\n(%@ ...)"), v3);
      return v2;
    }
  }
  return v2;
}

@end
