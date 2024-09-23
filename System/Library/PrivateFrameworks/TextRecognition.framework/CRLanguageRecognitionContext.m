@implementation CRLanguageRecognitionContext

- (id)initWithScript:(void *)a3 defaultLocale:
{
  id v6;
  id *v7;
  void *v8;
  SEL v9;
  void *v10;
  SEL v11;
  objc_super v13;

  v6 = a3;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)CRLanguageRecognitionContext;
    v7 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v7;
    if (v7)
    {
      v7[5] = a2;
      v8 = (void *)objc_opt_new();
      objc_setProperty_atomic(a1, v9, v8, 32);

      v10 = (void *)objc_opt_new();
      objc_setProperty_atomic(a1, v11, v10, 24);

      *((_DWORD *)a1 + 4) = 0;
      objc_storeStrong(a1 + 6, a3);
    }
  }

  return a1;
}

- (void)processFeature:(void *)a3 recognizer:
{
  id v5;
  id v6;
  SEL v7;
  const char *v8;
  id Property;
  id v10;
  dispatch_semaphore_t v11;
  const char *v12;
  dispatch_semaphore_t v13;
  SEL v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  SEL v23;
  id v24;
  id self;

  self = a2;
  v5 = a3;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v6 = *(id *)(a1 + 8);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

    if (v6)
    {
      -[CRLanguageRecognitionContext _updateFeatureLocale:](a1, self);
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
      objc_msgSend(objc_getProperty((id)a1, v7, 24, 1), "addObject:", self);
      Property = self;
      if (self)
        Property = objc_getProperty(self, v8, 80, 1);
      v10 = Property;
      v11 = dispatch_semaphore_create(0);
      v13 = v11;
      if (v10)
      {
        objc_setProperty_atomic(v10, v12, v11, 376);

        v15 = objc_getProperty(v10, v14, 352, 1);
      }
      else
      {

        v15 = 0;
      }
      v16 = v15;
      objc_msgSend(v16, "candidates");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "fullString");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_crStringByPreparingForLanguageRecognition");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v20, "length"))
      {
        v22 = objc_msgSend(objc_getProperty((id)a1, v21, 32, 1), "length");
        v24 = objc_getProperty((id)a1, v23, 32, 1);
        if (v22)
          objc_msgSend(v24, "appendFormat:", CFSTR(" %@"), v20);
        else
          objc_msgSend(v24, "appendString:", v20);
      }
      if ((unint64_t)objc_msgSend(objc_getProperty((id)a1, v21, 32, 1), "length") >= 0x32)
        -[CRLanguageRecognitionContext runRecognitionWithRecognizer:force:]((_QWORD *)a1, v5, 0);
      os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

    }
  }

}

- (void)_updateFeatureLocale:(uint64_t)a1
{
  id v3;
  const char *v4;
  id v5;

  if (self && (v3 = objc_getProperty(self, (SEL)self, 80, 1)) != 0)
  {
    v5 = v3;
    objc_setProperty_atomic(v3, v4, *(id *)(a1 + 8), 368);
  }
  else
  {
    v5 = 0;
  }

}

- (void)runRecognitionWithRecognizer:(int)a3 force:
{
  const char *v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  char v20;
  id Property;
  const char *v22;
  id v23;
  const char *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  SEL v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  if (a1 && !a1[1])
  {
    if ((unint64_t)objc_msgSend(objc_getProperty(a1, v5, 32, 1), "length") >= 0x10)
    {
      objc_msgSend(objc_getProperty(a1, v7, 32, 1), "_crPredictedLocaleUsingRecognizer:resetContext:", v6, 1);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)a1[1];
      a1[1] = v8;

    }
    v10 = a1[1];
    if (!v10 && a3)
    {
      v11 = objc_getProperty(a1, v7, 48, 1);
      v12 = (void *)a1[1];
      a1[1] = v11;

      v10 = a1[1];
    }
    if (v10)
    {
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v13 = objc_getProperty(a1, v7, 24, 1);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        do
        {
          v17 = 0;
          do
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(v13);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
            -[CRLanguageRecognitionContext _updateFeatureLocale:]((uint64_t)a1, v18);
            if (v18)
            {
              v20 = 1;
              Property = objc_getProperty(v18, v19, 80, 1);
              v18 = Property;
              if (Property)
              {
                Property = objc_getProperty(Property, v22, 376, 1);
                v20 = 0;
              }
            }
            else
            {
              Property = 0;
              v20 = 1;
            }
            v23 = Property;

            if (v23)
            {
              if ((v20 & 1) != 0)
                v25 = 0;
              else
                v25 = objc_getProperty(v18, v24, 376, 1);
              v26 = v25;
              dispatch_semaphore_signal(v26);

            }
            ++v17;
          }
          while (v15 != v17);
          v27 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
          v15 = v27;
        }
        while (v27);
      }

      v29 = objc_getProperty(a1, v28, 24, 1);
      objc_msgSend(v29, "removeAllObjects", (_QWORD)v30);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLocale, 0);
  objc_storeStrong((id *)&self->_contextString, 0);
  objc_storeStrong((id *)&self->_featuresAccumulator, 0);
  objc_storeStrong((id *)&self->_recognizedLanguage, 0);
}

@end
