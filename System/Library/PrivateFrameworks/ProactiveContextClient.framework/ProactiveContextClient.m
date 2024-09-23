id activeBundleForBundleIds(void *a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  id v19;
  __int128 v21;
  id obj;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v5 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v4;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v26;
    *(_QWORD *)&v7 = 134218242;
    v21 = v7;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v26 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v5, "containsObject:", v11, v21))
        {
          v19 = v11;
          goto LABEL_19;
        }
        v12 = objc_alloc(MEMORY[0x1E0CA5870]);
        v24 = 0;
        v13 = (void *)objc_msgSend(v12, "initWithBundleIdentifier:allowPlaceholder:error:", v11, 1, &v24);
        v14 = v24;
        if (v14)
        {
          __atxlog_handle_modes();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v30 = (uint64_t)v11;
            v31 = 2112;
            v32 = v14;
            _os_log_error_impl(&dword_1D2C00000, v15, OS_LOG_TYPE_ERROR, "ATXModeAppLaunchFeaturizer: Could not get application (BundleId: %@) record for inferring app genre: %@", buf, 0x16u);
          }

        }
        else
        {
          objc_msgSend(v13, "iTunesMetadata");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "genreIdentifier");

          __atxlog_handle_modes();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v21;
            v30 = v17;
            v31 = 2112;
            v32 = v11;
            _os_log_debug_impl(&dword_1D2C00000, v18, OS_LOG_TYPE_DEBUG, "ATXModeAppLaunchFeaturizer: Genre: %llu BundleId: %@", buf, 0x16u);
          }

          if (v17 == a2)
          {
            v19 = v11;

            goto LABEL_19;
          }
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      if (v8)
        continue;
      break;
    }
  }
  v19 = 0;
LABEL_19:

  return v19;
}

id __atxlog_handle_modes()
{
  if (__atxlog_handle_modes_onceToken != -1)
    dispatch_once(&__atxlog_handle_modes_onceToken, &__block_literal_global_16);
  return (id)__atxlog_handle_modes_log;
}

void sub_1D2C02BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1D2C03938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
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

uint64_t arraysAreEqual(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 == v4)
  {
    v6 = 1;
  }
  else
  {
    v6 = 0;
    if (v3 && v4)
      v6 = objc_msgSend(v3, "isEqualToArray:", v4);
  }

  return v6;
}

void sub_1D2C03E8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location,char a21)
{
  id *v21;

  objc_destroyWeak(v21);
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1D2C04B90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

id OUTLINED_FUNCTION_3(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 32));
}

id OUTLINED_FUNCTION_4(void *a1)
{
  return a1;
}

uint64_t ATXDeserializeTriggers(void *a1, const char *a2)
{
  return objc_msgSend(a1, "_pas_mappedArrayWithTransform:", &__block_literal_global_1);
}

id ATXTriggerAllTypes()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;

  v25 = (void *)MEMORY[0x1D82448B0]();
  v24 = objc_alloc(MEMORY[0x1E0C99E60]);
  v23 = objc_opt_class();
  v22 = objc_opt_class();
  v21 = objc_opt_class();
  v20 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v17 = objc_opt_class();
  v16 = objc_opt_class();
  v15 = objc_opt_class();
  v14 = objc_opt_class();
  v13 = objc_opt_class();
  v12 = objc_opt_class();
  v0 = objc_opt_class();
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = (void *)objc_msgSend(v24, "initWithObjects:", v23, v22, v21, v20, v19, v18, v17, v16, v15, v14, v13, v12, v0, v1, v2, v3, v4,
                  v5,
                  v6,
                  v7,
                  v8,
                  v9,
                  objc_opt_class(),
                  0);
  objc_autoreleasePoolPop(v25);
  return v10;
}

id ATXSerializeTriggers(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_pas_mappedArrayWithTransform:", &__block_literal_global_17);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  return v2;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1D2C0624C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1D2C06698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id ATXModeAnchorModelSuggestionServerXPCInterface()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCA0798);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1D82448B0]();
  v2 = objc_alloc(MEMORY[0x1E0C99E60]);
  v3 = objc_opt_class();
  v4 = (void *)objc_msgSend(v2, "initWithObjects:", v3, objc_opt_class(), 0);
  objc_autoreleasePoolPop(v1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_anchorModelDidProvideModeSuggestions_, 0, 0);

  return v0;
}

