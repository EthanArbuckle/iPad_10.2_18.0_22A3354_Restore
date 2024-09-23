@implementation NFNSCheckedDecoder

void __54__NFNSCheckedDecoder_coder_decodeArrayOfClass_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  void *v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  int v20;
  const char *v21;
  const char *v22;
  void *v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint8_t buf[4];
  int v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  uint64_t v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = 0;

    *a4 = 1;
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v11)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v26 = objc_opt_class();
      v16 = 45;
      if (isMetaClass)
        v16 = 43;
      v11(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v16, ClassName, Name, 33, v26, *(_QWORD *)(a1 + 40));
      v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v17 = dispatch_get_specific(v9);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v18 = (id)_NFSharedLogClient[(_QWORD)v17];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v19 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v19))
        v20 = 43;
      else
        v20 = 45;
      v21 = object_getClassName(*(id *)(a1 + 48));
      v22 = sel_getName(*(SEL *)(a1 + 56));
      v23 = (void *)objc_opt_class();
      v24 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      v28 = v20;
      v29 = 2082;
      v30 = v21;
      v31 = 2082;
      v32 = v22;
      v33 = 1024;
      v34 = 33;
      v35 = 2114;
      v36 = v23;
      v37 = 2114;
      v38 = v24;
      v25 = v23;
      _os_log_impl(&dword_1C34DB000, v18, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
  }

}

+ (id)coder:(id)a3 decodeArrayOfClass:(Class)a4 forKey:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *specific;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v18;
  const char *ClassName;
  const char *Name;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  void *v28;
  id v29;
  _QWORD v31[8];
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  const char *v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  int v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  const __CFString *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), a4, 0);
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy_;
  v36 = __Block_byref_object_dispose_;
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v11, v10);
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (!v33[5])
  {
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v16 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v16)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class))
        v18 = 43;
      else
        v18 = 45;
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v21 = objc_opt_class();
      v16(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v18, ClassName, Name, 25, v21, CFSTR("NSArray"));
      v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v22 = dispatch_get_specific(v14);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v23 = (id)_NFSharedLogClient[(_QWORD)v22];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(a1);
      v27 = sel_getName(a2);
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 67110402;
      v39 = v25;
      v40 = 2082;
      v41 = v26;
      v42 = 2082;
      v43 = v27;
      v44 = 1024;
      v45 = 25;
      v46 = 2114;
      v47 = v28;
      v48 = 2114;
      v49 = CFSTR("NSArray");
      v29 = v28;
      _os_log_impl(&dword_1C34DB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
    goto LABEL_18;
  }
  v12 = (void *)v33[5];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __54__NFNSCheckedDecoder_coder_decodeArrayOfClass_forKey___block_invoke;
  v31[3] = &unk_1E7D7F728;
  v31[4] = &v32;
  v31[5] = a4;
  v31[6] = a1;
  v31[7] = a2;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v31);
  v13 = (id)v33[5];
LABEL_19:
  _Block_object_dispose(&v32, 8);

  return v13;
}

+ (id)coder:(id)a3 decodeArrayOfArrayOfClass:(Class)a4 forKey:(id)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  char *v14;
  void *specific;
  void (*v16)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v18;
  const char *ClassName;
  const char *Name;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  objc_class *v24;
  int v25;
  const char *v26;
  const char *v27;
  void *v28;
  id v29;
  _QWORD v31[9];
  _QWORD v32[3];
  char v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", objc_opt_class(), a4, 0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v11, v10);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  if (!v35[5])
  {
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v16 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v16)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class))
        v18 = 43;
      else
        v18 = 45;
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v21 = objc_opt_class();
      v16(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v18, ClassName, Name, 53, v21, CFSTR("NSArray"));
      v14 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v22 = dispatch_get_specific(v14);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v23 = (id)_NFSharedLogClient[(_QWORD)v22];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      v24 = object_getClass(a1);
      if (class_isMetaClass(v24))
        v25 = 43;
      else
        v25 = 45;
      v26 = object_getClassName(a1);
      v27 = sel_getName(a2);
      v28 = (void *)objc_opt_class();
      *(_DWORD *)buf = 67110402;
      v41 = v25;
      v42 = 2082;
      v43 = v26;
      v44 = 2082;
      v45 = v27;
      v46 = 1024;
      v47 = 53;
      v48 = 2114;
      v49 = v28;
      v50 = 2114;
      v51 = CFSTR("NSArray");
      v29 = v28;
      _os_log_impl(&dword_1C34DB000, v23, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
    goto LABEL_18;
  }
  v12 = (void *)v35[5];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke;
  v31[3] = &unk_1E7D7F750;
  v31[6] = a1;
  v31[7] = a2;
  v31[8] = a4;
  v31[4] = &v34;
  v31[5] = v32;
  objc_msgSend(v12, "enumerateObjectsUsingBlock:", v31);
  v13 = (id)v35[5];
