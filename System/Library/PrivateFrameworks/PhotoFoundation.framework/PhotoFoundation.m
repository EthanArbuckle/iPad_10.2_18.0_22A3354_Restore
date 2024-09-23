BOOL PFObjc_implementsInstanceMethod(objc_class *a1, const char *a2)
{
  Method *v3;
  uint64_t v4;
  SEL Name;
  _BOOL8 v6;
  unsigned int outCount;

  outCount = 0;
  v3 = class_copyMethodList(a1, &outCount);
  if (outCount)
  {
    v4 = 0;
    while (1)
    {
      Name = method_getName(v3[v4]);
      v6 = Name == a2;
      if (Name == a2)
        break;
      if (++v4 >= (unint64_t)outCount)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v6 = 0;
  }
  free(v3);
  return v6;
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  if (PFProcessIsLaunchedToExecuteTests_predicate != -1)
    dispatch_once(&PFProcessIsLaunchedToExecuteTests_predicate, &__block_literal_global_18);
  return PFProcessIsLaunchedToExecuteTests_isLaunchedToExecuteTests;
}

void sub_1B70DBF7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PFStateCaptureGetLog()
{
  if (PFStateCaptureGetLog_predicate != -1)
    dispatch_once(&PFStateCaptureGetLog_predicate, &__block_literal_global_2);
  return (id)PFStateCaptureGetLog_log;
}

id PFBackendGetLog()
{
  if (PFBackendGetLog_predicate != -1)
    dispatch_once(&PFBackendGetLog_predicate, &__block_literal_global_12);
  return (id)PFBackendGetLog_log;
}

BOOL PFObjc_implementsClassMethod(void *a1, const char *a2)
{
  objc_class *Class;

  Class = object_getClass(a1);
  return PFObjc_implementsInstanceMethod(Class, a2);
}

id PFPhotoFoundationBinaryImageUUID()
{
  int image_uuid;
  void *v1;
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = 0;
  v3[1] = 0;
  image_uuid = _dyld_get_image_uuid();
  v1 = 0;
  if (image_uuid)
    v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDBytes:", v3);
  return v1;
}

__CFString *PFStringVersionOfRunTimeLibrary(void *a1)
{
  int32_t v1;

  v1 = NSVersionOfRunTimeLibrary((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
  return _PFLibraryVersionToString(v1);
}

__CFString *_PFLibraryVersionToString(int a1)
{
  uint64_t v1;
  __CFString *v2;
  uint64_t v4;
  uint64_t v5;

  if (a1 == -1)
  {
    v2 = CFSTR("0.0.0");
  }
  else
  {
    v1 = (a1 >> 16);
    if ((_BYTE)a1)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d.%d"), v1, BYTE1(a1), a1);
    }
    else if (BYTE1(a1))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d"), v1, BYTE1(a1), v5);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), v1, v4, v5);
    }
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

__CFString *PFStringVersionOfLinkTimeLibrary(void *a1)
{
  int32_t v1;

  v1 = NSVersionOfLinkTimeLibrary((const char *)objc_msgSend(objc_retainAutorelease(a1), "UTF8String"));
  return _PFLibraryVersionToString(v1);
}

id PFStringWithValidatedFormatAndLocale(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  objc_class *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  const __CFString *v29;
  void *v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v9 = (objc_class *)MEMORY[0x1E0CB3940];
  v10 = a3;
  v32 = 0;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", v7, v8, v10, a4, &v32);

  v12 = v32;
  if (!v11)
  {
    if (PFStringWithValidatedFormatAndLocale_predicate != -1)
      dispatch_once(&PFStringWithValidatedFormatAndLocale_predicate, &__block_literal_global);
    v13 = v7;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v13, "formatConfiguration");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("format"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("one"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            v18 = v16;
          }
          else
          {
            objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("two"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v20;
            if (v20)
            {
              v18 = v20;
            }
            else
            {
              objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("few"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              if (v22)
              {
                v23 = v22;
                v18 = v22;
              }
              else
              {
                objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("many"));
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  v25 = v24;
                  v18 = v24;
                }
                else
                {
                  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("zero"));
                  v26 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v26;
                  if (v26)
                  {
                    v27 = v26;
                  }
                  else
                  {
                    objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("other"));
                    v27 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  v18 = v27;

                  v25 = 0;
                }

                v23 = 0;
              }

              v21 = 0;
            }

          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v28 = v18;
          else
            v28 = v13;
          v19 = v28;

        }
        else
        {
          v19 = v13;
        }

      }
      else
      {
        v19 = v13;
      }

    }
    else
    {
      v19 = v13;
    }

    if (PFStringWithValidatedFormatAndLocale_doubleLocalizedStrings)
    {
      v29 = CFSTR("*NSDoubleLocalizedStrings: FORMAT_VALIDATION_FAIL ('%@')*");
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        v34 = v19;
        v35 = 2112;
        v36 = v8;
        v37 = 2112;
        v38 = v12;
        _os_log_fault_impl(&dword_1B70DA000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "failed to make string with validated format for '%@' with specifiers '%@': %@", buf, 0x20u);
      }
      v29 = CFSTR("*FORMAT_VALIDATION_FAIL ('%@')*");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v29, v19);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

id PFStringWithValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  PFStringWithValidatedFormatAndLocale(a1, a2, 0, (uint64_t)&a9);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PFLocalizedStringWithValidatedFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v10 = (void *)MEMORY[0x1E0C99DC8];
  v11 = a2;
  v12 = a1;
  objc_msgSend(v10, "currentLocale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PFStringWithValidatedFormatAndLocale(v12, v11, v13, (uint64_t)&a9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id PFUIGetLog()
{
  if (PFUIGetLog_predicate != -1)
    dispatch_once(&PFUIGetLog_predicate, &__block_literal_global_4);
  return (id)PFUIGetLog_log;
}

void sub_1B70DD7DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B70DDBE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B70DDC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void _PFAssertFailHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a4;
  +[PFAssertionHandler currentHandler](PFAssertionHandler, "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:arguments:", v14, v15, a3, v12, &a9);

  abort();
}

void _PFAssertContinueHandler(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v12 = a4;
  +[PFAssertionHandler currentHandler](PFAssertionHandler, "currentHandler");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "continueAfterAssertInFunction:file:lineNumber:description:arguments:", v14, v15, a3, v12, &a9);

}