uint64_t ATXModeAnchorModelSuggestionClientXPCInterface()
{
  return objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFCA09E0);
}

void sub_1D2C06F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1D2C07350(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C07840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t ATXActivityTypeToModeSemanticType(unint64_t a1)
{
  if (a1 > 0x11)
    return 0;
  else
    return qword_1E942DC30[a1];
}

const __CFString *ATXActivityTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10)
    return CFSTR("Custom");
  else
    return off_1E942DCC0[a1 - 1];
}

uint64_t DNDModeSemanticTypeToATXActivityType(uint64_t a1)
{
  NSObject *v3;

  if ((unint64_t)(a1 + 1) < 0xB)
    return qword_1D2C2AEB0[a1 + 1];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    DNDModeSemanticTypeToATXActivityType_cold_1(a1, v3);

  return 0;
}

void sub_1D2C07C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1D2C084AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id createLOIFromRTLOI(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  createLOIFromRTLOIAndType(v1, objc_msgSend(v1, "type"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_1D2C090CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

ATXLocationOfInterest *createLOIFromRTLOIAndType(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  ATXLocationOfInterest *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  ATXLocationOfInterest *v24;
  void *v25;
  void *v26;
  double v27;
  CLLocationDegrees v28;
  void *v29;
  CLLocationDegrees v30;
  CLLocationCoordinate2D v31;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "visits");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = a2;
    if (v5)
      v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    else
      v6 = 0;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v35 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
          objc_msgSend(v13, "entryDate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "timeIntervalSinceReferenceDate");
          v16 = (unint64_t)v15;

          objc_msgSend(v13, "exitDate");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "timeIntervalSinceReferenceDate");
          v19 = (unint64_t)v18;

          objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v16, v19 - v16);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v20);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v10);
    }

    objc_msgSend(v4, "mapItem");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "address");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "locality");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [ATXLocationOfInterest alloc];
    objc_msgSend(v4, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "location");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "latitude");
    v28 = v27;
    objc_msgSend(v4, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "longitude");
    v31 = CLLocationCoordinate2DMake(v28, v30);
    v7 = -[ATXLocationOfInterest initWithUUID:visits:coordinate:type:city:](v24, "initWithUUID:visits:coordinate:type:city:", v25, v6, v33, v23, v31.latitude, v31.longitude);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_1D2C097A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C09C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C0A1DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

uint64_t OUTLINED_FUNCTION_6()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_9(void *a1, const char *a2)
{
  return objc_msgSend(a1, "UTF8String");
}

id OUTLINED_FUNCTION_10(void *a1)
{
  return a1;
}