LABEL_19:
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);

  return v13;
}

void __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  char *v8;
  void *specific;
  void (*v10)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  int v19;
  const char *v20;
  const char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  _QWORD v26[6];
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  int v35;
  __int16 v36;
  id v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke_4;
    v26[3] = &unk_1E7D7F728;
    v7 = *(_QWORD *)(a1 + 64);
    v27 = *(_OWORD *)(a1 + 48);
    v26[4] = *(_QWORD *)(a1 + 40);
    v26[5] = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v26);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      goto LABEL_18;
  }
  else
  {
    v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v10 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v10)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v25 = objc_opt_class();
      v15 = 45;
      if (isMetaClass)
        v15 = 43;
      v10(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v15, ClassName, Name, 60, v25, CFSTR("NSArray"));
      v8 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v16 = dispatch_get_specific(v8);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v17 = (id)_NFSharedLogClient[(_QWORD)v16];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v18))
        v19 = 43;
      else
        v19 = 45;
      v20 = object_getClassName(*(id *)(a1 + 48));
      v21 = sel_getName(*(SEL *)(a1 + 56));
      *(_DWORD *)buf = 67110402;
      v29 = v19;
      v30 = 2082;
      v31 = v20;
      v32 = 2082;
      v33 = v21;
      v34 = 1024;
      v35 = 60;
      v36 = 2114;
      v37 = (id)objc_opt_class();
      v38 = 2114;
      v39 = CFSTR("NSArray");
      v22 = v37;
      _os_log_impl(&dword_1C34DB000, v17, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
  }
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v24 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = 0;

  *a4 = 1;
LABEL_18:

}

void __61__NFNSCheckedDecoder_coder_decodeArrayOfArrayOfClass_forKey___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  char *v7;
  void *specific;
  void (*v9)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  objc_class *v17;
  int v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v9 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v9)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v24 = objc_opt_class();
      v14 = 45;
      if (isMetaClass)
        v14 = 43;
      v9(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v14, ClassName, Name, 66, v24, *(_QWORD *)(a1 + 40));
      v7 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v15 = dispatch_get_specific(v7);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v16 = (id)_NFSharedLogClient[(_QWORD)v15];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v17))
        v18 = 43;
      else
        v18 = 45;
      v19 = object_getClassName(*(id *)(a1 + 48));
      v20 = sel_getName(*(SEL *)(a1 + 56));
      v21 = (void *)objc_opt_class();
      v22 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110402;
      v26 = v18;
      v27 = 2082;
      v28 = v19;
      v29 = 2082;
      v30 = v20;
      v31 = 1024;
      v32 = 66;
      v33 = 2114;
      v34 = v21;
      v35 = 2114;
      v36 = v22;
      v23 = v21;
      _os_log_impl(&dword_1C34DB000, v16, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
    *a4 = 1;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  }

}

