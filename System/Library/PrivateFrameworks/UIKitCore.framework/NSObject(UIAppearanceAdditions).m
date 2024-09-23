@implementation NSObject(UIAppearanceAdditions)

+ (uint64_t)_installAppearanceSwizzlesForSetter:()UIAppearanceAdditions
{
  SEL v6;
  const char *v7;
  void *v8;
  unint64_t v9;
  const char *v10;
  void (*v11)(void);
  uint64_t (*v12)(void *, const char *, uint64_t);
  uint64_t v13;
  uint64_t i;
  const char *v15;
  objc_method *InstanceMethod;
  const char *TypeEncoding;
  void (*v18)(void);
  uint64_t result;
  NSObject *v20;
  unint64_t v21;
  NSObject *v22;
  void (*imp)(void);
  const char *v24;
  void *v25;
  uint8_t buf[4];
  const char *Name;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = UIAppearancePrefixedSelectorForSelectorString(a3);
  v25 = a3;
  v7 = NSSelectorFromString((NSString *)a3);
  v8 = (void *)objc_msgSend(a1, "instanceMethodSignatureForSelector:", v7);
  v9 = objc_msgSend(v8, "numberOfArguments");
  if (os_variant_has_internal_diagnostics())
  {
    if (v9 <= 2)
    {
      v20 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 136315138;
        Name = sel_getName(a2);
        _os_log_fault_impl(&dword_185066000, v20, OS_LOG_TYPE_FAULT, "%s Not a setter!", buf, 0xCu);
      }
    }
  }
  else if (v9 <= 2)
  {
    v21 = _installAppearanceSwizzlesForSetter____s_category;
    if (!_installAppearanceSwizzlesForSetter____s_category)
    {
      v21 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v21, (unint64_t *)&_installAppearanceSwizzlesForSetter____s_category);
    }
    v22 = *(NSObject **)(v21 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      Name = sel_getName(a2);
      _os_log_impl(&dword_185066000, v22, OS_LOG_TYPE_ERROR, "%s Not a setter!", buf, 0xCu);
    }
  }
  v10 = (const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", 2);
  v24 = v6;
  if (!strcmp(v10, "@"))
  {
    v11 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    if (v9 == 4)
      v11 = (void (*)(void))TaggingAppearanceObjectSetter1IMP;
    v12 = TaggingAppearanceObjectSetterIMP;
  }
  else if (!strcmp(v10, "Q") || !strcmp(v10, "q"))
  {
    v11 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    v12 = TaggingAppearanceIntegerSetterIMP;
  }
  else
  {
    if (strcmp(v10, "i") && strcmp(v10, "I"))
    {
      if (strcmp(v10, "d")
        && strcmp(v10, "f")
        && strcmp(v10, "{CGPoint=dd}")
        && strcmp(v10, "{CGSize=dd}")
        && strcmp(v10, "{UIOffset=dd}")
        && strcmp(v10, "{CGRect={CGPoint=dd}{CGSize=dd}}")
        && strcmp(v10, "{UIEdgeInsets=dddd}")
        && strcmp(v10, "B")
        && strcmp(v10, "c")
        && strcmp(v10, "#"))
      {
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("*** Illegal property type, %s for appearance setter, %@"), v10, v25);
      }
      v11 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
      goto LABEL_27;
    }
    v11 = (void (*)(void))TaggingAppearanceGeneralSetterIMP;
    v12 = TaggingAppearanceIntSetterIMP;
  }
  if (v9 == 3)
    v11 = (void (*)(void))v12;
LABEL_27:
  imp = v11;
  if (v9 >= 4)
  {
    v13 = *MEMORY[0x1E0C99778];
    for (i = 3; i != v9; ++i)
    {
      v15 = (const char *)objc_msgSend(v8, "getArgumentTypeAtIndex:", i);
      if (strcmp(v15, "Q") && strcmp(v15, "q") && strcmp(v15, "i") && strcmp(v15, "I"))
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", v13, CFSTR("*** Illegal axis type, %s, for appearance setter, %@. Expected NSInteger or NSUInteger"), v15, v25);
    }
  }
  InstanceMethod = class_getInstanceMethod((Class)a1, v7);
  TypeEncoding = method_getTypeEncoding(InstanceMethod);
  v18 = class_replaceMethod((Class)a1, v7, imp, TypeEncoding);
  result = class_addMethod((Class)a1, v24, v18, TypeEncoding);
  if ((result & 1) == 0)
    return objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIAppearance.m"), 877, CFSTR("setter method swizzle failed"));
  return result;
}

@end