void sub_1D2C0BEE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id __HKWorkoutSessionStateName(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = get_HKWorkoutSessionStateNameSymbolLoc_ptr;
  v8 = get_HKWorkoutSessionStateNameSymbolLoc_ptr;
  if (!get_HKWorkoutSessionStateNameSymbolLoc_ptr)
  {
    v3 = (void *)HealthKitLibrary();
    v2 = dlsym(v3, "_HKWorkoutSessionStateName");
    v6[3] = (uint64_t)v2;
    get_HKWorkoutSessionStateNameSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    __HKWorkoutSessionStateName_cold_1();
  ((void (*)(uint64_t))v2)(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D2C0C1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C0C3BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t HealthKitLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E942DF28;
    v3 = 0;
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!HealthKitLibraryCore_frameworkLibrary)
    HealthKitLibrary_cold_1(&v1);
  return HealthKitLibraryCore_frameworkLibrary;
}

Class __getHKWorkoutClass_block_invoke(uint64_t a1)
{
  Class result;

  HealthKitLibrary();
  result = objc_getClass("HKWorkout");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getHKWorkoutClass_block_invoke_cold_1();
  getHKWorkoutClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1D2C0C8E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C0CB30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  void *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_sync_exit(v16);
  _Unwind_Resume(a1);
}

void sub_1D2C0CC18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C0CD98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C0CE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1D2C0D124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1D2C0D1D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1D2C0D768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C0D888(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1D2C0E2FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C0F318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C0F5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C0F840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1D2C0FC9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1073C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getDNDModeConfigurationServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  DoNotDisturbLibrary();
  result = objc_getClass("DNDModeConfigurationService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDNDModeConfigurationServiceClass_block_invoke_cold_1();
  getDNDModeConfigurationServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void DoNotDisturbLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!DoNotDisturbLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E942E118;
    v2 = 0;
    DoNotDisturbLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!DoNotDisturbLibraryCore_frameworkLibrary)
    DoNotDisturbLibrary_cold_1(&v0);
}

Class __getDNDModeConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  DoNotDisturbLibrary();
  result = objc_getClass("DNDModeConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDNDModeConfigurationClass_block_invoke_cold_1();
  getDNDModeConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getDNDModeConfigurationSmartTriggerClass_block_invoke(uint64_t a1)
{
  Class result;

  DoNotDisturbLibrary();
  result = objc_getClass("DNDModeConfigurationSmartTrigger");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getDNDModeConfigurationSmartTriggerClass_block_invoke_cold_1();
  getDNDModeConfigurationSmartTriggerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1D2C10E4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C11064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C116D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C11C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1D2C12680(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  void *v16;

  objc_sync_exit(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C12990(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C12B44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C13490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

id __atxlog_handle_default()
{
  if (__atxlog_handle_default_onceToken != -1)
    dispatch_once(&__atxlog_handle_default_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_default_log;
}

void ____atxlog_handle_default_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "general");
  v1 = (void *)__atxlog_handle_default_log;
  __atxlog_handle_default_log = (uint64_t)v0;

}

id __atxlog_handle_xpc()
{
  if (__atxlog_handle_xpc_onceToken != -1)
    dispatch_once(&__atxlog_handle_xpc_onceToken, &__block_literal_global_3);
  return (id)__atxlog_handle_xpc_log;
}

void ____atxlog_handle_xpc_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "xpc");
  v1 = (void *)__atxlog_handle_xpc_log;
  __atxlog_handle_xpc_log = (uint64_t)v0;

}

id __atxlog_handle_heuristic()
{
  if (__atxlog_handle_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_heuristic_onceToken, &__block_literal_global_5);
  return (id)__atxlog_handle_heuristic_log;
}

void ____atxlog_handle_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "heuristic");
  v1 = (void *)__atxlog_handle_heuristic_log;
  __atxlog_handle_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_notifications()
{
  if (__atxlog_handle_notifications_onceToken != -1)
    dispatch_once(&__atxlog_handle_notifications_onceToken, &__block_literal_global_7);
  return (id)__atxlog_handle_notifications_log;
}

void ____atxlog_handle_notifications_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notifications");
  v1 = (void *)__atxlog_handle_notifications_log;
  __atxlog_handle_notifications_log = (uint64_t)v0;

}

id __atxlog_handle_pmm()
{
  if (__atxlog_handle_pmm_onceToken != -1)
    dispatch_once(&__atxlog_handle_pmm_onceToken, &__block_literal_global_9);
  return (id)__atxlog_handle_pmm_log;
}

void ____atxlog_handle_pmm_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.mm", "GENERAL");
  v1 = (void *)__atxlog_handle_pmm_log;
  __atxlog_handle_pmm_log = (uint64_t)v0;

}

id __atxlog_handle_dailyroutines()
{
  if (__atxlog_handle_dailyroutines_onceToken != -1)
    dispatch_once(&__atxlog_handle_dailyroutines_onceToken, &__block_literal_global_12);
  return (id)__atxlog_handle_dailyroutines_log;
}

void ____atxlog_handle_dailyroutines_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "dailyroutines");
  v1 = (void *)__atxlog_handle_dailyroutines_log;
  __atxlog_handle_dailyroutines_log = (uint64_t)v0;

}

id __atxlog_handle_feedback()
{
  if (__atxlog_handle_feedback_onceToken != -1)
    dispatch_once(&__atxlog_handle_feedback_onceToken, &__block_literal_global_14);
  return (id)__atxlog_handle_feedback_log;
}

void ____atxlog_handle_feedback_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "feedback");
  v1 = (void *)__atxlog_handle_feedback_log;
  __atxlog_handle_feedback_log = (uint64_t)v0;

}

void ____atxlog_handle_modes_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "modes");
  v1 = (void *)__atxlog_handle_modes_log;
  __atxlog_handle_modes_log = (uint64_t)v0;

}

