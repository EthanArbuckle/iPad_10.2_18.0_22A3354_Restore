@implementation VisionCoreRuntimeUtilities

+ (BOOL)item:(id)a3 overridesSelector:(SEL)a4
{
  objc_class *v5;
  objc_class *v6;
  BOOL isClass;
  objc_class *Class;
  BOOL v9;

  v5 = (objc_class *)a3;
  v6 = v5;
  if (v5)
  {
    isClass = object_isClass(v5);
    Class = v6;
    if (!isClass)
      Class = object_getClass(v6);
    v9 = _classImplementsSelector(Class, a4);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (int)linkTimeVersion
{
  if (linkTimeVersion_onceToken != -1)
    dispatch_once(&linkTimeVersion_onceToken, &__block_literal_global_2282);
  return linkTimeVersion_version;
}

+ (int)runTimeVersion
{
  if (runTimeVersion_onceToken != -1)
    dispatch_once(&runTimeVersion_onceToken, &__block_literal_global_4);
  return runTimeVersion_version;
}

+ (BOOL)linkTimeOrRunTimeBeforeVersion:(int)a3
{
  int v5;

  v5 = objc_msgSend(a1, "linkTimeVersion");
  if (v5 == -1)
    v5 = objc_msgSend(a1, "runTimeVersion");
  return v5 < a3;
}

+ (BOOL)linkTimeOrRunTimeAtLeastVersion:(int)a3
{
  int v5;

  v5 = objc_msgSend(a1, "linkTimeVersion");
  if (v5 == -1)
    v5 = objc_msgSend(a1, "runTimeVersion");
  return v5 > a3;
}

+ (id)signatureForItem:(id)a3 selector:(SEL)a4
{
  id v5;
  _BOOL4 isClass;
  objc_class *Class;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v5 = a3;
  isClass = object_isClass(v5);
  Class = object_getClass(v5);

  v8 = objc_alloc(MEMORY[0x24BDD17C8]);
  NSStringFromClass(Class);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 45;
  if (isClass)
    v11 = 43;
  v12 = (void *)objc_msgSend(v8, "initWithFormat:", CFSTR("%c[%@ %@]"), v11, v9, v10);

  return v12;
}

+ (BOOL)item:(id)a3 overridesClassSelector:(SEL)a4
{
  id v5;
  void *v6;
  objc_class *Class;
  objc_class *v8;
  const char *Name;
  BOOL v10;

  v5 = a3;
  v6 = v5;
  if (!v5)
    goto LABEL_8;
  Class = (objc_class *)v5;
  if (!object_isClass(v5))
  {
    Class = object_getClass(v6);
    if (!Class)
      goto LABEL_8;
  }
  if (!class_isMetaClass(Class))
  {
    Name = class_getName(Class);
    objc_getMetaClass(Name);
    v8 = (objc_class *)(id)objc_claimAutoreleasedReturnValue();
    if (v8)
      goto LABEL_7;
LABEL_8:
    v10 = 0;
    goto LABEL_9;
  }
  v8 = objc_retainAutorelease(Class);
LABEL_7:
  v10 = _classImplementsSelector(v8, a4);
LABEL_9:

  return v10;
}

+ (void)enumerateSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 usingBlock:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_class *Superclass;
  id v12;
  const char **v13;
  const char **v14;
  void *v15;
  unint64_t i;
  const char *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;
  Class v23;
  _QWORD v24[4];
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  unsigned int outCount;

  v5 = a4;
  v7 = a5;
  v8 = v7;
  v9 = MEMORY[0x24BDAC760];
  if (v5)
  {
    v10 = (void *)MEMORY[0x2207A662C](v7);
  }
  else
  {
    Superclass = class_getSuperclass(a3);
    v21[0] = v9;
    v21[1] = 3221225472;
    v21[2] = __87__VisionCoreRuntimeUtilities_enumerateSubclassesOfClass_excludingRootClass_usingBlock___block_invoke;
    v21[3] = &unk_24E1DBD50;
    v23 = a3;
    v22 = v8;
    v10 = (void *)MEMORY[0x2207A662C](v21);

    a3 = Superclass;
  }
  v12 = v10;
  outCount = 0;
  v13 = objc_copyImageNames(&outCount);
  if (v13)
  {
    v14 = v13;
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v24[0] = v9;
    v24[1] = 3221225472;
    v24[2] = ___enumerateProcessSubclasses_block_invoke;
    v24[3] = &unk_24E1DBD98;
    v25 = v12;
    v26 = &v27;
    v15 = (void *)MEMORY[0x2207A662C](v24);
    if (outCount)
    {
      for (i = 0; i < outCount; ++i)
      {
        if (*((_BYTE *)v28 + 24))
          break;
        v17 = v14[i];
        v18 = v15;
        if (v17)
        {
          v19 = dlopen(v17, 16);
          v20 = v19;
          if (v19)
          {
            objc_enumerateClasses(v19, 0, 0, a3, v18);
            dlclose(v20);
          }
        }

      }
    }

    _Block_object_dispose(&v27, 8);
    free(v14);
  }

}

+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __89__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v6[4] = a5;
  +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)allSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __94__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingClassSelector___block_invoke;
  v6[3] = &__block_descriptor_40_e12_B24__0_8_B16l;
  v6[4] = a5;
  +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, v6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4
{
  void *v6;
  void *v7;

  +[VisionCoreRuntimeUtilities _subclassesOfClass:excludingRootClass:passingTest:]((uint64_t)a1, (uint64_t)a3, a4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v6, (uint64_t)a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingSelector:(SEL)a5
{
  void *v7;
  void *v8;

  +[VisionCoreRuntimeUtilities allSubclassesOfClass:excludingRootClass:overridingSelector:](VisionCoreRuntimeUtilities, "allSubclassesOfClass:excludingRootClass:overridingSelector:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)leafSubclassesOfClass:(Class)a3 excludingRootClass:(BOOL)a4 overridingClassSelector:(SEL)a5
{
  void *v7;
  void *v8;

  +[VisionCoreRuntimeUtilities allSubclassesOfClass:excludingRootClass:overridingClassSelector:](VisionCoreRuntimeUtilities, "allSubclassesOfClass:excludingRootClass:overridingClassSelector:", a3, a4, a5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[VisionCoreRuntimeUtilities _leafClassesFromSubclasses:withRootClass:]((uint64_t)a1, v7, (uint64_t)a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_leafClassesFromSubclasses:(uint64_t)a3 withRootClass:
{
  id v4;
  unint64_t v5;
  void *v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v4 = a2;
  objc_opt_self();
  v5 = objc_msgSend(v4, "count");
  if (v5 > 1)
  {
    v7 = v5;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1698]), "initWithIndexesInRange:", 0, v5);
    v9 = 0;
    while (1)
    {
      if (objc_msgSend(v8, "containsIndex:", v9))
      {
        v10 = (void *)objc_msgSend(v4, "objectAtIndexedSubscript:", v9);
        v11 = objc_msgSend(v10, "isSubclassOfClass:", a3);
        v12 = v9;
        if (!v11)
          goto LABEL_12;
        v13 = objc_msgSend(v10, "superclass", v9);
        if (v13)
          break;
      }
LABEL_13:
      if (++v9 == v7)
      {
        objc_msgSend(v4, "objectsAtIndexes:", v8);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_15;
      }
    }
    v14 = (void *)v13;
    while (1)
    {
      v15 = objc_msgSend(v4, "indexOfObject:", v14);
      if (v15 != 0x7FFFFFFFFFFFFFFFLL)
        break;
      v14 = (void *)objc_msgSend(v14, "superclass");
      if (!v14)
        goto LABEL_13;
    }
    v12 = v15;
LABEL_12:
    objc_msgSend(v8, "removeIndex:", v12);
    goto LABEL_13;
  }
  v6 = (void *)objc_msgSend(v4, "copy");
LABEL_15:

  return v6;
}

+ (id)_subclassesOfClass:(uint64_t)a3 excludingRootClass:(void *)a4 passingTest:
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;

  v6 = a4;
  v7 = (void *)objc_opt_self();
  v8 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __80__VisionCoreRuntimeUtilities__subclassesOfClass_excludingRootClass_passingTest___block_invoke;
  v14[3] = &unk_24E1DBCE8;
  v16 = v6;
  v9 = v8;
  v15 = v9;
  v10 = v6;
  objc_msgSend(v7, "enumerateSubclassesOfClass:excludingRootClass:usingBlock:", a2, a3, v14);
  v11 = v15;
  v12 = v9;

  return v12;
}

uint64_t __80__VisionCoreRuntimeUtilities__subclassesOfClass_excludingRootClass_passingTest___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(a1 + 40);
  if (!v4)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 16))(v4, a2);
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return result;
}

