void sub_1DE3C0208(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DE3C0870(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  uint64_t v14;

  _Block_object_dispose((const void *)(v14 - 152), 8);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 176));
  _Unwind_Resume(a1);
}

id getHUAccessoryManagerClass()
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
  v0 = (void *)getHUAccessoryManagerClass_softClass;
  v7 = getHUAccessoryManagerClass_softClass;
  if (!getHUAccessoryManagerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHUAccessoryManagerClass_block_invoke;
    v3[3] = &unk_1EA9022F8;
    v3[4] = &v4;
    __getHUAccessoryManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE3C0EEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getHUAccessoryManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  HearingUtilitiesLibrary();
  result = objc_getClass("HUAccessoryManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHUAccessoryManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHUAccessoryManagerClass_block_invoke_cold_1();
    return (Class)HearingUtilitiesLibrary();
  }
  return result;
}

uint64_t HearingUtilitiesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
    HearingUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = HearingUtilitiesLibraryCore_frameworkLibrary;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_1DE3C295C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id paBundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)paBundle_PABundle;
  if (!paBundle_PABundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)paBundle_PABundle;
    paBundle_PABundle = v1;

    v0 = (void *)paBundle_PABundle;
  }
  return v0;
}

id paLocString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  paBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, v1, CFSTR("PersonalAudio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *paDescriptionForLevel(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return &stru_1EA902C20;
  paLocString(off_1EA9027D8[a1 - 1]);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *paDescriptionForShape(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return &stru_1EA902C20;
  paLocString(off_1EA9027F0[a1 - 1]);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t paKeyFromNodeParameters(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu_%lu"), a1, a2, a3);
}

id paRoutesOfSubtypeOrProduct(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  char v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  objc_msgSend(getHUUtilitiesClass(), "sharedUtilities");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentPickableAudioRoutes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __paRoutesOfSubtypeOrProduct_block_invoke;
  v21[3] = &unk_1EA902528;
  v25 = a3;
  v10 = v5;
  v22 = v10;
  v11 = v6;
  v23 = v11;
  v12 = v9;
  v24 = v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v21);
  if (!objc_msgSend(v12, "count") && objc_msgSend(MEMORY[0x1E0D2F990], "isInternalInstall"))
  {
    PAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Route not supported %@ - %@ = %@"), v10, v11, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "NSArray<NSDictionary *> *paRoutesOfSubtypeOrProduct(NSSet *__strong, NSSet *__strong, BOOL)", 228, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (void *)*MEMORY[0x1E0D2F9A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
    {
      v16 = objc_retainAutorelease(v14);
      v17 = v15;
      v18 = objc_msgSend(v16, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v27 = v18;
      _os_log_impl(&dword_1DE3BE000, v17, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
  }
  v19 = (void *)objc_msgSend(v12, "copy");

  return v19;
}

id getHUUtilitiesClass()
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
  v0 = (void *)getHUUtilitiesClass_softClass;
  v7 = getHUUtilitiesClass_softClass;
  if (!getHUUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHUUtilitiesClass_block_invoke;
    v3[3] = &unk_1EA9022F8;
    v3[4] = &v4;
    __getHUUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE3C5B14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __paRoutesOfSubtypeOrProduct_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *v7;
  void *v8;
  void *v9;
  int v10;
  id *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  _QWORD v36[4];
  id v37;
  __int128 buf;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (*(_BYTE *)(a1 + 56))
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x2020000000;
    v7 = (_QWORD *)getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr;
    v40 = getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr;
    if (!getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr)
    {
      v8 = (void *)HearingUtilitiesLibrary_0();
      v7 = dlsym(v8, "HURouteKeyRouteCurrentlyPicked");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v7;
      getHURouteKeyRouteCurrentlyPickedSymbolLoc_ptr = (uint64_t)v7;
    }
    _Block_object_dispose(&buf, 8);
    if (!v7)
      goto LABEL_28;
    objc_msgSend(v6, "objectForKey:", *v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if (!v10)
      goto LABEL_27;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v39 = 0x2020000000;
  v11 = (id *)getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr;
  v40 = getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr)
  {
    v12 = (void *)HearingUtilitiesLibrary_0();
    v11 = (id *)dlsym(v12, "HURouteKeyAudioRouteSubType");
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v11;
    getHURouteKeyAudioRouteSubTypeSymbolLoc_ptr = (uint64_t)v11;
  }
  _Block_object_dispose(&buf, 8);
  if (!v11)
  {
LABEL_28:
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    goto LABEL_31;
  }
  v13 = *v11;
  objc_msgSend(v6, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = *(void **)(a1 + 32);
  v16 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __paRoutesOfSubtypeOrProduct_block_invoke_2;
  v36[3] = &unk_1EA902500;
  v17 = v14;
  v37 = v17;
  objc_msgSend(v15, "objectsPassingTest:", v36);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v18, "count"))
    v19 = v6;
  else
    v19 = 0;
  if (!v19)
  {
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v39 = 0x2020000000;
    v21 = (id *)getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr;
    v40 = getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr;
    if (!getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr)
    {
      v22 = (void *)HearingUtilitiesLibrary_0();
      v21 = (id *)dlsym(v22, "HURouteKeyBTDetails_ProductID");
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 24) = v21;
      getHURouteKeyBTDetails_ProductIDSymbolLoc_ptr = (uint64_t)v21;
    }
    _Block_object_dispose(&buf, 8);
    if (v21)
    {
      v23 = *v21;
      objc_msgSend(v6, "valueForKey:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v24, "length"))
      {
        v25 = *(void **)(a1 + 40);
        v34[0] = v16;
        v34[1] = 3221225472;
        v34[2] = __paRoutesOfSubtypeOrProduct_block_invoke_3;
        v34[3] = &unk_1EA902500;
        v35 = v24;
        objc_msgSend(v25, "objectsPassingTest:", v34);
        v26 = objc_claimAutoreleasedReturnValue();

        v18 = (void *)v26;
      }
      if (objc_msgSend(v18, "count"))
        v27 = v6;
      else
        v27 = 0;
      v20 = v27;

      goto LABEL_23;
    }
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
LABEL_31:
    __break(1u);
  }
  v20 = v6;
LABEL_23:
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Checking route %d = %@"), v20 != 0, v6);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "NSArray<NSDictionary *> *paRoutesOfSubtypeOrProduct(NSSet *__strong, NSSet *__strong, BOOL)_block_invoke", 218, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v31 = objc_retainAutorelease(v29);
    v32 = v30;
    v33 = objc_msgSend(v31, "UTF8String");
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = v33;
    _os_log_impl(&dword_1DE3BE000, v32, OS_LOG_TYPE_DEFAULT, "%{public}s", (uint8_t *)&buf, 0xCu);

  }
  if (v20)
  {
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v20);

  }
LABEL_27:

}

void sub_1DE3C5F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsString:", a2);
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if ((objc_msgSend(v3, "containsString:", *(_QWORD *)(a1 + 32)) & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(*(id *)(a1 + 32), "containsString:", v3);

  return v4;
}

id paRouteOfSubtypeOrProduct(void *a1, void *a2, char a3)
{
  void *v3;
  void *v4;

  paRoutesOfSubtypeOrProduct(a1, a2, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id paRouteSubtypesSupportingAudioAccommodations()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
  if (!paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("b60"), CFSTR("b60f"), CFSTR("b60g"), CFSTR("b225"), 0);
    v2 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
    paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes = v1;

    v0 = (void *)paRouteSubtypesSupportingAudioAccommodations_AudioRouteSubtypes;
  }
  return v0;
}

id paProductsIdentifiersSupportingAudioAccommodations()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
  if (!paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("76,8207"), CFSTR("76,8206"), CFSTR("76,8203"), CFSTR("76,8203"), CFSTR("76,8204"), CFSTR("76,8205"), CFSTR("76,8202"), CFSTR("76,8211"), CFSTR("76,8212"), CFSTR("76,8210"), CFSTR("76,8228"), CFSTR("76,8214"), CFSTR("76,8230"), CFSTR("76,8221"), CFSTR("76,8217"), CFSTR("76,8219"), CFSTR("76,8222"),
           CFSTR("76,8223"),
           0);
    v2 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
    paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs = v1;

    v0 = (void *)paProductsIdentifiersSupportingAudioAccommodations_AudioRouteProductIDs;
  }
  return v0;
}

