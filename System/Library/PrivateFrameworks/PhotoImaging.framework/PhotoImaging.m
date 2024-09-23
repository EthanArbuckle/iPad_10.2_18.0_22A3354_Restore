id NUAssertLogger()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_81);
  return (id)*MEMORY[0x1E0D52380];
}

{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_68);
  return (id)*MEMORY[0x1E0D52380];
}

{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14493);
  return (id)*MEMORY[0x1E0D52380];
}

{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_135_19695);
  return (id)*MEMORY[0x1E0D52380];
}

{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_20369);
  return (id)*MEMORY[0x1E0D52380];
}

{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21110);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A638795C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

id NUAssertLogger_181()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_195);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_150);
  return (id)*MEMORY[0x1E0D52398];
}

id NUAssertLogger_248()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_91);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_306()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_82);
  return (id)*MEMORY[0x1E0D52380];
}

id DictionaryRepresentationFromObservation(void *a1, _OWORD *a2)
{
  __int128 v3;
  double y;
  double width;
  double height;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  CGAffineTransform v13;
  _QWORD v14[4];
  _QWORD v15[5];
  CGRect v16;
  CGRect v17;

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "boundingBox");
  v3 = a2[1];
  *(_OWORD *)&v13.a = *a2;
  *(_OWORD *)&v13.c = v3;
  *(_OWORD *)&v13.tx = a2[2];
  v17 = CGRectApplyAffineTransform(v16, &v13);
  y = v17.origin.y;
  width = v17.size.width;
  height = v17.size.height;
  v14[0] = CFSTR("x");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17.origin.x);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v7;
  v14[1] = CFSTR("y");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", y);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v8;
  v14[2] = CFSTR("w");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", width);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[2] = v9;
  v14[3] = CFSTR("h");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id NUAssertLogger_408()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_424);
  return (id)*MEMORY[0x1E0D52380];
}

const __CFString *PISemanticStyleCastFromString(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  v2 = CFSTR("Standard");
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Standard")) & 1) == 0)
  {
    v2 = CFSTR("TanWarm");
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("TanWarm")) & 1) == 0)
    {
      v2 = CFSTR("BlushWarm");
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("BlushWarm")) & 1) == 0)
      {
        v2 = CFSTR("Neutral");
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Neutral")) & 1) == 0)
        {
          v2 = CFSTR("Cool");
          if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Cool")) & 1) == 0)
          {
            v2 = CFSTR("NoFilter");
            if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NoFilter")) & 1) == 0)
            {
              v2 = CFSTR("WarmAuthentic");
              if ((objc_msgSend(v1, "isEqualToString:", CFSTR("WarmAuthentic")) & 1) == 0)
              {
                v2 = CFSTR("StarkBW");
                if ((objc_msgSend(v1, "isEqualToString:", CFSTR("StarkBW")) & 1) == 0)
                {
                  v2 = CFSTR("Colorful");
                  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Colorful")) & 1) == 0)
                  {
                    v2 = CFSTR("UrbanCool");
                    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("UrbanCool")) & 1) == 0)
                    {
                      v2 = CFSTR("Earthy");
                      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Earthy")) & 1) == 0)
                      {
                        v2 = CFSTR("CloudCover");
                        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CloudCover")) & 1) == 0)
                        {
                          v2 = CFSTR("DreamyHues");
                          if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DreamyHues")) & 1) == 0)
                          {
                            v2 = CFSTR("GoldWarm");
                            if ((objc_msgSend(v1, "isEqualToString:", CFSTR("GoldWarm")) & 1) == 0)
                            {
                              v2 = CFSTR("LongGray");
                              if (!objc_msgSend(v1, "isEqualToString:", CFSTR("LongGray")))
                                v2 = CFSTR("None");
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }

  return v2;
}

uint64_t PISemanticStyleCastIsEqual(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", a2);
}

uint64_t PISemanticStyleIsIdentity(void *a1, const char *a2)
{
  return objc_msgSend(a1, "isEqualToString:", CFSTR("None"));
}

uint64_t PISemanticStyleIsRenderSupported()
{
  _BOOL8 v0;
  void *v1;
  int v2;
  void *v3;
  void *v4;

  if ((objc_msgSend(MEMORY[0x1E0D52108], "overrideSemanticStylesHardwareCheck") & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "supportsANE");

  if (!v2)
    return 0;
  objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "mainDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = (unint64_t)objc_msgSend(v4, "family") > 6;

  return v0;
}

id PISemanticStyleCastToMakerNoteString(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[15];
  _QWORD v23[16];

  v23[15] = *MEMORY[0x1E0C80C00];
  v1 = (void *)*MEMORY[0x1E0D08960];
  v22[0] = CFSTR("Standard");
  v22[1] = CFSTR("NoFilter");
  v2 = *MEMORY[0x1E0D08958];
  v23[0] = v1;
  v23[1] = v2;
  v3 = *MEMORY[0x1E0D08980];
  v22[2] = CFSTR("WarmAuthentic");
  v22[3] = CFSTR("StarkBW");
  v4 = *MEMORY[0x1E0D08968];
  v23[2] = v3;
  v23[3] = v4;
  v5 = *MEMORY[0x1E0D08920];
  v22[4] = CFSTR("Colorful");
  v22[5] = CFSTR("DreamyHues");
  v6 = *MEMORY[0x1E0D08930];
  v23[4] = v5;
  v23[5] = v6;
  v7 = *MEMORY[0x1E0D08978];
  v22[6] = CFSTR("UrbanCool");
  v22[7] = CFSTR("Earthy");
  v8 = *MEMORY[0x1E0D08938];
  v23[6] = v7;
  v23[7] = v8;
  v9 = *MEMORY[0x1E0D08918];
  v22[8] = CFSTR("CloudCover");
  v22[9] = CFSTR("LongGray");
  v10 = *MEMORY[0x1E0D08948];
  v23[8] = v9;
  v23[9] = v10;
  v11 = *MEMORY[0x1E0D08970];
  v22[10] = CFSTR("TanWarm");
  v22[11] = CFSTR("BlushWarm");
  v12 = *MEMORY[0x1E0D08910];
  v23[10] = v11;
  v23[11] = v12;
  v13 = *MEMORY[0x1E0D08940];
  v22[12] = CFSTR("GoldWarm");
  v22[13] = CFSTR("Neutral");
  v14 = *MEMORY[0x1E0D08950];
  v23[12] = v13;
  v23[13] = v14;
  v22[14] = CFSTR("Cool");
  v23[14] = *MEMORY[0x1E0D08928];
  v15 = (void *)MEMORY[0x1E0C99D80];
  v16 = a1;
  objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v23, v22, 15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
    v19 = v18;
  else
    v19 = v1;
  v20 = v19;

  return v20;
}

id PISemanticStyleMakerNotePropertiesFromSettings(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v1 = (objc_class *)MEMORY[0x1E0C99E08];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("tone"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0C89D40]);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("color"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0C89D20]);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("intensity"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0C89D28]);

  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("cast"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PISemanticStyleCastToMakerNoteString(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(MEMORY[0x1E0D08AD0], "makerNoteTagForSmartStyleCastType:smartStyleVersion:", v8, 1));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0C89D18]);

  objc_msgSend(v3, "setObject:forKeyedSubscript:", &unk_1E5050FC8, *MEMORY[0x1E0C89D30]);
  return v3;
}

id PISemanticStyleSettingsFromMakerNoteProperties(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D38]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
      v4 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = (uint64_t)v3;
        _os_log_error_impl(&dword_1A6382000, v4, OS_LOG_TYPE_ERROR, "Invalid style version value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      v3 = 0;
    }
  }
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D18]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
      v6 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = (uint64_t)v5;
        _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Invalid style cast value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      v5 = 0;
    }
  }
  objc_msgSend(MEMORY[0x1E0D08AD0], "smartStyleCastForMakerNoteTag:smartStyleVersion:", objc_msgSend(v5, "unsignedIntegerValue"), objc_msgSend(v3, "unsignedIntValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    if (*MEMORY[0x1E0D52390] != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
    v8 = (void *)*MEMORY[0x1E0D52398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
    {
      v16 = v8;
      v17 = objc_msgSend(v5, "unsignedIntegerValue");
      v18 = objc_msgSend(v3, "unsignedIntValue");
      v19 = 134218240;
      v20 = v17;
      v21 = 1024;
      v22 = v18;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Invalid style cast: %lu (%u), ignored.", (uint8_t *)&v19, 0x12u);

    }
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("cast"));
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D40]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
      v10 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = (uint64_t)v9;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Invalid style tone value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      v9 = 0;
    }
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("tone"));
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D20]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
      v12 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = (uint64_t)v11;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Invalid style color value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      v11 = 0;
    }
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("color"));
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0C89D28]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      if (*MEMORY[0x1E0D52390] != -1)
        dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_537);
      v14 = *MEMORY[0x1E0D52398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_ERROR))
      {
        v19 = 138543362;
        v20 = (uint64_t)v13;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Invalid style intensity value: %{public}@, ignored.", (uint8_t *)&v19, 0xCu);
      }

      v13 = 0;
    }
  }
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, CFSTR("intensity"));

  return v2;
}

id NUAssertLogger_577()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_111);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A638EEA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9)
{

  _Unwind_Resume(a1);
}

id NUAssertLogger_701()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_718);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_800()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_28);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_857()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_91_878);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_970()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_148);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_1092()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1108);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_1235()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_283);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A639A4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A639AA0C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A639AF30(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id NUAssertLogger_1319()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1309);
  return (id)*MEMORY[0x1E0D52380];
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

id NUAssertLogger_1622()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_353);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_1666()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_1690);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_1749()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_31);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63A12A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_1893()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_149);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2119()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_92_2132);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2237()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2253);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2498()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2476);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2642()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2658);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2782()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_115);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_2965()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_2938);
  return (id)*MEMORY[0x1E0D52380];
}

__CFString *PIParallaxStyleClockFontForKind(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  __CFString *v10;
  _QWORD v12[13];
  _QWORD v13[14];

  v13[13] = *MEMORY[0x1E0C80C00];
  v1 = *MEMORY[0x1E0D75600];
  v12[0] = *MEMORY[0x1E0D75610];
  v12[1] = v1;
  v13[0] = CFSTR("SF Soft Time");
  v13[1] = CFSTR("SF Soft Time");
  v2 = *MEMORY[0x1E0D755B8];
  v12[2] = *MEMORY[0x1E0D75608];
  v12[3] = v2;
  v13[2] = CFSTR("SF Rounded Time");
  v13[3] = CFSTR("New York Time");
  v3 = *MEMORY[0x1E0D755C8];
  v12[4] = *MEMORY[0x1E0D755B0];
  v12[5] = v3;
  v13[4] = CFSTR("New York Time");
  v13[5] = CFSTR("ADT Slab Time");
  v4 = *MEMORY[0x1E0D755D8];
  v12[6] = *MEMORY[0x1E0D755C0];
  v12[7] = v4;
  v13[6] = CFSTR("ADT Slab Time");
  v13[7] = CFSTR("SF Stencil Time");
  v5 = *MEMORY[0x1E0D755E0];
  v12[8] = *MEMORY[0x1E0D755D0];
  v12[9] = v5;
  v13[8] = CFSTR("SF Rail Time");
  v13[9] = CFSTR("ADT Slab Time");
  v6 = *MEMORY[0x1E0D755E8];
  v12[10] = *MEMORY[0x1E0D755F8];
  v12[11] = v6;
  v13[10] = CFSTR("New York Heavy");
  v13[11] = CFSTR("SF Soft Time");
  v12[12] = *MEMORY[0x1E0D755F0];
  v13[12] = CFSTR("New York Heavy");
  v7 = (void *)MEMORY[0x1E0C99D80];
  v8 = a1;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v13, v12, 13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v8);
  v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = CFSTR("SF Soft Time");

  return v10;
}

id NUAssertLogger_3149()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_278);
  return (id)*MEMORY[0x1E0D52380];
}

const __CFString *PIParallaxStyleTonalityDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("Unspecified Key");
  else
    return off_1E5015C38[a1 - 1];
}

uint64_t PIParallaxStyleTonalityFromMedianLuminance(double a1)
{
  uint64_t v1;

  v1 = 3;
  if (a1 < 0.67)
    v1 = 2;
  if (a1 < 0.33)
    return 1;
  else
    return v1;
}

uint64_t PIParallaxStylePrefersVibrantClockForKind(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D755B8]) & 1) != 0)
    v2 = 0;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0D755B0]) ^ 1;

  return v2;
}

void sub_1A63B6E64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A63B769C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_3386()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_661);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_3444()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_662);
  return (id)*MEMORY[0x1E0D52398];
}

const __CFString *PIPosterSettlingEffectStatusDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 4)
    return CFSTR("unknown");
  else
    return off_1E5015D58[a1 - 1];
}

id NUAssertLogger_3661()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_42);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63C44DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_3899()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_293);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__3912(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3913(uint64_t a1)
{

}

id NUAssertLogger_4162()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_105);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_4240()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_4281);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_4407()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_222);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63CB4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void sub_1A63CC004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1A63CCB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4600(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4601(uint64_t a1)
{

}

id NUAssertLogger_4602()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_223_4613);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63CDB3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 128));
  _Unwind_Resume(a1);
}

void sub_1A63CDF2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A63CFCC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 208), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_4825()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_4846);
  return (id)*MEMORY[0x1E0D52380];
}

double *GUTemp_to_xy(double *result, double *a2, double a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  if (a3 < 2000.0)
    a3 = 2000.0;
  v3 = 50000.0;
  if (a3 <= 50000.0)
    v3 = a3;
  v4 = 1000.0 / (v3 * 1.4388 / 1.438);
  if (v3 >= 4500.0)
  {
    v7 = v4 * v4;
    v8 = v4 * (v4 * v4);
    if (v3 >= 7000.0)
    {
      v5 = v7 * 1.9018 + v8 * -2.0064 + v4 * 0.24748;
      v6 = 0.23704;
    }
    else
    {
      v5 = v7 * 2.9678 + v8 * -4.607 + v4 * 0.09911;
      v6 = 0.244063;
    }
  }
  else
  {
    v5 = v4 * 1.0874 + v4 * v4 * -0.6734;
    v6 = 0.15259;
  }
  v9 = v5 + v6;
  if (v9 <= 0.35)
  {
    v10 = v9 * 2.87 + v9 * -3.0 * v9;
    v11 = -0.2751;
  }
  else
  {
    v10 = v9 * (v9 * -1.05) + v9 * (v9 * -1.3295) * v9 + v9 * 2.0;
    v11 = -0.15247;
  }
  *result = v9;
  *a2 = v10 + v11;
  return result;
}

double GUGetAdaptationMatrix(double *a1, double *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v9;
  __int128 v10;
  uint64_t v11;
  double v12;
  __int128 v13;
  uint64_t v14;
  double v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a1[1];
  v4 = a1[2];
  v5 = v3 * 0.2664 + *a1 * 0.8951 + v4 * -0.1614;
  v6 = v3 * 1.7135 + *a1 * -0.7502 + v4 * 0.0367;
  v7 = v3 * -0.0685 + *a1 * 0.0389 + v4 * 1.0296;
  v11 = 0;
  v14 = 0;
  v13 = 0u;
  v10 = 0u;
  v9 = 0.99631656 / v5;
  v12 = 1.02043099 / v6;
  v15 = 0.81832442 / v7;
  GUMatrixMatrix(GUGetAdaptationMatrix_Bradford_mtx, &v9, a2);
  return GUMatrixMatrix(a2, GUGetAdaptationMatrix_invBradford_mtx, a2);
}

double GUInvertMatrix(double *a1, double *a2)
{
  double result;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;

  result = *a1;
  v3 = a1[1];
  v5 = a1[2];
  v4 = a1[3];
  v6 = a1[4];
  v7 = a1[5];
  v8 = a1[6];
  v9 = a1[7];
  v10 = a1[8];
  v11 = -(*a1 * v7);
  v12 = v5 * -(v8 * v6) + *a1 * v6 * v10 + v5 * v4 * v9 + -(v4 * v3) * v10 + v3 * v7 * v8 + v11 * v9;
  if (v12 != 0.0)
  {
    *a2 = (v6 * v10 - v9 * v7) / v12;
    a2[1] = (v9 * v5 - v3 * v10) / v12;
    a2[2] = (v3 * v7 - v6 * v5) / v12;
    a2[3] = (v10 * -v4 + v8 * v7) / v12;
    a2[4] = (v5 * -v8 + result * v10) / v12;
    a2[5] = (v11 + v4 * v5) / v12;
    a2[6] = (v4 * v9 - v8 * v6) / v12;
    a2[7] = (v9 * -result + v8 * v3) / v12;
    result = (result * v6 - v4 * v3) / v12;
    a2[8] = result;
  }
  return result;
}

double GUMatrixMatrix(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double result;

  v3 = *a1;
  v4 = a1[1];
  v5 = a1[2];
  v6 = a1[3];
  v7 = a1[4];
  v8 = a1[5];
  v9 = a1[6];
  v10 = a1[7];
  v11 = a1[8];
  v12 = *a2;
  v13 = a2[1];
  v14 = a2[2];
  v15 = a2[3];
  v16 = a2[4];
  v17 = a2[5];
  v18 = a2[6];
  v19 = a2[7];
  v20 = a2[8];
  v21 = v7 * v13 + v4 * *a2 + v10 * v14;
  *a3 = v6 * v13 + *a1 * *a2 + v9 * v14;
  a3[1] = v21;
  a3[2] = v8 * v13 + v5 * v12 + v11 * v14;
  a3[3] = v6 * v16 + v3 * v15 + v9 * v17;
  a3[4] = v7 * v16 + v4 * v15 + v10 * v17;
  a3[5] = v8 * v16 + v5 * v15 + v11 * v17;
  a3[6] = v6 * v19 + v3 * v18 + v9 * v20;
  a3[7] = v7 * v19 + v4 * v18 + v10 * v20;
  result = v8 * v19 + v5 * v18 + v11 * v20;
  a3[8] = result;
  return result;
}

id NUAssertLogger_4917()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_4933);
  return (id)*MEMORY[0x1E0D52380];
}

double GUMatrixVector(double *a1, double *a2, double *a3)
{
  double v3;
  double v4;
  double v5;
  double result;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  *a3 = v4 * a1[1] + *a2 * *a1 + v5 * a1[2];
  a3[1] = v4 * a1[4] + v3 * a1[3] + v5 * a1[5];
  result = v4 * a1[7] + v3 * a1[6] + v5 * a1[8];
  a3[2] = result;
  return result;
}

void sub_1A63D276C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5009()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_5028);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63D3690(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,id a39)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a39);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5182()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_5219);
  return (id)*MEMORY[0x1E0D52380];
}

void CreateKeyframesFromHomographyDictionary(void *a1, CMTimeEpoch a2, uint64_t a3, void *a4, __int128 *a5)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  __int128 v19;
  int32x4_t v20;
  float32x4_t v21;
  int32x4_t v22;
  uint64_t v23;
  void *v24;
  const __CFDictionary *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  __int32 v32;
  void *v33;
  __int32 v34;
  void *v35;
  __int32 v36;
  void *v37;
  __int32 v38;
  void *v39;
  __int32 v40;
  void *v41;
  float32x4_t v42;
  float32x4_t v43;
  float32x4_t v44;
  __int32 v45;
  uint64_t v46;
  uint64_t v47;
  PIReframeKeyframe *v48;
  PIReframeKeyframe *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id obj;
  uint64_t v55;
  int32x4_t v56;
  float32x4_t v57;
  id v58;
  uint64_t v59;
  __int32 v60;
  __int32 v61;
  __int32 v62;
  __int32 v63;
  __int32 v64;
  void *v65;
  void *v66;
  uint64_t v67;
  __int128 v68;
  float32x4_t v69;
  __int128 v70;
  float32x4_t v72;
  float32x4_t v73;
  float32x4_t v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  CMTime v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  int32x4_t v84;
  __int128 v85;
  __int128 v86;
  int32x4_t v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v58 = a4;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("stabCropRect"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("X"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Y"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("Width"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "integerValue");
  v52 = v8;
  v15 = v8;
  v16 = a3;
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("Height"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "integerValue");

  *(_QWORD *)&v82 = v10;
  *((_QWORD *)&v82 + 1) = v12;
  *(_QWORD *)&v83 = v14;
  *((_QWORD *)&v83 + 1) = v18;
  v80.value = 0;
  *(_QWORD *)&v80.timescale = 0;
  v80.epoch = a2;
  v81 = v16;
  NUPixelRectFlipYOrigin();
  v19 = v86;
  *a5 = v85;
  a5[1] = v19;
  v53 = v7;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("frameInstructions"));
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
  if (v59)
  {
    *(float *)v20.i32 = (float)v16;
    v21.i32[0] = 0;
    v21.f32[1] = (float)v16;
    v21.i32[2] = 1.0;
    v57 = v21;
    v22 = vzip1q_s32((int32x4_t)xmmword_1A64DDDF0, v20);
    v22.i32[3] = 0;
    v56 = v22;
    v55 = *(_QWORD *)v77;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v77 != v55)
          objc_enumerationMutation(obj);
        v67 = v23;
        v24 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * v23);
        memset(&v80, 0, sizeof(v80));
        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("rawTime"));
        v25 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
        CMTimeMakeFromDictionary(&v80, v25);

        objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("homography"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v26, "count") != 9)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void CreateKeyframesFromHomographyDictionary(NSDictionary *__strong, NUPixelSize, NSMutableArray<PIReframeKeyframe *> *__strong, NUPixelRect *)");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("PIVideoStabilizeRequest.m"), 162, CFSTR("unexpected homography"));

        }
        objc_msgSend(v26, "objectAtIndexedSubscript:", 0);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "floatValue");
        v73.i64[0] = v27;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "floatValue");
        *(_QWORD *)&v70 = v28;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "floatValue");
        *(_QWORD *)&v68 = v30;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 3);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "floatValue");
        v64 = v32;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 4);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "floatValue");
        v63 = v34;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 5);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "floatValue");
        v62 = v36;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 6);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "floatValue");
        v61 = v38;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 7);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "floatValue");
        v60 = v40;
        objc_msgSend(v26, "objectAtIndexedSubscript:", 8);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "floatValue");
        v42 = v73;
        v42.i32[1] = v64;
        v42.i32[2] = v61;
        v75 = v42;
        v43 = (float32x4_t)v70;
        v43.i32[1] = v63;
        v43.i32[2] = v60;
        v72 = v43;
        v44 = (float32x4_t)v68;
        v44.i32[1] = v62;
        v44.i32[2] = v45;
        v69 = v44;

        v46 = 0;
        v82 = xmmword_1A64DDE00;
        v83 = xmmword_1A64DDE10;
        v84 = v56;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        do
        {
          *(__int128 *)((char *)&v85 + v46) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v75, COERCE_FLOAT(*(__int128 *)((char *)&v82 + v46))), v72, *(float32x2_t *)((char *)&v82 + v46), 1), v69, *(float32x4_t *)((char *)&v82 + v46), 2);
          v46 += 16;
        }
        while (v46 != 48);
        v47 = 0;
        v82 = v85;
        v83 = v86;
        v84 = v87;
        v85 = 0u;
        v86 = 0u;
        v87 = 0u;
        do
        {
          *(__int128 *)((char *)&v85 + v47) = (__int128)vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)xmmword_1A64DDE00, COERCE_FLOAT(*(__int128 *)((char *)&v82 + v47))), (float32x4_t)xmmword_1A64DDE10, *(float32x2_t *)((char *)&v82 + v47), 1), v57, *(float32x4_t *)((char *)&v82 + v47), 2);
          v47 += 16;
        }
        while (v47 != 48);
        v70 = v86;
        v73 = (float32x4_t)v87;
        v68 = v85;
        v48 = [PIReframeKeyframe alloc];
        v85 = *(_OWORD *)&v80.value;
        *(_QWORD *)&v86 = v80.epoch;
        v49 = -[PIReframeKeyframe initWithTime:homography:](v48, "initWithTime:homography:", &v85, *(double *)&v68, *(double *)&v70, *(double *)v73.i64);
        objc_msgSend(v58, "addObject:", v49);

        v23 = v67 + 1;
      }
      while (v67 + 1 != v59);
      v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v88, 16);
    }
    while (v59);
  }

}

_PIVideoStabilizeResult *PIVideoStabilizeResultFromHomographies(void *a1, CMTimeEpoch a2, uint64_t a3)
{
  void *v5;
  id v6;
  void *v7;
  _PIVideoStabilizeResult *v8;
  _PIVideoStabilizeResult *v9;
  _OWORD v11[2];
  __int128 v12;
  __int128 v13;

  v5 = (void *)MEMORY[0x1E0C99DE8];
  v6 = a1;
  objc_msgSend(v5, "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  CreateKeyframesFromHomographyDictionary(v6, a2, a3, v7, &v12);
  v8 = [_PIVideoStabilizeResult alloc];
  v11[0] = v12;
  v11[1] = v13;
  v9 = -[_PIVideoStabilizeResult initWithKeyframes:stabCropRect:analysisType:rawHomographies:](v8, "initWithKeyframes:stabCropRect:analysisType:rawHomographies:", v7, v11, 0, v6);

  return v9;
}

void sub_1A63D5548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a55, 8);
  _Unwind_Resume(a1);
}

void sub_1A63D5AC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5324()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_252);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__5351(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5352(uint64_t a1)
{

}

void sub_1A63D6BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  uint64_t v42;

  _Block_object_dispose(&a42, 8);
  _Block_object_dispose((const void *)(v42 - 232), 8);
  _Block_object_dispose((const void *)(v42 - 184), 8);
  _Block_object_dispose((const void *)(v42 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A63D76C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A63D8330(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

double angular_error(double a1, double a2)
{
  double v2;
  double v3;

  v2 = sqrt(a2 * a2 + a1 * a1) * 0.466690494;
  v3 = 0.0;
  if (v2 > 0.0)
    return acos((a2 * 0.330000013 + a1 * 0.330000013) / v2) * 180.0 / 3.14159265;
  return v3;
}

void YIQFromRGB(double *a1, double *a2, double *a3, double *a4, double a5, double a6, double a7)
{
  _QWORD *v14;
  os_log_t *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  long double v24;
  long double v25;
  long double v26;
  long double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  NSObject *v32;
  NSObject *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  double v41;
  const void **v42;
  void *specific;
  NSObject *v44;
  _BOOL4 v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  id v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  uint8_t buf[4];
  double v56;
  __int16 v57;
  double v58;
  __int16 v59;
  double v60;
  __int16 v61;
  double v62;
  __int16 v63;
  uint64_t v64;
  __int16 v65;
  uint64_t v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v14 = (_QWORD *)MEMORY[0x1E0D52390];
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
  v15 = (os_log_t *)MEMORY[0x1E0D52398];
  v16 = *MEMORY[0x1E0D52398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D52398], OS_LOG_TYPE_DEBUG))
  {
    v34 = *a1;
    v35 = a1[1];
    v36 = a1[2];
    *(_DWORD *)buf = 134218496;
    v56 = v34;
    v57 = 2048;
    v58 = v35;
    v59 = 2048;
    v60 = v36;
    _os_log_debug_impl(&dword_1A6382000, v16, OS_LOG_TYPE_DEBUG, "RGB = %f, %f, %f", buf, 0x20u);
  }
  else if (!a1)
  {
    NUAssertLogger_5324();
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Expected non-NULL pixels passed in"));
      v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v56 = v41;
      _os_log_error_impl(&dword_1A6382000, v40, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v42 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_5324();
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v45)
      {
        v48 = COERCE_DOUBLE(dispatch_get_specific(*v42));
        v49 = (void *)MEMORY[0x1E0CB3978];
        v50 = *(id *)&v48;
        objc_msgSend(v49, "callStackSymbols");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "componentsJoinedByString:", CFSTR("\n"));
        v52 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        v56 = v48;
        v57 = 2114;
        v58 = v52;
        _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v45)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "componentsJoinedByString:", CFSTR("\n"));
      v47 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543362;
      v56 = v47;
      _os_log_error_impl(&dword_1A6382000, v44, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v18 = *a1;
  v17 = a1[1];
  v19 = a1[2];
  if (a5 != 0.0)
  {
    v20 = a5;
    v21 = exp2f(v20);
    v18 = v18 / v21;
    v17 = v17 / v21;
    v19 = v19 / v21;
  }
  if (a6 != 1.0 && a7 != 0.0)
  {
    v18 = fmax(-(a7 - v18 * (a6 + a7)), 0.0);
    v17 = fmax(-(a7 - v17 * (a6 + a7)), 0.0);
    v19 = fmax(-(a7 - v19 * (a6 + a7)), 0.0);
  }
  v22 = pow(v18, 4.0);
  v23 = pow(v17, 4.0);
  v24 = pow(v19, 4.0);
  v25 = v23 * 0.404303581 + v22 * 0.592828095 + v24 * 0.00286814501;
  v26 = v23 * 0.843295753 + v22 * 0.0951450467 + v24 * 0.0615592338;
  v27 = v23 * 0.0696689114 + v22 * 0.0117029343 + v24 * 0.918628156;
  v28 = pow(v25, 0.25);
  v29 = pow(v26, 0.25);
  v54 = pow(v27, 0.25);
  if (*v14 != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
  v30 = v29 * -0.274453014 + v28 * 0.595716;
  v31 = v29 * -0.522590995 + v28 * 0.211456001;
  v32 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218496;
    v56 = v28;
    v57 = 2048;
    v58 = v29;
    v59 = 2048;
    v60 = v54;
    _os_log_debug_impl(&dword_1A6382000, v32, OS_LOG_TYPE_DEBUG, "RGB = %f, %f, %f", buf, 0x20u);
    if (*v14 != -1)
      dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_253);
  }
  v53 = v29 * 0.587000012 + v28 * 0.298999995;
  v33 = *v15;
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
  {
    v37 = *a1;
    v38 = *((_QWORD *)a1 + 1);
    v39 = *((_QWORD *)a1 + 2);
    *(_DWORD *)buf = 134219264;
    v56 = v53 + v54 * 0.114;
    v57 = 2048;
    v58 = v30 + v54 * -0.321262985;
    v59 = 2048;
    v60 = v31 + v54 * 0.311134994;
    v61 = 2048;
    v62 = v37;
    v63 = 2048;
    v64 = v38;
    v65 = 2048;
    v66 = v39;
    _os_log_debug_impl(&dword_1A6382000, v33, OS_LOG_TYPE_DEBUG, "YIQ = %f, %f, %f from %f, %f, %f", buf, 0x3Eu);
  }
  *a2 = v53 + v54 * 0.114;
  *a3 = v30 + v54 * -0.321262985;
  *a4 = v31 + v54 * 0.311134994;
}

void sub_1A63D977C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a69;
  uint64_t v69;

  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a69, 8);
  _Block_object_dispose((const void *)(v69 - 256), 8);
  _Block_object_dispose((const void *)(v69 - 208), 8);
  _Block_object_dispose((const void *)(v69 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1A63DD440(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x260], 8);
  _Block_object_dispose(&STACK[0x290], 8);
  _Block_object_dispose(&STACK[0x2C0], 8);
  _Block_object_dispose(&STACK[0x2F0], 8);
  _Block_object_dispose(&STACK[0x320], 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_5916()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_422);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__5926(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5927(uint64_t a1)
{

}

id NUAssertLogger_6085()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_148_6097);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_6392()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_6419);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A63EA7CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1A63EAA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_6837()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_122);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__6860(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6861(uint64_t a1)
{

}

void sub_1A63ECC24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A63ED44C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A63EE07C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_6935()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_187);
  return (id)*MEMORY[0x1E0D52380];
}

id getVCPMediaAnalysisServiceClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVCPMediaAnalysisServiceClass_softClass;
  v7 = getVCPMediaAnalysisServiceClass_softClass;
  if (!getVCPMediaAnalysisServiceClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalysisServiceClass_block_invoke;
    v3[3] = &unk_1E5019948;
    v3[4] = &v4;
    __getVCPMediaAnalysisServiceClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A63F16AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVCPMediaAnalysisServiceClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaAnalysisLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVCPMediaAnalysisServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PIPosterSettlingEffectLoader.m"), 37, CFSTR("Unable to find class %s"), "VCPMediaAnalysisService");

    __break(1u);
  }
}

void *MediaAnalysisLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaAnalysisLibraryCore_frameworkLibrary)
    MediaAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)MediaAnalysisLibraryCore_frameworkLibrary;
  if (!MediaAnalysisLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaAnalysisLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PIPosterSettlingEffectLoader.m"), 36, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_1A63F2094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisResultsKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMediaAnalysisResultsKeySymbolLoc_ptr;
  v8 = getMediaAnalysisResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr)
  {
    v1 = MediaAnalysisLibrary();
    v0 = (id *)dlsym(v1, "MediaAnalysisResultsKey");
    v6[3] = (uint64_t)v0;
    getMediaAnalysisResultsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultsKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PIPosterSettlingEffectLoader.m"), 38, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A63F21E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisResultAttributesKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  v8 = getMediaAnalysisResultAttributesKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultAttributesKeySymbolLoc_ptr)
  {
    v1 = MediaAnalysisLibrary();
    v0 = (id *)dlsym(v1, "MediaAnalysisResultAttributesKey");
    v6[3] = (uint64_t)v0;
    getMediaAnalysisResultAttributesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultAttributesKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PIPosterSettlingEffectLoader.m"), 39, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A63F22D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisResultSettlingEffectStatusAttributeKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr;
  v8 = getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr;
  if (!getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr)
  {
    v1 = MediaAnalysisLibrary();
    v0 = (id *)dlsym(v1, "MediaAnalysisResultSettlingEffectStatusAttributeKey");
    v6[3] = (uint64_t)v0;
    getMediaAnalysisResultSettlingEffectStatusAttributeKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultSettlingEffectStatusAttributeKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PIPosterSettlingEffectLoader.m"), 45, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A63F23D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisPathConstraintsStabilizationResultsKey()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr;
  v8 = getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr;
  if (!getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr)
  {
    v1 = MediaAnalysisLibrary();
    v0 = (id *)dlsym(v1, "MediaAnalysisPathConstraintsStabilizationResultsKey");
    v6[3] = (uint64_t)v0;
    getMediaAnalysisPathConstraintsStabilizationResultsKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisPathConstraintsStabilizationResultsKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PIPosterSettlingEffectLoader.m"), 43, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A63F24C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A63F48BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A63F728C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id *a9)
{
  void *v9;
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A63F7524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{

  _Unwind_Resume(a1);
}

id drawCircle(void *a1, void *a2, void *a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  uint64_t v34;
  CGAffineTransform v36;
  CGAffineTransform v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[5];

  v41[3] = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = (void *)MEMORY[0x1E0C9DDB8];
  v38 = *MEMORY[0x1E0C9E258];
  v13 = v38;
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = a2;
  v16 = a1;
  objc_msgSend(v14, "numberWithDouble:", a6 * 1.15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v17;
  v39 = *MEMORY[0x1E0C9E1C0];
  v18 = v39;
  objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 1.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v19;
  v40 = *MEMORY[0x1E0C9E1B8];
  objc_msgSend(MEMORY[0x1E0C9DDF8], "vectorWithCGPoint:", a4, a5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v41[2] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, &v38, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "filterWithName:withInputParameters:", CFSTR("CICircleGenerator"), v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "outputImage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "imageByCompositingOverImage:", v16);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setValue:forKey:", v25, v13);

  objc_msgSend(v22, "setValue:forKey:", v15, v18);
  objc_msgSend(v22, "outputImage");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "imageByCompositingOverImage:", v24);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C9DD80], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 1.0, 0.5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    createLabelImage(v11, v28, *MEMORY[0x1E0C9D538], *(CGFloat *)(MEMORY[0x1E0C9D538] + 8));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    CGAffineTransformMakeScale(&v37, a6 / 40.0, a6 / 40.0);
    objc_msgSend(v29, "imageByApplyingTransform:", &v37);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "extent");
    CGAffineTransformMakeTranslation(&v36, a4 + v31 * -0.5, a5 - a6 + -5.0 - v32);
    objc_msgSend(v30, "imageByApplyingTransform:", &v36);
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v33, "imageByCompositingOverImage:", v27);
    v34 = objc_claimAutoreleasedReturnValue();

    v27 = (void *)v34;
  }

  return v27;
}

id createLabelImage(void *a1, void *a2, CGFloat a3, CGFloat a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGAffineTransform v23;
  CGAffineTransform v24;

  v7 = (void *)MEMORY[0x1E0C9DDB8];
  v8 = a2;
  v9 = a1;
  objc_msgSend(v7, "textImageGeneratorFilter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  objc_msgSend(v10, "setFontName:", CFSTR("Helvetica"));
  LODWORD(v11) = 1109393408;
  objc_msgSend(v10, "setFontSize:", v11);
  objc_msgSend(v10, "outputImage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C9DDB8], "roundedRectangleGeneratorFilter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "extent");
  v15 = v14 + 4.0;
  objc_msgSend(v12, "extent");
  objc_msgSend(v13, "setExtent:", 0.0, 0.0, v15, v16 + 4.0);
  objc_msgSend(v13, "setColor:", v8);

  LODWORD(v17) = 0;
  objc_msgSend(v13, "setRadius:", v17);
  CGAffineTransformMakeTranslation(&v24, 2.0, 2.0);
  objc_msgSend(v12, "imageByApplyingTransform:", &v24);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "outputImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageByCompositingOverImage:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  CGAffineTransformMakeTranslation(&v23, a3, a4);
  objc_msgSend(v20, "imageByApplyingTransform:", &v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id NUAssertLogger_7530()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7365);
  return (id)*MEMORY[0x1E0D52380];
}

id imageDataOfRowAverages(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v11 = (void *)MEMORY[0x1E0C9DDB8];
  v12 = a2;
  v13 = a1;
  objc_msgSend(v11, "rowAverageFilter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInputImage:", v12);

  objc_msgSend(v14, "setExtent:", a3, a4, a5, a6);
  objc_msgSend(v14, "outputImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "extent");
  v17 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", (int)(4 * vcvtpd_s64_f64(v16))));
  v18 = objc_msgSend(v17, "mutableBytes");
  v19 = objc_msgSend(v17, "length");
  objc_msgSend(v15, "extent");
  objc_msgSend(v13, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v15, v18, v19, *MEMORY[0x1E0C9E028], 0);

  v20 = (void *)objc_msgSend(v17, "copy");
  return v20;
}

uint64_t PICinematicAudioIsRenderSupported()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0D52228], "currentPlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "mainDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v1, "family") < 7)
    v2 = 0;
  else
    v2 = objc_msgSend(v0, "supportsANE");

  return v2;
}

id NUAssertLogger_7646()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7668);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_7703()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7750);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_7964()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_7990);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_8008()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_214_7884);
  return (id)*MEMORY[0x1E0D52398];
}

void sub_1A6401B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40)
{
  uint64_t v40;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose((const void *)(v40 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8038(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8039(uint64_t a1)
{

}

id NUAssertLogger_8249()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_8263);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6405C54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A640732C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_8288()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_8344);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__8353(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8354(uint64_t a1)
{

}

uint64_t XXH32(char *a1, unint64_t a2, unsigned int a3)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  char *v7;
  int v8;
  unint64_t v9;
  int v10;
  int v11;
  int v12;
  int v13;
  unsigned int v14;
  char *v15;
  unint64_t v16;
  BOOL v17;
  unint64_t v18;
  int v19;
  unint64_t v20;
  unsigned int v21;

  v3 = (unint64_t)&a1[a2];
  if (a2 < 0x10)
  {
    v13 = a3 + 374761393;
    v7 = a1;
  }
  else
  {
    v4 = a3 + 606290984;
    v5 = a3 - 2048144777;
    v6 = a3 + 1640531535;
    v7 = a1;
    do
    {
      HIDWORD(v9) = v4 - 2048144777 * *(_DWORD *)v7;
      LODWORD(v9) = HIDWORD(v9);
      v8 = v9 >> 19;
      v4 = -1640531535 * v8;
      HIDWORD(v9) = v5 - 2048144777 * *((_DWORD *)v7 + 1);
      LODWORD(v9) = HIDWORD(v9);
      v10 = v9 >> 19;
      v5 = -1640531535 * v10;
      HIDWORD(v9) = a3 - 2048144777 * *((_DWORD *)v7 + 2);
      LODWORD(v9) = HIDWORD(v9);
      v11 = v9 >> 19;
      a3 = -1640531535 * v11;
      HIDWORD(v9) = v6 - 2048144777 * *((_DWORD *)v7 + 3);
      LODWORD(v9) = HIDWORD(v9);
      v12 = v9 >> 19;
      v6 = -1640531535 * v12;
      v7 += 16;
    }
    while ((unint64_t)v7 <= v3 - 16);
    v13 = ((1013904226 * v8) | (v4 >> 31))
        + 465361024 * v10
        + (v5 >> 25)
        + 2006650880 * v11
        + (a3 >> 20)
        - 423362560 * v12
        + (v6 >> 14);
  }
  v14 = v13 + a2;
  if ((unint64_t)(v7 + 4) <= v3)
  {
    do
    {
      v15 = v7 + 4;
      HIDWORD(v16) = v14 - 1028477379 * *(_DWORD *)v7;
      LODWORD(v16) = HIDWORD(v16);
      v14 = 668265263 * (v16 >> 15);
      v17 = (unint64_t)(v7 + 8) > v3;
      v7 += 4;
    }
    while (!v17);
  }
  else
  {
    v15 = v7;
  }
  if ((unint64_t)v15 < v3)
  {
    v18 = &a1[a2] - v15;
    do
    {
      v19 = *v15++;
      HIDWORD(v20) = v14 + 374761393 * v19;
      LODWORD(v20) = HIDWORD(v20);
      v14 = -1640531535 * (v20 >> 21);
      --v18;
    }
    while (v18);
  }
  v21 = -1028477379 * ((-2048144777 * (v14 ^ (v14 >> 15))) ^ ((-2048144777 * (v14 ^ (v14 >> 15))) >> 13));
  return v21 ^ HIWORD(v21);
}

unint64_t XXH64(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unsigned int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unsigned int *v15;
  BOOL v16;
  unint64_t v17;
  unsigned int v18;
  unint64_t v19;

  v3 = (unint64_t)a1 + a2;
  if (a2 < 0x20)
  {
    v13 = a3 + 0x27D4EB2F165667C5;
    v7 = a1;
  }
  else
  {
    v4 = a3 + 0x60EA27EEADC0B5D6;
    v5 = a3 - 0x3D4D51C2D82B14B1;
    v6 = a3 + 0x61C8864E7A143579;
    v7 = a1;
    do
    {
      v8 = __ROR8__(v4 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v7, 33);
      v4 = 0x9E3779B185EBCA87 * v8;
      v9 = __ROR8__(v5 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v7 + 1), 33);
      v5 = 0x9E3779B185EBCA87 * v9;
      v10 = *((_QWORD *)v7 + 3);
      v11 = __ROR8__(a3 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v7 + 2), 33);
      a3 = 0x9E3779B185EBCA87 * v11;
      v7 += 8;
      v12 = __ROR8__(v6 - 0x3D4D51C2D82B14B1 * v10, 33);
      v6 = 0x9E3779B185EBCA87 * v12;
    }
    while ((unint64_t)v7 <= v3 - 32);
    v13 = 0x85EBCA77C2B2AE63
        - 0x61C8864E7A143579
        * ((0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * ((0x85EBCA77C2B2AE63
            - 0x61C8864E7A143579
            * ((0x85EBCA77C2B2AE63
              - 0x61C8864E7A143579
              * ((((0x3C6EF3630BD7950ELL * v8) | (v4 >> 63))
                + 0x1BBCD8C2F5E54380 * v9
                + (v5 >> 57)
                + 0x779B185EBCA87000 * v11
                + (a3 >> 52)
                - 0x1939E850D5E40000 * v12
                + (v6 >> 46)) ^ (0x9E3779B185EBCA87
                               * ((0x87BCB65480000000 * v8) | ((0xDEF35B010F796CA9 * v8) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v9) | ((0xDEF35B010F796CA9 * v9) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v11) | ((0xDEF35B010F796CA9 * v11) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v12) | ((0xDEF35B010F796CA9 * v12) >> 33))));
  }
  v14 = v13 + a2;
  if ((unint64_t)(v7 + 2) <= v3)
  {
    do
    {
      v15 = v7 + 2;
      v14 = 0x85EBCA77C2B2AE63
          - 0x61C8864E7A143579
          * __ROR8__((0x9E3779B185EBCA87* ((0x93EA75A780000000 * *(_QWORD *)v7) | ((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)v7) >> 33))) ^ v14, 37);
      v16 = (unint64_t)(v7 + 4) > v3;
      v7 += 2;
    }
    while (!v16);
  }
  else
  {
    v15 = v7;
  }
  if ((unint64_t)(v15 + 1) <= v3)
    v14 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * *v15++) ^ v14, 41);
  if ((unint64_t)v15 < v3)
  {
    v17 = (char *)a1 + a2 - (char *)v15;
    do
    {
      v18 = *(unsigned __int8 *)v15;
      v15 = (unsigned int *)((char *)v15 + 1);
      v14 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v18) ^ v14, 53);
      --v17;
    }
    while (v17);
  }
  v19 = 0x165667B19E3779F9
      * ((0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v14 ^ (v14 >> 33))) >> 29));
  return v19 ^ HIDWORD(v19);
}

void *XXH32_createState()
{
  return malloc_type_malloc(0x30uLL, 0xC0F1A4A2uLL);
}

uint64_t XXH32_freeState(void *a1)
{
  free(a1);
  return 0;
}

void *XXH64_createState()
{
  return malloc_type_malloc(0x58uLL, 0xC0F1A4A2uLL);
}

uint64_t XXH64_freeState(void *a1)
{
  free(a1);
  return 0;
}

uint64_t XXH32_reset(uint64_t a1, unsigned int a2)
{
  *(_DWORD *)(a1 + 8) = a2;
  *(int32x2_t *)(a1 + 12) = vadd_s32(vdup_n_s32(a2), (int32x2_t)0x85EBCA7724234428);
  *(_DWORD *)(a1 + 20) = a2;
  *(_DWORD *)(a1 + 24) = a2 + 1640531535;
  *(_QWORD *)a1 = 0;
  *(_DWORD *)(a1 + 44) = 0;
  return 0;
}

uint64_t XXH64_reset(int64x2_t *a1, unint64_t a2)
{
  a1[1] = vaddq_s64(vdupq_n_s64(a2), (int64x2_t)xmmword_1A64DDE70);
  a1[2].i64[0] = a2;
  a1[2].i64[1] = a2 + 0x61C8864E7A143579;
  a1->i64[0] = 0;
  a1->i64[1] = a2;
  a1[5].i32[0] = 0;
  return 0;
}

uint64_t XXH32_update(uint64_t a1, int32x4_t *__src, size_t __n)
{
  int v3;
  int32x4_t *v4;
  uint64_t v6;
  size_t v7;
  int32x4_t *v8;
  int32x4_t v9;
  int32x4_t v10;
  int32x4_t v11;
  int32x4_t v12;
  int32x4_t v13;
  int32x4_t v14;

  v3 = __n;
  v4 = __src;
  *(_QWORD *)a1 += __n;
  v6 = *(unsigned int *)(a1 + 44);
  if (v6 + __n <= 0xF)
  {
    memcpy((void *)(a1 + v6 + 28), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 44) + v3;
LABEL_11:
    *(_DWORD *)(a1 + 44) = v7;
    return 0;
  }
  v8 = (int32x4_t *)((char *)__src + __n);
  if ((_DWORD)v6)
  {
    memcpy((void *)(a1 + 28 + v6), __src, (16 - v6));
    v9 = vmlaq_s32(*(int32x4_t *)(a1 + 12), *(int32x4_t *)(a1 + 28), vdupq_n_s32(0x85EBCA77));
    *(int32x4_t *)(a1 + 12) = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v9, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v9, 0x13uLL)), vdupq_n_s32(0x9E3779B1));
    v4 = (int32x4_t *)((char *)v4 + (16 - *(_DWORD *)(a1 + 44)));
    *(_DWORD *)(a1 + 44) = 0;
  }
  if (v4 <= &v8[-1])
  {
    v10 = *(int32x4_t *)(a1 + 12);
    v11 = vdupq_n_s32(0x85EBCA77);
    v12 = vdupq_n_s32(0x9E3779B1);
    do
    {
      v13 = *v4++;
      v14 = vmlaq_s32(v10, v13, v11);
      v10 = vmulq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_n_s32(v14, 0xDuLL), (int8x16_t)vshrq_n_u32((uint32x4_t)v14, 0x13uLL)), v12);
    }
    while (v4 <= &v8[-1]);
    *(int32x4_t *)(a1 + 12) = v10;
  }
  if (v4 < v8)
  {
    v7 = (char *)v8 - (char *)v4;
    memcpy((void *)(a1 + 28), v4, v7);
    goto LABEL_11;
  }
  return 0;
}

uint64_t XXH32_digest(uint64_t a1)
{
  _DWORD *v1;
  uint64_t v2;
  unint64_t v3;
  int v4;
  unsigned int v5;
  unsigned __int8 *v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  int v10;
  unint64_t v11;
  unsigned int v12;

  v1 = (_DWORD *)(a1 + 28);
  v2 = *(unsigned int *)(a1 + 44);
  v3 = a1 + 28 + v2;
  if (*(_QWORD *)a1 < 0x10uLL)
    v4 = *(_DWORD *)(a1 + 8) + 374761393;
  else
    v4 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 12), (uint32x4_t)xmmword_1A64DDE90), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 12), (uint32x4_t)xmmword_1A64DDE80)));
  v5 = v4 + *(_QWORD *)a1;
  if (a1 + 32 <= v3)
  {
    do
    {
      v6 = (unsigned __int8 *)(v1 + 1);
      HIDWORD(v7) = v5 - 1028477379 * *v1;
      LODWORD(v7) = HIDWORD(v7);
      v5 = 668265263 * (v7 >> 15);
      v8 = (unint64_t)(v1 + 2) > v3;
      ++v1;
    }
    while (!v8);
  }
  else
  {
    v6 = (unsigned __int8 *)(a1 + 28);
  }
  if ((unint64_t)v6 < v3)
  {
    v9 = a1 + v2 - (_QWORD)v6 + 28;
    do
    {
      v10 = *v6++;
      HIDWORD(v11) = v5 + 374761393 * v10;
      LODWORD(v11) = HIDWORD(v11);
      v5 = -1640531535 * (v11 >> 21);
      --v9;
    }
    while (v9);
  }
  v12 = -1028477379 * ((-2048144777 * (v5 ^ (v5 >> 15))) ^ ((-2048144777 * (v5 ^ (v5 >> 15))) >> 13));
  return v12 ^ HIWORD(v12);
}

uint64_t XXH64_update(uint64_t a1, char *__src, size_t __n)
{
  int v3;
  char *v4;
  uint64_t v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v3 = __n;
  v4 = __src;
  *(_QWORD *)a1 += __n;
  v6 = *(unsigned int *)(a1 + 80);
  if (v6 + __n <= 0x1F)
  {
    memcpy((void *)(a1 + v6 + 48), __src, __n);
    LODWORD(v7) = *(_DWORD *)(a1 + 80) + v3;
LABEL_11:
    *(_DWORD *)(a1 + 80) = v7;
    return 0;
  }
  v8 = &__src[__n];
  if ((_DWORD)v6)
  {
    memcpy((void *)(a1 + 48 + v6), __src, (32 - v6));
    v9 = __ROR8__(*(_QWORD *)(a1 + 24) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 56), 33);
    *(_QWORD *)(a1 + 16) = 0x9E3779B185EBCA87
                         * __ROR8__(*(_QWORD *)(a1 + 16) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 48), 33);
    *(_QWORD *)(a1 + 24) = 0x9E3779B185EBCA87 * v9;
    v10 = 0x9E3779B185EBCA87 * __ROR8__(*(_QWORD *)(a1 + 40) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 72), 33);
    *(_QWORD *)(a1 + 32) = 0x9E3779B185EBCA87
                         * __ROR8__(*(_QWORD *)(a1 + 32) - 0x3D4D51C2D82B14B1 * *(_QWORD *)(a1 + 64), 33);
    *(_QWORD *)(a1 + 40) = v10;
    v4 += (32 - *(_DWORD *)(a1 + 80));
    *(_DWORD *)(a1 + 80) = 0;
  }
  if (v4 + 32 <= v8)
  {
    v11 = *(_QWORD *)(a1 + 16);
    v12 = *(_QWORD *)(a1 + 24);
    v14 = *(_QWORD *)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 40);
    do
    {
      v11 = 0x9E3779B185EBCA87 * __ROR8__(v11 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v4, 33);
      v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 1), 33);
      v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 2), 33);
      v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 3), 33);
      v4 += 32;
    }
    while (v4 <= v8 - 32);
    *(_QWORD *)(a1 + 16) = v11;
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = v14;
    *(_QWORD *)(a1 + 40) = v13;
  }
  if (v4 < v8)
  {
    v7 = v8 - v4;
    memcpy((void *)(a1 + 48), v4, v7);
    goto LABEL_11;
  }
  return 0;
}

unint64_t XXH64_digest(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  unsigned int *v6;
  BOOL v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;

  v1 = (_QWORD *)(a1 + 48);
  v2 = *(unsigned int *)(a1 + 80);
  v3 = a1 + 48 + v2;
  if (*(_QWORD *)a1 < 0x20uLL)
    v4 = *(_QWORD *)(a1 + 8) + 0x27D4EB2F165667C5;
  else
    v4 = 0x85EBCA77C2B2AE63
       - 0x61C8864E7A143579
       * ((0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * ((0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((__ROR8__(*(_QWORD *)(a1 + 24), 57)
               + __ROR8__(*(_QWORD *)(a1 + 16), 63)
               + __ROR8__(*(_QWORD *)(a1 + 32), 52)
               + __ROR8__(*(_QWORD *)(a1 + 40), 46)) ^ (0x9E3779B185EBCA87
                                                      * ((0x93EA75A780000000 * *(_QWORD *)(a1 + 16)) | ((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)(a1 + 16)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(_QWORD *)(a1 + 24)) | ((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)(a1 + 24)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(_QWORD *)(a1 + 32)) | ((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)(a1 + 32)) >> 33))))) ^ (0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *(_QWORD *)(a1 + 40)) | ((0xC2B2AE3D27D4EB4FLL * *(_QWORD *)(a1 + 40)) >> 33))));
  v5 = v4 + *(_QWORD *)a1;
  if (a1 + 56 <= v3)
  {
    do
    {
      v6 = (unsigned int *)(v1 + 1);
      v5 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * __ROR8__((0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *v1) | ((0xC2B2AE3D27D4EB4FLL * *v1) >> 33))) ^ v5, 37);
      v7 = (unint64_t)(v1 + 2) > v3;
      ++v1;
    }
    while (!v7);
  }
  else
  {
    v6 = (unsigned int *)(a1 + 48);
  }
  if ((unint64_t)(v6 + 1) <= v3)
    v5 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * *v6++) ^ v5, 41);
  if ((unint64_t)v6 < v3)
  {
    v8 = a1 + v2 - (_QWORD)v6 + 48;
    do
    {
      v9 = *(unsigned __int8 *)v6;
      v6 = (unsigned int *)((char *)v6 + 1);
      v5 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v9) ^ v5, 53);
      --v8;
    }
    while (v8);
  }
  v10 = 0x165667B19E3779F9
      * ((0xC2B2AE3D27D4EB4FLL * (v5 ^ (v5 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v5 ^ (v5 >> 33))) >> 29));
  return v10 ^ HIDWORD(v10);
}

id NUAssertLogger_8627()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_82_8643);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6409D4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8674(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8675(uint64_t a1)
{

}

id NUAssertLogger_8802()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_409);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t flashFired(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("Flash"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
    v3 = objc_msgSend(v1, "shortValue") & 1;
  else
    v3 = 0;

  return v3;
}

id apertureValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("FNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    || (objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ApertureValue")),
        (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v3 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v2, "doubleValue");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id shutterSpeedValue(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  double v7;
  double v8;
  void *v9;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ShutterSpeedValue"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2
    && (v3 = (void *)v2,
        objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ExposureTime")),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        v3,
        !v4))
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ShutterSpeedValue"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "doubleValue");
    v8 = v7;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)exp2(-v8));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("ExposureTime"));
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v9 = (void *)v5;

  return v9;
}

id isoValue(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("ISOSpeedRatings"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v1, "count"))
  {
    v2 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v1, "objectAtIndex:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    objc_msgSend(v2, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id NUAssertLogger_9151()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_9162);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_9228()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_9280);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_9336()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_41);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A64133F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  uint64_t v25;

  _Block_object_dispose((const void *)(v25 - 120), 8);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9442(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9443(uint64_t a1)
{

}

void *ImageHarmonizationKitLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary)
    ImageHarmonizationKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)ImageHarmonizationKitLibraryCore_frameworkLibrary;
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ImageHarmonizationKitLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PISmartCopyPasteAutoCalculator.m"), 27, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void __getIHKSliderNetCPModelClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  ImageHarmonizationKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("IHKSliderNetCPModel");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIHKSliderNetCPModelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIHKSliderNetCPModelClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PISmartCopyPasteAutoCalculator.m"), 28, CFSTR("Unable to find class %s"), "IHKSliderNetCPModel");

    __break(1u);
  }
}

void sub_1A641A290(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9886(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9887(uint64_t a1)
{

}

id NULogger_9891()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_519);
  return (id)*MEMORY[0x1E0D52398];
}

id NUAssertLogger_9919()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_518);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_10137()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_10151);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_10273()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10284);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_10874()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_10885);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A642AFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 240), 8);
  _Block_object_dispose((const void *)(v17 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11067(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11068(uint64_t a1)
{

}

void sub_1A642D384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_11199()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11169);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__11212(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11213(uint64_t a1)
{

}

char *___lightMapImageFromData_block_invoke(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  size_t v11;
  char *result;
  char *v13;

  if (a4)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 771, "x == 0");
  if (a5)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 772, "y == 0");
  if (*(_QWORD *)(a1 + 40) != a6)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 773, "width == lmWidth");
  v8 = a7;
  if (*(_QWORD *)(a1 + 48) != a7)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PIParallaxStyleRecipe.m", 774, "height == lmHeight");
  v11 = 2 * a6;
  result = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  v13 = result;
  if (v11 == a3)
    return (char *)memcpy(a2, result, *(_QWORD *)(a1 + 56));
  for (; v8; --v8)
  {
    result = (char *)memcpy(a2, v13, v11);
    v13 += v11;
    a2 += a3;
  }
  return result;
}

id NUAssertLogger_11492()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_11527);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_11572()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_111_11578);
  return (id)*MEMORY[0x1E0D52398];
}

void sub_1A6434020(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A6435110(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1A643550C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6435904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_11681()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_256);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__11718(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11719(uint64_t a1)
{

}

void sub_1A6437A14(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id NUAssertLogger_12040()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12138);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t PIRetouchModeFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", kRepairModeRepair) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v1, "isEqualToString:", kRepairModeClone))
  {
    v2 = 1;
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

id PIRetouchModeToString(uint64_t a1)
{
  id *v1;
  uint64_t *v2;

  v1 = (id *)&kRepairModeRepair;
  v2 = &kRepairModeClone;
  if (a1 != 1)
    v2 = (uint64_t *)&kRepairModeRepairML;
  if (a1)
    v1 = (id *)v2;
  return *v1;
}

void sub_1A6442C60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_12827()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_12854);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t __Block_byref_object_copy__12895(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12896(uint64_t a1)
{

}

void fixRedeye(void *a1, double a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t i;
  uint64_t v11;
  _WORD *v12;
  unsigned __int16 *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unsigned int v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  _WORD *v38;
  unsigned __int16 *v39;
  unsigned int v40;
  unsigned int v41;
  uint64_t v42;
  unsigned __int16 *v43;
  unsigned __int16 *v44;
  _WORD *v45;
  uint64_t v46;
  unsigned int v47;
  unsigned int v48;
  __int16 v49;
  unsigned int v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  unsigned __int16 *v54;
  unsigned __int16 *v55;
  _WORD *v56;
  uint64_t v57;
  unsigned int v58;
  unsigned int v59;
  __int16 v60;
  unsigned int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  unsigned __int16 *v65;
  uint64_t v66;
  unsigned __int16 *v67;
  unsigned int v68;
  _WORD *v69;
  unsigned __int16 *v70;
  uint64_t v71;
  unsigned int v72;
  unsigned int v73;
  unsigned int v74;
  unsigned int v75;
  uint64_t v76;
  unsigned int v77;
  uint64_t j;
  unsigned __int16 *v79;
  unsigned __int16 *v80;
  _WORD *v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  unsigned int v85;
  unsigned int v86;
  uint64_t v87;
  unsigned __int16 *v88;
  unsigned __int16 *v89;
  _WORD *v90;
  uint64_t v91;
  unsigned int v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  BOOL v96;
  uint64_t v97;
  unsigned int v98;
  unsigned __int16 *v99;
  unsigned int v100;
  unsigned __int16 v101;
  void *v102;
  unsigned __int16 *v103;
  unsigned __int16 *v104;
  uint64_t v105;
  unsigned int v106;
  unsigned int v107;
  unsigned int v108;
  unsigned int v109;
  id v110;
  void *v111;
  uint64_t k;
  __int16 *v113;
  __int16 *v114;
  uint64_t v115;
  _WORD *v116;
  uint64_t v117;
  __int16 v118;
  __int16 v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  double v125;
  double v126;
  unsigned int v127;
  unsigned int v128;
  uint64_t v129;
  uint64_t v130;
  unsigned int v131;
  unsigned int v132;
  id v133;
  uint64_t v134;
  unsigned __int16 *v135;
  unsigned __int16 *v136;
  uint64_t v137;
  unsigned int v138;
  unsigned int v139;
  unsigned int v140;
  int v141;
  int v142;
  unsigned int v143;
  NSObject *v144;
  void *v145;
  const void **v146;
  void *specific;
  NSObject *v148;
  _BOOL4 v149;
  void *v150;
  void *v151;
  NSObject *v152;
  void *v153;
  const void **v154;
  void *v155;
  NSObject *v156;
  _BOOL4 v157;
  NSObject *v158;
  void *v159;
  const void **v160;
  void *v161;
  _BOOL4 v162;
  void *v163;
  void *v164;
  NSObject *v165;
  void *v166;
  const void **v167;
  void *v168;
  NSObject *v169;
  _BOOL4 v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  id v190;
  unsigned int v191;
  uint8_t buf[4];
  void *v193;
  __int16 v194;
  void *v195;
  uint64_t v196;

  v196 = *MEMORY[0x1E0C80C00];
  v190 = a1;
  objc_msgSend(v190, "format");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "bytesPerPixel");

  if (v4 != 8)
  {
    NUAssertLogger();
    v144 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Buffer must be RGBA16 type for red eye repairs"));
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v145;
      _os_log_error_impl(&dword_1A6382000, v144, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v146 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v148 = objc_claimAutoreleasedReturnValue();
    v149 = os_log_type_enabled(v148, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v149)
      {
        v173 = dispatch_get_specific(*v146);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "componentsJoinedByString:", CFSTR("\n"));
        v175 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v193 = v173;
        v194 = 2114;
        v195 = v175;
        _os_log_error_impl(&dword_1A6382000, v148, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v149)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v150 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v150, "componentsJoinedByString:", CFSTR("\n"));
      v151 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v151;
      _os_log_error_impl(&dword_1A6382000, v148, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
LABEL_179:
    __break(1u);
  }
  v5 = objc_msgSend(v190, "size");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D52220], "R16");
  v8 = objc_claimAutoreleasedReturnValue();
  v186 = (void *)v8;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D521E0]), "initWithSize:format:", v5, v7, v8);
  if (v7 >= 1)
  {
    for (i = 0; i != v7; ++i)
    {
      v11 = objc_msgSend(v190, "bytesAtPoint:", 0, i);
      v12 = (_WORD *)objc_msgSend(v9, "mutableBytesAtPoint:", 0, i);
      if (v5 >= 1)
      {
        v13 = (unsigned __int16 *)(v11 + 2);
        v14 = v5;
        do
        {
          v15 = *(v13 - 1);
          v16 = *v13;
          if (v15 > v16)
            *v12 = (v15 << 10) / (v16 + 1024);
          v13 += 4;
          ++v12;
          --v14;
        }
        while (v14);
      }
    }
  }
  v187 = v5;
  v17 = v5 / 3;
  v18 = v7 / 3;
  v19 = 2 * v7 / 3;
  v20 = *(unsigned __int16 *)objc_msgSend(v9, "bytesAtPoint:", v17, v7 / 3);
  if (v7 / 3 >= v19)
  {
    v23 = v7 / 3;
    v22 = v17;
    if (v20)
      goto LABEL_21;
LABEL_101:
    v101 = 0;
    v102 = 0;
    goto LABEL_121;
  }
  v21 = 2 * v187 / 3;
  v22 = v17;
  v23 = v7 / 3;
  do
  {
    v24 = objc_msgSend(v9, "bytesAtPoint:", 0, v18);
    if (v17 < v21)
    {
      v25 = v17;
      do
      {
        v26 = *(unsigned __int16 *)(v24 + 2 * v25);
        if (v20 < v26)
        {
          v23 = v18;
          v22 = v25;
        }
        if (v20 <= v26)
          v20 = *(unsigned __int16 *)(v24 + 2 * v25);
        ++v25;
      }
      while (v21 != v25);
    }
    ++v18;
  }
  while (v18 != v19);
  if (!v20)
    goto LABEL_101;
LABEL_21:
  v185 = v9;
  v188 = v7;
  v27 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D521E0]), "initWithSize:format:", v187, v7, v8);
  v28 = v9;
  v30 = objc_msgSend(v27, "size");
  if (v30 <= v22)
  {
    NUAssertLogger();
    v152 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reddestx out of bounds"));
      v153 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v153;
      _os_log_error_impl(&dword_1A6382000, v152, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v154 = (const void **)MEMORY[0x1E0D51D48];
    v155 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v156 = objc_claimAutoreleasedReturnValue();
    v157 = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);
    if (v155)
    {
      if (v157)
      {
        v176 = dispatch_get_specific(*v154);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "componentsJoinedByString:", CFSTR("\n"));
        v178 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v193 = v176;
        v194 = 2114;
        v195 = v178;
        _os_log_error_impl(&dword_1A6382000, v156, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
      goto LABEL_175;
    }
    if (v157)
    {
LABEL_161:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "componentsJoinedByString:", CFSTR("\n"));
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v164;
      _os_log_error_impl(&dword_1A6382000, v156, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_175:

    _NUAssertFailHandler();
    goto LABEL_179;
  }
  v31 = v29;
  if (v29 <= v23)
  {
    NUAssertLogger();
    v158 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("reddesty out of bounds"));
      v159 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v159;
      _os_log_error_impl(&dword_1A6382000, v158, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v160 = (const void **)MEMORY[0x1E0D51D48];
    v161 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v156 = objc_claimAutoreleasedReturnValue();
    v162 = os_log_type_enabled(v156, OS_LOG_TYPE_ERROR);
    if (v161)
    {
      if (v162)
      {
        v179 = dispatch_get_specific(*v160);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v180 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "componentsJoinedByString:", CFSTR("\n"));
        v181 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v193 = v179;
        v194 = 2114;
        v195 = v181;
        _os_log_error_impl(&dword_1A6382000, v156, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
      goto LABEL_175;
    }
    if (v162)
      goto LABEL_161;
    goto LABEL_175;
  }
  v32 = objc_msgSend(v28, "bytesAtPoint:", 0, v23);
  v33 = objc_msgSend(v27, "mutableBytesAtPoint:", 0, v23);
  if ((v22 & 0x8000000000000000) == 0)
  {
    v34 = v22;
    v35 = v20;
    do
    {
      if (v35 >= *(unsigned __int16 *)(v32 + 2 * v34))
        v35 = *(unsigned __int16 *)(v32 + 2 * v34);
      *(_WORD *)(v33 + 2 * v34--) = v35;
    }
    while (v34 != -1);
  }
  if (v22 + 1 < v30)
  {
    v36 = ~v22 + v30;
    v37 = 2 * v22 + 2;
    v38 = (_WORD *)(v33 + v37);
    v39 = (unsigned __int16 *)(v32 + v37);
    do
    {
      v41 = *v39++;
      v40 = v41;
      if (v20 >= v41)
        v20 = v40;
      *v38++ = v20;
      --v36;
    }
    while (v36);
  }
  if (v23 >= 1)
  {
    v42 = v23;
    do
    {
      v43 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v42 - 1);
      v44 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v42);
      v45 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v42 - 1);
      if (v30 >= 1)
      {
        v46 = v30;
        do
        {
          v48 = *v43++;
          v47 = v48;
          v50 = *v44++;
          v49 = v50;
          if (v47 >= v50)
            LOWORD(v47) = v49;
          *v45++ = v47;
          --v46;
        }
        while (v46);
      }
      v51 = v42-- <= 1;
    }
    while (!v51);
  }
  v52 = v23 + 1;
  if (v23 + 1 < v31)
  {
    do
    {
      v53 = v23;
      v23 = v52;
      v54 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v52);
      v55 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v53);
      v56 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v23);
      if (v30 >= 1)
      {
        v57 = v30;
        do
        {
          v59 = *v55++;
          v58 = v59;
          v61 = *v54++;
          v60 = v61;
          if (v58 >= v61)
            LOWORD(v58) = v60;
          *v56++ = v58;
          --v57;
        }
        while (v57);
      }
      v52 = v23 + 1;
    }
    while (v23 + 1 != v31);
  }
  v191 = 0;
  do
  {
    if (v31 < 1)
    {
      v63 = 0;
    }
    else
    {
      v62 = 0;
      v63 = 0;
      do
      {
        v64 = objc_msgSend(v28, "bytesAtPoint:", 0, v62);
        v65 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v62);
        v66 = objc_msgSend(v27, "mutableBytesAtPoint:", 0, v62);
        if (v30 >= 2)
        {
          v67 = v65 + 1;
          v68 = *v65;
          v69 = (_WORD *)(v66 + 2);
          v70 = (unsigned __int16 *)(v64 + 2);
          v71 = v30 - 1;
          do
          {
            v73 = *v70++;
            v72 = v73;
            if (v68 < v73)
              v72 = v68;
            v74 = *v67++;
            v68 = v74;
            if (v72 > v74)
            {
              *v69 = v72;
              ++v63;
              v68 = v72;
            }
            ++v69;
            --v71;
          }
          while (v71);
          v75 = v65[v30 - 1];
          v76 = v30 - 2;
          do
          {
            v77 = *(unsigned __int16 *)(v64 + 2 * v76);
            if (v75 < v77)
              v77 = v75;
            v75 = v65[v76];
            if (v77 > v75)
            {
              *(_WORD *)(v66 + 2 * v76) = v77;
              ++v63;
              v75 = v77;
            }
            v51 = v76-- <= 0;
          }
          while (!v51);
        }
        ++v62;
      }
      while (v62 != v31);
      if (v31 >= 2)
      {
        for (j = 1; j != v31; ++j)
        {
          v79 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, j);
          v80 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, j - 1);
          v81 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, j);
          if (v30 >= 1)
          {
            v82 = v30;
            do
            {
              v84 = *v80++;
              v83 = v84;
              v86 = *v79++;
              v85 = v86;
              if (v86 < v83)
                v83 = v85;
              if (v83 > (unsigned __int16)*v81)
              {
                *v81 = v83;
                ++v63;
              }
              ++v81;
              --v82;
            }
            while (v82);
          }
        }
        v87 = v31 - 2;
        do
        {
          v88 = (unsigned __int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, v87);
          v89 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v87 + 1);
          v90 = (_WORD *)objc_msgSend(v27, "mutableBytesAtPoint:", 0, v87);
          if (v30 >= 1)
          {
            v91 = v30;
            do
            {
              v93 = *v89++;
              v92 = v93;
              v95 = *v88++;
              v94 = v95;
              if (v95 < v92)
                v92 = v94;
              if (v92 > (unsigned __int16)*v90)
              {
                *v90 = v92;
                ++v63;
              }
              ++v90;
              --v91;
            }
            while (v91);
          }
          v51 = v87-- <= 0;
        }
        while (!v51);
      }
    }
    if (v63 < (v30 * v31 / 128))
      break;
    v96 = v191++ >= 7;
  }
  while (!v96);

  v9 = v185;
  if (v188 < 1)
  {
    v98 = 0;
  }
  else
  {
    v97 = 0;
    v98 = 0;
    do
    {
      v99 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v97);
      v100 = *v99;
      if (v100 <= v99[v187 - 1])
        v100 = v99[v187 - 1];
      if (v98 <= v100)
        v98 = v100;
      ++v97;
    }
    while (v188 != v97);
  }
  v103 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, 0);
  v104 = (unsigned __int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, v188 - 1);
  v105 = v187;
  if (v187 >= 1)
  {
    do
    {
      v107 = *v103++;
      v106 = v107;
      v109 = *v104++;
      v108 = v109;
      if (v106 <= v109)
        v106 = v108;
      if (v98 <= v106)
        v98 = v106;
      --v105;
    }
    while (v105);
  }
  if (v98 <= 0x2000)
  {
    if (v98 <= 0x200)
      v101 = 512;
    else
      v101 = v98;
    v110 = objc_alloc(MEMORY[0x1E0D521E0]);
    objc_msgSend(MEMORY[0x1E0D52220], "RG16");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v102 = (void *)objc_msgSend(v110, "initWithSize:format:", v187, v188, v111);

    if (v188 >= 1)
    {
      for (k = 0; k != v188; ++k)
      {
        v113 = (__int16 *)objc_msgSend(v28, "bytesAtPoint:", 0, k);
        v114 = (__int16 *)objc_msgSend(v27, "bytesAtPoint:", 0, k);
        v115 = objc_msgSend(v102, "mutableBytesAtPoint:", 0, k);
        if (v187 >= 1)
        {
          v116 = (_WORD *)(v115 + 2);
          v117 = v187;
          do
          {
            v118 = *v114++;
            *(v116 - 1) = v118;
            v119 = *v113++;
            *v116 = v119;
            v116 += 2;
            --v117;
          }
          while (v117);
        }
      }
    }
  }
  else
  {
    v101 = 0;
    v102 = 0;
  }

LABEL_121:
  if (!v102)
    goto LABEL_146;
  v120 = v190;
  v189 = v102;
  v121 = v102;
  if (!v120)
  {
    NUAssertLogger();
    v165 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v165, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "repairBuffer != nil");
      v166 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v166;
      _os_log_error_impl(&dword_1A6382000, v165, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v167 = (const void **)MEMORY[0x1E0D51D48];
    v168 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v169 = objc_claimAutoreleasedReturnValue();
    v170 = os_log_type_enabled(v169, OS_LOG_TYPE_ERROR);
    if (v168)
    {
      if (v170)
      {
        v182 = dispatch_get_specific(*v167);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v183 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v183, "componentsJoinedByString:", CFSTR("\n"));
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v193 = v182;
        v194 = 2114;
        v195 = v184;
        _os_log_error_impl(&dword_1A6382000, v169, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v170)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v171 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v171, "componentsJoinedByString:", CFSTR("\n"));
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v193 = v172;
      _os_log_error_impl(&dword_1A6382000, v169, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    goto LABEL_179;
  }
  v122 = objc_msgSend(v120, "size");
  v124 = v123;
  v125 = 1.0;
  v126 = 1.0 - a2;
  if (1.0 - a2 < 0.01)
    v126 = 0.01;
  if (v126 <= 1.0)
    v125 = v126;
  v127 = vcvtd_n_u64_f64(v125, 0x11uLL);
  if (v127 <= 0x10000)
    v128 = 0x10000 - v127;
  else
    v128 = 0;
  if (v123 >= 1)
  {
    v129 = v122;
    v130 = 0;
    v131 = (16777216.0 / (v125 * (double)v101));
    v132 = HIWORD(v127);
    do
    {
      v133 = v121;
      v134 = objc_msgSend(v121, "bytesAtPoint:", 0, v130);
      v135 = (unsigned __int16 *)objc_msgSend(v120, "bytesAtPoint:", 0, v130);
      if (v129 >= 1)
      {
        v136 = (unsigned __int16 *)(v134 + 2);
        v137 = v129;
        do
        {
          if (v101 < *(v136 - 1))
          {
            v138 = *v136;
            v96 = v138 >= v101;
            v139 = v138 - v101;
            if (!v96)
              v139 = 0;
            v140 = (v139 * v131) >> 8;
            if (v140 >= 0xFFFF)
              v140 = 0xFFFF;
            v141 = *v135;
            v142 = v135[1];
            if (v132)
              v143 = v141 - v142;
            else
              v143 = v141
                   - v142
                   + (((v142 - ((v142 + ((((v142 * v142) >> 16) * v142) >> 16)) >> 1))
                     * ((v140 * v128) >> 16)) >> 16);
            *v135 = v141 - ((v143 * v140) >> 16);
          }
          v135 += 4;
          v136 += 2;
          --v137;
        }
        while (v137);
      }
      ++v130;
      v121 = v133;
    }
    while (v130 != v124);
  }

  v102 = v189;
LABEL_146:

}

void sub_1A6446230(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;

  _Unwind_Resume(a1);
}

id NUAssertLogger(void)
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_13099);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6446D24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void __getPNCropUtilitiesWrapperClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  PhotosIntelligenceLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("PNCropUtilitiesWrapper");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPNCropUtilitiesWrapperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getPNCropUtilitiesWrapperClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PIPNCropUtilitiesWrapper.m"), 13, CFSTR("Unable to find class %s"), "PNCropUtilitiesWrapper");

    __break(1u);
  }
}

void *PhotosIntelligenceLibrary()
{
  uint64_t v0;
  void *v1;
  void *v3;
  void *v4;

  v0 = PhotosIntelligenceLibraryCore();
  if (v0)
    return (void *)v0;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *PhotosIntelligenceLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PIPNCropUtilitiesWrapper.m"), 12, CFSTR("%s"), 0);

  __break(1u);
  free(v4);
  return v1;
}

uint64_t PhotosIntelligenceLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = PhotosIntelligenceLibraryCore_frameworkLibrary;
  v6 = PhotosIntelligenceLibraryCore_frameworkLibrary;
  if (!PhotosIntelligenceLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E5018118;
    v8 = *(_OWORD *)&off_1E5018128;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PhotosIntelligenceLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1A6446F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1A6447114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *__p, uint64_t a10, uint64_t a11, void *a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, void *a18, uint64_t a19)
{
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  if (__p)
    operator delete(__p);
  if (a12)
    operator delete(a12);
  if (a15)
    operator delete(a15);
  if (a18)
    operator delete(a18);

  _Unwind_Resume(a1);
}

void sub_1A6447190()
{
  void *v0;

  JUMPOUT(0x1A644717CLL);
}

void sub_1A64471A0()
{
  JUMPOUT(0x1A644717CLL);
}

void sub_1A64471A8()
{
  void *v0;

  JUMPOUT(0x1A6447180);
}

void sub_1A64471B8()
{
  JUMPOUT(0x1A6447180);
}

void sub_1A64471C0()
{
  void *v0;

  JUMPOUT(0x1A6447184);
}

void sub_1A64471CC()
{
  JUMPOUT(0x1A6447184);
}

void sub_1A64471D4()
{
  void *v0;

  JUMPOUT(0x1A6447188);
}

void sub_1A6447978(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *__p, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,uint64_t a21,void *a22,uint64_t a23,uint64_t a24,void *a25,uint64_t a26,uint64_t a27,void *a28)
{
  void *v28;
  void *v29;
  void *v30;

  operator delete(v30);
  operator delete(v29);

  _Unwind_Resume(a1);
}

void sub_1A6447BC8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A644855C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _Unwind_Exception *exception_object, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<float>::vector(_QWORD *a1, unint64_t a2, _DWORD *a3)
{
  _DWORD *v6;
  _DWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<float>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_DWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 4 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 4;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A64487A8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<float>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 62)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[4 * v4];
  return result;
}

void std::vector<float>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(unint64_t a1)
{
  if (a1 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E5013900, MEMORY[0x1E0DE42D0]);
}

void sub_1A64488AC(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void sub_1A6448A8C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v5;

  _Unwind_Resume(a1);
}

id NUAssertLogger_13360()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_13377);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_13883()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_162);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A644C770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  uint64_t v28;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose((const void *)(v28 - 184), 8);
  _Block_object_dispose((const void *)(v28 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1A644CC58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13951(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13952(uint64_t a1)
{

}

void sub_1A644E904(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_13987()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_45);
  return (id)*MEMORY[0x1E0D52380];
}

id NURenderLogger()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_46);
  return (id)*MEMORY[0x1E0D523A0];
}

id NUAssertLogger_14078()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14099);
  return (id)*MEMORY[0x1E0D52380];
}

id _lightMapImageFromData(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  int v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  unint64_t v18;
  unint64_t v19;
  void *v20;
  _QWORD v21[2];
  _QWORD v22[3];

  v22[2] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_msgSend(v5, "length");
  if (v8)
  {
    LODWORD(v9) = objc_msgSend(v6, "intValue");
    v10 = objc_msgSend(v7, "intValue");
    if ((_DWORD)v9 && v10)
    {
      v9 = (int)v9;
      v11 = v10;
    }
    else
    {
      v9 = vcvtmd_u64_f64(sqrt((double)(unint64_t)v8 * 0.5));
      v11 = v9;
    }
    if (v8 == (void *)(2 * v9 * v11))
    {
      v12 = *MEMORY[0x1E0C9E150];
      v21[0] = *MEMORY[0x1E0C9E148];
      v21[1] = v12;
      v22[0] = v5;
      v22[1] = CFSTR("PILocalLightHDR");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, v21, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_alloc(MEMORY[0x1E0C9DDC8]);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = ___lightMapImageFromData_block_invoke_14136;
      v16[3] = &unk_1E5018530;
      v18 = v9;
      v19 = v11;
      v17 = v5;
      v20 = v8;
      v8 = (void *)objc_msgSend(v14, "initWithImageProvider:width:height:format:colorSpace:options:", v16, v9, v11, *MEMORY[0x1E0C9E050], 0, v13);

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

id _scaledLightMapImage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  uint64_t v20;
  _QWORD v22[3];
  _QWORD v23[4];
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v23[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "extent");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "extent");
    v26.origin.x = v15;
    v26.origin.y = v16;
    v26.size.width = v17;
    v26.size.height = v18;
    v24.origin.x = v8;
    v24.origin.y = v10;
    v24.size.width = v12;
    v24.size.height = v14;
    if (CGRectEqualToRect(v24, v26))
    {
      v6 = v3;
    }
    else
    {
      objc_msgSend(v3, "extent");
      v27.origin.x = 0.0;
      v27.origin.y = 0.0;
      v27.size.width = 1.0;
      v27.size.height = 1.0;
      if (CGRectEqualToRect(v25, v27))
      {
        objc_msgSend(v3, "imageByClampingToExtent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "extent");
        objc_msgSend(v19, "imageByCroppingToRect:");
        v20 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v22[0] = CFSTR("inputSmallImage");
        v22[1] = CFSTR("inputSpatialSigma");
        v23[0] = v3;
        v23[1] = &unk_1E505CE80;
        v22[2] = CFSTR("inputLumaSigma");
        v23[2] = &unk_1E505CE90;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "imageByApplyingFilter:withInputParameters:", CFSTR("CIEdgePreserveUpsampleRGFilter"), v19);
        v20 = objc_claimAutoreleasedReturnValue();
      }
      v6 = (id)v20;

    }
  }

  return v6;
}

char *___lightMapImageFromData_block_invoke_14136(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v8;
  size_t v11;
  char *result;
  char *v13;

  if (a4)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 54, "x == 0");
  if (a5)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 55, "y == 0");
  if (*(_QWORD *)(a1 + 40) != a6)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 56, "width == lmWidth");
  v8 = a7;
  if (*(_QWORD *)(a1 + 48) != a7)
    __assert_rtn("_lightMapImageFromData_block_invoke", "PILocalLightHDR.m", 57, "height == lmHeight");
  v11 = 2 * a6;
  result = (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  v13 = result;
  if (v11 == a3)
    return (char *)memcpy(a2, result, *(_QWORD *)(a1 + 56));
  for (; v8; --v8)
  {
    result = (char *)memcpy(a2, v13, v11);
    v13 += v11;
    a2 += a3;
  }
  return result;
}

uint64_t area_light_stats_from_histogram(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  long double v5;
  long double v6;
  double v7;
  double v8;
  uint64_t result;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _BYTE v28[2056];
  uint64_t v29;

  v4 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0;
  v5 = 0.0;
  v6 = 0.0;
  do
  {
    v7 = fmin((double)v4 / 255.0, 1.0);
    v8 = *(double *)(a1 + 8 * v4);
    v5 = v5 + v8 * log(v7 + 0.00392156863);
    *(long double *)a2 = v5;
    v6 = v6 + v8 * log(1.0 - v7 + 0.00392156863);
    *(long double *)(a2 + 8) = v6;
    ++v4;
  }
  while (v4 != 256);
  *(long double *)a2 = exp(v5);
  *(long double *)(a2 + 8) = exp(v6);
  result = MEMORY[0x1E0C80A78]();
  v11 = 0;
  v12 = 1.0e-40;
  do
  {
    v12 = v12 + *(double *)(a1 + v11);
    v11 += 8;
  }
  while (v11 != 2048);
  v13 = 0;
  v14 = 0.0;
  do
  {
    v14 = v14 + *(double *)(a1 + v13);
    *(double *)&v28[v13] = v14 / v12;
    v13 += 8;
  }
  while (v13 != 2048);
  v15 = 0;
  v16 = 0.0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_QWORD *)(a2 + 48) = 0;
  *(_OWORD *)(a2 + 32) = 0u;
  v17 = 0.0;
  v18 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v21 = 0.0;
  do
  {
    v22 = *(double *)&v28[8 * v15];
    if (v22 >= 0.001 && v21 == 0.0)
      v21 = (double)v15 / 255.0;
    if (v22 >= 0.02 && v20 == 0.0)
    {
      v20 = (double)v15 / 255.0;
      *(double *)(a2 + 16) = v20;
    }
    if (v22 >= 0.1 && v19 == 0.0)
    {
      v19 = (double)v15 / 255.0;
      *(double *)(a2 + 24) = v19;
    }
    if (v22 >= 0.25 && v18 == 0.0)
    {
      v18 = (double)v15 / 255.0;
      *(double *)(a2 + 32) = v18;
    }
    if (v22 >= 0.5 && v17 == 0.0)
    {
      v17 = (double)v15 / 255.0;
      *(double *)(a2 + 40) = v17;
    }
    if (v22 >= 0.98 && v16 == 0.0)
    {
      v16 = (double)v15 / 255.0;
      *(double *)(a2 + 48) = v16;
    }
    if (v22 >= 1.0 && *(double *)(a2 + 72) == 0.0)
      *(double *)(a2 + 72) = (double)v15 / 255.0;
    ++v15;
  }
  while (v15 != 256);
  *(double *)(a2 + 64) = v21 * ((sqrt(v21) * -0.65 + 1.0) * 0.85);
  v23 = 0.6 - v17 - v18;
  if (v10 >= 0.8 || *(double *)(a2 + 72) >= 1.0)
    v24 = v23 * 0.9;
  else
    v24 = v23 + fmin(0.8 - v10, 0.2);
  v25 = v17 + v18;
  if (v25 > 0.6)
  {
    if (v16 >= 1.0)
      v26 = -0.4;
    else
      v26 = -0.7;
    v24 = v25 + v26;
  }
  v27 = fmax(v24, 0.1);
  if (v20 <= 0.015 || v16 <= 0.95 || v17 <= 0.14)
  {
    if (v20 > 0.055)
      v27 = -v27;
  }
  else
  {
    v27 = -v27;
  }
  *(double *)(a2 + 56) = v27 * 0.68;
  return result;
}

id arealight_coeffs_from_stats(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  int8x16_t v8;
  double v9;
  float32x4_t v10;
  double v11;
  _BYTE *v12;
  float v14[3];
  uint64_t v15;

  v2 = a2;
  v15 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2 * a2));
  v5 = objc_msgSend(v4, "mutableBytes");
  if (v2)
  {
    v12 = (_BYTE *)(v5 + 1);
    do
    {
      polyfit_stats((uint64_t)v14, a1, v6, v7, v8, v9, v10, v11);
      *(float *)&v7 = v14[2];
      v6 = (v14[0] + 1.2) * 0.29412 * 255.0;
      *(v12 - 1) = llround(v6);
      *(float *)&v6 = *(float *)&v7 * 255.0;
      *v12 = llroundf(*(float *)&v7 * 255.0);
      v12 += 2;
      a1 += 80;
      --v2;
    }
    while (v2);
  }
  return v4;
}

id average_light_coeffs_from_stats(uint64_t a1, unint64_t a2)
{
  id v4;
  _BYTE *v5;
  double v6;
  double v7;
  int8x16_t v8;
  double v9;
  float32x4_t v10;
  double v11;
  float v12;
  unint64_t v13;
  float v14;
  float v16[2];
  float v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 2));
  v5 = (_BYTE *)objc_msgSend(v4, "mutableBytes");
  if (a2)
  {
    v12 = 0.0;
    v13 = a2;
    v14 = 0.0;
    do
    {
      polyfit_stats((uint64_t)v16, a1, v6, v7, v8, v9, v10, v11);
      *(float *)&v6 = v16[0];
      *(float *)&v7 = v17;
      v14 = v14 + v16[0];
      v12 = v12 + v17;
      a1 += 80;
      --v13;
    }
    while (v13);
  }
  else
  {
    v14 = 0.0;
    v12 = 0.0;
  }
  *v5 = llround(((float)(v14 / (float)a2) + 1.2) * 0.29412 * 255.0);
  v5[1] = llroundf((float)(v12 / (float)a2) * 255.0);
  return v4;
}

float polyfit_stats(uint64_t a1, uint64_t a2, double a3, double a4, int8x16_t a5, double a6, float32x4_t a7, double a8)
{
  uint64_t v8;
  double v9;
  float32x2_t v10;
  double v11;
  float v12;
  float32x4_t v13;
  float v14;
  float v15;
  int32x4_t v16;
  float32x4_t v17;
  float32x4_t v23;
  float32x4_t v24;
  float32x4_t v25;
  float32x4_t v26;
  float32x4_t v27;
  float result;
  _DWORD v29[3];
  uint64_t v30;
  int v31;
  uint64_t v32;

  v8 = 0;
  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0x3EDEB85200000000;
  v31 = 1065353216;
  v9 = *(double *)(a2 + 40);
  v10.i32[1] = 1071372042;
  *(double *)a5.i64 = (0.435 - v9) * 0.6 + 0.435;
  a7.i32[1] = -1075629261;
  if (v9 >= 0.435)
    v11 = (v9 + -0.435) * -0.6 + 0.435;
  else
    v11 = (0.435 - v9) * 0.6 + 0.435;
  v29[0] = 0;
  v12 = v11;
  *(float *)&v29[1] = v12;
  v29[2] = 1065353216;
  v13 = 0uLL;
  v10.i32[0] = 0;
  v14 = 0.0;
  a5.i32[0] = 0;
  do
  {
    a7.i32[0] = *(_DWORD *)((char *)&v30 + v8 * 4);
    *(float *)a5.i32 = *(float *)a5.i32 + a7.f32[0];
    v15 = *(float *)&v29[v8];
    v16 = (int32x4_t)a7;
    *(float *)&v16.i32[1] = v15;
    v17 = (float32x4_t)vzip1q_s32(v16, v16);
    v17.i32[2] = a7.i32[0];
    v10.f32[0] = v10.f32[0] + (float)(a7.f32[0] * v15);
    a7.f32[1] = a7.f32[0] * a7.f32[0];
    a7.f32[2] = a7.f32[0] * (float)(a7.f32[0] * a7.f32[0]);
    v14 = v14 + v15;
    a7.f32[3] = a7.f32[0] * a7.f32[0];
    v13 = vmlaq_f32(v13, v17, a7);
    ++v8;
  }
  while (v8 != 3);
  __asm { FMOV            V4.4S, #3.0 }
  _Q4.i32[1] = a5.i32[0];
  _Q4.i64[1] = __PAIR64__(LODWORD(v14), v13.u32[0]);
  v23 = (float32x4_t)vextq_s8(vextq_s8(a5, a5, 4uLL), (int8x16_t)v13, 0xCuLL);
  v23.i32[3] = v10.i32[0];
  *(float *)&a8 = v13.f32[0] / 3.0;
  v10.f32[0] = *(float *)a5.i32 / 3.0;
  v24 = vmlsq_lane_f32(v23, _Q4, v10, 0);
  v25 = vmlsq_lane_f32(v13, _Q4, *(float32x2_t *)&a8, 0);
  v26 = vmlsq_lane_f32(v25, v24, (float32x2_t)*(_OWORD *)&vdivq_f32(v25, v24), 1);
  v27 = vmlsq_laneq_f32(v24, v26, vdivq_f32(v24, v26), 2);
  *(float *)a1 = v26.f32[3] / v26.f32[2];
  *(_DWORD *)(a1 + 4) = vdivq_f32((float32x4_t)vdupq_laneq_s32(*(int32x4_t *)&v27, 3), v27).i32[1];
  result = *(double *)(a2 + 48);
  *(float *)(a1 + 8) = result;
  return result;
}

id getVCPMediaAnalysisServiceClass_14282()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getVCPMediaAnalysisServiceClass_softClass_14283;
  v7 = getVCPMediaAnalysisServiceClass_softClass_14283;
  if (!getVCPMediaAnalysisServiceClass_softClass_14283)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getVCPMediaAnalysisServiceClass_block_invoke_14284;
    v3[3] = &unk_1E5019948;
    v3[4] = &v4;
    __getVCPMediaAnalysisServiceClass_block_invoke_14284((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1A64522FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getVCPMediaAnalysisServiceClass_block_invoke_14284(uint64_t a1)
{
  void *v2;
  void *v3;

  MediaAnalysisLibrary_14285();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("VCPMediaAnalysisService");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getVCPMediaAnalysisServiceClass_softClass_14283 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVCPMediaAnalysisServiceClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PIParallaxAsset.m"), 26, CFSTR("Unable to find class %s"), "VCPMediaAnalysisService");

    __break(1u);
  }
}

void *MediaAnalysisLibrary_14285()
{
  void *v0;
  void *v2;
  void *v3;

  if (!MediaAnalysisLibraryCore_frameworkLibrary_14294)
    MediaAnalysisLibraryCore_frameworkLibrary_14294 = _sl_dlopen();
  v0 = (void *)MediaAnalysisLibraryCore_frameworkLibrary_14294;
  if (!MediaAnalysisLibraryCore_frameworkLibrary_14294)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaAnalysisLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PIParallaxAsset.m"), 25, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void sub_1A6452944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void getMediaAnalysisResultsKey_14303()
{
  id *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = (id *)getMediaAnalysisResultsKeySymbolLoc_ptr_14318;
  v8 = getMediaAnalysisResultsKeySymbolLoc_ptr_14318;
  if (!getMediaAnalysisResultsKeySymbolLoc_ptr_14318)
  {
    v1 = MediaAnalysisLibrary_14285();
    v0 = (id *)dlsym(v1, "MediaAnalysisResultsKey");
    v6[3] = (uint64_t)v0;
    getMediaAnalysisResultsKeySymbolLoc_ptr_14318 = (uint64_t)v0;
  }
  _Block_object_dispose(&v5, 8);
  if (v0)
  {
    v2 = *v0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getMediaAnalysisResultsKey(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PIParallaxAsset.m"), 27, CFSTR("%s"), dlerror());

    __break(1u);
  }
}

void sub_1A6452A48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_14305()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_163_14316);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6452D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6452FA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A6453064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A6453120(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6453180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  void *v9;
  void *v10;

  v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)PIMsgImageBuffer;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A6453314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  void *v20;
  void *v21;

  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1A6453680(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1A6453814(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14495(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14496(uint64_t a1)
{

}

void sub_1A6453C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;

  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__38(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)(a2 + 48);
  v3 = *(_OWORD *)(a2 + 64);
  *(__n128 *)(a1 + 48) = result;
  *(_OWORD *)(a1 + 64) = v3;
  return result;
}

void sub_1A6454BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, void *a18, void *a19)
{
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2)
{
  char *v4;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v4 = (char *)a1[1];
    bzero(v4, 8 * a2);
    a1[1] = &v4[8 * a2];
  }
  return a1;
}

void sub_1A6454DC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void MsgMatrix<double>::AppendRow<double>(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  char *v5;
  unint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)a1 != 3)
  {
    NUAssertLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "num == w");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "componentsJoinedByString:", CFSTR("\n"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v28 = v24;
        v29 = 2114;
        v30 = v26;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
    __break(1u);
LABEL_29:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  v4 = 0;
  v5 = *(char **)(a1 + 16);
  do
  {
    v6 = *(_QWORD *)(a1 + 24);
    if ((unint64_t)v5 >= v6)
    {
      v8 = *(char **)(a1 + 8);
      v9 = (v5 - v8) >> 3;
      v10 = v9 + 1;
      if ((unint64_t)(v9 + 1) >> 61)
        goto LABEL_29;
      v11 = v6 - (_QWORD)v8;
      if (v11 >> 2 > v10)
        v10 = v11 >> 2;
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8)
        v12 = 0x1FFFFFFFFFFFFFFFLL;
      else
        v12 = v10;
      if (v12)
      {
        v12 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v12);
        v8 = *(char **)(a1 + 8);
        v5 = *(char **)(a1 + 16);
      }
      else
      {
        v13 = 0;
      }
      v14 = (_QWORD *)(v12 + 8 * v9);
      *v14 = *(_QWORD *)(a2 + 8 * v4);
      v7 = (char *)(v14 + 1);
      while (v5 != v8)
      {
        v15 = *((_QWORD *)v5 - 1);
        v5 -= 8;
        *--v14 = v15;
      }
      *(_QWORD *)(a1 + 8) = v14;
      *(_QWORD *)(a1 + 16) = v7;
      *(_QWORD *)(a1 + 24) = v12 + 8 * v13;
      if (v8)
        operator delete(v8);
    }
    else
    {
      *(_QWORD *)v5 = *(_QWORD *)(a2 + 8 * v4);
      v7 = v5 + 8;
    }
    *(_QWORD *)(a1 + 16) = v7;
    ++v4;
    v5 = v7;
  }
  while (v4 != 3);
  ++*(_DWORD *)(a1 + 4);
}

void sub_1A64550F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

uint64_t MsgMatrix<double>::operator()(unsigned int *a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  const void **v9;
  void *specific;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (v3 <= a2 || a1[1] <= a3)
  {
    NUAssertLogger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "xi < w && yi < h");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v8;
      _os_log_error_impl(&dword_1A6382000, v7, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v9 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v12)
      {
        v13 = dispatch_get_specific(*v9);
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v27 = v13;
        v28 = 2114;
        v29 = v15;
        _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v12)
    {
LABEL_17:
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v22;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
LABEL_20:

    _NUAssertFailHandler();
    __break(1u);
  }
  v4 = a2 + v3 * a3;
  v5 = *((_QWORD *)a1 + 1);
  if (v4 >= (*((_QWORD *)a1 + 2) - v5) >> 3)
  {
    NUAssertLogger();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "index < data.size()");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v27 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    v19 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger();
    v11 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!v19)
    {
      if (!v20)
        goto LABEL_20;
      goto LABEL_17;
    }
    if (v20)
    {
      v23 = dispatch_get_specific(*v18);
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "componentsJoinedByString:", CFSTR("\n"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v23;
      v28 = 2114;
      v29 = v25;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

    }
    goto LABEL_20;
  }
  return v5 + 8 * v4;
}

void sub_1A645556C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

_QWORD *MsgMatrix<double>::T(unsigned int *a1, unsigned int *a2)
{
  unsigned int v4;
  unsigned int v5;
  _QWORD *result;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v5 = *a2;
  v4 = a2[1];
  v17 = 0;
  *a1 = v4;
  a1[1] = v5;
  result = std::vector<double>::vector((_QWORD *)a1 + 1, v5 * v4, &v17);
  v7 = a2[1];
  if ((_DWORD)v7)
  {
    v8 = 0;
    v9 = (uint64_t *)*((_QWORD *)a2 + 1);
    v10 = (_QWORD *)*((_QWORD *)a1 + 1);
    v11 = *a2;
    v12 = 8 * *a1;
    do
    {
      v13 = v9;
      v14 = v10;
      v15 = v11;
      if ((_DWORD)v11)
      {
        do
        {
          v16 = *v13++;
          *v14 = v16;
          v14 = (_QWORD *)((char *)v14 + v12);
          --v15;
        }
        while (v15);
      }
      ++v8;
      ++v10;
      v9 += v11;
    }
    while (v8 != v7);
  }
  return result;
}

_QWORD *std::vector<double>::vector(_QWORD *a1, unint64_t a2, _QWORD *a3)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;

  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  if (a2)
  {
    std::vector<double>::__vallocate[abi:ne180100](a1, a2);
    v6 = (_QWORD *)a1[1];
    v7 = &v6[a2];
    v8 = 8 * a2;
    do
    {
      *v6++ = *a3;
      v8 -= 8;
    }
    while (v8);
    a1[1] = v7;
  }
  return a1;
}

void sub_1A64556EC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char *std::vector<double>::__vallocate[abi:ne180100](_QWORD *a1, unint64_t a2)
{
  char *result;
  uint64_t v4;

  if (a2 >> 61)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  result = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void sub_1A6457988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_14867()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_14892);
  return (id)*MEMORY[0x1E0D52380];
}

Class __getIHKFeatureVectorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary_14878)
    ImageHarmonizationKitLibraryCore_frameworkLibrary_14878 = _sl_dlopen();
  if (!ImageHarmonizationKitLibraryCore_frameworkLibrary_14878)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ImageHarmonizationKitLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PISliderNetAdjustmentsRequest.m"), 28, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("IHKFeatureVector");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getIHKFeatureVectorClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PISliderNetAdjustmentsRequest.m"), 29, CFSTR("Unable to find class %s"), "IHKFeatureVector");

LABEL_8:
    __break(1u);
  }
  getIHKFeatureVectorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id NUAssertLogger_15027()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_492);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_15532()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_15559);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_15623()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_15611);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_15802()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_102);
  return (id)*MEMORY[0x1E0D52380];
}

uint64_t smart_tone_stats_from_histogram(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  double *v6;
  unint64_t v7;
  double v8;
  long double v9;
  long double v10;
  double v11;
  double v12;
  uint64_t v13;
  double *v14;
  double v15;
  double *v16;
  uint64_t v17;
  double v18;
  double v19;
  double *v20;
  uint64_t v21;
  double v22;
  unint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  _QWORD v38[2];

  v38[1] = *MEMORY[0x1E0C80C00];
  v4 = a3 + a2;
  if (a3 + a2 >= 2)
  {
    v6 = (double *)result;
    v7 = 0;
    v8 = (double)a2 + -1.0;
    *(_QWORD *)(a4 + 72) = 0;
    *(_QWORD *)a4 = 0;
    *(_QWORD *)(a4 + 8) = 0;
    v9 = 0.0;
    v10 = 0.0;
    do
    {
      v11 = fmin((double)v7 / v8, 1.0);
      v12 = v6[v7];
      v9 = v9 + v12 * log(v11 + 0.00392156863);
      *(long double *)a4 = v9;
      v10 = v10 + v12 * log(1.0 - v11 + 0.00392156863);
      *(long double *)(a4 + 8) = v10;
      ++v7;
    }
    while (v4 != v7);
    *(long double *)a4 = exp(v9);
    *(long double *)(a4 + 8) = exp(v10);
    result = MEMORY[0x1E0C80A78](v38);
    v14 = (double *)((char *)v38 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
    v15 = 1.0e-40;
    v16 = v6;
    v17 = v4;
    do
    {
      v18 = *v16++;
      v15 = v15 + v18;
      --v17;
    }
    while (v17);
    v19 = 0.0;
    v20 = v14;
    v21 = v4;
    do
    {
      v22 = *v6++;
      v19 = v19 + v22;
      *v20++ = v19 / v15;
      --v21;
    }
    while (v21);
    v23 = 0;
    v24 = 0.0;
    *(_OWORD *)(a4 + 16) = 0u;
    *(_QWORD *)(a4 + 48) = 0;
    *(_OWORD *)(a4 + 32) = 0u;
    v25 = 0.0;
    v26 = 0.0;
    v27 = 0.0;
    v28 = 0.0;
    v29 = 0.0;
    do
    {
      v30 = v14[v23];
      if (v30 >= 0.001 && v29 == 0.0)
        v29 = (double)v23 / v8;
      if (v30 >= 0.02 && v28 == 0.0)
      {
        v28 = (double)v23 / v8;
        *(double *)(a4 + 16) = v28;
      }
      if (v30 >= 0.1 && v27 == 0.0)
      {
        v27 = (double)v23 / v8;
        *(double *)(a4 + 24) = v27;
      }
      if (v30 >= 0.25 && v26 == 0.0)
      {
        v26 = (double)v23 / v8;
        *(double *)(a4 + 32) = v26;
      }
      if (v30 >= 0.5 && v25 == 0.0)
      {
        v25 = (double)v23 / v8;
        *(double *)(a4 + 40) = v25;
      }
      if (v30 >= 0.98 && v24 == 0.0)
      {
        v24 = (double)v23 / v8;
        *(double *)(a4 + 48) = v24;
      }
      if (v30 >= 1.0 && *(double *)(a4 + 72) == 0.0)
        *(double *)(a4 + 72) = (double)v23 / v8;
      ++v23;
    }
    while (v4 != v23);
    *(double *)(a4 + 64) = v29 * ((sqrt(v29) * -0.65 + 1.0) * 0.85);
    v31 = 0.6 - v25 - v26;
    v32 = *(double *)(a4 + 8);
    if (v32 >= 0.8 || *(double *)(a4 + 72) >= 1.0)
      v33 = v31 * 0.9;
    else
      v33 = v31 + fmin(0.8 - v32, 0.2);
    v34 = v25 + v26;
    if (v34 > 0.6)
    {
      if (v24 >= 1.0)
        v35 = -0.4;
      else
        v35 = -0.7;
      v33 = v34 + v35;
    }
    v36 = fmax(v33, 0.1);
    if (v28 <= 0.015 || v24 <= 0.95 || v25 <= 0.14)
    {
      v37 = -v36;
      if (v28 <= 0.055)
        v37 = v36;
    }
    else
    {
      v37 = -v36;
    }
    *(double *)(a4 + 56) = v37 * 0.68;
  }
  return result;
}

id NUAssertLogger_16179()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_339_16199);
  return (id)*MEMORY[0x1E0D52380];
}

id NURenderLogger_16584()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_98);
  return (id)*MEMORY[0x1E0D523A0];
}

id NUAssertLogger_17296()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_840);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_17665()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_352);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6475664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1A647806C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1A6478D84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61)
{
  uint64_t v61;

  _Block_object_dispose(&a43, 8);
  _Block_object_dispose(&a49, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose(&a61, 8);
  _Block_object_dispose((const void *)(v61 - 256), 8);
  _Block_object_dispose((const void *)(v61 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1A64797EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_17881()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_525);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_17889()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_524);
  return (id)*MEMORY[0x1E0D52398];
}

uint64_t __Block_byref_object_copy__17900(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17901(uint64_t a1)
{

}

id NUAssertLogger_18311()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_18323);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A648E554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NUAssertLogger_18454()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_18466);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_18993()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19062);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_19038()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_213);
  return (id)*MEMORY[0x1E0D52398];
}

double smart_color_adjustments_from_stats(double *a1, double *a2, double result)
{
  double v3;
  double v4;
  double v5;
  double v6;

  *a1 = 0.0;
  a1[1] = 0.0;
  a1[2] = 0.0;
  v3 = a2[1];
  if (result == 0.0 || v3 >= 0.01)
  {
    v4 = 0.0;
    if (result + result > 1.0 - v3)
      v4 = -(1.0 - v3 - result * 2.0) * 0.75;
    if (result >= 0.0)
    {
      v5 = result / 3.0;
      result = result / (fmax(*a2, 0.5) * 3.0);
      if (*a2 <= 0.0)
        result = v5;
    }
    *a1 = fmin(fmax(result, -1.0), 1.0);
    if (a2[3] > 0.75)
    {
      v6 = *a2;
      if (v3 > 0.9 && v6 > 0.55 && v6 < 0.65)
        v4 = -v4;
    }
    result = fmin(fmax(v4 * 0.5, -1.0), 1.0);
    a1[1] = result;
  }
  return result;
}

id NUAssertLogger_19395()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_109);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6493D34(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A64940C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A64949AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Unwind_Resume(a1);
}

uint64_t isLivePhotoMetadataTrack(AVAssetTrack *a1)
{
  void *v1;
  const opaqueCMFormatDescription *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  -[AVAssetTrack formatDescriptions](a1, "formatDescriptions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count") == 1
    && (objc_msgSend(v1, "firstObject"),
        v2 = (const opaqueCMFormatDescription *)objc_claimAutoreleasedReturnValue(),
        v2,
        v2))
  {
    CMMetadataFormatDescriptionGetIdentifiers(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      v5 = objc_msgSend(v3, "containsObject:", *MEMORY[0x1E0D053E0]);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_1A6494BA8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6494C2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id NUAssertLogger_19614()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_80_19630);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A6495E2C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A6496668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11)
{
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19674(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19675(uint64_t a1)
{

}

void sub_1A6496D28(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6496F30(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1A6497334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_1A64974A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A64975C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A649765C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1A6497A64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1A6497D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{
  void *v10;
  void *v11;

  _Unwind_Resume(a1);
}

void sub_1A6497F38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6498018(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A6498178(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A6498224(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

float grainParams(float a1)
{
  int v1;
  unsigned int v2;
  float v3;
  float v4;

  if (a1 < 400.0)
    v1 = 1;
  else
    v1 = 2;
  if (a1 >= 50.0)
    v2 = v1;
  else
    v2 = 0;
  v3 = log10f(a1);
  v4 = log10f(flt_1A64DDF70[v2]);
  return fmaxf(flt_1A64DDF80[v2]+ (float)((float)(flt_1A64DDF80[v2 + 1] - flt_1A64DDF80[v2])* (float)((float)(v3 - v4) / (float)(log10f(flt_1A64DDF70[v2 + 1]) - v4))), 0.5);
}

id applyGrainParams(void *a1, float a2)
{
  float v3;
  int v4;
  int v5;
  int v6;
  int v7;
  void *v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x1E0C80C00];
  v3 = grainParams(a2);
  v5 = v4;
  v7 = v6;
  objc_msgSend(a1, "imageByApplyingGaussianBlurWithSigma:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = CFSTR("inputRadius");
  LODWORD(v9) = v5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = CFSTR("inputIntensity");
  v17[0] = v10;
  LODWORD(v11) = v7;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageByApplyingFilter:withInputParameters:", CFSTR("CIUnsharpMask"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

unint64_t __generateNoiseImage_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  unint64_t result;
  uint64_t v20;
  _QWORD v21[2];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t __src;

  if (a6 != 1536)
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 224, "width==512*3");
  if (a7 != 1536)
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 225, "height==512*3");
  if (a4)
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 226, "x==0");
  if (a5)
    __assert_rtn("generateNoiseImage_block_invoke", "PIPhotoGrainHDR.m", 227, "y==0");
  v7 = 0;
  v8 = 0uLL;
  v9 = xmmword_1A64DDE70;
  v10 = (a3 << 9) | 3;
  v11 = (a3 << 10) | 1;
  do
  {
    v12 = 0;
    v13 = (_BYTE *)(a2 + v7 * a3);
    v20 = v7;
    v14 = 1536;
    do
    {
      __src = v7 - 261632 * (v12 / 0x1FF);
      v26 = v8;
      v27 = v8;
      v23 = *((_QWORD *)&v8 + 1);
      v25 = *((_QWORD *)&v8 + 1);
      v15 = &v13[v10];
      v16 = &v13[v11];
      v21[1] = v8;
      v22 = v9;
      v24 = 0x61C8864E7A143579;
      v21[0] = 0;
      XXH64_update((uint64_t)v21, (char *)&__src, 8uLL);
      result = XXH64_digest((uint64_t)v21);
      v9 = xmmword_1A64DDE70;
      v8 = 0uLL;
      v13[2] = result;
      v13[1] = result;
      *v13 = result;
      v13[3] = -1;
      *(v15 - 1) = result;
      *(v15 - 2) = result;
      *(v15 - 3) = result;
      *v15 = -1;
      v16[1] = result;
      *v16 = result;
      ++v12;
      *(v16 - 1) = result;
      v13 += 4;
      v7 += 512;
      v16[2] = -1;
      --v14;
    }
    while (v14);
    v7 = v20 + 1;
  }
  while (v20 != 511);
  return result;
}

void sub_1A649AC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A649AD98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A649AE28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A649C0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id NUAssertLogger_20035()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_19982);
  return (id)*MEMORY[0x1E0D52380];
}

Class __getVCPMediaAnalysisServiceClass_block_invoke_20127(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!MediaAnalysisLibraryCore_frameworkLibrary_20135)
    MediaAnalysisLibraryCore_frameworkLibrary_20135 = _sl_dlopen();
  if (!MediaAnalysisLibraryCore_frameworkLibrary_20135)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *MediaAnalysisLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PISegmentation.m"), 31, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("VCPMediaAnalysisService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getVCPMediaAnalysisServiceClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PISegmentation.m"), 32, CFSTR("Unable to find class %s"), "VCPMediaAnalysisService");

LABEL_8:
    __break(1u);
  }
  getVCPMediaAnalysisServiceClass_softClass_20126 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id NUAssertLogger_20263()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_20282);
  return (id)*MEMORY[0x1E0D52380];
}

id optionsForFormat(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v30[4];
  _QWORD v31[4];
  _QWORD v32[4];
  _QWORD v33[4];
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[5];
  _QWORD v37[5];
  uint64_t v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0D522D8], "currentSoftwareVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "buildNumber");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("GU %@ %@"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = *MEMORY[0x1E0CBD0D8];
  v39[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D52220], "RGBAf");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v1, "isEqualToPixelFormat:", v7);

  if (v8)
  {
    v9 = *MEMORY[0x1E0CBCF30];
    v36[0] = *MEMORY[0x1E0CBCA08];
    v36[1] = v9;
    v37[0] = &unk_1E50518E0;
    v37[1] = MEMORY[0x1E0C9AAB0];
    v10 = *MEMORY[0x1E0CBC8C8];
    v36[2] = *MEMORY[0x1E0CBCEA0];
    v36[3] = v10;
    v11 = *MEMORY[0x1E0CBC8D8];
    v37[2] = MEMORY[0x1E0C9AAB0];
    v37[3] = v11;
    v36[4] = *MEMORY[0x1E0CBD090];
    v37[4] = v6;
    v12 = (void *)MEMORY[0x1E0C99D80];
    v13 = v37;
    v14 = v36;
    v15 = 5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D52220], "RGBA16");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v1, "isEqualToPixelFormat:", v16);

    if (v17)
    {
      v18 = *MEMORY[0x1E0CBCEA0];
      v34[0] = *MEMORY[0x1E0CBCA08];
      v34[1] = v18;
      v35[0] = &unk_1E50518F8;
      v35[1] = MEMORY[0x1E0C9AAB0];
      v19 = *MEMORY[0x1E0CBD090];
      v34[2] = *MEMORY[0x1E0CBC8C8];
      v34[3] = v19;
      v35[2] = *MEMORY[0x1E0CBC8D8];
      v35[3] = v6;
      v12 = (void *)MEMORY[0x1E0C99D80];
      v13 = v35;
      v14 = v34;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D52220], "ARGB8");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v1, "isEqualToPixelFormat:", v20);

      if (v21)
      {
        v22 = *MEMORY[0x1E0CBCEA0];
        v32[0] = *MEMORY[0x1E0CBCA08];
        v32[1] = v22;
        v33[0] = &unk_1E5051910;
        v33[1] = MEMORY[0x1E0C9AAB0];
        v23 = *MEMORY[0x1E0CBD090];
        v32[2] = *MEMORY[0x1E0CBC8C8];
        v32[3] = v23;
        v33[2] = *MEMORY[0x1E0CBC8D8];
        v33[3] = v6;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = v33;
        v14 = v32;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0D52220], "BGRA8");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v1, "isEqualToPixelFormat:", v24);

        if (!v25)
        {
          v28 = 0;
          goto LABEL_11;
        }
        v26 = *MEMORY[0x1E0CBCEA0];
        v30[0] = *MEMORY[0x1E0CBCA08];
        v30[1] = v26;
        v31[0] = &unk_1E5051910;
        v31[1] = MEMORY[0x1E0C9AAB0];
        v27 = *MEMORY[0x1E0CBD090];
        v30[2] = *MEMORY[0x1E0CBC8C8];
        v30[3] = v27;
        v31[2] = *MEMORY[0x1E0CBC8D8];
        v31[3] = v6;
        v12 = (void *)MEMORY[0x1E0C99D80];
        v13 = v31;
        v14 = v30;
      }
    }
    v15 = 4;
  }
  objc_msgSend(v12, "dictionaryWithObjects:forKeys:count:", v13, v14, v15);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v28;
}

void sub_1A64A0758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A64A09E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;

  _Unwind_Resume(a1);
}

void sub_1A64A10C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, void *a16, void *a17, void *a18, uint64_t a19, void *a20)
{
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1A64A1250(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A64A17CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *a17)
{
  void *v17;

  _Unwind_Resume(a1);
}

id NUAssertLogger_20449()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_303);
  return (id)*MEMORY[0x1E0D52380];
}

id NULogger_20558()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_306);
  return (id)*MEMORY[0x1E0D52398];
}

void sub_1A64A552C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

id NUAssertLogger_20897()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_165);
  return (id)*MEMORY[0x1E0D52380];
}

void sub_1A64A9408(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1A64A97A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14, uint64_t a15, void *a16)
{
  void *v16;

  _Unwind_Resume(a1);
}

void sub_1A64A9EA0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v7 = v4;

  _Unwind_Resume(a1);
}

void sub_1A64AA1E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_1A64AA928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, void *a16, void *a17, uint64_t a18, void *a19, void *a20,void *a21)
{

  _Unwind_Resume(a1);
}

void sub_1A64ABB50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, void *a18)
{
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;

  _Unwind_Resume(a1);
}

void sub_1A64AD298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;

  v31 = (void *)STACK[0xB38];
  if (STACK[0xB38])
  {
    STACK[0xB40] = (unint64_t)v31;
    operator delete(v31);
  }
  v32 = 0;
  while (1)
  {
    v33 = *(void **)(&a30 + v32 + 2680);
    if (v33)
    {
      *(_QWORD *)(&a30 + v32 + 2688) = v33;
      operator delete(v33);
    }
    v32 -= 24;
    if (v32 == -72)
    {
      v34 = (void *)STACK[0xAD8];
      if (STACK[0xAD8])
      {
        STACK[0xAE0] = (unint64_t)v34;
        operator delete(v34);
      }
      v35 = (void *)STACK[0xAC0];
      if (STACK[0xAC0])
      {
        STACK[0xAC8] = (unint64_t)v35;
        operator delete(v35);
      }
      v36 = (void *)STACK[0xAA8];
      if (STACK[0xAA8])
      {
        STACK[0xAB0] = (unint64_t)v36;
        operator delete(v36);
      }
      v37 = (void *)STACK[0xA90];
      if (STACK[0xA90])
      {
        STACK[0xA98] = (unint64_t)v37;
        operator delete(v37);
      }
      _Unwind_Resume(a1);
    }
  }
}

void _ZNSt3__16vectorIDv2_sNS_9allocatorIS1_EEE7reserveEm(void **a1, unint64_t a2)
{
  int64_t v3;
  char *v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  int v11;

  if (a2 > ((_BYTE *)a1[2] - (_BYTE *)*a1) >> 2)
  {
    if (a2 >> 62)
      std::vector<float>::__throw_length_error[abi:ne180100]();
    v3 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v4 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(a2);
    v5 = &v4[v3 & 0xFFFFFFFFFFFFFFFCLL];
    v7 = &v4[4 * v6];
    v9 = (char *)*a1;
    v8 = (char *)a1[1];
    v10 = v5;
    if (v8 != *a1)
    {
      do
      {
        v11 = *((_DWORD *)v8 - 1);
        v8 -= 4;
        *((_DWORD *)v10 - 1) = v11;
        v10 -= 4;
      }
      while (v8 != v9);
      v8 = (char *)*a1;
    }
    *a1 = v10;
    a1[1] = v5;
    a1[2] = v7;
    if (v8)
      operator delete(v8);
  }
}

void _ZNSt3__16vectorIDv4_fNS_9allocatorIS1_EEE6resizeEm(char **a1, unint64_t a2)
{
  char *v3;
  char *v4;
  unint64_t v5;
  unint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  char *v12;
  char *v13;
  char *v14;
  __int128 v15;
  char *v16;

  v4 = *a1;
  v3 = a1[1];
  v5 = (v3 - *a1) >> 4;
  if (a2 <= v5)
  {
    if (a2 >= v5)
      return;
    v16 = &v4[16 * a2];
    goto LABEL_18;
  }
  v6 = a2 - v5;
  v7 = a1[2];
  if (a2 - v5 <= (v7 - v3) >> 4)
  {
    bzero(a1[1], 16 * v6);
    v16 = &v3[16 * v6];
LABEL_18:
    a1[1] = v16;
    return;
  }
  if (a2 >> 60)
    std::vector<float>::__throw_length_error[abi:ne180100]();
  v8 = v7 - v4;
  v9 = v8 >> 3;
  if (v8 >> 3 <= a2)
    v9 = a2;
  if ((unint64_t)v8 >= 0x7FFFFFFFFFFFFFF0)
    v10 = 0xFFFFFFFFFFFFFFFLL;
  else
    v10 = v9;
  if (v10 >> 60)
    std::__throw_bad_array_new_length[abi:ne180100]();
  v11 = (char *)operator new(16 * v10);
  v12 = &v11[16 * v5];
  v13 = &v11[16 * v10];
  bzero(v12, 16 * v6);
  v14 = &v12[16 * v6];
  if (v3 != v4)
  {
    do
    {
      v15 = *((_OWORD *)v3 - 1);
      v3 -= 16;
      *((_OWORD *)v12 - 1) = v15;
      v12 -= 16;
    }
    while (v3 != v4);
    v3 = *a1;
  }
  *a1 = v12;
  a1[1] = v14;
  a1[2] = v13;
  if (v3)
    operator delete(v3);
}

BOOL `anonymous namespace'::_NTKUltraCubeFiller::isLocationOpen(int a1, uint64_t a2, int a3)
{
  _BYTE *v3;
  unsigned int v5;
  int v6;
  _BYTE *v7;
  unsigned int v8;

  v3 = (_BYTE *)(a2 + (a3 >> 16) * a1 + (__int16)a3);
  if (*v3)
    return 0;
  v5 = v3[-a1] == 1;
  if (v3[-a1] == 1)
    v6 = 2;
  else
    v6 = 1;
  if (v3[~a1] == 1)
    v5 = v6;
  if (v3[1 - a1] == 1)
    ++v5;
  v7 = &v3[a1];
  if (*v7 == 1)
    ++v5;
  if (*(v7 - 1) == 1)
    ++v5;
  if (v7[1] == 1)
    ++v5;
  if (*(v3 - 1) == 1)
    ++v5;
  if (v3[1] == 1)
    v8 = v5 + 1;
  else
    v8 = v5;
  return v8 > 2;
}

std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type std::mersenne_twister_engine<unsigned int,32ul,624ul,397ul,31ul,2567483615u,11ul,4294967295u,7ul,2636928640u,15ul,4022730752u,18ul,1812433253u>::operator()(std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253> *this)
{
  size_t i;
  size_t v2;
  std::mersenne_twister_engine<unsigned int, 32, 624, 397, 31, 2567483615, 11, 4294967295, 7, 2636928640, 15, 4022730752, 18, 1812433253>::result_type v3;

  i = this->__i_;
  v2 = (i + 1) % 0x270;
  v3 = this->__x_[(i + 397) % 0x270] ^ ((this->__x_[v2] & 0x7FFFFFFE | this->__x_[i] & 0x80000000) >> 1) ^ ((int)(this->__x_[v2] << 31) >> 31) & 0x9908B0DF;
  this->__x_[i] = v3;
  this->__i_ = v2;
  LODWORD(i) = ((v3 ^ (v3 >> 11)) << 7) & 0x9D2C5680 ^ v3 ^ (v3 >> 11);
  return ((_DWORD)i << 15) & 0xEFC60000 ^ i ^ ((((_DWORD)i << 15) & 0xEFC60000 ^ i) >> 18);
}

void CGrNavigatorT<unsigned char,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  void *v1;

  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

void CGrNavigatorT<__simd128_float32_t,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  void *v1;

  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

void sub_1A64AF098(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,void *a21)
{

  _Unwind_Resume(a1);
}

id NUAssertLogger_21201()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21213);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_21345()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_153_21357);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_21458()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_21473);
  return (id)*MEMORY[0x1E0D52380];
}

id NUAssertLogger_21653()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_45_21668);
  return (id)*MEMORY[0x1E0D52380];
}

BOOL PIAutoLoopFlavorProducesOnlyVideo(uint64_t a1)
{
  BOOL v1;

  if (a1)
    v1 = a1 == 3;
  else
    v1 = 1;
  return !v1;
}

const __CFString *PIAutoLoopFlavorToString(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("AutoLoop");
  else
    return off_1E5019E30[a1];
}

uint64_t PIAutoLoopFlavorFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("AutoLoop")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("Mirror")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("LongExposure")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    objc_msgSend(v1, "isEqualToString:", CFSTR("None"));
    v2 = 0;
  }

  return v2;
}

id PIAutoLoopFindVideoSourceNode(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "uniqueInputNode");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

id PIAutoLoopRecipeForFlavor(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _BYTE buf[12];
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    NUAssertLogger_21717();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v19 = dispatch_get_specific(*v13);
        v20 = (void *)MEMORY[0x1E0CB3978];
        v21 = v19;
        objc_msgSend(v20, "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v19;
        v25 = 2114;
        v26 = v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v18;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  *(_QWORD *)buf = 0;
  if (MEMORY[0x1A85C03C0]())
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loopRecipe_stabCropRect"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (a2)
      {
        if (a2 == 2)
        {
          v6 = CFSTR("PingPong");
        }
        else if (a2 == 3)
        {
          v6 = CFSTR("LongExposure");
        }
        else
        {
          v6 = CFSTR("AutoLoop");
        }
      }
      else
      {
        v6 = CFSTR("None");
      }
      objc_msgSend(v4, "objectForKeyedSubscript:", v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("recipe"));
      v9 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v9;
    }

LABEL_19:
    v7 = v4;
    return v7;
  }
  if (!a2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("PI Exception"), CFSTR("invalid recipe flavor"));
  if (!liveAnalysisResultFromDictionary())
    goto LABEL_19;
  if (liveAnalysisResultCopyRecipe())
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("PI Exception"), CFSTR("Failed to extract from cookbook"));
  alLoopRecipeToDict();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  liveAnalysisResultDestroy();
  return v7;
}

id NUAssertLogger_21717()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_66_21739);
  return (id)*MEMORY[0x1E0D52380];
}

BOOL PIAutoLoopRecipeIsValid()
{
  return MEMORY[0x1A85C03C0]() == 0;
}

id PIAutoLoopRecipeGetCropRectDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("loopRecipe_stabCropRect"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D004B8]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D004C8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

double PIAutoLoopRecipeGetCropRect(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  const __CFString *v5;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  float v10;
  float v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v16;
  void *v17;
  const void **v18;
  void *specific;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_21717();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v17;
      _os_log_error_impl(&dword_1A6382000, v16, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v18 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v21)
      {
        v24 = dispatch_get_specific(*v18);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("\n"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v24;
        v31 = 2114;
        v32 = v28;
        _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v21)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v23;
      _os_log_error_impl(&dword_1A6382000, v20, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v2 = v1;
  PIAutoLoopRecipeGetCropRectDictionary(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1A85C03C0](v2);
  if (v4)
    v5 = CFSTR("origin_x");
  else
    v5 = CFSTR("X");
  if (v4)
    v6 = CFSTR("origin_y");
  else
    v6 = CFSTR("Y");
  if (v4)
    v7 = CFSTR("width");
  else
    v7 = CFSTR("Width");
  if (v4)
    v8 = CFSTR("height");
  else
    v8 = CFSTR("Height");
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  v11 = v10;

  objc_msgSend(v3, "objectForKeyedSubscript:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "floatValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "floatValue");

  objc_msgSend(v3, "objectForKeyedSubscript:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");

  return v11;
}

BOOL PIAutoLoopRecipeHasGoodStabilization(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  _BOOL8 v7;
  NSObject *v9;
  void *v10;
  const void **v11;
  void *specific;
  NSObject *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_21717();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v10;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v11 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v14)
      {
        v17 = dispatch_get_specific(*v11);
        v18 = (void *)MEMORY[0x1E0CB3978];
        v19 = v17;
        objc_msgSend(v18, "callStackSymbols");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "componentsJoinedByString:", CFSTR("\n"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v23 = v17;
        v24 = 2114;
        v25 = v21;
        _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v14)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "componentsJoinedByString:", CFSTR("\n"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v23 = v16;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v2 = v1;
  objc_msgSend(v1, "objectForKeyedSubscript:", *MEMORY[0x1E0D004B8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = (const __CFString *)*MEMORY[0x1E0D004D0];
  }
  else
  {
    v5 = CFSTR("loopRecipe_stabilizeResult");
    v3 = v2;
  }
  objc_msgSend(v3, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "intValue") - 1 < 2;

  return v7;
}

void PIAutoLoopRecipeFrameTransformGetTime(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  const __CFDictionary *v4;
  NSObject *v5;
  void *v6;
  const void **v7;
  void *specific;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    NUAssertLogger_21717();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "frameTransform != nil");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_error_impl(&dword_1A6382000, v5, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v7 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v10)
      {
        v13 = dispatch_get_specific(*v7);
        v14 = (void *)MEMORY[0x1E0CB3978];
        v15 = v13;
        objc_msgSend(v14, "callStackSymbols");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v20 = v13;
        v21 = 2114;
        v22 = v17;
        _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsJoinedByString:", CFSTR("\n"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v20 = v12;
      _os_log_error_impl(&dword_1A6382000, v9, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v18 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("frameTransform_rawTime"));
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)a2 = 0;
  CMTimeMakeFromDictionary((CMTime *)a2, v4);

}

double PIAutoLoopRecipeFrameTransformGetHomography(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  int v8;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  _OWORD v23[3];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_21717();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "frameTransform != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v25 = v18;
        v26 = 2114;
        v27 = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v25 = v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v2 = v1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("frameTransform_homography"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  memset(v23, 0, sizeof(v23));
  do
  {
    v5 = 0;
    v6 = v4;
    do
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "floatValue");
      *((_DWORD *)&v23[v4] + v5) = v8;

      ++v5;
      v6 += 3;
    }
    while (v5 != 3);
    ++v4;
  }
  while (v4 != 3);

  return *(double *)v23;
}

id PIAutoLoopRecipeComputeOutputGeometry(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  NSObject *v6;
  const void **v7;
  const void **v8;
  void *specific;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  NSObject *v13;
  const void **v14;
  void *v15;
  int v16;
  void *v17;
  NSObject *v18;
  const void **v19;
  void *v20;
  int v21;
  void *v22;
  const void **v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  int buf;
  const void **buf_4;
  __int16 buf_12;
  void *buf_14;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (!v1)
  {
    NUAssertLogger_21717();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != NULL");
      v7 = (const void **)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      buf_4 = v7;
      _os_log_error_impl(&dword_1A6382000, v6, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v11)
      {
        v24 = dispatch_get_specific(*v8);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v8 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        buf = 138543618;
        buf_4 = (const void **)v24;
        buf_12 = 2114;
        buf_14 = v27;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

      }
    }
    else if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("\n"));
      v8 = (const void **)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      buf_4 = v8;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

    }
    v16 = _NUAssertFailHandler();
    goto LABEL_23;
  }
  v2 = v1;
  if ((NUOrientationIsValid() & 1) == 0)
  {
    NUAssertLogger_21717();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUOrientationIsValid(videoOrientation)");
      v14 = (const void **)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      buf_4 = v14;
      _os_log_error_impl(&dword_1A6382000, v13, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    v15 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v10 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!v15)
    {
      if (v16)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
        v8 = (const void **)objc_claimAutoreleasedReturnValue();
        buf = 138543362;
        buf_4 = v8;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
LABEL_25:

      v21 = _NUAssertFailHandler();
      goto LABEL_26;
    }
LABEL_23:
    if (v16)
    {
      v28 = dispatch_get_specific(*v8);
      v29 = (void *)MEMORY[0x1E0CB3978];
      v30 = v28;
      objc_msgSend(v29, "callStackSymbols");
      v8 = (const void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsJoinedByString:", CFSTR("\n"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      buf_4 = (const void **)v28;
      buf_12 = 2114;
      buf_14 = v31;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

    }
    goto LABEL_25;
  }
  if ((NUScaleIsValid() & 1) == 0)
  {
    NUAssertLogger_21717();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "NUScaleIsValid(videoScale)");
      v19 = (const void **)objc_claimAutoreleasedReturnValue();
      buf = 138543362;
      buf_4 = v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&buf, 0xCu);

    }
    v8 = (const void **)MEMORY[0x1E0D51D48];
    v20 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v10 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (const void **)objc_claimAutoreleasedReturnValue();
        buf = 138543362;
        buf_4 = v23;
        _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&buf, 0xCu);

      }
      goto LABEL_28;
    }
LABEL_26:
    if (v21)
    {
      v32 = dispatch_get_specific(*v8);
      v33 = (void *)MEMORY[0x1E0CB3978];
      v34 = v32;
      objc_msgSend(v33, "callStackSymbols");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "componentsJoinedByString:", CFSTR("\n"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      buf = 138543618;
      buf_4 = (const void **)v32;
      buf_12 = 2114;
      buf_14 = v36;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&buf, 0x16u);

    }
LABEL_28:

    _NUAssertFailHandler();
  }
  PIAutoLoopRecipeGetCropRect(v2);
  NUPixelSizeFromCGSize();
  NUOrientationTransformImageSize();
  NUScaleInvert();
  NUScaleToDouble();
  NUPixelRectScale();
  v3 = objc_alloc(MEMORY[0x1E0D52170]);
  v4 = (void *)objc_msgSend(v3, "initWithExtent:renderScale:orientation:", &buf, *MEMORY[0x1E0D51F70], *(_QWORD *)(MEMORY[0x1E0D51F70] + 8), 1);

  return v4;
}

id PIAutoLoopRecipeGetInstructionAtTime(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  CFDictionaryRef v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSObject *v11;
  void *v12;
  const void **v13;
  void *specific;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  CMTime time;
  const __CFString *v34;
  _QWORD v35[2];

  v35[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    NUAssertLogger_21717();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v12;
      _os_log_error_impl(&dword_1A6382000, v11, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v16)
      {
        v24 = dispatch_get_specific(*v13);
        v25 = (void *)MEMORY[0x1E0CB3978];
        v26 = v24;
        objc_msgSend(v25, "callStackSymbols");
        v13 = (const void **)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "componentsJoinedByString:", CFSTR("\n"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543618;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v24;
        LOWORD(time.flags) = 2114;
        *(_QWORD *)((char *)&time.flags + 2) = v27;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v16)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "componentsJoinedByString:", CFSTR("\n"));
      v13 = (const void **)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v13;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    v21 = _NUAssertFailHandler();
    goto LABEL_20;
  }
  if ((*(_BYTE *)(a2 + 12) & 1) == 0)
  {
    NUAssertLogger_21717();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "CMTIME_IS_VALID(time)");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543362;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v19;
      _os_log_error_impl(&dword_1A6382000, v18, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v13 = (const void **)MEMORY[0x1E0D51D48];
    v20 = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v15 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v15, OS_LOG_TYPE_ERROR);
    if (!v20)
    {
      if (v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "componentsJoinedByString:", CFSTR("\n"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.value) = 138543362;
        *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v23;
        _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

      }
      goto LABEL_22;
    }
LABEL_20:
    if (v21)
    {
      v28 = dispatch_get_specific(*v13);
      v29 = (void *)MEMORY[0x1E0CB3978];
      v30 = v28;
      objc_msgSend(v29, "callStackSymbols");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "componentsJoinedByString:", CFSTR("\n"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.value) = 138543618;
      *(CMTimeValue *)((char *)&time.value + 4) = (CMTimeValue)v28;
      LOWORD(time.flags) = 2114;
      *(_QWORD *)((char *)&time.flags + 2) = v32;
      _os_log_error_impl(&dword_1A6382000, v15, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

    }
LABEL_22:

    _NUAssertFailHandler();
  }
  v4 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("loopRecipe_frameInstructions"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  time = *(CMTime *)a2;
  v34 = CFSTR("loopFrameData_presTime");
  v6 = CMTimeCopyAsDictionary(&time, 0);
  v35[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, &v34, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v7, 0, objc_msgSend(v5, "count"), 1280, &__block_literal_global_21807);
  if (v8 >= objc_msgSend(v5, "count"))
    objc_msgSend(v5, "lastObject");
  else
    objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void PIAutoLoopRecipeGetFrameDuration(void *a1@<X0>, CMTime *a2@<X8>)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFDictionary *v7;
  void *v8;
  const __CFDictionary *v9;
  NSObject *v10;
  void *v11;
  const void **v12;
  void *specific;
  NSObject *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  CMTime v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    NUAssertLogger_21717();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23.value) = 138543362;
      *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v11;
      _os_log_error_impl(&dword_1A6382000, v10, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&v23, 0xCu);

    }
    v12 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v15)
      {
        v18 = dispatch_get_specific(*v12);
        v19 = (void *)MEMORY[0x1E0CB3978];
        v20 = v18;
        objc_msgSend(v19, "callStackSymbols");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "componentsJoinedByString:", CFSTR("\n"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v23.value) = 138543618;
        *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v18;
        LOWORD(v23.flags) = 2114;
        *(_QWORD *)((char *)&v23.flags + 2) = v22;
        _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&v23, 0x16u);

      }
    }
    else if (v15)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "componentsJoinedByString:", CFSTR("\n"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v23.value) = 138543362;
      *(CMTimeValue *)((char *)&v23.value + 4) = (CMTimeValue)v17;
      _os_log_error_impl(&dword_1A6382000, v14, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&v23, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  a2->value = 0;
  *(_QWORD *)&a2->timescale = 0;
  a2->epoch = 0;
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D004B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D004C0]);
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v23, v7);
    *a2 = v23;
  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("loopRecipe_frameInstructions"));
    v7 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    -[__CFDictionary firstObject](v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("loopFrameData_presDur"));
    v9 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CMTimeMakeFromDictionary(&v23, v9);
    *a2 = v23;

  }
}

id PIAutoLoopRecipeGetFlavorParameters(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v8;
  void *v9;
  const void **v10;
  void *specific;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (!v3)
  {
    NUAssertLogger_21717();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_error_impl(&dword_1A6382000, v8, OS_LOG_TYPE_ERROR, "Fail: %{public}@", buf, 0xCu);

    }
    v10 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v13)
      {
        v16 = dispatch_get_specific(*v10);
        v17 = (void *)MEMORY[0x1E0CB3978];
        v18 = v16;
        objc_msgSend(v17, "callStackSymbols");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "componentsJoinedByString:", CFSTR("\n"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v22 = v16;
        v23 = 2114;
        v24 = v20;
        _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", buf, 0x16u);

      }
    }
    else if (v13)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "componentsJoinedByString:", CFSTR("\n"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v22 = v15;
      _os_log_error_impl(&dword_1A6382000, v12, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", buf, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v4 = v3;
  if ((unint64_t)(a2 - 1) > 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectForKeyedSubscript:", **((_QWORD **)&unk_1E5019E50 + a2 - 1));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0D004D8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void PIAutoLoopRecipeGetTimeRangeForFlavor(void *a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  id v5;
  void *v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int32_t v13;
  int v14;
  int v15;
  __int128 v16;
  NSObject *v17;
  void *v18;
  const void **v19;
  void *specific;
  NSObject *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  CMTime duration;
  CMTime start;
  CMTime v32;
  CMTime v33;
  CMTime v34;
  CMTimeRange time;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (!v5)
  {
    NUAssertLogger_21717();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter not satisfying: %s"), "recipe != nil");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v18;
      _os_log_error_impl(&dword_1A6382000, v17, OS_LOG_TYPE_ERROR, "Fail: %{public}@", (uint8_t *)&time, 0xCu);

    }
    v19 = (const void **)MEMORY[0x1E0D51D48];
    specific = dispatch_get_specific((const void *)*MEMORY[0x1E0D51D48]);
    NUAssertLogger_21717();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);
    if (specific)
    {
      if (v22)
      {
        v25 = dispatch_get_specific(*v19);
        v26 = (void *)MEMORY[0x1E0CB3978];
        v27 = v25;
        objc_msgSend(v26, "callStackSymbols");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "componentsJoinedByString:", CFSTR("\n"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(time.start.value) = 138543618;
        *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v25;
        LOWORD(time.start.flags) = 2114;
        *(_QWORD *)((char *)&time.start.flags + 2) = v29;
        _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "job: %{public}@\nTrace:\n%{public}@", (uint8_t *)&time, 0x16u);

      }
    }
    else if (v22)
    {
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "componentsJoinedByString:", CFSTR("\n"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(time.start.value) = 138543362;
      *(CMTimeValue *)((char *)&time.start.value + 4) = (CMTimeValue)v24;
      _os_log_error_impl(&dword_1A6382000, v21, OS_LOG_TYPE_ERROR, "Trace:\n%{public}@", (uint8_t *)&time, 0xCu);

    }
    _NUAssertFailHandler();
  }
  v6 = v5;
  v7 = MEMORY[0x1E0CA2E40];
  v8 = *(_OWORD *)(MEMORY[0x1E0CA2E40] + 16);
  *a3 = *MEMORY[0x1E0CA2E40];
  a3[1] = v8;
  a3[2] = *(_OWORD *)(v7 + 32);
  memset(&v34, 0, sizeof(v34));
  PIAutoLoopRecipeGetFrameDuration(v5, &v34);
  PIAutoLoopRecipeGetFlavorParameters(v6, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D004F0]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D004E8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x1E0D004E0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  memset(&v33, 0, sizeof(v33));
  if (v10)
  {
    v13 = objc_msgSend(v10, "intValue");
    time.start = v34;
    CMTimeMultiply(&v33, &time.start, v13);
  }
  else
  {
    v33 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  }
  v14 = objc_msgSend(v11, "intValue");
  v15 = objc_msgSend(v12, "intValue");
  memset(&v32, 0, sizeof(v32));
  if (v11)
  {
    time.start = v34;
    CMTimeMultiply(&v32, &time.start, v15 + v14);
  }
  else
  {
    v32 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
  }
  if ((v33.flags & 1) != 0 && (v32.flags & 1) != 0)
  {
    start = v33;
    duration = v32;
    CMTimeRangeMake(&time, &start, &duration);
    v16 = *(_OWORD *)&time.start.epoch;
    *a3 = *(_OWORD *)&time.start.value;
    a3[1] = v16;
    a3[2] = *(_OWORD *)&time.duration.timescale;
  }

}

id NUAssertLogger_21877()
{
  if (*MEMORY[0x1E0D52390] != -1)
    dispatch_once(MEMORY[0x1E0D52390], &__block_literal_global_96);
  return (id)*MEMORY[0x1E0D52380];
}

unint64_t CMedian::CxParms::IdealTSize(CMedian::CxParms *this, int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  int v5;

  if (*((_BYTE *)this + 49))
  {
    if (a2 == 16)
    {
      if (*((_DWORD *)this + 6) >= 0xBu)
        goto LABEL_16;
    }
    else if (a2 != 8 || *((_DWORD *)this + 6) >= 0x10u)
    {
LABEL_16:
      v5 = *((_DWORD *)this + 6);
      if ((v5 - 48) > 0x4F)
      {
        if ((v5 - 24) <= 0x67)
        {
          if (*((_BYTE *)this + 48))
            goto LABEL_34;
          if (!*((_BYTE *)this + 46))
          {
LABEL_27:
            v3 = 192;
            v4 = 1024;
            return v3 | (unint64_t)(v4 << 32);
          }
          goto LABEL_25;
        }
      }
      else if (!*((_BYTE *)this + 48) && !*((_BYTE *)this + 46))
      {
        goto LABEL_27;
      }
      if ((v5 - 3) > 0x3C)
        goto LABEL_34;
LABEL_25:
      if (!*((_BYTE *)this + 48) && !*((_BYTE *)this + 46))
        goto LABEL_27;
LABEL_34:
      v3 = 256;
      v4 = 384;
      return v3 | (unint64_t)(v4 << 32);
    }
    v4 = 160;
    v3 = 160;
  }
  else
  {
    if (a2 == 8)
      goto LABEL_16;
    v2 = *((_DWORD *)this + 6);
    if (v2 - 8 > 0x77 || *((_BYTE *)this + 48) || *((_BYTE *)this + 46))
    {
      if ((v2 & 0xFFFFFFFC) != 4 && (v2 - 1 > 6 || !*((_BYTE *)this + 48) && v2 >= 4 && !*((_BYTE *)this + 46)))
      {
        if (v2 - 8 <= 0x77 && (*((_BYTE *)this + 48) || *((_BYTE *)this + 46)))
        {
          v4 = (int)sqrtf((float)*((unsigned int *)this + 8) + 65536.0) - 2 * v2;
          v3 = v4;
          return v3 | (unint64_t)(v4 << 32);
        }
        goto LABEL_34;
      }
      v3 = 93 - 2 * v2 - (93 - 2 * v2) % 9u;
      v4 = 0x2000u / (unsigned __int16)(93 - 2 * v2 - (93 - 2 * v2) % 9u + 2 * v2) - 2 * v2;
    }
    else
    {
      v3 = (2 * v2) & 0x7FFFFFF0;
      if (v3 <= 0x40)
        v3 = 64;
      if (v2 >= 0x40)
        v3 = 128;
      LODWORD(v4) = (*((_DWORD *)this + 7) + 0xFFFF) / (v3 + 2 * v2) - 2 * v2;
      if (v4 >= 4 * v3)
        v4 = 4 * v3;
      else
        v4 = v4;
    }
  }
  return v3 | (unint64_t)(v4 << 32);
}

void CMemBlockT<unsigned char>::~CMemBlockT(CMemBlock *a1)
{
  void *v1;

  CMemBlock::~CMemBlock(a1);
  CBaseRef::operator delete(v1);
}

uint64_t CMemBlock::Valid(CMemBlock *this)
{
  return *((unsigned __int8 *)this + 12);
}

BOOL CMemBlock::Unlocked(CMemBlock *this)
{
  return *((_DWORD *)this + 4) == 0;
}

BOOL CMemBlock::Locked(CMemBlock *this)
{
  return *((_DWORD *)this + 4) != 0;
}

uint64_t CMemBlock::IsZero(CMemBlock *this)
{
  return *((unsigned __int8 *)this + 13);
}

double CMemBlockT<unsigned char>::Description@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  uint64_t v3;
  uint64_t v4;

  result = 0.0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_QWORD *)(a2 + 80) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a2 = off_1E5014838;
  *(_QWORD *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 32) = 1;
  *(_QWORD *)(a2 + 64) = v4;
  *(_QWORD *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 16) = v4;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

uint64_t CMedian::CxParms::CxParms(uint64_t a1, uint64_t a2)
{
  CMemEnv **v4;
  float v5;
  float v6;
  unsigned int v7;
  int v8;
  float v9;
  int v10;
  int v11;
  int v12;
  BOOL v13;
  char v14;
  CMemBlock *v15;
  _BYTE *v16;
  int v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int v24;
  int v25;
  int32x4_t v26;
  uint64_t v27;
  unsigned __int8 *v28;
  float v29;
  float v30;
  int32x4_t v31;
  int64x2_t v32;
  int32x4_t v33;
  float v34;
  int v35;
  int v36;
  uint64_t v37;
  unsigned int v38;
  uint64_t v39;
  uint64x2_t v40;
  int32x4_t v41;
  int8x16_t v42;
  int64x2_t v43;
  int64x2_t v44;
  int32x4_t v45;
  int32x4_t v46;
  int32x4_t v47;
  int32x2_t v48;
  int32x4_t v49;
  int32x2_t v50;
  int v51;
  int v52;
  uint64_t v53;
  int v54;
  BOOL v55;
  int v56;
  int64x2_t v58;

  *(_QWORD *)(a1 + 8) = 0;
  v4 = (CMemEnv **)(a1 + 8);
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)a2;
  v5 = *(float *)(a2 + 8);
  v6 = *(float *)(a2 + 12);
  v7 = (int)v5;
  v8 = ((2 * v7) | 1) * ((2 * v7) | 1);
  *(_DWORD *)(a1 + 24) = (int)v5;
  *(_DWORD *)(a1 + 28) = v8;
  v9 = (float)(v6 * (float)(v8 - 1)) + 0.5;
  v10 = vcvts_n_s32_f32(*(float *)(a2 + 16), 8uLL);
  v11 = v10 & ~(v10 >> 31);
  if (v11 >= 255)
    v11 = 255;
  *(_BYTE *)a1 = 0;
  *(_DWORD *)(a1 + 36) = (int)v9;
  *(_DWORD *)(a1 + 40) = v11;
  *(_WORD *)(a1 + 44) = *(_WORD *)(a2 + 20);
  v12 = *(unsigned __int8 *)(a2 + 22);
  if (*(_BYTE *)(a2 + 23))
    v13 = v12 == 0;
  else
    v13 = 1;
  v14 = !v13;
  *(_BYTE *)(a1 + 47) = v14;
  *(_BYTE *)(a1 + 46) = v12;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 24);
  *(_BYTE *)(a1 + 50) = *(_BYTE *)(a2 + 26);
  *(_BYTE *)(a1 + 52) = *(_BYTE *)(a2 + 27);
  if (v13)
  {
    v15 = 0;
  }
  else
  {
    v15 = (CMemBlock *)CBaseObject::operator new((CBaseObject *)0x40);
    CMemBlock::CMemBlock(v15, *v4, 0x8000, 1, 16);
    *(_QWORD *)v15 = off_1E5014700;
    *(_QWORD *)(a1 + 16) = v15;
    if (!*((_BYTE *)v15 + 12))
    {
      CMemBlock::~CMemBlock(v15);
      v54 = *((_DWORD *)v15 + 2);
      v55 = __OFSUB__(v54, 1);
      v56 = v54 - 1;
      if (v56 < 0 != v55)
      {
        --CMemEnv::excount;
        free(v15);
      }
      else
      {
        *((_DWORD *)v15 + 2) = v56;
      }
      *(_QWORD *)(a1 + 16) = 0;
      return a1;
    }
    v5 = *(float *)(a2 + 8);
    v12 = *(unsigned __int8 *)(a2 + 22);
    v7 = (int)v5;
  }
  v16 = (_BYTE *)(a1 + 1590);
  if (v12)
  {
    if ((int)(float)(v5 * v5) <= 2)
      v17 = 2;
    else
      v17 = (int)(float)(v5 * v5);
    v18 = 0;
    if (v7)
    {
      if (v7 + 1 > 2)
        v19 = v7 + 1;
      else
        v19 = 2;
      v20 = v7 - 1;
      v21 = 1;
      do
      {
        v22 = (int)sqrtf((float)(v17 - v21 * v21));
        v16[v7 + v21] = v7 - v22;
        v16[v20] = v7 - v22;
        v18 += 4 * v22 + 2;
        ++v21;
        --v20;
      }
      while (v19 != v21);
    }
    v16[v7] = 0;
    v23 = v18 + 2 * v7 + 1;
  }
  else
  {
    v24 = (2 * v7) | 1;
    bzero(v16, v24);
    v23 = v24 * v24;
  }
  v25 = ((2 * *(_DWORD *)(a1 + 24)) | 1) * ((2 * *(_DWORD *)(a1 + 24)) | 1) - v23;
  *(_DWORD *)(a1 + 28) = v23;
  *(_DWORD *)(a1 + 32) = v25;
  *(_DWORD *)(a1 + 36) = (int)(float)((float)(*(float *)(a2 + 12) * (float)(v23 - 1)) + 0.5);
  if (*(_BYTE *)(a1 + 47))
  {
    if (v15 && !(*(unsigned int (**)(CMemBlock *))(*(_QWORD *)v15 + 80))(v15))
    {
      v27 = 0;
      v28 = *(unsigned __int8 **)(*(_QWORD *)(a1 + 16) + 32);
      v29 = *(float *)(a2 + 12);
      v30 = *(float *)(a2 + 8) * 0.000015379;
      v31.i64[0] = 0x200000002;
      v31.i64[1] = 0x200000002;
      v32 = vdupq_n_s64(4uLL);
      v33.i64[0] = 0x400000004;
      v33.i64[1] = 0x400000004;
      v58 = v32;
      while (1)
      {
        v34 = (float)((float)(int)v27 * (float)(int)v27) * v30;
        *(_BYTE *)(a1 + v27 + 1334) = 0;
        if (*(_BYTE *)(a2 + 22))
        {
          if (v34 < 1.4142)
          {
            v35 = (int)(float)((float)(v34 * -180.31) + 255.0) & ~((int)(float)((float)(v34 * -180.31) + 255.0) >> 31);
            if (v35 >= 255)
              LOBYTE(v35) = -1;
            v34 = 1.4142;
            goto LABEL_36;
          }
        }
        else if (v34 < 1.0)
        {
          v35 = (int)(float)(255.0 - (float)(v34 * 255.0));
          v34 = 1.0;
LABEL_36:
          *(_BYTE *)(a1 + v27 + 1334) = v35;
        }
        v36 = (int)v34;
        *(_BYTE *)(a1 + v27 + 53) = (int)v34;
        if (*(_BYTE *)(a2 + 22))
        {
          if (v36 < 0)
          {
            v51 = 0;
          }
          else
          {
            v37 = 0;
            v38 = (int)(float)(v34 * v34);
            v39 = (v36 + 1);
            v40 = (uint64x2_t)vdupq_n_s64(v39 - 1);
            v41 = vdupq_n_s32(v38);
            v42 = 0uLL;
            v43 = (int64x2_t)xmmword_1A64DDD90;
            v44 = (int64x2_t)xmmword_1A64DDF60;
            v45 = (int32x4_t)xmmword_1A64DDED0;
            do
            {
              v46 = (int32x4_t)v42;
              v47 = (int32x4_t)vcgeq_u64(v40, (uint64x2_t)v43);
              *(int32x2_t *)v26.i8 = vmovn_s64((int64x2_t)v47);
              v48 = (int32x2_t)vmovn_s32(v26);
              v49 = vcvtq_s32_f32(vsqrtq_f32(vcvtq_f32_s32(vmlsq_s32(v41, v45, v45))));
              if ((v48.i8[0] & 1) != 0)
                v28[v37] = v49.i8[0] + 1;
              if ((vmovn_s32(v26).i8[2] & 1) != 0)
                v28[v37 + 1] = v49.i8[4] + 1;
              v26 = (int32x4_t)vcgeq_u64(v40, (uint64x2_t)v44);
              v50 = (int32x2_t)vmovn_s32(vmovn_hight_s64(v48, (int64x2_t)v26));
              if ((v50.i8[4] & 1) != 0)
                v28[v37 + 2] = v49.i8[8] + 1;
              if ((vmovn_s32(vmovn_hight_s64(v50, *(int64x2_t *)&v26)).i8[6] & 1) != 0)
                v28[v37 + 3] = v49.i8[12] + 1;
              v42 = (int8x16_t)vaddq_s32(vaddq_s32(v46, v31), vshlq_n_s32(v49, 2uLL));
              v37 += 4;
              v44 = vaddq_s64(v44, v32);
              v43 = vaddq_s64(v43, v32);
              v45 = vaddq_s32(v45, v33);
            }
            while (((v39 + 3) & 0x1FFFFFFFCLL) != v37);
            v51 = vaddvq_s32((int32x4_t)vbslq_s8((int8x16_t)vuzp1q_s32(v47, v26), v42, (int8x16_t)v46));
          }
          v52 = v51 - 2 * *v28 + 1;
        }
        else
        {
          v52 = ((2 * v36) | 1) * ((2 * v36) | 1);
          *(_WORD *)(a1 + 2 * v27 + 310) = ((2 * v36) | 1) * ((2 * v36) | 1);
          if ((v36 & 0x80000000) == 0)
          {
            memset(v28, v36 + 1, (v36 + 1));
            v33.i64[0] = 0x400000004;
            v33.i64[1] = 0x400000004;
            v32 = v58;
            v31.i64[0] = 0x200000002;
            v31.i64[1] = 0x200000002;
          }
        }
        v53 = a1 + 2 * v27;
        *(_WORD *)(v53 + 310) = v52;
        *(_WORD *)(v53 + 822) = (int)(float)((float)(v29 * (float)(v52 - 1)) + 0.5);
        v28 += 128;
        if (++v27 == 256)
        {
          (*(void (**)(CMemBlock *))(*(_QWORD *)v15 + 88))(v15);
          goto LABEL_56;
        }
      }
    }
  }
  else
  {
LABEL_56:
    *(_BYTE *)a1 = 1;
  }
  return a1;
}

void sub_1A64BA244(_Unwind_Exception *a1)
{
  void *v1;

  CBaseRef::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t CMedian::CKernel13x9::Process_(CMedian::CKernel13x9 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  char *v8;
  __int128 v9;
  char *v10;
  unsigned __int16 *v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v18[4];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  __int16 v22;
  _QWORD v23[4];
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int16 v27;
  char v28[1344];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = (char *)malloc_type_calloc(0x2CD50uLL, 1uLL, 0x46296C8EuLL);
  v9 = *((_OWORD *)a2 + 3);
  v10 = v8 + 11600;
  v24 = xmmword_1A64DDF00;
  v25 = v9;
  v23[2] = v8 + 150864;
  v23[3] = 2 * v9;
  v26 = 1;
  v27 = 1;
  v23[0] = off_1E50147F8;
  v23[1] = 0;
  v11 = (unsigned __int16 *)(v8 + 167248);
  v12 = *((_OWORD *)a3 + 3);
  v19 = xmmword_1A64DDF00;
  v20 = v12;
  v13 = 2 * v12;
  v18[2] = v8 + 167248;
  v18[3] = 2 * v12;
  v21 = 1;
  v22 = 1;
  v18[0] = off_1E50147F8;
  v18[1] = 0;
  v14 = *((_QWORD *)a2 + 4);
  if (v14 == 4)
  {
    CMedian::OrdinalTransform((uint64_t)a2, v23, v10);
    v16 = *((_QWORD *)this + 1587);
    bzero(v28, 0x540uLL);
    CMedian::Median13x9C_(v16, (uint64_t)v23, (uint64_t)v18, v28);
    CMedian::OrdinalTransform(v11, v13, (uint64_t)a3, (uint64_t)(v8 + 118096));
  }
  else if (v14 == 2)
  {
    CMedian::OrdinalTransform((uint64_t)a2, v23, v10);
    v15 = *((_QWORD *)this + 1587);
    bzero(v28, 0x540uLL);
    CMedian::Median13x9C_(v15, (uint64_t)v23, (uint64_t)v18, v28);
    CMedian::OrdinalTransform((uint64_t)v11, v13, (uint64_t)a3, (uint64_t)(v8 + 101712));
  }
  free(v8);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v18);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v23);
  return 0;
}

void CMedian::CKernel13x9::~CKernel13x9(CMedian::CKernel13x9 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel13x9::IdealTSize(CMedian::CKernel13x9 *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 16);
  else
    return 0x10000000100;
}

uint64_t CMedian::OrdinalTransform(uint64_t result, _QWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  int v12;
  _OWORD *v13;
  int v14;
  uint64_t v15;
  unsigned __int16 *v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int16 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  unsigned int *v26;
  uint64_t v27;
  unsigned int v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _OWORD *v34;
  int v35;

  v3 = a2[6];
  v4 = a2[7];
  a3[30] = 0u;
  a3[31] = 0u;
  a3[28] = 0u;
  a3[29] = 0u;
  a3[26] = 0u;
  a3[27] = 0u;
  a3[24] = 0u;
  a3[25] = 0u;
  a3[22] = 0u;
  a3[23] = 0u;
  a3[20] = 0u;
  a3[21] = 0u;
  a3[18] = 0u;
  a3[19] = 0u;
  a3[16] = 0u;
  a3[17] = 0u;
  a3[14] = 0u;
  a3[15] = 0u;
  a3[12] = 0u;
  a3[13] = 0u;
  a3[10] = 0u;
  a3[11] = 0u;
  a3[8] = 0u;
  a3[9] = 0u;
  a3[6] = 0u;
  a3[7] = 0u;
  a3[4] = 0u;
  a3[5] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  *a3 = 0u;
  a3[1] = 0u;
  a3[287] = 0u;
  a3[286] = 0u;
  a3[285] = 0u;
  a3[284] = 0u;
  a3[283] = 0u;
  a3[282] = 0u;
  a3[281] = 0u;
  a3[280] = 0u;
  a3[279] = 0u;
  a3[278] = 0u;
  a3[277] = 0u;
  a3[276] = 0u;
  a3[275] = 0u;
  a3[274] = 0u;
  a3[273] = 0u;
  a3[272] = 0u;
  a3[271] = 0u;
  a3[270] = 0u;
  a3[269] = 0u;
  a3[268] = 0u;
  a3[267] = 0u;
  a3[266] = 0u;
  a3[265] = 0u;
  a3[264] = 0u;
  a3[263] = 0u;
  a3[262] = 0u;
  a3[261] = 0u;
  a3[260] = 0u;
  a3[259] = 0u;
  a3[258] = 0u;
  a3[257] = 0u;
  a3[256] = 0u;
  if ((_DWORD)v4)
  {
    v5 = 0;
    v6 = *(unsigned __int8 **)(result + 16);
    v7 = *(_QWORD *)(result + 24);
    do
    {
      if ((_DWORD)v3)
      {
        v8 = v6;
        v9 = v3;
        do
        {
          v10 = *v8;
          v8 += 2;
          ++*((_WORD *)a3 + v10);
          --v9;
        }
        while (v9);
      }
      ++v5;
      v6 += v7;
    }
    while (v5 != v4);
  }
  v11 = 0;
  v12 = 0;
  v13 = a3 + 256;
  do
  {
    v14 = *(unsigned __int16 *)((char *)a3 + v11);
    *(_WORD *)((char *)a3 + v11) = v12;
    v12 += v14;
    v11 += 2;
  }
  while (v11 != 512);
  if ((_DWORD)v4)
  {
    v15 = 0;
    v16 = *(unsigned __int16 **)(result + 16);
    v17 = *(_QWORD *)(result + 24);
    do
    {
      if ((_DWORD)v3)
      {
        v18 = 0;
        result = ((_DWORD)v15 << 8);
        v19 = v16;
        do
        {
          v20 = *v19++;
          v21 = *((unsigned __int16 *)a3 + v20);
          *((_WORD *)a3 + v20) = v21 + 1;
          ++*(_WORD *)((char *)v13 + ((v20 >> 7) & 0x1FELL));
          *((_DWORD *)a3 + v21 + 6144) = result | (v20 << 16) | v18++;
        }
        while (v3 != v18);
      }
      ++v15;
      v16 = (unsigned __int16 *)((char *)v16 + v17);
    }
    while (v15 != v4);
  }
  v22 = 0;
  v23 = 0;
  do
  {
    v24 = *(unsigned __int16 *)((char *)v13 + v22);
    *(_WORD *)((char *)v13 + v22) = v23;
    v23 += v24;
    v22 += 2;
  }
  while (v22 != 512);
  v25 = (v4 * v3);
  if ((_DWORD)v25)
  {
    v26 = (unsigned int *)(a3 + 1536);
    v27 = v25;
    do
    {
      v28 = *v26++;
      v29 = ((unint64_t)v28 >> 23) & 0x1FE;
      v30 = *(unsigned __int16 *)((char *)v13 + v29);
      *(_WORD *)((char *)v13 + v29) = v30 + 1;
      *((_DWORD *)a3 + v30 + 14336) = v28;
      --v27;
    }
    while (v27);
    v31 = 0;
    v32 = a2[2];
    v33 = a2[3];
    v34 = a3 + 5632;
    do
    {
      v35 = *((_DWORD *)v34 + v31 - 0x2000);
      *(_WORD *)(2 * v35 + v32 + v33 * BYTE1(v35)) = v31;
      *((_WORD *)v34 + v31++) = HIWORD(v35);
    }
    while (v25 != v31);
  }
  return result;
}

uint64_t CMedian::Median13x9C_(uint64_t result, uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int *v18;
  uint64_t v19;
  unsigned __int16 *v20;
  uint64_t v21;
  unsigned int v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  unsigned __int8 *v37;
  unsigned int v38;
  uint64_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unsigned __int8 v45;
  unint64_t v46;
  unsigned int v47;
  uint64_t v48;
  unsigned int v49;
  int v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  unint64_t v60;
  unsigned __int8 v61;
  int v62;
  unint64_t v63;
  unsigned int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  int v69;
  uint64_t *v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unsigned __int8 v80;
  int v81;
  unint64_t v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int i;
  unsigned __int8 *v92;
  int v93;
  uint64_t v94;
  unsigned int v95;
  uint64_t v96;
  int v97;
  int v98;
  unsigned int v99;
  __int128 v100;
  _OWORD v101[31];
  __int128 v102;
  _BYTE v103[504];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v4 = (2 * *(_DWORD *)(result + 24)) | 1u;
  if (v4 <= 0x3F)
  {
    v6 = a3;
    v8 = 0;
    v9 = 0;
    v10 = *(_DWORD *)(a3 + 48);
    v11 = *(_DWORD *)(a3 + 56);
    v12 = *(_DWORD *)(result + 36);
    v13 = (unsigned __int8 *)(result + 1590);
    v102 = 0u;
    memset(v103, 0, 496);
    v100 = 0u;
    memset(v101, 0, sizeof(v101));
    v14 = *(_QWORD *)(a2 + 24);
    do
    {
      v15 = v13[v9];
      *(_QWORD *)&v103[8 * v9 - 16] = v8 + 2 * v13[v9];
      *((_QWORD *)&v101[-1] + v9++) = v8 + 2 * (v4 - v15);
      v8 += v14;
    }
    while (v4 != v9);
    bzero(a4, 0x540uLL);
    v16 = 0;
    v17 = (unsigned __int8 *)(a4 + 32);
    v18 = (unsigned int *)(a4 + 288);
    do
    {
      v19 = v13[v16];
      v20 = (unsigned __int16 *)(*(_QWORD *)(a2 + 16) + 2 * v19 + *(_QWORD *)(a2 + 24) * v16);
      v21 = (v4 - 2 * v19);
      do
      {
        v22 = *v20++;
        v23 = (unint64_t)v22 >> 5;
        v24 = v18[v23];
        ++v17[v23];
        v18[v23] = (1 << v22) ^ v24;
        --v21;
      }
      while (v21);
      ++v16;
    }
    while (v16 != v4);
    v92 = v13;
    v25 = 0;
    LODWORD(v26) = 0;
    v27 = v10 - 1;
    v98 = v12;
    v99 = 0;
    v28 = v11 - 1;
    v88 = *((_QWORD *)&v102 + 1);
    v89 = v102;
    v97 = 1;
    v29 = v10 - 1;
    v86 = *((_QWORD *)&v100 + 1);
    v87 = v100;
    v90 = v28;
    for (i = v10 - 1; ; v27 = i)
    {
      v95 = v25;
      v96 = 2 * (int)v25;
      v93 = v27 - v25;
      if ((int)v26 <= v28)
        v30 = v28;
      else
        v30 = v26;
      v26 = (int)v26;
      v94 = v30;
      while (1)
      {
        v31 = *(_QWORD *)(v6 + 16);
        v32 = v6;
        v33 = *(_QWORD *)(v6 + 24) * v26;
        v34 = v96 + v31;
        result = Hist13x9CRead_(v17, v18, &v99, &v98);
        *(_WORD *)(v34 + v33) = result;
        if (v95 != v29)
          break;
        if (v26 == v94)
          return result;
        v36 = v98;
        v35 = v99;
        v37 = v92;
        v38 = v95;
        v39 = v4;
        do
        {
          v40 = *v37++;
          v41 = *(_QWORD *)(a2 + 24);
          v42 = *(_QWORD *)(a2 + 16) + 2 * v38;
          v43 = *(unsigned __int16 *)(v41 * (v26 + v40) + v42);
          v44 = *(unsigned __int16 *)(v41 * (v4 + v26 - v40) + v42);
          v45 = v17[v44 >> 5];
          v18[v44 >> 5] ^= 1 << v44;
          v46 = v43 >> 5;
          v47 = v18[v43 >> 5];
          v17[v44 >> 5] = v45 + 1;
          LOBYTE(v42) = v17[v43 >> 5];
          v18[v46] = v47 ^ (1 << v43);
          v36 += ((int)(v44 - v35) >> 31) + ((v43 - v35) >> 31);
          v17[v46] = v42 - 1;
          ++v38;
          --v39;
        }
        while (v39);
        v97 = -v97;
        v98 = v36;
        ++v26;
        v29 = v93;
        v6 = v32;
      }
      v48 = v96 + *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v26;
      if (v97 == 1)
      {
        v50 = v98;
        v49 = v99;
        v51 = (uint64_t *)v103;
        v52 = (uint64_t *)v101;
        v53 = v4;
        v54 = v86;
        v55 = v87;
        v56 = v88;
        v57 = v89;
        v6 = v32;
        do
        {
          v58 = *(unsigned __int16 *)(v57 + v48);
          v59 = *(unsigned __int16 *)(v55 + v48);
          v60 = v59 >> 5;
          v61 = v17[v59 >> 5];
          v62 = v59 - v49;
          v18[v60] = v18[v59 >> 5] ^ (1 << v59);
          v63 = v58 >> 5;
          v64 = v18[v58 >> 5];
          v17[v60] = v61 + 1;
          LOBYTE(v60) = v17[v58 >> 5];
          v50 += (v62 >> 31) + ((v58 - v49) >> 31);
          v18[v63] = v64 ^ (1 << v58);
          v17[v63] = v60 - 1;
          v57 = v56;
          v65 = *v51++;
          v56 = v65;
          v55 = v54;
          v66 = *v52++;
          v54 = v66;
          --v53;
        }
        while (v53);
        v25 = v95 + 1;
        v97 = 1;
        v98 = v50;
      }
      else
      {
        v67 = v48 - 2;
        v69 = v98;
        v68 = v99;
        v70 = (uint64_t *)v103;
        v71 = (uint64_t *)v101;
        v72 = v4;
        v73 = v86;
        v74 = v87;
        v75 = v88;
        v76 = v89;
        v6 = v32;
        do
        {
          v77 = *(unsigned __int16 *)(v76 + v67);
          v78 = *(unsigned __int16 *)(v74 + v67);
          v79 = v77 >> 5;
          v80 = v17[v77 >> 5];
          v81 = v77 - v68;
          v18[v79] = (1 << v77) ^ v18[v77 >> 5];
          v82 = v78 >> 5;
          v83 = v18[v78 >> 5];
          v17[v79] = v80 + 1;
          LOBYTE(v79) = v17[v78 >> 5];
          v69 += (v81 >> 31) + ((v78 - v68) >> 31);
          v18[v82] = v83 ^ (1 << v78);
          v17[v82] = v79 - 1;
          v76 = v75;
          v84 = *v70++;
          v75 = v84;
          v74 = v73;
          v85 = *v71++;
          v73 = v85;
          --v72;
        }
        while (v72);
        v25 = v95 - 1;
        v98 = v69;
      }
      v28 = v90;
    }
  }
  return result;
}

uint64_t CMedian::OrdinalTransform(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int16 *v9;
  _WORD *v10;
  unsigned int v11;
  unsigned int i;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  __int16 v19;
  BOOL v20;
  unsigned int v21;
  unsigned int v22;

  v4 = *(unsigned int *)(a3 + 56);
  if (*(_DWORD *)(a3 + 56))
  {
    v5 = 0;
    v6 = *(_DWORD *)(a3 + 48);
    v7 = *(_QWORD *)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    do
    {
      v9 = (unsigned __int16 *)(result + v5 * a2);
      v10 = (_WORD *)(v7 + v8 * v5);
      if (v6 >= 8)
      {
        for (i = 8; i <= v6; i += 8)
        {
          v13 = *(_WORD *)(a4 + 2 * v9[1]);
          v14 = *(_WORD *)(a4 + 2 * v9[2]);
          v15 = *(_WORD *)(a4 + 2 * v9[3]);
          v16 = *(_WORD *)(a4 + 2 * v9[4]);
          v17 = *(_WORD *)(a4 + 2 * v9[5]);
          v18 = *(_WORD *)(a4 + 2 * v9[6]);
          v19 = *(_WORD *)(a4 + 2 * v9[7]);
          *v10 = *(_WORD *)(a4 + 2 * *v9);
          v10[1] = v13;
          v10[2] = v14;
          v10[3] = v15;
          v10[4] = v16;
          v10[5] = v17;
          v9 += 8;
          v10[6] = v18;
          v10[7] = v19;
          v10 += 8;
        }
        v11 = v6 & 0xFFFFFFF8;
      }
      else
      {
        v11 = 0;
      }
      v20 = v6 >= v11;
      v21 = v6 - v11;
      if (v21 != 0 && v20)
      {
        do
        {
          v22 = *v9++;
          *v10++ = *(_WORD *)(a4 + 2 * v22);
          --v21;
        }
        while (v21);
      }
      ++v5;
    }
    while (v5 != v4);
  }
  return result;
}

float CMedian::OrdinalTransform(uint64_t a1, _QWORD *a2, char *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int *v9;
  uint64_t v10;
  int *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  int v15;
  char *v16;
  int v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  uint64_t v21;
  int *v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  unsigned int v26;
  int v27;
  uint64_t i;
  int v29;
  float result;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  int v38;
  int v39;
  unsigned int *v40;
  uint64_t v41;
  unsigned int v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  float *v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;

  v6 = a2[6];
  v7 = a2[7];
  bzero(a3, 0x2000uLL);
  if ((_DWORD)v7)
  {
    v8 = 0;
    v9 = *(int **)(a1 + 16);
    v10 = *(_QWORD *)(a1 + 24);
    do
    {
      if ((_DWORD)v6)
      {
        v11 = v9;
        v12 = v6;
        do
        {
          v13 = *v11++;
          ++*(_WORD *)&a3[2 * (((unsigned __int16)v13 ^ (unsigned __int16)(v13 >> 31)) & 0x7FF)];
          --v12;
        }
        while (v12);
      }
      ++v8;
      v9 = (int *)((char *)v9 + v10);
    }
    while (v8 != v7);
  }
  v14 = 0;
  v15 = 0;
  v16 = a3 + 4096;
  do
  {
    v17 = *(unsigned __int16 *)&a3[v14];
    *(_WORD *)&a3[v14] = v15;
    v15 += v17;
    v14 += 2;
  }
  while (v14 != 4096);
  if ((_DWORD)v7)
  {
    v18 = 0;
    v19 = *(int **)(a1 + 16);
    v20 = *(_QWORD *)(a1 + 24);
    do
    {
      if ((_DWORD)v6)
      {
        v21 = 0;
        v22 = v19;
        do
        {
          v23 = *v22++;
          v24 = ((v23 >> 31) | 0x80000000) ^ v23;
          v25 = *(unsigned __int16 *)&a3[2 * (v24 & 0x7FF)];
          *(_WORD *)&a3[2 * (v24 & 0x7FF)] = v25 + 1;
          v26 = (v24 >> 11) & 0x7FF;
          ++*(_WORD *)&v16[2 * v26];
          *(_WORD *)&a3[2 * v25 + 0x2000] = v26;
          *(_DWORD *)&a3[4 * v25 + 24576] = ((_DWORD)v18 << 11) | v21++ | v24 & 0xFFC00000;
        }
        while (v6 != v21);
      }
      ++v18;
      v19 = (int *)((char *)v19 + v20);
    }
    while (v18 != v7);
  }
  v27 = 0;
  for (i = 4096; i != 0x2000; i += 2)
  {
    v29 = *(unsigned __int16 *)&a3[i];
    *(_WORD *)&a3[i] = v27;
    v27 += v29;
  }
  bzero(a3, 0x800uLL);
  v31 = (v7 * v6);
  if ((_DWORD)v31)
  {
    v32 = 0;
    v33 = a3 + 24576;
    do
    {
      v34 = *(unsigned __int16 *)&v33[2 * v32 - 0x4000];
      v35 = *(unsigned __int16 *)&v16[2 * v34];
      *(_WORD *)&v16[2 * v34] = v35 + 1;
      v36 = *(unsigned int *)&v33[4 * v32];
      ++*(_WORD *)&a3[(v36 >> 21) & 0x7FE];
      *(_DWORD *)&a3[4 * v35 + 57344] = v36;
      ++v32;
    }
    while (v31 != v32);
  }
  v37 = 0;
  v38 = 0;
  do
  {
    v39 = *(unsigned __int16 *)&a3[v37];
    *(_WORD *)&a3[v37] = v38;
    v38 += v39;
    v37 += 2;
  }
  while (v37 != 4096);
  if ((_DWORD)v31)
  {
    v40 = (unsigned int *)(a3 + 57344);
    v41 = (v7 * v6);
    do
    {
      v42 = *v40++;
      v43 = ((unint64_t)v42 >> 21) & 0x7FE;
      v44 = *(unsigned __int16 *)&a3[v43];
      *(_WORD *)&a3[v43] = v44 + 1;
      *(_DWORD *)&a3[4 * v44 + 24576] = v42;
      --v41;
    }
    while (v41);
    v45 = 0;
    v46 = *(_QWORD *)(a1 + 16);
    v47 = *(_QWORD *)(a1 + 24);
    v48 = a2[2];
    v49 = a2[3];
    do
    {
      v50 = (float *)&a3[4 * v45];
      v51 = *((unsigned int *)v50 + 6144);
      v52 = (v51 >> 11) & 0x7FF;
      v53 = v51 & 0x7FF;
      result = *(float *)(v46 + 4 * v53 + v47 * v52);
      v50[26624] = result;
      *(_WORD *)(v48 + 2 * v53 + v49 * v52) = v45++;
    }
    while (v31 != v45);
  }
  return result;
}

uint64_t Hist13x9CRead_(unsigned __int8 *a1, unsigned int *a2, unsigned int *a3, int *a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unsigned __int8 *v8;
  int v9;
  BOOL v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unsigned __int8 *v19;
  unsigned __int8 *v20;
  int v21;
  int v22;
  unsigned int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;

  v4 = 0;
  if (a1 && a2)
  {
    v5 = *a3;
    v6 = v5 >> 5;
    v7 = -*a4;
    if (*a4 < 0)
    {
      v19 = a1 - 1;
      while (1)
      {
        v20 = &v19[v6];
        v7 -= v19[v6];
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 1;
          goto LABEL_33;
        }
        v7 -= *(v20 - 1);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 2;
          goto LABEL_33;
        }
        v7 -= *(v20 - 2);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 3;
          goto LABEL_33;
        }
        v7 -= *(v20 - 3);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 4;
          goto LABEL_33;
        }
        v7 -= *(v20 - 4);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 5;
          goto LABEL_33;
        }
        v7 -= *(v20 - 5);
        if (v7 < 1)
        {
          LODWORD(v6) = v6 - 6;
          goto LABEL_33;
        }
        v7 -= *(v20 - 6);
        if (v7 < 1)
          break;
        v21 = *(v20 - 7);
        v6 -= 8;
        v10 = __OFSUB__(v7, v21);
        v7 -= v21;
        if ((v7 < 0) ^ v10 | (v7 == 0))
          goto LABEL_33;
      }
      LODWORD(v6) = v6 - 7;
    }
    else
    {
      v8 = &a1[v5 >> 5];
      LODWORD(v6) = v6 - 1;
      while (1)
      {
        v9 = *v8;
        v10 = __OFADD__(v7, v9);
        v11 = v7 + v9;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 1;
          goto LABEL_33;
        }
        v12 = v8[1];
        v10 = __OFADD__(v11, v12);
        v7 = v11 + v12;
        if (!((v7 < 0) ^ v10 | (v7 == 0)))
        {
          LODWORD(v6) = v6 + 2;
          goto LABEL_32;
        }
        v13 = v8[2];
        v10 = __OFADD__(v7, v13);
        v11 = v7 + v13;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 3;
          goto LABEL_33;
        }
        v14 = v8[3];
        v10 = __OFADD__(v11, v14);
        v7 = v11 + v14;
        if (!((v7 < 0) ^ v10 | (v7 == 0)))
        {
          LODWORD(v6) = v6 + 4;
          goto LABEL_32;
        }
        v15 = v8[4];
        v10 = __OFADD__(v7, v15);
        v11 = v7 + v15;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 5;
          goto LABEL_33;
        }
        v16 = v8[5];
        v10 = __OFADD__(v11, v16);
        v7 = v11 + v16;
        if (!((v7 < 0) ^ v10 | (v7 == 0)))
          break;
        v17 = v8[6];
        v10 = __OFADD__(v7, v17);
        v11 = v7 + v17;
        if (!((v11 < 0) ^ v10 | (v11 == 0)))
        {
          LODWORD(v6) = v6 + 7;
          goto LABEL_33;
        }
        v18 = v8[7];
        v8 += 8;
        v7 = v11 + v18;
        LODWORD(v6) = v6 + 8;
        if (v7 >= 1)
          goto LABEL_32;
      }
      LODWORD(v6) = v6 + 6;
LABEL_32:
      v7 = v11;
    }
LABEL_33:
    v22 = 32 * v6;
    *a3 = 32 * v6;
    *a4 = -v7;
    v23 = 1 - v7;
    v24 = a2[v6];
    if (v23 >= 9)
    {
      do
      {
        v25 = (((v24 - 1) & v24) - 1) & (v24 - 1) & v24;
        v26 = (((v25 - 1) & v25) - 1) & (v25 - 1) & v25;
        v27 = (((v26 - 1) & v26) - 1) & (v26 - 1) & v26;
        v24 = (((v27 - 1) & v27) - 1) & (v27 - 1) & v27;
        v23 -= 8;
      }
      while (v23 > 8);
    }
    if (v23 >= 4)
    {
      do
      {
        v28 = (((v24 - 1) & v24) - 1) & (v24 - 1) & v24;
        v24 = (v28 - 1) & v28;
        v23 -= 3;
      }
      while (v23 > 3);
    }
    if (v23 >= 2)
    {
      do
      {
        v24 &= v24 - 1;
        --v23;
      }
      while (v23 > 1);
    }
    return (v22 | 0x1F) - __clz((v24 - 1) ^ v24);
  }
  return v4;
}

void CGrNavigatorT<unsigned short,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  void *v1;

  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

uint64_t CMedian::CKernel13x9C::Process_(CMedian::CKernel13x9C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, int64x2_t *a5)
{
  char *v9;
  char *v10;
  __int128 v11;
  unsigned __int16 *v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  int64x2_t v19;
  int64x2_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  int64x2_t v24;
  int64x2_t v25;
  uint64_t (**v27)();
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int64x2_t v31;
  int64x2_t v32;
  uint64_t v33;
  __int16 v34;
  _QWORD v35[4];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int16 v39;
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int16 v44;

  puts("CKernel13x9C - local allocation");
  v9 = (char *)malloc_type_calloc(0x2A540uLL, 1uLL, 0x58D52512uLL);
  v10 = v9 + 1344;
  v11 = *((_OWORD *)a2 + 3);
  v41 = xmmword_1A64DDF00;
  v42 = v11;
  v40[2] = v9 + 140608;
  v40[3] = 2 * v11;
  v43 = 1;
  v44 = 1;
  v40[0] = off_1E50147F8;
  v40[1] = 0;
  v12 = (unsigned __int16 *)(v9 + 156992);
  v13 = *((_OWORD *)a3 + 3);
  v36 = xmmword_1A64DDF00;
  v37 = v13;
  v14 = 2 * v13;
  v35[2] = v9 + 156992;
  v35[3] = 2 * v13;
  v38 = 1;
  v39 = 1;
  v35[0] = off_1E50147F8;
  v35[1] = 0;
  v15 = *((_QWORD *)a2 + 4);
  if (v15 == 4)
  {
    v21 = *(unsigned __int8 *)(*((_QWORD *)this + 1587) + 47);
    CMedian::OrdinalTransform((uint64_t)a2, v40, v10);
    v22 = *((_QWORD *)this + 1587);
    if (a5 && v21)
    {
      v23 = a5[1].i64[1];
      v25 = a5[2];
      v24 = a5[3];
      v29 = a5[1].i64[0];
      v30 = v23;
      v31 = v25;
      v32 = vshrq_n_s64(vshlq_n_s64(v24, 0x20uLL), 0x20uLL);
      v33 = a5[4].i64[0];
      v34 = 1;
      v27 = off_1E50147D8;
      v28 = 0;
      CMedian::Median13x9Comp_(v22, (uint64_t)v40, (uint64_t)v35, (uint64_t)&v27, v9);
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v27);
    }
    else
    {
      CMedian::Median13x9C_(v22, (uint64_t)v40, (uint64_t)v35, v9);
    }
    CMedian::OrdinalTransform(v12, v14, (uint64_t)a3, (uint64_t)(v9 + 107840));
  }
  else if (v15 == 2)
  {
    v16 = *(unsigned __int8 *)(*((_QWORD *)this + 1587) + 47);
    CMedian::OrdinalTransform((uint64_t)a2, v40, v10);
    v17 = *((_QWORD *)this + 1587);
    if (a5 && v16)
    {
      v18 = a5[1].i64[1];
      v20 = a5[2];
      v19 = a5[3];
      v29 = a5[1].i64[0];
      v30 = v18;
      v31 = v20;
      v32 = vshrq_n_s64(vshlq_n_s64(v19, 0x20uLL), 0x20uLL);
      v33 = a5[4].i64[0];
      v34 = 1;
      v27 = off_1E50147D8;
      v28 = 0;
      CMedian::Median13x9Comp_(v17, (uint64_t)v40, (uint64_t)v35, (uint64_t)&v27, v9);
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v27);
    }
    else
    {
      CMedian::Median13x9C_(v17, (uint64_t)v40, (uint64_t)v35, v9);
    }
    CMedian::OrdinalTransform((uint64_t)v12, v14, (uint64_t)a3, (uint64_t)(v9 + 91456));
  }
  free(v9);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v35);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v40);
  return 0;
}

void CMedian::CKernel13x9C::~CKernel13x9C(CMedian::CKernel13x9C *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel13x9C::IdealTSize(CMedian::CKernel13x9C *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 16);
  else
    return 0x10000000100;
}

uint64_t CMedian::Median13x9Comp_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char *a5)
{
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;
  unsigned __int8 *v16;
  unsigned int *v17;
  int v18;
  uint64_t v19;
  unsigned int v20;
  int v21;
  unsigned __int16 *v22;
  uint64_t v23;
  unsigned int v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v28;
  int v29;
  int v30;
  int v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  uint64_t v35;
  unsigned int v36;
  unsigned int v37;
  uint64_t v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  uint64_t result;
  uint64_t v45;
  int v46;
  unsigned int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  unsigned int v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  unint64_t v58;
  unsigned int v59;
  int v60;
  unsigned int v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  int v65;
  uint64_t v66;
  uint64_t v67;
  unsigned int v68;
  int v69;
  int v70;
  uint64_t v71;
  unsigned __int8 *v72;
  uint64_t v73;
  unsigned int v74;
  int v75;
  uint64_t v76;
  unint64_t v77;
  unint64_t v78;
  unint64_t v79;
  unsigned __int8 v80;
  unint64_t v81;
  unsigned int v82;
  unsigned int v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  unint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  unsigned int v94;
  unsigned int v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  int v101;
  int v102;
  unsigned int v103;
  int v104;
  uint64_t v105;
  unsigned __int16 *v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v109;
  unint64_t v110;
  unsigned int v111;
  BOOL v112;
  unsigned __int16 *v113;
  unsigned int v114;
  unint64_t v115;
  unsigned int v116;
  uint64_t v117;
  unsigned __int16 *v118;
  uint64_t v119;
  uint64_t v120;
  unsigned int v121;
  unint64_t v122;
  unsigned int v123;
  unsigned __int16 *v124;
  unsigned int v125;
  unint64_t v126;
  unsigned int v127;
  uint64_t v128;
  unsigned __int16 *v129;
  uint64_t v130;
  uint64_t v131;
  unsigned int v132;
  unint64_t v133;
  unsigned int v134;
  unsigned __int16 *v135;
  unsigned int v136;
  unint64_t v137;
  unsigned int v138;
  unsigned int v139;
  uint64_t v140;
  int v141;
  int v142;
  unsigned __int16 *v143;
  uint64_t v144;
  uint64_t v145;
  unsigned int v146;
  unint64_t v147;
  unsigned int v148;
  unsigned __int16 *v149;
  unsigned int v150;
  unint64_t v151;
  unsigned int v152;
  int v154;
  unsigned __int8 *v155;
  uint64_t v156;
  unsigned int v157;
  int v158;
  uint64_t v159;
  unint64_t v160;
  unint64_t v161;
  unint64_t v162;
  unsigned __int8 v163;
  unint64_t v164;
  unsigned int v165;
  unsigned int v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  unint64_t v170;
  unint64_t v171;
  unint64_t v172;
  unint64_t v173;
  int v174;
  uint64_t v175;
  unint64_t v176;
  unint64_t v177;
  unint64_t v178;
  unsigned __int8 v179;
  unsigned int v180;
  int v181;
  uint64_t v182;
  unint64_t v183;
  unint64_t v184;
  unint64_t v185;
  unsigned __int8 v186;
  int v187;
  uint64_t v188;
  int v189;
  int v191;
  uint64_t v193;
  int v194;
  uint64_t v195;
  uint64_t v196;
  unsigned int v197;
  int v198;
  int v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  int v204;
  int v205;
  uint64_t v206;
  int v207;
  unsigned int v208;
  unsigned int v209;
  int v210;
  unsigned int v211;

  v197 = *(_DWORD *)(a3 + 48) - 1;
  v7 = **(unsigned __int8 **)(a4 + 16);
  v8 = *(unsigned __int16 *)(a1 + 2 * v7 + 822);
  v9 = v7;
  v10 = *(unsigned __int8 *)(a1 + v7 + 53);
  v11 = *(_QWORD *)(a1 + 16);
  if (v11)
    v12 = *(_QWORD *)(v11 + 32);
  else
    v12 = 0;
  v13 = *(_QWORD *)(a3 + 56);
  v14 = *(_DWORD *)(a1 + 24);
  bzero(a5, 0x540uLL);
  v15 = v14;
  v16 = (unsigned __int8 *)(a5 + 32);
  v17 = (unsigned int *)(a5 + 288);
  v210 = v8;
  v211 = 0;
  v18 = -v10;
  v19 = v9;
  do
  {
    if (v18 >= 0)
      v20 = v18;
    else
      v20 = -v18;
    v21 = *(unsigned __int8 *)(v12 + (v9 << 7) + v20) - 1;
    v22 = (unsigned __int16 *)(*(_QWORD *)(a2 + 16)
                             + *(_QWORD *)(a2 + 24) * (v18 + v14)
                             + 2 * (v14 - v21));
    v23 = (2 * v21) | 1u;
    do
    {
      v24 = *v22++;
      v25 = (unint64_t)v24 >> 5;
      v26 = v17[v25];
      ++v16[v25];
      v17[v25] = (1 << v24) ^ v26;
      --v23;
    }
    while (v23);
  }
  while (v18++ != v10);
  v194 = v8;
  LODWORD(v28) = 0;
  v29 = 0;
  v196 = (int)v13;
  v30 = v14 - 1;
  v31 = v14 + 1;
  v188 = v12 + 1;
  v32 = v197;
  v33 = 1;
  v193 = v12;
  v189 = v14 - 1;
  v191 = v14 + 1;
LABEL_13:
  v34 = v19;
  v35 = v12 + (v19 << 7);
  v28 = (int)v28;
  v36 = v30 + v28;
  v37 = v31 + v28;
  v198 = (2 * v10) | 1;
  v199 = -v10;
  v195 = v19;
  while (1)
  {
    v208 = v36;
    v39 = *(_QWORD *)(a3 + 16);
    v38 = *(_QWORD *)(a3 + 24);
    if (v34)
    {
      v204 = v33;
      v206 = v28;
      v40 = v37;
      v41 = v32;
      v42 = v29;
      v43 = *(_QWORD *)(a3 + 24);
      result = Hist13x9CRead_(v16, v17, &v211, &v210);
      v38 = v43;
      v29 = v42;
      v28 = v206;
      v33 = v204;
      v32 = v41;
      v34 = v195;
      v37 = v40;
    }
    else
    {
      result = *(unsigned __int16 *)(*(_QWORD *)(a2 + 16)
                                   + 2 * (v29 + v15)
                                   + *(_QWORD *)(a2 + 24) * (v15 + v28));
    }
    *(_WORD *)(v38 * v28 + v39 + 2 * v29) = result;
    if (v29 != (_DWORD)v32)
    {
      v60 = v29 - (v33 == -1);
      v61 = v208;
      if (v33 < 1)
      {
        v19 = *(unsigned __int8 *)(*(_QWORD *)(a4 + 16) + v60 + *(_QWORD *)(a4 + 24) * v28);
        v62 = v19;
        v12 = v193;
        v63 = v34;
      }
      else
      {
        v19 = *(unsigned __int8 *)(*(_QWORD *)(a4 + 16) + v60 + 1 + *(_QWORD *)(a4 + 24) * v28);
        v62 = v34;
        v63 = v19;
        v12 = v193;
      }
      v64 = v210 - v194;
      v205 = *(unsigned __int8 *)(a1 + v19 + 53);
      v194 = *(unsigned __int16 *)(a1 + 2 * v19 + 822);
      v65 = v64 + v194;
      if (*(unsigned __int16 *)(a1 + 310 + 2 * v62) != *(unsigned __int16 *)(a1 + 310 + 2 * v63))
      {
        v201 = v19;
        v209 = v32;
        v90 = v12 + (v62 << 7);
        v91 = v12 + (v63 << 7);
        LODWORD(v92) = *(unsigned __int8 *)(a1 + 53 + v62);
        v207 = v28;
        v93 = v15 + v28;
        v94 = v211;
        if (*(unsigned __int8 *)(a1 + 53 + v63) <= v92)
          v92 = v92;
        else
          v92 = *(unsigned __int8 *)(a1 + 53 + v63);
        while (1)
        {
          v95 = *(unsigned __int8 *)(v90 + v92);
          v96 = *(unsigned __int8 *)(v91 + v92);
          v97 = *(_QWORD *)(a2 + 24);
          v98 = 2 * (v60 + v15) + *(_QWORD *)(a2 + 16);
          v99 = v98 + v97 * (v93 - v92);
          v100 = v98 + v97 * (v93 + v92);
          if (*(_BYTE *)(v90 + v92))
          {
            v101 = 1 - v95;
            if (*(_BYTE *)(v91 + v92))
            {
              v102 = 2 - v96;
              if (v101 != 2 - (_DWORD)v96)
              {
                if (v101 >= v102)
                  v103 = 2 - v96;
                else
                  v103 = 1 - v95;
                if (v101 > v102)
                  v102 = 1 - v95;
                if (v101 <= 2 - (int)v96)
                  v104 = -v33;
                else
                  v104 = v33;
                if (v102 != v103)
                {
                  v105 = (int)v103;
                  v106 = (unsigned __int16 *)(v99 + 2 * (int)v103);
                  v107 = -(uint64_t)(v102 - v105);
                  v108 = v107;
                  do
                  {
                    v109 = *v106++;
                    v110 = (unint64_t)v109 >> 5;
                    v111 = v17[v110];
                    v16[v110] += v104;
                    v65 -= v104 & ((int)(v109 - v94) >> 31);
                    v17[v110] = (1 << v109) ^ v111;
                    v112 = __CFADD__(v108++, 1);
                  }
                  while (!v112);
                  if (v92 < 1)
                  {
                    v12 = v193;
                  }
                  else
                  {
                    v113 = (unsigned __int16 *)(v100 + 2 * v105);
                    v12 = v193;
                    do
                    {
                      v114 = *v113++;
                      v115 = (unint64_t)v114 >> 5;
                      v116 = v17[v115];
                      v16[v115] += v104;
                      v65 -= v104 & ((int)(v114 - v94) >> 31);
                      v17[v115] = (1 << v114) ^ v116;
                      v112 = __CFADD__(v107++, 1);
                    }
                    while (!v112);
                  }
                }
              }
              v139 = v96 + 1;
              if ((_DWORD)v96 + 1 != v95)
              {
                v140 = v139 >= v95 ? v95 : v139;
                v141 = v139 <= v95 ? v95 : v139;
                v142 = v139 >= v95 ? v33 : -v33;
                if (v141 != (_DWORD)v140)
                {
                  v143 = (unsigned __int16 *)(v99 + 2 * v140);
                  v144 = (v141 - v140);
                  v145 = v144;
                  do
                  {
                    v146 = *v143++;
                    v147 = (unint64_t)v146 >> 5;
                    v148 = v17[v147];
                    v16[v147] += v142;
                    v65 -= v142 & ((int)(v146 - v94) >> 31);
                    v17[v147] = (1 << v146) ^ v148;
                    --v145;
                  }
                  while (v145);
                  if (v92 < 1)
                    goto LABEL_88;
                  v149 = (unsigned __int16 *)(v100 + 2 * v140);
                  do
                  {
                    v150 = *v149++;
                    v151 = (unint64_t)v150 >> 5;
                    v152 = v17[v151];
                    v16[v151] += v142;
                    v65 -= v142 & ((int)(v150 - v94) >> 31);
                    v17[v151] = (1 << v150) ^ v152;
                    --v144;
                  }
                  while (v144);
                }
              }
            }
            else
            {
              v128 = v101;
              v129 = (unsigned __int16 *)(v99 + 2 * v101);
              v130 = 2 * v95 - 1;
              v131 = v130;
              do
              {
                v132 = *v129++;
                v133 = (unint64_t)v132 >> 5;
                v134 = v17[v133];
                v16[v133] -= v33;
                v65 += v33 & ((int)(v132 - v94) >> 31);
                v17[v133] = (1 << v132) ^ v134;
                --v131;
              }
              while (v131);
              if (v92 < 1)
                goto LABEL_88;
              v135 = (unsigned __int16 *)(v100 + 2 * v128);
              do
              {
                v136 = *v135++;
                v137 = (unint64_t)v136 >> 5;
                v138 = v17[v137];
                v16[v137] -= v33;
                v65 += v33 & ((int)(v136 - v94) >> 31);
                v17[v137] = (1 << v136) ^ v138;
                --v130;
              }
              while (v130);
            }
          }
          else
          {
            v117 = 2 - v96;
            v118 = (unsigned __int16 *)(v99 + 2 * (2 - v96));
            v119 = (2 * v96 - 1);
            v120 = v119;
            do
            {
              v121 = *v118++;
              v122 = (unint64_t)v121 >> 5;
              v123 = v17[v122];
              v16[v122] += v33;
              v65 -= v33 & ((int)(v121 - v94) >> 31);
              v17[v122] = (1 << v121) ^ v123;
              --v120;
            }
            while (v120);
            if (v92 < 1)
            {
LABEL_88:
              v210 = v65;
              v30 = v189;
              v32 = v209;
              v10 = v205;
              LODWORD(v28) = v207;
              v19 = v201;
              goto LABEL_97;
            }
            v124 = (unsigned __int16 *)(v100 + 2 * v117);
            do
            {
              v125 = *v124++;
              v126 = (unint64_t)v125 >> 5;
              v127 = v17[v126];
              v16[v126] += v33;
              v65 -= v33 & ((int)(v125 - v94) >> 31);
              v17[v126] = (1 << v125) ^ v127;
              --v119;
            }
            while (v119);
          }
          if (v92-- <= 0)
            goto LABEL_88;
        }
      }
      v66 = v32;
      v67 = v19 << 7;
      v68 = v211;
      v69 = v60 + v15;
      v70 = v60 + v15 + 1;
      v71 = (v15 + v28);
      if (v33 == 1)
      {
        v10 = *(unsigned __int8 *)(a1 + v19 + 53);
        if (*(_BYTE *)(a1 + v19 + 53))
        {
          v200 = v19;
          v72 = (unsigned __int8 *)(v188 + v67);
          v73 = *(unsigned __int8 *)(a1 + v19 + 53);
          v74 = v37;
          do
          {
            v75 = *v72++;
            v76 = *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v74;
            v77 = *(unsigned __int16 *)(v76 + 2 * (v69 + v75));
            v78 = v77 >> 5;
            v79 = *(unsigned __int16 *)(v76 + 2 * (v70 - v75));
            v80 = v16[v77 >> 5];
            v17[v78] = (1 << v77) ^ v17[v77 >> 5];
            v81 = v79 >> 5;
            v82 = v17[v79 >> 5];
            v16[v78] = v80 + 1;
            v16[v81] = v16[v79 >> 5] - 1;
            v83 = v65 + ((int)(v77 - v68) >> 31) + ((v79 - v68) >> 31);
            v84 = *(_QWORD *)(a2 + 16);
            v85 = *(_QWORD *)(a2 + 24);
            v17[v81] = v82 ^ (1 << v79);
            v86 = v84 + v85 * v61;
            v87 = *(unsigned __int16 *)(v86 + 2 * (v69 + v75));
            v88 = v87 >> 5;
            v89 = *(unsigned __int16 *)(v86 + 2 * (v70 - v75));
            LOBYTE(v84) = v16[v87 >> 5];
            v17[v88] = (1 << v87) ^ v17[v87 >> 5];
            LODWORD(v81) = v17[v89 >> 5];
            v16[v88] = v84 + 1;
            LOBYTE(v88) = v16[v89 >> 5];
            v65 = v83 + ((int)(v87 - v68) >> 31) + ((v89 - v68) >> 31);
            v17[v89 >> 5] = v81 ^ (1 << v89);
            v16[v89 >> 5] = v88 - 1;
            --v61;
            ++v74;
            --v73;
          }
          while (v73);
          v68 = v211;
          v30 = v189;
          v32 = v66;
          v19 = v200;
        }
        else
        {
          v30 = v189;
        }
        v174 = *(unsigned __int8 *)(v12 + v67);
        v175 = *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v71;
        v176 = *(unsigned __int16 *)(v175 + 2 * (v70 - v174));
        v177 = *(unsigned __int16 *)(v175 + 2 * (v69 + v174));
        v178 = v177 >> 5;
        v179 = v16[v177 >> 5];
        v17[v178] = (1 << v177) ^ v17[v177 >> 5];
        v180 = v17[v176 >> 5];
        v16[v178] = v179 + 1;
        LOBYTE(v178) = v16[v176 >> 5];
        v210 = v65 + ((int)(v177 - v68) >> 31) + ((v176 - v68) >> 31);
        v17[v176 >> 5] = v180 ^ (1 << v176);
        v16[v176 >> 5] = v178 - 1;
      }
      else
      {
        v10 = *(unsigned __int8 *)(a1 + v19 + 53);
        if (*(_BYTE *)(a1 + v19 + 53))
        {
          v202 = v19;
          v154 = v28;
          v155 = (unsigned __int8 *)(v188 + v67);
          v156 = *(unsigned __int8 *)(a1 + v19 + 53);
          v157 = v37;
          do
          {
            v158 = *v155++;
            v159 = *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v157;
            v160 = *(unsigned __int16 *)(v159 + 2 * (v70 - v158));
            v161 = v160 >> 5;
            v162 = *(unsigned __int16 *)(v159 + 2 * (v69 + v158));
            v163 = v16[v160 >> 5];
            v17[v161] = v17[v160 >> 5] ^ (1 << v160);
            v164 = v162 >> 5;
            v165 = v17[v162 >> 5];
            v16[v161] = v163 + 1;
            v16[v164] = v16[v162 >> 5] - 1;
            v166 = v65 + ((int)(v160 - v68) >> 31) + ((v162 - v68) >> 31);
            v167 = *(_QWORD *)(a2 + 16);
            v168 = *(_QWORD *)(a2 + 24);
            v17[v164] = v165 ^ (1 << v162);
            v169 = v167 + v168 * v61;
            v170 = *(unsigned __int16 *)(v169 + 2 * (v70 - v158));
            v171 = v170 >> 5;
            v172 = *(unsigned __int16 *)(v169 + 2 * (v69 + v158));
            LOBYTE(v167) = v16[v170 >> 5];
            v17[v171] = (1 << v170) ^ v17[v170 >> 5];
            v173 = v172 >> 5;
            LODWORD(v164) = v17[v172 >> 5];
            v16[v171] = v167 + 1;
            LOBYTE(v171) = v16[v172 >> 5];
            v65 = v166 + ((int)(v170 - v68) >> 31) + ((v172 - v68) >> 31);
            v17[v173] = v164 ^ (1 << v172);
            v16[v173] = v171 - 1;
            --v61;
            ++v157;
            --v156;
          }
          while (v156);
          v68 = v211;
          v30 = v189;
          v32 = v66;
          LODWORD(v28) = v154;
          v19 = v202;
        }
        else
        {
          v30 = v189;
        }
        v181 = *(unsigned __int8 *)(v12 + v67);
        v182 = *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v71;
        v183 = *(unsigned __int16 *)(v182 + 2 * (v70 - v181));
        v184 = *(unsigned __int16 *)(v182 + 2 * (v69 + v181));
        v185 = v183 >> 5;
        v186 = v16[v183 >> 5];
        v187 = v183 - v68;
        v17[v183 >> 5] ^= 1 << v183;
        LODWORD(v183) = v17[v184 >> 5];
        v16[v185] = v186 + 1;
        LOBYTE(v185) = v16[v184 >> 5];
        v210 = v65 + (v187 >> 31) + ((v184 - v68) >> 31);
        v17[v184 >> 5] = v183 ^ (1 << v184);
        v16[v184 >> 5] = v185 - 1;
      }
LABEL_97:
      if (v33 == 1)
        v29 = v60 + 1;
      else
        v29 = v60;
      v31 = v191;
      goto LABEL_13;
    }
    v45 = v28 + 1;
    if (v28 + 1 >= v196)
      return result;
    v46 = v210;
    v47 = v211;
    v48 = v15 + v28;
    v49 = v15 + v28 + 1;
    v50 = v198;
    v51 = v199;
    do
    {
      if (v51 >= 0)
        v52 = v51;
      else
        v52 = -v51;
      v53 = *(unsigned __int8 *)(v35 + v52);
      v54 = *(_QWORD *)(a2 + 24);
      v55 = *(_QWORD *)(a2 + 16) + 2 * (v15 + v32 + v51);
      v56 = *(unsigned __int16 *)(v54 * (v49 - v53) + v55);
      v57 = *(unsigned __int16 *)(v54 * (v48 + v53) + v55);
      LOBYTE(v54) = v16[v57 >> 5];
      v17[v57 >> 5] ^= 1 << v57;
      v58 = v56 >> 5;
      v59 = v17[v56 >> 5];
      v16[v57 >> 5] = v54 + 1;
      LOBYTE(v55) = v16[v56 >> 5];
      v17[v58] = v59 ^ (1 << v56);
      v46 += ((int)(v57 - v47) >> 31) + ((v56 - v47) >> 31);
      v16[v58] = v55 - 1;
      ++v51;
      --v50;
    }
    while (v50);
    v210 = v46;
    v33 = -v33;
    v29 = v32;
    v32 = v197 - v32;
    v36 = v208 + 1;
    ++v37;
    v28 = v45;
  }
}

CMedian::CKernel13x9 *CMedian::CKernel13x9::CKernel13x9(CMedian::CKernel13x9 *this, const CMedian::CxParms *a2)
{
  uint64_t v4;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = &off_1E5014928;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 1587) = a2;
  *(_QWORD *)this = &off_1E5014A60;
  *((_DWORD *)this + 6) = 9;
  return this;
}

CMedian::CKernel13x9C *CMedian::CKernel13x9C::CKernel13x9C(CMedian::CKernel13x9C *this, const CMedian::CxParms *a2)
{
  uint64_t v4;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = &off_1E5014928;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 1587) = a2;
  *(_QWORD *)this = &off_1E5014AD0;
  *((_DWORD *)this + 6) = 9;
  return this;
}

void CBaseRef::operator delete(void *a1)
{
  int v1;
  BOOL v2;
  int v3;

  if (a1)
  {
    v1 = *((_DWORD *)a1 + 2);
    v2 = __OFSUB__(v1, 1);
    v3 = v1 - 1;
    if (v3 < 0 != v2)
    {
      --CMemEnv::excount;
      free(a1);
    }
    else
    {
      *((_DWORD *)a1 + 2) = v3;
    }
  }
}

void *CBaseObject::operator new(CBaseObject *this)
{
  void *result;

  result = malloc_type_calloc(this, 1uLL, 0xE48945EEuLL);
  if (result)
  {
    ++CMemEnv::excount;
    if ((unint64_t)result < CBaseObject::minaddr)
      CBaseObject::minaddr = (uint64_t)result;
    if ((unint64_t)result > CBaseObject::maxaddr)
      CBaseObject::maxaddr = (uint64_t)result;
  }
  return result;
}

uint64_t bensort_(uint64_t result, int a2, int a3)
{
  unsigned int *v4;
  int v5;
  signed int v6;
  int v7;
  signed int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  signed int v16;
  int v17;
  int v18;
  int v19;
  BOOL v20;
  unsigned int v21;
  int v22;
  int v23;
  unsigned int *v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int *v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  unsigned int v32;

  if (!result)
    return result;
  v4 = (unsigned int *)result;
  while (1)
  {
    v5 = a3 - a2;
    if (a3 - a2 <= 2)
      break;
    v6 = v4[(a2 + a3) >> 1];
    v7 = a2 + 1;
    v8 = v4[a2];
    v9 = -2;
    v10 = 2;
    v11 = a2;
    v12 = a3;
    do
    {
      v13 = v10;
      if (v8 >= v6)
        v14 = v11;
      else
        v14 = v11 + 1;
      if (v6 >= v8)
        v15 = 0;
      else
        v15 = -1;
      v16 = v4[((v12 - v7) & v15) + v7];
      v4[((v12 - v11) & v15) + v11] = v8;
      if (v6 >= v8)
        ++v7;
      v17 = v12 - (v6 < v8);
      if (v16 >= v6)
        v11 = v14;
      else
        v11 = v14 + 1;
      if (v6 >= v16)
        v18 = 0;
      else
        v18 = -1;
      result = ((v17 - v14) & v18) + v14;
      v8 = v4[((v17 - v7) & v18) + v7];
      v4[(int)result] = v16;
      if (v6 >= v16)
        ++v7;
      v12 = v17 - (v6 < v16);
      v19 = v9 + 4;
      v9 += 2;
      v10 = v13 + 2;
      v20 = v19 <= v5;
    }
    while (v19 < v5);
    while (v20)
    {
      if (v8 >= v6)
      {
        if (v8 > v6)
        {
          v21 = v4[v12];
          v4[v12--] = v8;
          v8 = v21;
          goto LABEL_28;
        }
      }
      else
      {
        v4[v11++] = v8;
      }
      v8 = v4[v7++];
LABEL_28:
      v20 = ++v13 <= v5;
    }
    v22 = v12 + 1;
    if (v11 <= v12)
    {
      v23 = v22 - v11;
      v24 = &v4[v11];
      do
      {
        *v24++ = v6;
        --v23;
      }
      while (v23);
    }
    if (v11 - 1 > a2)
      result = bensort_(v4, a2, v11 - 1);
    a2 = v22;
    if (v22 >= a3)
      return result;
  }
  v25 = v4[a2];
  if (v5 == 1)
  {
    v26 = v4[a3];
    if (v25 > v26)
    {
      v4[a2] = v26;
      v4[a3] = v25;
    }
  }
  else
  {
    v27 = &v4[a2];
    v28 = v27[1];
    v29 = v27[2];
    if (v25 <= v28)
      v30 = v27[1];
    else
      v30 = v4[a2];
    if (v25 >= v28)
      v25 = v27[1];
    if (v25 <= v29)
      v31 = v27[2];
    else
      v31 = v25;
    if (v25 >= v29)
      v25 = v27[2];
    if (v30 <= v31)
      v32 = v31;
    else
      v32 = v30;
    if (v30 < v31)
      v31 = v30;
    *v27 = v25;
    v27[1] = v31;
    v27[2] = v32;
  }
  return result;
}

uint64_t CMedian::Median(uint64_t a1)
{
  uint64_t v1;
  int64x2_t *v2;
  int64x2_t *v3;
  int64x2_t *v4;
  int64x2_t *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t i;
  __int16 *v13;
  char *v14;
  uint64_t v15;
  int v16;
  unsigned int v17;
  char v18;
  uint64_t v21;
  int64x2_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  uint64_t (**v26)(CMedian::CKernel16C *__hidden, const CGrNavigator *, const CGrNavigator *, unsigned int, const CGrNavigator *);
  char v27;
  CMemEnv *v28;
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int128 v32;
  int v33;
  _BYTE v34[12544];
  __int128 v35;
  pthread_mutex_t v36;
  _BYTE *v37;
  uint64_t v38;
  _BYTE v39[8];
  CMemEnv *v40;
  uint64_t v41;
  unsigned int v42;
  unsigned __int8 v43;
  unsigned __int8 v44;
  uint64_t v45;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v45 = *MEMORY[0x1E0C80C00];
  if (*(float *)(v1 + 8) == 0.0)
  {
    v6 = v2[3].u32[2];
    if (v2[3].i32[2])
    {
      v7 = 0;
      v8 = 2 * v2[3].i64[0];
      do
      {
        memcpy((void *)(v3[1].i64[0] + v3[1].i64[1] * v7), (const void *)(v5[1].i64[0] + v5[1].i64[1] * v7), v8);
        ++v7;
      }
      while (v6 != v7);
    }
    return 0;
  }
  if (!*(_BYTE *)(v1 + 25))
  {
    CMedian::CxParms::CxParms((uint64_t)v39, v1);
    if (!v39[0])
    {
      v9 = 7;
      goto LABEL_43;
    }
    if (v42 - 8 <= 0x77 && v44 == 0 && v43 == 0)
    {
      v28 = v40;
      v30 = 0;
      v31 = 0;
      v32 = 0u;
      v33 = 0;
      bzero(v34, 0x3000uLL);
      v35 = 0u;
      pthread_mutex_init(&v36, 0);
      v27 = 1;
      v37 = v39;
      v26 = &off_1E5014B08;
      v29 = 0x1000000010;
      v21 = CKernel::Process((CKernel *)&v26, v5, v3, 0);
      goto LABEL_38;
    }
    if ((v42 & 0xFFFFFFFC) == 4)
    {
      if (!(v44 | v43))
      {
        CMedian::CKernel13x9::CKernel13x9((CMedian::CKernel13x9 *)&v26, (const CMedian::CxParms *)v39);
        v21 = CKernel::Process((CKernel *)&v26, v5, v3, 0);
LABEL_38:
        v9 = v21;
        goto LABEL_39;
      }
    }
    else if (v42 - 1 > 6)
    {
      goto LABEL_46;
    }
    if (v44 || v42 < 4 || v43)
    {
      CMedian::CKernel13x9C::CKernel13x9C((CMedian::CKernel13x9C *)&v26, (const CMedian::CxParms *)v39);
      v21 = CKernel::Process((CKernel *)&v26, v5, v3, 0);
      goto LABEL_38;
    }
LABEL_46:
    if (v42 - 8 > 0x77 || !(v44 | v43))
    {
      v9 = 0;
LABEL_40:
      if (v39[0])
      {
        if (!v41)
          return v9;
        (*(void (**)(uint64_t))(*(_QWORD *)v41 + 8))(v41);
      }
LABEL_43:
      v41 = 0;
      return v9;
    }
    CMedian::CKernel16C::CKernel16C((CMedian::CKernel16C *)&v26, (const CMedian::CxParms *)v39);
    v9 = CKernel::Process((CKernel *)&v26, v5, v3, 0);
    v26 = &off_1E5014A28;
    CLock::~CLock((CLock *)&v38);
LABEL_39:
    CKernel::~CKernel((CKernel *)&v26);
    goto LABEL_40;
  }
  CMedian::CxParms::CxParms((uint64_t)v39, v1);
  v11 = v5[3].u32[2];
  CGrNavigator::CGrNavigator((CGrNavigator *)&v22, v40, v5[3].u32[0], v11, 1);
  v22.i64[0] = (uint64_t)off_1E50147D8;
  if (v25)
  {
    if (v11)
    {
      for (i = 0; i != v11; ++i)
      {
        v13 = (__int16 *)(v5[1].i64[0] + v5[1].i64[1] * i);
        v14 = (char *)(v23 + v24 * i);
        v15 = v11;
        do
        {
          v16 = *v13++;
          v17 = v16 >> 7;
          if (v16 < 0)
            v18 = -1;
          else
            v18 = v17;
          *v14++ = v18;
          --v15;
        }
        while (v15);
      }
    }
    v26 = &off_1E5014928;
    v27 = 0;
    v28 = v40;
    v29 = 0x100000001;
    v30 = 0;
    v31 = 0;
    v32 = 0u;
    v33 = 0;
    bzero(v34, 0x3000uLL);
    v35 = 0u;
    pthread_mutex_init(&v36, 0);
    v27 = 1;
    v37 = v39;
    v26 = &off_1E5014A98;
    LODWORD(v29) = 16;
    v9 = CKernel::Process((CKernel *)&v26, &v22, v3, 0);
    CKernel::~CKernel((CKernel *)&v26);
  }
  else
  {
    v9 = 7;
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)&v22);
  if (v39[0] && v41)
    (*(void (**)(uint64_t))(*(_QWORD *)v41 + 8))(v41);
  return v9;
}

{
  uint64_t v1;
  int64x2_t *v2;
  int64x2_t *v3;
  int64x2_t *v4;
  int64x2_t *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  float *v19;
  uint64_t v20;
  _WORD *v21;
  uint64_t v22;
  unsigned int v23;
  float *v24;
  _WORD *v25;
  float v26;
  int v27;
  int v28;
  BOOL v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned __int16 *v33;
  uint64_t v34;
  float *v35;
  uint64_t v36;
  unsigned int v37;
  unsigned __int16 *v38;
  float *v39;
  unsigned int v40;
  _QWORD v41[9];
  char v42;
  __int128 v43;
  __int128 v44;
  __int16 v45;
  uint64_t v46;
  __int128 v47;
  int v48;
  _BYTE v49[12544];
  __int128 v50;
  pthread_mutex_t v51;
  char *v52;
  char v53[8];
  uint64_t v54;
  uint64_t v55;
  unsigned int v56;
  char v57;
  char v58;
  char v59;
  uint64_t v60;

  v1 = MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v60 = *MEMORY[0x1E0C80C00];
  if (*(float *)(v1 + 8) != 0.0)
  {
    v10 = v1;
    CMedian::CxParms::CxParms((uint64_t)v53, v1);
    if (!v53[0])
    {
      v9 = 7;
      goto LABEL_29;
    }
    if (v59)
    {
      *(_QWORD *)&v44 = v54;
      *((_QWORD *)&v44 + 1) = 0x100000001;
      v45 = 256;
      v46 = 0;
      v47 = 0u;
      v48 = 0;
      bzero(v49, 0x3000uLL);
      v50 = 0u;
      pthread_mutex_init(&v51, 0);
      BYTE8(v43) = 1;
      v52 = v53;
      *(_QWORD *)&v43 = &off_1E5014B78;
      v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
LABEL_25:
      v9 = v11;
      CKernel::~CKernel((CKernel *)&v43);
      goto LABEL_26;
    }
    if (v56 - 8 <= 0x77 && v58 == 0 && v57 == 0)
    {
      *(_QWORD *)&v44 = v54;
      v45 = 0;
      v46 = 0;
      v47 = 0u;
      v48 = 0;
      bzero(v49, 0x3000uLL);
      v50 = 0u;
      pthread_mutex_init(&v51, 0);
      BYTE8(v43) = 1;
      v52 = v53;
      *(_QWORD *)&v43 = &off_1E5014B40;
      *((_QWORD *)&v44 + 1) = 0x800000010;
      v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
      goto LABEL_25;
    }
    if ((v56 & 0xFFFFFFFC) == 4)
    {
      if (!v58 && !v57)
      {
        CMedian::CKernel13x9::CKernel13x9((CMedian::CKernel13x9 *)&v43, (const CMedian::CxParms *)v53);
        v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
        goto LABEL_25;
      }
    }
    else if (v56 - 1 > 6)
    {
      goto LABEL_33;
    }
    if (v58 || v56 < 4 || v57)
    {
      CMedian::CKernel13x9C::CKernel13x9C((CMedian::CKernel13x9C *)&v43, (const CMedian::CxParms *)v53);
      v11 = CKernel::Process((CKernel *)&v43, v5, v3, 0);
      goto LABEL_25;
    }
LABEL_33:
    if (*(__int16 *)(v10 + 20) == -1)
    {
      CGrNavigator::CGrNavigator((CGrNavigator *)&v43, *(CMemEnv **)v10, v5[3].i64[0], v5[3].i64[1], 2);
      *(_QWORD *)&v43 = off_1E50147F8;
      if (v49[0])
      {
        CGrNavigator::CGrNavigator((CGrNavigator *)v41, *(CMemEnv **)v10, v3[3].i64[0], v3[3].i64[1], 2);
        v41[0] = off_1E50147F8;
        if (v42)
        {
          v16 = v5[3].u64[1];
          if (v16)
          {
            LODWORD(v17) = 0;
            v18 = v5[3].u64[0];
            v19 = (float *)v5[1].i64[0];
            v20 = v5[1].i64[1];
            v22 = *((_QWORD *)&v44 + 1);
            v21 = (_WORD *)v44;
            do
            {
              if (v18)
              {
                v23 = 1;
                v24 = v19;
                v25 = v21;
                do
                {
                  v26 = *v24++;
                  v27 = vcvts_n_s32_f32(v26, 0x10uLL);
                  v28 = v27 & ~(v27 >> 31);
                  if (v28 >= 0xFFFF)
                    LOWORD(v28) = -1;
                  *v25++ = v28;
                  v29 = v18 > v23++;
                }
                while (v29);
              }
              v17 = (v17 + 1);
              v21 = (_WORD *)((char *)v21 + v22);
              v19 = (float *)((char *)v19 + v20);
            }
            while (v16 > v17);
          }
          v9 = CMedian::Median(v10);
          if (!(_DWORD)v9)
          {
            v30 = v3[3].u64[1];
            if (v30)
            {
              LODWORD(v31) = 0;
              v32 = v3[3].u64[0];
              v33 = (unsigned __int16 *)v41[2];
              v34 = v41[3];
              v35 = (float *)v3[1].i64[0];
              v36 = v3[1].i64[1];
              do
              {
                if (v32)
                {
                  v37 = 1;
                  v38 = v33;
                  v39 = v35;
                  do
                  {
                    v40 = *v38++;
                    *v39++ = (float)v40 * 0.000015259;
                    v29 = v32 > v37++;
                  }
                  while (v29);
                }
                v31 = (v31 + 1);
                v35 = (float *)((char *)v35 + v36);
                v33 = (unsigned __int16 *)((char *)v33 + v34);
              }
              while (v30 > v31);
            }
            v9 = 0;
          }
        }
        else
        {
          v9 = 7;
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v41);
      }
      else
      {
        v9 = 7;
      }
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v43);
    }
    else
    {
      v15 = *(_OWORD *)(v10 + 16);
      v43 = *(_OWORD *)v10;
      v44 = v15;
      WORD2(v44) = -1;
      v9 = CMedian::Median(&v43, v5, v3);
    }
LABEL_26:
    if (v53[0])
    {
      if (!v55)
        return v9;
      (*(void (**)(uint64_t))(*(_QWORD *)v55 + 8))(v55);
    }
LABEL_29:
    v55 = 0;
    return v9;
  }
  v6 = v2[3].u32[2];
  if (v2[3].i32[2])
  {
    v7 = 0;
    v8 = 4 * v2[3].i64[0];
    do
    {
      memcpy((void *)(v3[1].i64[0] + v3[1].i64[1] * v7), (const void *)(v5[1].i64[0] + v5[1].i64[1] * v7), v8);
      ++v7;
    }
    while (v6 != v7);
  }
  return 0;
}

void sub_1A64BC66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t (**a20)(CMedian::CKernel16C *__hidden this, const CGrNavigator *, const CGrNavigator *, unsigned int, const CGrNavigator *))
{
  uint64_t v20;
  _BYTE *v21;

  a20 = &off_1E5014A28;
  CLock::~CLock((CLock *)(v20 + 12704));
  CKernel::~CKernel((CKernel *)&a20);
  if (*v21)
  {
    if (STACK[0x3220])
      (*(void (**)(unint64_t))(*(_QWORD *)STACK[0x3220] + 8))(STACK[0x3220]);
  }
  _Unwind_Resume(a1);
}

void sub_1A64BCB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _BYTE *v19;

  CGrNavigator::~CGrNavigator((CGrNavigator *)&a9);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a19);
  if (*v19)
  {
    if (STACK[0x3200])
      (*(void (**)(unint64_t))(*(_QWORD *)STACK[0x3200] + 8))(STACK[0x3200]);
  }
  _Unwind_Resume(a1);
}

uint64_t CMedian::CKernel16C::Process_(CMedian::CKernel16C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  CKernel *v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CKernel *v14;
  uint64_t v15;
  CMemBlock *v16;
  uint64_t v17;
  char *v18;
  __int128 v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 *v27;
  int64x2_t v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  uint64_t v36;
  unsigned __int8 *v37;
  uint64_t v38;
  uint64_t j;
  int v40;
  uint64_t v41;
  unsigned __int8 *v42;
  unsigned int *v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  unsigned int v47;
  unint64_t v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  unsigned int v56;
  int v57;
  unsigned __int8 *v58;
  int v59;
  uint64_t v60;
  int v61;
  char *v62;
  unint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unsigned __int8 v66;
  unsigned __int8 v67;
  uint64_t v68;
  unsigned int v69;
  unsigned __int8 **v70;
  uint64_t *v71;
  uint64_t v72;
  int v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t (**v76)();
  uint64_t (**v77)();
  unint64_t v78;
  unint64_t v79;
  unint64_t v80;
  uint64_t v81;
  unsigned __int8 v82;
  unsigned __int8 v83;
  uint64_t (**v84)();
  uint64_t v85;
  uint64_t v86;
  unsigned int v87;
  unsigned __int8 **v88;
  uint64_t *v89;
  uint64_t v90;
  int v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t (**v94)();
  uint64_t (**v95)();
  unint64_t v96;
  unint64_t v97;
  unint64_t v98;
  uint64_t v99;
  unsigned __int8 v100;
  unsigned __int8 v101;
  uint64_t (**v102)();
  uint64_t v103;
  int v105;
  int v106;
  unsigned __int8 *v107;
  unsigned int *v108;
  uint64_t v109;
  int v110;
  int v111;
  uint64_t v112;
  unsigned int v113;
  int v114;
  char *v115;
  uint64_t v116;
  unsigned int v117;
  unint64_t v118;
  int v119;
  uint64_t v121;
  int v122;
  unsigned int v123;
  int v124;
  int v125;
  uint64_t v126;
  int v127;
  uint64_t v128;
  unsigned int v129;
  unsigned int v130;
  uint64_t v131;
  uint64_t v132;
  __int16 v133;
  unsigned int v134;
  unsigned int v135;
  int v136;
  int v137;
  unsigned int v138;
  int v139;
  char *v140;
  unint64_t v141;
  unint64_t v142;
  uint64_t v143;
  unsigned __int8 v144;
  unsigned __int8 v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  unsigned int v150;
  uint64_t v151;
  uint64_t v152;
  unsigned int v153;
  int v154;
  int v155;
  uint64_t v156;
  unsigned __int8 *v157;
  uint64_t v158;
  unsigned int v159;
  unsigned int v160;
  int v161;
  char *v162;
  unint64_t v163;
  unint64_t v164;
  int v165;
  uint64_t v166;
  int v167;
  char *v168;
  unint64_t v169;
  unint64_t v170;
  int v171;
  char *v172;
  unint64_t v173;
  unint64_t v174;
  uint64_t v175;
  unint64_t v176;
  unsigned __int8 v177;
  int v178;
  unsigned __int8 v179;
  unsigned int v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unsigned int v184;
  int v185;
  int v186;
  unsigned int v187;
  char *v188;
  unsigned int v189;
  uint64_t v190;
  char *v191;
  char *v192;
  int v193;
  int v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  char *v199;
  uint64_t v200;
  unsigned int v201;
  char *v202;
  unsigned int v203;
  uint64_t v204;
  char *v205;
  uint64_t v206;
  unsigned int v207;
  char *v208;
  unsigned int v209;
  unsigned int v210;
  unsigned int v211;
  int v212;
  unsigned int v213;
  char *v214;
  uint64_t v215;
  unsigned int v216;
  BOOL v217;
  char *v218;
  uint64_t v219;
  unsigned int v220;
  unsigned int v221;
  uint64_t v222;
  unsigned int v223;
  int v224;
  char *v225;
  uint64_t v226;
  uint64_t v227;
  unsigned int v228;
  char *v229;
  unsigned int v230;
  BOOL v231;
  unsigned __int8 *v232;
  uint64_t v233;
  unsigned int v234;
  unsigned int v235;
  int v236;
  char *v237;
  unint64_t v238;
  unint64_t v239;
  unsigned int v240;
  uint64_t v241;
  int v242;
  char *v243;
  unint64_t v244;
  unint64_t v245;
  int v246;
  char *v247;
  unint64_t v248;
  unint64_t v249;
  unsigned __int8 v250;
  unint64_t v251;
  uint64_t v252;
  unint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  _WORD *v260;
  unsigned __int8 *v261;
  unsigned int v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  _QWORD *v270;
  int v271;
  uint64_t (**v272)();
  uint64_t v273;
  uint64_t v274;
  CMemBlock *v275;
  CMemBlock *v276;
  uint64_t v277;
  _QWORD *v278;
  CKernel *v279;
  unsigned int v280;
  _QWORD *v281;
  uint64_t (**v282)();
  int v283;
  int v284;
  int v285;
  uint64_t v286;
  unsigned int v287;
  uint64_t v288;
  uint64_t v289;
  unsigned __int8 *v290;
  int v291;
  int v292;
  int v293;
  int v294;
  int v295;
  int v296;
  int v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t i;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unsigned int v304;
  uint64_t v305;
  int v306;
  int v307;
  int v308;
  int v309;
  unsigned int v310;
  uint64_t v311;
  _QWORD v312[2];
  char *v313;
  uint64_t v314;
  __int128 v315;
  unint64_t v316;
  unint64_t v317;
  uint64_t v318;
  __int16 v319;
  _QWORD v320[4];
  __int128 v321;
  __int128 v322;
  uint64_t v323;
  __int16 v324;
  int v325;
  unsigned int v326;
  unsigned int v327[2];
  uint64_t v328;
  _BYTE v329[2032];
  uint64_t (**v330)();
  uint64_t (**v331)();
  unsigned __int8 *v332;
  uint64_t v333;
  __int128 v334;
  int64x2_t v335;
  uint64_t v336;
  __int16 v337;
  uint64_t v338;

  v5 = (CKernel *)MEMORY[0x1E0C80A78](this);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v14 = v5;
  v338 = *MEMORY[0x1E0C80C00];
  v15 = CKernel::BorrowData(v5, 611256);
  if (!v15)
    return 7;
  v16 = (CMemBlock *)v15;
  v17 = *(_QWORD *)(v15 + 32);
  v280 = v9;
  v281 = (_QWORD *)v13;
  v18 = (char *)(v17 + 611256 * v9);
  v19 = *(_OWORD *)(v13 + 48);
  v20 = (uint64_t)(v18 + 9280);
  v21 = v18 + 337008;
  v321 = xmmword_1A64DDF00;
  v322 = v19;
  v22 = 2 * v19;
  v320[2] = v18 + 337008;
  v320[3] = 2 * v19;
  v323 = 1;
  v324 = 1;
  v320[0] = off_1E50147F8;
  v320[1] = 0;
  v24 = *(_QWORD *)(v11 + 48);
  v23 = *(_QWORD *)(v11 + 56);
  v289 = (uint64_t)(v18 + 496056);
  v313 = v18 + 496056;
  v314 = 2 * v24;
  v305 = 2 * v24;
  v315 = xmmword_1A64DDF00;
  v316 = v24;
  v317 = v23;
  v318 = 1;
  v319 = 1;
  v312[0] = off_1E50147F8;
  v312[1] = 0;
  v25 = *((_QWORD *)v14 + 1587);
  if (v7 && *(_BYTE *)(v25 + 46) && *(_BYTE *)(v25 + 47))
  {
    v270 = (_QWORD *)v7;
    CMedian::Median16CFlattenHistComp_(v25, (uint64_t)v281, (uint64_t)v320, v20);
    v26 = *((_QWORD *)v14 + 1587);
    v27 = *(unsigned __int8 **)(v7 + 16);
    v29 = *(_OWORD *)(v7 + 32);
    v28 = *(int64x2_t *)(v7 + 48);
    v333 = *(_QWORD *)(v7 + 24);
    v332 = v27;
    v334 = v29;
    v335 = vshrq_n_s64(vshlq_n_s64(v28, 0x20uLL), 0x20uLL);
    v336 = *(_QWORD *)(v7 + 64);
    v337 = 1;
    v331 = 0;
    v330 = off_1E50147D8;
    v287 = v24 - 1;
    v30 = *v27;
    v271 = *(unsigned __int16 *)(v26 + 2 * v30 + 822);
    v31 = *(_QWORD *)(v26 + 16);
    v292 = *(unsigned __int8 *)(v26 + v30 + 53);
    v298 = v30;
    if (v31)
      v32 = *(_QWORD *)(v31 + 32);
    else
      v32 = 0;
    v268 = v26;
    v105 = *(_DWORD *)(v26 + 24);
    bzero(v18, 0x2440uLL);
    v106 = v105;
    v107 = (unsigned __int8 *)(v18 + 32);
    v108 = (unsigned int *)(v18 + 1056);
    v110 = v292;
    v109 = v298;
    v111 = -v292;
    v112 = v32;
    do
    {
      if (v111 >= 0)
        v113 = v111;
      else
        v113 = -v111;
      v114 = *(unsigned __int8 *)(v32 + (v298 << 7) + v113) - 1;
      v115 = &v21[2 * (v106 - v114) + v22 * (v111 + v106)];
      v116 = (2 * v114) | 1u;
      do
      {
        v117 = *(unsigned __int16 *)v115;
        v115 += 2;
        v118 = ((unint64_t)v117 >> 3) & 0x1FFC;
        v119 = *(unsigned int *)((char *)v108 + v118);
        ++v107[(unint64_t)v117 >> 6];
        *(unsigned int *)((char *)v108 + v118) = (0x80000000 >> v117) ^ v119;
        --v116;
      }
      while (v116);
    }
    while (v111++ != v292);
    v274 = v17;
    v276 = v16;
    v278 = (_QWORD *)v11;
    LODWORD(v121) = 0;
    v122 = 0;
    v123 = v271 - *v107;
    v327[0] = 64;
    v286 = (int)v23;
    v326 = v123;
    v124 = v106 - 1;
    v125 = v106 + 1;
    v263 = v112 + 1;
    v126 = v287;
    v127 = 1;
    v284 = v106;
    v269 = v112;
    v264 = v106 + 1;
    v266 = v106 - 1;
LABEL_46:
    v128 = v112 + (v109 << 7);
    v294 = -v110;
    v121 = (int)v121;
    v129 = v124 + v121;
    v130 = v125 + v121;
    v291 = (2 * v110) | 1;
    for (i = v109; ; v109 = i)
    {
      v304 = v130;
      v310 = v129;
      if (v109)
      {
        v131 = v121;
        v132 = v126;
        v133 = Hist16CRead_(v107, v108, v327, (int *)&v326);
        v126 = v132;
        v121 = v131;
        v106 = v284;
      }
      else
      {
        v133 = *(_WORD *)&v21[2 * (v122 + v106) + v22 * (v106 + v121)];
      }
      *(_WORD *)(v305 * v121 + v289 + 2 * v122) = v133;
      if (v122 != (_DWORD)v126)
      {
        v146 = v122 - (v127 == -1);
        if (v127 < 1)
        {
          v109 = v332[v146 + v333 * v121];
          v147 = v109;
          v112 = v269;
          v148 = i;
        }
        else
        {
          v109 = v332[v146 + 1 + v333 * v121];
          v147 = i;
          v148 = v109;
          v112 = v269;
        }
        v149 = v326 - v271;
        v110 = *(unsigned __int8 *)(v268 + v109 + 53);
        v271 = *(unsigned __int16 *)(v268 + 2 * v109 + 822);
        v150 = v149 + v271;
        if (*(unsigned __int16 *)(v268 + 310 + 2 * v147) == *(unsigned __int16 *)(v268 + 310 + 2 * v148))
        {
          v151 = v126;
          v152 = v109 << 7;
          v153 = v327[0];
          v154 = v146 + v106;
          v155 = v146 + v106 + 1;
          v156 = (v106 + v121);
          if (v127 == 1)
          {
            if (*(_BYTE *)(v268 + v109 + 53))
            {
              v306 = v122 - (v127 == -1);
              v295 = *(unsigned __int8 *)(v268 + v109 + 53);
              v157 = (unsigned __int8 *)(v263 + v152);
              v158 = *(unsigned __int8 *)(v268 + v109 + 53);
              v159 = v310;
              v160 = v304;
              do
              {
                v161 = *v157++;
                v162 = &v21[v22 * v160];
                v163 = *(unsigned __int16 *)&v162[2 * (v155 - v161)];
                v164 = *(unsigned __int16 *)&v162[2 * (v154 + v161)];
                v165 = v164 - v153;
                v166 = (v163 >> 3) & 0x1FFC;
                *(unsigned int *)((char *)v108 + ((v164 >> 3) & 0x1FFC)) ^= 0x80000000 >> v164;
                v167 = *(unsigned int *)((char *)v108 + v166);
                ++v107[v164 >> 6];
                --v107[v163 >> 6];
                *(unsigned int *)((char *)v108 + v166) = v167 ^ (0x80000000 >> v163);
                v168 = &v21[v22 * v159];
                v169 = *(unsigned __int16 *)&v168[2 * (v154 + v161)];
                v170 = *(unsigned __int16 *)&v168[2 * (v155 - v161)];
                v150 += ((v163 - v153) >> 31)
                      + (v165 >> 31)
                      + ((v170 - v153) >> 31)
                      + ((int)(v169 - v153) >> 31);
                LOBYTE(v163) = v107[v169 >> 6];
                *(unsigned int *)((char *)v108 + ((v169 >> 3) & 0x1FFC)) ^= 0x80000000 >> v169;
                v107[v169 >> 6] = v163 + 1;
                LOBYTE(v163) = v107[v170 >> 6];
                *(unsigned int *)((char *)v108 + ((v170 >> 3) & 0x1FFC)) ^= 0x80000000 >> v170;
                v107[v170 >> 6] = v163 - 1;
                --v159;
                ++v160;
                --v158;
              }
              while (v158);
              v153 = v327[0];
              v112 = v269;
              v110 = v295;
              v146 = v306;
            }
            v171 = *(unsigned __int8 *)(v112 + (v109 << 7));
            v172 = &v21[v22 * v156];
            v173 = *(unsigned __int16 *)&v172[2 * (v155 - v171)];
            v174 = *(unsigned __int16 *)&v172[2 * (v154 + v171)];
            v326 = v150 + ((v173 - v153) >> 31) + ((int)(v174 - v153) >> 31);
            v175 = (v173 >> 3) & 0x1FFC;
            v176 = v173 >> 6;
            v177 = v107[v174 >> 6];
            *(unsigned int *)((char *)v108 + ((v174 >> 3) & 0x1FFC)) ^= 0x80000000 >> v174;
            v178 = *(unsigned int *)((char *)v108 + v175);
            v107[v174 >> 6] = v177 + 1;
            v179 = v107[v173 >> 6];
            v180 = 0x80000000 >> v173;
          }
          else
          {
            if (*(_BYTE *)(v268 + v109 + 53))
            {
              v307 = v122 - (v127 == -1);
              v297 = *(unsigned __int8 *)(v268 + v109 + 53);
              v302 = v109;
              v232 = (unsigned __int8 *)(v263 + v152);
              v233 = *(unsigned __int8 *)(v268 + v109 + 53);
              v234 = v310;
              v235 = v304;
              do
              {
                v236 = *v232++;
                v237 = &v21[v22 * v235];
                v238 = *(unsigned __int16 *)&v237[2 * (v155 - v236)];
                v239 = *(unsigned __int16 *)&v237[2 * (v154 + v236)];
                v240 = v239 - v153;
                v241 = (v239 >> 3) & 0x1FFC;
                *(unsigned int *)((char *)v108 + ((v238 >> 3) & 0x1FFC)) ^= 0x80000000 >> v238;
                v242 = *(unsigned int *)((char *)v108 + v241);
                ++v107[v238 >> 6];
                --v107[v239 >> 6];
                *(unsigned int *)((char *)v108 + v241) = v242 ^ (0x80000000 >> v239);
                v243 = &v21[v22 * v234];
                v244 = *(unsigned __int16 *)&v243[2 * (v155 - v236)];
                v245 = *(unsigned __int16 *)&v243[2 * (v154 + v236)];
                v150 += (v240 >> 31)
                      + ((int)(v238 - v153) >> 31)
                      + ((int)(v244 - v153) >> 31)
                      + ((v245 - v153) >> 31);
                LOBYTE(v243) = v107[v244 >> 6];
                *(unsigned int *)((char *)v108 + ((v244 >> 3) & 0x1FFC)) ^= 0x80000000 >> v244;
                v107[v244 >> 6] = (_BYTE)v243 + 1;
                LOBYTE(v238) = v107[v245 >> 6];
                *(unsigned int *)((char *)v108 + ((v245 >> 3) & 0x1FFC)) ^= 0x80000000 >> v245;
                v107[v245 >> 6] = v238 - 1;
                --v234;
                ++v235;
                --v233;
              }
              while (v233);
              v153 = v327[0];
              v112 = v269;
              v110 = v297;
              v109 = v302;
              v146 = v307;
            }
            v246 = *(unsigned __int8 *)(v112 + v152);
            v247 = &v21[v22 * v156];
            v248 = *(unsigned __int16 *)&v247[2 * (v155 - v246)];
            v249 = *(unsigned __int16 *)&v247[2 * (v154 + v246)];
            v326 = v150 + ((v249 - v153) >> 31) + ((int)(v248 - v153) >> 31);
            v175 = (v249 >> 3) & 0x1FFC;
            v176 = v249 >> 6;
            v250 = v107[v248 >> 6];
            *(unsigned int *)((char *)v108 + ((v248 >> 3) & 0x1FFC)) ^= 0x80000000 >> v248;
            v178 = *(unsigned int *)((char *)v108 + v175);
            v107[v248 >> 6] = v250 + 1;
            v179 = v107[v249 >> 6];
            v180 = 0x80000000 >> v249;
          }
          *(unsigned int *)((char *)v108 + v175) = v178 ^ v180;
          v107[v176] = v179 - 1;
          v126 = v151;
          goto LABEL_142;
        }
        v296 = *(unsigned __int8 *)(v268 + v109 + 53);
        v301 = v109;
        v181 = v112 + (v147 << 7);
        v182 = v112 + (v148 << 7);
        LODWORD(v183) = *(unsigned __int8 *)(v268 + 53 + v147);
        v184 = *(unsigned __int8 *)(v268 + 53 + v148);
        v185 = v146 + v106;
        v186 = v106 + v121;
        v187 = v327[0];
        if (v184 <= v183)
          v183 = v183;
        else
          v183 = v184;
        v188 = &v21[2 * v185];
        v311 = v181;
        while (1)
        {
          v189 = *(unsigned __int8 *)(v181 + v183);
          v190 = *(unsigned __int8 *)(v182 + v183);
          v191 = &v188[v22 * (v186 - v183)];
          v192 = &v188[v22 * (v186 + v183)];
          if (*(_BYTE *)(v181 + v183))
          {
            v193 = 1 - v189;
            if (*(_BYTE *)(v182 + v183))
            {
              v194 = 2 - v190;
              if (v193 == 2 - (_DWORD)v190)
              {
                v195 = v126;
              }
              else
              {
                if (v193 >= v194)
                  v210 = 2 - v190;
                else
                  v210 = 1 - v189;
                if (v193 <= v194)
                  v211 = 2 - v190;
                else
                  v211 = 1 - v189;
                if (v193 <= v194)
                  v212 = -v127;
                else
                  v212 = v127;
                v195 = v126;
                v213 = v211 - v210;
                if (v211 != v210 && v191)
                {
                  v214 = &v191[2 * v210];
                  v215 = -(uint64_t)v213;
                  do
                  {
                    v216 = *(unsigned __int16 *)v214;
                    v214 += 2;
                    v107[(unint64_t)v216 >> 6] += v212;
                    v150 -= v212 & ((int)(v216 - v187) >> 31);
                    *(unsigned int *)((char *)v108 + (((unint64_t)v216 >> 3) & 0x1FFC)) ^= 0x80000000 >> v216;
                    v217 = __CFADD__(v215++, 1);
                  }
                  while (!v217);
                }
                if (v183 < 1)
                {
                  v106 = v284;
                }
                else
                {
                  v106 = v284;
                  if (v211 != v210 && v192)
                  {
                    v218 = &v192[2 * v210];
                    v219 = -(uint64_t)v213;
                    do
                    {
                      v220 = *(unsigned __int16 *)v218;
                      v218 += 2;
                      v107[(unint64_t)v220 >> 6] += v212;
                      v150 -= v212 & ((int)(v220 - v187) >> 31);
                      *(unsigned int *)((char *)v108 + (((unint64_t)v220 >> 3) & 0x1FFC)) ^= 0x80000000 >> v220;
                      v217 = __CFADD__(v219++, 1);
                    }
                    while (!v217);
                  }
                }
              }
              v221 = v190 + 1;
              if ((_DWORD)v190 + 1 == v189
                || (v221 >= v189 ? (v222 = v189) : (v222 = v221),
                    v221 <= v189 ? (v223 = v189) : (v223 = v221),
                    v221 >= v189 ? (v224 = v127) : (v224 = -v127),
                    v223 == (_DWORD)v222))
              {
                v126 = v195;
                v181 = v311;
              }
              else
              {
                v225 = &v191[2 * v222];
                v226 = v223 - v222;
                v227 = v226;
                do
                {
                  v228 = *(unsigned __int16 *)v225;
                  v225 += 2;
                  v107[(unint64_t)v228 >> 6] += v224;
                  v150 -= v224 & ((int)(v228 - v187) >> 31);
                  *(unsigned int *)((char *)v108 + (((unint64_t)v228 >> 3) & 0x1FFC)) ^= 0x80000000 >> v228;
                  --v227;
                }
                while (v227);
                if (v183 < 1)
                {
                  v126 = v195;
LABEL_141:
                  v326 = v150;
                  v112 = v269;
                  v109 = v301;
                  v110 = v296;
                  v146 = v122 - (v127 == -1);
LABEL_142:
                  if (v127 == 1)
                    v122 = v146 + 1;
                  else
                    v122 = v146;
                  v289 = (uint64_t)v313;
                  v305 = v314;
                  v125 = v264;
                  v124 = v266;
                  goto LABEL_46;
                }
                v229 = &v192[2 * v222];
                v126 = v195;
                v181 = v311;
                do
                {
                  v230 = *(unsigned __int16 *)v229;
                  v229 += 2;
                  v107[(unint64_t)v230 >> 6] += v224;
                  v150 -= v224 & ((int)(v230 - v187) >> 31);
                  *(unsigned int *)((char *)v108 + (((unint64_t)v230 >> 3) & 0x1FFC)) ^= 0x80000000 >> v230;
                  --v226;
                }
                while (v226);
              }
            }
            else
            {
              v196 = v126;
              v204 = 2 * v189 - 1;
              if (v191)
              {
                v205 = &v191[2 * v193];
                v206 = v204;
                do
                {
                  v207 = *(unsigned __int16 *)v205;
                  v205 += 2;
                  v107[(unint64_t)v207 >> 6] -= v127;
                  v150 += v127 & ((int)(v207 - v187) >> 31);
                  *(unsigned int *)((char *)v108 + (((unint64_t)v207 >> 3) & 0x1FFC)) ^= 0x80000000 >> v207;
                  --v206;
                }
                while (v206);
              }
              if (v183 < 1)
                goto LABEL_140;
              if (v192)
              {
                v208 = &v192[2 * v193];
                do
                {
                  v209 = *(unsigned __int16 *)v208;
                  v208 += 2;
                  v107[(unint64_t)v209 >> 6] -= v127;
                  v150 += v127 & ((int)(v209 - v187) >> 31);
                  *(unsigned int *)((char *)v108 + (((unint64_t)v209 >> 3) & 0x1FFC)) ^= 0x80000000 >> v209;
                  --v204;
                }
                while (v204);
              }
            }
          }
          else
          {
            v196 = v126;
            v197 = 2 - v190;
            v198 = (2 * v190 - 1);
            if (v191)
            {
              v199 = &v191[2 * v197];
              v200 = (2 * v190 - 1);
              do
              {
                v201 = *(unsigned __int16 *)v199;
                v199 += 2;
                v107[(unint64_t)v201 >> 6] += v127;
                v150 -= v127 & ((int)(v201 - v187) >> 31);
                *(unsigned int *)((char *)v108 + (((unint64_t)v201 >> 3) & 0x1FFC)) ^= 0x80000000 >> v201;
                --v200;
              }
              while (v200);
            }
            if (v183 < 1)
            {
LABEL_140:
              v126 = v196;
              goto LABEL_141;
            }
            if (v192)
            {
              v202 = &v192[2 * v197];
              do
              {
                v203 = *(unsigned __int16 *)v202;
                v202 += 2;
                v107[(unint64_t)v203 >> 6] += v127;
                v150 -= v127 & ((int)(v203 - v187) >> 31);
                *(unsigned int *)((char *)v108 + (((unint64_t)v203 >> 3) & 0x1FFC)) ^= 0x80000000 >> v203;
                --v198;
              }
              while (v198);
            }
          }
          v231 = v183-- <= 0;
          if (v231)
            goto LABEL_141;
        }
      }
      if (v121 + 1 >= v286)
        break;
      v134 = v326;
      v135 = v327[0];
      v136 = v291;
      v137 = v294;
      do
      {
        if (v137 >= 0)
          v138 = v137;
        else
          v138 = -v137;
        v139 = *(unsigned __int8 *)(v128 + v138);
        v140 = &v21[2 * (v106 + v126 + v137)];
        v141 = *(unsigned __int16 *)&v140[v22 * (v106 + v121 + 1 - v139)];
        v142 = *(unsigned __int16 *)&v140[v22 * (v106 + v121 + v139)];
        v143 = (v141 >> 3) & 0x1FFC;
        v144 = v107[v142 >> 6];
        *(unsigned int *)((char *)v108 + ((v142 >> 3) & 0x1FFC)) ^= 0x80000000 >> v142;
        LODWORD(v140) = *(unsigned int *)((char *)v108 + v143);
        v107[v142 >> 6] = v144 + 1;
        v145 = v107[v141 >> 6];
        *(unsigned int *)((char *)v108 + v143) = v140 ^ (0x80000000 >> v141);
        v134 += ((v141 - v135) >> 31) + ((int)(v142 - v135) >> 31);
        v107[v141 >> 6] = v145 - 1;
        ++v137;
        --v136;
      }
      while (v136);
      v326 = v134;
      v127 = -v127;
      v122 = v126;
      v126 = v287 - v126;
      v129 = v310 + 1;
      v130 = v304 + 1;
      ++v121;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v330);
    CMedian::OrdinalTransform(v289, v305, (uint64_t)v278, v274 + 611256 * v280 + 205936);
    v251 = v317;
    v16 = v276;
    if (v317)
    {
      v252 = 0;
      v253 = v316;
      do
      {
        if (v253)
        {
          v254 = v270[4];
          v255 = *((_QWORD *)v14 + 1587);
          v256 = v281[2];
          v257 = v281[3];
          v258 = v281[4];
          v259 = v278[4];
          v260 = (_WORD *)(v278[2] + v278[3] * v252);
          v261 = (unsigned __int8 *)(v270[2] + v270[3] * v252);
          v262 = 1;
          do
          {
            if (*(_BYTE *)(v255 + *v261 + 1334))
              *v260 += ((*(unsigned __int16 *)(v256
                                             + v257 * (*(_DWORD *)(v255 + 24) + v252)
                                             + v258 * (v262 + *(_DWORD *)(v255 + 24) - 1))
                       - (unsigned __int16)*v260)
                      * *(unsigned __int8 *)(v255 + *v261 + 1334)) >> 8;
            v260 = (_WORD *)((char *)v260 + v259);
            v261 += v254;
            v231 = v253 > v262++;
          }
          while (v231);
        }
        ++v252;
      }
      while (v251 > v252);
    }
  }
  else
  {
    CMedian::Median16CFlattenHistComp_(v25, (uint64_t)v281, (uint64_t)v320, v20);
    v33 = *((_QWORD *)v14 + 1587);
    v34 = *(unsigned int *)(v33 + 24);
    if (v34 <= 0x7F)
    {
      v308 = v23;
      v275 = v16;
      v277 = v11;
      v279 = v14;
      v35 = *(_DWORD *)(v33 + 36);
      v36 = (2 * v34) | 1;
      v37 = (unsigned __int8 *)(v33 + 1590);
      bzero(&v330, 0x800uLL);
      bzero(v327, 0x800uLL);
      v38 = 0;
      for (j = 0; j != v36; ++j)
      {
        v40 = v37[j];
        (&v330)[j] = (uint64_t (**)())(v38 + 2 * v37[j]);
        *(_QWORD *)&v327[2 * j] = v38 + 2 * (v36 - v40);
        v38 += v22;
      }
      bzero(v18, 0x2440uLL);
      v41 = 0;
      v42 = (unsigned __int8 *)(v18 + 32);
      v43 = (unsigned int *)(v18 + 1056);
      do
      {
        v44 = v37[v41];
        v45 = &v21[2 * v44 + v22 * v41];
        v46 = (v36 - 2 * v44);
        do
        {
          v47 = *(unsigned __int16 *)v45;
          v45 += 2;
          v48 = ((unint64_t)v47 >> 3) & 0x1FFC;
          v49 = *(unsigned int *)((char *)v43 + v48);
          ++v42[(unint64_t)v47 >> 6];
          *(unsigned int *)((char *)v43 + v48) = (0x80000000 >> v47) ^ v49;
          --v46;
        }
        while (v46);
        ++v41;
      }
      while (v41 != v36);
      v290 = v37;
      v273 = v17;
      v50 = 0;
      LODWORD(v17) = 0;
      v51 = v24 - 1;
      v326 = 0;
      v325 = v35;
      v52 = v308 - 1;
      v282 = v330;
      v272 = v331;
      v309 = 1;
      v53 = v51;
      v267 = *(_QWORD *)v327;
      v265 = v328;
      v283 = v52;
      v285 = v51;
LABEL_15:
      v288 = 2 * v50;
      v293 = v51 - v50;
      if ((int)v17 <= v52)
        v54 = v52;
      else
        v54 = v17;
      v17 = (int)v17;
      v55 = v50;
      v299 = v54;
      v303 = v289 + 2 * v50;
      while (1)
      {
        *(_WORD *)(v303 + v305 * v17) = Hist16CRead_(v42, v43, &v326, &v325);
        if (v55 != v53)
        {
          v68 = (uint64_t)&v21[v288 + v22 * v17];
          if (v309 == 1)
          {
            v69 = v326;
            v70 = &v332;
            v71 = (uint64_t *)v329;
            v72 = v36;
            v73 = v325;
            v74 = v265;
            v75 = v267;
            v76 = v272;
            v77 = v282;
            do
            {
              v78 = *(unsigned __int16 *)((char *)v77 + v68);
              v79 = *(unsigned __int16 *)(v75 + v68);
              v73 += ((v78 - v69) >> 31) + ((int)(v79 - v69) >> 31);
              v80 = v79 >> 6;
              v81 = (v78 >> 3) & 0x1FFC;
              v82 = v42[v79 >> 6];
              *(unsigned int *)((char *)v43 + ((v79 >> 3) & 0x1FFC)) ^= 0x80000000 >> v79;
              LODWORD(v79) = *(unsigned int *)((char *)v43 + v81);
              v42[v80] = v82 + 1;
              v83 = v42[v78 >> 6];
              *(unsigned int *)((char *)v43 + v81) = v79 ^ (0x80000000 >> v78);
              v42[v78 >> 6] = v83 - 1;
              v77 = v76;
              v84 = (uint64_t (**)())*v70++;
              v76 = v84;
              v75 = v74;
              v85 = *v71++;
              v74 = v85;
              --v72;
            }
            while (v72);
            v325 = v73;
            v50 = v55 + 1;
            v309 = 1;
          }
          else
          {
            v86 = v68 - 2;
            v87 = v326;
            v88 = &v332;
            v89 = (uint64_t *)v329;
            v90 = v36;
            v91 = v325;
            v92 = v265;
            v93 = v267;
            v94 = v272;
            v95 = v282;
            do
            {
              v96 = *(unsigned __int16 *)((char *)v95 + v86);
              v97 = *(unsigned __int16 *)(v93 + v86);
              v91 += ((v97 - v87) >> 31) + ((int)(v96 - v87) >> 31);
              v98 = v96 >> 6;
              v99 = (v97 >> 3) & 0x1FFC;
              v100 = v42[v96 >> 6];
              *(unsigned int *)((char *)v43 + ((v96 >> 3) & 0x1FFC)) ^= 0x80000000 >> v96;
              LODWORD(v96) = *(unsigned int *)((char *)v43 + v99);
              v42[v98] = v100 + 1;
              v101 = v42[v97 >> 6];
              *(unsigned int *)((char *)v43 + v99) = v96 ^ (0x80000000 >> v97);
              v42[v97 >> 6] = v101 - 1;
              v95 = v94;
              v102 = (uint64_t (**)())*v88++;
              v94 = v102;
              v93 = v92;
              v103 = *v89++;
              v92 = v103;
              --v90;
            }
            while (v90);
            v50 = v55 - 1;
            v325 = v91;
          }
          v52 = v283;
          v51 = v285;
          goto LABEL_15;
        }
        if (v17 == v299)
          break;
        v56 = v326;
        v57 = v325;
        v58 = v290;
        v59 = v55;
        v60 = v36;
        do
        {
          v61 = *v58++;
          v62 = &v21[2 * v59];
          v63 = *(unsigned __int16 *)&v62[v22 * (v17 + v61)];
          v64 = *(unsigned __int16 *)&v62[v22 * (v36 + v17 - v61)];
          v65 = (v63 >> 3) & 0x1FFC;
          v66 = v42[v64 >> 6];
          *(unsigned int *)((char *)v43 + ((v64 >> 3) & 0x1FFC)) ^= 0x80000000 >> v64;
          LODWORD(v62) = *(unsigned int *)((char *)v43 + v65);
          v42[v64 >> 6] = v66 + 1;
          v67 = v42[v63 >> 6];
          *(unsigned int *)((char *)v43 + v65) = v62 ^ (0x80000000 >> v63);
          v57 += ((v63 - v56) >> 31) + ((int)(v64 - v56) >> 31);
          v42[v63 >> 6] = v67 - 1;
          ++v59;
          --v60;
        }
        while (v60);
        v325 = v57;
        v309 = -v309;
        ++v17;
        v53 = v293;
      }
      v11 = v277;
      v14 = v279;
      v17 = v273;
      v16 = v275;
    }
    CMedian::OrdinalTransform(v289, v305, v11, v17 + 611256 * v280 + 205936);
  }
  CKernel::ReturnData(v14, v16);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v312);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v320);
  return 0;
}

void sub_1A64BDDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a32);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a42);
  _Unwind_Resume(a1);
}

void CMedian::CKernel16C::~CKernel16C(CMedian::CKernel16C *this)
{
  *(_QWORD *)this = &off_1E5014A28;
  CLock::~CLock((CMedian::CKernel16C *)((char *)this + 12704));
  CKernel::~CKernel(this);
}

{
  *(_QWORD *)this = &off_1E5014A28;
  CLock::~CLock((CMedian::CKernel16C *)((char *)this + 12704));
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel16C::IdealTSize(CMedian::CKernel16C *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 16);
  else
    return 0x10000000100;
}

void CMedian::Median16CFlattenHistComp_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unsigned int v6;
  uint64_t v7;
  unsigned __int8 *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  int v12;
  unint64_t v13;
  unsigned int v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int16 *v18;
  unsigned int v19;
  unsigned int v20;
  uint64_t v21;
  int v22;
  int v23;
  unsigned int i;
  uint64_t v25;
  uint64_t v26;
  unsigned __int8 v27;
  int v28;
  int v29;
  uint64_t v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  uint64_t v35;
  unsigned int v36;
  int v37;
  int v38;
  uint64_t v39;
  unsigned int v40;
  int v41;
  int v42;
  uint64_t v43;
  unsigned int v44;
  int v45;
  int v46;
  unsigned __int16 *v47;
  unsigned int v48;
  int v49;
  int v50;
  unsigned int v51;
  BOOL v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  int v56;
  uint64_t v57;
  int v58;
  unint64_t v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  unsigned int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  _WORD *v68;
  uint64_t v69;
  int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  int v74;
  int v75;
  uint64_t v76;
  int v77;
  int v78;
  int v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  unint64_t v83;
  uint64_t v84;
  uint64_t v85;
  unsigned __int16 *v86;
  _WORD *v87;
  unsigned int v88;
  unsigned int v89;
  uint64_t v90;
  unsigned int v91;
  unsigned int v92;
  uint64_t v93;
  uint64_t v94;
  __int16 v95;
  __int16 v96;
  unsigned int v97;
  unsigned int v98;
  unsigned int v99;
  unsigned int v100;
  __int16 v101;
  char v104[4];
  _DWORD v105[513];
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = *(_DWORD *)(a2 + 48);
  v7 = *(_QWORD *)(a2 + 56);
  v8 = (unsigned __int8 *)(a4 + 16);
  v9 = a4 + 65568;
  v10 = a4 + 196656;
  bzero(v104, 0x808uLL);
  v11 = *(unsigned int *)(a1 + 24);
  bzero(v8, *(unsigned __int16 *)(a1 + 44) + 1);
  v12 = v7;
  if (!(_DWORD)v7)
  {
    v14 = 0;
    goto LABEL_36;
  }
  v13 = 0;
  v14 = 0;
  v15 = (v7 - v11);
  v16 = v7;
  v17 = a1 + 1590;
  do
  {
    v18 = (unsigned __int16 *)(*(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v13);
    if (v13 < v11 || (v19 = v6, v13 >= v15))
    {
      v20 = v12 + ~(_DWORD)v13;
      if (v13 < v11)
        v20 = v13;
      v21 = *(unsigned __int8 *)(a1 + 1590 + v20);
      v18 += v21;
      v19 = v6 - 2 * v21;
    }
    if (v19 < 0xA)
    {
      v51 = 0;
    }
    else
    {
      v22 = v18[1];
      v23 = *v18;
      for (i = 9; i < v19; i += 8)
      {
        v25 = v18[2];
        v26 = v18[3];
        v27 = v8[v23] + 1;
        if (v8[v23] == 255)
          v105[v14++] = v23;
        v28 = v8[v22];
        v29 = v22 ^ v23;
        v8[v23] = v27;
        v30 = v18[4];
        v31 = v28 + ((v29 - 1) >> 31) - 255;
        if (v28 + ((v29 - 1) >> 31) == 255)
          v105[v14++] = v22;
        v32 = v8[v25];
        v33 = v25 ^ v22;
        v8[v22] = v31;
        v34 = v8[v26];
        v35 = v18[5];
        v36 = v32 + ((v33 - 1) >> 31) - 255;
        if (v32 + ((v33 - 1) >> 31) == 255)
          v105[v14++] = v25;
        v37 = v26 ^ v25;
        v8[v25] = v36;
        v38 = v8[v30];
        v39 = v18[6];
        v40 = v34 + ((v37 - 1) >> 31) - 255;
        if (!v40)
          v105[v14++] = v26;
        v41 = v30 ^ v26;
        v8[v26] = v40;
        v42 = v8[v35];
        v43 = v18[7];
        v44 = v38 + ((v41 - 1) >> 31) - 255;
        if (v38 + ((v41 - 1) >> 31) == 255)
          v105[v14++] = v30;
        v45 = v35 ^ v30;
        v8[v30] = v44;
        v46 = v8[v39];
        v47 = v18 + 8;
        v23 = v18[8];
        v48 = v42 + ((v45 - 1) >> 31) - 255;
        if (!v48)
          v105[v14++] = v35;
        v49 = v39 ^ v35;
        v8[v35] = v48;
        v50 = v8[v43];
        v22 = v18[9];
        if (v46 + ((v49 - 1) >> 31) == 255)
          v105[v14++] = v39;
        v8[v39] = v46 + (v49 - 1 < 0) + 1;
        if (v50 + (((v43 ^ v39) - 1) >> 31) == 255)
          v105[v14++] = v43;
        v8[v43] = v50 + ((int)((v43 ^ v39) - 1) < 0) + 1;
        v18 += 8;
      }
      v51 = ((v19 - 10) & 0xFFFFFFF8) + 8;
      v18 = v47;
    }
    v52 = v19 >= v51;
    v53 = v19 - v51;
    if (v53 != 0 && v52)
    {
      do
      {
        v54 = *v18++;
        v55 = v8[v54] + 1;
        v105[v14] = v54;
        v14 += v55 >> 8;
        v8[v54] = v55;
        --v53;
      }
      while (v53);
    }
    ++v13;
  }
  while (v13 != v16);
  if (v14 >= 2)
  {
    v56 = v12;
    bensort_((uint64_t)v105, 0, v14 - 1);
    v12 = v56;
LABEL_36:
    v17 = a1 + 1590;
  }
  v105[v14] = -1;
  LODWORD(v57) = v105[0];
  v58 = *(unsigned __int16 *)(a1 + 44);
  if (!*(_WORD *)(a1 + 44))
  {
    LODWORD(v59) = 0;
    v60 = 1;
LABEL_67:
    v75 = v8[v59];
    v76 = v59;
    if ((_DWORD)v57 == (_DWORD)v59)
    {
      v77 = v58 + 1;
      do
      {
        v75 += 256;
        v78 = v105[v77++];
      }
      while (v78 == (_DWORD)v76);
    }
    for (*(_WORD *)(v9 + 2 * v76) = v60; v75; --v75)
      *(_WORD *)(v10 + 2 * v60++) = v76;
    goto LABEL_72;
  }
  v59 = 0;
  v58 = 0;
  v60 = 1;
  do
  {
    v61 = *(_DWORD *)&v8[v59];
    v62 = bswap32(v61);
    if ((v57 ^ v59) < 4)
    {
      v72 = HIBYTE(v62);
      *(_WORD *)(v9 + 2 * v59) = v60;
      if (v59 == v57)
      {
        do
        {
          v72 += 256;
          v57 = v105[++v58];
        }
        while (v59 == v57);
      }
      for (; v72; --v72)
        *(_WORD *)(v10 + 2 * v60++) = v59;
      v73 = BYTE2(v62);
      *(_WORD *)(v9 + 2 * (v59 | 1)) = v60;
      if ((v59 | 1) == v57)
      {
        do
        {
          v73 += 256;
          v57 = v105[++v58];
        }
        while ((v59 | 1) == v57);
      }
      for (; v73; --v73)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 1;
      v74 = BYTE1(v62);
      *(_WORD *)(v9 + 2 * (v59 | 2)) = v60;
      if ((v59 | 2) == v57)
      {
        do
        {
          v74 += 256;
          v57 = v105[++v58];
        }
        while ((v59 | 2) == v57);
      }
      for (; v74; --v74)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 2;
      v62 = v62;
      *(_WORD *)(v9 + 2 * (v59 | 3)) = v60;
      if ((v59 | 3) == v57)
      {
        do
        {
          v62 += 256;
          v57 = v105[++v58];
        }
        while ((v59 | 3) == v57);
      }
      for (; v62; --v62)
        *(_WORD *)(v10 + 2 * v60++) = v59 | 3;
    }
    else if (v61)
    {
      *(_WORD *)(v9 + 2 * v59) = v60;
      v63 = v60 + HIBYTE(v62);
      *(_WORD *)(v9 + ((2 * v59) | 2)) = v63;
      v64 = v63 + BYTE2(v62);
      *(_WORD *)(v9 + ((2 * v59) | 4)) = v64;
      v65 = v64 + BYTE1(v62);
      *(_WORD *)(v9 + ((2 * v59) | 6)) = v65;
      v66 = v65 + v62;
      v67 = v66 - v60;
      if (v66 != v60)
      {
        v68 = (_WORD *)(v10 + 2 * v60);
        if (v67 <= 1)
          v67 = 1;
        v69 = 2 * v67;
        v70 = v59;
        do
        {
          v71 = __clz(v62);
          v70 += v71 >> 3;
          v62 = (v62 << (v71 & 0x18)) - 0x1000000;
          *v68++ = v70;
          v69 -= 2;
        }
        while (v69);
        v60 = v66;
      }
    }
    v59 += 4;
  }
  while (v59 < *(unsigned __int16 *)(a1 + 44));
  if (!WORD1(v59))
    goto LABEL_67;
LABEL_72:
  v79 = v12 - 1;
  if (v12 - 1 >= 0)
  {
    v80 = *(_QWORD *)(a2 + 16);
    v81 = *(_QWORD *)(a2 + 24);
    v82 = (v12 - v11);
    v83 = (v12 - 1);
    v84 = *(_QWORD *)(a3 + 16);
    v85 = *(_QWORD *)(a3 + 24);
    do
    {
      v86 = (unsigned __int16 *)(v80 + v81 * v83);
      v87 = (_WORD *)(v84 + v85 * v83);
      if (v83 < v11 || v83 >= v82)
      {
        v89 = v79 - v83;
        if (v83 < v11)
          v89 = v83;
        v90 = *(unsigned __int8 *)(v17 + v89);
        v86 += v90;
        v87 += v90;
        v88 = v6 - 2 * v90;
      }
      else
      {
        v88 = v6;
      }
      v91 = v88 - 1;
      if (v88 != 1)
      {
        v92 = 0;
        v93 = v86[1];
        v94 = *v86;
        do
        {
          v95 = *(_WORD *)(v9 + 2 * v94);
          v96 = *(_WORD *)(v9 + 2 * v93);
          v97 = 0x80000000 - (unsigned __int16)(v93 ^ v94);
          *(_WORD *)(v9 + 2 * v94) = v95 + (v97 >> 30);
          *(_WORD *)(v9 + 2 * v93) = v96 + (v97 >> 30);
          v98 = v86[2];
          v86 += 2;
          v94 = v98;
          v93 = v86[1];
          *v87 = v95;
          v87[1] = v96 + (v97 >> 31);
          v87 += 2;
          v92 += 2;
        }
        while (v92 < v91);
        v91 = v88 & 0xFFFFFFFE;
      }
      v52 = v88 >= v91;
      v99 = v88 - v91;
      if (v99 != 0 && v52)
      {
        do
        {
          v100 = *v86++;
          v101 = *(_WORD *)(v9 + 2 * v100);
          *v87++ = v101;
          *(_WORD *)(v9 + 2 * v100) = v101 + 1;
          --v99;
        }
        while (v99);
      }
    }
    while ((uint64_t)v83-- > 0);
  }
}

uint64_t Hist16CRead_(unsigned __int8 *a1, unsigned int *a2, unsigned int *a3, int *a4)
{
  uint64_t result;
  unint64_t v6;
  unint64_t v7;
  int v8;
  unsigned __int8 *v9;
  int v10;
  int v11;
  BOOL v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned __int8 *v18;
  int v19;
  int v20;
  int v21;
  BOOL v22;
  int v23;
  unsigned __int8 *v25;
  int v26;
  BOOL v27;
  unsigned int v28;
  int v29;
  unsigned int *v30;
  unsigned int v31;
  int v32;
  int v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  int v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  int v65;
  unsigned int v66;
  int v67;
  int v68;
  int v69;
  int v70;
  int v71;
  int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  int v95;
  int v96;
  int v97;
  int v98;
  int v99;
  int v100;
  int v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  int v107;
  int v108;
  int v109;
  int v110;
  int v111;
  int v112;
  int v113;
  int v114;
  int v115;
  int v116;
  int v117;
  int v118;
  int v119;
  int v120;
  int v121;
  int v122;
  int v123;
  int v124;
  int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  int v131;
  int v132;
  int v133;
  int v134;
  int v135;
  int v136;
  int v137;
  int v138;
  int v139;
  int v140;
  int v141;
  int v142;
  int v143;
  int v144;
  int v145;
  int v146;
  int v147;
  int v148;
  int v149;
  int v150;
  int v151;
  int v152;
  int v153;
  int v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  unsigned int v160;
  int v161;
  int v162;
  int v163;
  int v164;
  int v165;
  int v166;
  int v167;
  int v168;
  int v169;
  int v170;
  int v171;
  int v172;
  int v173;
  int v174;
  int v175;
  int v176;
  int v177;
  int v178;
  int v179;
  int v180;
  int v181;
  int v182;
  int v183;
  int v184;
  int v185;
  int v186;
  int v187;
  int v188;
  int v189;
  int v190;
  int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  int v198;
  int v199;
  int v200;
  int v201;
  int v202;
  int v203;
  int v204;
  int v205;
  int v206;
  int v207;
  int v208;
  int v209;
  int v210;
  int v211;
  int v212;
  int v213;
  int v214;
  int v215;
  int v216;
  int v217;
  int v218;
  int v219;
  int v220;

  result = 0;
  if (!a1 || !a2)
    return result;
  v6 = *a3;
  v7 = v6 >> 6;
  v8 = -*a4;
  v9 = &a1[v6 >> 6];
  if (*a4 < 0)
  {
    if (v6 >= 0x100)
    {
      while (1)
      {
        v20 = v8 - a1[v7 - 1];
        if (v20 < 1)
        {
          v28 = v7 - 1;
          goto LABEL_96;
        }
        v8 = v20 - a1[v7 - 2];
        if (v8 < 1)
        {
          v28 = v7 - 2;
          goto LABEL_50;
        }
        v20 = v8 - a1[v7 - 3];
        if (v20 < 1)
          break;
        v8 = v20 - a1[v7 - 4];
        v21 = v7;
        v7 -= 4;
        v22 = v8 < 1 || v21 <= 7;
        if (v22)
        {
          v9 = &a1[v7];
          goto LABEL_35;
        }
      }
      v28 = v7 - 3;
LABEL_96:
      v29 = v8;
      goto LABEL_52;
    }
    v20 = -*a4;
LABEL_35:
    if (v8 >= 1 && (int)v7 >= 1)
    {
      v25 = v9 - 1;
      v20 = v8;
      do
      {
        v26 = *v25--;
        v29 = v20;
        v20 -= v26;
        v28 = v7 - 1;
        v27 = v20 >= 1 && v7 > 1;
        LODWORD(v7) = v7 - 1;
      }
      while (v27);
      goto LABEL_52;
    }
    v28 = v7;
LABEL_50:
    v29 = v20;
  }
  else
  {
    v10 = v7 - 1;
    if (v6 >> 7 > 0x1FE)
    {
      v17 = v7 - 1;
      v16 = -*a4;
      v18 = v9;
LABEL_26:
      if (v8 > 0 || v17 > 1023)
      {
        v28 = v17;
        v29 = v8;
        v8 = v16;
      }
      else
      {
        v29 = v8;
        do
        {
          v8 = v29;
          v28 = v17 + 1;
          v23 = *v18++;
          v12 = __OFADD__(v29, v23);
          v29 += v23;
          if (!((v29 < 0) ^ v12 | (v29 == 0)))
            break;
          v22 = v17++ < 1023;
        }
        while (v22);
      }
    }
    else
    {
      while (1)
      {
        v11 = *v9;
        v12 = __OFADD__(v8, v11);
        v13 = v8 + v11;
        if (!((v13 < 0) ^ v12 | (v13 == 0)))
        {
          v28 = v10 + 1;
          v29 = v13;
          goto LABEL_46;
        }
        v14 = v9[1];
        v12 = __OFADD__(v13, v14);
        v8 = v13 + v14;
        if (!((v8 < 0) ^ v12 | (v8 == 0)))
        {
          v28 = v10 + 2;
          v29 = v8;
          v8 = v13;
          goto LABEL_46;
        }
        v15 = v9[2];
        v16 = v8 + v15;
        if (!((v8 + v15 < 0) ^ __OFADD__(v8, v15) | (v8 + v15 == 0)))
          break;
        v17 = v10 + 4;
        v18 = v9 + 4;
        v19 = v9[3];
        v12 = __OFADD__(v16, v19);
        v8 = v16 + v19;
        if ((v8 < 0) ^ v12 | (v8 == 0))
        {
          v9 += 4;
          v22 = v10 < 1017;
          v10 += 4;
          if (v22)
            continue;
        }
        goto LABEL_26;
      }
      v28 = v10 + 3;
      v29 = v8 + v15;
    }
LABEL_46:
    if (v28 > 0x3FF)
    {
      *a3 = 65472;
      *a4 = a1[1023] - v8;
      return 0xFFFFLL;
    }
  }
  v20 = v8;
LABEL_52:
  result = v28 << 6;
  *a3 = result;
  *a4 = -v20;
  v30 = &a2[2 * (v28 & 0x3FFFFFF)];
  if (v20 + v29 < 0)
  {
    v33 = v30[1];
    v34 = v29 - (v33 & 1);
    if (v34 < 1)
      return result | 0x3F;
    v35 = v34 + (v33 << 30 >> 31);
    if (!v35)
      return result | 0x3E;
    v36 = v35 + (v33 << 29 >> 31);
    if (v36)
    {
      v37 = v36 + (v33 << 28 >> 31);
      if (v37)
      {
        v38 = v37 + (v33 << 27 >> 31);
        if (v38)
        {
          v39 = v38 + (v33 << 26 >> 31);
          if (v39)
          {
            v40 = v39 + (v33 << 25 >> 31);
            if (v40)
            {
              v41 = v40 + ((char)v33 >> 7);
              if (v41)
              {
                v42 = v41 + (v33 << 23 >> 31);
                if (v42)
                {
                  v43 = v42 + (v33 << 22 >> 31);
                  if (v43)
                  {
                    v44 = v43 + (v33 << 21 >> 31);
                    if (v44)
                    {
                      v45 = v44 + (v33 << 20 >> 31);
                      if (v45)
                      {
                        v46 = v45 + (v33 << 19 >> 31);
                        if (v46)
                        {
                          v47 = v46 + (v33 << 18 >> 31);
                          if (v47)
                          {
                            v48 = v47 + (v33 << 17 >> 31);
                            if (v48)
                            {
                              v49 = v48 + ((__int16)v33 >> 15);
                              if (v49)
                              {
                                v50 = v49 + (v33 << 15 >> 31);
                                if (v50)
                                {
                                  v51 = v50 + (v33 << 14 >> 31);
                                  if (v51)
                                  {
                                    v52 = v51 + (v33 << 13 >> 31);
                                    if (v52)
                                    {
                                      v53 = v52 + (v33 << 12 >> 31);
                                      if (v53)
                                      {
                                        v54 = v53 + (v33 << 11 >> 31);
                                        if (v54)
                                        {
                                          v55 = v54 + (v33 << 10 >> 31);
                                          if (v55)
                                          {
                                            v56 = v55 + (v33 << 9 >> 31);
                                            if (v56)
                                            {
                                              v57 = v56 + (v33 << 8 >> 31);
                                              if (v57)
                                              {
                                                v58 = v57 + (v33 << 7 >> 31);
                                                if (v58)
                                                {
                                                  v59 = v58 + (v33 << 6 >> 31);
                                                  if (v59)
                                                  {
                                                    v60 = v59 + ((32 * v33) >> 31);
                                                    if (v60)
                                                    {
                                                      v61 = v60 + ((16 * v33) >> 31);
                                                      if (v61)
                                                      {
                                                        v62 = v61 + ((8 * v33) >> 31);
                                                        if (v62)
                                                        {
                                                          v63 = v62 + ((4 * v33) >> 31);
                                                          if (v63)
                                                          {
                                                            v64 = v63 + ((2 * v33) >> 31);
                                                            if (v64)
                                                            {
                                                              v65 = v64 + (v33 >> 31);
                                                              if (v65)
                                                              {
                                                                v66 = *v30;
                                                                v67 = v65 - (v66 & 1);
                                                                if (v67)
                                                                {
                                                                  v101 = v67 + ((int)(v66 << 30) >> 31);
                                                                  if (v101)
                                                                  {
                                                                    v102 = v101 + ((int)(v66 << 29) >> 31);
                                                                    if (v102)
                                                                    {
                                                                      v103 = v102 + ((int)(v66 << 28) >> 31);
                                                                      if (v103)
                                                                      {
                                                                        v104 = v103 + ((int)(v66 << 27) >> 31);
                                                                        if (v104)
                                                                        {
                                                                          v105 = v104 + ((int)(v66 << 26) >> 31);
                                                                          if (v105)
                                                                          {
                                                                            v106 = v105 + ((int)(v66 << 25) >> 31);
                                                                            if (v106)
                                                                            {
                                                                              v107 = v106 + ((char)v66 >> 7);
                                                                              if (v107)
                                                                              {
                                                                                v108 = v107 + ((int)(v66 << 23) >> 31);
                                                                                if (v108)
                                                                                {
                                                                                  v109 = v108 + ((int)(v66 << 22) >> 31);
                                                                                  if (v109)
                                                                                  {
                                                                                    v110 = v109
                                                                                         + ((int)(v66 << 21) >> 31);
                                                                                    if (v110)
                                                                                    {
                                                                                      v111 = v110
                                                                                           + ((int)(v66 << 20) >> 31);
                                                                                      if (v111)
                                                                                      {
                                                                                        v112 = v111
                                                                                             + ((int)(v66 << 19) >> 31);
                                                                                        if (v112)
                                                                                        {
                                                                                          v113 = v112
                                                                                               + ((int)(v66 << 18) >> 31);
                                                                                          if (v113)
                                                                                          {
                                                                                            v114 = v113
                                                                                                 + ((int)(v66 << 17) >> 31);
                                                                                            if (v114)
                                                                                            {
                                                                                              v115 = v114 + ((__int16)v66 >> 15);
                                                                                              if (v115)
                                                                                              {
                                                                                                v116 = v115 + ((int)(v66 << 15) >> 31);
                                                                                                if (v116)
                                                                                                {
                                                                                                  v117 = v116 + ((int)(v66 << 14) >> 31);
                                                                                                  if (v117)
                                                                                                  {
                                                                                                    v118 = v117 + ((int)(v66 << 13) >> 31);
                                                                                                    if (v118)
                                                                                                    {
                                                                                                      v119 = v118 + ((int)(v66 << 12) >> 31);
                                                                                                      if (v119)
                                                                                                      {
                                                                                                        v120 = v119 + ((int)(v66 << 11) >> 31);
                                                                                                        if (v120)
                                                                                                        {
                                                                                                          v121 = v120 + ((int)(v66 << 10) >> 31);
                                                                                                          if (v121)
                                                                                                          {
                                                                                                            v122 = v121 + ((int)(v66 << 9) >> 31);
                                                                                                            if (v122)
                                                                                                            {
                                                                                                              v123 = v122 + ((int)(v66 << 8) >> 31);
                                                                                                              if (v123)
                                                                                                              {
                                                                                                                v124 = v123 + ((int)(v66 << 7) >> 31);
                                                                                                                if (v124)
                                                                                                                {
                                                                                                                  v125 = v124 + ((int)(v66 << 6) >> 31);
                                                                                                                  if (v125)
                                                                                                                  {
                                                                                                                    v126 = v125 + ((int)(32 * v66) >> 31);
                                                                                                                    if (v126)
                                                                                                                    {
                                                                                                                      v127 = v126 + ((int)(16 * v66) >> 31);
                                                                                                                      if (!v127)
                                                                                                                        return result | 4;
                                                                                                                      v128 = v127 + ((int)(8 * v66) >> 31);
                                                                                                                      if (!v128)
                                                                                                                        return result | 3;
                                                                                                                      v129 = v128 + ((int)(4 * v66) >> 31);
                                                                                                                      if (!v129)
                                                                                                                        return result | 2;
                                                                                                                      v78 = v129 + ((int)(2 * v66) >> 31) == 0;
                                                                                                                      return result | v78;
                                                                                                                    }
LABEL_102:
                                                                                                                    v78 = 5;
                                                                                                                    return result | v78;
                                                                                                                  }
                                                                                                                  return result | 6;
                                                                                                                }
                                                                                                                return result | 7;
                                                                                                              }
                                                                                                              return result | 8;
                                                                                                            }
LABEL_110:
                                                                                                            v78 = 9;
                                                                                                            return result | v78;
                                                                                                          }
LABEL_112:
                                                                                                          v78 = 10;
                                                                                                          return result | v78;
                                                                                                        }
LABEL_114:
                                                                                                        v78 = 11;
                                                                                                        return result | v78;
                                                                                                      }
                                                                                                      return result | 0xC;
                                                                                                    }
LABEL_118:
                                                                                                    v78 = 13;
                                                                                                    return result | v78;
                                                                                                  }
                                                                                                  return result | 0xE;
                                                                                                }
                                                                                                return result | 0xF;
                                                                                              }
                                                                                              return result | 0x10;
                                                                                            }
LABEL_156:
                                                                                            v78 = 17;
                                                                                            return result | v78;
                                                                                          }
LABEL_158:
                                                                                          v78 = 18;
                                                                                          return result | v78;
                                                                                        }
LABEL_160:
                                                                                        v78 = 19;
                                                                                        return result | v78;
                                                                                      }
LABEL_162:
                                                                                      v78 = 20;
                                                                                      return result | v78;
                                                                                    }
LABEL_164:
                                                                                    v78 = 21;
                                                                                    return result | v78;
                                                                                  }
LABEL_166:
                                                                                  v78 = 22;
                                                                                  return result | v78;
                                                                                }
LABEL_168:
                                                                                v78 = 23;
                                                                                return result | v78;
                                                                              }
                                                                              return result | 0x18;
                                                                            }
LABEL_172:
                                                                            v78 = 25;
                                                                            return result | v78;
                                                                          }
LABEL_174:
                                                                          v78 = 26;
                                                                          return result | v78;
                                                                        }
LABEL_176:
                                                                        v78 = 27;
                                                                        return result | v78;
                                                                      }
                                                                      return result | 0x1C;
                                                                    }
LABEL_180:
                                                                    v78 = 29;
                                                                    return result | v78;
                                                                  }
                                                                  return result | 0x1E;
                                                                }
                                                                return result | 0x1F;
                                                              }
                                                              return result | 0x20;
                                                            }
LABEL_188:
                                                            v78 = 33;
                                                            return result | v78;
                                                          }
LABEL_190:
                                                          v78 = 34;
                                                          return result | v78;
                                                        }
LABEL_192:
                                                        v78 = 35;
                                                        return result | v78;
                                                      }
LABEL_194:
                                                      v78 = 36;
                                                      return result | v78;
                                                    }
LABEL_196:
                                                    v78 = 37;
                                                    return result | v78;
                                                  }
LABEL_198:
                                                  v78 = 38;
                                                  return result | v78;
                                                }
LABEL_200:
                                                v78 = 39;
                                                return result | v78;
                                              }
LABEL_202:
                                              v78 = 40;
                                              return result | v78;
                                            }
LABEL_204:
                                            v78 = 41;
                                            return result | v78;
                                          }
LABEL_206:
                                          v78 = 42;
                                          return result | v78;
                                        }
LABEL_208:
                                        v78 = 43;
                                        return result | v78;
                                      }
LABEL_210:
                                      v78 = 44;
                                      return result | v78;
                                    }
LABEL_212:
                                    v78 = 45;
                                    return result | v78;
                                  }
LABEL_214:
                                  v78 = 46;
                                  return result | v78;
                                }
LABEL_216:
                                v78 = 47;
                                return result | v78;
                              }
                              return result | 0x30;
                            }
LABEL_220:
                            v78 = 49;
                            return result | v78;
                          }
LABEL_222:
                          v78 = 50;
                          return result | v78;
                        }
LABEL_224:
                        v78 = 51;
                        return result | v78;
                      }
LABEL_226:
                      v78 = 52;
                      return result | v78;
                    }
LABEL_228:
                    v78 = 53;
                    return result | v78;
                  }
LABEL_230:
                  v78 = 54;
                  return result | v78;
                }
LABEL_232:
                v78 = 55;
                return result | v78;
              }
              return result | 0x38;
            }
LABEL_236:
            v78 = 57;
            return result | v78;
          }
LABEL_238:
          v78 = 58;
          return result | v78;
        }
LABEL_240:
        v78 = 59;
        return result | v78;
      }
      return result | 0x3C;
    }
LABEL_244:
    v78 = 61;
    return result | v78;
  }
  v31 = *v30;
  v32 = v20 + (*v30 >> 31);
  if (v32 > 0)
    return result;
  v68 = (v31 >> 30) & 1;
  v12 = __OFADD__(v32, v68);
  v69 = v32 + v68;
  if (!((v69 < 0) ^ v12 | (v69 == 0)))
    return result | 1;
  v70 = (v31 >> 29) & 1;
  v12 = __OFADD__(v69, v70);
  v71 = v69 + v70;
  if (!((v71 < 0) ^ v12 | (v71 == 0)))
    return result | 2;
  v72 = (v31 >> 28) & 1;
  v12 = __OFADD__(v71, v72);
  v73 = v71 + v72;
  if (!((v73 < 0) ^ v12 | (v73 == 0)))
    return result | 3;
  v74 = (v31 >> 27) & 1;
  v12 = __OFADD__(v73, v74);
  v75 = v73 + v74;
  if (!((v75 < 0) ^ v12 | (v75 == 0)))
    return result | 4;
  v76 = (v31 >> 26) & 1;
  v12 = __OFADD__(v75, v76);
  v77 = v75 + v76;
  if (!((v77 < 0) ^ v12 | (v77 == 0)))
    goto LABEL_102;
  v79 = (v31 >> 25) & 1;
  v12 = __OFADD__(v77, v79);
  v80 = v77 + v79;
  if (!((v80 < 0) ^ v12 | (v80 == 0)))
    return result | 6;
  v81 = HIBYTE(v31) & 1;
  v12 = __OFADD__(v80, v81);
  v82 = v80 + v81;
  if (!((v82 < 0) ^ v12 | (v82 == 0)))
    return result | 7;
  v83 = (v31 >> 23) & 1;
  v12 = __OFADD__(v82, v83);
  v84 = v82 + v83;
  if (!((v84 < 0) ^ v12 | (v84 == 0)))
    return result | 8;
  v85 = (v31 >> 22) & 1;
  v12 = __OFADD__(v84, v85);
  v86 = v84 + v85;
  if (!((v86 < 0) ^ v12 | (v86 == 0)))
    goto LABEL_110;
  v87 = (v31 >> 21) & 1;
  v12 = __OFADD__(v86, v87);
  v88 = v86 + v87;
  if (!((v88 < 0) ^ v12 | (v88 == 0)))
    goto LABEL_112;
  v89 = (v31 >> 20) & 1;
  v12 = __OFADD__(v88, v89);
  v90 = v88 + v89;
  if (!((v90 < 0) ^ v12 | (v90 == 0)))
    goto LABEL_114;
  v91 = (v31 >> 19) & 1;
  v12 = __OFADD__(v90, v91);
  v92 = v90 + v91;
  if (!((v92 < 0) ^ v12 | (v92 == 0)))
    return result | 0xC;
  v93 = (v31 >> 18) & 1;
  v12 = __OFADD__(v92, v93);
  v94 = v92 + v93;
  if (!((v94 < 0) ^ v12 | (v94 == 0)))
    goto LABEL_118;
  v95 = (v31 >> 17) & 1;
  v12 = __OFADD__(v94, v95);
  v96 = v94 + v95;
  if (!((v96 < 0) ^ v12 | (v96 == 0)))
    return result | 0xE;
  v97 = HIWORD(v31) & 1;
  v12 = __OFADD__(v96, v97);
  v98 = v96 + v97;
  if (!((v98 < 0) ^ v12 | (v98 == 0)))
    return result | 0xF;
  v99 = (v31 >> 15) & 1;
  v12 = __OFADD__(v98, v99);
  v100 = v98 + v99;
  if (!((v100 < 0) ^ v12 | (v100 == 0)))
    return result | 0x10;
  v130 = (v31 >> 14) & 1;
  v12 = __OFADD__(v100, v130);
  v131 = v100 + v130;
  if (!((v131 < 0) ^ v12 | (v131 == 0)))
    goto LABEL_156;
  v132 = (v31 >> 13) & 1;
  v12 = __OFADD__(v131, v132);
  v133 = v131 + v132;
  if (!((v133 < 0) ^ v12 | (v133 == 0)))
    goto LABEL_158;
  v134 = (v31 >> 12) & 1;
  v12 = __OFADD__(v133, v134);
  v135 = v133 + v134;
  if (!((v135 < 0) ^ v12 | (v135 == 0)))
    goto LABEL_160;
  v136 = (v31 >> 11) & 1;
  v12 = __OFADD__(v135, v136);
  v137 = v135 + v136;
  if (!((v137 < 0) ^ v12 | (v137 == 0)))
    goto LABEL_162;
  v138 = (v31 >> 10) & 1;
  v12 = __OFADD__(v137, v138);
  v139 = v137 + v138;
  if (!((v139 < 0) ^ v12 | (v139 == 0)))
    goto LABEL_164;
  v140 = (v31 >> 9) & 1;
  v12 = __OFADD__(v139, v140);
  v141 = v139 + v140;
  if (!((v141 < 0) ^ v12 | (v141 == 0)))
    goto LABEL_166;
  v142 = (v31 >> 8) & 1;
  v12 = __OFADD__(v141, v142);
  v143 = v141 + v142;
  if (!((v143 < 0) ^ v12 | (v143 == 0)))
    goto LABEL_168;
  v144 = (v31 >> 7) & 1;
  v12 = __OFADD__(v143, v144);
  v145 = v143 + v144;
  if (!((v145 < 0) ^ v12 | (v145 == 0)))
    return result | 0x18;
  v146 = (v31 >> 6) & 1;
  v12 = __OFADD__(v145, v146);
  v147 = v145 + v146;
  if (!((v147 < 0) ^ v12 | (v147 == 0)))
    goto LABEL_172;
  v148 = (v31 >> 5) & 1;
  v12 = __OFADD__(v147, v148);
  v149 = v147 + v148;
  if (!((v149 < 0) ^ v12 | (v149 == 0)))
    goto LABEL_174;
  v150 = (v31 >> 4) & 1;
  v12 = __OFADD__(v149, v150);
  v151 = v149 + v150;
  if (!((v151 < 0) ^ v12 | (v151 == 0)))
    goto LABEL_176;
  v152 = (v31 >> 3) & 1;
  v12 = __OFADD__(v151, v152);
  v153 = v151 + v152;
  if (!((v153 < 0) ^ v12 | (v153 == 0)))
    return result | 0x1C;
  v154 = (v31 >> 2) & 1;
  v12 = __OFADD__(v153, v154);
  v155 = v153 + v154;
  if (!((v155 < 0) ^ v12 | (v155 == 0)))
    goto LABEL_180;
  v156 = (v31 >> 1) & 1;
  v12 = __OFADD__(v155, v156);
  v157 = v155 + v156;
  if (!((v157 < 0) ^ v12 | (v157 == 0)))
    return result | 0x1E;
  v158 = *v30 & 1;
  v12 = __OFADD__(v157, v158);
  v159 = v157 + v158;
  if (!((v159 < 0) ^ v12 | (v159 == 0)))
    return result | 0x1F;
  v160 = v30[1];
  v161 = v159 + (v160 >> 31);
  if (v161 > 0)
    return result | 0x20;
  v162 = (v160 >> 30) & 1;
  v12 = __OFADD__(v161, v162);
  v163 = v161 + v162;
  if (!((v163 < 0) ^ v12 | (v163 == 0)))
    goto LABEL_188;
  v164 = (v160 >> 29) & 1;
  v12 = __OFADD__(v163, v164);
  v165 = v163 + v164;
  if (!((v165 < 0) ^ v12 | (v165 == 0)))
    goto LABEL_190;
  v166 = (v160 >> 28) & 1;
  v12 = __OFADD__(v165, v166);
  v167 = v165 + v166;
  if (!((v167 < 0) ^ v12 | (v167 == 0)))
    goto LABEL_192;
  v168 = (v160 >> 27) & 1;
  v12 = __OFADD__(v167, v168);
  v169 = v167 + v168;
  if (!((v169 < 0) ^ v12 | (v169 == 0)))
    goto LABEL_194;
  v170 = (v160 >> 26) & 1;
  v12 = __OFADD__(v169, v170);
  v171 = v169 + v170;
  if (!((v171 < 0) ^ v12 | (v171 == 0)))
    goto LABEL_196;
  v172 = (v160 >> 25) & 1;
  v12 = __OFADD__(v171, v172);
  v173 = v171 + v172;
  if (!((v173 < 0) ^ v12 | (v173 == 0)))
    goto LABEL_198;
  v174 = HIBYTE(v160) & 1;
  v12 = __OFADD__(v173, v174);
  v175 = v173 + v174;
  if (!((v175 < 0) ^ v12 | (v175 == 0)))
    goto LABEL_200;
  v176 = (v160 >> 23) & 1;
  v12 = __OFADD__(v175, v176);
  v177 = v175 + v176;
  if (!((v177 < 0) ^ v12 | (v177 == 0)))
    goto LABEL_202;
  v178 = (v160 >> 22) & 1;
  v12 = __OFADD__(v177, v178);
  v179 = v177 + v178;
  if (!((v179 < 0) ^ v12 | (v179 == 0)))
    goto LABEL_204;
  v180 = (v160 >> 21) & 1;
  v12 = __OFADD__(v179, v180);
  v181 = v179 + v180;
  if (!((v181 < 0) ^ v12 | (v181 == 0)))
    goto LABEL_206;
  v182 = (v160 >> 20) & 1;
  v12 = __OFADD__(v181, v182);
  v183 = v181 + v182;
  if (!((v183 < 0) ^ v12 | (v183 == 0)))
    goto LABEL_208;
  v184 = (v160 >> 19) & 1;
  v12 = __OFADD__(v183, v184);
  v185 = v183 + v184;
  if (!((v185 < 0) ^ v12 | (v185 == 0)))
    goto LABEL_210;
  v186 = (v160 >> 18) & 1;
  v12 = __OFADD__(v185, v186);
  v187 = v185 + v186;
  if (!((v187 < 0) ^ v12 | (v187 == 0)))
    goto LABEL_212;
  v188 = (v160 >> 17) & 1;
  v12 = __OFADD__(v187, v188);
  v189 = v187 + v188;
  if (!((v189 < 0) ^ v12 | (v189 == 0)))
    goto LABEL_214;
  v190 = HIWORD(v160) & 1;
  v12 = __OFADD__(v189, v190);
  v191 = v189 + v190;
  if (!((v191 < 0) ^ v12 | (v191 == 0)))
    goto LABEL_216;
  v192 = (v160 >> 15) & 1;
  v12 = __OFADD__(v191, v192);
  v193 = v191 + v192;
  if (!((v193 < 0) ^ v12 | (v193 == 0)))
    return result | 0x30;
  v194 = (v160 >> 14) & 1;
  v12 = __OFADD__(v193, v194);
  v195 = v193 + v194;
  if (!((v195 < 0) ^ v12 | (v195 == 0)))
    goto LABEL_220;
  v196 = (v160 >> 13) & 1;
  v12 = __OFADD__(v195, v196);
  v197 = v195 + v196;
  if (!((v197 < 0) ^ v12 | (v197 == 0)))
    goto LABEL_222;
  v198 = (v160 >> 12) & 1;
  v12 = __OFADD__(v197, v198);
  v199 = v197 + v198;
  if (!((v199 < 0) ^ v12 | (v199 == 0)))
    goto LABEL_224;
  v200 = (v160 >> 11) & 1;
  v12 = __OFADD__(v199, v200);
  v201 = v199 + v200;
  if (!((v201 < 0) ^ v12 | (v201 == 0)))
    goto LABEL_226;
  v202 = (v160 >> 10) & 1;
  v12 = __OFADD__(v201, v202);
  v203 = v201 + v202;
  if (!((v203 < 0) ^ v12 | (v203 == 0)))
    goto LABEL_228;
  v204 = (v160 >> 9) & 1;
  v12 = __OFADD__(v203, v204);
  v205 = v203 + v204;
  if (!((v205 < 0) ^ v12 | (v205 == 0)))
    goto LABEL_230;
  v206 = (v160 >> 8) & 1;
  v12 = __OFADD__(v205, v206);
  v207 = v205 + v206;
  if (!((v207 < 0) ^ v12 | (v207 == 0)))
    goto LABEL_232;
  v208 = (v160 >> 7) & 1;
  v12 = __OFADD__(v207, v208);
  v209 = v207 + v208;
  if (!((v209 < 0) ^ v12 | (v209 == 0)))
    return result | 0x38;
  v210 = (v160 >> 6) & 1;
  v12 = __OFADD__(v209, v210);
  v211 = v209 + v210;
  if (!((v211 < 0) ^ v12 | (v211 == 0)))
    goto LABEL_236;
  v212 = (v160 >> 5) & 1;
  v12 = __OFADD__(v211, v212);
  v213 = v211 + v212;
  if (!((v213 < 0) ^ v12 | (v213 == 0)))
    goto LABEL_238;
  v214 = (v160 >> 4) & 1;
  v12 = __OFADD__(v213, v214);
  v215 = v213 + v214;
  if (!((v215 < 0) ^ v12 | (v215 == 0)))
    goto LABEL_240;
  v216 = (v160 >> 3) & 1;
  v12 = __OFADD__(v215, v216);
  v217 = v215 + v216;
  if (!((v217 < 0) ^ v12 | (v217 == 0)))
    return result | 0x3C;
  v218 = (v160 >> 2) & 1;
  v12 = __OFADD__(v217, v218);
  v219 = v217 + v218;
  if (!((v219 < 0) ^ v12 | (v219 == 0)))
    goto LABEL_244;
  if ((int)(v219 + ((v160 >> 1) & 1)) >= 1)
    v220 = 62;
  else
    v220 = 63;
  return v220 | result;
}

CMedian::CKernel16C *CMedian::CKernel16C::CKernel16C(CMedian::CKernel16C *this, const CMedian::CxParms *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = *((_QWORD *)a2 + 1);
  *(_QWORD *)this = &off_1E5014928;
  *((_BYTE *)this + 8) = 0;
  *((_QWORD *)this + 2) = v4;
  *((_QWORD *)this + 3) = 0x100000001;
  *((_WORD *)this + 16) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_OWORD *)this + 3) = 0u;
  *((_DWORD *)this + 16) = 0;
  bzero((char *)this + 72, 0x3000uLL);
  *(_OWORD *)((char *)this + 12616) = 0u;
  pthread_mutex_init((pthread_mutex_t *)((char *)this + 12632), 0);
  *((_BYTE *)this + 8) = 1;
  *((_QWORD *)this + 1587) = a2;
  *(_QWORD *)this = &off_1E5014A28;
  v5 = *((_QWORD *)a2 + 2);
  *((_QWORD *)this + 1588) = &off_1E50148B0;
  *((_BYTE *)this + 12712) = 0;
  *((_QWORD *)this + 1590) = v5;
  if (!v5 || !(*(unsigned int (**)(uint64_t))(*(_QWORD *)v5 + 80))(v5))
    *((_BYTE *)this + 12712) = 1;
  return this;
}

void sub_1A64BEF5C(_Unwind_Exception *a1)
{
  CKernel *v1;

  CKernel::~CKernel(v1);
  _Unwind_Resume(a1);
}

void CGrid::~CGrid(CGrid *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_1E5014858;
  if (*((_BYTE *)this + 137))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
      *((_QWORD *)this + 1) = 0;
    }
  }
  *((_BYTE *)this + 136) = 0;
}

{
  uint64_t v2;

  *(_QWORD *)this = off_1E5014858;
  if (*((_BYTE *)this + 137))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  --CMemEnv::excount;
  free(this);
}

double CGrid::Description(uint64_t a1, uint64_t a2)
{
  double result;
  _QWORD v4[2];
  __int128 v5;
  int v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;

  (*(void (**)(_QWORD *__return_ptr))(*(_QWORD *)a1 + 24))(v4);
  *(_QWORD *)(a2 + 8) = v4[1];
  *(_OWORD *)(a2 + 16) = v5;
  *(_DWORD *)(a2 + 32) = v6;
  *(_OWORD *)(a2 + 40) = v7;
  *(_OWORD *)(a2 + 56) = v8;
  result = *(double *)&v9;
  *(_OWORD *)(a2 + 72) = v9;
  return result;
}

uint64_t CGrid::Description@<X0>(uint64_t this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v2 = *(_QWORD *)(this + 8);
  *(_QWORD *)a2 = off_1E5014838;
  if (v2)
  {
    *(_OWORD *)(a2 + 56) = 0u;
    *(_OWORD *)(a2 + 72) = 0u;
    v3 = *(_QWORD *)(v2 + 32);
    v4 = *(_QWORD *)(this + 104);
    v5 = *(_QWORD *)(this + 112);
    *(_DWORD *)(a2 + 32) = 2;
    v6 = *(_QWORD *)(this + 120);
    v7 = *(_QWORD *)(this + 128);
    *(_QWORD *)(a2 + 64) = v4;
    *(_QWORD *)(a2 + 72) = v5;
    *(_QWORD *)(a2 + 40) = v6;
    *(_QWORD *)(a2 + 48) = v7;
    *(_QWORD *)(a2 + 8) = v3;
    *(_QWORD *)(a2 + 16) = v7 * v5;
    *(_QWORD *)(a2 + 24) = 0;
  }
  else
  {
    *(_QWORD *)(a2 + 8) = *(_QWORD *)(this + 24);
    *(_OWORD *)(a2 + 16) = *(_OWORD *)(this + 32);
    *(_DWORD *)(a2 + 32) = *(_DWORD *)(this + 48);
    v8 = a2 + 64;
    v9 = this + 56;
    do
    {
      v10 = (_QWORD *)(v8 + v2);
      *(v10 - 3) = *(_QWORD *)(v9 + v2);
      *v10 = *(_QWORD *)(v9 + v2 + 24);
      v2 += 8;
    }
    while (v2 != 24);
  }
  return this;
}

uint64_t CGrid::Lock(CGrid *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 1);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 80))(result);
  return result;
}

uint64_t CGrid::Unlock(CGrid *this)
{
  uint64_t result;

  result = *((_QWORD *)this + 1);
  if (result)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 88))(result);
  return result;
}

uint64_t CGrid::Locked(CGrid *this)
{
  uint64_t v1;

  v1 = *((_QWORD *)this + 1);
  if (v1)
    return (*(uint64_t (**)(uint64_t))(*(_QWORD *)v1 + 48))(v1);
  else
    return 1;
}

uint64_t CGrid::Unlocked(CGrid *this)
{
  return (*(unsigned int (**)(CGrid *))(*(_QWORD *)this + 48))(this) ^ 1;
}

uint64_t CGrid::Zero(uint64_t a1, int32x2_t *a2)
{
  int32x2_t v3;
  int32x2_t v4;
  int32x2_t v5;
  uint64_t v6;
  char **v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int32x2_t v11;
  int32x2_t v12;
  uint64_t v13;
  char *v15;
  int32x2_t v16;
  int64x2_t v17;
  uint64_t v18;
  size_t v19;
  int32x2_t v20;
  _QWORD v21[2];
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int64x2_t v26;
  uint64_t v27;
  __int16 v28;

  v3 = vmovn_s64(*(int64x2_t *)(a1 + 104));
  if (a2)
  {
    v3 = vmin_s32(v3, a2[1]);
    v4 = vmax_s32(*a2, 0);
  }
  else
  {
    v4 = 0;
  }
  v5 = vcgt_s32(v3, v4);
  if ((v5.i32[0] & v5.i32[1] & 1) == 0)
    return 0;
  v20 = v4;
  v21[0] = off_1E5014778;
  v21[1] = a1;
  v28 = 0;
  if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1))
  {
    v6 = *(_QWORD *)(a1 + 8);
    if (v6)
      v7 = (char **)(v6 + 32);
    else
      v7 = (char **)(a1 + 24);
    v8 = *v7;
    v9 = *(_QWORD *)(a1 + 120);
    v10 = *(_QWORD *)(a1 + 128);
    v22 = v8;
    v23 = v10;
    v24 = v9;
    v25 = 0;
    v26 = *(int64x2_t *)(a1 + 104);
    v27 = 1;
    v11 = vmin_s32(v3, vmovn_s64(v26));
    v12 = vcge_s32(v20, v11);
    if (((v12.i32[0] | v12.i32[1]) & 1) == 0)
    {
      v15 = &v8[v9 * v20.u32[0] + v10 * v20.u32[1]];
      v22 = v15;
      v16 = vsub_s32(v11, v20);
      v17.i64[0] = v16.i32[0];
      v17.i64[1] = v16.i32[1];
      v26 = v17;
      v18 = v16.i32[1];
      LOBYTE(v28) = 1;
      if (v16.i32[1])
      {
        v19 = (v9 * v16.i32[0]);
        do
        {
          bzero(v15, v19);
          v15 += v10;
          --v18;
        }
        while (v18);
      }
      v13 = 0;
      goto LABEL_12;
    }
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
    LOBYTE(v28) = 0;
  }
  v13 = 7;
LABEL_12:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v21);
  return v13;
}

void CGrNavigator::~CGrNavigator(CGrNavigator *this)
{
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)this = off_1E5014778;
  if (*((_BYTE *)this + 72))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 40))(v2);
      if (*((_BYTE *)this + 73))
      {
        v3 = *((_QWORD *)this + 1);
        if (v3)
          (*(void (**)(uint64_t))(*(_QWORD *)v3 + 8))(v3);
      }
      *((_QWORD *)this + 1) = 0;
    }
  }
  *((_BYTE *)this + 72) = 0;
}

{
  void *v1;

  CGrNavigator::~CGrNavigator(this);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

void CGridP::~CGridP(CGridP *this)
{
  uint64_t v2;

  *(_QWORD *)this = off_1E5014858;
  if (*((_BYTE *)this + 137))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
      *((_QWORD *)this + 1) = 0;
    }
  }
  *((_BYTE *)this + 136) = 0;
}

{
  uint64_t v2;

  *(_QWORD *)this = off_1E5014858;
  if (*((_BYTE *)this + 137))
  {
    v2 = *((_QWORD *)this + 1);
    if (v2)
      (*(void (**)(uint64_t))(*(_QWORD *)v2 + 8))(v2);
  }
  --CMemEnv::excount;
  free(this);
}

uint64_t CGridP::Zero(uint64_t a1, int32x2_t *a2)
{
  int32x2_t v3;
  int32x2_t v4;
  int32x2_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int32x2_t v12;
  int32x2_t v13;
  int v14;
  int32x2_t v15;
  int64x2_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  int32x2_t v21;
  _QWORD v22[2];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int64x2_t v27;
  uint64_t v28;
  __int16 v29;

  v3 = vmovn_s64(*(int64x2_t *)(a1 + 104));
  if (a2)
  {
    v3 = vmin_s32(v3, a2[1]);
    v4 = vmax_s32(*a2, 0);
  }
  else
  {
    v4 = 0;
  }
  v21 = v4;
  v5 = vcgt_s32(v3, v4);
  if ((v5.i32[0] & v5.i32[1] & 1) == 0 || !*(_QWORD *)(a1 + 144))
    return 0;
  v6 = 0;
  while (1)
  {
    v22[0] = off_1E5014778;
    v22[1] = a1;
    v29 = 0;
    if (!(*(unsigned int (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1))
      break;
    if (!(_BYTE)v29)
      goto LABEL_22;
LABEL_17:
    v17 = v27.i64[1];
    if (v27.i64[1])
    {
      v18 = 0;
      v19 = (v25 * v27.i32[0]);
      do
        bzero((void *)(v23 + v24 * v18++), v19);
      while (v17 != v18);
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
    if ((unint64_t)++v6 >= *(_QWORD *)(a1 + 144))
      return 0;
  }
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
    v8 = (_QWORD *)(v7 + 32);
  else
    v8 = (_QWORD *)(a1 + 24);
  v9 = *v8 + *(_QWORD *)(a1 + 152) * v6;
  v11 = *(_QWORD *)(a1 + 120);
  v10 = *(_QWORD *)(a1 + 128);
  v23 = v9;
  v24 = v10;
  v25 = v11;
  v26 = 0;
  v27 = *(int64x2_t *)(a1 + 104);
  v28 = 1;
  v12 = vmin_s32(v3, vmovn_s64(v27));
  v13 = vcge_s32(v21, v12);
  if (((v13.i32[0] | v13.i32[1]) & 1) != 0)
  {
    (*(void (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
    v14 = 0;
  }
  else
  {
    v23 = v9 + v11 * v21.u32[0] + v10 * v21.u32[1];
    v15 = vsub_s32(v12, v21);
    v16.i64[0] = v15.i32[0];
    v16.i64[1] = v15.i32[1];
    v27 = v16;
    v14 = 1;
  }
  LOBYTE(v29) = v14;
  if (v14)
    goto LABEL_17;
LABEL_22:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v22);
  return 7;
}

void CGrNavigator::CGrNavigator(CGrNavigator *this, CMemEnv *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  char *v10;
  unint64_t v11;
  uint64_t v12;
  CMemBlock *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;

  *(_QWORD *)this = off_1E5014778;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = a5;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = a3;
  *((_QWORD *)this + 7) = a4;
  *((_QWORD *)this + 8) = 1;
  *((_BYTE *)this + 72) = 0;
  v10 = (char *)CBaseObject::operator new((CBaseObject *)0xA0);
  *((_QWORD *)v10 + 3) = 0;
  *((_QWORD *)v10 + 1) = 0;
  *((_QWORD *)v10 + 2) = off_1E5014838;
  *((_QWORD *)v10 + 4) = 0;
  *((_QWORD *)v10 + 5) = 0;
  *((_DWORD *)v10 + 12) = 0;
  *(_OWORD *)(v10 + 56) = 0u;
  *(_OWORD *)(v10 + 72) = 0u;
  *(_OWORD *)(v10 + 88) = 0u;
  *(_QWORD *)v10 = off_1E50148D0;
  *((_QWORD *)v10 + 13) = a3;
  *((_QWORD *)v10 + 14) = a4;
  *((_WORD *)v10 + 68) = 256;
  v11 = (a5 * a3 + 31) & 0xFFFFFFFFFFFFFFE0;
  *((_QWORD *)v10 + 15) = a5;
  *((_QWORD *)v10 + 16) = v11;
  v12 = v11 * a4;
  *((_QWORD *)v10 + 18) = 1;
  *((_QWORD *)v10 + 19) = v12;
  v13 = (CMemBlock *)CBaseObject::operator new((CBaseObject *)0x40);
  CMemBlock::CMemBlock(v13, a2, v12, 1, 32);
  *((_QWORD *)v10 + 1) = v13;
  if (v13)
  {
    if (((*(uint64_t (**)(CMemBlock *))(*(_QWORD *)v13 + 32))(v13) & 1) != 0)
    {
      v10[136] = 1;
      v14 = *(_QWORD *)v10;
      goto LABEL_8;
    }
    v15 = *((_QWORD *)v10 + 1);
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 8))(v15);
    *((_QWORD *)v10 + 1) = 0;
  }
  v14 = *(_QWORD *)v10;
  if (!v10[136])
  {
LABEL_10:
    (*(void (**)(char *))(v14 + 8))(v10);
    return;
  }
LABEL_8:
  if ((*(unsigned int (**)(char *))(v14 + 32))(v10))
  {
    v14 = *(_QWORD *)v10;
    goto LABEL_10;
  }
  v16 = *((_QWORD *)v10 + 1);
  if (v16)
    v17 = (uint64_t *)(v16 + 32);
  else
    v17 = (uint64_t *)(v10 + 24);
  v18 = *v17;
  *((_QWORD *)this + 3) = *((_QWORD *)v10 + 16);
  *((_QWORD *)this + 5) = *((_QWORD *)v10 + 19);
  *((_QWORD *)this + 1) = v10;
  *((_QWORD *)this + 2) = v18;
  *((_WORD *)this + 36) = 257;
}

void sub_1A64BF790(_Unwind_Exception *a1)
{
  _QWORD *v1;
  void *v2;
  uint64_t v4;

  CBaseRef::operator delete(v2);
  *v1 = off_1E5014858;
  if (*((_BYTE *)v1 + 137))
  {
    v4 = v1[1];
    if (v4)
    {
      (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
      v1[1] = 0;
    }
  }
  *((_BYTE *)v1 + 136) = 0;
  --CMemEnv::excount;
  free(v1);
  _Unwind_Resume(a1);
}

uint64_t CMedian::CKernel8x16::Process_(CMedian::CKernel8x16 *this, int64x2_t *a2, int64x2_t *a3, unsigned int a4, int64x2_t *a5)
{
  unint64_t v5;
  int v9;
  uint16x8_t *v10;
  unsigned int v11;
  unsigned int v12;
  int32x2_t v13;
  int32x2_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  uint64_t v18;
  int64x2_t v19;
  int32x2_t v20;
  __int128 v21;
  int32x2_t v22;
  int32x2_t v23;
  uint64_t v24;
  int64x2_t v25;
  int32x2_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int32x2_t v32;
  int32x2_t v33;
  uint64_t v34;
  int64x2_t v35;
  int32x2_t v36;
  __int128 v37;
  int v39;
  uint64_t v40;
  int32x2_t v41;
  int32x2_t v42;
  _QWORD v43[4];
  int64x2_t v44;
  __int128 v45;
  uint64_t v46;
  __int16 v47;
  _QWORD v48[4];
  int64x2_t v49;
  __int128 v50;
  uint64_t v51;
  __int16 v52;
  _QWORD v53[2];
  uint64_t v54;
  uint64_t v55;
  int64x2_t v56;
  __int128 v57;
  uint64_t v58;
  __int16 v59;

  v5 = a3[3].u64[0];
  if (v5 >= 0x10)
  {
    v40 = *((_QWORD *)this + 1587);
    v9 = *(_DWORD *)(v40 + 24);
    v10 = (uint16x8_t *)malloc_type_calloc(0x22E0uLL, 1uLL, 0x69BF368BuLL);
    if ((_DWORD)v5)
    {
      v11 = 0;
      v39 = 2 * v9;
      do
      {
        v12 = v5 - 16;
        if (v11 + 16 <= v5)
          v12 = v11;
        v11 = v12 + 16;
        v13.i32[0] = v12 + 16 + v39;
        v13.i32[1] = a2[3].i32[2];
        v14.i32[0] = v12 + 16;
        v14.i32[1] = a3[3].i32[2];
        v59 = 0;
        v53[1] = 0;
        v15 = vmax_s32((int32x2_t)v12, 0);
        v16 = vmin_s32(vmovn_s64(a2[3]), v13);
        v17 = vcge_s32(v15, v16);
        if (((v17.i32[0] | v17.i32[1]) & 1) == 0)
        {
          v18 = a2[1].i64[1];
          v19 = a2[2];
          v54 = a2[1].i64[0] + v18 * v15.u32[1] + a2[2].i64[0] * v15.u32[0];
          v55 = v18;
          v20 = vsub_s32(v16, v15);
          *(_QWORD *)&v21 = v20.i32[0];
          *((_QWORD *)&v21 + 1) = v20.i32[1];
          v56 = v19;
          v57 = v21;
          v58 = a2[4].i64[0];
          LOBYTE(v59) = 1;
        }
        v53[0] = off_1E50147D8;
        v52 = 0;
        v48[1] = 0;
        v41 = v14;
        v22 = vmin_s32(vmovn_s64(a3[3]), v14);
        v23 = vcge_s32(v15, v22);
        if (((v23.i32[0] | v23.i32[1]) & 1) == 0)
        {
          v24 = a3[1].i64[1];
          v25 = a3[2];
          v48[2] = a3[1].i64[0] + v24 * v15.u32[1] + a3[2].i64[0] * v15.u32[0];
          v48[3] = v24;
          v26 = vsub_s32(v22, v15);
          *(_QWORD *)&v27 = v26.i32[0];
          *((_QWORD *)&v27 + 1) = v26.i32[1];
          v49 = v25;
          v50 = v27;
          v51 = a3[4].i64[0];
          LOBYTE(v52) = 1;
        }
        v42 = v15;
        v48[0] = off_1E5014818;
        v28 = (v57 - 15);
        bzero(v10, 0x22E0uLL);
        if ((_DWORD)v28)
        {
          v29 = v54;
          v30 = v55;
          v31 = v28;
          do
          {
            Hist8x16Inc((uint64_t)v10, v29, v28);
            v29 += v30;
            --v31;
          }
          while (v31);
        }
        if (a5)
        {
          v47 = 0;
          v43[1] = 0;
          v32 = vmin_s32(vmovn_s64(a5[3]), v41);
          v33 = vcge_s32(v42, v32);
          if (((v33.i32[0] | v33.i32[1]) & 1) == 0)
          {
            v34 = a5[1].i64[1];
            v35 = a5[2];
            v43[2] = a5[1].i64[0] + v34 * v42.u32[1] + a5[2].i64[0] * v42.u32[0];
            v43[3] = v34;
            v36 = vsub_s32(v32, v42);
            *(_QWORD *)&v37 = v36.i32[0];
            *((_QWORD *)&v37 + 1) = v36.i32[1];
            v44 = v35;
            v45 = v37;
            v46 = a5[4].i64[0];
            LOBYTE(v47) = 1;
          }
          v43[0] = off_1E50147D8;
          Median8x16Strip_(v40, (uint64_t)v53, v48, v10);
          CGrNavigator::~CGrNavigator((CGrNavigator *)v43);
        }
        else
        {
          Median8x16Strip_(v40, (uint64_t)v53, v48, v10);
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v48);
        CGrNavigator::~CGrNavigator((CGrNavigator *)v53);
      }
      while (v11 < v5);
    }
    free(v10);
  }
  return 0;
}

void CMedian::CKernel8x16::~CKernel8x16(CMedian::CKernel8x16 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel8x16::IdealTSize(CMedian::CKernel8x16 *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 8);
  else
    return 0x100000000C0;
}

uint64_t Hist8x16Inc(uint64_t result, uint64_t a2, int a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 *v17;
  unsigned int v18;

  v3 = 0;
  v4 = (a3 + 8);
  v5 = result + 640;
  v6 = result + 4738;
  v7 = 1;
  do
  {
    v8 = 0;
    v9 = *(unsigned __int8 *)(a2 + (v4 + v3));
    v10 = *(unsigned __int8 *)(a2 + v3 + 8);
    v11 = v5 + 16 * *(unsigned __int8 *)(a2 + (v3 + a3));
    v12 = v5 + 16 * *(unsigned __int8 *)(a2 + v3);
    do
    {
      ++*(_WORD *)(v12 + 2 * v8);
      --*(_WORD *)(v11 + 2 * v8++);
    }
    while (v7 != v8);
    if (v3 <= 6)
    {
      v13 = v6 + 16 * v9;
      v14 = v3;
      v15 = v6 + 16 * v10;
      do
      {
        --*(_WORD *)(v15 + 2 * v14);
        ++*(_WORD *)(v13 + 2 * v14++);
      }
      while (v14 != 7);
    }
    ++v3;
    ++v7;
  }
  while (v3 != 8);
  if (v4 >= 9)
  {
    v16 = v4 - 8;
    v17 = (unsigned __int8 *)(a2 + 8);
    do
    {
      v18 = *v17++;
      ++*(_WORD *)(result + 128 + 2 * v18);
      --v16;
    }
    while (v16);
  }
  return result;
}

uint64_t Median8x16Strip_(uint64_t result, uint64_t a2, _QWORD *a3, uint16x8_t *a4)
{
  uint64_t v4;
  uint64_t v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint8x8_t *v16;
  uint8x8_t *v17;
  uint64_t v18;

  v18 = result;
  v4 = a3[7];
  if ((_DWORD)v4)
  {
    v8 = 0;
    v9 = *(_DWORD *)(result + 24);
    v10 = (2 * v9) | 1;
    v11 = *(unsigned __int8 *)(result + 49);
    v12 = (v4 - 1);
    v13 = 2 * v9 + 1;
    if (*(_BYTE *)(result + 49))
      goto LABEL_4;
LABEL_3:
    result = (uint64_t)Hist8x16Read16(a4, a3[2] + a3[3] * v8, *(_DWORD *)(v18 + 36));
LABEL_4:
    while (v12 != v8)
    {
      v14 = *(_QWORD *)(a2 + 16);
      v15 = *(_QWORD *)(a2 + 24);
      v16 = (uint8x8_t *)(v14 + v15 * v8);
      v17 = (uint8x8_t *)(v14 + v15 * (v13 + v8));
      result = Hist8x16Step((uint64_t)a4, (uint64_t)v17, (uint64_t)v16, v10);
      if (!v11)
        result = (uint64_t)Hist8x16Delta2((int16x8_t *)a4, v17, v16, v10);
      ++v8;
      if (!v11)
        goto LABEL_3;
    }
  }
  return result;
}

unsigned __int8 *Hist8x16Read16(uint16x8_t *a1, uint64_t a2, unsigned int a3)
{
  uint16x8_t *v6;
  uint16x8_t *v7;
  uint64_t i64;
  unsigned __int8 *result;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  unsigned int v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  int v18;
  uint64_t v19;
  uint16x8_t v20;

  v6 = a1 + 552;
  v20 = (uint16x8_t)vdupq_n_s16(a3);
  v7 = a1 + 40;
  i64 = (uint64_t)a1[8].i64;
  Hist8x16Adjust8x_((unsigned __int8 *)&a1[552], a1 + 554, (uint64_t)a1[40].i64, (uint64_t)a1[8].i64, v20);
  result = Hist8x16Adjust8x_(&a1[552].u8[1], a1 + 555, (uint64_t)a1[296].i64, i64, v20);
  v10 = 0;
  for (i = 0; i != 8; ++i)
  {
    v12 = v6->u8[0];
    v13 = a1[554].u16[i];
    if (v13 <= a3)
    {
      v15 = v10 * 2 + 16 * v12;
      while (1)
      {
        v13 += (unsigned __int16)(a1[8].i16[v12] + *(__int16 *)((char *)a1[40].i16 + v15));
        if (v13 > a3)
          break;
        ++v12;
        v15 += 16;
        if (v12 == 256)
        {
          LOBYTE(v12) = 0;
          break;
        }
      }
    }
    else if (v6->i8[0])
    {
      v14 = 8 * v12 - 8;
      do
      {
        LODWORD(v12) = v12 - 1;
        if (!v14)
          break;
        v13 -= (unsigned __int16)(*(_WORD *)(i64 + 2 * v12) + v7->i16[i + (v14 & 0xFFFFFFF8)]);
        v14 -= 8;
      }
      while (v13 > a3);
    }
    *(_BYTE *)(a2 + i) = v12;
    v16 = a1[552].u8[1];
    v17 = a1[555].u16[i];
    if (v17 <= a3)
    {
      v19 = 16 * v16 + 4736;
      while (1)
      {
        v17 += (unsigned __int16)(a1[8].i16[v16] + *(__int16 *)((char *)&a1->i16[v10] + v19));
        if (v17 > a3)
          break;
        ++v16;
        v19 += 16;
        if (v16 == 256)
        {
          LOBYTE(v16) = 0;
          break;
        }
      }
    }
    else if (a1[552].i8[1])
    {
      v18 = 8 * v16 - 8;
      do
      {
        LODWORD(v16) = v16 - 1;
        if (!v18)
          break;
        v17 -= (unsigned __int16)(*(_WORD *)(i64 + 2 * v16) + a1[296].i16[i + (v18 & 0xFFFFFFF8)]);
        v18 -= 8;
      }
      while (v17 > a3);
    }
    *(_BYTE *)(a2 + i + 8) = v16;
    ++v10;
  }
  return result;
}

uint64_t Hist8x16Step(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  Hist8x16Inc(a1, a2, a4);
  return Hist8x16Dec(a1, a3, a4);
}

int16x8_t *Hist8x16Delta2(int16x8_t *result, uint8x8_t *a2, uint8x8_t *a3, unsigned int a4)
{
  unsigned int v4;
  unsigned int v5;
  unint64_t k;
  __int16 *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t m;
  __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unsigned int v16;
  unint64_t v17;
  __int16 *v18;
  unsigned int v19;
  uint64_t i;
  uint8x8_t *v21;
  uint8x8_t *v22;
  unsigned int v23;
  unsigned int v24;
  uint8x8_t v25;
  int8x8_t v26;
  int8x8_t v27;
  int8x8_t v28;
  int16x8_t v29;
  uint8x8_t v30;
  int8x8_t v31;
  unint64_t v32;
  int8x8_t v33;
  uint8x8_t v34;
  uint8x8_t v35;
  int8x8_t v36;
  int8x8_t v37;
  int8x8_t v38;
  int8x8_t v39;
  int16x8_t v40;
  uint64_t v41;
  int8x8_t v42;
  int8x8_t v43;
  int8x8_t v44;
  int8x8_t v45;
  int16x8_t v46;
  int16x8_t v47;
  int8x8_t v48;
  int8x8_t v49;
  int8x8_t v50;
  uint64_t v51;
  unsigned int v52;
  uint8x8_t *v53;
  uint8x8_t *v54;
  uint64_t j;
  uint64_t v56;
  __int16 *v57;
  unsigned int v58;
  uint64_t v59;
  uint8x8_t *v60;
  unsigned __int8 *v61;
  unsigned int v62;
  unsigned int v63;

  v4 = result[552].u8[0];
  v5 = result[552].u8[1];
  if (a4 > 0x10)
  {
    v14 = 0;
    v15 = a4 & 0xFFFFFFF8;
    v16 = a4;
    do
    {
      v17 = v16 - (unint64_t)(a4 & 0xFFFFFFF8);
      v18 = &result[554].i16[v14];
      v19 = (unsigned __int16)*v18;
      for (i = v14; i != 8; ++i)
      {
        if (a2->u8[i] < v4)
          ++v19;
        v19 = (__PAIR64__(v19, a3->u8[i]) - v4) >> 32;
      }
      *v18 = v19;
      v19 = (unsigned __int16)v19;
      v21 = (uint8x8_t *)((char *)a2 + (a4 & 0xFFFFFFF8));
      v22 = (uint8x8_t *)((char *)a3 + (a4 & 0xFFFFFFF8));
      if (v15 < v14 + a4)
      {
        do
        {
          v23 = v21->u8[0];
          v21 = (uint8x8_t *)((char *)v21 + 1);
          if (v23 < v4)
            ++v19;
          v24 = v22->u8[0];
          v22 = (uint8x8_t *)((char *)v22 + 1);
          v19 = (__PAIR64__(v19, v24) - v4) >> 32;
          --v17;
        }
        while (v17);
      }
      *v18 = v19;
      ++v14;
      ++v16;
    }
    while (v14 != 8);
    v25 = (uint8x8_t)vdup_n_s8(v4);
    v26 = vsub_s8((int8x8_t)vcgt_u8(v25, a3[1]), (int8x8_t)vcgt_u8(v25, a2[1]));
    v27 = vpadd_s8(v26, v26);
    v28 = vpadd_s8(v27, v27);
    v29 = vaddw_s8(result[554], vpadd_s8(v28, v28));
    result[554] = v29;
    v30 = (uint8x8_t)vdup_n_s8(v5);
    if (v15 < 0x11)
    {
      v33 = 0;
      v31 = 0;
    }
    else
    {
      v31 = 0;
      v32 = 16;
      v33 = 0;
      do
      {
        v34 = a2[v32 / 8];
        v35 = a3[v32 / 8];
        v31 = vadd_s8(vsub_s8(v31, (int8x8_t)vcgt_u8(v25, v34)), (int8x8_t)vcgt_u8(v25, v35));
        v33 = vadd_s8(vsub_s8(v33, (int8x8_t)vcgt_u8(v30, v34)), (int8x8_t)vcgt_u8(v30, v35));
        if ((v32 & 0x38) == 0)
        {
          v36 = vpadd_s8(v31, v31);
          v37 = vpadd_s8(v36, v36);
          v38 = vpadd_s8(v33, v33);
          v39 = vpadd_s8(v38, v38);
          v40 = result[555];
          v29 = vaddw_s8(v29, vpadd_s8(v37, v37));
          result[554] = v29;
          result[555] = vaddw_s8(v40, vpadd_s8(v39, v39));
          v33 = 0;
          v31 = 0;
        }
        v32 += 8;
      }
      while (v32 < v15);
    }
    v41 = 0;
    v42 = vpadd_s8(v31, v31);
    v43 = vpadd_s8(v42, v42);
    v44 = vpadd_s8(v33, v33);
    v45 = vpadd_s8(v44, v44);
    v46 = result[555];
    result[554] = vaddw_s8(v29, vpadd_s8(v43, v43));
    v47 = vaddw_s8(v46, vpadd_s8(v45, v45));
    result[555] = v47;
    v48 = vsub_s8((int8x8_t)vcgt_u8(v30, *(uint8x8_t *)((char *)a3 + v15)), (int8x8_t)vcgt_u8(v30, *(uint8x8_t *)((char *)a2 + v15)));
    v49 = vpadd_s8(v48, v48);
    v50 = vpadd_s8(v49, v49);
    v51 = (v15 + 8);
    v52 = a4 + 8;
    v53 = a3 + 1;
    result[555] = vaddw_s8(v47, vpadd_s8(v50, v50));
    v54 = (uint8x8_t *)((char *)a3 + v51);
    for (j = 8; j != 16; ++j)
    {
      v56 = v52 - v51;
      v57 = &result[554].i16[j];
      v58 = (unsigned __int16)*v57;
      v59 = v41;
      do
      {
        if (a2[1].u8[v59] < v5)
          ++v58;
        v58 = (__PAIR64__(v58, v53->u8[v59++]) - v5) >> 32;
      }
      while (v59 != 8);
      *v57 = v58;
      v58 = (unsigned __int16)v58;
      v60 = (uint8x8_t *)((char *)a2 + v51);
      v61 = (unsigned __int8 *)v54;
      if (v51 < j + a4)
      {
        do
        {
          v62 = v60->u8[0];
          v60 = (uint8x8_t *)((char *)v60 + 1);
          if (v62 < v5)
            ++v58;
          v63 = *v61++;
          v58 = (__PAIR64__(v58, v63) - v5) >> 32;
          --v56;
        }
        while (v56);
      }
      *v57 = v58;
      ++v52;
      ++v41;
    }
  }
  else
  {
    for (k = 0; k != 8; ++k)
    {
      v7 = &result[554].i16[k];
      v8 = (unsigned __int16)*v7;
      v9 = k;
      do
      {
        if (a2->u8[v9] < v4)
          ++v8;
        v8 = (__PAIR64__(v8, a3->u8[v9++]) - v4) >> 32;
      }
      while (v9 < k + a4);
      *v7 = v8;
    }
    for (m = 8; m != 16; ++m)
    {
      v11 = &result[554].i16[m];
      v12 = (unsigned __int16)*v11;
      v13 = m;
      do
      {
        if (a2->u8[v13] < v5)
          ++v12;
        v12 = (__PAIR64__(v12, a3->u8[v13++]) - v5) >> 32;
      }
      while (v13 < m + (unint64_t)a4);
      *v11 = v12;
    }
  }
  return result;
}

uint64_t Hist8x16Dec(uint64_t result, uint64_t a2, int a3)
{
  unint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned __int8 *v18;
  unsigned int v19;

  v3 = 0;
  v4 = a3 + 7;
  v5 = (a3 + 8);
  v6 = result + 640;
  v7 = result + 4738;
  v8 = 8;
  do
  {
    v9 = 0;
    v10 = *(unsigned __int8 *)(v3 + a2 + 8);
    v11 = *(unsigned __int8 *)(a2 + (v5 + v3));
    v12 = v6 + 16 * *(unsigned __int8 *)(a2 + (v4 - v3));
    v13 = v6 + 16 * *(unsigned __int8 *)(a2 - v3 + 7);
    do
    {
      --*(_WORD *)(v13 + 2 * v9);
      ++*(_WORD *)(v12 + 2 * v9++);
    }
    while (v8 != v9);
    if (v3 <= 6)
    {
      v14 = v7 + 16 * v11;
      v15 = v3;
      v16 = v7 + 16 * v10;
      do
      {
        ++*(_WORD *)(v16 + 2 * v15);
        --*(_WORD *)(v14 + 2 * v15++);
      }
      while (v15 != 7);
    }
    ++v3;
    --v8;
  }
  while (v3 != 8);
  if (v5 >= 9)
  {
    v17 = v5 - 8;
    v18 = (unsigned __int8 *)(a2 + 8);
    do
    {
      v19 = *v18++;
      --*(_WORD *)(result + 128 + 2 * v19);
      --v17;
    }
    while (v17);
  }
  return result;
}

unsigned __int8 *Hist8x16Adjust8x_(unsigned __int8 *result, uint16x8_t *a2, uint64_t a3, uint64_t a4, uint16x8_t a5)
{
  uint16x8_t v5;
  _BYTE *v8;
  uint64_t v9;
  int16x4_t *v10;
  int16x8_t v11;
  int16x8_t *v12;
  int16x8_t *v13;
  char v14;
  int16x8_t v15;
  int16x8_t v16;
  int16x8_t *v17;
  uint16x8_t v18;
  uint16x8_t v20;
  int16x8_t v21;

  v5 = a5;
  v8 = result;
  v9 = *result;
  v10 = (int16x4_t *)(a4 + 2 * v9);
  v11 = *(int16x8_t *)a2;
  if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16(*a2, a5))) & 1) != 0)
  {
    v12 = (int16x8_t *)&v10[-2];
    v13 = (int16x8_t *)(a3 + 16 * v9 - 64);
    while (1)
    {
      v14 = (_DWORD)v9
          ? 1
          : Hist8x16Adjust8x_(unsigned char *,unsigned short *,unsigned short *,unsigned short *,__simd128_uint16_t)::first;
      if ((v14 & 1) == 0)
        break;
      LODWORD(v9) = v9 - 8;
      v15 = *v12--;
      v16 = vnegq_s16(v15);
      v11 = vsubq_s16(vaddq_s16(vaddq_s16(vsubq_s16(vaddq_s16(vdupq_laneq_s16(v16, 7), v11), v13[3]), vaddq_s16(vaddq_s16(vdupq_laneq_s16(v16, 6), vdupq_laneq_s16(v16, 5)), vdupq_laneq_s16(v16, 4))), vaddq_s16(vaddq_s16(vaddq_s16(vdupq_lane_s16(*(int16x4_t *)v16.i8, 3), vdupq_lane_s16(*(int16x4_t *)v16.i8, 2)), vdupq_lane_s16(*(int16x4_t *)v16.i8, 1)), vdupq_lane_s16(*(int16x4_t *)v16.i8, 0))), vaddq_s16(vaddq_s16(vaddq_s16(v13[2], v13[1]), vaddq_s16(*v13, v13[-1])), vaddq_s16(vaddq_s16(v13[-2], v13[-3]), v13[-4])));
      v13 -= 8;
      if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16((uint16x8_t)v11, v5))) & 1) == 0)
        goto LABEL_14;
    }
    Hist8x16Adjust8x_(unsigned char *,unsigned short *,unsigned short *,unsigned short *,__simd128_uint16_t)::first = 1;
    v21 = v11;
    result = (unsigned __int8 *)puts("Hist8x16Adjust8x -- attempting to adjust below zero!!");
    v11 = v21;
    LOBYTE(v9) = 0;
  }
  else
  {
    while (1)
    {
      v17 = (int16x8_t *)(a3 + 16 * v9);
      v18 = (uint16x8_t)vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(vdupq_lane_s16(*v10, 0), vaddq_s16(v11, *v17)), vaddq_s16(vdupq_lane_s16(*v10, 1), vdupq_lane_s16(*v10, 2))), vaddq_s16(vaddq_s16(vdupq_lane_s16(*v10, 3), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 4)), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 5))), vaddq_s16(vaddq_s16(vaddq_s16(vdupq_laneq_s16(*(int16x8_t *)v10->i8, 6), vdupq_laneq_s16(*(int16x8_t *)v10->i8, 7)), v17[1]), v17[2])), vaddq_s16(vaddq_s16(vaddq_s16(vaddq_s16(v17[3], v17[4]), v17[5]), v17[6]), v17[7]));
      if ((vmaxv_u8((uint8x8_t)vmovn_s16((int16x8_t)vcgtq_u16(v18, v5))) & 1) != 0)
        break;
      if ((v9 + 8) >= 0x100)
      {
        v20 = v18;
        result = (unsigned __int8 *)puts("Hist8x16Adjust8x -- ind >= 256!!");
        v5 = a5;
        v18 = v20;
      }
      v10 += 2;
      v9 += 8;
      v11 = (int16x8_t)v18;
    }
  }
LABEL_14:
  *v8 = v9;
  *a2 = (uint16x8_t)v11;
  return result;
}

void CGrNavigatorTC<unsigned char>::~CGrNavigatorTC(CGrNavigator *a1)
{
  void *v1;

  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

void CGrNavigatorT<float,1ul>::~CGrNavigatorT(CGrNavigator *a1)
{
  void *v1;

  CGrNavigator::~CGrNavigator(a1);
  if (v1)
  {
    --CMemEnv::excount;
    free(v1);
  }
}

uint64_t CInwardBlur::ProcessBuffer_(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  _BYTE *v16;
  _BYTE *v17;
  unint64_t v18;
  unint64_t v19;
  int v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  _BYTE *v26;
  _BYTE *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned int v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  float32x4_t v37;
  int j;
  unsigned int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int k;
  uint64_t v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v48;
  char v50;
  uint64_t v51;
  int64x2_t v52;
  unsigned int v53;
  unsigned int v54;
  __int128 v58;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  int v76;
  int v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  float32x4_t v87;
  uint64_t v88;
  int v89;
  uint64_t v90;
  int v91;
  int v92;
  uint64_t v93;
  char v94;
  int64x2_t v95;
  uint64_t v96;
  uint64_t v97;
  unsigned int v98;
  unsigned int v99;
  uint64_t v100;
  float32x4_t v101;
  float32x4_t v102;
  uint64_t v103;
  int v104;
  uint64_t v105;
  unsigned int v106;
  unsigned int v107;
  uint64_t v108;
  float32x4_t v109;
  unsigned int v110;
  uint64_t v111;
  float32x4_t v112;
  int v113;
  unsigned int v114;
  float32x4_t v115;
  uint64_t v116;
  uint64_t v117;
  _OWORD *v118;
  _OWORD *v119;
  _OWORD *v120;
  _OWORD *v121;
  _OWORD *v122;
  __int128 *v123;
  __int128 *v124;
  _OWORD *v125;
  uint64_t v126;
  uint64_t v127;
  __int128 v128;
  uint64_t v129;
  _OWORD *v130;
  uint64_t v131;
  __int128 v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  unint64_t v136;
  unint64_t v137;
  _OWORD *v138;
  __int128 *v139;
  _OWORD *v140;
  uint64_t v141;
  __int128 v142;
  uint64_t v143;
  uint64_t v144;
  unsigned __int8 *v145;
  unsigned int v146;
  _QWORD v148[2];
  uint64_t v149;
  uint64_t v150;
  __int128 v151;
  int64x2_t v152;
  uint64_t v153;
  __int16 v154;
  uint64_t (**v155)();
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  __int128 v159;
  int64x2_t v160;
  uint64_t v161;
  __int16 v162;
  _QWORD v163[4];
  __int128 v164;
  int64x2_t v165;
  uint64_t v166;
  char v167;
  uint64_t (**v168)();
  char v169;
  uint64_t v170;
  uint64_t v171;
  __int128 v172;
  int64x2_t v173;
  uint64_t v174;
  char v175;
  _OWORD v176[4];
  uint64_t v177;

  v177 = *MEMORY[0x1E0C80C00];
  v7 = a2[6];
  v6 = a2[7];
  v8 = a3[7];
  LODWORD(v9) = v6;
  v10 = v6;
  if ((_DWORD)v8)
  {
    v11 = 0;
    v12 = a3[6];
    v13 = a3[7];
    v14 = (v12 - 1);
    do
    {
      if (v14 >= 2)
      {
        for (i = 1; i != v14; ++i)
        {
          v16 = (_BYTE *)(i + a3[2] + v11 * a3[3]);
          if (!*v16 && ((v16[1] | *(v16 - 1)) & 4) != 0)
            *v16 = 3;
        }
      }
      v17 = (_BYTE *)(a3[2] + a3[3] * v11);
      if (!*v17 && (v17[1] & 4) != 0)
        *v17 = 3;
      if (!v17[v14] && (v17[(v12 - 2)] & 4) != 0)
        v17[v14] = 3;
      ++v11;
    }
    while (v11 != v13);
    v18 = 0;
    v19 = (v8 - 1);
    do
    {
      if ((int)v18 - 1 >= 0)
        v20 = v19;
      else
        v20 = 0;
      if ((int)v18 - 1 <= v19)
        v20 = v18 - 1;
      v21 = v18 + 1;
      if ((int)v18 + 1 >= 0)
        v22 = v19;
      else
        v22 = 0;
      if (v18 < v19)
        v22 = v18 + 1;
      if ((_DWORD)v12)
      {
        v23 = a3[2];
        v24 = a3[3];
        v25 = (_BYTE *)(v23 + v24 * v20);
        v26 = (_BYTE *)(v23 + v24 * v18);
        v27 = (_BYTE *)(v23 + v24 * v22);
        v28 = v12;
        do
        {
          if (!*v26 && ((*v27 | *v25) & 2) != 0)
            *v26 = 1;
          ++v27;
          ++v25;
          ++v26;
          --v28;
        }
        while (v28);
      }
      v18 = v21;
    }
    while (v21 != v13);
    v9 = a2[7];
    v10 = v9;
  }
  if ((_DWORD)v9)
  {
    v29 = 0;
    v30 = a2[6];
    v31 = a3[2];
    v32 = a3[3];
    v33 = v9 - 1;
    do
    {
      if ((_DWORD)v30)
      {
        v34 = 0;
        v35 = a2[2] + a2[3] * v29;
        do
        {
          if ((*(_BYTE *)(v31 + v29 * v32 + v34) & 5) == 1)
          {
            v36 = 0;
            v37 = 0uLL;
            for (j = -1; j != 2; ++j)
            {
              v39 = j + v34;
              if (j + (int)v34 >= 0)
                LODWORD(v40) = v30 - 1;
              else
                LODWORD(v40) = 0;
              if (v39 <= (int)v30 - 1)
                v40 = v39;
              else
                v40 = v40;
              v41 = v40 + v31;
              v42 = a2[2] + 16 * v40;
              for (k = -1; k != 2; ++k)
              {
                LODWORD(v44) = v29 + k;
                if ((int)v29 + k >= 0)
                  v45 = v33;
                else
                  v45 = 0;
                if (v44 <= v33)
                  v44 = v44;
                else
                  v44 = v45;
                if ((*(_BYTE *)(v41 + v32 * v44) & 4) != 0)
                {
                  v37 = vaddq_f32(*(float32x4_t *)(v42 + a2[3] * v44), v37);
                  ++v36;
                }
              }
            }
            *(float32x4_t *)(v35 + 16 * v34) = vmulq_n_f32(v37, flt_1A64DDBB8[v36 - 1]);
          }
          ++v34;
        }
        while (v34 != v30);
      }
      ++v29;
    }
    while (v29 != v10);
  }
  v46 = *(_DWORD *)(a1 + 24);
  _ZF = v46 == 0;
  v48 = v46 >> CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
  v50 = !_ZF && v48 < 2;
  if (v7 < 5 || v6 < 5 || (v50 & 1) != 0)
    goto LABEL_118;
  v51 = (v6 + 1) >> 1;
  CGrNavigator::CGrNavigator((CGrNavigator *)&v168, *(CMemEnv **)a1, (v7 + 1) >> 1, v51, 16);
  v168 = off_1E5014798;
  if (!v175)
  {
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v168);
    return 7;
  }
  CGrNavigator::CGrNavigator((CGrNavigator *)v163, *(CMemEnv **)a1, (v7 + 1) >> 1, v51, 1);
  v163[0] = off_1E50147D8;
  if (v167)
  {
    v157 = v170;
    v158 = v171;
    v52 = vshrq_n_s64(vshlq_n_s64(v173, 0x20uLL), 0x20uLL);
    v159 = v172;
    v160 = v52;
    v161 = v174;
    v162 = 1;
    v155 = off_1E5014798;
    v156 = 0;
    v154 = 1;
    v149 = v163[2];
    v150 = v163[3];
    v151 = v164;
    v152 = vshrq_n_s64(vshlq_n_s64(v165, 0x20uLL), 0x20uLL);
    v153 = v166;
    v148[0] = off_1E50147D8;
    v148[1] = 0;
    v53 = *((_DWORD *)a2 + 12);
    v54 = *((_DWORD *)a2 + 14);
    __asm { FMOV            V0.4S, #1.0 }
    *(_QWORD *)&v58 = 0x3F0000003F000000;
    *((_QWORD *)&v58 + 1) = 0x3F0000003F000000;
    v176[0] = _Q0;
    v176[1] = v58;
    __asm { FMOV            V0.4S, #0.25 }
    v176[2] = vdupq_n_s32(0x3EAAAAABu);
    v176[3] = _Q0;
    v60 = v52.u32[2];
    if (v52.i32[2])
    {
      v61 = 0;
      v62 = v52.u32[0];
      do
      {
        if (v62)
        {
          v63 = 0;
          v64 = 0;
          v65 = 0;
          v66 = (2 * v61);
          LODWORD(v67) = (2 * v61) | 1;
          if (v67 >= v54)
            v67 = v66;
          else
            v67 = v67;
          do
          {
            if (v63 + 1 >= v53)
              v68 = v63;
            else
              v68 = v63 + 1;
            v69 = a3[2];
            v70 = a3[3];
            v71 = v69 + v63;
            v72 = *(unsigned __int8 *)(v71 + v70 * v66);
            v73 = v68 + v69;
            v74 = *(unsigned __int8 *)(v73 + v70 * v66);
            v75 = v70 * v67;
            v76 = *(unsigned __int8 *)(v71 + v75);
            v77 = *(unsigned __int8 *)(v73 + v75);
            v78 = v149;
            v79 = v150;
            if (((v74 | v72 | v76 | v77) & 1) != 0)
            {
              v83 = a2[2];
              v84 = a2[3];
              v85 = v84 * v66;
              v86 = v83 + 16 * v63;
              v87 = 0uLL;
              if ((v72 & 1) != 0)
                v87 = *(float32x4_t *)(v86 + v85);
              v88 = v83 + 16 * v68;
              v89 = v74 & 1;
              if ((v74 & 1) != 0)
                v87 = vaddq_f32(*(float32x4_t *)(v88 + v85), v87);
              v90 = v84 * v67;
              v91 = v76 & 1;
              if (v91)
                v87 = vaddq_f32(*(float32x4_t *)(v86 + v90), v87);
              v92 = v77 & 1;
              if (v92)
                v87 = vaddq_f32(*(float32x4_t *)(v88 + v90), v87);
              *(float32x4_t *)(v64 + v157 + v61 * v158) = vmulq_f32((float32x4_t)v176[(v72 & 1u) - 1 + v89 + v91 + v92], v87);
              v80 = 7;
            }
            else
            {
              v80 = 0;
              v81 = a2[2];
              v82 = a2[3];
              *(float32x4_t *)(v64 + v157 + v61 * v158) = vmulq_f32(vaddq_f32(vaddq_f32(*(float32x4_t *)(v81 + 16 * v68 + v82 * v66), *(float32x4_t *)(v81 + 16 * v63 + v82 * v66)), vaddq_f32(*(float32x4_t *)(v81 + 16 * v63 + v82 * v67), *(float32x4_t *)(v81 + 16 * v68 + v82 * v67))), _Q0);
            }
            *(_BYTE *)(v65 + v78 + v61 * v79) = v80;
            ++v65;
            v64 += 16;
            v63 += 2;
          }
          while (v62 != v65);
        }
        ++v61;
      }
      while (v61 != v60);
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v148);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v155);
    ++CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
    v93 = CInwardBlur::ProcessBuffer_(a1, &v168, v163);
    --CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
    if ((_DWORD)v93)
    {
      v94 = 0;
    }
    else
    {
      v157 = v170;
      v158 = v171;
      v95 = vshrq_n_s64(vshlq_n_s64(v173, 0x20uLL), 0x20uLL);
      v159 = v172;
      v160 = v95;
      v161 = v174;
      v162 = 1;
      v155 = off_1E5014798;
      v156 = 0;
      v96 = *((unsigned int *)a2 + 14);
      if (*((_DWORD *)a2 + 14))
      {
        v97 = 0;
        v98 = (v95.i32[2] << 8) - 257;
        v99 = (v95.i32[0] << 8) - 257;
        v100 = *((unsigned int *)a2 + 12);
        v101.i64[0] = 0x3F0000003F000000;
        v101.i64[1] = 0x3F0000003F000000;
        v102.i64[0] = 0x3F0000003F000000;
        v102.i64[1] = 0x3F0000003F000000;
        do
        {
          v102 = vsubq_f32(v101, v102);
          if (v100)
          {
            v103 = 0;
            v104 = 0;
            v105 = 0;
            v106 = (_DWORD)v97 << 7;
            if ((v97 & 0x1000000) != 0)
              v107 = 0;
            else
              v107 = v98;
            if (v106 > v98)
              v106 = v107;
            v108 = v106 >> 8;
            v109.i64[0] = 0x3F0000003F000000;
            v109.i64[1] = 0x3F0000003F000000;
            do
            {
              v109 = vsubq_f32(v101, v109);
              if (!*(_BYTE *)(v105 + a3[2] + v97 * a3[3]))
              {
                if (v104 >= 0)
                  v110 = v99;
                else
                  v110 = 0;
                if (v104 <= v99)
                  v110 = v104;
                v111 = v157 + ((v110 >> 4) & 0xFFFFFF0);
                v112 = vmlaq_f32(*(float32x4_t *)(v111 + v158 * v108), v109, vsubq_f32(*(float32x4_t *)(v111 + v158 * v108 + 16), *(float32x4_t *)(v111 + v158 * v108)));
                *(float32x4_t *)(v103 + a2[2] + v97 * a2[3]) = vmlaq_f32(v112, v102, vmlaq_f32(vsubq_f32(*(float32x4_t *)(v111+ v158 * (v108 + 1)), v112), v109, vsubq_f32(*(float32x4_t *)(v111+ v158 * (v108 + 1)+ 16), *(float32x4_t *)(v111+ v158 * (v108 + 1)))));
              }
              ++v105;
              v104 += 128;
              v103 += 16;
            }
            while (v100 != v105);
          }
          ++v97;
        }
        while (v97 != v96);
      }
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v155);
      v93 = 0;
      v94 = 1;
    }
  }
  else
  {
    v94 = 0;
    v93 = 7;
  }
  CGrNavigator::~CGrNavigator((CGrNavigator *)v163);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&v168);
  if ((v94 & 1) != 0)
  {
LABEL_118:
    CMemBlock::CMemBlock((CMemBlock *)&v168, *(CMemEnv **)a1, (48 * v7 + 96) & 0xFFFFFFFF0, 0, 16);
    v168 = off_1E5014688;
    if (v169 && !CMemBlock::Lock((CMemBlock *)&v168))
    {
      v113 = 0;
      v114 = 1 << CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting;
      if ((1 << CInwardBlur::ProcessBuffer_(CInwardBlur::CParms const&,CGrNavigatorT<__simd128_float32_t,1ul> const&,CGrNavigatorT const&<unsigned char,1ul>)::nesting) >= 0x10)
        v114 = 16;
      if (v114 <= 1)
        v114 = 1;
      v115 = (float32x4_t)vdupq_n_s32(0x3DE38E39u);
      do
      {
        v117 = a2[6];
        v116 = a2[7];
        v118 = (_OWORD *)(v172 + 16);
        v119 = (_OWORD *)(v172 + 16 + 16 * v117);
        v120 = v119 + 2;
        v121 = &v119[v117 + 2];
        v122 = v121 + 2;
        v123 = (__int128 *)a2[2];
        v124 = v123;
        v125 = v119 + 2;
        v126 = v117;
        v127 = v117;
        if ((_DWORD)v117)
        {
          do
          {
            v128 = *v124++;
            *v125++ = v128;
            --v127;
          }
          while (v127);
          v119[1] = v119[2];
          v129 = (v117 - 1);
          *v121 = v120[v129];
          v130 = v121 + 2;
          v131 = v126;
          do
          {
            v132 = *v123++;
            *v130++ = v132;
            --v131;
          }
          while (v131);
          v133 = v126;
        }
        else
        {
          v133 = 0;
          v134 = v119[0x100000001];
          v119[1] = v119[2];
          v119[2] = v134;
          v129 = 0xFFFFFFFFLL;
        }
        v121[1] = v121[2];
        v122[v133] = v122[v129];
        v135 = v116;
        if ((_DWORD)v116)
        {
          v136 = 0;
          v137 = (v116 - 1);
          v138 = v122;
          do
          {
            if (v136 < v137)
            {
              if (v126)
              {
                v139 = (__int128 *)(a2[3] + a2[3] * v136 + a2[2]);
                v140 = v118;
                v141 = v126;
                do
                {
                  v142 = *v139++;
                  *v140++ = v142;
                  --v141;
                }
                while (v141);
                v143 = v126;
              }
              else
              {
                v143 = 0;
              }
              *(v118 - 1) = *v118;
              v118[v143] = v118[v129];
              v138 = v118;
            }
            if (v126)
            {
              v144 = 0;
              v145 = (unsigned __int8 *)(a3[2] + a3[3] * v136);
              do
              {
                v146 = *v145++;
                if (v146 <= 3)
                  *(float32x4_t *)(v144 * 16 + a2[2] + v136 * a2[3]) = vmulq_f32(vaddq_f32(vaddq_f32(vaddq_f32(vaddq_f32((float32x4_t)v120[v144], (float32x4_t)v120[v144 - 1]), vaddq_f32((float32x4_t)v120[v144 + 1], (float32x4_t)v122[v144 - 1])), vaddq_f32(vaddq_f32((float32x4_t)v122[v144], (float32x4_t)v122[v144 + 1]), (float32x4_t)v138[v144 - 1])), vaddq_f32((float32x4_t)v138[v144], (float32x4_t)v138[v144 + 1])), v115);
                ++v144;
              }
              while (v126 != v144);
            }
            ++v136;
            v118 = v120;
            v120 = v122;
            v122 = v138;
          }
          while (v136 != v135);
        }
        ++v113;
      }
      while (v113 != v114);
      ((void (*)(uint64_t))v168[11])((uint64_t)&v168);
      v93 = 0;
    }
    else
    {
      v93 = 7;
    }
    CMemBlock::~CMemBlock((CMemBlock *)&v168);
  }
  return v93;
}

void sub_1A64C0EB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  if (a2)
    __clang_call_terminate(exception_object);
  _Unwind_Resume(exception_object);
}

void CMemBlockT<__simd128_float32_t>::~CMemBlockT(CMemBlock *a1)
{
  void *v1;

  CMemBlock::~CMemBlock(a1);
  CBaseRef::operator delete(v1);
}

double CMemBlockT<__simd128_float32_t>::Description@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  double result;
  uint64_t v3;
  unint64_t v4;

  result = 0.0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_OWORD *)(a2 + 64) = 0u;
  *(_QWORD *)(a2 + 80) = 0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)a2 = off_1E5014838;
  *(_QWORD *)(a2 + 8) = v3;
  *(_DWORD *)(a2 + 32) = 1;
  *(_QWORD *)(a2 + 64) = v4 >> 4;
  *(_QWORD *)(a2 + 40) = 16;
  *(_QWORD *)(a2 + 16) = v4 & 0xFFFFFFFFFFFFFFF0;
  *(_QWORD *)(a2 + 24) = 0;
  return result;
}

uint64_t CMemBlockT<__simd128_float32_t>::Resize(CMemBlock *a1, uint64_t a2, int a3, int a4)
{
  return CMemBlock::Resize(a1, 16 * a2, a3, a4);
}

BOOL LinesCross(float a1, float a2, float a3, float a4, float a5, float a6, float a7, float a8)
{
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;

  v8 = a8 - a6;
  v9 = a3 - a1;
  v10 = a7 - a5;
  v11 = a4 - a2;
  v12 = -(float)((float)(v11 * v10) - (float)(v9 * v8));
  return fabsf(v12) >= 0.0001
      && fmaxf(fabsf((float)((float)(1.0 / v12)* (float)-(float)((float)(v11 * (float)(a1 - a5)) - (float)((float)(a2 - a6) * v9)))+ -0.5), fabsf((float)((float)(1.0 / v12)* (float)-(float)((float)((float)(a1 - a5) * v8) - (float)((float)(a2 - a6) * v10)))+ -0.5)) < 0.5;
}

uint64_t ConnectIsophotes(uint64_t a1, unsigned int a2, uint64_t a3, unsigned int a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  float32x2_t v8;
  float32x2_t v9;
  unint64_t v10;
  unint64_t v11;
  int32x2_t v12;
  float v13;
  double v14;
  int32x2_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  float v19;
  float v20;
  float v21;
  float v22;
  int32x2_t v23;
  int32x2_t v24;
  float32x2_t v25;
  float32x2_t v26;
  float v27;
  float32x2_t *v28;
  float v29;
  float v30;
  float v31;
  float v32;
  double v33;
  float v34;
  float v35;
  float v36;
  float v37;
  float v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float32x2_t v49;
  float v50;
  uint64_t v51;
  float32x2_t v52;
  float32x4_t v53;
  float32x2_t v54;
  int16x4_t v55;
  float32x4_t v56;
  float32x4_t v57;
  float v58;
  int8x16_t v59;
  int8x16_t v60;
  float32x4_t v61;
  float32x4_t v62;
  int8x16_t v63;
  _QWORD *v64;
  float v65;
  float32x2_t v66;
  float32x4_t v67;
  float32x2_t v68;
  int16x4_t v69;
  float32x4_t v70;
  float32x4_t v71;
  float32x4_t v72;
  float32x2_t v73;
  int8x16_t v74;
  int8x16_t v75;
  float32x4_t v76;
  float32x4_t v77;
  int8x16_t v79;
  float v80;
  float v81;
  uint64_t v82;
  float v83;
  float v84;
  float v85;
  float v86;
  float v87;
  float v88;
  unint64_t v89;
  BOOL v90;
  float v91;
  float v92;
  uint64_t v93;
  unint64_t v94;
  float *v95;
  float v96;
  float v97;
  uint64_t v98;
  BOOL v99;
  _OWORD *v100;
  _OWORD *v101;
  __int128 v102;
  unsigned int v103;
  _OWORD *v104;
  _OWORD *v105;
  __int128 v106;
  uint64_t v107;
  unsigned int v108;
  uint64_t v110;
  float v111;
  unint64_t v112;
  uint64_t v113;
  unint64_t v114;
  uint64_t *v115;
  unsigned int v116;
  unint64_t v117;
  uint64_t v118;
  float32x2_t *v120;
  int v121;
  float v122;
  float32x2_t *v123;
  float v124;
  int32x2_t v125;
  int32x2_t v126;
  float32x2_t v127;
  float32x2_t v128;
  float v129;
  float v130;
  float32x2_t v131;
  float32x2_t v132;
  float v134;
  float32x2_t v135;
  float32x2_t v136;
  float32x2_t v137;
  float32x2_t v138;
  int32x2_t v139;
  int32x2_t v140;
  float v141;
  float32x2_t v143;
  int8x16_t v144;
  int32x2_t v145;
  int32x2_t v146;
  float32x2_t v147;
  float32x2_t v148;
  float32x2_t v149;
  __int32 v150;
  uint64_t v151;
  int v152;
  _OWORD __src[18];
  _OWORD v154[8];
  uint64_t v155;
  _OWORD v156[8];
  uint64_t v157;
  uint64_t v158;

  result = 0;
  v158 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return result;
  v6 = a3;
  if (!a3)
    return result;
  v7 = 2 * a4;
  if ((int)v7 + 2 > a2)
    return 0;
  result = 0;
  v151 = 0;
  v152 = 0;
  v149 = 0;
  v150 = 0;
  memset(__src, 0, sizeof(__src));
  v110 = a2 - 1;
  if (v7 >= v110)
    return result;
  v8 = 0;
  v9 = 0;
  v112 = 0;
  v10 = v7 | 1;
  v11 = a2;
  v12 = 0;
  v111 = 0.0;
  v13 = 0.1;
  v14 = 1.0;
  v15 = 0;
  v108 = 2 * a4;
  v16 = 2 * a4;
  *(float *)&v17 = 0.1;
  v117 = a2;
  v118 = a1;
  do
  {
    v113 = v16 + 1;
    v114 = v10;
    if (v16 + 1 < v11)
    {
      v18 = a1 + 28 * v16;
      v19 = *(float *)v18;
      v20 = *(float *)(v18 + 4);
      v22 = *(float *)(v18 + 8);
      v21 = *(float *)(v18 + 12);
      v123 = (float32x2_t *)(v18 + 20);
      v115 = (uint64_t *)(v18 + 16);
      v116 = v16;
      v23 = v12;
      v24 = v15;
      v120 = (float32x2_t *)v18;
      v122 = *(float *)(v18 + 16);
      v25 = v8;
      v26 = v9;
      v27 = *(float *)&v17;
      v129 = v20;
      v130 = *(float *)v18;
      v134 = v21;
      do
      {
        v28 = (float32x2_t *)(a1 + 28 * v10);
        v29 = v28[1].f32[0];
        v30 = v28[1].f32[1];
        v31 = v28->f32[0] - v19;
        v32 = v28->f32[1] - v20;
        v33 = v14 / sqrtf((float)(v31 * v31) + (float)(v32 * v32));
        v34 = v33 * v31;
        v35 = v33 * v32;
        v36 = (float)(v22 * v34) + (float)(v21 * v35);
        v37 = (float)(v29 * v34) + (float)(v30 * v35);
        if ((float)(v36 * v37) >= 0.0)
        {
          v139 = v23;
          v140 = v24;
          v141 = v27;
          v38 = v28[2].f32[0];
          v39 = -(float)((float)(v29 * v35) - (float)(v30 * v34));
          if ((float)((float)-(float)((float)(v22 * v35) - (float)(v21 * v34)) * v39) > 0.0
            && fabsf(v39 - (float)((float)(v22 * v35) - (float)(v21 * v34))) > 0.4)
          {
            v12 = v23;
            v15 = v24;
            v8 = v25;
            v9 = v26;
            *(float *)&v17 = v27;
            goto LABEL_36;
          }
          v131 = v25;
          v132 = v26;
          v40 = acosf(fminf(fabsf(v37), fabsf(v36)));
          v41 = 0.0;
          if (v40 < 1.1781)
            v41 = 0.4 / (float)(v40 + 0.4);
          v42 = v41 * fminf(v38, v122);
          __asm
          {
            FMOV            V2.2S, #5.0
            FMOV            V3.2S, #1.0
          }
          v49 = vmla_f32(_D3, _D2, vabd_f32(*v123, *(float32x2_t *)(a1 + 28 * v10 + 20)));
          v50 = v42 / vmul_lane_f32(v49, v49, 1).f32[0];
          *(float *)&v17 = v141;
          if (v50 <= v141)
          {
            v12 = v139;
            v15 = v140;
            v8 = v131;
            v9 = v132;
            goto LABEL_35;
          }
          v124 = v40;
          v121 = LODWORD(v50);
          v126 = (int32x2_t)v120[1];
          v127 = *v120;
          v128 = *v28;
          v125 = (int32x2_t)v28[1];
          if (a4)
          {
            v51 = 0;
            v52 = vsub_f32(v128, v127);
            *(float32x2_t *)v53.f32 = v120[1];
            v54 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(v126, 1), v125), (float32x2_t)vrev64_s32((int32x2_t)v52)), v52, (float32x2_t)__PAIR64__(v125.u32[1], v126.u32[0]));
            v55.i16[0] = vcltz_f32(v54).u16[0];
            v55.i16[1] = v55.i16[0];
            v55.i16[2] = vcgtz_f32(v54).i16[2];
            v55.i16[3] = v55.i16[2];
            *(float32x2_t *)&v53.u32[2] = v28[1];
            *(float32x2_t *)v56.f32 = *v120;
            *(float32x2_t *)&v56.u32[2] = *v28;
            v57 = vmlaq_n_f32(v56, (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v55), (int8x16_t)vnegq_f32(v53), (int8x16_t)v53), (float)((float)((float)(v124 * v124) * v13) + 0.333) * sqrtf(vaddv_f32(vmul_f32(v52, v52))));
            LODWORD(v58) = *(float32x2_t *)v120->f32;
            v137 = *v28;
            v138 = *v120;
            *(float32x2_t *)v59.i8 = *v120;
            v135 = (float32x2_t)vextq_s8((int8x16_t)v57, (int8x16_t)v57, 8uLL).u64[0];
            v59.u64[1] = (unint64_t)v135;
            v53.i64[0] = v57.i64[0];
            *(float32x2_t *)&v53.u32[2] = *v28;
            v60 = vbslq_s8((int8x16_t)vcgtq_f32(v56, v57), v59, (int8x16_t)v53);
            v61 = (float32x4_t)vextq_s8(v60, v60, 8uLL);
            v136 = *(float32x2_t *)v57.f32;
            v62 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v57, v56), v59, (int8x16_t)v53);
            v63 = (int8x16_t)vcgtq_f32(v61, v62);
            v53.i64[1] = v61.i64[1];
            v61.i64[1] = v62.i64[1];
            v53.i64[0] = v62.i64[0];
            v144 = vbslq_s8(v63, (int8x16_t)v53, (int8x16_t)v61);
            v143 = (float32x2_t)vextq_s8(v144, v144, 8uLL).u64[0];
            while (1)
            {
              v64 = (_QWORD *)(v6 + 352 * v51);
              v146 = (int32x2_t)v64[1];
              v147 = *(float32x2_t *)((char *)v64 + 28);
              v145 = *(int32x2_t *)((char *)v64 + 36);
              v65 = *((float *)v64 + 15);
              v148 = *(float32x2_t *)v64;
              if (LinesCross(v58, v127.f32[1], v128.f32[0], v128.f32[1], COERCE_FLOAT(*v64), COERCE_FLOAT(HIDWORD(*v64)), v147.f32[0], v147.f32[1]))
              {
                break;
              }
              v66 = vsub_f32(v147, v148);
              *(int32x2_t *)v67.f32 = v146;
              v68 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(v146, 1), v145), (float32x2_t)vrev64_s32((int32x2_t)v66)), v66, (float32x2_t)__PAIR64__(v145.u32[1], v146.u32[0]));
              v69.i16[0] = vcltz_f32(v68).u16[0];
              v69.i16[1] = v69.i16[0];
              v69.i16[2] = vcgtz_f32(v68).i16[2];
              v69.i16[3] = v69.i16[2];
              *(int32x2_t *)&v67.u32[2] = v145;
              *(float32x2_t *)v70.f32 = v148;
              *(float32x2_t *)&v70.u32[2] = v147;
              v71 = vmlaq_n_f32(v70, (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16(v69), (int8x16_t)vnegq_f32(v67), (int8x16_t)v67), (float)((float)((float)(v65 * v65) * v13) + 0.333) * sqrtf(vaddv_f32(vmul_f32(v66, v66))));
              *(float32x2_t *)v72.f32 = v148;
              *(float32x2_t *)&v72.u32[2] = v147;
              v73 = (float32x2_t)vextq_s8((int8x16_t)v71, (int8x16_t)v71, 8uLL).u64[0];
              *(float32x2_t *)v67.f32 = v148;
              *(float32x2_t *)&v67.u32[2] = v73;
              v74.i64[0] = v71.i64[0];
              v74.u64[1] = (unint64_t)v147;
              v75 = vbslq_s8((int8x16_t)vcgtq_f32(v72, v71), (int8x16_t)v67, v74);
              v76 = (float32x4_t)vextq_s8(v75, v75, 8uLL);
              v77 = (float32x4_t)vbslq_s8((int8x16_t)vcgtq_f32(v71, v72), (int8x16_t)v67, v74);
              _Q4 = (int8x16_t)vcgtq_f32(v76, v77);
              v74.i64[1] = v76.i64[1];
              v76.i64[1] = v77.i64[1];
              v74.i64[0] = v77.i64[0];
              v79 = vbslq_s8(_Q4, v74, (int8x16_t)v76);
              __asm { FMOV            V4.2S, #4.0 }
              *(int32x2_t *)v79.i8 = vcge_f32(vmaxnm_f32(*(float32x2_t *)v79.i8, *(float32x2_t *)v144.i8), vadd_f32(vminnm_f32((float32x2_t)*(_OWORD *)&vextq_s8(v79, v79, 8uLL), v143), *(float32x2_t *)_Q4.i8));
              if (((v79.i32[0] | v79.i32[1]) & 1) == 0)
              {
                v80 = v22;
                v81 = v13;
                v82 = 0;
                v157 = 0;
                memset(v156, 0, sizeof(v156));
                v155 = 0;
                v83 = 0.0;
                memset(v154, 0, sizeof(v154));
                do
                {
                  v84 = 1.0 - v83;
                  v85 = (float)(v84 * v84) * v84;
                  v86 = (float)(v83 * 3.0) * (float)(v84 * v84);
                  v87 = (float)(1.0 - v83) * (float)(3.0 * (float)(v83 * v83));
                  v88 = (float)(v83 * v83) * v83;
                  *(float32x2_t *)((char *)v156 + v82) = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v138, v85), v136, v86), v135, v87), v137, v88);
                  *(float32x2_t *)((char *)v154 + v82) = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v148, v85), *(float32x2_t *)v71.f32, v86), v73, v87), v147, v88);
                  v83 = v83 + 0.0625;
                  v82 += 8;
                }
                while (v82 != 136);
                v89 = 0;
                v90 = 1;
                v91 = *((float *)v156 + 1);
                v92 = *(float *)v156;
LABEL_24:
                v93 = 0;
                v94 = v89 + 1;
                v95 = (float *)v156 + 2 * v89 + 2;
                v97 = *v95;
                v96 = v95[1];
                do
                {
                  v98 = v93 + 8;
                  if (v93 == 128)
                  {
                    v90 = v89 < 0xF;
                    v91 = v96;
                    v92 = v97;
                    ++v89;
                    if (v94 != 16)
                      goto LABEL_24;
                    v6 = a3;
                    v13 = v81;
                    v22 = v80;
                    v21 = v134;
                    v58 = v127.f32[0];
                    goto LABEL_31;
                  }
                  v99 = LinesCross(v92, v91, v97, v96, *(float *)((char *)v154 + v93), *(float *)((char *)v154 + v93 + 4), *(float *)((char *)v154 + v93 + 8), *(float *)((char *)v154 + v93 + 12));
                  v93 = v98;
                }
                while (!v99);
                v6 = a3;
                v13 = v81;
                v22 = v80;
                v21 = v134;
                v58 = v127.f32[0];
                if (v90)
                  break;
              }
LABEL_31:
              if (++v51 == a4)
                goto LABEL_32;
            }
            v12 = v139;
            v15 = v140;
            v8 = v131;
            v9 = v132;
            *(float *)&v17 = v141;
            v11 = v117;
            a1 = v118;
LABEL_35:
            v14 = 1.0;
LABEL_36:
            v20 = v129;
            v19 = v130;
            goto LABEL_37;
          }
LABEL_32:
          v151 = *v115;
          v152 = *((_DWORD *)v115 + 2);
          v149 = v28[2];
          v150 = v28[3].i32[0];
          memset(__src, 0, sizeof(__src));
          v111 = v124;
          v11 = v117;
          v112 = __PAIR64__(v116, v10);
          a1 = v118;
          v14 = 1.0;
          v9 = v127;
          v8 = v128;
          v15 = v125;
          v12 = v126;
          v20 = v129;
          v19 = v130;
          v17 = v121;
        }
        else
        {
          v12 = v23;
          v15 = v24;
          v8 = v25;
          v9 = v26;
          *(float *)&v17 = v27;
        }
LABEL_37:
        ++v10;
        v23 = v12;
        v24 = v15;
        v25 = v8;
        v26 = v9;
        v27 = *(float *)&v17;
      }
      while (v10 < v11);
    }
    v10 = v114 + 1;
    v16 = v113;
  }
  while (v113 != v110);
  if (HIDWORD(v112) == (_DWORD)v112)
    return 0;
  v100 = (_OWORD *)(a1 + 28 * HIDWORD(v112));
  v156[0] = *v100;
  *(_OWORD *)((char *)v156 + 12) = *(_OWORD *)((char *)v100 + 12);
  v101 = (_OWORD *)(a1 + 28 * v108);
  v102 = *(_OWORD *)((char *)v101 + 12);
  *v100 = *v101;
  *(_OWORD *)((char *)v100 + 12) = v102;
  *(_OWORD *)((char *)v101 + 12) = *(_OWORD *)((char *)v156 + 12);
  *v101 = v156[0];
  if ((_DWORD)v112 == v108)
    v103 = HIDWORD(v112);
  else
    v103 = v112;
  v104 = (_OWORD *)(a1 + 28 * v103);
  v156[0] = *v104;
  *(_OWORD *)((char *)v156 + 12) = *(_OWORD *)((char *)v104 + 12);
  v105 = (_OWORD *)(a1 + 28 * (v108 | 1));
  v106 = *(_OWORD *)((char *)v105 + 12);
  *v104 = *v105;
  *(_OWORD *)((char *)v104 + 12) = v106;
  *(_OWORD *)((char *)v105 + 12) = *(_OWORD *)((char *)v156 + 12);
  *v105 = v156[0];
  v107 = v6 + 352 * a4;
  *(float32x2_t *)v107 = v9;
  *(int32x2_t *)(v107 + 8) = v12;
  *(_QWORD *)(v107 + 16) = v151;
  *(_DWORD *)(v107 + 24) = v152;
  *(float32x2_t *)(v107 + 28) = v8;
  *(int32x2_t *)(v107 + 36) = v15;
  *(float32x2_t *)(v107 + 44) = v149;
  *(_DWORD *)(v107 + 52) = v150;
  *(float *)(v107 + 56) = *(float *)&v17;
  *(float *)(v107 + 60) = v111;
  memcpy((void *)(v107 + 64), __src, 0x120uLL);
  return ConnectIsophotes(a1, a2, v6, a4 + 1) + 1;
}

double ReadEdgeColors_(_OWORD *a1, float *a2, float *a3)
{
  unsigned int v3;
  float v4;
  float v5;
  float v6;
  float v7;
  unsigned int i;
  int v9;
  unsigned int v10;
  unsigned int v11;
  float v12;
  unsigned int v13;
  float v14;
  float v15;
  uint64_t j;
  float v17;
  double result;
  _OWORD v19[2];
  int v20;
  uint64_t v21;

  v3 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  a1[7] = 0u;
  a1[8] = 0u;
  a1[5] = 0u;
  a1[6] = 0u;
  a1[3] = 0u;
  a1[4] = 0u;
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  memset(v19, 0, sizeof(v19));
  v4 = *a2;
  v5 = a2[1];
  v6 = *a3;
  v7 = a3[1];
  v20 = 0;
  do
  {
    for (i = 0; i != 9; ++i)
    {
      v9 = vcvts_n_s32_f32((float)(v6 * (float)((float)v3 - v4)) + (float)(v7 * (float)((float)i - v5)), 8uLL);
      v10 = v9 + 1024;
      if (v9 >= -1024)
        v11 = 2047;
      else
        v11 = 0;
      if (v10 <= 0x7FF)
        v11 = v10;
      v12 = (float)v11;
      v13 = v11 >> 8;
      v14 = v12 * 0.0039062;
      v15 = *((float *)v19 + v13 + 1);
      *((float *)v19 + v13) = (float)(*((float *)v19 + v13) + 1.0) - v14;
      *((float *)v19 + v13 + 1) = v14 + v15;
    }
    ++v3;
  }
  while (v3 != 9);
  for (j = 0; j != 36; j += 4)
  {
    v17 = *(float *)((char *)v19 + j);
    if (v17 > 0.0)
      *(float *)((char *)v19 + j) = 1.0 / v17;
  }
  result = 0.0;
  *a1 = 0u;
  a1[8] = 0u;
  return result;
}

uint64_t CInwardBlur::InwardBlur(uint64_t a1)
{
  CMemEnv **v1;
  uint64_t v2;
  uint64_t v3;
  int64x2_t *v4;
  int64x2_t *v5;
  int64x2_t *v6;
  int64x2_t *v7;
  CMemEnv **v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  float v17;
  float v18;
  unsigned int v19;
  unint64_t v20;
  size_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  char v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  void *v32;
  size_t v33;
  uint64_t v34;
  float v35;
  float v36;
  unsigned int v37;
  unint64_t v38;
  size_t v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned int v45;
  char v46;
  unint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  void *v51;
  size_t v52;
  float v53;
  float v54;
  unsigned int v55;
  unint64_t v56;
  size_t v57;
  int v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  char v64;
  unint64_t v65;
  uint64_t v66;
  unint64_t v67;
  uint64_t v68;
  void *v69;
  size_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  int32x2_t v74;
  float32x2_t v75;
  float32x2_t v76;
  float *v77;
  float *v78;
  __float2 v79;
  float v80;
  __float2 v81;
  uint64_t v82;
  int v83;
  int v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  int v90;
  int v91;
  signed int v92;
  unsigned int v93;
  int v94;
  uint64_t v96;
  int v97;
  uint64_t v98;
  uint64_t v99;
  float v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  unsigned int v104;
  unsigned int v105;
  uint64_t v106;
  unint64_t v107;
  unsigned int v108;
  int v109;
  int64x2_t v110;
  int32x2_t v111;
  float32x4_t v116;
  uint64_t v117;
  float *v118;
  float *v119;
  float32x4_t v120;
  uint64_t v121;
  _OWORD *v122;
  float32x2_t *v124;
  float32x2_t v125;
  int32x2_t *v126;
  float32x2_t v127;
  int32x2_t v128;
  float32x2_t v129;
  int32x2_t v130;
  int8x8_t v131;
  int8x8_t v132;
  int32x2_t v133;
  float v136;
  float v137;
  float v138;
  float v139;
  float v140;
  int32x2_t v141;
  int32x2_t v142;
  int32x2_t v143;
  int32x2_t v144;
  __int128 v145;
  int32x2_t v146;
  int8x8_t v147;
  int32x2_t v148;
  int32x2_t v149;
  int32x2_t v150;
  int32x2_t v151;
  int32x2_t v152;
  __int128 v153;
  float32x2_t v154;
  float32x2_t v155;
  float32x4_t v156;
  int32x2_t v157;
  float32x2_t v158;
  float32x2_t v159;
  float32x4_t v160;
  int8x16_t v161;
  float32x2_t v162;
  float v163;
  float32x2_t v164;
  float v165;
  float v166;
  double v167;
  float v168;
  float v169;
  int j;
  uint64_t v171;
  uint64_t v172;
  uint64_t v174;
  uint64_t v175;
  int v176;
  unsigned int v177;
  int v178;
  uint64_t v180;
  uint64_t v181;
  unsigned int v182;
  int v183;
  uint64_t v184;
  uint64_t v185;
  unsigned int v186;
  uint64_t v187;
  uint64_t v188;
  float v189;
  float v190;
  uint64_t v191;
  unsigned int v192;
  unsigned int v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  unsigned int v200;
  float32x4_t v201;
  uint64_t v202;
  float v203;
  float v204;
  uint64_t v205;
  uint64_t v206;
  float v207;
  float v208;
  float v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  float v216;
  float32x4_t v217;
  uint64_t v218;
  float v219;
  float v220;
  uint64_t v221;
  unsigned int v222;
  unsigned int v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unsigned int v231;
  float32x4_t v232;
  int v233;
  uint64_t v234;
  unint64_t v235;
  unint64_t v236;
  unint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  float32x2_t v241;
  unint64_t v242;
  unsigned int v243;
  unint64_t v244;
  uint64_t v245;
  uint64_t v246;
  unint64_t v247;
  uint64_t v248;
  uint64_t v249;
  float v250;
  float v251;
  unint64_t v252;
  unsigned int v253;
  uint64_t v254;
  int v255;
  int v256;
  int v257;
  BOOL v258;
  BOOL v261;
  int v262;
  uint64_t v264;
  uint64_t v265;
  unsigned int v266;
  unsigned int v267;
  unsigned int v268;
  unsigned int v269;
  float v270;
  unsigned int v271;
  unsigned int v272;
  unsigned int v273;
  unsigned int v274;
  unsigned int v275;
  unsigned int v276;
  float v277;
  uint64_t v278;
  int v279;
  unsigned int v280;
  unsigned int v281;
  uint64_t v282;
  uint64_t v283;
  unsigned int v284;
  unsigned int v285;
  float v287;
  float *v288;
  uint64_t v289;
  int v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  unsigned int v296;
  unsigned int v297;
  float v299;
  float *v300;
  uint64_t v301;
  float32x2_t v302;
  float v303;
  float32x2_t *v304;
  float32x2_t v305;
  float32x2_t v306;
  float32x2_t v307;
  float v308;
  float32x2_t v309;
  float v310;
  float v311;
  float v312;
  float v313;
  float v314;
  float v315;
  float v316;
  float v317;
  float v318;
  float v319;
  float v320;
  float v321;
  float v322;
  float v323;
  float v324;
  float v325;
  uint64_t v326;
  float *v327;
  float v329;
  float *v331;
  float *v332;
  float *v333;
  float v334;
  float *v335;
  int v336;
  uint64_t v337;
  unint64_t v338;
  uint64_t v339;
  int v340;
  uint64_t v341;
  uint64_t v342;
  unint64_t v343;
  int v344;
  unint64_t v345;
  uint64_t v346;
  uint64_t v347;
  unint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  float v353;
  unsigned int v354;
  size_t v355;
  size_t v356;
  size_t v357;
  float32x4_t v358;
  float32x2_t v359;
  unsigned int v360;
  size_t __len;
  size_t __lena;
  size_t __lenb;
  int64x2_t __lenc;
  float32x4_t __lend;
  int32x2_t __lene;
  uint64_t __lenf;
  _QWORD v368[2];
  uint64_t v369;
  uint64_t v370;
  unsigned int v371;
  uint64_t v372;
  char v373;
  _QWORD v374[2];
  uint64_t v375;
  uint64_t v376;
  __int128 v377;
  int64x2_t v378;
  uint64_t v379;
  char v380;
  int64x2_t v381;
  uint64_t v382;
  uint64_t v383;
  unint64_t v384;
  unint64_t v385;
  char v386;
  CMemEnv *v387;
  uint64_t v388;
  int v389;
  __int16 v390;
  int v391;
  __int16 v392;
  int64x2_t v393;
  uint64_t v394;
  uint64_t v395;
  __int128 v396;
  __int128 v397;
  uint64_t v398;
  __int16 v399;
  _OWORD v400[2];
  _BYTE v401[11224];
  _DWORD v402[448];
  _QWORD v403[4];
  __int128 v404;
  __int128 v405;
  uint64_t v406;
  __int16 v407;
  __int128 v408;
  uint64_t v409;
  uint64_t v410;
  __int128 v411;
  int64x2_t v412;
  uint64_t v413;
  _WORD v414[6272];
  __int128 v415;
  pthread_mutex_t v416;
  __int128 *v417;
  void (**v418)(CLock *__hidden);
  char v419;
  uint64_t v420;
  __int128 v421;
  uint64_t v422;
  int v423;
  char v424;
  char v425;
  uint64_t v426;

  v1 = (CMemEnv **)MEMORY[0x1E0C80A78](a1);
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v1;
  v426 = *MEMORY[0x1E0C80C00];
  v9 = v6[3].u32[0];
  v10 = v6[3].u32[2];
  CGrNavigator::CGrNavigator((CGrNavigator *)v374, *v1, v9, v10, 16);
  v374[0] = off_1E5014798;
  if (v380)
  {
    CGrNavigator::CGrNavigator((CGrNavigator *)v368, *v8, v9, v10, 1);
    v368[0] = off_1E50147D8;
    if (!v373)
    {
      v34 = 7;
LABEL_159:
      CGrNavigator::~CGrNavigator((CGrNavigator *)v368);
      goto LABEL_160;
    }
    v11 = v378.u32[2];
    if (v378.i32[2])
    {
      v12 = 0;
      v13 = v378.u32[0];
      v14 = 16 * v378.u32[0];
      do
      {
        if (v13)
        {
          v15 = 0;
          do
          {
            *(_OWORD *)(v15 + v375 + v12 * v376) = *(_OWORD *)(v15 + v7[1].i64[0] + v12 * v7[1].i64[1]);
            v15 += 16;
          }
          while (v14 != v15);
        }
        ++v12;
      }
      while (v12 != v11);
    }
    v349 = (uint64_t)v8;
    if (v3)
    {
      v16 = *(_QWORD *)(v3 + 32);
      if (v16 != 4)
      {
        if (v16 != 2)
        {
          if (v16 != 1)
            goto LABEL_77;
          v17 = *((float *)v8 + 7);
          v18 = 256.0;
          if (v17 >= 1.0)
          {
            if (v17 < 256.0)
            {
LABEL_17:
              __len = v371;
              v19 = v372;
              v21 = *((unsigned int *)v8 + 2);
              v20 = *((unsigned int *)v8 + 3);
              v22 = *(_DWORD *)(v349 + 20);
              v355 = *(unsigned int *)(v349 + 16);
              v23 = *(unsigned int *)(v3 + 56);
              if (*(_DWORD *)(v3 + 56))
              {
                v24 = 0;
                v25 = *(unsigned int *)(v3 + 48);
                do
                {
                  if (v25)
                  {
                    for (i = 0; i != v25; ++i)
                    {
                      if ((int)v17 <= *(unsigned __int8 *)(i
                                                                        + *(_QWORD *)(v3 + 16)
                                                                        + v24 * *(_QWORD *)(v3 + 24)))
                        v27 = 0;
                      else
                        v27 = 7;
                      *(_BYTE *)(v369 + (v21 + i) + v370 * (v20 + v24)) = v27;
                    }
                  }
                  ++v24;
                }
                while (v24 != v23);
              }
              if (v19)
              {
                v28 = 0;
                v29 = v19;
                v30 = v19 - v22;
                do
                {
                  v31 = v369 + v370 * v28;
                  if (v28 < v20 || v28 >= v30)
                  {
                    v32 = (void *)(v369 + v370 * v28);
                    v33 = __len;
                  }
                  else
                  {
                    memset((void *)(v369 + v370 * v28), 7, v21);
                    v32 = (void *)(v31 + __len - v355);
                    v33 = v355;
                  }
                  memset(v32, 7, v33);
                  ++v28;
                }
                while (v29 != v28);
              }
              goto LABEL_77;
            }
            v18 = 0.0039062;
          }
          v17 = v17 * v18;
          goto LABEL_17;
        }
        v53 = *((float *)v8 + 7);
        if (v53 >= 1.0)
        {
          v54 = 256.0;
          if (v53 >= 256.0)
          {
LABEL_61:
            __lenb = v371;
            v55 = v372;
            v57 = *((unsigned int *)v8 + 2);
            v56 = *((unsigned int *)v8 + 3);
            v58 = *(_DWORD *)(v349 + 20);
            v357 = *(unsigned int *)(v349 + 16);
            v59 = *(unsigned int *)(v3 + 56);
            if (*(_DWORD *)(v3 + 56))
            {
              v60 = 0;
              v61 = *(unsigned int *)(v3 + 48);
              do
              {
                if (v61)
                {
                  v62 = 0;
                  v63 = v57;
                  do
                  {
                    if ((int)v53 <= *(unsigned __int16 *)(v62
                                                                       + *(_QWORD *)(v3 + 16)
                                                                       + v60 * *(_QWORD *)(v3 + 24)))
                      v64 = 0;
                    else
                      v64 = 7;
                    *(_BYTE *)(v369 + v63 + v370 * (v56 + v60)) = v64;
                    v62 += 2;
                    ++v63;
                  }
                  while (2 * v61 != v62);
                }
                ++v60;
              }
              while (v60 != v59);
            }
            if (v55)
            {
              v65 = 0;
              v66 = v55;
              v67 = v55 - v58;
              do
              {
                v68 = v369 + v370 * v65;
                if (v65 < v56 || v65 >= v67)
                {
                  v69 = (void *)(v369 + v370 * v65);
                  v70 = __lenb;
                }
                else
                {
                  memset((void *)(v369 + v370 * v65), 7, v57);
                  v69 = (void *)(v68 + __lenb - v357);
                  v70 = v357;
                }
                memset(v69, 7, v70);
                ++v65;
              }
              while (v66 != v65);
            }
            goto LABEL_77;
          }
        }
        else
        {
          v54 = 65536.0;
        }
        v53 = v53 * v54;
        goto LABEL_61;
      }
      v35 = *((float *)v8 + 7);
      v36 = v35 * 0.000015259;
      if (v35 < 256.0)
        v36 = v35 * 0.0039062;
      if (v35 >= 1.0)
        v35 = v36;
      __lena = v371;
      v37 = v372;
      v39 = *((unsigned int *)v8 + 2);
      v38 = *((unsigned int *)v8 + 3);
      v40 = *(_DWORD *)(v349 + 20);
      v356 = *(unsigned int *)(v349 + 16);
      v41 = *(unsigned int *)(v3 + 56);
      if (*(_DWORD *)(v3 + 56))
      {
        v42 = 0;
        v43 = *(unsigned int *)(v3 + 48);
        do
        {
          if (v43)
          {
            v44 = 0;
            v45 = v39;
            do
            {
              if (*(float *)(v44 + *(_QWORD *)(v3 + 16) + v42 * *(_QWORD *)(v3 + 24)) < v35)
                v46 = 7;
              else
                v46 = 0;
              *(_BYTE *)(v369 + v45 + v370 * (v38 + v42)) = v46;
              v44 += 4;
              ++v45;
            }
            while (4 * v43 != v44);
          }
          ++v42;
        }
        while (v42 != v41);
      }
      if (v37)
      {
        v47 = 0;
        v48 = v37;
        v49 = v37 - v40;
        do
        {
          v50 = v369 + v370 * v47;
          if (v47 < v38 || v47 >= v49)
          {
            v51 = (void *)(v369 + v370 * v47);
            v52 = __lena;
          }
          else
          {
            memset((void *)(v369 + v370 * v47), 7, v39);
            v51 = (void *)(v50 + __lena - v356);
            v52 = v356;
          }
          memset(v51, 7, v52);
          ++v47;
        }
        while (v48 != v47);
      }
    }
LABEL_77:
    v71 = v349;
    if (!*(_BYTE *)(v349 + 42))
    {
LABEL_158:
      v34 = CInwardBlur::ProcessBuffer_(v71, v374, v368);
      if ((_DWORD)v34)
        goto LABEL_159;
      v410 = v376;
      v409 = v375;
      v411 = v377;
      v412 = vshrq_n_s64(vshlq_n_s64(v378, 0x20uLL), 0x20uLL);
      v413 = v379;
      v414[0] = 1;
      *((_QWORD *)&v408 + 1) = 0;
      *(_QWORD *)&v408 = off_1E5014798;
      v180 = v5[3].u32[2];
      if (v5[3].i32[2])
      {
        v181 = 0;
        v182 = *(_DWORD *)(v71 + 8);
        v183 = *(_DWORD *)(v71 + 12);
        v184 = v5[3].u32[0];
        do
        {
          if (v184)
          {
            v185 = 0;
            v186 = v182;
            do
            {
              *(_OWORD *)(v185 + v5[1].i64[0] + v181 * v5[1].i64[1]) = *(_OWORD *)(v409
                                                                                 + 16 * v186
                                                                                 + v410 * (v183 + v181));
              v185 += 16;
              ++v186;
            }
            while (16 * v184 != v185);
          }
          ++v181;
        }
        while (v181 != v180);
      }
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v408);
      v34 = 0;
      if (!v3 || !*(_BYTE *)(v71 + 41))
        goto LABEL_159;
      v187 = *(_QWORD *)(v3 + 32);
      if (v187 != 4)
      {
        if (v187 != 2)
        {
          if (v187 == 1)
          {
            v188 = v5[3].u32[2];
            v189 = *(float *)(v71 + 28);
            v190 = 256.0;
            if (v189 >= 1.0)
            {
              if (v189 < 256.0)
                goto LABEL_176;
              v190 = 0.0039062;
            }
            v189 = v189 * v190;
LABEL_176:
            if (v5[3].i32[2])
            {
              v191 = 0;
              v192 = (int)v189;
              v193 = (int)(float)(65535.0
                                / (float)((float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
                                        * (float)(255 - (int)v189)));
              v194 = v5[3].u32[0];
              while (!v194)
              {
LABEL_186:
                v34 = 0;
                if (++v191 == v188)
                  goto LABEL_159;
              }
              v195 = 0;
              v196 = 0;
              while (1)
              {
                v197 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v191);
                v198 = v7[1].i64[0] + 16 * (v196 + *(_DWORD *)(v71 + 8));
                v199 = v5[1].i64[0] + v191 * v5[1].i64[1];
                v200 = *(unsigned __int8 *)(v196 + *(_QWORD *)(v3 + 16) + v191 * *(_QWORD *)(v3 + 24));
                if (v200 <= v192)
                  break;
                if (v200 < (int)(float)(65535.0 / (float)v193))
                {
                  v201 = vmlaq_n_f32(*(float32x4_t *)(v198 + v197), vsubq_f32(*(float32x4_t *)(v195 + v199), *(float32x4_t *)(v198 + v197)), (float)(int)((v200 - v192) * v193) * 0.000015259);
LABEL_184:
                  *(float32x4_t *)(v195 + v199) = v201;
                }
                ++v196;
                v195 += 16;
                if (v194 == v196)
                  goto LABEL_186;
              }
              v201 = *(float32x4_t *)(v197 + v198);
              goto LABEL_184;
            }
          }
LABEL_220:
          v34 = 0;
          goto LABEL_159;
        }
        v218 = v5[3].u32[2];
        v219 = *(float *)(v71 + 28);
        v220 = 256.0;
        if (v219 >= 1.0)
        {
          if (v219 < 256.0)
          {
LABEL_208:
            if (!v5[3].i32[2])
              goto LABEL_220;
            v221 = 0;
            v222 = (int)v219;
            v223 = (float)(4295000000.0
                                       / (float)((float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
                                               * (float)(0xFFFF - (int)v219)));
            v224 = v5[3].u32[0];
            while (!v224)
            {
LABEL_218:
              v34 = 0;
              if (++v221 == v218)
                goto LABEL_159;
            }
            v225 = 0;
            v226 = 0;
            v227 = 0;
            while (1)
            {
              v228 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v221);
              v229 = v7[1].i64[0] + 16 * (v227 + *(_DWORD *)(v71 + 8));
              v230 = v5[1].i64[0] + v221 * v5[1].i64[1];
              v231 = *(unsigned __int16 *)(v226 + *(_QWORD *)(v3 + 16) + v221 * *(_QWORD *)(v3 + 24));
              if (v231 <= v222)
                break;
              if (0xFFFFFFFF / v223 + (int)v219 > v231)
              {
                v232 = vmlaq_n_f32(*(float32x4_t *)(v229 + v228), vsubq_f32(*(float32x4_t *)(v225 + v230), *(float32x4_t *)(v229 + v228)), (float)(((v231 - v222) * v223) >> 16) * 0.000015259);
LABEL_216:
                *(float32x4_t *)(v225 + v230) = v232;
              }
              ++v227;
              v226 += 2;
              v225 += 16;
              if (v224 == v227)
                goto LABEL_218;
            }
            v232 = *(float32x4_t *)(v228 + v229);
            goto LABEL_216;
          }
          v220 = 0.0039062;
        }
        v219 = v219 * v220;
        goto LABEL_208;
      }
      v202 = v5[3].u32[2];
      v203 = *(float *)(v71 + 28);
      v204 = v203 * 0.000015259;
      if (v203 < 256.0)
        v204 = v203 * 0.0039062;
      if (v203 >= 1.0)
        v203 = v204;
      if (!v5[3].i32[2])
        goto LABEL_220;
      v205 = 0;
      v206 = v5[3].u32[0];
      v207 = (float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001)
           - (float)(v203 * (float)((float)(*(float *)(v71 + 36) * 0.999) + 0.001));
      v208 = v207 + v203;
      v209 = 1.0 / v207;
      while (!v206)
      {
LABEL_202:
        v34 = 0;
        if (++v205 == v202)
          goto LABEL_159;
      }
      v210 = 0;
      v211 = 0;
      v212 = 0;
      while (1)
      {
        v213 = v7[1].i64[1] * (*(_DWORD *)(v71 + 12) + v205);
        v214 = v7[1].i64[0] + 16 * (v212 + *(_DWORD *)(v71 + 8));
        v215 = v5[1].i64[0] + v205 * v5[1].i64[1];
        v216 = *(float *)(v211 + *(_QWORD *)(v3 + 16) + v205 * *(_QWORD *)(v3 + 24));
        if (v216 < v203)
          break;
        if (v216 <= v208)
        {
          v217 = vmlaq_n_f32(*(float32x4_t *)(v214 + v213), vsubq_f32(*(float32x4_t *)(v210 + v215), *(float32x4_t *)(v214 + v213)), (float)(v216 - v203) * v209);
          goto LABEL_200;
        }
LABEL_201:
        ++v212;
        v211 += 4;
        v210 += 16;
        if (v206 == v212)
          goto LABEL_202;
      }
      v217 = *(float32x4_t *)(v213 + v214);
LABEL_200:
      *(float32x4_t *)(v210 + v215) = v217;
      goto LABEL_201;
    }
    bzero(v402, 0x700uLL);
    bzero(v400, 0x2C00uLL);
    if (*(_BYTE *)(v349 + 44))
    {
      v72 = *(_DWORD *)(v349 + 48);
      __lenc = v7[3];
      bzero(v400, 352 * v72);
      if (v72 >= 1)
      {
        v73 = v72;
        v74 = *(int32x2_t *)(v349 + 8);
        v75 = vcvt_f32_u32((uint32x2_t)vsub_s32(vmovn_s64(__lenc), vadd_s32(v74, *(int32x2_t *)(v349 + 16))));
        v76 = vcvt_f32_u32((uint32x2_t)v74);
        v77 = (float *)v401;
        v78 = (float *)(v349 + 72);
        do
        {
          *((float32x2_t *)v77 - 5) = vmla_f32(v76, v75, *(float32x2_t *)(v78 - 5));
          *(float32x2_t *)(v77 - 3) = vmla_f32(v76, v75, *(float32x2_t *)(v78 - 3));
          v79 = __sincosf_stret(*(v78 - 1));
          *(v77 - 8) = v79.__cosval;
          *(v77 - 7) = v79.__sinval;
          v80 = *v78;
          v78 += 6;
          v81 = __sincosf_stret(v80);
          *(v77 - 1) = v81.__cosval;
          *v77 = v81.__sinval;
          v77 += 88;
          --v73;
        }
        while (v73);
      }
LABEL_122:
      if (v72)
      {
        v121 = 0;
        v352 = v72;
        do
        {
          v122 = &v400[22 * v121];
          _S5 = *((float *)v122 + 3);
          v124 = (float32x2_t *)((char *)v122 + 28);
          v125 = *(float32x2_t *)((char *)v122 + 28);
          v126 = (int32x2_t *)((char *)v122 + 36);
          v127 = *(float32x2_t *)((char *)v122 + 36);
          v128 = vmovn_s64(v378);
          v129 = *(float32x2_t *)v122;
          v130 = vcvt_s32_f32(*(float32x2_t *)v122);
          v131 = (int8x8_t)vadd_s32(v130, (int32x2_t)0x300000003);
          v132 = (int8x8_t)vadd_s32(v128, (int32x2_t)0x800000008);
          v133 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)v131, (uint32x2_t)v132), vbic_s8(v132, (int8x8_t)vcgt_s32((int32x2_t)0x400000004, v130)), v131);
          _D2 = vsub_f32(v125, *(float32x2_t *)v122);
          __asm { FMLA            S20, S5, V2.S[1] }
          if (_S20 >= 0.0)
            v136 = *((float *)v122 + 2);
          else
            v136 = -*((float *)v122 + 2);
          if (_S20 >= 0.0)
            v137 = *((float *)v122 + 3);
          else
            v137 = -_S5;
          v138 = vaddv_f32(vmul_f32(v127, _D2));
          if (v138 <= 0.0)
            LODWORD(v139) = *(_QWORD *)((char *)v122 + 36);
          else
            v139 = -v127.f32[0];
          if (v138 <= 0.0)
            LODWORD(v140) = HIDWORD(*(_QWORD *)((char *)v122 + 36));
          else
            v140 = -v127.f32[1];
          v407 = 0;
          v403[1] = 0;
          v141 = vmax_s32(v133, 0);
          v142 = vmin_s32(v128, vadd_s32(v133, (int32x2_t)0x900000009));
          v143 = vcge_s32(v141, v142);
          if (((v143.i32[0] | v143.i32[1]) & 1) == 0)
          {
            v403[3] = v376;
            v403[2] = v375 + v376 * v141.u32[1] + v377 * v141.u32[0];
            v144 = vsub_s32(v142, v141);
            *(_QWORD *)&v145 = v144.i32[0];
            *((_QWORD *)&v145 + 1) = v144.i32[1];
            v404 = v377;
            v405 = v145;
            v406 = v379;
            LOBYTE(v407) = 1;
          }
          v359 = v125;
          v146 = vcvt_s32_f32(v125);
          v147 = (int8x8_t)vadd_s32(v146, (int32x2_t)0x300000003);
          v148 = (int32x2_t)vbsl_s8((int8x8_t)vcgt_u32((uint32x2_t)v147, (uint32x2_t)v132), vbic_s8(v132, (int8x8_t)vcgt_s32((int32x2_t)0x400000004, v146)), v147);
          v403[0] = off_1E5014798;
          v399 = 0;
          v393.i64[1] = 0;
          v149 = vmax_s32(v148, 0);
          __lene = v128;
          v150 = vmin_s32(v128, vadd_s32(v148, (int32x2_t)0x900000009));
          v151 = vcge_s32(v149, v150);
          if (((v151.i32[0] | v151.i32[1]) & 1) == 0)
          {
            v394 = v375 + v376 * v149.u32[1] + v377 * v149.u32[0];
            v395 = v376;
            v152 = vsub_s32(v150, v149);
            *(_QWORD *)&v153 = v152.i32[0];
            *((_QWORD *)&v153 + 1) = v152.i32[1];
            v396 = v377;
            v397 = v153;
            v398 = v379;
            LOBYTE(v399) = 1;
          }
          v353 = sqrtf(vmul_f32(_D2, _D2).f32[0] + (float)(_D2.f32[1] * _D2.f32[1]));
          v393.i64[0] = (uint64_t)off_1E5014798;
          *(float32x2_t *)&v421 = vsub_f32(v129, vcvt_f32_u32((uint32x2_t)v133));
          *(float *)v381.i32 = v137;
          *(float *)&v381.i32[1] = -v136;
          ReadEdgeColors_(&v408, (float *)&v421, (float *)v381.i32);
          *(float32x2_t *)v381.i8 = vsub_f32(v359, vcvt_f32_u32((uint32x2_t)v148));
          *(float *)&v387 = -v140;
          *((float *)&v387 + 1) = v139;
          ReadEdgeColors_(&v421, (float *)v381.i32, (float *)&v387);
          CGrNavigator::~CGrNavigator((CGrNavigator *)&v393);
          CGrNavigator::~CGrNavigator((CGrNavigator *)v403);
          v154 = *v124;
          v155 = *(float32x2_t *)v122;
          v156.i64[0] = *((_QWORD *)v122 + 1);
          v157 = (int32x2_t)vsub_f32(*v124, *(float32x2_t *)v122);
          v158.i32[0] = v156.i32[0];
          v158.i32[1] = HIDWORD(*(unint64_t *)v126);
          v159 = vmla_f32(vmul_f32((float32x2_t)vzip1_s32(vdup_lane_s32(*(int32x2_t *)v156.f32, 1), *v126), (float32x2_t)vrev64_s32(v157)), (float32x2_t)v157, v158);
          v158.i16[0] = vcltz_f32(v159).u16[0];
          v158.i16[1] = v158.i16[0];
          v158.i16[2] = vcgtz_f32(v159).i16[2];
          v158.i16[3] = v158.i16[2];
          *(int32x2_t *)&v156.u32[2] = *v126;
          v160 = (float32x4_t)vbslq_s8((int8x16_t)vmovl_s16((int16x4_t)v158), (int8x16_t)vnegq_f32(v156), (int8x16_t)v156);
          v156.i64[0] = *(_QWORD *)v122;
          *(float32x2_t *)&v156.u32[2] = *v124;
          v161 = (int8x16_t)vmlaq_n_f32(v156, v160, (float)((float)((float)(*(float *)&v401[352 * v121 + 20] * *(float *)&v401[352 * v121 + 20])* 0.1)+ 0.333)* sqrtf(vaddv_f32(vmul_f32((float32x2_t)v157, (float32x2_t)v157))));
          v162 = (float32x2_t)vextq_s8(v161, v161, 8uLL).u64[0];
          v163 = 0.0;
          do
          {
            v164 = vmla_n_f32(vmla_n_f32(vmla_n_f32(vmul_n_f32(v155, (float)((float)(1.0 - v163) * (float)(1.0 - v163)) * (float)(1.0 - v163)), *(float32x2_t *)v161.i8, (float)(v163 * 3.0) * (float)((float)(1.0 - v163) * (float)(1.0 - v163))), v162, (float)(1.0 - v163) * (float)(3.0 * (float)(v163 * v163))), v154, (float)(v163 * v163) * v163);
            v165 = -(float)((float)(v163 * v140) - (float)((float)(1.0 - v163) * v137));
            v166 = -(float)((float)((float)(1.0 - v163) * v136) - (float)(v163 * v139));
            v167 = 1.0 / sqrtf((float)(v165 * v165) + (float)(v166 * v166));
            v168 = v167 * v165;
            v169 = v167 * v166;
            for (j = -4; j != 5; ++j)
            {
              v171 = (int)(float)((float)(v164.f32[0] + 0.5) + (float)((float)j * v168));
              v172 = (int)(float)((float)(v164.f32[1] + 0.5) + (float)((float)j * v169));
              if (__lene.i32[0] > v171 && __lene.i32[1] > v172)
              {
                v174 = v370 * v172;
                v175 = v369 + v171;
                if (!*(_BYTE *)(v175 + v370 * v172))
                {
                  v176 = vcvts_n_s32_f32((float)((float)((float)v171 - v164.f32[0]) * v168)+ (float)((float)((float)v172 - v164.f32[1]) * v169), 8uLL);
                  v177 = v176 + 1024;
                  if (v176 >= -1024)
                    v178 = 1792;
                  else
                    v178 = 0;
                  if (v177 <= 0x7FF)
                    v178 = v177;
                  *(_OWORD *)(v375 + 16 * v171 + v376 * v172) = *(&v408 + (v178 >> 8));
                  *(_BYTE *)(v174 + v175) = 7;
                }
              }
            }
            v163 = v163 + (float)(0.75 / v353);
          }
          while (v163 < 1.0);
          ++v121;
        }
        while (v121 != v352);
      }
      v71 = v349;
      goto LABEL_158;
    }
    CGrNavigator::CGrNavigator((CGrNavigator *)&v381, *(CMemEnv **)v349, v7[3].i64[0], v7[3].i64[1], 1);
    v381.i64[0] = (uint64_t)off_1E50147D8;
    if (!v386)
      goto LABEL_118;
    v82 = *(unsigned int *)(v349 + 32);
    bzero(v403, 0x400uLL);
    v83 = v384;
    v84 = v385;
    v85 = v384;
    v86 = v385;
    if ((_DWORD)v385)
    {
      v87 = 0;
      do
      {
        if (v83)
        {
          v88 = 0;
          v89 = 0;
          do
          {
            v90 = vcvts_n_s32_f32(*(float *)(v88 + v7[1].i64[0] + v87 * v7[1].i64[1] + 4 * v82), 8uLL);
            v91 = v90 & ~(v90 >> 31);
            if (v91 >= 255)
              v91 = 255;
            ++*((_DWORD *)v403 + v91);
            *(_BYTE *)(v89 + v382 + v87 * v383) = v91;
            ++v89;
            v88 += 16;
          }
          while (v85 != v89);
        }
        ++v87;
      }
      while (v87 != v86);
    }
    if ((v84 * v83) >= 0x10)
    {
      v92 = (v84 * v83) >> 4;
      v93 = 255;
      do
      {
        v94 = v93 - 1;
        v92 -= *((_DWORD *)v403 + v93);
      }
      while (v92 >= 1 && v93-- != 1);
      if (v84 && v94 <= 0x7F)
      {
        v96 = 0;
        if (v94 <= 16)
          v97 = 16;
        else
          v97 = v94;
        do
        {
          if (v83)
          {
            v98 = 0;
            v99 = 0;
            do
            {
              v100 = (float)(*(float *)(v98 + v7[1].i64[0] + v96 * v7[1].i64[1] + 4 * v82) * 32768.0)
                   * (float)(1.0 / (float)v97);
              v101 = (int)v100 & ~((int)v100 >> 31);
              if (v101 >= 255)
                v101 = 255;
              v102 = v382;
              v103 = v383;
              ++*((_DWORD *)v403 + v101);
              *(_BYTE *)(v99 + v102 + v96 * v103) = v101;
              ++v99;
              v98 += 16;
            }
            while (v85 != v99);
          }
          ++v96;
        }
        while (v96 != v86);
      }
    }
    v104 = vmaxvq_u32(*(uint32x4_t *)(v349 + 8));
    if (v104 < 8
      || ((v105 = v104 - 5, v105 >= 8) ? (v106 = 8) : (v106 = v105),
          v384 >= v385 ? (v107 = v385) : (v107 = v384),
          v107 < (4 * v106)))
    {
LABEL_118:
      v108 = 0;
      goto LABEL_119;
    }
    __lenf = v106;
    CGrNavigator::CGrNavigator((CGrNavigator *)&v393, *(CMemEnv **)v349, v384 - (2 * v106), v385 - (2 * v106), 1);
    v393.i64[0] = (uint64_t)off_1E50147D8;
    if (!(_BYTE)v399)
    {
      v108 = 0;
LABEL_357:
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v393);
LABEL_119:
      CGrNavigator::~CGrNavigator((CGrNavigator *)&v381);
      v109 = ConnectIsophotes((uint64_t)v402, v108, (uint64_t)v400, 0);
      v72 = v109;
      v110 = v5[3];
      *(_BYTE *)(v71 + 44) = 1;
      *(_DWORD *)(v71 + 48) = v109;
      if (v109 >= 1)
      {
        v111 = *(int32x2_t *)(v71 + 8);
        __asm { FMOV            V2.2S, #1.0 }
        *(float32x2_t *)v116.f32 = vdiv_f32(_D2, vcvt_f32_u32((uint32x2_t)vsub_s32(vmovn_s64(v110), vadd_s32(v111, *(int32x2_t *)(v71 + 16)))));
        v116.i64[1] = v116.i64[0];
        __lend = v116;
        *(float32x2_t *)v116.f32 = vcvt_f32_u32((uint32x2_t)v111);
        v116.i64[1] = v116.i64[0];
        v358 = v116;
        v117 = v109;
        v118 = (float *)(v71 + 72);
        v119 = (float *)v401;
        do
        {
          v120.i64[0] = *((_QWORD *)v119 - 5);
          v120.i64[1] = *(_QWORD *)(v119 - 3);
          *(float32x4_t *)(v118 - 5) = vmulq_f32(vsubq_f32(v120, v358), __lend);
          *(v118 - 1) = atan2f(*(v119 - 7), *(v119 - 8));
          *v118 = atan2f(*v119, *(v119 - 1));
          v118 += 6;
          v119 += 88;
          --v117;
        }
        while (v117);
      }
      goto LABEL_122;
    }
    v388 = 0x3F00000042020000;
    v389 = 1065353216;
    v390 = -1;
    v391 = 0;
    v392 = 0;
    v387 = *(CMemEnv **)v349;
    *(float *)&v388 = (float)__lenf;
    CMedian::CxParms::CxParms((uint64_t)&v421, (uint64_t)&v387);
    if ((_BYTE)v421)
    {
      if ((v423 - 3) > 0x3C || v425 || v424)
      {
        BYTE8(v408) = 0;
        *(_QWORD *)&v408 = &off_1E5014928;
        v409 = *((_QWORD *)&v421 + 1);
        v410 = 0x100000001;
        LOWORD(v411) = 0;
        *((_QWORD *)&v411 + 1) = 0;
        v412 = 0u;
        LODWORD(v413) = 0;
        bzero(v414, 0x3000uLL);
        v415 = 0u;
        pthread_mutex_init(&v416, 0);
        BYTE8(v408) = 1;
        v417 = &v421;
        *(_QWORD *)&v408 = &off_1E5014BB0;
        v418 = &off_1E50148B0;
        v419 = 0;
        v420 = v422;
        if (!v422 || !(*(unsigned int (**)(uint64_t))(*(_QWORD *)v422 + 80))(v422))
          v419 = 1;
        v233 = CKernel::Process((CKernel *)&v408, &v381, &v393, 0);
        *(_QWORD *)&v408 = &off_1E5014BB0;
        v418 = &off_1E50148B0;
        if (v419 && v420)
          (*(void (**)(uint64_t))(*(_QWORD *)v420 + 88))(v420);
      }
      else
      {
        BYTE8(v408) = 0;
        *(_QWORD *)&v408 = &off_1E5014928;
        v409 = *((_QWORD *)&v421 + 1);
        v410 = 0x100000001;
        LOWORD(v411) = 0;
        *((_QWORD *)&v411 + 1) = 0;
        v412 = 0u;
        LODWORD(v413) = 0;
        bzero(v414, 0x3000uLL);
        v415 = 0u;
        pthread_mutex_init(&v416, 0);
        BYTE8(v408) = 1;
        v417 = &v421;
        *(_QWORD *)&v408 = &off_1E5014A98;
        LODWORD(v410) = 16;
        v233 = CKernel::Process((CKernel *)&v408, &v381, &v393, 0);
      }
      CKernel::~CKernel((CKernel *)&v408);
      if ((_BYTE)v421)
      {
        if (!v422)
        {
          v234 = __lenf;
          if (!v233)
          {
LABEL_239:
            v235 = (v234 + 4);
            v236 = v234 - 4 + *((_QWORD *)&v397 + 1);
            if (v236 > v235)
            {
              v354 = 0;
              v237 = v234 - 4 + v397;
              v238 = v369;
              v338 = (v234 + 4);
              v339 = v370;
              v240 = v394;
              v239 = v395;
              v336 = -3 - v234;
              v340 = -4 - v234;
              v241 = (float32x2_t)vdup_n_s32(0x3B808081u);
              v242 = v338;
              v243 = v234 + 4;
              v337 = v234 - 4 + *((_QWORD *)&v397 + 1);
              v342 = v369;
              v343 = v237;
              v341 = v395;
              while (v237 <= v235)
              {
                v242 = v243 + 1;
LABEL_352:
                v243 = v242;
                if (v236 <= v242)
                  goto LABEL_356;
              }
              v244 = v339 * v242;
              v245 = v339 * v242 + v238;
              v246 = v339 * (v243 - 1);
              v345 = v243 + 1;
              v346 = v246;
              v247 = v339 * v345;
              v248 = v239 * (v243 - v234 - 2);
              v249 = v239 * (v243 - v234 + 2);
              v250 = (float)v243;
              v251 = (float)(v243 + 16);
              v252 = v235;
              v253 = v235;
              v347 = v245;
              v348 = v339 * v242;
              v351 = v248;
              v350 = v249;
              v344 = v243 - v234 - 4;
              while (1)
              {
                v254 = v252 + v238;
                if (*(_BYTE *)(v252 + v238 + v244))
                {
                  v252 = v253 + 1;
                  v255 = *(unsigned __int8 *)(v245 + v252);
                  v256 = *(unsigned __int8 *)(v254 + v246);
                  v257 = *(unsigned __int8 *)(v254 + v247);
                  if (*(_BYTE *)(v245 + v253 - 1))
                    v258 = v255 == 0;
                  else
                    v258 = 1;
                  v261 = !v258 && v256 != 0 && v257 != 0 || (*(unsigned __int8 *)(v245 + v253 - 1) | v255) == 0;
                  v262 = v256 | v257;
                  if (v261 || v262 == 0)
                    goto LABEL_283;
                  v264 = v240 + v253 - v234 - 2;
                  v265 = v240 + v253 - v234 + 2;
                  v266 = *(unsigned __int8 *)(v265 + v248);
                  v267 = *(unsigned __int8 *)(v264 + v249);
                  v268 = *(unsigned __int8 *)(v265 + v249);
                  v269 = (*(unsigned __int8 *)(v264 + v248) - v268) * (*(unsigned __int8 *)(v264 + v248) - v268);
                  if (v269 <= (v266 - v267) * (v266 - v267))
                    v269 = (v266 - v267) * (v266 - v267);
                  if (v269 < 0x100)
                    goto LABEL_283;
                  v360 = *(unsigned __int8 *)(v264 + v248);
                  v270 = powf((float)v269, 0.25);
                  if (v267 >= v268)
                    v271 = v268;
                  else
                    v271 = v267;
                  if (v267 <= v268)
                    v272 = v268;
                  else
                    v272 = v267;
                  v273 = v360;
                  if (v360 >= v266)
                    v274 = v266;
                  else
                    v274 = v360;
                  if (v360 <= v266)
                    v273 = v266;
                  if (v274 >= v271)
                    v275 = v271;
                  else
                    v275 = v274;
                  if (v273 <= v272)
                    v276 = v272;
                  else
                    v276 = v273;
                  if (v276 - v275 >= 0x10)
                  {
                    v277 = v270 * 0.0625;
                    bzero(&v408, 0x480uLL);
                    v278 = 0;
                    v279 = 0;
                    v280 = 0;
                    v281 = (v275 + v276) >> 1;
                    v239 = v341;
                    v249 = v350;
                    do
                    {
                      v282 = 0;
                      v283 = v240 + v341 * (v344 + v278);
                      do
                      {
                        v284 = *(unsigned __int8 *)(v283 + v340 + v253 + v282);
                        v285 = *(unsigned __int8 *)(v283 + v336 + v253 + v282);
                        if (v284 != v285 && (int)((v285 - v281) * (v284 - v281)) <= 0)
                        {
                          if (v284 < v285)
                            ++v279;
                          else
                            --v279;
                          v287 = (float)(int)(v281 - v284) / (float)(int)(v285 - v284);
                          v288 = (float *)&v408 + 2 * v280;
                          *v288 = (float)((float)v282 + -4.0) + v287;
                          v288[1] = (float)v278 + -4.0;
                          ++v280;
                        }
                        ++v282;
                      }
                      while (v282 != 8);
                      ++v278;
                    }
                    while (v278 != 9);
                    v289 = 0;
                    v290 = 0;
                    do
                    {
                      v291 = 0;
                      v292 = (v344 + v289);
                      v293 = v341 * v292;
                      v294 = v341 * (v292 + 1);
                      do
                      {
                        v295 = v340 + v253 + v291 + v240;
                        v296 = *(unsigned __int8 *)(v295 + v293);
                        v297 = *(unsigned __int8 *)(v295 + v294);
                        if (v296 != v297 && (int)((v297 - v281) * (v296 - v281)) <= 0)
                        {
                          if (v296 < v297)
                            ++v290;
                          else
                            --v290;
                          v299 = (float)(int)(v281 - v296) / (float)(int)(v297 - v296);
                          v300 = (float *)&v408 + 2 * v280;
                          *v300 = (float)v291 + -4.0;
                          v300[1] = (float)((float)v289 + -4.0) + v299;
                          ++v280;
                        }
                        ++v291;
                      }
                      while (v291 != 9);
                      ++v289;
                    }
                    while (v289 != 8);
                    if (v280)
                    {
                      v301 = v280;
                      v302 = 0;
                      v303 = 0.0;
                      v304 = (float32x2_t *)&v408;
                      v305 = 0;
                      LODWORD(v234) = __lenf;
                      v238 = v342;
                      v237 = v343;
                      v248 = v351;
                      v247 = v339 * v345;
                      do
                      {
                        v306 = *v304++;
                        v307 = v306;
                        v303 = vmul_lane_f32(v307, v307, 1).f32[0] + v303;
                        v305 = vadd_f32(v306, v305);
                        v302 = vmla_f32(v302, v307, v307);
                        --v301;
                      }
                      while (v301);
                    }
                    else
                    {
                      v302 = 0;
                      v303 = 0.0;
                      v305 = 0;
                      LODWORD(v234) = __lenf;
                      v238 = v342;
                      v237 = v343;
                      v248 = v351;
                      v247 = v339 * v345;
                    }
                    v308 = -(float)(vmuls_lane_f32(v305.f32[0], v305, 1) - (float)(v303 * (float)v280));
                    v309 = vmla_n_f32(vneg_f32(vmul_f32(v305, v305)), v302, (float)v280);
                    v310 = (float)v253;
                    v311 = (float)((float)(v305.f32[1] - (float)((float)(v308 / v309.f32[0]) * v305.f32[0]))
                                 / (float)v280)
                         + v250;
                    v312 = sqrtf((float)((float)(v308 / v309.f32[0]) * (float)(v308 / v309.f32[0])) + 1.0);
                    v313 = 1.0 / v312;
                    v314 = (float)(v308 / v309.f32[0]) / v312;
                    v315 = -(float)(1.0 / v312);
                    if (v290 < 1)
                      v315 = v313;
                    else
                      v314 = -v314;
                    v316 = v308 / v309.f32[1];
                    v317 = (float)((float)(v305.f32[0] - (float)(v316 * v305.f32[1])) / (float)v280) + v310;
                    v318 = sqrtf((float)(v316 * v316) + 1.0);
                    v319 = v316 / v318;
                    v320 = 1.0 / v318;
                    v321 = -v319;
                    v322 = -v320;
                    if (v279 >= 0)
                    {
                      v322 = v320;
                      v321 = v319;
                    }
                    if (v309.f32[0] <= v309.f32[1])
                      v323 = v250;
                    else
                      v323 = v311;
                    if (v309.f32[0] <= v309.f32[1])
                      v324 = v317;
                    else
                      v324 = (float)v253;
                    if (v309.f32[0] <= v309.f32[1])
                      v325 = v322;
                    else
                      v325 = v314;
                    if (v309.f32[0] > v309.f32[1])
                      v321 = v315;
                    if (v354)
                    {
                      v326 = 0;
                      v327 = (float *)v402;
                      while (1)
                      {
                        if ((float)(*v327 + 16.0) >= v310 && *v327 <= (float)(v253 + 16))
                        {
                          v329 = v327[1];
                          if ((float)(v329 + 16.0) >= v250 && v329 <= v251)
                            break;
                        }
                        ++v326;
                        v327 += 7;
                        if (v354 == v326)
                          goto LABEL_344;
                      }
                      v333 = (float *)&v402[7 * v326];
                      v334 = v333[4];
                      v332 = v333 + 4;
                      if (v277 > v334)
                      {
                        v335 = (float *)&v402[7 * v326];
                        v335[2] = v321;
                        v335[3] = v325;
                        *v327 = v324;
                        v327[1] = v323;
                        goto LABEL_349;
                      }
                    }
                    else
                    {
LABEL_344:
                      if (v277 > 0.0)
                      {
                        if (v354 + 1 > 0x3F)
                          break;
                        v331 = (float *)&v402[7 * v354];
                        v331[2] = v321;
                        v331[3] = v325;
                        v326 = v354;
                        *v331 = v324;
                        v331[1] = v323;
                        v332 = v331 + 4;
                        ++v354;
LABEL_349:
                        *v332 = v277;
                        *(float32x2_t *)&v402[7 * v326 + 5] = vmul_f32(vcvt_f32_u32((uint32x2_t)__PAIR64__(v276, v275)), v241);
                      }
                    }
                    v245 = v347;
                    v244 = v348;
                    v246 = v346;
                    goto LABEL_283;
                  }
                  LODWORD(v234) = __lenf;
                  v238 = v342;
                  v237 = v343;
                  v239 = v341;
                  v245 = v347;
                  v244 = v348;
                  v246 = v346;
                  v248 = v351;
                  v247 = v339 * v345;
                  v249 = v350;
                }
                else
                {
                  v252 = v253 + 1;
                }
LABEL_283:
                v253 = v252;
                if (v237 <= v252)
                {
                  v236 = v337;
                  v235 = v338;
                  v242 = v345;
                  goto LABEL_352;
                }
              }
            }
          }
LABEL_355:
          v354 = 0;
LABEL_356:
          v71 = v349;
          v108 = v354;
          goto LABEL_357;
        }
        (*(void (**)(uint64_t))(*(_QWORD *)v422 + 8))(v422);
      }
    }
    else
    {
      v233 = 7;
    }
    v234 = __lenf;
    v422 = 0;
    if (!v233)
      goto LABEL_239;
    goto LABEL_355;
  }
  v34 = 7;
LABEL_160:
  CGrNavigator::~CGrNavigator((CGrNavigator *)v374);
  return v34;
}

void sub_1A64C3374(_Unwind_Exception *a1, int a2)
{
  if (a2)
    __clang_call_terminate(a1);
  _Unwind_Resume(a1);
}

uint64_t CMedian::CKernel16x128::Process_(CMedian::CKernel16x128 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;
  _WORD *v16;
  uint64_t v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  unsigned int v22;
  unsigned __int16 *v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned __int16 *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  char v31;
  int v32;
  int v33;
  uint64_t v34;
  unsigned int v35;
  int v36;
  int v37;
  uint64_t v38;
  unsigned int v39;
  int v40;
  int v41;
  uint64_t v42;
  unsigned int v43;
  int v44;
  int v45;
  uint64_t v46;
  unsigned int v47;
  int v48;
  int v49;
  unsigned int v50;
  int v51;
  int v52;
  unsigned int v53;
  BOOL v54;
  int v55;
  unsigned int v56;
  unsigned int v57;
  int v58;
  int v59;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  int v65;
  int v66;
  int v67;
  _WORD *v68;
  uint64_t *v69;
  unint64_t v70;
  uint64_t v71;
  int v72;
  int v73;
  uint64_t v74;
  unsigned int v75;
  unsigned int j;
  unsigned int i;
  int v78;
  int v79;
  unsigned int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  uint64_t v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unsigned __int16 *v94;
  _WORD *v95;
  uint64_t v96;
  int v97;
  int v98;
  uint64_t v99;
  unsigned int v100;
  __int16 v101;
  CMemBlock *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  _WORD *v107;
  uint64_t v108;
  uint64_t v109;
  _WORD *v110;
  uint64_t k;
  uint64_t v112;
  uint64_t v113;
  const CGrNavigator *v114;
  CMemBlock *v115;
  _WORD *v116;
  CMedian::CKernel16x128 *v117;
  _QWORD v118[2];
  uint64_t v119;
  uint64_t v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  __int16 v124;
  _QWORD v125[2];
  uint64_t v126;
  uint64_t v127;
  __int128 v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  __int16 v132;
  int v133;
  _DWORD v134[513];
  uint64_t v135;

  v135 = *MEMORY[0x1E0C80C00];
  v9 = CKernel::BorrowData(this, 788016);
  if (!v9)
    return 7;
  v10 = *(_QWORD *)(v9 + 32) + 788016 * a4;
  v12 = *((_QWORD *)a2 + 6);
  v11 = *((_QWORD *)a2 + 7);
  v115 = (CMemBlock *)v9;
  v116 = (_WORD *)(v10 + 67072);
  v126 = v10 + 394800;
  v127 = (2 * (_DWORD)v12 + 14) & 0xFFFFFFF0;
  v128 = xmmword_1A64DDF00;
  v129 = v12;
  v130 = v11;
  v131 = 1;
  v132 = 1;
  v125[0] = off_1E50147F8;
  v125[1] = 0;
  v114 = a3;
  v13 = *((_OWORD *)a3 + 3);
  v121 = xmmword_1A64DDF00;
  v122 = v13;
  v119 = v10 + 656944;
  v120 = (2 * (_DWORD)v13 + 14) & 0xFFFFFFF0;
  v123 = 1;
  v124 = 1;
  v118[0] = off_1E50147F8;
  v118[1] = 0;
  v14 = v10 + 67088;
  v15 = v10 + 132640;
  v16 = (_WORD *)(v10 + 263728);
  v117 = this;
  v17 = *((_QWORD *)this + 1587);
  bzero((void *)(v10 + 67088), *(unsigned __int16 *)(v17 + 44) + 1);
  v18 = v11;
  v19 = *(_DWORD *)(v17 + 36);
  v20 = *(_DWORD *)(v17 + 28);
  if ((_DWORD)v11)
  {
    v21 = 0;
    v22 = 0;
    do
    {
      v23 = (unsigned __int16 *)(*((_QWORD *)a2 + 2) + *((_QWORD *)a2 + 3) * v21);
      if (v12 < 0xA)
      {
        v53 = 0;
      }
      else
      {
        v24 = v23[1];
        v25 = *v23;
        v26 = 9;
        v27 = (unsigned __int16 *)(*((_QWORD *)a2 + 2) + *((_QWORD *)a2 + 3) * v21);
        do
        {
          v28 = v27[2];
          v29 = *(unsigned __int8 *)(v14 + v24);
          v30 = v27[3];
          v31 = *(_BYTE *)(v14 + v25) + 1;
          if (*(unsigned __int8 *)(v14 + v25) == 255)
            v134[v22++] = v25;
          v32 = v24 ^ v25;
          *(_BYTE *)(v14 + v25) = v31;
          v33 = *(unsigned __int8 *)(v14 + v28);
          v34 = v27[4];
          v35 = v29 + ((v32 - 1) >> 31) - 255;
          if (!v35)
            v134[v22++] = v24;
          v36 = v28 ^ v24;
          *(_BYTE *)(v14 + v24) = v35;
          v37 = *(unsigned __int8 *)(v14 + v30);
          v38 = v27[5];
          v39 = v33 + ((v36 - 1) >> 31) - 255;
          if (!v39)
            v134[v22++] = v28;
          v40 = v30 ^ v28;
          *(_BYTE *)(v14 + v28) = v39;
          v41 = *(unsigned __int8 *)(v14 + v34);
          v42 = v27[6];
          v43 = v37 + ((v40 - 1) >> 31) - 255;
          if (!v43)
            v134[v22++] = v30;
          v44 = v34 ^ v30;
          *(_BYTE *)(v14 + v30) = v43;
          v45 = *(unsigned __int8 *)(v14 + v38);
          v46 = v27[7];
          v47 = v41 + ((v44 - 1) >> 31) - 255;
          if (!v47)
            v134[v22++] = v34;
          v48 = v38 ^ v34;
          *(_BYTE *)(v14 + v34) = v47;
          v49 = *(unsigned __int8 *)(v14 + v42);
          v23 = v27 + 8;
          v25 = v27[8];
          v50 = v45 + ((v48 - 1) >> 31) - 255;
          if (!v50)
            v134[v22++] = v38;
          v51 = v42 ^ v38;
          *(_BYTE *)(v14 + v38) = v50;
          v52 = *(unsigned __int8 *)(v14 + v46);
          v24 = v27[9];
          if (v49 + ((v51 - 1) >> 31) == 255)
            v134[v22++] = v42;
          *(_BYTE *)(v14 + v42) = v49 + (v51 - 1 < 0) + 1;
          if (v52 + (((v46 ^ v42) - 1) >> 31) == 255)
            v134[v22++] = v46;
          *(_BYTE *)(v14 + v46) = v52 + ((int)((v46 ^ v42) - 1) < 0) + 1;
          v26 += 8;
          v27 += 8;
        }
        while (v26 < v12);
        v53 = ((v12 - 10) & 0xFFFFFFF8) + 8;
      }
      v54 = v12 >= v53;
      v55 = v12 - v53;
      if (v55 != 0 && v54)
      {
        do
        {
          v56 = *v23++;
          v57 = *(unsigned __int8 *)(v14 + v56) + 1;
          v134[v22] = v56;
          v22 += v57 >> 8;
          *(_BYTE *)(v14 + v56) = v57;
          --v55;
        }
        while (v55);
      }
      ++v21;
    }
    while (v21 != v18);
    if (v22 >= 2)
    {
      v112 = v10;
      v113 = v17;
      v58 = v18;
      v59 = v20;
      bensort_((uint64_t)v134, 0, v22 - 1);
      v20 = v59;
      v18 = v58;
      v10 = v112;
      v17 = v113;
    }
  }
  else
  {
    v22 = 0;
  }
  v134[v22] = -1;
  v133 = -1;
  LODWORD(v61) = v22 - 1;
  LODWORD(v62) = v134[v22 - 1];
  v63 = *(unsigned __int16 *)(v17 + 44);
  if (*(_BYTE *)(v17 + 46) && *(_BYTE *)(v17 + 47))
  {
    LODWORD(v64) = 0;
LABEL_52:
    v68 = v116;
    v69 = (uint64_t *)v117;
    *v16 = v64;
    v70 = (v64 + 1);
    v71 = 1;
    if ((v70 & 3) != 0 && v70 < v63)
    {
      v71 = 1;
      do
      {
        v72 = *(unsigned __int8 *)(v14 + v70);
        if (v70 == v62)
        {
          v61 = (int)v61;
          do
          {
            v72 += 256;
            v62 = v134[++v61];
          }
          while (v70 == v62);
        }
        *(_WORD *)(v15 + 2 * v70) = v71;
        if (v72)
        {
          v73 = v71;
          do
          {
            v71 = (v73 + 1);
            v16[v73++] = v70;
            --v72;
          }
          while (v72);
        }
        ++v70;
      }
      while ((v70 & 3) != 0 && v70 < v63);
    }
    goto LABEL_63;
  }
  if (v20 + ~v19 < 0)
  {
    LODWORD(v63) = v63 + 1;
  }
  else
  {
    v65 = 0;
    ++v63;
    do
    {
      --v63;
      v65 += *(unsigned __int8 *)(v14 + v63);
      if ((_DWORD)v62 == (_DWORD)v63)
      {
        v61 = (int)v61;
        do
        {
          v65 += 256;
          v66 = v134[--v61];
        }
        while (v66 == (_DWORD)v62);
        LODWORD(v62) = v66;
      }
      *(_WORD *)(v15 + 2 * v63) = -1;
    }
    while (v65 <= v20 + ~v19);
  }
  LODWORD(v62) = v134[0];
  if (v19 < 0)
  {
    if ((v63 & 0x80000000) == 0)
    {
      LODWORD(v61) = 0;
      LODWORD(v70) = 0;
      *v16 = -1;
      v71 = 1;
      v68 = v116;
      v69 = (uint64_t *)v117;
LABEL_63:
      if ((int)v70 < (int)v63 - 3)
      {
        do
        {
          v74 = v70;
          v75 = *(_DWORD *)(v14 + v70);
          j = bswap32(v75);
          if ((v70 ^ v62) < 4)
          {
            v80 = HIBYTE(j);
            *(_WORD *)(v15 + 2 * v74) = v71;
            if ((_DWORD)v62 == (_DWORD)v74)
            {
              v61 = (int)v61;
              do
              {
                v80 += 256;
                LODWORD(v62) = v134[++v61];
              }
              while ((_DWORD)v62 == (_DWORD)v74);
            }
            for (; v80; --v80)
            {
              v16[v71] = v74;
              v71 = (v71 + 1);
            }
            v81 = BYTE2(j);
            *(_WORD *)(v15 + 2 * (v74 + 1)) = v71;
            if ((_DWORD)v62 == (_DWORD)v74 + 1)
            {
              v61 = (int)v61;
              do
              {
                v81 += 256;
                v82 = v134[++v61];
              }
              while (v82 == (_DWORD)v62);
              LODWORD(v62) = v82;
            }
            for (; v81; --v81)
            {
              v16[v71] = v74 + 1;
              v71 = (v71 + 1);
            }
            v83 = BYTE1(j);
            *(_WORD *)(v15 + 2 * (v74 + 2)) = v71;
            if ((_DWORD)v62 == (_DWORD)v74 + 2)
            {
              v61 = (int)v61;
              do
              {
                v83 += 256;
                v84 = v134[++v61];
              }
              while (v84 == (_DWORD)v62);
              LODWORD(v62) = v84;
            }
            for (; v83; --v83)
            {
              v16[v71] = v74 + 2;
              v71 = (v71 + 1);
            }
            j = j;
            *(_WORD *)(v15 + 2 * (v74 + 3)) = v71;
            if ((_DWORD)v62 == (_DWORD)v74 + 3)
            {
              v61 = (int)v61;
              do
              {
                j += 256;
                v85 = v134[++v61];
              }
              while (v85 == (_DWORD)v62);
              LODWORD(v62) = v85;
            }
            for (; j; --j)
            {
              v16[v71] = v74 + 3;
              v71 = (v71 + 1);
            }
          }
          else if (v75)
          {
            *(_WORD *)(v15 + 2 * v70) = v71;
            for (i = HIBYTE(j); i; --i)
            {
              v16[v71] = v74;
              v71 = (v71 + 1);
            }
            v78 = BYTE2(j);
            *(_WORD *)(v15 + 2 * (v74 + 1)) = v71;
            if (BYTE2(j))
            {
              do
              {
                v16[v71] = v74 + 1;
                v71 = (v71 + 1);
                --v78;
              }
              while (v78);
            }
            v79 = BYTE1(j);
            *(_WORD *)(v15 + 2 * (v74 + 2)) = v71;
            if (BYTE1(j))
            {
              do
              {
                v16[v71] = v74 + 2;
                v71 = (v71 + 1);
                --v79;
              }
              while (v79);
            }
            *(_WORD *)(v15 + 2 * (v74 + 3)) = v71;
            for (j = j; j; --j)
            {
              v16[v71] = v74 + 3;
              v71 = (v71 + 1);
            }
          }
          LODWORD(v70) = v74 + 4;
        }
        while ((int)v74 + 4 < (int)v63 - 3);
      }
      if (v70 >= v63)
      {
        LODWORD(v88) = v71;
      }
      else
      {
        v86 = v70;
        do
        {
          v87 = *(unsigned __int8 *)(v14 + v86);
          if (v86 == v62)
          {
            v61 = (int)v61;
            do
            {
              v87 += 256;
              v62 = v134[++v61];
            }
            while (v86 == v62);
          }
          *(_WORD *)(v15 + 2 * v86) = v71;
          if (v87)
          {
            do
            {
              v88 = (v71 + 1);
              v16[v71] = v86;
              LODWORD(v71) = v71 + 1;
              --v87;
            }
            while (v87);
          }
          else
          {
            v88 = v71;
          }
          ++v86;
          v71 = v88;
        }
        while (v86 != v63);
      }
      *v68 = v88;
      v16[v88] = v63;
      v89 = (v18 - 1);
      if (v18 - 1 >= 0)
      {
        v90 = *((_QWORD *)a2 + 2);
        v91 = *((_QWORD *)a2 + 3);
        v92 = v126;
        v93 = v127;
        do
        {
          v94 = (unsigned __int16 *)(v90 + v91 * v89);
          v95 = (_WORD *)(v92 + v93 * v89);
          v96 = *v94;
          v97 = *(unsigned __int16 *)(v15 + 2 * v96);
          if ((_DWORD)v12 != 1)
          {
            v98 = v12 - 1;
            do
            {
              v100 = v94[1];
              ++v94;
              v99 = v100;
              if ((unsigned __int16)v97 - 1 <= 0xFFFD)
                *(_WORD *)(v15 + 2 * v96) = v97 + 1;
              v101 = *(_WORD *)(v15 + 2 * v99);
              *v95++ = v97;
              LOWORD(v97) = v101;
              v96 = v99;
              --v98;
            }
            while (v98);
            v96 = *v94;
            v97 = *(unsigned __int16 *)(v15 + 2 * v96);
          }
          *v95 = v97;
          if ((v97 - 1) < 0xFFFE)
            *(_WORD *)(v15 + 2 * v96) = v97 + 1;
        }
        while (v89-- > 0);
      }
      goto LABEL_123;
    }
    v68 = v116;
    v69 = (uint64_t *)v117;
  }
  else
  {
    v67 = 0;
    LODWORD(v61) = 0;
    v64 = -1;
    do
    {
      ++v64;
      v67 += *(unsigned __int8 *)(v14 + v64);
      if (v64 == v62)
      {
        v61 = (int)v61;
        do
        {
          v67 += 256;
          v62 = v134[++v61];
        }
        while (v64 == v62);
      }
      *(_WORD *)(v15 + 2 * v64) = 0;
    }
    while (v67 <= v19);
    if ((int)v64 < (int)v63)
      goto LABEL_52;
    v68 = v116;
    v69 = (uint64_t *)v117;
    if ((v64 & 0x80000000) == 0)
    {
      v103 = v115;
      v104 = *((unsigned int *)v114 + 14);
      if (*((_DWORD *)v114 + 14))
      {
        v105 = 0;
        v106 = *((unsigned int *)v114 + 12);
        v107 = (_WORD *)*((_QWORD *)v114 + 2);
        v108 = *((_QWORD *)v114 + 3);
        v109 = *((_QWORD *)v114 + 4);
        do
        {
          v110 = v107;
          for (k = v106; k; --k)
          {
            *v110 = v64;
            v110 = (_WORD *)((char *)v110 + v109);
          }
          ++v105;
          v107 = (_WORD *)((char *)v107 + v108);
        }
        while (v105 != v104);
      }
      goto LABEL_124;
    }
  }
LABEL_123:
  CMedian::Median16x128_(v69[1587], (uint64_t)v125, (uint64_t)v118, v10, (unsigned __int16)*v68);
  CMedian::OrdinalTransform(v119, v120, (uint64_t)v114, (uint64_t)v16);
  v103 = v115;
LABEL_124:
  CKernel::ReturnData((CKernel *)v69, v103);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v118);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v125);
  return 0;
}

void sub_1A64C3CB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a16);
  CGrNavigator::~CGrNavigator((CGrNavigator *)&a26);
  _Unwind_Resume(a1);
}

void CMedian::CKernel16x128::~CKernel16x128(CMedian::CKernel16x128 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel16x128::IdealTSize(CMedian::CKernel16x128 *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 16);
  else
    return 0x10000000100;
}

void CMedian::Median16x128_(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unsigned int v10;
  int v11;
  unsigned int v12;
  uint64_t v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  int32x2_t v21;
  int32x2_t v22;
  uint64_t v23;
  __int128 v24;
  int32x2_t v25;
  __int128 v26;
  int32x2_t v27;
  int32x2_t v28;
  uint64_t v29;
  __int128 v30;
  int32x2_t v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  _WORD *v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  uint64_t v43;
  unsigned __int16 *v44;
  int v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  int v49;
  _QWORD v50[4];
  __int128 v51;
  __int128 v52;
  uint64_t v53;
  __int16 v54;
  _QWORD v55[4];
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int16 v59;

  v10 = *(_DWORD *)(a3 + 48);
  v11 = *(_DWORD *)(a1 + 24);
  v49 = 2 * v11;
  v12 = (2 * v11) & 0xFFFFFFF0;
  if (((2 * v11) & 0xFFFFFF80) != 0)
    v12 = 128;
  if (v12 <= v10)
    v13 = v12;
  else
    v13 = v10 & 0xFFFFFFF0;
  if (v13 >= v10)
  {
    v33 = *(_QWORD *)(a3 + 56);
    v34 = (2 * v11) | 1u;
    v35 = *(_DWORD *)(a1 + 36);
    bzero((void *)a4, 0x10600uLL);
    v36 = *(_QWORD *)(a2 + 16);
    v37 = *(_QWORD *)(a2 + 24);
    if ((*(_WORD *)(v36 + 2 * ((v11 & 0x7FFFFFFF) + (v13 >> 1)) + v37 * (v11 & 0x7FFFFFFF)) & 0xFFF0) != 0)
      v38 = *(_WORD *)(v36 + 2 * ((v11 & 0x7FFFFFFF) + (v13 >> 1)) + v37 * (v11 & 0x7FFFFFFF)) & 0xFFF0;
    else
      v38 = 16;
    if ((_DWORD)v13)
    {
      v39 = (_WORD *)a4;
      v40 = v13;
      do
      {
        *v39++ = v38;
        --v40;
      }
      while (v40);
    }
    v41 = 0;
    do
      Hist16x128Inc(a4, *(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v41++, v34, v38, v13);
    while (v34 != v41);
    *(_BYTE *)(a4 + 1280) = 0;
    *(_BYTE *)(a4 + 66815) = 0;
    if ((_DWORD)v13)
    {
      v42 = *(unsigned __int16 *)(a4 + 768);
      v43 = v13 - 1;
      v44 = (unsigned __int16 *)(a4 + 514);
      do
      {
        v45 = *v44++;
        v42 += v45;
        --v43;
      }
      while (v43);
      do
      {
        v46 = a4 + 2 * v43;
        *(_WORD *)(v46 + 256) = v42;
        v47 = *(unsigned __int16 *)(a4 + 512 + 2 * (v43++ + 129));
        v42 = v42 + v47 - *(unsigned __int16 *)(v46 + 514);
      }
      while (v13 != v43);
    }
    if ((_DWORD)v33)
    {
      Hist16x128ReadC1(a4, *(_QWORD *)(a3 + 16), v35, v13, a5);
      if ((_DWORD)v33 != 1)
      {
        v48 = 0;
        do
        {
          Hist16x128Step(a4, (unsigned __int16 *)(*(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * (v49 + 1 + v48)), (unsigned __int16 *)(*(_QWORD *)(a2 + 16) + *(_QWORD *)(a2 + 24) * v48), v34, v13);
          ++v48;
          Hist16x128ReadC1(a4, *(_QWORD *)(a3 + 16) + *(_QWORD *)(a3 + 24) * v48, v35, v13, a5);
        }
        while ((_DWORD)v33 - 1 != v48);
      }
    }
  }
  else if (!__CFADD__(v10 - 1, (_DWORD)v13))
  {
    v14 = 0;
    if ((v10 - 1 + v13) / v13 <= 1)
      v15 = 1;
    else
      v15 = (v10 - 1 + v13) / v13;
    do
    {
      v16 = v13 + v14;
      if (v13 + v14 >= v10)
        v16 = v10;
      v17 = v14 - 8;
      if ((v16 & 0xF) == 0)
        v17 = v14;
      v18.i32[0] = v16;
      v18.i32[1] = *(_DWORD *)(a3 + 56);
      v19.i32[0] = v16 + v49;
      v19.i32[1] = *(_DWORD *)(a2 + 56);
      v59 = 0;
      v55[1] = 0;
      v20 = vmax_s32((int32x2_t)v17, 0);
      v21 = vmin_s32(vmovn_s64(*(int64x2_t *)(a2 + 48)), v19);
      v22 = vcge_s32(v20, v21);
      if (((v22.i32[0] | v22.i32[1]) & 1) == 0)
      {
        v23 = *(_QWORD *)(a2 + 24);
        v24 = *(_OWORD *)(a2 + 32);
        v55[2] = *(_QWORD *)(a2 + 16) + v23 * v20.u32[1] + *(_QWORD *)(a2 + 32) * v20.u32[0];
        v55[3] = v23;
        v25 = vsub_s32(v21, v20);
        *(_QWORD *)&v26 = v25.i32[0];
        *((_QWORD *)&v26 + 1) = v25.i32[1];
        v56 = v24;
        v57 = v26;
        v58 = *(_QWORD *)(a2 + 64);
        LOBYTE(v59) = 1;
      }
      v55[0] = off_1E50147F8;
      v54 = 0;
      v50[1] = 0;
      v27 = vmin_s32(vmovn_s64(*(int64x2_t *)(a3 + 48)), v18);
      v28 = vcge_s32(v20, v27);
      if (((v28.i32[0] | v28.i32[1]) & 1) == 0)
      {
        v29 = *(_QWORD *)(a3 + 24);
        v30 = *(_OWORD *)(a3 + 32);
        v50[2] = *(_QWORD *)(a3 + 16) + v29 * v20.u32[1] + *(_QWORD *)(a3 + 32) * v20.u32[0];
        v50[3] = v29;
        v31 = vsub_s32(v27, v20);
        *(_QWORD *)&v32 = v31.i32[0];
        *((_QWORD *)&v32 + 1) = v31.i32[1];
        v51 = v30;
        v52 = v32;
        v53 = *(_QWORD *)(a3 + 64);
        LOBYTE(v54) = 1;
      }
      v50[0] = off_1E50147F8;
      CMedian::Median16x128_(a1, v55, v50, a4, a5);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v50);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v55);
      v14 += v13;
      --v15;
    }
    while (v15);
  }
}

void sub_1A64C4070(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  va_list va;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v3 = va_arg(va1, _QWORD);
  v5 = va_arg(va1, _QWORD);
  v6 = va_arg(va1, _QWORD);
  v7 = va_arg(va1, _QWORD);
  v8 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va1);
  _Unwind_Resume(a1);
}

uint64_t Hist16x128Inc(uint64_t result, uint64_t a2, unsigned int a3, int a4, unsigned int a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  uint64_t v17;
  unsigned __int16 *v18;
  uint64_t v19;
  int v20;

  v5 = result + 1280;
  if (a5 >= 2)
  {
    v6 = 0;
    v7 = result + 512;
    v8 = result + 514;
    do
    {
      v9 = *(unsigned __int16 *)(a2 + 2 * v6);
      v10 = *(unsigned __int16 *)(a2 + 2 * a3 + 2 * v6);
      v11 = *(_WORD *)(v8 + 2 * v6);
      v12 = v6 + 1;
      v13 = *(_WORD *)(v7 + 2 * (v6 + 129));
      *(_BYTE *)(v5 + v9) = v6 + 1;
      *(_BYTE *)(v5 + v10) = v6 - 127;
      if ((int)v9 >= a4)
        v14 = v11;
      else
        v14 = v11 + 1;
      if ((int)v10 >= a4)
        v15 = v13;
      else
        v15 = v13 + 1;
      *(_WORD *)(v8 + 2 * v6) = v14;
      *(_WORD *)(v7 + 2 * (v6++ + 129)) = v15;
    }
    while (a5 - 1 != v12);
  }
  v16 = *(_WORD *)(result + 768);
  LODWORD(v17) = a3 - (a5 - 1);
  if (a3 != a5 - 1)
  {
    v18 = (unsigned __int16 *)(a2 + 2 * (a5 - 1));
    if (v17 <= 1)
      v17 = 1;
    else
      v17 = v17;
    do
    {
      v20 = *v18++;
      v19 = v20;
      if (v20 < a4)
        ++v16;
      *(_BYTE *)(v5 + v19) = 0x80;
      --v17;
    }
    while (v17);
  }
  *(_WORD *)(result + 768) = v16;
  return result;
}

uint64_t Hist16x128ReadC1(uint64_t result, uint64_t a2, unsigned int a3, int a4, unsigned int a5)
{
  uint64_t i;
  _WORD *v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unint64_t v10;

  if (a4)
  {
    for (i = 0; i != a4; *(_WORD *)(a2 + 2 * i++) = v10)
    {
      v10 = result + 2 * i;
      v6 = (_WORD *)(v10 + 256);
      v7 = *(unsigned __int16 *)(v10 + 256);
      v8 = *(unsigned __int16 *)v10;
      v9 = i + 129;
      LODWORD(v10) = v8;
      if (v7 <= a3)
      {
        do
        {
          LODWORD(v10) = v8;
          if ((v8 & 0x3F) == 0)
          {
            if (v8 >= a5)
              break;
            *v6 = v7;
            *(_WORD *)(result + 2 * i) = v8;
          }
          ++v8;
          v7 += ((*(unsigned __int8 *)(result + v10 + 1280) - v9) >> 7) & 1;
        }
        while (v7 <= a3);
      }
      else
      {
        do
        {
          if ((v10 & 0x3F) == 0)
          {
            if (!(_DWORD)v10)
              break;
            *v6 = v7;
            *(_WORD *)(result + 2 * i) = v10;
          }
          v10 = (v10 - 1);
          v7 += (*(unsigned __int8 *)(result + v10 + 1280) - v9) << 24 >> 31;
        }
        while (v7 > a3);
      }
    }
  }
  return result;
}

uint64_t Hist16x128Step(uint64_t a1, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, unsigned int a5)
{
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  unsigned __int16 *v18;
  unsigned __int16 *v19;
  uint64_t v20;
  unsigned int v21;
  unsigned int v22;

  result = Hist16x128Delta1_(a1, a2, a3, a4, a5);
  v11 = a1 + 1280;
  if (a5 >= 2)
  {
    v12 = 0;
    do
    {
      v13 = a2[a4 + v12];
      v14 = a3[v12];
      v15 = a3[a4 + v12];
      *(_BYTE *)(v11 + a2[v12]) = v12 + 1;
      *(_BYTE *)(v11 + v13) = (v12 + 1) ^ 0x80;
      *(_BYTE *)(v11 + v14) = 0;
      *(_BYTE *)(v11 + v15) = 0;
      ++v12;
    }
    while (a5 - 1 != v12);
  }
  v16 = a5 - 1;
  LODWORD(v17) = a4 - (a5 - 1);
  if (a4 != a5 - 1)
  {
    v18 = &a2[v16];
    v19 = &a3[v16];
    if (v17 <= 1)
      v17 = 1;
    else
      v17 = v17;
    do
    {
      v21 = *v18++;
      v20 = v21;
      v22 = *v19++;
      *(_BYTE *)(v11 + v20) = 0x80;
      *(_BYTE *)(v11 + v22) = 0;
      --v17;
    }
    while (v17);
  }
  *(_BYTE *)(a1 + 1280) = 0;
  *(_BYTE *)(a1 + 66815) = 0;
  return result;
}

uint64_t Hist16x128Delta1_(uint64_t result, unsigned __int16 *a2, unsigned __int16 *a3, unsigned int a4, int a5)
{
  unint64_t v5;
  unsigned int v6;
  unsigned __int16 *v7;
  unsigned int v8;
  unsigned int v9;
  unsigned __int16 *v10;
  unsigned __int16 *v11;
  uint64_t v12;
  unsigned int v13;
  BOOL v14;
  unsigned int v15;
  unsigned int v16;

  if (a5)
  {
    v5 = 0;
    v6 = a4;
    do
    {
      v7 = (unsigned __int16 *)(result + 2 * v5);
      if (*v7 <= 1u)
        v8 = 1;
      else
        v8 = *v7;
      v9 = v7[128];
      v10 = a2;
      v11 = a3;
      v12 = v6;
      if (v5 < v5 + a4)
      {
        do
        {
          v13 = *v10++;
          v14 = v13 >= v8;
          v16 = *v11++;
          v15 = v16;
          if (!v14)
            ++v9;
          v9 = (__PAIR64__(v9, v15) - v8) >> 32;
          --v12;
        }
        while (v5 != v12);
      }
      ++v5;
      v7[128] = v9;
      ++v6;
      ++a3;
      ++a2;
    }
    while (v5 != a5);
  }
  return result;
}

uint64_t CMedian::CKernel32x128::Process_(CMedian::CKernel32x128 *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  unsigned __int16 *v7;
  unsigned int *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned __int16 *v12;
  unsigned int *v13;
  unsigned __int16 *v14;
  _DWORD *v15;
  __int128 v16;
  unsigned __int16 *v17;
  uint64_t v18;
  int *v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  int v25;
  int v26;
  uint64_t v27;
  int *v28;
  uint64_t v29;
  unsigned __int16 *v30;
  uint64_t v31;
  int *v32;
  int v33;
  unsigned int v34;
  uint64_t v35;
  unsigned int v36;
  uint64_t v37;
  int v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  unsigned int *v42;
  int v43;
  uint64_t v44;
  unsigned int v45;
  uint64_t v46;
  int v47;
  int v48;
  unsigned int v49;
  uint64_t v50;
  unsigned int v51;
  unint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unsigned int v58;
  uint64_t v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  int v63;
  unsigned __int16 *v64;
  uint64_t v65;
  unsigned int v66;
  const CGrNavigator *v68;
  uint64_t v69;
  const CGrNavigator *v71;
  _QWORD v72[2];
  unsigned __int16 *v73;
  uint64_t v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  __int16 v78;
  _QWORD v79[4];
  __int128 v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  __int16 v84;

  v7 = (unsigned __int16 *)malloc_type_calloc(0x1F4600uLL, 1uLL, 0xE0D31C87uLL);
  v8 = (unsigned int *)(v7 + 434944);
  v9 = *((_QWORD *)a2 + 6);
  v10 = *((_QWORD *)a2 + 7);
  v71 = a2;
  v11 = (2 * v9 + 14) & 0xFFFFFFF0;
  v12 = v7 + 697088;
  v79[2] = v7 + 697088;
  v79[3] = v11;
  v13 = (unsigned int *)(v7 + 172800);
  v14 = v7 + 41728;
  v15 = v7 + 33536;
  v80 = xmmword_1A64DDF00;
  v81 = v9;
  v82 = v10;
  v83 = 1;
  v84 = 1;
  v79[0] = off_1E50147F8;
  v79[1] = 0;
  v68 = a3;
  v16 = *((_OWORD *)a3 + 3);
  v75 = xmmword_1A64DDF00;
  v76 = v16;
  v73 = v7 + 828160;
  v74 = (2 * (_DWORD)v16 + 14) & 0xFFFFFFF0;
  v77 = 1;
  v78 = 1;
  v72[0] = off_1E50147F8;
  v72[1] = 0;
  v17 = v7 + 37632;
  v69 = *(unsigned int *)(*((_QWORD *)this + 1587) + 36);
  bzero(v7 + 33536, 0x4000uLL);
  if ((_DWORD)v10)
  {
    v18 = 0;
    v19 = (int *)*((_QWORD *)v71 + 2);
    v20 = *((_QWORD *)v71 + 3);
    do
    {
      if ((_DWORD)v9)
      {
        v21 = v19;
        v22 = v9;
        do
        {
          v23 = *v21++;
          ++v15[((unsigned __int16)v23 ^ (unsigned __int16)(v23 >> 31)) & 0x7FF];
          --v22;
        }
        while (v22);
      }
      ++v18;
      v19 = (int *)((char *)v19 + v20);
    }
    while (v18 != v10);
  }
  v24 = 0;
  v25 = 0;
  do
  {
    v26 = v15[v24];
    v15[v24] = v25;
    v25 += v26;
    ++v24;
  }
  while (v24 != 2048);
  if ((_DWORD)v10)
  {
    v27 = 0;
    v28 = (int *)*((_QWORD *)v71 + 2);
    v29 = *((_QWORD *)v71 + 3);
    v30 = v7 + 33536;
    do
    {
      if ((_DWORD)v9)
      {
        v31 = 0;
        v32 = v28;
        do
        {
          v33 = *v32++;
          v34 = ((v33 >> 31) | 0x80000000) ^ v33;
          v35 = v15[v34 & 0x7FF];
          v15[v34 & 0x7FF] = v35 + 1;
          v36 = (v34 >> 11) & 0x7FF;
          ++*(_DWORD *)&v17[2 * v36];
          v30[v35 + 0x2000] = v36;
          *(_DWORD *)&v30[2 * v35 + 139264] = ((_DWORD)v27 << 11) | v31++ | v34 & 0xFFC00000;
        }
        while (v9 != v31);
      }
      ++v27;
      v28 = (int *)((char *)v28 + v29);
    }
    while (v27 != v10);
  }
  v37 = 0;
  v38 = 0;
  do
  {
    v39 = *(_DWORD *)&v17[v37];
    *(_DWORD *)&v17[v37] = v38;
    v38 += v39;
    v37 += 2;
  }
  while (v37 != 4096);
  bzero(v15, 0x1000uLL);
  v40 = (v10 * v9);
  if ((_DWORD)v40)
  {
    v41 = (v10 * v9);
    v42 = (unsigned int *)(v7 + 172800);
    do
    {
      v43 = *v14++;
      v44 = *(unsigned int *)&v17[2 * v43];
      *(_DWORD *)&v17[2 * v43] = v44 + 1;
      v45 = *v42++;
      ++*(_DWORD *)((char *)v15 + (((unint64_t)v45 >> 20) & 0xFFC));
      *(_DWORD *)&v7[2 * v44 + 434944] = v45;
      --v41;
    }
    while (v41);
  }
  v46 = 0;
  v47 = 0;
  do
  {
    v48 = v15[v46];
    v15[v46] = v47;
    v47 += v48;
    ++v46;
  }
  while (v46 != 2048);
  v49 = v69;
  if ((_DWORD)v40)
  {
    v50 = v40;
    do
    {
      v51 = *v8++;
      v52 = ((unint64_t)v51 >> 20) & 0xFFC;
      v53 = *(unsigned int *)((char *)v15 + v52);
      *(_DWORD *)((char *)v15 + v52) = v53 + 1;
      *(_DWORD *)&v7[2 * v53 + 172800] = v51;
      --v50;
    }
    while (v50);
  }
  v54 = *((_QWORD *)v71 + 2);
  v55 = *((_QWORD *)v71 + 3);
  LODWORD(v56) = v69 + 0x10000;
  if (v40 >= (int)v69 + 0x10000)
    v56 = v56;
  else
    v56 = v40;
  if ((_DWORD)v69)
  {
    v57 = v69;
    do
    {
      v58 = *v13++;
      *(unsigned __int16 *)((char *)&v12[v58 & 0x7FF] + v11 * (unint64_t)((v58 >> 11) & 0x7FF)) = 0;
      --v57;
    }
    while (v57);
  }
  if (v56 > v69)
  {
    v59 = 0;
    do
    {
      v60 = *(unsigned int *)&v7[2 * v69 + 172800 + 2 * v59];
      v61 = (v60 >> 11) & 0x7FF;
      v62 = v60 & 0x7FF;
      v63 = *(_DWORD *)(v54 + 4 * v62 + v55 * v61);
      *(unsigned __int16 *)((char *)&v12[v62] + v11 * (unint64_t)v61) = v59;
      *(_DWORD *)&v7[2 * v59++ + 893696] = v63;
    }
    while (v56 - v69 != v59);
    v49 = v56;
  }
  if (v49 < v40)
  {
    v64 = &v7[2 * v49 + 172800];
    v65 = v40 - v49;
    do
    {
      v66 = *(_DWORD *)v64;
      v64 += 2;
      *(unsigned __int16 *)((char *)&v12[v66 & 0x7FF] + v11 * (unint64_t)((v66 >> 11) & 0x7FF)) = -1;
      --v65;
    }
    while (v65);
  }
  CMedian::Median16x128_(*((_QWORD *)this + 1587), (uint64_t)v79, (uint64_t)v72, (uint64_t)v7, 0xFFFFLL);
  CMedian::OrdinalTransform(v73, v74, (uint64_t)v68, (uint64_t)(v7 + 893696));
  free(v7);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v72);
  CGrNavigator::~CGrNavigator((CGrNavigator *)v79);
  return 0;
}

void sub_1A64C47A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  uint64_t v7;
  va_list va;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a6);
  va_start(va, a6);
  v7 = va_arg(va1, _QWORD);
  v9 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va1);
  _Unwind_Resume(a1);
}

void CMedian::CKernel32x128::~CKernel32x128(CMedian::CKernel32x128 *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel32x128::IdealTSize(CMedian::CKernel32x128 *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 16);
  else
    return 0x10000000100;
}

unsigned __int16 *CMedian::OrdinalTransform(unsigned __int16 *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _DWORD *v7;
  uint64_t v8;
  unsigned __int16 *v9;
  _DWORD *v10;
  uint64_t i;
  unsigned int v12;

  v4 = *(unsigned int *)(a3 + 56);
  if (*(_DWORD *)(a3 + 56))
  {
    v5 = 0;
    v6 = *(unsigned int *)(a3 + 48);
    v7 = *(_DWORD **)(a3 + 16);
    v8 = *(_QWORD *)(a3 + 24);
    do
    {
      v9 = result;
      v10 = v7;
      for (i = v6; i; --i)
      {
        v12 = *v9++;
        *v10++ = *(_DWORD *)(a4 + 4 * v12);
      }
      ++v5;
      v7 = (_DWORD *)((char *)v7 + v8);
      result = (unsigned __int16 *)((char *)result + a2);
    }
    while (v5 != v4);
  }
  return result;
}

void CMemEnv::~CMemEnv(CMemEnv *this)
{
  *(_QWORD *)this = off_1E5014960;
}

void CMemEnv::~CMemEnv(void *this)
{
  --CMemEnv::excount;
  free(this);
}

uint64_t CMemEnv::Valid(CMemEnv *this)
{
  return 1;
}

uint64_t CMemEnv::Allocate(CMemEnv *this, size_t size, int a3)
{
  uint64_t result;

  if (!a3)
  {
    result = (uint64_t)malloc_type_malloc(size, 0x404686BAuLL);
    if (!result)
      return result;
    goto LABEL_5;
  }
  result = (uint64_t)malloc_type_calloc(size, 1uLL, 0xEF60B083uLL);
  if (result)
  {
LABEL_5:
    ++*((_DWORD *)this + 2);
    return result ^ 0xCAFDECAFLL;
  }
  return result;
}

void CMemEnv::Dispose(CMemEnv *this, void *a2)
{
  void *v4;

  v4 = (void *)(*(uint64_t (**)(CMemEnv *))(*(_QWORD *)this + 56))(this);
  --*((_DWORD *)this + 2);
  if (a2)
  {
    if (v4)
      free(v4);
  }
}

uint64_t CMemEnv::Lock(CMemEnv *this, void *a2)
{
  return 0;
}

unint64_t CMemEnv::Ref2Ptr(CMemEnv *this, unint64_t a2)
{
  return a2 ^ 0xCAFDECAF;
}

uint64_t CKernel::Process_(CKernel *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unsigned int v9;
  uint64_t v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  float *v18;
  unsigned int v19;
  float *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _WORD *v29;
  uint64_t v30;
  unsigned int v31;
  _WORD *v32;
  uint64_t v33;

  v5 = *((_QWORD *)a3 + 6);
  v6 = *((_QWORD *)a3 + 7);
  v7 = v6;
  v8 = (*((_DWORD *)a2 + 12) - v5);
  v9 = (*((_DWORD *)a2 + 14) - v6) >> 1;
  v10 = *((_QWORD *)a3 + 4);
  if (v10 == 1)
  {
    if ((_DWORD)v6)
    {
      v22 = 0;
      v23 = v8 >> 1;
      do
      {
        if ((_DWORD)v5)
        {
          v24 = 0;
          do
          {
            *(_BYTE *)(*((_QWORD *)a3 + 2) + *((_QWORD *)a3 + 3) * v22 + *((_QWORD *)a3 + 4) * v24) = ~*(_BYTE *)(*((_QWORD *)a2 + 2) + *((_QWORD *)a2 + 3) * (v9 + v22) + *((_QWORD *)a2 + 4) * (v23 + v24));
            ++v24;
          }
          while (v5 != v24);
        }
        ++v22;
      }
      while (v22 != v7);
    }
  }
  else
  {
    v11 = v8 >> 1;
    if (v10 == 2)
    {
      if ((_DWORD)v6)
      {
        v25 = 0;
        v26 = *((_QWORD *)a2 + 2);
        v27 = *((_QWORD *)a2 + 3);
        v28 = *((_QWORD *)a2 + 4);
        v29 = (_WORD *)*((_QWORD *)a3 + 2);
        v30 = *((_QWORD *)a3 + 3);
        do
        {
          if ((_DWORD)v5)
          {
            v31 = v11;
            v32 = v29;
            v33 = v5;
            do
            {
              *v32++ = 0x8000 - *(_WORD *)(v26 + v27 * (v9 + v25) + v28 * v31++);
              --v33;
            }
            while (v33);
          }
          ++v25;
          v29 = (_WORD *)((char *)v29 + v30);
        }
        while (v25 != v7);
      }
    }
    else if (v10 == 4 && (_DWORD)v6 != 0)
    {
      v13 = 0;
      v14 = *((_QWORD *)a2 + 2);
      v15 = *((_QWORD *)a2 + 3);
      v16 = *((_QWORD *)a2 + 4);
      v18 = (float *)*((_QWORD *)a3 + 2);
      v17 = *((_QWORD *)a3 + 3);
      do
      {
        if ((_DWORD)v5)
        {
          v19 = v11;
          v20 = v18;
          v21 = v5;
          do
          {
            *v20++ = 1.0 - *(float *)(v14 + v15 * (v9 + v13) + v16 * v19++);
            --v21;
          }
          while (v21);
        }
        ++v13;
        v18 = (float *)((char *)v18 + v17);
      }
      while (v13 != v7);
    }
  }
  return 0;
}

uint64_t CKernel::IdealTSize(CKernel *this)
{
  return 0x16000000160;
}

uint64_t CKernel::Process(CKernel *this, int64x2_t *a2, int64x2_t *a3, int64x2_t *a4)
{
  __int32 v8;
  __int32 v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  int32x2_t v17;
  int32x2_t v18;
  int32x2_t v19;
  int32x2_t v20;
  uint64_t v21;
  int64x2_t v22;
  int32x2_t v23;
  __int128 v24;
  int32x2_t v25;
  int32x2_t v26;
  int32x2_t v27;
  uint64_t v28;
  int64x2_t v29;
  int32x2_t v30;
  __int128 v31;
  int32x2_t v32;
  int32x2_t v33;
  uint64_t v34;
  int64x2_t v35;
  int32x2_t v36;
  __int128 v37;
  unsigned int v38;
  char v39;
  unsigned int v40;
  int v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  BOOL v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  unint64_t v49;
  BOOL v50;
  uint64_t v52;
  uint64_t v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  size_t v58;
  unsigned int v59;
  BOOL v60;
  unsigned int v61;
  uint64_t v62;
  unsigned int v63;
  uint64_t v64;
  size_t v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  uint64_t v70;
  int v71;
  unsigned int v72;
  uint64_t v73;
  int v74;
  int v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  int v79;
  signed int v80;
  int v81;
  char *v82;
  int v83;
  uint64_t v84;
  _DWORD *v85;
  NSObject *global_queue;
  dispatch_group_t v87;
  NSObject *v88;
  unsigned int v89;
  uint64_t v90;
  uint64_t v91;
  unsigned int v92;
  unsigned __int32 v94;
  int v95;
  unsigned int v96;
  unsigned int v97;
  unsigned int v98;
  int v99;
  uint64_t v100;
  _QWORD block[5];
  unsigned int v102;
  _QWORD v103[2];
  uint64_t v104;
  uint64_t v105;
  int64x2_t v106;
  __int128 v107;
  uint64_t v108;
  __int16 v109;
  _QWORD v110[2];
  uint64_t v111;
  uint64_t v112;
  int64x2_t v113;
  __int128 v114;
  uint64_t v115;
  __int16 v116;
  _QWORD v117[2];
  uint64_t v118;
  uint64_t v119;
  int64x2_t v120;
  __int128 v121;
  uint64_t v122;
  __int16 v123;

  v8 = a2[3].i32[0];
  v9 = a2[3].i32[2];
  v10 = a3[3].u32[0];
  v11 = a3[3].u32[2];
  v12 = (*(uint64_t (**)(CKernel *))(*(_QWORD *)this + 24))(this);
  v99 = 16 * v12;
  v13 = 16 * (int)v12 >= v10 && 16 * HIDWORD(v12) >= v11;
  v96 = v11;
  if (!v13)
  {
    if (v11)
    {
      v98 = 0;
      v94 = v9 - v11;
      v95 = 16 * HIDWORD(v12);
      while (1)
      {
        v14 = 0;
        v15 = v98 + v95;
        v97 = v12;
        while (v14 < v10)
        {
          v16 = v14 + v99;
          v17.i32[0] = v14 + v99;
          v17.i32[1] = v98 + v95;
          v123 = 0;
          v117[0] = off_1E5014778;
          v117[1] = 0;
          v18 = vmax_s32((int32x2_t)__PAIR64__(v98, v14), 0);
          v19 = vmin_s32(vmovn_s64(a3[3]), v17);
          v20 = vcge_s32(v18, v19);
          if (((v20.i32[0] | v20.i32[1]) & 1) == 0)
          {
            v21 = a3[1].i64[1];
            v22 = a3[2];
            v118 = a3[1].i64[0] + v21 * v18.u32[1] + a3[2].i64[0] * v18.u32[0];
            v119 = v21;
            v23 = vsub_s32(v19, v18);
            *(_QWORD *)&v24 = v23.i32[0];
            *((_QWORD *)&v24 + 1) = v23.i32[1];
            v120 = v22;
            v121 = v24;
            v122 = a3[4].i64[0];
            LOBYTE(v123) = 1;
          }
          v25.i32[0] = v99 + v8 - v10 + v14;
          v25.i32[1] = v94 + v98 + v95;
          v116 = 0;
          v110[0] = off_1E5014778;
          v110[1] = 0;
          v26 = vmin_s32(vmovn_s64(a2[3]), v25);
          v27 = vcge_s32(v18, v26);
          if (((v27.i32[0] | v27.i32[1]) & 1) == 0)
          {
            v28 = a2[1].i64[1];
            v29 = a2[2];
            v111 = a2[1].i64[0] + v28 * v18.u32[1] + a2[2].i64[0] * v18.u32[0];
            v112 = v28;
            v30 = vsub_s32(v26, v18);
            *(_QWORD *)&v31 = v30.i32[0];
            *((_QWORD *)&v31 + 1) = v30.i32[1];
            v113 = v29;
            v114 = v31;
            v115 = a2[4].i64[0];
            LOBYTE(v116) = 1;
          }
          if (a4)
          {
            v109 = 0;
            v103[0] = off_1E5014778;
            v103[1] = 0;
            v32 = vmin_s32(vmovn_s64(a4[3]), v17);
            v33 = vcge_s32(v18, v32);
            if (((v33.i32[0] | v33.i32[1]) & 1) == 0)
            {
              v34 = a4[1].i64[1];
              v35 = a4[2];
              v104 = a4[1].i64[0] + v34 * v18.u32[1] + a4[2].i64[0] * v18.u32[0];
              v105 = v34;
              v36 = vsub_s32(v32, v18);
              *(_QWORD *)&v37 = v36.i32[0];
              *((_QWORD *)&v37 + 1) = v36.i32[1];
              v106 = v35;
              v107 = v37;
              v108 = a4[4].i64[0];
              LOBYTE(v109) = 1;
            }
            v38 = (*(uint64_t (**)(CKernel *, _QWORD *, _QWORD *, _QWORD *))(*(_QWORD *)this + 32))(this, v110, v117, v103);
            CGrNavigator::~CGrNavigator((CGrNavigator *)v103);
            if (!v38)
            {
LABEL_20:
              v39 = 1;
              goto LABEL_21;
            }
            v39 = 0;
            v97 = v38;
          }
          else
          {
            v40 = (*(uint64_t (**)(CKernel *, _QWORD *, _QWORD *, _QWORD))(*(_QWORD *)this + 32))(this, v110, v117, 0);
            if (!v40)
              goto LABEL_20;
            v39 = 0;
            v97 = v40;
          }
LABEL_21:
          CGrNavigator::~CGrNavigator((CGrNavigator *)v110);
          CGrNavigator::~CGrNavigator((CGrNavigator *)v117);
          v14 = v16;
          if ((v39 & 1) == 0)
            return v97;
        }
        LODWORD(v12) = v97;
        v98 += v95;
        v97 = 0;
        if (v15 >= v96)
          return v97;
      }
    }
    return 0;
  }
  v41 = *((unsigned __int8 *)this + 33);
  if (*((_BYTE *)this + 33))
  {
    v42 = a2[1].i64[1] | a2[1].i64[0] | a2[2].i64[1];
    v43 = v42 & -v42;
    v44 = a3[1].i64[1] | a3[1].i64[0] | a3[2].i64[1];
    v45 = (v44 & (unint64_t)-v44) >= 0x10 && v43 >= 0x10;
    v41 = !v45;
    if (a4)
    {
      v46 = a4[1].i64[1] | a4[1].i64[0] | a4[2].i64[1];
      if ((v46 & (unint64_t)-v46) < 0x10)
        v41 = 1;
    }
  }
  v47 = a3[3].u64[0];
  v48 = *((unsigned int *)this + 6);
  v49 = *((unsigned int *)this + 7);
  if (v47 % v49)
    v50 = 0;
  else
    v50 = v47 >= v48;
  if (!v50 || v41 != 0)
  {
    if (v47 <= v48)
      LODWORD(v52) = *((_DWORD *)this + 6);
    else
      v52 = a3[3].i64[0];
    if (v52 % v49)
      v53 = ((_DWORD)v49 + (_DWORD)v52 - 1) & -(int)v49;
    else
      v53 = v52;
    CGrNavigator::CGrNavigator((CGrNavigator *)v117, *((CMemEnv **)this + 2), v53 - v47 + a2[3].i64[0], a2[3].i64[1], a2[2].i64[0]);
    CGrNavigator::CGrNavigator((CGrNavigator *)v110, *((CMemEnv **)this + 2), v53, a3[3].i64[1], a3[2].i64[0]);
    v54 = 7;
    if ((_BYTE)v123 && (_BYTE)v116)
    {
      v55 = a3[3].i64[0];
      v56 = a3[2].i64[0];
      if (a2[3].i64[1])
      {
        v57 = 0;
        v58 = (a2[2].i32[0] * a2[3].i32[0]);
        v59 = 1;
        do
        {
          memcpy((void *)(v118 + v119 * v57), (const void *)(a2[1].i64[0] + a2[1].i64[1] * v57), v58);
          v57 = v59;
          v60 = a2[3].i64[1] > (unint64_t)v59++;
        }
        while (v60);
      }
      v61 = v56 * v55;
      if (*((_BYTE *)this + 32) && a3[3].i64[1])
      {
        v62 = 0;
        v63 = 1;
        do
        {
          memcpy((void *)(v111 + v112 * v62), (const void *)(a3[1].i64[0] + a3[1].i64[1] * v62), v61);
          v62 = v63;
          v60 = a3[3].i64[1] > (unint64_t)v63++;
        }
        while (v60);
      }
      if (a4)
      {
        CGrNavigator::CGrNavigator((CGrNavigator *)v103, *((CMemEnv **)this + 2), v53, a4[3].i64[1], a4[2].i64[0]);
        if ((_BYTE)v109)
        {
          if (a4[3].i64[1])
          {
            v64 = 0;
            v65 = (a4[2].i32[0] * a4[3].i32[0]);
            v66 = 1;
            do
            {
              memcpy((void *)(v104 + v105 * v64), (const void *)(a4[1].i64[0] + a4[1].i64[1] * v64), v65);
              v64 = v66;
              v60 = a4[3].i64[1] > (unint64_t)v66++;
            }
            while (v60);
          }
          v54 = (*(uint64_t (**)(CKernel *, _QWORD *, _QWORD *, _QWORD *))(*(_QWORD *)this + 32))(this, v117, v110, v103);
          if (!v54)
          {
            CGrNavigator::~CGrNavigator((CGrNavigator *)v103);
LABEL_91:
            if (a3[3].i64[1])
            {
              v91 = 0;
              v92 = 1;
              do
              {
                memcpy((void *)(a3[1].i64[0] + a3[1].i64[1] * v91), (const void *)(v111 + v112 * v91), v61);
                v91 = v92;
                v60 = a3[3].i64[1] > (unint64_t)v92++;
              }
              while (v60);
            }
            v54 = 0;
            goto LABEL_97;
          }
        }
        else
        {
          v54 = 7;
        }
        CGrNavigator::~CGrNavigator((CGrNavigator *)v103);
      }
      else
      {
        v54 = (*(uint64_t (**)(CKernel *, _QWORD *, _QWORD *, _QWORD))(*(_QWORD *)this + 32))(this, v117, v110, 0);
        if (!v54)
          goto LABEL_91;
      }
    }
LABEL_97:
    v97 = v54;
    CGrNavigator::~CGrNavigator((CGrNavigator *)v110);
    CGrNavigator::~CGrNavigator((CGrNavigator *)v117);
    return v97;
  }
  v67 = v10 + v12 - 1;
  v68 = v67 / v12;
  v69 = (v11 - 1 + HIDWORD(v12)) / HIDWORD(v12);
  v70 = v69 * (v67 / v12);
  *((_DWORD *)this + 16) = v70;
  if (!__CFADD__(v11 - 1, HIDWORD(v12)))
  {
    v71 = 0;
    v72 = (v9 - v11) & 0xFFFFFFFE;
    if (v68 <= 1)
      v73 = 1;
    else
      v73 = v68;
    v100 = v73;
    if (v69 <= 1)
      v69 = 1;
    do
    {
      if (v67 >= v12)
      {
        v74 = 0;
        v75 = 0;
        v76 = v71 * HIDWORD(v12) + HIDWORD(v12);
        if (v76 >= (int)v96)
          v76 = v96;
        v77 = v100;
        do
        {
          v78 = v71 * v68 + v75;
          if ((int)v48 + v74 <= v10)
            v79 = v74;
          else
            v79 = v10 - v48;
          v80 = v79 + v12;
          v81 = v79 & ~(v79 >> 31);
          if (v80 >= (int)v10)
            v80 = v10;
          v82 = (char *)this + 16 * v78;
          *((_DWORD *)v82 + 2066) = v81;
          *((_DWORD *)v82 + 2067) = (v71 * HIDWORD(v12)) & ~((v71 * HIDWORD(v12)) >> 31);
          *((_DWORD *)v82 + 2068) = v80;
          *((_DWORD *)v82 + 2069) = v76;
          *(_OWORD *)(v82 + 4168) = *(_OWORD *)(v82 + 8264);
          v83 = *((_DWORD *)v82 + 1045);
          *((_DWORD *)v82 + 1044) += (v8 - v10) & 0xFFFFFFFE;
          *((_DWORD *)v82 + 1045) = v83 + v72;
          *((_BYTE *)this + v78 + 12360) = 0;
          ++v75;
          v74 += v12;
          --v77;
        }
        while (v77);
      }
      ++v71;
    }
    while (v71 != v69);
  }
  if ((_DWORD)v70)
  {
    v84 = 0;
    *((_QWORD *)this + 5) = a2;
    *((_QWORD *)this + 6) = a3;
    v85 = (_DWORD *)((char *)this + 80);
    *((_QWORD *)this + 7) = a4;
    do
    {
      *((_QWORD *)v85 - 1) = this;
      *v85 = v84;
      v85 += 4;
      ++v84;
    }
    while (v70 != v84);
    global_queue = dispatch_get_global_queue(0, 0);
    v87 = dispatch_group_create();
    if (v87)
    {
      v88 = v87;
      if (*((_DWORD *)this + 16))
      {
        v89 = 0;
        v90 = MEMORY[0x1E0C809B0];
        do
        {
          block[0] = v90;
          block[1] = 0x40000000;
          block[2] = ___ZN7CKernel7ProcessERK12CGrNavigatorS2_PS1__block_invoke;
          block[3] = &__block_descriptor_tmp;
          block[4] = this;
          v102 = v89;
          dispatch_group_async(v88, global_queue, block);
          ++v89;
        }
        while (v89 < *((_DWORD *)this + 16));
      }
      dispatch_group_wait(v88, 0xFFFFFFFFFFFFFFFFLL);
      dispatch_release(v88);
    }
  }
  return 0;
}

void sub_1A64C523C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  CGrNavigator::~CGrNavigator((CGrNavigator *)&a30);
  CGrNavigator::~CGrNavigator((CGrNavigator *)(v30 - 184));
  _Unwind_Resume(a1);
}

void ___ZN7CKernel7ProcessERK12CGrNavigatorS2_PS1__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  int32x2_t *v6;
  int32x2_t v7;
  int32x2_t v8;
  int32x2_t v9;
  uint64_t v10;
  __int128 v11;
  int32x2_t v12;
  __int128 v13;
  uint64_t v14;
  int32x2_t v15;
  int32x2_t v16;
  int32x2_t v17;
  int32x2_t v18;
  uint64_t v19;
  __int128 v20;
  int32x2_t v21;
  __int128 v22;
  uint64_t v23;
  int32x2_t v24;
  int32x2_t v25;
  uint64_t v26;
  __int128 v27;
  int32x2_t v28;
  __int128 v29;
  _QWORD v30[4];
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  __int16 v34;
  _QWORD v35[4];
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  __int16 v39;
  _QWORD v40[4];
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  __int16 v44;

  v1 = *(_QWORD *)(a1 + 32) + 16 * *(unsigned int *)(a1 + 40);
  v2 = *(unsigned int *)(v1 + 80);
  v3 = *(_QWORD *)(v1 + 72);
  v4 = (_BYTE *)(v3 + v2 + 12360);
  if (!*v4)
  {
    *v4 = 1;
    v5 = *(_QWORD *)(v3 + 40);
    v6 = (int32x2_t *)(v3 + 16 * v2);
    v44 = 0;
    v40[0] = off_1E5014778;
    v40[1] = 0;
    v7 = vmax_s32(v6[521], 0);
    v8 = vmin_s32(vmovn_s64(*(int64x2_t *)(v5 + 48)), v6[522]);
    v9 = vcge_s32(v7, v8);
    if (((v9.i32[0] | v9.i32[1]) & 1) == 0)
    {
      v10 = *(_QWORD *)(v5 + 24);
      v11 = *(_OWORD *)(v5 + 32);
      v40[2] = *(_QWORD *)(v5 + 16) + v10 * v7.u32[1] + *(_QWORD *)(v5 + 32) * v7.u32[0];
      v40[3] = v10;
      v12 = vsub_s32(v8, v7);
      *(_QWORD *)&v13 = v12.i32[0];
      *((_QWORD *)&v13 + 1) = v12.i32[1];
      v41 = v11;
      v42 = v13;
      v43 = *(_QWORD *)(v5 + 64);
      LOBYTE(v44) = 1;
    }
    v14 = *(_QWORD *)(v3 + 48);
    v39 = 0;
    v35[0] = off_1E5014778;
    v35[1] = 0;
    v15 = vmax_s32(v6[1033], 0);
    v16 = v6[1034];
    v17 = vmin_s32(vmovn_s64(*(int64x2_t *)(v14 + 48)), v16);
    v18 = vcge_s32(v15, v17);
    if (((v18.i32[0] | v18.i32[1]) & 1) == 0)
    {
      v19 = *(_QWORD *)(v14 + 24);
      v20 = *(_OWORD *)(v14 + 32);
      v35[2] = *(_QWORD *)(v14 + 16) + v19 * v15.u32[1] + *(_QWORD *)(v14 + 32) * v15.u32[0];
      v35[3] = v19;
      v21 = vsub_s32(v17, v15);
      *(_QWORD *)&v22 = v21.i32[0];
      *((_QWORD *)&v22 + 1) = v21.i32[1];
      v36 = v20;
      v37 = v22;
      v38 = *(_QWORD *)(v14 + 64);
      LOBYTE(v39) = 1;
    }
    v23 = *(_QWORD *)(v3 + 56);
    if (v23)
    {
      v34 = 0;
      v30[0] = off_1E5014778;
      v30[1] = 0;
      v24 = vmin_s32(vmovn_s64(*(int64x2_t *)(v23 + 48)), v16);
      v25 = vcge_s32(v15, v24);
      if (((v25.i32[0] | v25.i32[1]) & 1) == 0)
      {
        v26 = *(_QWORD *)(v23 + 24);
        v27 = *(_OWORD *)(v23 + 32);
        v30[2] = *(_QWORD *)(v23 + 16) + v26 * v15.u32[1] + *(_QWORD *)(v23 + 32) * v15.u32[0];
        v30[3] = v26;
        v28 = vsub_s32(v24, v15);
        *(_QWORD *)&v29 = v28.i32[0];
        *((_QWORD *)&v29 + 1) = v28.i32[1];
        v31 = v27;
        v32 = v29;
        v33 = *(_QWORD *)(v23 + 64);
        LOBYTE(v34) = 1;
      }
      (**(void (***)(uint64_t, _QWORD *, _QWORD *, _QWORD, _QWORD *))v3)(v3, v40, v35, 0, v30);
      CGrNavigator::~CGrNavigator((CGrNavigator *)v30);
    }
    else
    {
      (**(void (***)(uint64_t, _QWORD *, _QWORD *, _QWORD, _QWORD))v3)(v3, v40, v35, 0, 0);
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v35);
    CGrNavigator::~CGrNavigator((CGrNavigator *)v40);
  }
}

void sub_1A64C5484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  CGrNavigator::~CGrNavigator((CGrNavigator *)va);
  CGrNavigator::~CGrNavigator((CGrNavigator *)(v11 - 96));
  _Unwind_Resume(a1);
}

void CKernel::~CKernel(CKernel *this)
{
  *(_QWORD *)this = &off_1E5014928;
  freeDataNodes(*((_QWORD *)this + 1577));
  *((_QWORD *)this + 1577) = 0;
  freeDataNodes(*((_QWORD *)this + 1578));
  *((_QWORD *)this + 1578) = 0;
  pthread_mutex_destroy((pthread_mutex_t *)((char *)this + 12632));
  *((_BYTE *)this + 8) = 0;
}

uint64_t freeDataNodes(uint64_t result)
{
  _QWORD *v1;
  _QWORD *v2;

  if (result)
  {
    v1 = (_QWORD *)result;
    do
    {
      v2 = (_QWORD *)v1[1];
      if (*v1)
        (*(void (**)(_QWORD))(*(_QWORD *)*v1 + 8))(*v1);
      result = MEMORY[0x1A85BFBEC](v1, 0x20C40A4A59CD2);
      v1 = v2;
    }
    while (v2);
  }
  return result;
}

uint64_t CKernel::BorrowData(CKernel *this, uint64_t a2)
{
  pthread_mutex_t *v4;
  _QWORD *v5;
  CMemBlock *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v4 = (pthread_mutex_t *)((char *)this + 12632);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 12632));
  v5 = (_QWORD *)*((_QWORD *)this + 1577);
  if (v5)
  {
    *((_QWORD *)this + 1577) = v5[1];
    v5[1] = 0;
  }
  else
  {
    v5 = (_QWORD *)operator new();
    *v5 = 0;
    v5[1] = 0;
    v6 = (CMemBlock *)CBaseObject::operator new((CBaseObject *)0x40);
    CMemBlock::CMemBlock(v6, *((CMemEnv **)this + 2), a2, 1, 16);
    *v5 = v6;
  }
  v7 = *((_QWORD *)this + 1578);
  if (v7)
  {
    do
    {
      v8 = v7;
      v7 = *(_QWORD *)(v7 + 8);
    }
    while (v7);
    v9 = (_QWORD *)(v8 + 8);
  }
  else
  {
    v9 = (_QWORD *)((char *)this + 12624);
  }
  *v9 = v5;
  if (*v5)
  {
    (*(void (**)(_QWORD))(*(_QWORD *)*v5 + 80))(*v5);
    v10 = *v5;
  }
  else
  {
    v10 = 0;
  }
  pthread_mutex_unlock(v4);
  return v10;
}

void sub_1A64C564C(_Unwind_Exception *a1)
{
  void *v1;

  CBaseRef::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t CKernel::ReturnData(CKernel *this, CMemBlock *a2)
{
  pthread_mutex_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = (pthread_mutex_t *)((char *)this + 12632);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 12632));
  v5 = *((_QWORD *)this + 1578);
  if (v5)
  {
    if (*(CMemBlock **)v5 == a2)
    {
      *((_QWORD *)this + 1578) = *(_QWORD *)(v5 + 8);
      *(_QWORD *)(v5 + 8) = 0;
      a2 = *(CMemBlock **)v5;
      if (*(_QWORD *)v5)
LABEL_8:
        (*(void (**)(CMemBlock *))(*(_QWORD *)a2 + 88))(a2);
LABEL_9:
      v7 = *((_QWORD *)this + 1577);
      if (v7)
      {
        do
        {
          v8 = v7;
          v7 = *(_QWORD *)(v7 + 8);
        }
        while (v7);
        v9 = (_QWORD *)(v8 + 8);
      }
      else
      {
        v9 = (_QWORD *)((char *)this + 12616);
      }
      *v9 = v5;
    }
    else
    {
      while (1)
      {
        v6 = v5;
        v5 = *(_QWORD *)(v5 + 8);
        if (!v5)
          break;
        if (*(CMemBlock **)v5 == a2)
        {
          *(_QWORD *)(v6 + 8) = *(_QWORD *)(v5 + 8);
          *(_QWORD *)(v5 + 8) = 0;
          if (a2)
            goto LABEL_8;
          goto LABEL_9;
        }
      }
    }
  }
  return pthread_mutex_unlock(v4);
}

uint64_t CMedian::CKernel8C::Process_(CMedian::CKernel8C *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5)
{
  CMedian::CKernel8C *v9;
  uint64_t v10;
  CMemBlock *v11;
  unsigned __int16 *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  int64x2_t v18;
  __int128 v19;
  uint64_t v20;
  unsigned int v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unsigned __int8 *v26;
  __int128 v27;
  __int128 v28;
  int v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int16 *v36;
  unsigned __int8 *v37;
  uint64_t v38;
  int v39;
  int v40;
  uint64_t v41;
  int v42;
  int v43;
  int v44;
  int v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  unsigned int v50;
  int v51;
  int v52;
  uint64_t v53;
  unsigned __int8 *v54;
  uint64_t v55;
  uint64_t v56;
  unsigned __int8 *v57;
  unsigned int v58;
  unsigned int *v59;
  unsigned int *v60;
  uint64_t v61;
  int v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  unsigned __int8 *v71;
  unsigned int v72;
  unsigned int *v73;
  unsigned int *v74;
  uint64_t v75;
  int v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unsigned int v83;
  unsigned int v84;
  int v86;
  int v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  int v93;
  uint64_t v94;
  unsigned __int16 *v95;
  uint64_t v96;
  unsigned __int8 *v97;
  uint64_t v98;
  int v99;
  int v100;
  uint64_t v101;
  int v102;
  int v103;
  int v104;
  int v105;
  int v106;
  uint64_t v107;
  uint64_t v108;
  unsigned int v109;
  int v110;
  unsigned __int8 *v111;
  int v112;
  uint64_t v113;
  int v114;
  unsigned __int8 *v115;
  uint64_t v116;
  uint64_t v117;
  unsigned __int8 *v118;
  unsigned int v119;
  uint64_t v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  unsigned int v128;
  unsigned __int8 *v129;
  unsigned int v130;
  uint64_t v131;
  int v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  int v139;
  int v140;
  uint64_t v141;
  __int128 v142;
  int v143;
  unsigned __int16 *v144;
  int v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  unsigned int v149;
  int v150;
  unsigned __int8 *v151;
  uint64_t v152;
  int v153;
  uint64_t v154;
  int v155;
  int v156;
  int v157;
  int v158;
  int v159;
  uint64_t v160;
  uint64_t v161;
  unsigned int v162;
  unsigned int i;
  unsigned int v164;
  uint64_t v165;
  int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  int v170;
  int v171;
  unsigned int v172;
  int v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  int v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  unsigned int v181;
  uint64_t v182;
  unsigned int v183;
  uint64_t v184;
  unsigned int v185;
  int v186;
  int v187;
  uint64_t v188;
  unsigned __int8 *v189;
  int v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  unsigned int v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  int v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  uint64_t v205;
  uint64_t v206;
  unsigned int v207;
  int v208;
  uint64_t v209;
  unsigned int v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  int v217;
  int v218;
  int v219;
  unsigned int v220;
  BOOL v221;
  unsigned __int8 *v222;
  uint64_t v223;
  int v224;
  BOOL v225;
  unsigned __int8 *v226;
  uint64_t v227;
  int v228;
  uint64_t v229;
  uint64_t v230;
  unsigned __int8 *v231;
  uint64_t v232;
  int v233;
  unsigned __int8 *v234;
  int v235;
  uint64_t v236;
  unsigned __int8 *v237;
  uint64_t v238;
  int v239;
  unsigned __int8 *v240;
  int v241;
  unsigned int v242;
  uint64_t v243;
  int v244;
  int v245;
  unsigned __int8 *v246;
  uint64_t v247;
  uint64_t v248;
  int v249;
  unsigned __int8 *v250;
  int v251;
  unsigned __int8 *v253;
  int v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  unsigned int v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  int v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  unsigned __int8 *v270;
  int v271;
  uint64_t v272;
  uint64_t v273;
  int v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  unsigned int v281;
  CMemBlock *v282;
  CMemBlock *v283;
  CMedian::CKernel8C *v284;
  CMedian::CKernel8C *v285;
  uint64_t v286;
  int v287;
  _BYTE *v288;
  uint64_t v289;
  int v290;
  uint64_t v291;
  int v292;
  int j;
  int v294;
  uint64_t v295;
  int v296;
  uint64_t v297;
  int v298;
  uint64_t v299;
  unsigned __int8 *v300;
  int v301;
  int v302;
  int v303;
  uint64_t v304;
  int v305;
  int v306;
  int v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  int v311;
  int v312;
  int v313;
  unsigned int v314[2];
  uint64_t v315;
  uint64_t v316;
  __int128 v317;
  __int128 v318;
  __int128 v319;
  char v320;
  char v321;
  uint64_t (**v322)();
  uint64_t v323;
  unsigned __int8 *v324;
  _BYTE v325[48];
  __int16 v326;
  int v327;
  unsigned int v328;
  uint64_t (**v329)();
  _QWORD v330[2];
  __int128 v331;
  __int128 v332;
  __int128 v333;
  char v334;
  char v335;
  uint64_t (**v336)();
  uint64_t v337;
  uint64_t v338;
  __int128 v339;
  __int128 v340;
  __int128 v341;
  char v342;
  char v343;
  uint64_t v344;

  v9 = this;
  v344 = *MEMORY[0x1E0C80C00];
  v10 = CKernel::BorrowData(this, 576);
  if (!v10)
    return 7;
  v11 = (CMemBlock *)v10;
  v12 = (unsigned __int16 *)(*(_QWORD *)(v10 + 32) + 576 * a4);
  v13 = *((_QWORD *)v9 + 1587);
  if (*(_BYTE *)(v13 + 46) && a5 && *(_BYTE *)(v13 + 47))
  {
    v284 = v9;
    v338 = *((_QWORD *)a2 + 2);
    v14 = *(_OWORD *)((char *)a2 + 24);
    v339 = v14;
    v340 = *(_OWORD *)((char *)a2 + 40);
    v341 = *(_OWORD *)((char *)a2 + 56);
    v342 = *((_BYTE *)a2 + 72);
    v343 = 0;
    v337 = 0;
    v336 = off_1E50147D8;
    v304 = *((_QWORD *)a3 + 2);
    v330[0] = 0;
    v330[1] = v304;
    v15 = *(_OWORD *)((char *)a3 + 24);
    v16 = *(_OWORD *)((char *)a3 + 40);
    v331 = v15;
    v332 = v16;
    v17 = *(_OWORD *)((char *)a3 + 56);
    v333 = v17;
    v334 = *((_BYTE *)a3 + 72);
    v335 = 0;
    v329 = off_1E5014818;
    v19 = *((_OWORD *)a5 + 2);
    v18 = *((int64x2_t *)a5 + 3);
    v269 = *((_QWORD *)a5 + 3);
    v270 = (unsigned __int8 *)*((_QWORD *)a5 + 2);
    v324 = v270;
    *(_QWORD *)v325 = v269;
    *(_OWORD *)&v325[8] = v19;
    *(int64x2_t *)&v325[24] = vshrq_n_s64(vshlq_n_s64(v18, 0x20uLL), 0x20uLL);
    *(_QWORD *)&v325[40] = *((_QWORD *)a5 + 8);
    v326 = 1;
    v322 = off_1E50147D8;
    v323 = 0;
    v292 = DWORD2(v16) - 1;
    v20 = *v270;
    v21 = *(unsigned __int16 *)(v13 + 2 * v20 + 822);
    v22 = v20;
    v23 = *(unsigned __int8 *)(v13 + v20 + 53);
    v24 = *(_QWORD *)(v13 + 16);
    if (v24)
      v25 = *(_QWORD *)(v24 + 32);
    else
      v25 = 0;
    v311 = v17;
    v140 = *(_DWORD *)(v13 + 24);
    v141 = v14;
    v142 = v15;
    bzero(v12, 0x240uLL);
    v143 = v140;
    v144 = v12 + 16;
    v314[0] = 0;
    v281 = v21;
    v328 = v21;
    v145 = v23;
    v146 = -v23;
    v147 = v338;
    v148 = v25;
    do
    {
      if (v146 >= 0)
        v149 = v146;
      else
        v149 = -v146;
      v150 = *(unsigned __int8 *)(v25 + (v22 << 7) + v149) - 1;
      v151 = (unsigned __int8 *)(v147 + v141 * (v146 + v140) + (v140 - v150));
      if (v151)
      {
        v152 = (2 * v150) | 1u;
        do
        {
          v153 = *v151++;
          ++v144[v153];
          --v152;
        }
        while (v152);
      }
      v221 = v146++ == v23;
    }
    while (!v221);
    v283 = v11;
    LODWORD(v154) = 0;
    v155 = 0;
    v291 = v311;
    v156 = v140 - 1;
    v157 = v140 + 1;
    v268 = v25 + 1;
    v158 = v292;
    v159 = 1;
    v160 = v22;
    v277 = v148;
    v279 = v13;
LABEL_73:
    v288 = (_BYTE *)(v13 + v160 + 1334);
    v309 = v160;
    v161 = v148 + (v160 << 7);
    v298 = -v145;
    v154 = (int)v154;
    v296 = (2 * v145) | 1;
    v162 = v156 + v154;
    for (i = v157 + v154; ; ++i)
    {
      if (v309)
      {
        v312 = v159;
        v164 = i;
        v165 = v154;
        v166 = v158;
        v167 = Hist8CRead_(v144, v314, (int *)&v328);
        if (*v288)
        {
          v154 = v165;
          v167 += ((*(unsigned __int8 *)(v147 + (v155 + v143) + v141 * (v143 + v165)) - v167)
                 * *v288) >> 8;
          v158 = v166;
        }
        else
        {
          v158 = v166;
          v154 = v165;
        }
        i = v164;
        v159 = v312;
      }
      else
      {
        LOBYTE(v167) = *(_BYTE *)(v147 + (v155 + v143) + v141 * (v143 + v154));
      }
      *(_BYTE *)(*((_QWORD *)&v142 + 1) * v155 + v304 + v142 * v154) = v167;
      if (v155 != v158)
      {
        v177 = v155 - (v159 == -1);
        if (v159 < 1)
        {
          v160 = v270[v177 + v269 * v154];
          v178 = v309;
          v180 = v160;
          v179 = v160;
        }
        else
        {
          v160 = v270[v177 + 1 + v269 * v154];
          v178 = v160;
          v179 = v309;
          v180 = v309;
          v309 = v160;
        }
        v181 = v328 - v281;
        v182 = *(unsigned __int8 *)(v279 + v160 + 53);
        v281 = *(unsigned __int16 *)(v279 + 2 * v160 + 822);
        v183 = v181 + v281;
        v274 = v158;
        v271 = v154;
        v313 = *(unsigned __int8 *)(v279 + v160 + 53);
        if (*(unsigned __int16 *)(v279 + 310 + 2 * v180) != *(unsigned __int16 *)(v279 + 310 + 2 * v178))
        {
          v205 = v277 + (v179 << 7);
          LODWORD(v206) = *(unsigned __int8 *)(v279 + 53 + v180);
          v207 = *(unsigned __int8 *)(v279 + 53 + v178);
          v208 = v143 + v154;
          v209 = v147 + (v177 + v143);
          v210 = v314[0];
          if (v207 <= v206)
            v206 = v206;
          else
            v206 = v207;
          v13 = v279;
          while (1)
          {
            v211 = *(unsigned __int8 *)(v205 + v206);
            v212 = *(unsigned __int8 *)(v277 + (v309 << 7) + v206);
            v213 = v209 + v141 * (v208 - v206);
            v214 = v209 + v141 * (v208 + v206);
            if (*(_BYTE *)(v205 + v206))
            {
              v215 = 1 - v211;
              if (*(_BYTE *)(v277 + (v309 << 7) + v206))
              {
                v216 = 2 - v212;
                if ((_DWORD)v215 != 2 - (_DWORD)v212)
                {
                  if ((int)v215 >= v216)
                    v217 = 2 - v212;
                  else
                    v217 = 1 - v211;
                  if ((int)v215 <= v216)
                    v218 = 2 - v212;
                  else
                    v218 = 1 - v211;
                  if ((int)v215 <= v216)
                    v219 = -v159;
                  else
                    v219 = v159;
                  v220 = v218 - v217;
                  v221 = v218 == v217 || v213 == 0;
                  if (!v221)
                  {
                    v222 = (unsigned __int8 *)(v213 + v217);
                    v223 = -(uint64_t)v220;
                    do
                    {
                      v224 = *v222++;
                      v183 -= v219 & ((int)(v224 - v210) >> 31);
                      v144[v224] += v219;
                      v225 = __CFADD__(v223++, 1);
                    }
                    while (!v225);
                  }
                  if (v206 >= 1 && v218 != v217 && v214)
                  {
                    v226 = (unsigned __int8 *)(v214 + v217);
                    v227 = -(uint64_t)v220;
                    do
                    {
                      v228 = *v226++;
                      v183 -= v219 & ((int)(v228 - v210) >> 31);
                      v144[v228] += v219;
                      v225 = __CFADD__(v227++, 1);
                    }
                    while (!v225);
                  }
                }
                v242 = v212 + 1;
                if ((_DWORD)v212 + 1 != (_DWORD)v211)
                {
                  v243 = v242 >= v211 ? v211 : v242;
                  v244 = v242 <= v211 ? v211 : v242;
                  v245 = v242 >= v211 ? v159 : -v159;
                  if (v244 != (_DWORD)v243)
                  {
                    v246 = (unsigned __int8 *)(v213 + v243);
                    v247 = (v244 - v243);
                    v248 = v247;
                    do
                    {
                      v249 = *v246++;
                      v183 -= v245 & ((int)(v249 - v210) >> 31);
                      v144[v249] += v245;
                      --v248;
                    }
                    while (v248);
                    if (v206 < 1)
                      goto LABEL_162;
                    v250 = (unsigned __int8 *)(v214 + v243);
                    do
                    {
                      v251 = *v250++;
                      v183 -= v245 & ((int)(v251 - v210) >> 31);
                      v144[v251] += v245;
                      --v247;
                    }
                    while (v247);
                  }
                }
              }
              else
              {
                v236 = (2 * v211 - 1);
                if (v213)
                {
                  v237 = (unsigned __int8 *)(v213 + v215);
                  v238 = v236;
                  do
                  {
                    v239 = *v237++;
                    v183 += v159 & ((int)(v239 - v210) >> 31);
                    v144[v239] -= v159;
                    --v238;
                  }
                  while (v238);
                }
                if (v206 < 1)
                  goto LABEL_162;
                if (v214)
                {
                  v240 = (unsigned __int8 *)(v214 + v215);
                  do
                  {
                    v241 = *v240++;
                    v183 += v159 & ((int)(v241 - v210) >> 31);
                    v144[v241] -= v159;
                    --v236;
                  }
                  while (v236);
                }
              }
            }
            else
            {
              v229 = 2 - v212;
              v230 = (2 * v212 - 1);
              if (v213)
              {
                v231 = (unsigned __int8 *)(v213 + v229);
                v232 = (2 * v212 - 1);
                do
                {
                  v233 = *v231++;
                  v183 -= v159 & ((int)(v233 - v210) >> 31);
                  v144[v233] += v159;
                  --v232;
                }
                while (v232);
              }
              if (v206 < 1)
              {
LABEL_162:
                v328 = v183;
                v148 = v277;
                goto LABEL_168;
              }
              if (v214)
              {
                v234 = (unsigned __int8 *)(v214 + v229);
                do
                {
                  v235 = *v234++;
                  v183 -= v159 & ((int)(v235 - v210) >> 31);
                  v144[v235] += v159;
                  --v230;
                }
                while (v230);
              }
            }
            if (v206-- <= 0)
              goto LABEL_162;
          }
        }
        v184 = v160 << 7;
        v185 = v314[0];
        v186 = v177 + v143;
        v187 = v177 + v143 + 1;
        v188 = (v143 + v154);
        if (v159 == 1)
        {
          if (*(_BYTE *)(v279 + v160 + 53))
          {
            v189 = (unsigned __int8 *)(v268 + v184);
            do
            {
              v190 = *v189++;
              v191 = v141 * i;
              v192 = (v187 - v190) + v147;
              v193 = (v186 + v190) + v147;
              v194 = *(unsigned __int8 *)(v193 + v191);
              v195 = *(unsigned __int8 *)(v192 + v191);
              ++v144[v194];
              v196 = v195 - v185;
              --v144[v195];
              v197 = v141 * v162;
              v198 = *(unsigned __int8 *)(v193 + v197);
              v199 = *(unsigned __int8 *)(v192 + v197);
              ++v144[v198];
              v183 += ((int)(v194 - v185) >> 31)
                    + (v196 >> 31)
                    + ((v199 - v185) >> 31)
                    + ((int)(v198 - v185) >> 31);
              --v144[v199];
              --v162;
              ++i;
              --v182;
            }
            while (v182);
          }
          v148 = v277;
          v200 = *(unsigned __int8 *)(v277 + (v160 << 7));
          v201 = v147 + v141 * v188;
          v202 = *(unsigned __int8 *)(v201 + (v187 - v200));
          v203 = *(unsigned __int8 *)(v201 + (v186 + v200));
          v204 = v203 - v185;
          ++v144[v203];
          LOWORD(v203) = v144[v202];
          v328 = v183 + (v204 >> 31) + ((v202 - v185) >> 31);
          v144[v202] = v203 - 1;
        }
        else
        {
          if (*(_BYTE *)(v279 + v160 + 53))
          {
            v253 = (unsigned __int8 *)(v268 + v184);
            do
            {
              v254 = *v253++;
              v255 = v141 * i;
              v256 = (v187 - v254) + v147;
              v257 = *(unsigned __int8 *)(v256 + v255);
              v258 = (v186 + v254) + v147;
              v259 = *(unsigned __int8 *)(v258 + v255);
              ++v144[v257];
              v260 = v259 - v185;
              --v144[v259];
              v261 = v141 * v162;
              v262 = *(unsigned __int8 *)(v256 + v261);
              v263 = *(unsigned __int8 *)(v258 + v261);
              ++v144[v262];
              v183 += ((int)(v257 - v185) >> 31)
                    + (v260 >> 31)
                    + ((int)(v262 - v185) >> 31)
                    + ((v263 - v185) >> 31);
              --v144[v263];
              --v162;
              ++i;
              --v182;
            }
            while (v182);
          }
          v148 = v277;
          v264 = *(unsigned __int8 *)(v277 + (v160 << 7));
          v265 = v147 + v141 * v188;
          v266 = *(unsigned __int8 *)(v265 + (v187 - v264));
          v267 = *(unsigned __int8 *)(v265 + (v186 + v264));
          ++v144[v266];
          LOWORD(v265) = v144[v267];
          v328 = v183 + ((int)(v266 - v185) >> 31) + ((v267 - v185) >> 31);
          v144[v267] = v265 - 1;
        }
        v13 = v279;
LABEL_168:
        if (v159 == 1)
          v155 = v177 + 1;
        else
          v155 -= v159 == -1;
        v157 = v143 + 1;
        v156 = v143 - 1;
        v158 = v274;
        LODWORD(v154) = v271;
        v145 = v313;
        goto LABEL_73;
      }
      if (v154 + 1 >= v291)
        break;
      v168 = v328;
      v169 = v314[0];
      v170 = v296;
      v171 = v298;
      do
      {
        if (v171 >= 0)
          v172 = v171;
        else
          v172 = -v171;
        v173 = *(unsigned __int8 *)(v161 + v172);
        v174 = v147 + (v143 + v158 + v171);
        v175 = *(unsigned __int8 *)(v141 * (v143 + v154 + 1 - v173) + v174);
        v176 = *(unsigned __int8 *)(v141 * (v143 + v154 + v173) + v174);
        ++v144[v176];
        v168 += ((int)(v176 - v169) >> 31) + ((v175 - v169) >> 31);
        --v144[v175];
        ++v171;
        --v170;
      }
      while (v170);
      v328 = v168;
      v159 = -v159;
      v155 = v158;
      v158 = v292 - v158;
      ++v162;
      ++v154;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v322);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v329);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v336);
    v11 = v283;
    v9 = v284;
  }
  else
  {
    v26 = (unsigned __int8 *)*((_QWORD *)a2 + 2);
    v323 = 0;
    v324 = v26;
    *(_OWORD *)v325 = *(_OWORD *)((char *)a2 + 24);
    *(_OWORD *)&v325[16] = *(_OWORD *)((char *)a2 + 40);
    *(_OWORD *)&v325[32] = *(_OWORD *)((char *)a2 + 56);
    v326 = *((unsigned __int8 *)a2 + 72);
    v322 = off_1E50147D8;
    v310 = *((_QWORD *)a3 + 2);
    v315 = 0;
    v316 = v310;
    v27 = *(_OWORD *)((char *)a3 + 40);
    v317 = *(_OWORD *)((char *)a3 + 24);
    v318 = v27;
    v28 = *(_OWORD *)((char *)a3 + 56);
    v319 = v28;
    v320 = *((_BYTE *)a3 + 72);
    v321 = 0;
    *(_QWORD *)v314 = off_1E5014818;
    v29 = v28;
    v30 = *(_QWORD *)v325;
    v297 = *((_QWORD *)&v317 + 1);
    v308 = v317;
    v31 = DWORD2(v27);
    if (*(_BYTE *)(v13 + 48))
    {
      v32 = (2 * *(_DWORD *)(v13 + 24)) | 1u;
      if (v32 <= 0xFF)
      {
        v285 = v9;
        bzero(&v336, 0x400uLL);
        bzero(&v329, 0x400uLL);
        v33 = 0;
        v34 = 0;
        do
        {
          *((_DWORD *)&v336 + v34) = v33;
          *((_DWORD *)&v330[-1] + v34++) = v32 + v33;
          v33 += v30;
        }
        while (v32 != v34);
        bzero(v12, 0x240uLL);
        v35 = 0;
        v36 = v12 + 16;
        do
        {
          v37 = &v26[v30 * v35];
          if (v37)
          {
            v38 = v32;
            do
            {
              v39 = *v37++;
              ++v36[v39];
              --v38;
            }
            while (v38);
          }
          ++v35;
        }
        while (v35 != v32);
        v40 = 0;
        LODWORD(v41) = 0;
        v42 = v31 - 1;
        v328 = 0;
        v327 = (v32 * v32) >> 1;
        v43 = v29 - 1;
        v289 = v336;
        v286 = HIDWORD(v336);
        v282 = v11;
        v305 = 1;
        v44 = v42;
        v275 = v329;
        v272 = HIDWORD(v329);
        v294 = v42;
        for (j = v29 - 1; ; v43 = j)
        {
          v45 = v40;
          v301 = v42 - v40;
          if ((int)v41 <= v43)
            v46 = v43;
          else
            v46 = v41;
          v41 = (int)v41;
          v47 = v46;
          v299 = v40;
          v48 = v297 * v40;
          while (1)
          {
            *(_BYTE *)(v310 + v308 * v41 + v48) = Hist8CRead_(v36, &v328, &v327);
            v49 = v30 * v41;
            if (v45 != v44)
              break;
            if (v41 == v47)
              goto LABEL_60;
            v50 = v328;
            v51 = v327;
            v52 = v45;
            v53 = v32;
            do
            {
              v54 = &v26[v52];
              v55 = v54[v49];
              v56 = v54[v30 * (v32 + v41)];
              ++v36[v56];
              v51 += ((int)(v56 - v50) >> 31) + ((v55 - v50) >> 31);
              --v36[v55];
              ++v52;
              --v53;
            }
            while (v53);
            v327 = v51;
            v305 = -v305;
            ++v41;
            v44 = v301;
          }
          v57 = &v26[v299 + v49];
          if (v305 == 1)
          {
            v58 = v328;
            v59 = (unsigned int *)&v337;
            v60 = (unsigned int *)v330;
            v61 = v32;
            v62 = v327;
            v63 = v272;
            v64 = v275;
            v65 = v286;
            v66 = v289;
            do
            {
              v67 = v57[v66];
              v68 = v57[v64];
              ++v36[v68];
              v62 += ((int)(v68 - v58) >> 31) + ((v67 - v58) >> 31);
              --v36[v67];
              v66 = v65;
              v69 = *v59++;
              v65 = v69;
              v64 = v63;
              v70 = *v60++;
              v63 = v70;
              --v61;
            }
            while (v61);
            v327 = v62;
            v40 = v45 + 1;
            v305 = 1;
          }
          else
          {
            v71 = v57 - 1;
            v72 = v328;
            v73 = (unsigned int *)&v337;
            v74 = (unsigned int *)v330;
            v75 = v32;
            v76 = v327;
            v77 = v272;
            v78 = v275;
            v79 = v286;
            v80 = v289;
            do
            {
              v81 = v71[v80];
              v82 = v71[v78];
              ++v36[v81];
              v76 += ((int)(v81 - v72) >> 31) + ((v82 - v72) >> 31);
              --v36[v82];
              v80 = v79;
              v83 = *v73++;
              v79 = v83;
              v78 = v77;
              v84 = *v74++;
              v77 = v84;
              --v75;
            }
            while (v75);
            v40 = v45 - 1;
            v327 = v76;
          }
          v42 = v294;
        }
      }
    }
    else
    {
      v302 = DWORD2(v27);
      v306 = v28;
      v282 = (CMemBlock *)v10;
      v285 = v9;
      v86 = *(_DWORD *)(v13 + 24);
      v87 = *(_DWORD *)(v13 + 36);
      v88 = (2 * v86);
      v89 = (2 * v86) | 1u;
      v90 = v13 + 1590;
      bzero(&v336, 0x400uLL);
      bzero(&v329, 0x400uLL);
      v91 = 0;
      v92 = 0;
      do
      {
        v93 = *(unsigned __int8 *)(v90 + v92);
        *((_DWORD *)&v336 + v92) = v91 + v93;
        *((_DWORD *)&v330[-1] + v92++) = v89 + v91 - v93;
        v91 += v30;
      }
      while (v89 != v92);
      *((_DWORD *)&v336 + v89) = 0;
      *((_DWORD *)&v330[-1] + v89) = 0;
      bzero(v12, 0x240uLL);
      v94 = 0;
      v95 = v12 + 16;
      do
      {
        v96 = *(unsigned __int8 *)(v90 + v94);
        v97 = &v26[v96 + v30 * v94];
        if (v97)
        {
          v98 = (v89 - 2 * v96);
          do
          {
            v99 = *v97++;
            ++v95[v99];
            --v98;
          }
          while (v98);
        }
        ++v94;
      }
      while (v94 != v89);
      v300 = (unsigned __int8 *)(v13 + 1590);
      v100 = 0;
      LODWORD(v101) = 0;
      v102 = v302 - 1;
      v328 = 0;
      v327 = v87;
      v103 = v306 - 1;
      v280 = v336;
      v278 = HIDWORD(v336);
      v104 = 1;
      v105 = v302 - 1;
      v276 = v329;
      v273 = HIDWORD(v329);
      v290 = v302 - 1;
      v287 = v306 - 1;
LABEL_43:
      v307 = v100;
      v303 = v102 - v100;
      if ((int)v101 <= v103)
        v106 = v103;
      else
        v106 = v101;
      v101 = (int)v101;
      v107 = v106;
      v295 = v100;
      v108 = v297 * v100;
      while (1)
      {
        *(_BYTE *)(v310 + v308 * v101 + v108) = Hist8CRead_(v95, &v328, &v327);
        if (v307 != v105)
        {
          v118 = &v26[v295 + v30 * v101];
          if (v104 == 1)
          {
            v119 = v328;
            v120 = -1;
            v121 = v327;
            v122 = v273;
            v123 = v276;
            v124 = v278;
            v125 = v280;
            do
            {
              v126 = v118[v125];
              v127 = v118[v123];
              ++v95[v127];
              v128 = v126 - v119;
              --v95[v126];
              v125 = v124;
              v124 = *((unsigned int *)&v336 + (v120 + 3));
              v121 += ((int)(v127 - v119) >> 31) + (v128 >> 31);
              v123 = v122;
              v122 = *((unsigned int *)&v330[-1] + (v120++ + 3));
            }
            while (v88 != v120);
            v327 = v121;
            v100 = v307 + 1;
            v104 = 1;
          }
          else
          {
            v129 = v118 - 1;
            v130 = v328;
            v131 = -1;
            v132 = v327;
            v133 = v273;
            v134 = v276;
            v135 = v278;
            v136 = v280;
            do
            {
              v137 = v129[v136];
              v138 = v129[v134];
              v139 = v132 + ((int)(v137 - v130) >> 31);
              ++v95[v137];
              --v95[v138];
              v136 = v135;
              v135 = *((unsigned int *)&v336 + (v131 + 3));
              v132 = v139 + ((v138 - v130) >> 31);
              v134 = v133;
              v133 = *((unsigned int *)&v330[-1] + (v131++ + 3));
            }
            while (v88 != v131);
            v100 = v307 - 1;
            v327 = v132;
          }
          v102 = v290;
          v103 = v287;
          goto LABEL_43;
        }
        if (v101 == v107)
          break;
        v109 = v328;
        v110 = v327;
        v111 = v300;
        v112 = v307;
        v113 = v89;
        do
        {
          v114 = *v111++;
          v115 = &v26[v112];
          v116 = v115[v30 * (v101 + v114)];
          v117 = v115[v30 * (v89 + v101 - v114)];
          ++v95[v117];
          v110 += ((int)(v117 - v109) >> 31) + ((v116 - v109) >> 31);
          --v95[v116];
          ++v112;
          --v113;
        }
        while (v113);
        v327 = v110;
        v104 = -v104;
        ++v101;
        v105 = v303;
      }
LABEL_60:
      v11 = v282;
      v9 = v285;
    }
    CGrNavigator::~CGrNavigator((CGrNavigator *)v314);
    CGrNavigator::~CGrNavigator((CGrNavigator *)&v322);
  }
  CKernel::ReturnData(v9, v11);
  return 0;
}

void CMedian::CKernel8C::~CKernel8C(CMedian::CKernel8C *this)
{
  *(_QWORD *)this = &off_1E5014BB0;
  CLock::~CLock((CMedian::CKernel8C *)((char *)this + 12704));
  CKernel::~CKernel(this);
}

{
  *(_QWORD *)this = &off_1E5014BB0;
  CLock::~CLock((CMedian::CKernel8C *)((char *)this + 12704));
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernel8C::IdealTSize(CMedian::CKernel8C *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 8);
  else
    return 0x10000000100;
}

uint64_t Hist8CRead_(unsigned __int16 *a1, unsigned int *a2, int *a3)
{
  uint64_t result;
  int v5;
  unsigned __int16 *v6;
  int v7;
  BOOL v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  int v14;
  int v15;
  unsigned __int16 *v16;
  int v17;

  result = *a2;
  v5 = -*a3;
  v6 = &a1[result];
  if (*a3 < 0)
  {
    v16 = v6 - 1;
    while (1)
    {
      v5 -= *v16;
      if (v5 < 1)
      {
        result = (result - 1);
        goto LABEL_31;
      }
      v5 -= *(v16 - 1);
      if (v5 < 1)
      {
        result = (result - 2);
        goto LABEL_31;
      }
      v5 -= *(v16 - 2);
      if (v5 < 1)
      {
        result = (result - 3);
        goto LABEL_31;
      }
      v5 -= *(v16 - 3);
      if (v5 < 1)
      {
        result = (result - 4);
        goto LABEL_31;
      }
      v5 -= *(v16 - 4);
      if (v5 < 1)
      {
        result = (result - 5);
        goto LABEL_31;
      }
      v5 -= *(v16 - 5);
      if (v5 < 1)
      {
        result = (result - 6);
        goto LABEL_31;
      }
      v5 -= *(v16 - 6);
      if (v5 < 1)
        break;
      v17 = *(v16 - 7);
      result = (result - 8);
      v16 -= 8;
      v8 = __OFSUB__(v5, v17);
      v5 -= v17;
      if ((v5 < 0) ^ v8 | (v5 == 0))
        goto LABEL_31;
    }
    result = (result - 7);
  }
  else
  {
    LODWORD(result) = result - 1;
    while (1)
    {
      v7 = *v6;
      v8 = __OFADD__(v5, v7);
      v9 = v5 + v7;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        result = (result + 1);
        goto LABEL_31;
      }
      v10 = v6[1];
      v8 = __OFADD__(v9, v10);
      v5 = v9 + v10;
      if (!((v5 < 0) ^ v8 | (v5 == 0)))
      {
        result = (result + 2);
        goto LABEL_30;
      }
      v11 = v6[2];
      v8 = __OFADD__(v5, v11);
      v9 = v5 + v11;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        result = (result + 3);
        goto LABEL_31;
      }
      v12 = v6[3];
      v8 = __OFADD__(v9, v12);
      v5 = v9 + v12;
      if (!((v5 < 0) ^ v8 | (v5 == 0)))
      {
        result = (result + 4);
        goto LABEL_30;
      }
      v13 = v6[4];
      v8 = __OFADD__(v5, v13);
      v9 = v5 + v13;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        result = (result + 5);
        goto LABEL_31;
      }
      v14 = v6[5];
      v8 = __OFADD__(v9, v14);
      v5 = v9 + v14;
      if (!((v5 < 0) ^ v8 | (v5 == 0)))
        break;
      v15 = v6[6];
      v8 = __OFADD__(v5, v15);
      v9 = v5 + v15;
      if (!((v9 < 0) ^ v8 | (v9 == 0)))
      {
        result = (result + 7);
        goto LABEL_31;
      }
      v5 = v9 + v6[7];
      result = (result + 8);
      v6 += 8;
      if (v5 >= 1)
        goto LABEL_30;
    }
    result = (result + 6);
LABEL_30:
    v5 = v9;
  }
LABEL_31:
  *a2 = result;
  *a3 = -v5;
  return result;
}

void CMemBlock::~CMemBlock(CMemBlock *this)
{
  void *v1;

  CMemBlock::~CMemBlock(this);
  CBaseRef::operator delete(v1);
}

{
  _QWORD *v2;
  uint64_t v3;

  *(_QWORD *)this = off_1E50149B0;
  if (*((int *)this + 2) <= 0 && *((_BYTE *)this + 14))
  {
    v2 = (_QWORD *)((char *)this + 24);
    if (*((_QWORD *)this + 3))
    {
      v3 = *((_QWORD *)this + 7);
      if (v3)
      {
        (*(void (**)(uint64_t))(*(_QWORD *)v3 + 32))(v3);
        *v2 = 0;
        *((_QWORD *)this + 4) = 0;
      }
    }
    *((_BYTE *)this + 12) = 0;
  }
}

uint64_t CMemBlock::Allocate(CMemBlock *this, uint64_t a2, char a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *((_DWORD *)this + 4) = 0;
  *((_BYTE *)this + 13) = a3;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = a2;
  v5 = *((_QWORD *)this + 6);
  v4 = *((_QWORD *)this + 7);
  v6 = v5 & -v5;
  *((_QWORD *)this + 6) = v6;
  v7 = 7;
  if (v4)
  {
    v8 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 24))(v4, (v6 + a2));
    *((_QWORD *)this + 3) = v8;
    if (v8)
      return 0;
    else
      return 7;
  }
  return v7;
}

uint64_t CMemBlock::Free(CMemBlock *this)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;

  result = *((_QWORD *)this + 7);
  if (result)
  {
    v4 = *((_QWORD *)this + 3);
    v3 = (_QWORD *)((char *)this + 24);
    if (v4)
    {
      result = (*(uint64_t (**)(uint64_t))(*(_QWORD *)result + 32))(result);
      *v3 = 0;
      v3[1] = 0;
    }
  }
  return result;
}

uint64_t CMemBlock::Description@<X0>(CMemBlock *this@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  *(_QWORD *)a2 = off_1E5014838;
  *(_QWORD *)(a2 + 8) = 0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_DWORD *)(a2 + 32) = 0;
  *(_OWORD *)(a2 + 40) = 0u;
  *(_OWORD *)(a2 + 56) = 0u;
  *(_OWORD *)(a2 + 72) = 0u;
  v4 = *((_QWORD *)this + 4);
  v3 = *((_QWORD *)this + 5);
  result = (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)this + 7) + 56))(*((_QWORD *)this + 7), *((_QWORD *)this + 3));
  *(_QWORD *)(a2 + 16) = v3;
  *(_QWORD *)(a2 + 24) = v4 - result;
  *(_DWORD *)(a2 + 32) = 1;
  *(_QWORD *)(a2 + 64) = v3;
  *(_QWORD *)(a2 + 40) = 1;
  *(_QWORD *)(a2 + 8) = v4;
  return result;
}

uint64_t CMemBlock::Zero(CMemBlock *this)
{
  if (!*((_BYTE *)this + 13) || (*(unsigned int (**)(CMemBlock *))(*(_QWORD *)this + 48))(this))
  {
    if ((*(unsigned int (**)(CMemBlock *))(*(_QWORD *)this + 48))(this))
      bzero(*((void **)this + 4), *((_QWORD *)this + 5));
    else
      *((_BYTE *)this + 13) = 1;
  }
  return 0;
}

uint64_t CMemBlock::Lock(CMemBlock *this)
{
  int v2;
  uint64_t result;
  uint64_t v4;

  v2 = *((_DWORD *)this + 4);
  if (v2)
  {
    *((_DWORD *)this + 4) = v2 + 1;
LABEL_3:
    result = 0;
    *((_BYTE *)this + 13) = 0;
    return result;
  }
  v4 = *((_QWORD *)this + 7);
  if (!v4)
    return 7;
  result = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v4 + 40))(v4, *((_QWORD *)this + 3));
  if (!(_DWORD)result)
  {
    ++*((_DWORD *)this + 4);
    *((_QWORD *)this + 4) = (unint64_t)(*((_QWORD *)this + 6)
                                             + (*(uint64_t (**)(_QWORD, _QWORD))(**((_QWORD **)this + 7) + 56))(*((_QWORD *)this + 7), *((_QWORD *)this + 3)))/ *((_QWORD *)this + 6)* *((_QWORD *)this + 6);
    if (*((_BYTE *)this + 13))
    {
      *((_BYTE *)this + 13) = 0;
      (*(void (**)(CMemBlock *))(*(_QWORD *)this + 72))(this);
    }
    goto LABEL_3;
  }
  return result;
}

uint64_t CMemBlock::Unlock(uint64_t this)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(this + 16) - 1;
  *(_DWORD *)(this + 16) = v1;
  if (!v1)
  {
    v2 = this;
    this = *(_QWORD *)(this + 56);
    if (this)
    {
      this = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)this + 48))(this, *(_QWORD *)(v2 + 24));
      *(_QWORD *)(v2 + 32) = 0;
    }
  }
  return this;
}

uint64_t CMemBlock::Resize(CMemBlock *this, unint64_t a2, int a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  const void *v14;
  unint64_t v15;

  if (this && (*(unsigned int (**)(CMemBlock *))(*(_QWORD *)this + 80))(this))
    return 7;
  if (*((_QWORD *)this + 5) == a2)
  {
    v8 = 0;
    v9 = 0;
    if (a4)
    {
      v10 = 0;
      if ((a3 & 1) != 0)
        goto LABEL_29;
      v8 = (*(uint64_t (**)(CMemBlock *))(*(_QWORD *)this + 72))(this);
      v9 = 0;
      goto LABEL_11;
    }
    v10 = 0;
  }
  else
  {
    v11 = *((_QWORD *)this + 7);
    if (v11)
    {
      v9 = (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)v11 + 24))(v11, (*((_DWORD *)this + 12) + a2), 0);
      if (v9)
      {
        v8 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 7) + 40))(*((_QWORD *)this + 7), v9);
        if (!(_DWORD)v8)
        {
          v12 = (*(uint64_t (**)(_QWORD, uint64_t))(**((_QWORD **)this + 7) + 56))(*((_QWORD *)this + 7), v9);
          v13 = *((_QWORD *)this + 6);
          v8 = (v13 + v12) / v13 * v13;
          if (a3)
          {
            v14 = (const void *)*((_QWORD *)this + 4);
            if (*((_QWORD *)this + 5) >= a2)
              v15 = a2;
            else
              v15 = *((_QWORD *)this + 5);
            if (v13 + v12 != (v13 + v12) % v13 && v14 != 0)
              memcpy((void *)v8, v14, v15);
          }
          else
          {
            v15 = 0;
          }
          if (a2 > v15 && a4)
            bzero((void *)(v15 + v8), (a2 - v15));
          (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)this + 7) + 48))(*((_QWORD *)this + 7), v9);
          v10 = 1;
          goto LABEL_29;
        }
LABEL_11:
        v10 = 0;
        goto LABEL_29;
      }
    }
    else
    {
      v9 = 0;
    }
    v10 = 0;
    v8 = 7;
  }
LABEL_29:
  (*(void (**)(CMemBlock *))(*(_QWORD *)this + 88))(this);
  if (v10)
  {
    (*(void (**)(_QWORD, _QWORD))(**((_QWORD **)this + 7) + 32))(*((_QWORD *)this + 7), *((_QWORD *)this + 3));
    v8 = 0;
    *((_QWORD *)this + 3) = v9;
    *((_QWORD *)this + 4) = 0;
    *((_QWORD *)this + 5) = a2;
  }
  return v8;
}

void sub_1A64C6E08(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  CLock::~CLock((CLock *)va);
  _Unwind_Resume(a1);
}

void CLock::~CLock(CLock *this)
{
  uint64_t v1;

  *(_QWORD *)this = &off_1E50148B0;
  if (*((_BYTE *)this + 8))
  {
    v1 = *((_QWORD *)this + 2);
    if (v1)
      (*(void (**)(uint64_t))(*(_QWORD *)v1 + 88))(v1);
  }
}

{
  CLock::~CLock(this);
  JUMPOUT(0x1A85BFBECLL);
}

void CMemDescriptor::~CMemDescriptor(void *this)
{
  if (this)
  {
    --CMemEnv::excount;
    free(this);
  }
}

void CMemBlock::CMemBlock(CMemBlock *this, CMemEnv *a2, uint64_t a3, char a4, uint64_t a5)
{
  *((_DWORD *)this + 2) = 0;
  *(_QWORD *)this = off_1E50149B0;
  *((_BYTE *)this + 12) = 0;
  *((_BYTE *)this + 13) = a4;
  *((_BYTE *)this + 14) = 1;
  *((_DWORD *)this + 4) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = a3;
  *((_QWORD *)this + 6) = -a5 & a5;
  *((_QWORD *)this + 7) = a2;
  if (!CMemBlock::Allocate(this, a3, a4))
    *((_BYTE *)this + 12) = 1;
}

uint64_t CMedian::CKernelBilateral::Process_(CMedian::CKernelBilateral *this, const CGrNavigator *a2, const CGrNavigator *a3, unsigned int a4, const CGrNavigator *a5, double a6, double a7, double a8, double a9)
{
  uint64_t v9;
  unsigned int v10;
  float v11;
  float v12;
  unint64_t v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  unsigned int v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  float32x4_t v32;
  float32x4_t v33;
  float v34;
  float v35;
  float *v36;
  float *v37;
  unsigned int v38;
  float v39;
  float v40;
  float v41;
  float v42;
  float v43;
  float32x4_t v44;
  float32x4_t v45;
  float32x4_t v46;
  float32x4_t v47;
  int v48;
  float v49;
  float v50;
  float v51;
  float v53;

  if (*((_QWORD *)a3 + 4) == 4)
  {
    v9 = *((_QWORD *)this + 1587);
    v10 = *(_DWORD *)(v9 + 40);
    v11 = 0.0;
    if (v10)
      v11 = (float)v10 * 0.0039062;
    v12 = v11 * 0.0039062;
    if (v11 < 1.0)
      v12 = v11;
    v13 = *((_QWORD *)a3 + 7);
    if (v13)
    {
      v14 = 0;
      v15 = 0;
      v16 = *(_DWORD *)(v9 + 24);
      v17 = 2 * v16;
      v18 = (2 * v16) | 1u;
      v19 = *((_QWORD *)a3 + 6);
      v20 = v16 & 0x7FFFFFFF;
      v21 = *((_QWORD *)a2 + 2);
      v22 = *((_QWORD *)a2 + 3);
      v23 = *(unsigned __int8 *)(v9 + 50);
      if (v17 / 6 <= 1)
        v24 = 1;
      else
        v24 = v17 / 6;
      v25 = *((_QWORD *)a3 + 2);
      v26 = *((_QWORD *)a3 + 3);
      do
      {
        if (v19)
        {
          v27 = 0;
          v29 = v26 * v14;
          do
          {
            v30 = 0;
            v31 = v21 + 4 * (v20 + v27);
            v28 = v22 * (v15 + v20);
            LODWORD(a8) = *(_DWORD *)(v31 + v28);
            if (v23)
              LODWORD(a9) = *(_DWORD *)(v31 + v28);
            else
              *(float *)&a9 = 1.0;
            *(float *)&a9 = *(float *)&a9 * v12;
            v32 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a8, 0);
            v33 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&a9, 0);
            v34 = 0.0;
            v35 = 0.0;
            do
            {
              v36 = (float *)(v21 + 4 * v27 + v22 * (v15 + v30));
              if (v17 >= 6)
              {
                v37 = v36 + 5;
                v38 = v24;
                do
                {
                  v39 = *(v37 - 1);
                  v40 = vabds_f32(v39, *(float *)&a8);
                  v41 = vabds_f32(*v37, *(float *)&a8);
                  v42 = vabds_f32(*(float *)&a9, v40) + (float)(*(float *)&a9 - v40);
                  v43 = vabds_f32(*(float *)&a9, v41) + (float)(*(float *)&a9 - v41);
                  v44 = *(float32x4_t *)(v37 - 5);
                  v45 = vabdq_f32(v44, v32);
                  v46 = vaddq_f32(vabdq_f32(v33, v45), vsubq_f32(v33, v45));
                  v47 = vmulq_f32(v46, v44);
                  v35 = (float)(vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v47, v47)) + (float)(v42 * v39))
                      + (float)(v35 + (float)(v43 * *v37));
                  v34 = (float)(v42 + (float)(v43 + v34)) + vaddv_f32((float32x2_t)*(_OWORD *)&vpaddq_f32(v46, v46));
                  v37 += 6;
                  --v38;
                }
                while (v38);
                v36 += 6 * v24;
              }
              v48 = 6 * (v18 / 6) - v18;
              do
              {
                v49 = *v36++;
                v50 = vabds_f32(v49, *(float *)&a8);
                v51 = vabds_f32(*(float *)&a9, v50) + (float)(*(float *)&a9 - v50);
                v35 = v35 + (float)(v51 * v49);
                v34 = v51 + v34;
              }
              while (!__CFADD__(v48++, 1));
              ++v30;
            }
            while (v30 != v18);
            if (v34 <= 0.0)
              v53 = 1.0;
            else
              v53 = v34;
            *(float *)(4 * v27++ + v25 + v29) = v35 / v53;
          }
          while (v19 > v27);
        }
        v14 = ++v15;
      }
      while (v13 > v15);
    }
  }
  return 0;
}

void CMedian::CKernelBilateral::~CKernelBilateral(CMedian::CKernelBilateral *this)
{
  CKernel::~CKernel(this);
  JUMPOUT(0x1A85BFBECLL);
}

unint64_t CMedian::CKernelBilateral::IdealTSize(CMedian::CKernelBilateral *this)
{
  CMedian::CxParms *v1;

  v1 = (CMedian::CxParms *)*((_QWORD *)this + 1587);
  if (v1)
    return CMedian::CxParms::IdealTSize(v1, 8);
  else
    return 0x10000000100;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BC90](color, alpha);
}

CGColorRef CGColorCreateGenericGrayGamma2_2(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA8](gray, alpha);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

CGColorSpaceRef CGColorSpaceRetain(CGColorSpaceRef space)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BF38](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGContextSetRGBFillColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A0](c, red, green, blue, alpha);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x1E0C9C4A8](c, red, green, blue, alpha);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
}

CGImageRef CGImageCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGColorSpaceRef space, CGBitmapInfo bitmapInfo, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate, CGColorRenderingIntent intent)
{
  return (CGImageRef)MEMORY[0x1E0C9CB80](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, space, *(_QWORD *)&bitmapInfo, provider);
}

uint64_t CGImageCreateFromIOSurface()
{
  return MEMORY[0x1E0CBC2D8]();
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF8](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

CFStringRef CGImageMetadataCopyStringValueWithPath(CGImageMetadataRef metadata, CGImageMetadataTagRef parent, CFStringRef path)
{
  return (CFStringRef)MEMORY[0x1E0CBC388](metadata, parent, path);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CFDictionaryRef CGImageSourceCopyPropertiesAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBC530](isrc, index, options);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CFDictionaryRef CGRectCreateDictionaryRepresentation(CGRect a1)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D560]((__n128)a1.origin, *(__n128 *)&a1.origin.y, (__n128)a1.size, *(__n128 *)&a1.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGRect *rect)
{
  return MEMORY[0x1E0C9D620](dict, rect);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFDictionaryRef CGSizeCreateDictionaryRepresentation(CGSize size)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9D808]((__n128)size, *(__n128 *)&size.height);
}

BOOL CGSizeMakeWithDictionaryRepresentation(CFDictionaryRef dict, CGSize *size)
{
  return MEMORY[0x1E0C9D818](dict, size);
}

CFArrayRef CMMetadataFormatDescriptionGetIdentifiers(CMMetadataFormatDescriptionRef desc)
{
  return (CFArrayRef)MEMORY[0x1E0C9EE98](desc);
}

CVImageBufferRef CMSampleBufferGetImageBuffer(CMSampleBufferRef sbuf)
{
  return (CVImageBufferRef)MEMORY[0x1E0C9EFD8](sbuf);
}

CMTime *__cdecl CMTimeAdd(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F298](retstr, lhs, rhs);
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

CMTime *__cdecl CMTimeConvertScale(CMTime *__return_ptr retstr, CMTime *time, int32_t newTimescale, CMTimeRoundingMethod method)
{
  return (CMTime *)MEMORY[0x1E0C9F2E0](retstr, time, *(_QWORD *)&newTimescale, *(_QWORD *)&method);
}

CFDictionaryRef CMTimeCopyAsDictionary(CMTime *time, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F2F0](time, allocator);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

CMTime *__cdecl CMTimeMakeFromDictionary(CMTime *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTime *)MEMORY[0x1E0C9F320](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeMinimum(CMTime *__return_ptr retstr, CMTime *time1, CMTime *time2)
{
  return (CMTime *)MEMORY[0x1E0C9F378](retstr, time1, time2);
}

CMTime *__cdecl CMTimeMultiply(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier)
{
  return (CMTime *)MEMORY[0x1E0C9F380](retstr, time, *(_QWORD *)&multiplier);
}

CMTime *__cdecl CMTimeMultiplyByRatio(CMTime *__return_ptr retstr, CMTime *time, int32_t multiplier, int32_t divisor)
{
  return (CMTime *)MEMORY[0x1E0C9F390](retstr, time, *(_QWORD *)&multiplier, *(_QWORD *)&divisor);
}

Boolean CMTimeRangeContainsTime(CMTimeRange *range, CMTime *time)
{
  return MEMORY[0x1E0C9F3A0](range, time);
}

CFDictionaryRef CMTimeRangeCopyAsDictionary(CMTimeRange *range, CFAllocatorRef allocator)
{
  return (CFDictionaryRef)MEMORY[0x1E0C9F3B0](range, allocator);
}

CMTimeRange *__cdecl CMTimeRangeFromTimeToTime(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *end)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3C8](retstr, start, end);
}

CMTime *__cdecl CMTimeRangeGetEnd(CMTime *__return_ptr retstr, CMTimeRange *range)
{
  return (CMTime *)MEMORY[0x1E0C9F3D0](retstr, range);
}

CMTimeRange *__cdecl CMTimeRangeMake(CMTimeRange *__return_ptr retstr, CMTime *start, CMTime *duration)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3E8](retstr, start, duration);
}

CMTimeRange *__cdecl CMTimeRangeMakeFromDictionary(CMTimeRange *__return_ptr retstr, CFDictionaryRef dictionaryRepresentation)
{
  return (CMTimeRange *)MEMORY[0x1E0C9F3F0](retstr, dictionaryRepresentation);
}

CMTime *__cdecl CMTimeSubtract(CMTime *__return_ptr retstr, CMTime *lhs, CMTime *rhs)
{
  return (CMTime *)MEMORY[0x1E0C9F400](retstr, lhs, rhs);
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A88](name, matrix, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

CFArrayRef CTFontDescriptorCreateMatchingFontDescriptors(CTFontDescriptorRef descriptor, CFSetRef mandatoryAttributes)
{
  return (CFArrayRef)MEMORY[0x1E0CA7AF0](descriptor, mandatoryAttributes);
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

CGFloat CTFontGetCapHeight(CTFontRef font)
{
  CGFloat result;

  MEMORY[0x1E0CA7BC0](font);
  return result;
}

CFTypeRef CVBufferCopyAttachment(CVBufferRef buffer, CFStringRef key, CVAttachmentMode *attachmentMode)
{
  return (CFTypeRef)MEMORY[0x1E0CA8900](buffer, key, attachmentMode);
}

void CVBufferSetAttachment(CVBufferRef buffer, CFStringRef key, CFTypeRef value, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8950](buffer, key, value, *(_QWORD *)&attachmentMode);
}

void CVBufferSetAttachments(CVBufferRef buffer, CFDictionaryRef theAttachments, CVAttachmentMode attachmentMode)
{
  MEMORY[0x1E0CA8958](buffer, theAttachments, *(_QWORD *)&attachmentMode);
}

uint64_t CVImageBufferSetColorSpace()
{
  return MEMORY[0x1E0CA8A00]();
}

CVReturn CVPixelBufferCreate(CFAllocatorRef allocator, size_t width, size_t height, OSType pixelFormatType, CFDictionaryRef pixelBufferAttributes, CVPixelBufferRef *pixelBufferOut)
{
  return MEMORY[0x1E0CA8A98](allocator, width, height, *(_QWORD *)&pixelFormatType, pixelBufferAttributes, pixelBufferOut);
}

size_t CVPixelBufferGetHeight(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B20](pixelBuffer);
}

IOSurfaceRef CVPixelBufferGetIOSurface(CVPixelBufferRef pixelBuffer)
{
  return (IOSurfaceRef)MEMORY[0x1E0CA8B30](pixelBuffer);
}

OSType CVPixelBufferGetPixelFormatType(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B38](pixelBuffer);
}

size_t CVPixelBufferGetWidth(CVPixelBufferRef pixelBuffer)
{
  return MEMORY[0x1E0CA8B50](pixelBuffer);
}

void CVPixelBufferRelease(CVPixelBufferRef texture)
{
  MEMORY[0x1E0CA8BF0](texture);
}

uint64_t FigLivePhotoMetadataComputeDeserializationSize()
{
  return MEMORY[0x1E0D03AF0]();
}

uint64_t FigLivePhotoMetadataDeserializeIntoBuffer()
{
  return MEMORY[0x1E0D03B00]();
}

uint64_t ICAnalyzeInputMotion()
{
  return MEMORY[0x1E0D3A918]();
}

uint64_t ICCalcCinematicL1Corrections()
{
  return MEMORY[0x1E0D3A928]();
}

uint64_t ICDestroyResult()
{
  return MEMORY[0x1E0D3A950]();
}

uint64_t ICGetResultHomographies()
{
  return MEMORY[0x1E0D3A998]();
}

uint64_t ICSynthesizeAnalysis()
{
  return MEMORY[0x1E0D3A9B8]();
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x1E0CC6980]();
}

uint64_t NSArrayFromNUPixelRect()
{
  return MEMORY[0x1E0D51CF8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x1E0CB3150](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromNUPixelRect()
{
  return MEMORY[0x1E0D51D00]();
}

uint64_t NSStringFromNUPixelSize()
{
  return MEMORY[0x1E0D51D08]();
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x1E0CB3228]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t NUAbsolutePointInRect()
{
  return MEMORY[0x1E0D51D10]();
}

uint64_t NUAbsoluteTime()
{
  return MEMORY[0x1E0D51D18]();
}

uint64_t NUAlignPixelRectToPixelGrid()
{
  return MEMORY[0x1E0D51D20]();
}

uint64_t NUAuxiliaryImageTypeFromString()
{
  return MEMORY[0x1E0D51D28]();
}

uint64_t NUCGAffineTransformByMappingFromRectToRect()
{
  return MEMORY[0x1E0D51D30]();
}

uint64_t NUCGRectConvertFromRectToRect()
{
  return MEMORY[0x1E0D51D38]();
}

uint64_t NUFileTypeFromExtension()
{
  return MEMORY[0x1E0D51D58]();
}

uint64_t NUHeight()
{
  return MEMORY[0x1E0D51D60]();
}

uint64_t NUIsAppleInternal()
{
  return MEMORY[0x1E0D51D68]();
}

uint64_t NUIsRoughlyEqual()
{
  return MEMORY[0x1E0D51D70]();
}

uint64_t NUIsRoughlyLessThan()
{
  return MEMORY[0x1E0D51D78]();
}

uint64_t NUMakeDictionary1()
{
  return MEMORY[0x1E0D51D80]();
}

uint64_t NUMakeDictionary2()
{
  return MEMORY[0x1E0D51D88]();
}

uint64_t NUMakeDictionary3()
{
  return MEMORY[0x1E0D51D90]();
}

uint64_t NUMakeDictionary4()
{
  return MEMORY[0x1E0D51D98]();
}

uint64_t NUMakeDictionary5()
{
  return MEMORY[0x1E0D51DA0]();
}

uint64_t NUMakeDictionary6()
{
  return MEMORY[0x1E0D51DA8]();
}

uint64_t NUMakeDictionary7()
{
  return MEMORY[0x1E0D51DB0]();
}

uint64_t NUMaxX()
{
  return MEMORY[0x1E0D51DB8]();
}

uint64_t NUMaxY()
{
  return MEMORY[0x1E0D51DC0]();
}

uint64_t NUMinX()
{
  return MEMORY[0x1E0D51DC8]();
}

uint64_t NUMinY()
{
  return MEMORY[0x1E0D51DD0]();
}

uint64_t NUOrientationConcat()
{
  return MEMORY[0x1E0D51DD8]();
}

uint64_t NUOrientationHasFlip()
{
  return MEMORY[0x1E0D51DE0]();
}

uint64_t NUOrientationInverse()
{
  return MEMORY[0x1E0D51DE8]();
}

uint64_t NUOrientationIsValid()
{
  return MEMORY[0x1E0D51DF0]();
}

uint64_t NUOrientationMakeTransformWithSize()
{
  return MEMORY[0x1E0D51DF8]();
}

uint64_t NUOrientationName()
{
  return MEMORY[0x1E0D51E00]();
}

uint64_t NUOrientationTransformImageRect()
{
  return MEMORY[0x1E0D51E08]();
}

uint64_t NUOrientationTransformImageSize()
{
  return MEMORY[0x1E0D51E10]();
}

uint64_t NUOrientationTransformPoint()
{
  return MEMORY[0x1E0D51E18]();
}

uint64_t NUOrientationTransformRect()
{
  return MEMORY[0x1E0D51E20]();
}

uint64_t NUPixelPointFromCGPoint()
{
  return MEMORY[0x1E0D51E28]();
}

uint64_t NUPixelRectConstrainToRect()
{
  return MEMORY[0x1E0D51E38]();
}

uint64_t NUPixelRectDenormalize()
{
  return MEMORY[0x1E0D51E40]();
}

uint64_t NUPixelRectDilate()
{
  return MEMORY[0x1E0D51E48]();
}

uint64_t NUPixelRectEqualToRect()
{
  return MEMORY[0x1E0D51E50]();
}

uint64_t NUPixelRectFlipYOrigin()
{
  return MEMORY[0x1E0D51E58]();
}

uint64_t NUPixelRectFromArray()
{
  return MEMORY[0x1E0D51E60]();
}

uint64_t NUPixelRectFromCGRect()
{
  return MEMORY[0x1E0D51E68]();
}

uint64_t NUPixelRectInset()
{
  return MEMORY[0x1E0D51E70]();
}

uint64_t NUPixelRectIntersection()
{
  return MEMORY[0x1E0D51E78]();
}

uint64_t NUPixelRectIsEmpty()
{
  return MEMORY[0x1E0D51E80]();
}

uint64_t NUPixelRectIsNull()
{
  return MEMORY[0x1E0D51E88]();
}

uint64_t NUPixelRectMaxCenteredInRect()
{
  return MEMORY[0x1E0D51E90]();
}

uint64_t NUPixelRectNormalize()
{
  return MEMORY[0x1E0D51E98]();
}

uint64_t NUPixelRectOffset()
{
  return MEMORY[0x1E0D51EA8]();
}

uint64_t NUPixelRectScale()
{
  return MEMORY[0x1E0D51EB0]();
}

uint64_t NUPixelRectScaleRational()
{
  return MEMORY[0x1E0D51EB8]();
}

uint64_t NUPixelRectSetOrigin()
{
  return MEMORY[0x1E0D51EC0]();
}

uint64_t NUPixelRectToCGRect()
{
  return MEMORY[0x1E0D51EC8]();
}

uint64_t NUPixelSizeEqualToSize()
{
  return MEMORY[0x1E0D51ED8]();
}

uint64_t NUPixelSizeFromCGSize()
{
  return MEMORY[0x1E0D51EE0]();
}

uint64_t NUPixelSizeIsEmpty()
{
  return MEMORY[0x1E0D51EE8]();
}

uint64_t NUPixelSizeLargestDimension()
{
  return MEMORY[0x1E0D51EF0]();
}

uint64_t NUPixelSizeToCGRect()
{
  return MEMORY[0x1E0D51EF8]();
}

uint64_t NUPixelSizeToCGSize()
{
  return MEMORY[0x1E0D51F00]();
}

uint64_t NURectDenormalize()
{
  return MEMORY[0x1E0D51F10]();
}

uint64_t NURectFlipYOrigin()
{
  return MEMORY[0x1E0D51F18]();
}

uint64_t NURectNormalize()
{
  return MEMORY[0x1E0D51F20]();
}

uint64_t NUScaleCompare()
{
  return MEMORY[0x1E0D51F28]();
}

uint64_t NUScaleDivide()
{
  return MEMORY[0x1E0D51F30]();
}

uint64_t NUScaleEqual()
{
  return MEMORY[0x1E0D51F38]();
}

uint64_t NUScaleFromDouble()
{
  return MEMORY[0x1E0D51F40]();
}

uint64_t NUScaleFromString()
{
  return MEMORY[0x1E0D51F48]();
}

uint64_t NUScaleFromValue()
{
  return MEMORY[0x1E0D51F50]();
}

uint64_t NUScaleInvert()
{
  return MEMORY[0x1E0D51F58]();
}

uint64_t NUScaleIsValid()
{
  return MEMORY[0x1E0D51F60]();
}

uint64_t NUScaleMake()
{
  return MEMORY[0x1E0D51F68]();
}

uint64_t NUScaleRect()
{
  return MEMORY[0x1E0D51F78]();
}

uint64_t NUScaleToDouble()
{
  return MEMORY[0x1E0D51F80]();
}

uint64_t NUScaleToFillSizeInSize()
{
  return MEMORY[0x1E0D51F88]();
}

uint64_t NUScaleToString()
{
  return MEMORY[0x1E0D51F90]();
}

uint64_t NUScaleToValue()
{
  return MEMORY[0x1E0D51F98]();
}

uint64_t NUStringFromTime()
{
  return MEMORY[0x1E0D51FB0]();
}

uint64_t NUStringFromTimeRange()
{
  return MEMORY[0x1E0D51FB8]();
}

uint64_t NUWidth()
{
  return MEMORY[0x1E0D51FD0]();
}

uint64_t PFExists()
{
  return MEMORY[0x1E0D710A0]();
}

uint64_t PFFigCreateCVPixelBufferFromImageData()
{
  return MEMORY[0x1E0D75448]();
}

uint64_t PFFigCreateCVPixelBufferFromURL()
{
  return MEMORY[0x1E0D75450]();
}

uint64_t PFFigEncodeCVPixelBufferToData()
{
  return MEMORY[0x1E0D75458]();
}

uint64_t PFFigEncodeCVPixelBufferToURL()
{
  return MEMORY[0x1E0D75460]();
}

uint64_t PFFilter()
{
  return MEMORY[0x1E0D710A8]();
}

uint64_t PFFind()
{
  return MEMORY[0x1E0D710B0]();
}

uint64_t PFMap()
{
  return MEMORY[0x1E0D710C8]();
}

uint64_t PFParallaxLayerStyleSupportedKinds()
{
  return MEMORY[0x1E0D75670]();
}

uint64_t PFPosterClassificationName()
{
  return MEMORY[0x1E0D75718]();
}

uint64_t PFPosterClassificationNamed()
{
  return MEMORY[0x1E0D75720]();
}

uint64_t PFPosterDeviceSupportsSegmentation()
{
  return MEMORY[0x1E0D75750]();
}

uint64_t PFPosterEnableHeadroom()
{
  return MEMORY[0x1E0D75758]();
}

uint64_t PFPosterEnableSettlingEffect()
{
  return MEMORY[0x1E0D75760]();
}

uint64_t PFPosterEnableSmartTextColor()
{
  return MEMORY[0x1E0D75768]();
}

uint64_t PFPosterSettlingEffectGatingLevelDescription()
{
  return MEMORY[0x1E0D75860]();
}

uint64_t PFReduce()
{
  return MEMORY[0x1E0D71118]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x1E0D71138]();
}

uint64_t PFStoryRecipeDisplayAssetNormalizationDataFromMediaAnalysisDictionaryAndRevision()
{
  return MEMORY[0x1E0D759E0]();
}

uint64_t PTDisparityInNormalizedRectFromPixelBuffer()
{
  return MEMORY[0x1E0D7F5D8]();
}

uint64_t PTGroupIDIsValid()
{
  return MEMORY[0x1E0D7F5E0]();
}

uint64_t PTTrackIDIsValid()
{
  return MEMORY[0x1E0D7F5F0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFCopySystemVersionDictionaryValue()
{
  return MEMORY[0x1E0C9A0D8]();
}

uint64_t _NUAssertContinueHandler()
{
  return MEMORY[0x1E0D52370]();
}

uint64_t _NUAssertFailHandler()
{
  return MEMORY[0x1E0D52378]();
}

uint64_t _NULogInit()
{
  return MEMORY[0x1E0D52388]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E5013918(__p);
}

uint64_t operator delete()
{
  return off_1E5013920();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E5013928(__sz);
}

uint64_t operator new()
{
  return off_1E5013930();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

float __exp10f(float a1)
{
  float result;

  MEMORY[0x1E0C80AD0](a1);
  return result;
}

simd_float3x3 __invert_f3(simd_float3x3 a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  simd_float3x3 result;

  MEMORY[0x1E0C80B30]((__n128)a1.columns[0], (__n128)a1.columns[1], (__n128)a1.columns[2]);
  result.columns[2].i64[1] = v6;
  result.columns[2].i64[0] = v5;
  result.columns[1].i64[1] = v4;
  result.columns[1].i64[0] = v3;
  result.columns[0].i64[1] = v2;
  result.columns[0].i64[0] = v1;
  return result;
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

__float2 __sincosf_stret(float a1)
{
  float v1;
  float v2;
  __float2 result;

  MEMORY[0x1E0C80BD0](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

float acosf(float a1)
{
  float result;

  MEMORY[0x1E0C81508](a1);
  return result;
}

uint64_t alLoopRecipeDestroy()
{
  return MEMORY[0x1E0D00500]();
}

uint64_t alLoopRecipeToDict()
{
  return MEMORY[0x1E0D00508]();
}

float atan2f(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C81628](a1, a2);
  return result;
}

uint64_t autoloopErrorCodeToString()
{
  return MEMORY[0x1E0D00510]();
}

uint64_t autoloopSettingsDestroy()
{
  return MEMORY[0x1E0D00518]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x1E0C82B40](__x);
  return result;
}

float cosf(float a1)
{
  float result;

  MEMORY[0x1E0C82B48](a1);
  return result;
}

uint64_t createAutoLoopSettingsForAsset()
{
  return MEMORY[0x1E0D00538]();
}

uint64_t dgels_NEWLAPACK()
{
  return MEMORY[0x1E0C8BCC0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D10](group, queue, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83288](__x);
  return result;
}

float exp2f(float a1)
{
  float result;

  MEMORY[0x1E0C83290](a1);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C838E8](__x, __y);
  return result;
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

uint64_t liveAnalysisResultCopyRecipe()
{
  return MEMORY[0x1E0D00550]();
}

uint64_t liveAnalysisResultDestroy()
{
  return MEMORY[0x1E0D00558]();
}

uint64_t liveAnalysisResultFromDictionary()
{
  return MEMORY[0x1E0D00560]();
}

uint64_t liveAnalysisResultToDictionary()
{
  return MEMORY[0x1E0D00568]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

float log10f(float a1)
{
  float result;

  MEMORY[0x1E0C83BC8](a1);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint64_t nu_rgb_to_tempTint()
{
  return MEMORY[0x1E0D523C8]();
}

uint64_t nu_xy_to_tempTint()
{
  return MEMORY[0x1E0D523D0]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

float powf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C84BC0](a1, a2);
  return result;
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

uint64_t runLiveAnalysisPipeline()
{
  return MEMORY[0x1E0D00570]();
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C85498](a1, a2);
}

vImage_Error vImageConvert_16UToF(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CD38](src, dest, *(_QWORD *)&flags, offset, scale);
}

vImage_Error vImageConvert_16Uto16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CD48](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_FTo16U(const vImage_Buffer *src, const vImage_Buffer *dest, float offset, float scale, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF18](src, dest, *(_QWORD *)&flags, offset, scale);
}

vImage_Error vImageConvert_Planar16FtoPlanarF(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CF28](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoARGBFFFF(const vImage_Buffer *srcA, const vImage_Buffer *srcR, const vImage_Buffer *srcG, const vImage_Buffer *srcB, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFB0](srcA, srcR, srcG, srcB, dest, *(_QWORD *)&flags);
}

vImage_Error vImageConvert_PlanarFtoPlanar16F(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CFC0](src, dest, *(_QWORD *)&flags);
}

uint64_t validateLiveAnalysisDictionaryVersion()
{
  return MEMORY[0x1E0D00578]();
}