id __atxlog_handle_hero()
{
  if (__atxlog_handle_hero_onceToken != -1)
    dispatch_once(&__atxlog_handle_hero_onceToken, &__block_literal_global_18_0);
  return (id)__atxlog_handle_hero_log;
}

void ____atxlog_handle_hero_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "hero");
  v1 = (void *)__atxlog_handle_hero_log;
  __atxlog_handle_hero_log = (uint64_t)v0;

}

id __atxlog_handle_deletions()
{
  if (__atxlog_handle_deletions_onceToken != -1)
    dispatch_once(&__atxlog_handle_deletions_onceToken, &__block_literal_global_20_0);
  return (id)__atxlog_handle_deletions_log;
}

void ____atxlog_handle_deletions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "deletions");
  v1 = (void *)__atxlog_handle_deletions_log;
  __atxlog_handle_deletions_log = (uint64_t)v0;

}

id __atxlog_handle_gi()
{
  if (__atxlog_handle_gi_onceToken != -1)
    dispatch_once(&__atxlog_handle_gi_onceToken, &__block_literal_global_22_0);
  return (id)__atxlog_handle_gi_log;
}

void ____atxlog_handle_gi_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "information");
  v1 = (void *)__atxlog_handle_gi_log;
  __atxlog_handle_gi_log = (uint64_t)v0;

}

id __atxlog_handle_timeline()
{
  if (__atxlog_handle_timeline_onceToken != -1)
    dispatch_once(&__atxlog_handle_timeline_onceToken, &__block_literal_global_24);
  return (id)__atxlog_handle_timeline_log;
}

void ____atxlog_handle_timeline_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "timeline");
  v1 = (void *)__atxlog_handle_timeline_log;
  __atxlog_handle_timeline_log = (uint64_t)v0;

}

id __atxlog_handle_relevant_shortcut()
{
  if (__atxlog_handle_relevant_shortcut_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevant_shortcut_onceToken, &__block_literal_global_26);
  return (id)__atxlog_handle_relevant_shortcut_log;
}

void ____atxlog_handle_relevant_shortcut_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevant_shortcut");
  v1 = (void *)__atxlog_handle_relevant_shortcut_log;
  __atxlog_handle_relevant_shortcut_log = (uint64_t)v0;

}

id __atxlog_handle_relevance_model()
{
  if (__atxlog_handle_relevance_model_onceToken != -1)
    dispatch_once(&__atxlog_handle_relevance_model_onceToken, &__block_literal_global_28);
  return (id)__atxlog_handle_relevance_model_log;
}

void ____atxlog_handle_relevance_model_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "relevance_model");
  v1 = (void *)__atxlog_handle_relevance_model_log;
  __atxlog_handle_relevance_model_log = (uint64_t)v0;

}

id __atxlog_handle_watch()
{
  if (__atxlog_handle_watch_onceToken != -1)
    dispatch_once(&__atxlog_handle_watch_onceToken, &__block_literal_global_30);
  return (id)__atxlog_handle_watch_log;
}

void ____atxlog_handle_watch_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "watch");
  v1 = (void *)__atxlog_handle_watch_log;
  __atxlog_handle_watch_log = (uint64_t)v0;

}

id __atxlog_handle_ui()
{
  if (__atxlog_handle_ui_onceToken != -1)
    dispatch_once(&__atxlog_handle_ui_onceToken, &__block_literal_global_32);
  return (id)__atxlog_handle_ui_log;
}

void ____atxlog_handle_ui_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "UI");
  v1 = (void *)__atxlog_handle_ui_log;
  __atxlog_handle_ui_log = (uint64_t)v0;

}

id __atxlog_handle_blending()
{
  if (__atxlog_handle_blending_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_onceToken, &__block_literal_global_34);
  return (id)__atxlog_handle_blending_log;
}

void ____atxlog_handle_blending_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending");
  v1 = (void *)__atxlog_handle_blending_log;
  __atxlog_handle_blending_log = (uint64_t)v0;

}

id __atxlog_handle_blending_internal_cache()
{
  if (__atxlog_handle_blending_internal_cache_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_internal_cache_onceToken, &__block_literal_global_36);
  return (id)__atxlog_handle_blending_internal_cache_log;
}

void ____atxlog_handle_blending_internal_cache_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_internal_cache");
  v1 = (void *)__atxlog_handle_blending_internal_cache_log;
  __atxlog_handle_blending_internal_cache_log = (uint64_t)v0;

}