id paCurrentRouteSupportingAudioAccommodations()
{
  void *v0;
  void *v1;
  void *v2;

  paRouteSubtypesSupportingAudioAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  paProductsIdentifiersSupportingAudioAccommodations();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  paRouteOfSubtypeOrProduct(v0, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

BOOL paCurrentRouteSupportsAudioAccommodations()
{
  void *v0;
  _BOOL8 v1;

  paCurrentRouteSupportingAudioAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

void paCurrentRouteSupportingAudioAccommodationsAsync(void *a1)
{
  id v1;
  NSObject *v2;
  _QWORD block[4];
  id v4;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
    v2 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __paCurrentRouteSupportingAudioAccommodationsAsync_block_invoke;
    block[3] = &unk_1EA902550;
    v4 = v1;
    dispatch_async(v2, block);

  }
}

void __paCurrentRouteSupportingAudioAccommodationsAsync_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;

  v1 = *(_QWORD *)(a1 + 32);
  paRouteSubtypesSupportingAudioAccommodations();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  paProductsIdentifiersSupportingAudioAccommodations();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  paRouteOfSubtypeOrProduct(v4, v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v3);

}

void paCurrentRouteSupportsAudioAccommodationsAsync(void *a1)
{
  id v1;
  void *v2;
  _QWORD v3[4];
  id v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __paCurrentRouteSupportsAudioAccommodationsAsync_block_invoke;
    v3[3] = &unk_1EA902578;
    v4 = v1;
    paCurrentRouteSupportingAudioAccommodationsAsync(v3);

  }
}