id PFMethodNotImplementedException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PFFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: method not implemented sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PFFullMethodName(void *a1, const char *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v3 = a1;
  v4 = objc_opt_class();

  v5 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromSelector(a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 45;
  if ((id)v4 == v3)
    v7 = 43;
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%c[%@ %@]"), v7, v4, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id PFAbstractMethodException(void *a1, const char *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v3 = a1;
  PFFullMethodName(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0C99DA0];
  v6 = *MEMORY[0x1E0C99778];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: must override selector sent to %p"), v4, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "exceptionWithName:reason:userInfo:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

double PFFloatNan()
{
  if (PFFloatNan_onceToken != -1)
    dispatch_once(&PFFloatNan_onceToken, &__block_literal_global_36);
  return *(double *)&PFFloatNan_result;
}

id PFMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v5 = objc_msgSend(v3, "performSelector:", sel_count)) != 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v6 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v6;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v8 = v3;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v12));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v7, "addObject:", v13, (_QWORD)v15);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id PFMapDictionary(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD, void *);
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v15);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v4[2](v4, v11, v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v11);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id PFMapIndexes(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, uint64_t);
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v3, "firstIndex");
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    for (i = v6; i != 0x7FFFFFFFFFFFFFFFLL; i = objc_msgSend(v3, "indexGreaterThanIndex:", i))
    {
      v4[2](v4, i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
        objc_msgSend(v5, "addObject:", v8);

    }
  }

  return v5;
}

id PFFilter(void *a1, void *a2)
{
  id v3;
  unsigned int (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
          if (v4[2](v4, v11))
            objc_msgSend(v5, "addObject:", v11, (_QWORD)v13);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t PFCount(void *a1, void *a2)
{
  id v3;
  unsigned int (**v4)(id, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v3);
        v7 += v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i));
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id PFFind(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, void *);
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v3;
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i);
        if ((v4[2](v4, v9) & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

uint64_t PFExists(void *a1, void *a2)
{
  id v3;
  uint64_t (**v4)(id, _QWORD);
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if ((v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i)) & 1) != 0)
        {
          v6 = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

id PFReduce(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, _QWORD, void *);
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = v6;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v9 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  v10 = v8;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v17;
    v10 = v8;
    do
    {
      v13 = 0;
      v14 = v10;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v5);
        v7[2](v7, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13), v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        ++v13;
        v14 = v10;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v10;
}

double PFReduceF(void *a1, void *a2, double a3)
{
  id v5;
  double (**v6)(id, _QWORD, double);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v5);
        a3 = v6[2](v6, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), a3);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

  return a3;
}

BOOL PFObjc_classIsSubclassOfClass(objc_class *Superclass, objc_class *a2)
{
  do
    Superclass = class_getSuperclass(Superclass);
  while (Superclass && Superclass != a2);
  return Superclass == a2;
}

void PFObjc_enumerateClassNamesForImageHeader(uint64_t a1, void *a2)
{
  id v2;
  void *v3;

  v2 = a2;
  v3 = (void *)objc_copyClassNamesForImageHeader();
  free(v3);

}

void PFObjc_enumerateSubclassesForHeader(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  uint64_t v12;

  v7 = a4;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __PFObjc_enumerateSubclassesForHeader_block_invoke;
  v9[3] = &unk_1E6B771E0;
  v11 = a2;
  v12 = a3;
  v10 = v7;
  v8 = v7;
  PFObjc_enumerateClassNamesForImageHeader(a1, v9);

}

objc_class *PFObjc_implementingClassForInstanceMethod(objc_class *a1, const char *a2)
{
  do
  {
    if (PFObjc_implementsInstanceMethod(a1, a2))
      break;
    a1 = (objc_class *)-[objc_class superclass](a1, "superclass");
  }
  while (a1);
  return a1;
}