id __atxlog_handle_blending_ecosystem()
{
  if (__atxlog_handle_blending_ecosystem_onceToken != -1)
    dispatch_once(&__atxlog_handle_blending_ecosystem_onceToken, &__block_literal_global_38);
  return (id)__atxlog_handle_blending_ecosystem_log;
}

void ____atxlog_handle_blending_ecosystem_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "blending_ecosystem");
  v1 = (void *)__atxlog_handle_blending_ecosystem_log;
  __atxlog_handle_blending_ecosystem_log = (uint64_t)v0;

}

id __atxlog_handle_home_screen()
{
  if (__atxlog_handle_home_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_home_screen_onceToken, &__block_literal_global_40);
  return (id)__atxlog_handle_home_screen_log;
}

void ____atxlog_handle_home_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "homescreen");
  v1 = (void *)__atxlog_handle_home_screen_log;
  __atxlog_handle_home_screen_log = (uint64_t)v0;

}

id __atxlog_handle_sleep_schedule()
{
  if (__atxlog_handle_sleep_schedule_onceToken != -1)
    dispatch_once(&__atxlog_handle_sleep_schedule_onceToken, &__block_literal_global_42);
  return (id)__atxlog_handle_sleep_schedule_log;
}

void ____atxlog_handle_sleep_schedule_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "sleepschedule");
  v1 = (void *)__atxlog_handle_sleep_schedule_log;
  __atxlog_handle_sleep_schedule_log = (uint64_t)v0;

}

id __atxlog_handle_lock_screen()
{
  if (__atxlog_handle_lock_screen_onceToken != -1)
    dispatch_once(&__atxlog_handle_lock_screen_onceToken, &__block_literal_global_44);
  return (id)__atxlog_handle_lock_screen_log;
}

void ____atxlog_handle_lock_screen_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "lockscreen");
  v1 = (void *)__atxlog_handle_lock_screen_log;
  __atxlog_handle_lock_screen_log = (uint64_t)v0;

}

id __atxlog_handle_anchor()
{
  if (__atxlog_handle_anchor_onceToken != -1)
    dispatch_once(&__atxlog_handle_anchor_onceToken, &__block_literal_global_46);
  return (id)__atxlog_handle_anchor_log;
}

void ____atxlog_handle_anchor_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "anchor");
  v1 = (void *)__atxlog_handle_anchor_log;
  __atxlog_handle_anchor_log = (uint64_t)v0;

}

id __atxlog_handle_app_prediction()
{
  if (__atxlog_handle_app_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_prediction_onceToken, &__block_literal_global_48);
  return (id)__atxlog_handle_app_prediction_log;
}

void ____atxlog_handle_app_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_prediction");
  v1 = (void *)__atxlog_handle_app_prediction_log;
  __atxlog_handle_app_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_action_prediction()
{
  if (__atxlog_handle_action_prediction_onceToken != -1)
    dispatch_once(&__atxlog_handle_action_prediction_onceToken, &__block_literal_global_50);
  return (id)__atxlog_handle_action_prediction_log;
}

void ____atxlog_handle_action_prediction_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "action_prediction");
  v1 = (void *)__atxlog_handle_action_prediction_log;
  __atxlog_handle_action_prediction_log = (uint64_t)v0;

}

id __atxlog_handle_app_library()
{
  if (__atxlog_handle_app_library_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_library_onceToken, &__block_literal_global_52);
  return (id)__atxlog_handle_app_library_log;
}

void ____atxlog_handle_app_library_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_library");
  v1 = (void *)__atxlog_handle_app_library_log;
  __atxlog_handle_app_library_log = (uint64_t)v0;

}

id __atxlog_handle_app_install()
{
  if (__atxlog_handle_app_install_onceToken != -1)
    dispatch_once(&__atxlog_handle_app_install_onceToken, &__block_literal_global_54);
  return (id)__atxlog_handle_app_install_log;
}

void ____atxlog_handle_app_install_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "app_install");
  v1 = (void *)__atxlog_handle_app_install_log;
  __atxlog_handle_app_install_log = (uint64_t)v0;

}

id __atxlog_handle_backup()
{
  if (__atxlog_handle_backup_onceToken != -1)
    dispatch_once(&__atxlog_handle_backup_onceToken, &__block_literal_global_56);
  return (id)__atxlog_handle_backup_log;
}