uint64_t __paCurrentRouteSupportsAudioAccommodationsAsync_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a2 != 0);
}

BOOL paAnyRouteSupportsAudioAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  _BOOL8 v3;

  paRouteSubtypesSupportingAudioAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  paProductsIdentifiersSupportingAudioAccommodations();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  paRouteOfSubtypeOrProduct(v0, v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t paHeadphoneRouteAvailable()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  objc_msgSend(getHUUtilitiesClass(), "sharedUtilities");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentPickableAudioRoutes");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __paHeadphoneRouteAvailable_block_invoke;
  v4[3] = &unk_1EA9025A0;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v4);
  v2 = *((unsigned __int8 *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1DE3C6478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __paHeadphoneRouteAvailable_block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  id *v12;
  void *v13;
  id v14;
  _QWORD *v15;
  void *v16;
  int v17;
  _Unwind_Exception *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;

  v7 = a2;
  v8 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v9 = (_QWORD *)getHURouteKeyRouteNameSymbolLoc_ptr;
  v22 = getHURouteKeyRouteNameSymbolLoc_ptr;
  if (!getHURouteKeyRouteNameSymbolLoc_ptr)
  {
    v10 = (void *)HearingUtilitiesLibrary_0();
    v9 = dlsym(v10, "HURouteKeyRouteName");
    v20[3] = (uint64_t)v9;
    getHURouteKeyRouteNameSymbolLoc_ptr = (uint64_t)v9;
  }
  _Block_object_dispose(&v19, 8);
  if (!v9)
  {
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
LABEL_16:
    __paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    goto LABEL_17;
  }
  objc_msgSend(v8, "valueForKey:", *v9, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v12 = (id *)getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr;
  v22 = getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr)
  {
    v13 = (void *)HearingUtilitiesLibrary_0();
    v12 = (id *)dlsym(v13, "HURouteKeyAudioRouteName_Headset");
    v20[3] = (uint64_t)v12;
    getHURouteKeyAudioRouteName_HeadsetSymbolLoc_ptr = (uint64_t)v12;
  }
  _Block_object_dispose(&v19, 8);
  if (!v12)
    goto LABEL_16;
  v14 = *v12;
  if (objc_msgSend(v11, "hasPrefix:", v14, v19))
  {

LABEL_13:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_14;
  }
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v15 = (_QWORD *)getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr;
  v22 = getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr;
  if (!getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr)
  {
    v16 = (void *)HearingUtilitiesLibrary_0();
    v15 = dlsym(v16, "HURouteKeyAudioRouteName_Headphone");
    v20[3] = (uint64_t)v15;
    getHURouteKeyAudioRouteName_HeadphoneSymbolLoc_ptr = (uint64_t)v15;
  }
  _Block_object_dispose(&v19, 8);
  if (!v15)
  {
LABEL_17:
    v18 = (_Unwind_Exception *)__paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    _Block_object_dispose(&v19, 8);
    _Unwind_Resume(v18);
  }
  v17 = objc_msgSend(v11, "hasPrefix:", *v15, v19);

  if (v17)
    goto LABEL_13;
LABEL_14:

}

id paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  paCurrentRouteSupportingAudioAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getHURouteKeyRouteUID();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pairedDevices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations_block_invoke;
  v10[3] = &unk_1EA9025C8;
  v6 = v3;
  v11 = v6;
  v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

id getHURouteKeyRouteUID()
{
  id *v0;
  void *v1;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getHURouteKeyRouteUIDSymbolLoc_ptr;
  v7 = getHURouteKeyRouteUIDSymbolLoc_ptr;
  if (!getHURouteKeyRouteUIDSymbolLoc_ptr)
  {
    v1 = (void *)HearingUtilitiesLibrary_0();
    v0 = (id *)dlsym(v1, "HURouteKeyRouteUID");
    v5[3] = (uint64_t)v0;
    getHURouteKeyRouteUIDSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)__paRoutesOfSubtypeOrProduct_block_invoke_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  return *v0;
}

uint64_t __paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v3, "vendorId"), objc_msgSend(v3, "productId"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v3, "address");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsString:", v6))
  {
    paProductsIdentifiersSupportingAudioAccommodations();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "containsObject:", v4)
      && objc_msgSend(v3, "featureCapability:", 16))
    {
      v8 = objc_msgSend(v3, "isAppleAudioDevice");
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void setCurrentDeviceToTransparencyMode()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  uint8_t buf[4];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  paCurrentBluetoothDeviceSupportingANCAndHeadphoneAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Setting ANC for %@"), v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "void setCurrentDeviceToTransparencyMode(void)", 396, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_retainAutorelease(v2);
    v5 = v3;
    *(_DWORD *)buf = 136446210;
    v7 = objc_msgSend(v4, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  objc_msgSend(v0, "setListeningMode:", 2);

}

id paProductsIdentifiersSupportingTransparencyAccommodations()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
  if (!paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs)
  {
    v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("76,8206"), CFSTR("76,8212"), CFSTR("76,8228"), 0);
    v2 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
    paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs = v1;

    v0 = (void *)paProductsIdentifiersSupportingTransparencyAccommodations_AudioRouteProductIDs;
  }
  return v0;
}