BOOL __94__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingClassSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VisionCoreRuntimeUtilities item:overridesClassSelector:](VisionCoreRuntimeUtilities, "item:overridesClassSelector:", a2, *(_QWORD *)(a1 + 32));
}

BOOL __89__VisionCoreRuntimeUtilities_allSubclassesOfClass_excludingRootClass_overridingSelector___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[VisionCoreRuntimeUtilities item:overridesSelector:](VisionCoreRuntimeUtilities, "item:overridesSelector:", a2, *(_QWORD *)(a1 + 32));
}

Class __87__VisionCoreRuntimeUtilities_enumerateSubclassesOfClass_excludingRootClass_usingBlock___block_invoke(Class result, Class cls)
{
  Class v2;
  objc_class *v3;

  if (cls)
  {
    v2 = result;
    v3 = (objc_class *)*((_QWORD *)result + 5);
    if (v3)
    {
      result = cls;
      while (result != v3)
      {
        result = class_getSuperclass(result);
        if (!result)
          return result;
      }
      return (Class)(*(uint64_t (**)(void))(*((_QWORD *)v2 + 4) + 16))();
    }
  }
  return result;
}

uint64_t __44__VisionCoreRuntimeUtilities_runTimeVersion__block_invoke()
{
  uint64_t result;

  result = NSVersionOfRunTimeLibrary("VisionCore");
  runTimeVersion_version = result;
  return result;
}

uint64_t __45__VisionCoreRuntimeUtilities_linkTimeVersion__block_invoke()
{
  uint64_t result;

  result = NSVersionOfLinkTimeLibrary("VisionCore");
  linkTimeVersion_version = result;
  return result;
}

@end