void ____atxlog_handle_backup_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "backup");
  v1 = (void *)__atxlog_handle_backup_log;
  __atxlog_handle_backup_log = (uint64_t)v0;

}

id __atxlog_handle_metrics()
{
  if (__atxlog_handle_metrics_onceToken != -1)
    dispatch_once(&__atxlog_handle_metrics_onceToken, &__block_literal_global_58);
  return (id)__atxlog_handle_metrics_log;
}

void ____atxlog_handle_metrics_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "metrics");
  v1 = (void *)__atxlog_handle_metrics_log;
  __atxlog_handle_metrics_log = (uint64_t)v0;

}

id __atxlog_handle_trial_assets()
{
  if (__atxlog_handle_trial_assets_onceToken != -1)
    dispatch_once(&__atxlog_handle_trial_assets_onceToken, &__block_literal_global_60);
  return (id)__atxlog_handle_trial_assets_log;
}

void ____atxlog_handle_trial_assets_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "trial_assets");
  v1 = (void *)__atxlog_handle_trial_assets_log;
  __atxlog_handle_trial_assets_log = (uint64_t)v0;

}

id __atxlog_handle_notification_management()
{
  if (__atxlog_handle_notification_management_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_management_onceToken, &__block_literal_global_62);
  return (id)__atxlog_handle_notification_management_log;
}

void ____atxlog_handle_notification_management_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_management");
  v1 = (void *)__atxlog_handle_notification_management_log;
  __atxlog_handle_notification_management_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_actions()
{
  if (__atxlog_handle_contextual_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_actions_onceToken, &__block_literal_global_64);
  return (id)__atxlog_handle_contextual_actions_log;
}

void ____atxlog_handle_contextual_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextual_actions");
  v1 = (void *)__atxlog_handle_contextual_actions_log;
  __atxlog_handle_contextual_actions_log = (uint64_t)v0;

}

id __atxlog_handle_intents_helper()
{
  if (__atxlog_handle_intents_helper_onceToken != -1)
    dispatch_once(&__atxlog_handle_intents_helper_onceToken, &__block_literal_global_66);
  return (id)__atxlog_handle_intents_helper_log;
}

void ____atxlog_handle_intents_helper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "intents_helper");
  v1 = (void *)__atxlog_handle_intents_helper_log;
  __atxlog_handle_intents_helper_log = (uint64_t)v0;

}

id __atxlog_handle_context_heuristic()
{
  if (__atxlog_handle_context_heuristic_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_heuristic_onceToken, &__block_literal_global_68);
  return (id)__atxlog_handle_context_heuristic_log;
}

void ____atxlog_handle_context_heuristic_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "context_heuristic");
  v1 = (void *)__atxlog_handle_context_heuristic_log;
  __atxlog_handle_context_heuristic_log = (uint64_t)v0;

}

id __atxlog_handle_zkw_hide()
{
  if (__atxlog_handle_zkw_hide_onceToken != -1)
    dispatch_once(&__atxlog_handle_zkw_hide_onceToken, &__block_literal_global_70);
  return (id)__atxlog_handle_zkw_hide_log;
}

void ____atxlog_handle_zkw_hide_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "zkw_hide");
  v1 = (void *)__atxlog_handle_zkw_hide_log;
  __atxlog_handle_zkw_hide_log = (uint64_t)v0;

}

id __atxlog_handle_context_user_education_suggestions()
{
  if (__atxlog_handle_context_user_education_suggestions_onceToken != -1)
    dispatch_once(&__atxlog_handle_context_user_education_suggestions_onceToken, &__block_literal_global_72);
  return (id)__atxlog_handle_context_user_education_suggestions_log;
}

void ____atxlog_handle_context_user_education_suggestions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "user_education_suggestions");
  v1 = (void *)__atxlog_handle_context_user_education_suggestions_log;
  __atxlog_handle_context_user_education_suggestions_log = (uint64_t)v0;

}

id __atxlog_handle_time_intelligence()
{
  if (__atxlog_handle_time_intelligence_onceToken != -1)
    dispatch_once(&__atxlog_handle_time_intelligence_onceToken, &__block_literal_global_74);
  return (id)__atxlog_handle_time_intelligence_log;
}

