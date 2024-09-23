@implementation NSDictionary(NFExtension)

- (id)NF_objectForKey:()NFExtension expectedClass:
{
  id v7;
  void *v8;
  id v9;
  char *v10;
  void *specific;
  void (*v12)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  objc_class *v22;
  Class v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  id v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  Class v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(a1, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v12 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v12)
    {
      Class = object_getClass(a1);
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v24 = object_getClass(v8);
      v17 = 43;
      if (!isMetaClass)
        v17 = 45;
      v12(3, "%c[%{public}s %{public}s]:%i %{public}@ Expected %{public}@, got %{public}@", v17, ClassName, Name, 17, v7, a4, v24);
      v10 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v18 = dispatch_get_specific(v10);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v19 = (id)_NFSharedLogClient[(_QWORD)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(a1);
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      *(_DWORD *)buf = 67110658;
      v26 = v21;
      v27 = 2082;
      v28 = object_getClassName(a1);
      v29 = 2082;
      v30 = sel_getName(a2);
      v31 = 1024;
      v32 = 17;
      v33 = 2114;
      v34 = v7;
      v35 = 2114;
      v36 = a4;
      v37 = 2114;
      v38 = object_getClass(v8);
      v22 = v38;
      _os_log_impl(&dword_1C34DB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i %{public}@ Expected %{public}@, got %{public}@", buf, 0x40u);

    }
    v9 = 0;
  }
  else
  {
    v9 = v8;
  }

  return v9;
}

- (id)NF_dictionaryForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)NF_arrayForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)NF_stringForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)NF_urlForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)NF_dataForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)NF_numberForKey:()NFExtension
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "NF_objectForKey:expectedClass:", v4, objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
