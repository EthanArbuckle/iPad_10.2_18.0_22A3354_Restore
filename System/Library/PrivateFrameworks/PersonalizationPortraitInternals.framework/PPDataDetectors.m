@implementation PPDataDetectors

+ (void)scanString:(id)a3 inRange:(id)a4 withScanner:(__DDScanner *)a5 options:(int64_t)a6 block:(id)a7
{
  const __CFArray *v7;
  const __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex v11;
  const void *ValueAtIndex;
  uint64_t Category;
  BOOL v14;
  unsigned int (**v15)(id, const void *, uint64_t);

  v15 = (unsigned int (**)(id, const void *, uint64_t))a7;
  if (DDScannerScanStringWithRange())
  {
    v7 = (const __CFArray *)DDScannerCopyResultsWithOptions();
    if (v7)
    {
      v8 = v7;
      Count = CFArrayGetCount(v7);
      v10 = Count - 1;
      if (Count >= 1)
      {
        v11 = 0;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v11);
          Category = DDResultGetCategory();
          if (v15[2](v15, ValueAtIndex, Category))
            v14 = v10 == v11;
          else
            v14 = 1;
          ++v11;
        }
        while (!v14);
      }
      CFRelease(v8);
    }
  }

}

+ (void)addAddressComponentsInResult:(__DDResult *)a3 toDictionary:(id)a4
{
  const __CFArray *SubResults;
  const __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  void *v10;
  void *v11;
  uint64_t Value;
  const void *v13;
  CFTypeID TypeID;
  id v15;

  v15 = a4;
  if (addAddressComponentsInResult_toDictionary__onceToken != -1)
    dispatch_once(&addAddressComponentsInResult_toDictionary__onceToken, &__block_literal_global_3954);
  SubResults = (const __CFArray *)DDResultGetSubResults();
  if (SubResults)
  {
    v5 = SubResults;
    Count = CFArrayGetCount(SubResults);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v5, i);
        DDResultGetType();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
        {
          Value = DDResultGetValue();
          if (Value)
          {
            v13 = (const void *)Value;
            TypeID = CFStringGetTypeID();
            if (TypeID == CFGetTypeID(v13))
              objc_msgSend(v15, "setObject:forKeyedSubscript:", v13, v11);
          }
        }
        objc_msgSend((id)objc_opt_class(), "addAddressComponentsInResult:toDictionary:", ValueAtIndex, v15);

      }
    }
  }

}

+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4
{
  return (id)objc_msgSend(a1, "addressComponentsFromString:extractedAddress:locale:", a3, a4, 0);
}

+ (id)addressComponentsFromString:(id)a3 extractedAddress:(id *)a4 locale:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  id v19;
  id *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v9 = a3;
  v10 = a5;
  if (objc_msgSend(v9, "length"))
  {
    if (v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPDataDetectors.m"), 110, CFSTR("overriding locale for PPDataDetectors +addressComponentsFromString is for unit tests only"));

    }
    if (addressComponentsFromString_extractedAddress_locale___pasOnceToken2 != -1)
      dispatch_once(&addressComponentsFromString_extractedAddress_locale___pasOnceToken2, &__block_literal_global_17);
    v11 = (id)addressComponentsFromString_extractedAddress_locale___pasExprOnceResult;
    objc_msgSend(v11, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__3940;
    v25 = __Block_byref_object_dispose__3941;
    v26 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_29;
    v16[3] = &unk_1E7E16860;
    v19 = a1;
    v20 = a4;
    v17 = v9;
    v18 = &v21;
    objc_msgSend(v12, "runWithLockAcquired:", v16);
    v13 = (id)v22[5];

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (BOOL)isValidDataDetectorsMatch:(__DDResult *)a3 addressComponents:(id *)a4
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;

  v7 = (void *)objc_opt_new();
  +[PPDataDetectors addAddressComponentsInResult:toDictionary:](PPDataDetectors, "addAddressComponentsInResult:toDictionary:", a3, v7);
  if (a4)
    *a4 = objc_retainAutorelease(v7);
  v8 = *MEMORY[0x1E0CB3260];
  objc_msgSend(v7, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3260]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = *MEMORY[0x1E0CB3268];
    if ((+[PPDataDetectors _components:haveHongKongAtKey:]((uint64_t)a1, v7, (void *)*MEMORY[0x1E0CB3268]) & 1) != 0
      || (v10 = *MEMORY[0x1E0CB3290],
          +[PPDataDetectors _components:haveHongKongAtKey:]((uint64_t)a1, v7, (void *)*MEMORY[0x1E0CB3290])))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v8);

      objc_msgSend(v7, "removeObjectForKey:", v10);
    }
  }
  v12 = v7;
  objc_opt_self();
  objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3298]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = 1;
    }
    else
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", *MEMORY[0x1E0CB32A0]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = v16 != 0;

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (uint64_t)_components:(void *)a3 haveHongKongAtKey:
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  v5 = a2;
  objc_opt_self();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("香港")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("香港省")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("HongKong")) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("Hong Kong"));
  }

  return v7;
}

