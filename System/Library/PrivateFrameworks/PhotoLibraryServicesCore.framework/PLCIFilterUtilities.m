@implementation PLCIFilterUtilities

+ (id)filterCopiesFromFilters:(id)a3
{
  objc_class *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  if (!a3)
    return 0;
  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = (void *)objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__PLCIFilterUtilities_filterCopiesFromFilters___block_invoke;
  v8[3] = &unk_1E3768BD8;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (id)outputImageFromFilters:(id)a3 inputImage:(id)a4 orientation:(int)a5 copyFiltersFirst:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  id v23;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v10 = a3;
  v11 = a4;
  if (v6)
  {
    objc_msgSend(a1, "filterCopiesFromFilters:", v10);
    v12 = objc_claimAutoreleasedReturnValue();

    v10 = (id)v12;
  }
  if (objc_msgSend(v10, "count"))
  {
    v18 = MEMORY[0x1E0C809B0];
    v19 = 3221225472;
    v20 = __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke;
    v21 = &unk_1E3768C00;
    v22 = v11;
    v13 = v10;
    v23 = v13;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v18);
    objc_msgSend(v13, "lastObject", v18, v19, v20, v21);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "valueForKey:", CFSTR("outputImage"));
    v15 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = v11;
  }
  if ((int)v7 >= 2)
  {
    objc_msgSend(v15, "imageByApplyingOrientation:", v7);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v16;
  }
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &__block_literal_global_1784);

  return v15;
}

void __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  id v8;

  if (a3)
  {
    v3 = *(void **)(a1 + 40);
    v4 = a3 - 1;
    v5 = a2;
    objc_msgSend(v3, "objectAtIndex:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "valueForKey:", CFSTR("outputImage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setValue:forKey:", v6, CFSTR("inputImage"));

  }
  else
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = a2;
    objc_msgSend(v8, "setValue:forKey:", v7, CFSTR("inputImage"));
  }

}

uint64_t __86__PLCIFilterUtilities_outputImageFromFilters_inputImage_orientation_copyFiltersFirst___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setValue:forKey:", 0, CFSTR("inputImage"));
}

void __47__PLCIFilterUtilities_filterCopiesFromFilters___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = (id)objc_msgSend(a2, "copy");
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

@end
