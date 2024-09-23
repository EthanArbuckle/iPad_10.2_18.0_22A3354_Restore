@implementation IMRuntimeUtil

+ (id)associatedValueForKey:(id)a3 onObject:(id)a4 withDefault:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v7 = a5;
  objc_getAssociatedObject(a4, a3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (v8)
    v10 = (void *)v8;
  else
    v10 = v7;
  v11 = v10;

  return v11;
}

+ (id)associatedValueForKey:(id)a3 onObject:(id)a4
{
  return (id)objc_msgSend(a1, "associatedValueForKey:onObject:withDefault:", a3, a4, 0);
}

+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  _BOOL8 v8;
  void *v10;
  id v11;
  id v12;
  id v13;

  v8 = a3;
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "numberWithBool:", v8);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "associateValue:forKey:onObject:withPolicy:", v13, v12, v11, a6);

}

+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "numberWithDouble:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "associateValue:forKey:onObject:withPolicy:", v13, v12, v11, a6);

}

+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  objc_setAssociatedObject(a5, a4, a3, (void *)a6);
}

+ (void)associateDoubleValue:(double)a3 forKey:(id)a4 onObject:(id)a5
{
  objc_msgSend(a1, "associateDoubleValue:forKey:onObject:withPolicy:", a4, a5, 769, a3);
}

+ (void)associateBoolValue:(BOOL)a3 forKey:(id)a4 onObject:(id)a5
{
  objc_msgSend(a1, "associateBoolValue:forKey:onObject:withPolicy:", a3, a4, a5, 769);
}

+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4 withDefault:(BOOL)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "associatedValueForKey:onObject:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    a5 = objc_msgSend(v6, "BOOLValue");

  return a5;
}

+ (void)swizzleMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5
{
  id v7;
  objc_method *InstanceMethod;
  IMP Implementation;
  void (*v10)(void);
  const char *TypeEncoding;
  id v12;

  v7 = a5;
  if (a3)
  {
    if (a4)
    {
      v12 = v7;
      InstanceMethod = class_getInstanceMethod(a4, a3);
      v7 = v12;
      if (InstanceMethod)
      {
        Implementation = method_getImplementation(InstanceMethod);
        v10 = (void (*)(void))(*((uint64_t (**)(id, IMP))v12 + 2))(v12, Implementation);
        TypeEncoding = method_getTypeEncoding(InstanceMethod);
        class_replaceMethod(a4, a3, v10, TypeEncoding);
        v7 = v12;
      }
    }
  }

}

+ (void)swizzleClassMethod:(SEL)a3 onClass:(Class)a4 withReplacementBlock:(id)a5
{
  id v7;
  objc_method *ClassMethod;
  IMP Implementation;
  void (*v10)(void);
  id v11;

  v7 = a5;
  if (a3)
  {
    if (a4)
    {
      v11 = v7;
      ClassMethod = class_getClassMethod(a4, a3);
      v7 = v11;
      if (ClassMethod)
      {
        Implementation = method_getImplementation(ClassMethod);
        v10 = (void (*)(void))(*((uint64_t (**)(id, IMP))v11 + 2))(v11, Implementation);
        method_setImplementation(ClassMethod, v10);
        v7 = v11;
      }
    }
  }

}

+ (void)associateValue:(id)a3 forKey:(id)a4 onObject:(id)a5
{
  objc_msgSend(a1, "associateValue:forKey:onObject:withPolicy:", a3, a4, a5, 769);
}

+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  id v13;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  v12 = a4;
  objc_msgSend(v10, "numberWithInteger:", a3);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "associateValue:forKey:onObject:withPolicy:", v13, v12, v11, a6);

}

+ (void)associateIntValue:(int64_t)a3 forKey:(id)a4 onObject:(id)a5
{
  objc_msgSend(a1, "associateIntValue:forKey:onObject:withPolicy:", a3, a4, a5, 769);
}

+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5 withPolicy:(unint64_t)a6
{
  void *v10;
  id v11;
  id v12;
  double v13;
  id v14;

  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = a5;
  v12 = a4;
  *(float *)&v13 = a3;
  objc_msgSend(v10, "numberWithFloat:", v13);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "associateValue:forKey:onObject:withPolicy:", v14, v12, v11, a6);

}

+ (void)associateFloatValue:(float)a3 forKey:(id)a4 onObject:(id)a5
{
  objc_msgSend(a1, "associateFloatValue:forKey:onObject:withPolicy:", a4, a5, 769);
}

+ (BOOL)associatedBoolValueForKey:(id)a3 onObject:(id)a4
{
  return objc_msgSend(a1, "associatedBoolValueForKey:onObject:withDefault:", a3, a4, 0);
}

+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4
{
  return objc_msgSend(a1, "associatedIntValueForKey:onObject:withDefault:", a3, a4, 0);
}

+ (int64_t)associatedIntValueForKey:(id)a3 onObject:(id)a4 withDefault:(int64_t)a5
{
  void *v6;
  void *v7;

  objc_msgSend(a1, "associatedValueForKey:onObject:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    a5 = objc_msgSend(v6, "integerValue");

  return a5;
}

+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4
{
  double v4;
  float result;

  LODWORD(v4) = 0;
  objc_msgSend(a1, "associatedFloatValueForKey:onObject:withDefault:", a3, a4, v4);
  return result;
}

+ (float)associatedFloatValueForKey:(id)a3 onObject:(id)a4 withDefault:(float)a5
{
  void *v6;
  void *v7;
  float v8;

  objc_msgSend(a1, "associatedValueForKey:onObject:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "floatValue");
    a5 = v8;
  }

  return a5;
}

+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4
{
  double result;

  objc_msgSend(a1, "associatedDoubleValueForKey:onObject:withDefault:", a3, a4, 0.0);
  return result;
}

+ (double)associatedDoubleValueForKey:(id)a3 onObject:(id)a4 withDefault:(double)a5
{
  void *v6;
  void *v7;
  double v8;

  objc_msgSend(a1, "associatedValueForKey:onObject:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    a5 = v8;
  }

  return a5;
}

@end