void ____atxlog_handle_time_intelligence_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "time");
  v1 = (void *)__atxlog_handle_time_intelligence_log;
  __atxlog_handle_time_intelligence_log = (uint64_t)v0;

}

id __atxlog_handle_contextual_engine()
{
  if (__atxlog_handle_contextual_engine_onceToken != -1)
    dispatch_once(&__atxlog_handle_contextual_engine_onceToken, &__block_literal_global_76);
  return (id)__atxlog_handle_contextual_engine_log;
}

void ____atxlog_handle_contextual_engine_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "contextualengine");
  v1 = (void *)__atxlog_handle_contextual_engine_log;
  __atxlog_handle_contextual_engine_log = (uint64_t)v0;

}

id __atxlog_handle_usage_insights()
{
  if (__atxlog_handle_usage_insights_onceToken != -1)
    dispatch_once(&__atxlog_handle_usage_insights_onceToken, &__block_literal_global_78);
  return (id)__atxlog_handle_usage_insights_log;
}

void ____atxlog_handle_usage_insights_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "usage_insights");
  v1 = (void *)__atxlog_handle_usage_insights_log;
  __atxlog_handle_usage_insights_log = (uint64_t)v0;

}

id __atxlog_handle_notification_categorization()
{
  if (__atxlog_handle_notification_categorization_onceToken != -1)
    dispatch_once(&__atxlog_handle_notification_categorization_onceToken, &__block_literal_global_80);
  return (id)__atxlog_handle_notification_categorization_log;
}

void ____atxlog_handle_notification_categorization_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "notification_categorization");
  v1 = (void *)__atxlog_handle_notification_categorization_log;
  __atxlog_handle_notification_categorization_log = (uint64_t)v0;

}

id __atxlog_handle_settings_actions()
{
  if (__atxlog_handle_settings_actions_onceToken != -1)
    dispatch_once(&__atxlog_handle_settings_actions_onceToken, &__block_literal_global_82);
  return (id)__atxlog_handle_settings_actions_log;
}

void ____atxlog_handle_settings_actions_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.duetexpertd.atx", "settings_actions");
  v1 = (void *)__atxlog_handle_settings_actions_log;
  __atxlog_handle_settings_actions_log = (uint64_t)v0;

}

void sub_1D2C14BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1D2C14FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C15394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void sub_1D2C1587C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C15C14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1D2C1603C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C16670(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C1690C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C16C74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1D2C17E3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C181D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C189C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Unwind_Resume(exception_object);
}

void sub_1D2C18BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C18D24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C18EF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C18FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C19384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1975C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1D2C199A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C19ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C19C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C19D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1A00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1A410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1A720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1A9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1AD08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1B228(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_1D2C1B960(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1D2C1BB90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1BD84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1BF70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1C1B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C1C578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1D2C1E1F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C1EEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1D2C1F0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C1F918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D2C20520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose((const void *)(v29 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1D2C20D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C20E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C2143C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void sub_1D2C21648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C21838(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C21CC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C21FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t BMInferredModeTypeToActivity(unint64_t a1)
{
  NSObject *v2;

  if (a1 < 0x11)
    return qword_1D2C2B020[a1];
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMInferredModeTypeToActivity_cold_1();

  return 0;
}

uint64_t BMUserFocusInferredModeTypeToActivity(int a1)
{
  NSObject *v3;

  if (a1 < 0x13)
    return qword_1D2C2B0A8[a1];
  __atxlog_handle_modes();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeTypeToActivity_cold_1(a1, v3);

  return 0;
}

uint64_t ATXActivityTypeToBMUserFocusInferredModeType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x10)
    return 1;
  else
    return dword_1D2C2B140[a1 - 1];
}

uint64_t BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType(int a1)
{
  NSObject *v2;

  if ((a1 - 1) < 0xB)
    return dword_1D2C2B184[a1 - 1];
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType_cold_1();

  return 2;
}

uint64_t BMUserFocusInferredModeTypeToLegacy(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 0x12)
    return qword_1D2C2B1B0[a1];
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeTypeToLegacy_cold_1();

  return 1;
}

unint64_t BMUserFocusInferredModeOriginFromLegacy(uint64_t a1)
{
  unint64_t result;
  NSObject *v2;

  result = a1 + 1;
  if (result >= 0x12)
  {
    __atxlog_handle_modes();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
      BMUserFocusInferredModeOriginFromLegacy_cold_1();

    return 0;
  }
  return result;
}

uint64_t BMUserFocusInferredModeOriginToLegacy(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 0x12)
    return a1 - 1;
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeOriginToLegacy_cold_1();

  return -1;
}

uint64_t BMUserFocusInferredModeOriginIsHeuristic(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 0x12)
    return (0x3E7FEu >> a1) & 1;
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeOriginIsHeuristic_cold_1();

  return 0;
}