BOOL PFSizeLargerThanSize(double a1, double a2, double a3, double a4)
{
  return a2 > a4 || a1 > a3;
}

double PFSizeWithAspectRatioFittingSize(double a1, double a2, double a3)
{
  BOOL v3;
  double v4;

  if (a2 == 0.0 || a3 == 0.0)
    return 0.0;
  v3 = a2 == INFINITY && a3 == INFINITY;
  v4 = 0.0;
  if (!v3)
  {
    if (fabs(a2 / a3) <= a1)
      return a2;
    else
      return a3 * a1;
  }
  return v4;
}

double PFSizeWithAspectRatioFillingSize(double a1, double a2, double a3)
{
  BOOL v3;
  double v4;

  if (a2 == 0.0 || a3 == 0.0)
    return 0.0;
  v3 = a2 == INFINITY && a3 == INFINITY;
  v4 = 0.0;
  if (!v3)
  {
    if (fabs(a2 / a3) >= a1)
      return a2;
    else
      return a3 * a1;
  }
  return v4;
}

double PFScaleFactorForMaximumPixelCount(unint64_t a1, double a2, double a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  double result;
  double v12;
  double v13;
  uint64_t vars0;

  if (a2 == 0.0 || a3 == 0.0)
    _PFAssertFailHandler((uint64_t)"CGFloat PFScaleFactorForMaximumPixelCount(CGSize, NSUInteger)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFGeometryUtilities.m", 50, CFSTR("non-zero inputSize required"), a7, a8, a9, a10, vars0);
  if (!a1)
    _PFAssertFailHandler((uint64_t)"CGFloat PFScaleFactorForMaximumPixelCount(CGSize, NSUInteger)", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Photos/Projects/PhotoFoundation/Source/PFGeometryUtilities.m", 51, CFSTR("maximumPixelCount > 0 required"), a7, a8, a9, a10, vars0);
  result = sqrt((double)a1 / (a2 * a3));
  if (a2 >= a3)
    v12 = a2;
  else
    v12 = a3;
  v13 = round(v12 * result);
  if (a2 < a3)
    a3 = a2;
  if (v13 * round(a3 * result) > (double)a1)
    return result * ((v13 + -1.0) / v13);
  return result;
}

BOOL PFRectIsNull(double a1, double a2)
{
  return a2 == INFINITY || a1 == INFINITY;
}

double PFRectByFlippingHorizontallyInRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a5 + a7 - a1 - a3;
}

double PFLargestSalientAspectFilledCropRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12, double a13, double a14, double a15)
{
  double v20;
  BOOL v21;
  double v22;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;

  if (a3 == 0.0)
  {
    v20 = 0.0;
  }
  else
  {
    v20 = 0.0;
    if (a4 != 0.0)
    {
      v21 = fabs(a3 / a4) <= a5;
      v22 = a4 * a5;
      if (v21)
        v22 = a3;
      if (a3 != INFINITY || a4 != INFINITY)
        v20 = v22;
    }
  }
  v24 = a1 + a9 * a3;
  v25 = a3 * a11;
  v26 = a1 + a13 * a3 + a3 * a15 * 0.5 + v20 * -0.5;
  v27 = v24 + a3 * a11 * 0.5;
  if (v26 >= v24)
  {
    v28 = v24 + v25;
    if (v20 + v26 > v28)
    {
      v26 = v28 - v20;
      v29 = v27 + v20 * -0.5;
      if (v25 < v20)
        v26 = v29;
    }
  }
  else
  {
    v26 = v27 + v20 * -0.5;
    if (v25 >= v20)
      v26 = v24;
  }
  return fmax(fmin(v26, a3 - v20), 0.0);
}

uint64_t PFOSVariantHasInternalUI()
{
  if (PFOSVariantHasInternalUI_onceToken != -1)
    dispatch_once(&PFOSVariantHasInternalUI_onceToken, &__block_literal_global_204);
  return PFOSVariantHasInternalUI_isAppleInternal;
}

uint64_t PFOSVariantHasInternalDiagnostics()
{
  if (PFOSVariantHasInternalDiagnostics_onceToken != -1)
    dispatch_once(&PFOSVariantHasInternalDiagnostics_onceToken, &__block_literal_global_2_208);
  return PFOSVariantHasInternalDiagnostics_hasInternalDiagnostics;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1B70E0940(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B70E0AEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

int32_t NSVersionOfLinkTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C805C8](libraryName);
}

int32_t NSVersionOfRunTimeLibrary(const char *libraryName)
{
  return MEMORY[0x1E0C805D0](libraryName);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C80E78]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

IMP method_setImplementation(Method m, IMP imp)
{
  return (IMP)MEMORY[0x1E0DE7B98](m, imp);
}

double nan(const char *a1)
{
  double result;

  MEMORY[0x1E0C84228](a1);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

uint64_t objc_copyClassNamesForImageHeader()
{
  return MEMORY[0x1E0DE7C18]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

Class objc_lookUpClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7D10](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

Class object_getClass(id a1)
{
  return (Class)MEMORY[0x1E0DE7FF8](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_has_internal_ui()
{
  return MEMORY[0x1E0C84A00]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

