@implementation CRComputeDeviceUtilities

+ (id)allComputeDevices
{
  if (qword_1ED0B46E8 != -1)
    dispatch_once(&qword_1ED0B46E8, &__block_literal_global_27);
  return (id)_MergedGlobals_27;
}

void __45__CRComputeDeviceUtilities_allComputeDevices__block_invoke()
{
  uint64_t v0;
  void *v1;

  MLAllComputeDevices();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_MergedGlobals_27;
  _MergedGlobals_27 = v0;

}

+ (id)computeDevices:(id)a3 ofTypes:(unint64_t)a4
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[5];

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __51__CRComputeDeviceUtilities_computeDevices_ofTypes___block_invoke;
  v8[3] = &__block_descriptor_40_e42_B32__0___MLComputeDeviceProtocol__8Q16_B24l;
  v8[4] = a4;
  v4 = a3;
  objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectsAtIndexes:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

BOOL __51__CRComputeDeviceUtilities_computeDevices_ofTypes___block_invoke(uint64_t a1, void *a2)
{
  return (objc_msgSend(a2, "_crComputeDeviceType") & ~*(_QWORD *)(a1 + 32)) == 0;
}

+ (unint64_t)computeDeviceTypeForOptions:(id)a3 mtlDevice:(id *)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  BOOL v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  int v21;
  unint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  unint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderRestrictToCPUKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLValue");

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderMTLDeviceKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderMTLDeviceKey"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 2;
  }
  else
  {
    v9 = 0;
    v10 = v7;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v14 = v10;
    if (!a4)
      goto LABEL_24;
    goto LABEL_22;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("CRImageReaderComputeDeviceKey"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "_crComputeDeviceType");
  v14 = v13;
  if (v10)
    v15 = v10 == v13;
  else
    v15 = 1;
  if (!v15)
  {
    CROSLogForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      v21 = 134218496;
      v22 = v14;
      v23 = 2048;
      v24 = v10;
      v25 = 2048;
      v26 = v14;
      _os_log_impl(&dword_1D4FB8000, v16, OS_LOG_TYPE_FAULT, "Conflicting request configuration. %lu vs. %lu. Selecting %lu", (uint8_t *)&v21, 0x20u);
    }

  }
  if (v14 == 2)
  {
    objc_msgSend(v12, "metalDevice");
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v9 && (void *)v17 != v9)
    {
      CROSLogForCategory(0);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        v21 = 138412802;
        v22 = (unint64_t)v9;
        v23 = 2112;
        v24 = (uint64_t)v18;
        v25 = 2112;
        v26 = (unint64_t)v18;
        _os_log_impl(&dword_1D4FB8000, v19, OS_LOG_TYPE_FAULT, "Conflicting requested configuration. Metal device passed (%@) does not match computeDevice's device (%@). Using %@", (uint8_t *)&v21, 0x20u);
      }

    }
    v9 = v18;
  }

  if (a4)
  {
LABEL_22:
    if (v9)
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_24:

  return v14;
}

+ (int64_t)mlComputeUnitFromComputeDeviceType:(unint64_t)a3
{
  if (a3 - 1 >= 4)
    return 2;
  else
    return a3 - 1;
}

@end
