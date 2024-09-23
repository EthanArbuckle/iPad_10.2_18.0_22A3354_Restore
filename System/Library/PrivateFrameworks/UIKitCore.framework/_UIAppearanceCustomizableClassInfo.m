@implementation _UIAppearanceCustomizableClassInfo

- (unint64_t)hash
{
  return self->_hash;
}

- (Class)_customizableViewClass
{
  return self->_customizableViewClass;
}

- (Class)_guideClass
{
  Class result;

  result = self->_guideClass;
  if (!result)
    return self->_customizableViewClass;
  return result;
}

- (id)_superClassInfo
{
  objc_class *guideClass;
  Class v5;
  Class Superclass;
  Class customizableViewClass;

  guideClass = self->_guideClass;
  if (guideClass && !self->_isGuideClassRoot)
  {
    customizableViewClass = self->_customizableViewClass;
    Superclass = class_getSuperclass(guideClass);
    v5 = customizableViewClass;
  }
  else
  {
    if (self->_isCustomizableViewClassRoot)
      return 0;
    v5 = class_getSuperclass(self->_customizableViewClass);
    Superclass = self->_guideClass;
  }
  return +[_UIAppearanceCustomizableClassInfo _customizableClassInfoForViewClass:withGuideClass:](_UIAppearanceCustomizableClassInfo, "_customizableClassInfoForViewClass:withGuideClass:", v5, Superclass);
}

+ (id)_cachedClassInfoForViewClass:(Class)a3 withGuideClass:(Class)a4
{
  void *v7;
  void *v8;
  Class v9;
  _QWORD *v10;
  id v11;
  BOOL v12;
  Class Superclass;
  BOOL v14;
  void *v15;
  NSString *v16;
  NSString *v17;
  NSString *v18;

  v7 = (void *)qword_1ECD7E1A8;
  if (!qword_1ECD7E1A8)
  {
    qword_1ECD7E1A8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 0);
    qword_1ECD7E1B0 = CFSTR("no guide class");
    v7 = (void *)qword_1ECD7E1A8;
  }
  v8 = (void *)objc_msgSend(v7, "objectForKey:", a3);
  if (!v8)
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 514, 0, 0);
    objc_msgSend((id)qword_1ECD7E1A8, "setObject:forKey:", v8, a3);

  }
  if (a4)
    v9 = a4;
  else
    v9 = (Class)qword_1ECD7E1B0;
  v10 = (_QWORD *)objc_msgSend(v8, "objectForKey:", v9);
  if (!v10)
  {
    v10 = objc_alloc_init((Class)a1);
    v10[4] = a3;
    v10[5] = a4;
    if (a4)
    {
      v11 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", a4);
      v12 = v11 == _UIKitBundle();
    }
    else
    {
      v12 = 0;
    }
    *((_BYTE *)v10 + 8) = v12;
    if ((Class)objc_opt_class() == a3)
    {
      v14 = 1;
    }
    else
    {
      Superclass = class_getSuperclass(a3);
      v14 = Superclass == (Class)objc_opt_class();
    }
    *((_BYTE *)v10 + 9) = v14;
    if (a4)
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      v16 = NSStringFromClass(a3);
      v17 = (NSString *)objc_msgSend(v15, "stringWithFormat:", CFSTR("%@-%@"), v16, NSStringFromClass(a4));
    }
    else
    {
      v17 = NSStringFromClass(a3);
    }
    v18 = v17;
    v10[2] = v17;
    v10[3] = -[NSString hash](v18, "hash");
    objc_msgSend(v8, "setObject:forKey:", v10, v9);

  }
  return v10;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
    return 1;
  objc_opt_class();
  return (objc_opt_isKindOfClass() & 1) != 0
      && -[NSString isEqualToString:](self->_classReferenceKey, "isEqualToString:", objc_msgSend(a3, "_classReferenceKey"));
}

- (NSString)_classReferenceKey
{
  return self->_classReferenceKey;
}

- (id)description
{
  void *v3;
  NSString *v4;
  objc_class *guideClass;
  const __CFString *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = NSStringFromClass(self->_customizableViewClass);
  guideClass = self->_guideClass;
  if (guideClass)
    v6 = (const __CFString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(", Guide class: %@>"), NSStringFromClass(guideClass));
  else
    v6 = CFSTR(">");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<Customizable class: %@%@"), v4, v6);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIAppearanceCustomizableClassInfo;
  -[_UIAppearanceCustomizableClassInfo dealloc](&v3, sel_dealloc);
}

- (unint64_t)_hash
{
  return self->_hash;
}

@end