id paCurrentRouteSupportingTransparencyAccommodations()
{
  void *v0;
  void *v1;

  paProductsIdentifiersSupportingTransparencyAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  paRouteOfSubtypeOrProduct(0, v0, 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id paPairedDevicesSupportingTransparencyAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D03410], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "pairedDevices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "indexesOfObjectsPassingTest:", &__block_literal_global_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectsAtIndexes:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Found transparency devices %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "NSArray<BluetoothDevice *> *paPairedDevicesSupportingTransparencyAccommodations(void)", 437, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  return v3;
}

uint64_t __paPairedDevicesSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d,%d"), objc_msgSend(v2, "vendorId"), objc_msgSend(v2, "productId"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "isTemporaryPaired") & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    paProductsIdentifiersSupportingTransparencyAccommodations();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "containsObject:", v3)
      && objc_msgSend(v2, "featureCapability:", 33))
    {
      v4 = objc_msgSend(v2, "isAppleAudioDevice");
    }
    else
    {
      v4 = 0;
    }

  }
  return v4;
}

BOOL paPairedDeviceSupportsTransparencyAccommodations()
{
  void *v0;
  _BOOL8 v1;

  paPairedDevicesSupportingTransparencyAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "count") != 0;

  return v1;
}

id paCurrentBluetoothDeviceSupportingTransparencyAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  paCurrentRouteSupportingTransparencyAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  getHURouteKeyRouteUID();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForKey:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  paPairedDevicesSupportingTransparencyAccommodations();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __paCurrentBluetoothDeviceSupportingTransparencyAccommodations_block_invoke;
  v9[3] = &unk_1EA9025C8;
  v5 = v3;
  v10 = v5;
  v6 = objc_msgSend(v4, "indexOfObjectPassingTest:", v9);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v4, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t __paCurrentBluetoothDeviceSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", v5))
    v6 = objc_msgSend(v3, "isAppleAudioDevice");
  else
    v6 = 0;

  return v6;
}

void paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0D2F990], "bluetoothManagerQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync_block_invoke;
  block[3] = &unk_1EA902550;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

void __paCurrentBluetoothDeviceSupportingTransparencyAccommodationsAsync_block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 32);
  if (v1)
  {
    paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
    v2 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

  }
}

id paAvailableBluetoothDevicesSupportingTransparencyAccommodations()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  paProductsIdentifiersSupportingTransparencyAccommodations();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  paRoutesOfSubtypeOrProduct(0, v1, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  paPairedDevicesSupportingTransparencyAccommodations();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke;
  v9[3] = &unk_1EA902610;
  v10 = v3;
  v4 = v0;
  v11 = v4;
  v5 = v3;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v9);
  v6 = v11;
  v7 = v4;

  return v7;
}

void __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  getHURouteKeyRouteUID();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR(":"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(void **)(a1 + 32);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke_2;
  v11[3] = &unk_1EA9025C8;
  v10 = v6;
  v12 = v10;
  v8 = objc_msgSend(v7, "indexOfObjectPassingTest:", v11);
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v9) & 1) == 0)
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v9);

  }
}

