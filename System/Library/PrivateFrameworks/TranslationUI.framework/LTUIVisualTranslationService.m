@implementation LTUIVisualTranslationService

+ (void)isTranslatable:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "compactObservations:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[VisualTranslationService isTranslatable:completion:](_TtC13TranslationUI24VisualTranslationService, "isTranslatable:completion:", v7, v5);
}

- (void)translate:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "compactObservations:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  +[VisualTranslationService translate:sourceLocale:targetLocale:completion:](_TtC13TranslationUI24VisualTranslationService, "translate:sourceLocale:targetLocale:completion:", v7, 0, 0, v5);
}

- (void)translate:(id)a3 targetLocale:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend((id)objc_opt_class(), "compactObservations:", v9);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  +[VisualTranslationService translate:sourceLocale:targetLocale:completion:](_TtC13TranslationUI24VisualTranslationService, "translate:sourceLocale:targetLocale:completion:", v10, 0, v8, v7);
}

- (void)translate:(id)a3 sourceLocale:(id)a4 targetLocale:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  objc_msgSend((id)objc_opt_class(), "compactObservations:", v12);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  +[VisualTranslationService translate:sourceLocale:targetLocale:completion:](_TtC13TranslationUI24VisualTranslationService, "translate:sourceLocale:targetLocale:completion:", v13, v11, v10, v9);
}

+ (id)compactObservations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  __int128 v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "count"))
  {
    v5 = (void *)objc_msgSend(v4, "mutableCopy");
    v6 = objc_msgSend(v5, "count");
    if (v6 - 1 >= 0)
    {
      v8 = v6;
      *(_QWORD *)&v7 = 134217984;
      v15 = v7;
      do
      {
        objc_msgSend(v5, "objectAtIndexedSubscript:", --v8, v15);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {

        }
        else
        {
          objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "getLines");
            v12 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v12)
            {
              v13 = _LTOSLogVisualTranslation();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v15;
                v17 = v8;
                _os_log_error_impl(&dword_1D2CC0000, v13, OS_LOG_TYPE_ERROR, "Text block at index %lu has no observations", buf, 0xCu);
              }
              objc_msgSend(v5, "removeObjectAtIndex:", v8);
            }
          }
          else
          {

          }
        }
      }
      while (v8 > 0);
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v5;
}

@end