const __CFString *BMUserFocusInferredModeOriginToString(unsigned int a1)
{
  NSObject *v2;

  if (a1 < 0x12)
    return off_1E942EE98[a1];
  __atxlog_handle_modes();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_FAULT))
    BMUserFocusInferredModeOriginToString_cold_1();

  return CFSTR("Unknown");
}

void sub_1D2C22A4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1D2C22C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D2C23494(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C23718(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C23824(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D2C244E4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void DNDModeSemanticTypeToATXActivityType_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_FAULT, "DNDModeSemanticTypeToATXActivityType: DNDModeSemanticType %lu not handled in switch statement", (uint8_t *)&v2, 0xCu);
}

void __HKWorkoutSessionStateName_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *__HKWorkoutSessionStateName(_HKWorkoutSessionState)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXModeExerciseFeaturizer.m"), 23, CFSTR("%s"), dlerror());

  __break(1u);
}

void HealthKitLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *HealthKitLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXModeExerciseFeaturizer.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getHKWorkoutClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getHKWorkoutClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXModeExerciseFeaturizer.m"), 22, CFSTR("Unable to find class %s"), "HKWorkout");

  __break(1u);
}

void __getDNDModeConfigurationServiceClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDNDModeConfigurationServiceClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXConfiguredModeService.m"), 22, CFSTR("Unable to find class %s"), "DNDModeConfigurationService");

  __break(1u);
}

void DoNotDisturbLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *DoNotDisturbLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ATXConfiguredModeService.m"), 21, CFSTR("%s"), *a1);

  __break(1u);
}

void __getDNDModeConfigurationClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDNDModeConfigurationClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXConfiguredModeService.m"), 23, CFSTR("Unable to find class %s"), "DNDModeConfiguration");

  __break(1u);
}

void __getDNDModeConfigurationSmartTriggerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getDNDModeConfigurationSmartTriggerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ATXConfiguredModeService.m"), 24, CFSTR("Unable to find class %s"), "DNDModeConfigurationSmartTrigger");

  __break(1u);
}

void BMInferredModeTypeToActivity_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMInferredModeType: %lu not handled in switch statement. Returning ATXActivityTypeCustom", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeTypeToActivity_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1D2C00000, a2, OS_LOG_TYPE_FAULT, "BMUserFocusInferredModeType: %d not handled in switch statement. Returning ATXActivityTypeCustom", (uint8_t *)v2, 8u);
}

void BMUserFocusInferredModeTypeFromBMUserFocusModeComputedSemanticType_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMUserFocusModeComputedSemanticType: %lu not handled in switch statement. Returning BMUserFocusInferredModeTypeDefault", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeTypeToLegacy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMUserFocusInferredModeType: %lu not handled in switch statement. Returning BMInferredModeTypeDefault", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeOriginFromLegacy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMInferredModeOrigin: %lu not handled in switch statement. Returning BMUserFocusInferredModeOriginUnknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeOriginToLegacy_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMUserFocusInferredModeOrigin: %lu not handled in switch statement. Returning BMInferredModeOriginUnknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeOriginIsHeuristic_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMUserFocusInferredModeOriginIsHeuristic: mode origin: %ld not captured in switch statement. Returning NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void BMUserFocusInferredModeOriginToString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_3();
  OUTLINED_FUNCTION_0_6(&dword_1D2C00000, v0, v1, "BMUserFocusInferredModeOrigin: %lu not handled in switch statement. Returning Unknown", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t ATXCacheFileRead()
{
  return MEMORY[0x1E0CF93D0]();
}

uint64_t ATXCacheFileSplitChunks()
{
  return MEMORY[0x1E0CF93D8]();
}

uint64_t ATXCacheFileWriteChunks()
{
  return MEMORY[0x1E0CF93E8]();
}

uint64_t BMUserFocusInferredModeTypeAsString()
{
  return MEMORY[0x1E0D01E08]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