+ (id)coder:(id)a3 decodeDictOfClass:(Class)a4 forKey:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  char *v16;
  void *specific;
  void (*v18)(uint64_t, const char *, ...);
  objc_class *Class;
  uint64_t v20;
  const char *ClassName;
  const char *Name;
  uint64_t v23;
  void *v24;
  NSObject *v25;
  objc_class *v26;
  int v27;
  const char *v28;
  const char *v29;
  void *v30;
  id v31;
  _QWORD v33[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  int v41;
  __int16 v42;
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  int v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x1E0C99E60]);
  v12 = objc_opt_class();
  v13 = (void *)objc_msgSend(v11, "initWithObjects:", v12, objc_opt_class(), a4, 0);
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  objc_msgSend(v9, "decodeObjectOfClasses:forKey:", v13, v10);
  v39 = (id)objc_claimAutoreleasedReturnValue();
  if (!v35[5])
  {
LABEL_18:
    v15 = 0;
    goto LABEL_19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v18 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v18)
    {
      Class = object_getClass(a1);
      if (class_isMetaClass(Class))
        v20 = 43;
      else
        v20 = 45;
      ClassName = object_getClassName(a1);
      Name = sel_getName(a2);
      v23 = objc_opt_class();
      v18(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", v20, ClassName, Name, 95, v23, CFSTR("NSDictionary"));
      v16 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v24 = dispatch_get_specific(v16);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v25 = (id)_NFSharedLogClient[(_QWORD)v24];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = object_getClass(a1);
      if (class_isMetaClass(v26))
        v27 = 43;
      else
        v27 = 45;
      v28 = object_getClassName(a1);
      v29 = sel_getName(a2);
      v30 = (void *)objc_opt_class();
      *(_DWORD *)buf = 67110402;
      v41 = v27;
      v42 = 2082;
      v43 = v28;
      v44 = 2082;
      v45 = v29;
      v46 = 1024;
      v47 = 95;
      v48 = 2114;
      v49 = v30;
      v50 = 2114;
      v51 = CFSTR("NSDictionary");
      v31 = v30;
      _os_log_impl(&dword_1C34DB000, v25, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected class %{public}@, expecting %{public}@", buf, 0x36u);

    }
    goto LABEL_18;
  }
  v14 = (void *)v35[5];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __53__NFNSCheckedDecoder_coder_decodeDictOfClass_forKey___block_invoke;
  v33[3] = &unk_1E7D7F778;
  v33[6] = a1;
  v33[7] = a2;
  v33[4] = &v34;
  v33[5] = a4;
  objc_msgSend(v14, "enumerateKeysAndObjectsUsingBlock:", v33);
  v15 = (id)v35[5];
LABEL_19:
  _Block_object_dispose(&v34, 8);

  return v15;
}

void __53__NFNSCheckedDecoder_coder_decodeDictOfClass_forKey___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  char *v9;
  void *specific;
  void (*v11)(uint64_t, const char *, ...);
  objc_class *Class;
  _BOOL4 isMetaClass;
  const char *ClassName;
  const char *Name;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  int v21;
  const char *v22;
  const char *v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint8_t buf[4];
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;
  __int16 v38;
  int v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  void *v43;
  __int16 v44;
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    specific = dispatch_get_specific(kNFLOG_DISPATCH_SPECIFIC_KEY);
    if ((unint64_t)specific >= 4)
      __assert_rtn("NFLogGetLogger", "NFSharedLog.c", 216, "category < NFLogCategoryMax");
    v11 = (void (*)(uint64_t, const char *, ...))*(&_NFLogCustomLoggers + (_QWORD)specific);
    if (v11)
    {
      Class = object_getClass(*(id *)(a1 + 48));
      isMetaClass = class_isMetaClass(Class);
      ClassName = object_getClassName(*(id *)(a1 + 48));
      Name = sel_getName(*(SEL *)(a1 + 56));
      v16 = objc_opt_class();
      v31 = objc_opt_class();
      v17 = 43;
      if (!isMetaClass)
        v17 = 45;
      v11(3, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected key %{public}@, class %{public}@, expecting %{public}@", v17, ClassName, Name, 101, v16, v31, *(_QWORD *)(a1 + 40));
      v9 = kNFLOG_DISPATCH_SPECIFIC_KEY;
    }
    v18 = dispatch_get_specific(v9);
    if (NFSharedLogInitialize_onceToken != -1)
      dispatch_once(&NFSharedLogInitialize_onceToken, &__block_literal_global_3);
    v19 = (id)_NFSharedLogClient[(_QWORD)v18];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v20 = object_getClass(*(id *)(a1 + 48));
      if (class_isMetaClass(v20))
        v21 = 43;
      else
        v21 = 45;
      v22 = object_getClassName(*(id *)(a1 + 48));
      v23 = sel_getName(*(SEL *)(a1 + 56));
      v24 = (void *)objc_opt_class();
      v25 = v24;
      v26 = (void *)objc_opt_class();
      v27 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 67110658;
      v33 = v21;
      v34 = 2082;
      v35 = v22;
      v36 = 2082;
      v37 = v23;
      v38 = 1024;
      v39 = 101;
      v40 = 2114;
      v41 = v24;
      v42 = 2114;
      v43 = v26;
      v44 = 2114;
      v45 = v27;
      v28 = v26;
      _os_log_impl(&dword_1C34DB000, v19, OS_LOG_TYPE_ERROR, "%c[%{public}s %{public}s]:%i XPC Sanitizer : Unexpected key %{public}@, class %{public}@, expecting %{public}@", buf, 0x40u);

    }
    v29 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v30 = *(void **)(v29 + 40);
    *(_QWORD *)(v29 + 40) = 0;

    *a4 = 1;
  }

}

@end