uint64_t __paAvailableBluetoothDevicesSupportingTransparencyAccommodations_block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "address");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "containsString:", v5))
    v6 = objc_msgSend(v3, "isAppleAudioDevice");
  else
    v6 = 0;

  return v6;
}

BOOL paCurrentRouteSupportsTransparencyAccommodations()
{
  void *v0;
  _BOOL8 v1;

  paCurrentBluetoothDeviceSupportingTransparencyAccommodations();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0 != 0;

  return v1;
}

uint64_t paBluetoothDeviceSupportsSSL(void *a1)
{
  unsigned int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t result;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = objc_msgSend(a1, "getAACPCapabilityInteger:", 6);
  PAInitializeLogging();
  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("Found PSE version %@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "BOOL paBluetoothDeviceSupportsSSL(BluetoothDevice *__strong _Nonnull)", 518, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)*MEMORY[0x1E0D2F9A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D2F9A8], OS_LOG_TYPE_DEFAULT))
  {
    v7 = objc_retainAutorelease(v5);
    v8 = v6;
    *(_DWORD *)buf = 136446210;
    v11 = objc_msgSend(v7, "UTF8String");
    _os_log_impl(&dword_1DE3BE000, v8, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  LODWORD(result) = _os_feature_enabled_impl();
  if (v1 > 2)
    return result;
  else
    return 0;
}

id getHKUnitClass()
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
  v0 = (void *)getHKUnitClass_softClass;
  v7 = getHKUnitClass_softClass;
  if (!getHKUnitClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getHKUnitClass_block_invoke;
    v3[3] = &unk_1EA9022F8;
    v3[4] = &v4;
    __getHKUnitClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DE3C7870(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DE3C7BC0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

Class __getHUUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;

  HearingUtilitiesLibrary_0();
  result = objc_getClass("HUUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getHUUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getHUUtilitiesClass_block_invoke_cold_1();
    return (Class)HearingUtilitiesLibrary_0();
  }
  return result;
}

uint64_t HearingUtilitiesLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!HearingUtilitiesLibraryCore_frameworkLibrary_0)
    HearingUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = HearingUtilitiesLibraryCore_frameworkLibrary_0;
  if (!HearingUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getHKUnitClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HealthKitLibraryCore_frameworkLibrary)
  {
    HealthKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!HealthKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HKUnit");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHKUnitClass_block_invoke_cold_1();
    free(v3);
  }
  getHKUnitClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class initHMDeviceConfigurations()
{
  Class result;

  if (HearingModeServiceLibrary_sOnce != -1)
    dispatch_once(&HearingModeServiceLibrary_sOnce, &__block_literal_global_3);
  result = objc_getClass("HMDeviceConfigurations");
  classHMDeviceConfigurations = (uint64_t)result;
  getHMDeviceConfigurationsClass = (uint64_t (*)())HMDeviceConfigurationsFunction;
  return result;
}

id HMDeviceConfigurationsFunction()
{
  return (id)classHMDeviceConfigurations;
}

double OUTLINED_FUNCTION_0(float a1)
{
  return a1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DE3CDC70(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_1DE3CE830(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1DE3CE974(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

Class __getHUAccessoryManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!HearingUtilitiesLibraryCore_frameworkLibrary_1)
  {
    HearingUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!HearingUtilitiesLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("HUAccessoryManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getHUAccessoryManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getHUAccessoryManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class initHMServiceClient()
{
  Class result;

  if (HearingModeServiceLibrary_sOnce_0 != -1)
    dispatch_once(&HearingModeServiceLibrary_sOnce_0, &__block_literal_global_39);
  result = objc_getClass("HMServiceClient");
  classHMServiceClient = (uint64_t)result;
  getHMServiceClientClass = (uint64_t (*)())HMServiceClientFunction;
  return result;
}

id HMServiceClientFunction()
{
  return (id)classHMServiceClient;
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

uint64_t __getHUAccessoryManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __paRoutesOfSubtypeOrProduct_block_invoke_cold_1(v0);
}

uint64_t __paRoutesOfSubtypeOrProduct_block_invoke_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getHUUtilitiesClass_block_invoke_cold_1(v0);
}

uint64_t __getHUUtilitiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getHKUnitClass_block_invoke_cold_1(v0);
}

uint64_t __getHKUnitClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[PAConfiguration initWithCoder:].cold.1(v0);
}

uint64_t AXLogCommon()
{
  return MEMORY[0x1E0CF31F8]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t PAInitializeLogging()
{
  return MEMORY[0x1E0D2F9B0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