void __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_29(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  int8x16_t v13;

  v3 = a2;
  v4 = (void *)objc_opt_class();
  v5 = *(void **)(a1 + 32);
  v6 = objc_msgSend(v5, "length");
  v7 = *MEMORY[0x1E0D1CDA0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2_30;
  v10[3] = &unk_1E7E16838;
  v8 = *(id *)(a1 + 32);
  v13 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  objc_msgSend(v4, "scanString:inRange:withScanner:options:block:", v5, 0, v6, v3, v7, v10);

}

BOOL __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2_30(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t Range;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  void *v15;
  id obj;

  if (a3 == 3)
  {
    Range = DDResultGetRange();
    v8 = v7;
    v9 = (void *)MEMORY[0x1C3BD6630]();
    objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", Range, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_autoreleasePoolPop(v9);
    if (*(_QWORD *)(a1 + 48))
      **(_QWORD **)(a1 + 48) = objc_retainAutorelease(v10);
    v11 = (void *)objc_opt_class();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "isValidDataDetectorsMatch:addressComponents:", a2, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if ((v13 & 1) == 0)
    {
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = 0;

    }
  }
  return a3 != 3;
}

void __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1C3BD6630]();
  v1 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_20, 1.0);
  v2 = (void *)addressComponentsFromString_extractedAddress_locale___pasExprOnceResult;
  addressComponentsFromString_extractedAddress_locale___pasExprOnceResult = v1;

  objc_autoreleasePoolPop(v0);
}

id __71__PPDataDetectors_addressComponentsFromString_extractedAddress_locale___block_invoke_2()
{
  void *v0;
  void *v1;
  void *v3;
  void *v4;

  v0 = (void *)DDScannerCreate();
  if (!v0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "+[PPDataDetectors addressComponentsFromString:extractedAddress:locale:]_block_invoke_2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PPDataDetectors.m"), 115, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("newScanner"));

  }
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v0);

  return v1;
}

void __61__PPDataDetectors_addAddressComponentsInResult_toDictionary___block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v0 = *MEMORY[0x1E0CB3288];
  v7[0] = CFSTR("CompanyName");
  v7[1] = CFSTR("Street");
  v1 = *MEMORY[0x1E0CB3298];
  v8[0] = v0;
  v8[1] = v1;
  v2 = *MEMORY[0x1E0CB3260];
  v7[2] = CFSTR("City");
  v7[3] = CFSTR("State");
  v3 = *MEMORY[0x1E0CB3290];
  v8[2] = v2;
  v8[3] = v3;
  v7[4] = CFSTR("ZipCode");
  v7[5] = CFSTR("Country");
  v4 = *MEMORY[0x1E0CB3268];
  v8[4] = *MEMORY[0x1E0CB32A0];
  v8[5] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary;
  addAddressComponentsInResult_toDictionary__subTypesToKeysDictionary = v5;

}

@end
