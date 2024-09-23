uint64_t SBVisibleColumnRangeGetVisibleColumnsForIconListIndex(unint64_t *a1, unint64_t a2)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  BOOL v10;

  v3 = *a1;
  v4 = a1[2];
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL && v4 >= v3)
  {
    v7 = a1[3];
    v8 = a1[1];
    v9 = v3 != v4 || v7 >= v8;
    v10 = !v9;
    if (v3 <= a2 && !v10 && v4 >= a2)
    {
      if (v3 == a2 && v4 == a2)
      {
        return v8;
      }
      else if (v3 == a2)
      {
        return v8;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

double SBHIntersectionFloatRange(double result, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a3 + a4;
  if (result <= a3 && a3 < result + a2)
    v5 = a3;
  else
    v5 = 0.0;
  if (a3 > result || result >= v4)
    return v5;
  return result;
}

double SBHRTLAwarePositionInFloatRange(uint64_t a1, int a2, long double a3, double a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 2;
  if (a2)
    v4 = 0;
  v5 = 1;
  v6 = 2;
  if (!a2)
    v6 = 0;
  if (a1)
    v6 = 0;
  if (a1 != 1)
    v5 = v6;
  if (a1 == 2)
    v7 = v4;
  else
    v7 = v5;
  return SBHPositionInFloatRange(v7, a3, a4);
}

double SBHPositionInFloatRange(uint64_t a1, long double a2, double a3)
{
  double result;

  if (a1 == 2)
    return nexttoward(a2 + a3, a2);
  if (a1 == 1)
    return a2 + nexttoward(a3 * 0.5, a2);
  result = 0.0;
  if (!a1)
    return a2;
  return result;
}

BOOL SBVisibleColumnRangeEqualToRange(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

void sub_1CFEFBE84(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 208));
  _Unwind_Resume(a1);
}

double SBHIconListLayoutCalculateHorizontalColumnBump(unint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6)
{
  unint64_t v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  int v15;
  float v17;
  double v18;
  unint64_t v19;
  int *v21;
  int *v22;
  int v23;
  int v24;
  int v25;
  int *v26;
  unsigned int v27;
  unint64_t v28;
  int v29;
  char v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (a2 <= 1)
    v10 = 1;
  else
    v10 = a2;
  v11 = v10 - 1;
  v12 = (double)(unint64_t)a2;
  SBFFloatFloorForScale();
  v14 = a5 - (v13 * (double)(v10 - 1) + a3 * v12);
  v15 = (int)v14;
  if (a6 == 3.0 && v11 == 3)
    return (double)(v15 * a1) / 3.0;
  if (!v15)
  {
    v17 = v14 * a6;
    if (v11 == vcvtps_s32_f32(v17))
      return (double)a1 / a6;
  }
  v19 = v15 & ~((v11 & 1) == 0);
  v18 = 0.0;
  if ((int)v19 >= 1 && v11 > v19)
  {
    if (v10 >= 9)
    {
      v21 = (int *)malloc_type_calloc(v10 - 1, 4uLL, 0x100004052888210uLL);
      v22 = v21;
    }
    else
    {
      v21 = 0;
      v22 = (int *)&v31;
    }
    bzero(v22, 4 * v11);
    if ((v19 & 1) == 0
      || ((v11 & 0x80000000) == 0 ? (v23 = v11) : (v23 = v11 + 1),
          v22[v23 >> 1] = 1,
          LODWORD(v19) = v19 - 1,
          (_DWORD)v19))
    {
      if ((v11 & 1) != 0)
        v24 = 2;
      else
        v24 = 1;
      v25 = v24 + (v11 >> 1) - 1;
      v26 = &v22[(int)(v11 >> 1) - 1];
      v27 = v19 + 2;
      do
      {
        *v26-- = 1;
        v22[v25++] = 1;
        v27 -= 2;
      }
      while (v27 > 2);
    }
    v18 = 0.0;
    if (a1 >= v11)
      v28 = v11;
    else
      v28 = a1;
    for (; v28; --v28)
    {
      v29 = *v22++;
      v18 = v18 + (double)v29;
    }
    free(v21);
  }
  return v18;
}

void sub_1CFEFF8FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1CFEFF9C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBHIconGridRangeEnumerateCellIndexes(uint64_t a1, int a2, unsigned __int16 a3, void *a4)
{
  void (**v7)(id, uint64_t, char *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;

  v7 = a4;
  v8 = HIWORD(a2);
  if (HIWORD(a2))
  {
    v9 = 0;
    v10 = (unsigned __int16)a2;
    while (!v10)
    {
LABEL_7:
      if (++v9 == v8)
        goto LABEL_8;
    }
    v11 = a1 + v9 * a3;
    v12 = v10;
    while (1)
    {
      v13 = 0;
      v7[2](v7, v11, &v13);
      if (v13)
        break;
      ++v11;
      if (!--v12)
        goto LABEL_7;
    }
  }
LABEL_8:

}

char *setIndex(char *result, uint64_t a2, uint64_t a3, uint64_t a4, void **a5, unint64_t *a6)
{
  unint64_t v6;
  __int16 v7;
  __int16 v8;
  __int16 *v9;
  char *v12;
  unint64_t v13;
  unint64_t v14;
  char *v15;

  v6 = (unint64_t)result;
  if (a2)
    v7 = a2;
  else
    v7 = -1;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = v7;
  if ((unint64_t)result <= 0x3F)
  {
    v9 = (__int16 *)(a3 + 2 * (_QWORD)&result[a4]);
    goto LABEL_19;
  }
  v12 = result - 64;
  result = (char *)*a5;
  if (v6 - 64 >= *a6)
  {
    v13 = v6 & 0xFFFFFFFFFFFFFFC0;
    v14 = v13 + 64;
    if (result)
    {
      result = (char *)reallocf(result, 2 * v14);
      *a5 = result;
      if (result)
      {
        v15 = result;
        bzero(&result[2 * *a6], 2 * (v14 - *a6));
LABEL_14:
        bzero(&v15[2 * *a6], 2 * (v14 - *a6));
        result = (char *)*a5;
LABEL_16:
        *a6 = v14;
        goto LABEL_17;
      }
    }
    else
    {
      result = (char *)malloc_type_calloc(v13 + 64, 2uLL, 0x1000040BDFB0063uLL);
      v15 = result;
      *a5 = result;
      if (result)
        goto LABEL_14;
    }
    v14 = 0;
    goto LABEL_16;
  }
LABEL_17:
  if (!result)
    return result;
  v9 = (__int16 *)&result[2 * (_QWORD)v12];
LABEL_19:
  *v9 = v8;
  return result;
}

uint64_t SBHIconGridSizeGetArea(int a1)
{
  return HIWORD(a1) * (unsigned __int16)a1;
}

NSString *SBHContentSizeCategoryClip(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  NSComparisonResult v9;
  NSString *v10;
  NSComparisonResult v11;
  NSString *v12;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (v5)
  {
    v8 = (NSString *)v5;
    v9 = UIContentSizeCategoryCompareToCategory(v8, v7);
    v10 = v7;
    if (v9 == NSOrderedDescending
      || (v11 = UIContentSizeCategoryCompareToCategory(v8, v6), v10 = v6, v11 == NSOrderedAscending))
    {
      v12 = v10;

      v8 = v12;
    }
  }
  else
  {
    v8 = v6;
  }

  return v8;
}

uint64_t SBIconLocationGroupContainsLocation(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  SBGetIconLocationGroups();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v7 = objc_msgSend(v6, "containsObject:", v3);
  else
    v7 = 0;

  return v7;
}

id SBGetIconLocationGroups()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v0 = (void *)SBGetIconLocationGroups_groups;
  if (!SBGetIconLocationGroups_groups)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = (void *)SBGetIconLocationGroups_groups;
    SBGetIconLocationGroups_groups = (uint64_t)v1;

    v3 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationRoot"), CFSTR("SBIconLocationRootWithWidgets"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("SBIconLocationGroupRoot"));

    v5 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationDock"), CFSTR("SBIconLocationFloatingDock"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SBIconLocationGroupDock"));

    v7 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationFloatingDock"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SBIconLocationGroupFloatingDock"));

    v9 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationAppLibrary"), CFSTR("SBIconLocationAppLibraryOverlay"), CFSTR("SBIconLocationAppLibraryCategoryPod"), CFSTR("SBIconLocationAppLibraryCategoryPodRecents"), CFSTR("SBIconLocationAppLibraryCategoryPodSuggestions"), CFSTR("SBIconLocationAppLibraryCategoryPodAdditionalItems"), CFSTR("SBIconLocationAppLibraryCategoryPodExpanded"), CFSTR("SBIconLocationAppLibrarySearch"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SBIconLocationGroupAppLibrary"));

    v11 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationTodayView"), CFSTR("SBIconLocationTodayViewOverlay"), 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKey:", v12, CFSTR("SBIconLocationGroupTodayView"));

    v13 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationAddWidgetSheet"), CFSTR("SBIconLocationWidgetConfiguration"), CFSTR("SBIconLocationStackConfiguration"), 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v14, CFSTR("SBIconLocationGroupWidgetConfiguration"));

    v15 = (void *)SBGetIconLocationGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBIconLocationRoot"), CFSTR("SBIconLocationRootWithWidgets"), CFSTR("SBIconLocationDock"), CFSTR("SBIconLocationFloatingDock"), CFSTR("SBIconLocationFolder"), CFSTR("SBIconLocationTodayView"), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setObject:forKey:", v16, CFSTR("SBIconLocationGroupIconHierarchy"));

    v0 = (void *)SBGetIconLocationGroups_groups;
  }
  return v0;
}

uint64_t SBHFeatureEnabled(uint64_t a1)
{
  char v1;
  uint64_t result;

  v1 = a1;
  if (a1)
    LODWORD(result) = 0;
  else
    LODWORD(result) = _os_feature_enabled_impl();
  if ((overriddenEnabledFeatures & (1 << v1)) != 0)
    return 1;
  else
    return result;
}

void sub_1CFF031D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogIcon()
{
  if (SBLogIcon_onceToken != -1)
    dispatch_once(&SBLogIcon_onceToken, &__block_literal_global_30);
  return (id)SBLogIcon___logObj;
}

void sub_1CFF04334(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  void *v14;
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_sync_exit(v14);
  _Unwind_Resume(a1);
}

double SBHIconListLayoutIconImageInfoForGridSizeClass(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  double v6;
  double v7;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4
      && (objc_msgSend(v4, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "iconImageInfoForGridSizeClass:", v5);
    }
    else
    {
      objc_msgSend(v3, "iconImageInfo");
    }
    v7 = v6;
  }
  else
  {
    v7 = 50.0;
  }

  return v7;
}

unint64_t SBIconCoordinateMakeWithGridCellIndex(unint64_t a1, unsigned __int16 a2)
{
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a1 % a2 + 1;
}

uint64_t SBIconCoordinateGetGridCellIndex(uint64_t a1, uint64_t a2, unsigned __int16 a3)
{
  if (SBIconCoordinateIsNotFound(a1, a2))
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a1 + (a2 - 1) * a3 - 1;
}

BOOL SBIconCoordinateIsNotFound(uint64_t a1, uint64_t a2)
{
  return a2 == 0x7FFFFFFFFFFFFFFFLL || a1 == 0x7FFFFFFFFFFFFFFFLL;
}

SBHIconGridSizeClassSizeMap *SBHIconListLayoutIconGridSizeClassSizes(void *a1)
{
  id v1;
  SBHIconGridSizeClassSizeMap *v2;
  SBHIconGridSizeClassSizeMap *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "iconGridSizeClassSizes");
    v2 = (SBHIconGridSizeClassSizeMap *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = objc_alloc_init(SBHIconGridSizeClassSizeMap);
  }
  v3 = v2;

  return v3;
}

void sub_1CFF05DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBIconApproximateLayoutPositionEqualToApproximateLayoutPosition(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return a1 == a3 && a2 == a4;
}

id SBLogCommon()
{
  if (SBLogCommon_onceToken != -1)
    dispatch_once(&SBLogCommon_onceToken, &__block_literal_global_8_0);
  return (id)SBLogCommon___logObj;
}

void sub_1CFF075D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF0788C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF0821C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

id SBIconViewQueryingIconViewForIconInLocation(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__11;
  v31 = __Block_byref_object_dispose__11;
  v32 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __SBIconViewQueryingIconViewForIconInLocation_block_invoke;
  v21[3] = &unk_1E8D89D98;
  v25 = &v27;
  v22 = v7;
  v23 = v8;
  v24 = v9;
  v26 = a4;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __SBIconViewQueryingIconViewForIconInLocation_block_invoke_2;
  v16[3] = &unk_1E8D89DC0;
  v20 = &v27;
  v11 = v22;
  v17 = v11;
  v12 = v23;
  v18 = v12;
  v13 = v24;
  v19 = v13;
  SBIconViewQueryingOptionalMethodImplementation(v11, a4, (uint64_t)sel_iconViewForIcon_location_options_, v21, v16);
  v14 = (id)v28[5];

  _Block_object_dispose(&v27, 8);
  return v14;
}

void sub_1CFF08828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingOptionalMethodImplementation(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  _QWORD v11[4];
  id v12;

  v8 = a1;
  v9 = a4;
  v10 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if (((*((uint64_t (**)(id, id))v9 + 2))(v9, v8) & 1) == 0)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __SBIconViewQueryingOptionalMethodImplementation_block_invoke;
      v11[3] = &unk_1E8D89DE8;
      v12 = v9;
      SBIconViewQueryingEnumerateIconViewQueryable(v8, a2, v11);

    }
  }
  else
  {
    v10[2](v10);
  }

}

void sub_1CFF08A88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingEnumerateIconViewQueryable(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;

  v6 = a1;
  v5 = a3;
  if ((a2 & 0x10) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "enumerateIconViewQueryableChildrenWithOptions:usingBlock:", a2, v5);

}

void sub_1CFF0967C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CFF0A09C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBIconViewQueryingDisplayingIconInLocation(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v10 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __SBIconViewQueryingDisplayingIconInLocation_block_invoke;
  v21[3] = &unk_1E8D89D98;
  v25 = &v27;
  v22 = v7;
  v23 = v8;
  v24 = v9;
  v26 = a4;
  v16[0] = v10;
  v16[1] = 3221225472;
  v16[2] = __SBIconViewQueryingDisplayingIconInLocation_block_invoke_2;
  v16[3] = &unk_1E8D89DC0;
  v20 = &v27;
  v11 = v22;
  v17 = v11;
  v12 = v23;
  v18 = v12;
  v13 = v24;
  v19 = v13;
  SBIconViewQueryingOptionalMethodImplementation(v11, a4, (uint64_t)sel_isDisplayingIcon_inLocation_options_, v21, v16);
  v14 = *((unsigned __int8 *)v28 + 24);

  _Block_object_dispose(&v27, 8);
  return v14;
}

void sub_1CFF0AD0C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1CFF0B000(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBStringFromVisibleColumnRange(_QWORD *a1)
{
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("none");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%lu,%lu}..{%lu,%lu}"), *a1, a1[1], a1[2], a1[3]);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t SBHStringForIconGridSize(int a1)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u×%u"), (unsigned __int16)a1, HIWORD(a1));
}

void sub_1CFF0DFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF0F24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

id SBLogLegibility()
{
  if (SBLogLegibility_onceToken != -1)
    dispatch_once(&SBLogLegibility_onceToken, &__block_literal_global_44);
  return (id)SBLogLegibility___logObj;
}

id SBLogIconLabelImageCache()
{
  if (SBLogIconLabelImageCache_onceToken != -1)
    dispatch_once(&SBLogIconLabelImageCache_onceToken, &__block_literal_global_6);
  return (id)SBLogIconLabelImageCache___logObj;
}

void sub_1CFF11778(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1CFF1187C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF11DE8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1CFF11FCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF129AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF140F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF1461C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF146E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF147B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _touchesContainNonIndirectTouch(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v6 + 1) + 8 * i), "type", (_QWORD)v6) != 1)
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

id SBLogClock()
{
  if (SBLogClock_onceToken != -1)
    dispatch_once(&SBLogClock_onceToken, &__block_literal_global_42);
  return (id)SBLogClock___logObj;
}

id _SBClockIconGetCalendar()
{
  if (_SBClockIconInitialize___once != -1)
    dispatch_once(&_SBClockIconInitialize___once, &__block_literal_global_288);
  return (id)__calendar;
}

void sub_1CFF1A488(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBLogHomeScreenUsageMonitor()
{
  if (SBLogHomeScreenUsageMonitor_onceToken != -1)
    dispatch_once(&SBLogHomeScreenUsageMonitor_onceToken, &__block_literal_global_14);
  return (id)SBLogHomeScreenUsageMonitor___logObj;
}

uint64_t SBFolderRelativeListIndex(void *a1)
{
  if (a1)
    return objc_msgSend(a1, "sbListIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

void sub_1CFF1C0A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogSelectedApplicationDataSource()
{
  if (SBLogSelectedApplicationDataSource_onceToken != -1)
    dispatch_once(&SBLogSelectedApplicationDataSource_onceToken, &__block_literal_global_40);
  return (id)SBLogSelectedApplicationDataSource___logObj;
}

void sub_1CFF1E5FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

id SBHUniqueIdentifierOfDataSource(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "uniqueIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SBHGetApplicationIconImage(void *a1, char a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;

  v9 = a1;
  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithImageAppearance(v9, v10, a2, a3, a4, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

CGFloat SBHCalculateIconSpacing(unsigned __int16 a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  int v12;
  CGFloat v13;
  CGRect v15;
  CGRect v16;

  v8 = a5 + 0.0;
  v9 = a4 + 0.0;
  v10 = a2 - (a5 + a7);
  v11 = a3 - (a4 + a6);
  v15.origin.x = a5 + 0.0;
  v15.origin.y = a4 + 0.0;
  v15.size.width = v10;
  v15.size.height = v11;
  v12 = a1;
  v13 = CGRectGetWidth(v15) - (double)a1 * a8;
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  CGRectGetHeight(v16);
  return v13 / (double)(v12 - 1);
}

CGFloat SBHIconListLayoutListIconSpacingForListSize(void *a1, uint64_t a2, double a3, double a4)
{
  id v7;
  unsigned __int16 v8;
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

  v7 = a1;
  v8 = SBHIconListLayoutListGridSize(v7, a2);
  objc_msgSend(v7, "layoutInsetsForOrientation:", a2);
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  objc_msgSend(v7, "iconImageInfo");
  v18 = v17;

  return SBHCalculateIconSpacing(v8, a3, a4, v10, v12, v14, v16, v18);
}

uint64_t SBHIconListLayoutListGridSize(void *a1, uint64_t a2)
{
  id v3;
  unsigned __int16 v4;

  v3 = a1;
  v4 = objc_msgSend(v3, "numberOfColumnsForOrientation:", a2);
  LOWORD(a2) = objc_msgSend(v3, "numberOfRowsForOrientation:", a2);

  return v4 | ((unsigned __int16)a2 << 16);
}

double SBHEdgeInsetsInvert(double a1)
{
  return -a1;
}

BOOL SBVisibleColumnRangeIsEmpty(unint64_t *a1)
{
  unint64_t v1;
  unint64_t v2;
  _BOOL8 result;

  v1 = *a1;
  result = 1;
  if (*a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = a1[2];
    if (v2 >= v1 && (v1 != v2 || a1[3] >= a1[1]))
      return 0;
  }
  return result;
}

void sub_1CFF25638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogWidgets()
{
  if (SBLogWidgets_onceToken != -1)
    dispatch_once(&SBLogWidgets_onceToken, &__block_literal_global_28);
  return (id)SBLogWidgets___logObj;
}

void sub_1CFF26B2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF296C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SBHScreenTypeLookup(unsigned int a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void *a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t (**v19)(_QWORD);
  unsigned int (**v20)(_QWORD);
  uint64_t (**v21)(_QWORD);
  uint64_t *v22;
  uint64_t v23;
  int v24;
  int v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  int v39;
  int v40;
  _QWORD v41[11];
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v19 = a4;
  v20 = a5;
  v21 = a6;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = ___SBHScreenTypeLookup_block_invoke;
  v41[3] = &unk_1E8D866F8;
  *(double *)&v41[6] = a9;
  *(double *)&v41[7] = a10;
  *(double *)&v41[8] = a11;
  v41[9] = a3;
  v41[10] = a2;
  v41[4] = &v46;
  v41[5] = &v42;
  SBHEnumerateScreenTypes((uint64_t)v41);
  if (!*((_BYTE *)v43 + 24))
  {
    if (a1 == 2)
    {
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 42;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 40;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 39;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 37;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 38;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 36;
        }
        else
        {
          v40 = BSSizeGreaterThanOrEqualToSize();
          v22 = v47;
          if (v40)
            v23 = 41;
          else
            v23 = 34;
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        v22 = v47;
        v23 = 33;
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        v22 = v47;
        v23 = 32;
      }
      else
      {
        v25 = BSSizeGreaterThanOrEqualToSize();
        v22 = v47;
        if (v25)
          v23 = 31;
        else
          v23 = 29;
      }
    }
    else
    {
      if (a1 > 1)
        goto LABEL_33;
      if (a2 == 2)
      {
        if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 23;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 13;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 5;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 21;
        }
        else if (BSSizeGreaterThanOrEqualToSize())
        {
          v22 = v47;
          v23 = 11;
        }
        else
        {
          v39 = BSSizeGreaterThanOrEqualToSize();
          v22 = v47;
          if (v39)
            v23 = 3;
          else
            v23 = 4;
        }
      }
      else if (BSSizeGreaterThanOrEqualToSize())
      {
        v22 = v47;
        v23 = 2;
      }
      else
      {
        v24 = BSSizeGreaterThanOrEqualToSize();
        v22 = v47;
        if (!v24)
        {
          v47[3] = 0;
          goto LABEL_33;
        }
        v23 = 1;
      }
    }
    v22[3] = v23;
  }
LABEL_33:
  switch(v47[3])
  {
    case 9:
    case 15:
      v26 = v20[2](v20) == 0;
      v27 = 9;
      v28 = 15;
      goto LABEL_40;
    case 10:
    case 16:
      v26 = v20[2](v20) == 0;
      v27 = 10;
      v28 = 16;
      goto LABEL_40;
    case 11:
    case 17:
      v26 = v20[2](v20) == 0;
      v27 = 11;
      v28 = 17;
      goto LABEL_40;
    case 12:
    case 18:
      v26 = v20[2](v20) == 0;
      v27 = 12;
      v28 = 18;
      goto LABEL_40;
    case 13:
    case 19:
      v26 = v20[2](v20) == 0;
      v27 = 13;
      v28 = 19;
      goto LABEL_40;
    case 14:
    case 20:
      v26 = v20[2](v20) == 0;
      v27 = 14;
      v28 = 20;
LABEL_40:
      if (!v26)
        v27 = v28;
      v47[3] = v27;
      break;
    case 29:
    case 30:
      v29 = v19[2](v19);
      v30 = v47;
      if (v29)
        v31 = 30;
      else
        v31 = 29;
      goto LABEL_49;
    case 35:
    case 36:
      v32 = v21[2](v21);
      v30 = v47;
      if (v32)
        v31 = 35;
      else
        v31 = 36;
LABEL_49:
      v30[3] = v31;
      break;
    default:
      break;
  }
  if (os_variant_has_internal_content())
  {
    v33 = objc_alloc_init(MEMORY[0x1E0DA9F98]);
    objc_msgSend(v33, "overriddenScreenType");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v34;
    if (v34)
    {
      v36 = SBHScreenTypeForShortString(v34);
      v47[3] = v36;
    }

  }
  v37 = v47[3];
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

  return v37;
}

void sub_1CFF2B858(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF2C304(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CFF2C5C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id SBHBundle()
{
  if (SBHBundle___onceToken != -1)
    dispatch_once(&SBHBundle___onceToken, &__block_literal_global_39);
  return (id)SBHBundle___springBoardHomeBundle;
}

id _SBCreateDeleteAppApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("trash"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.delete-app"));
  return v3;
}

void sub_1CFF3060C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

double SBIconBadgeViewCalculateAccessoryCenter(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9)
{
  double v13;
  _QWORD v15[12];
  char v16;
  CGRect v17;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __SBIconBadgeViewCalculateAccessoryCenter_block_invoke;
  v15[3] = &__block_descriptor_97_e5_d8__0l;
  v16 = a1;
  *(double *)&v15[4] = a6;
  *(double *)&v15[5] = a7;
  *(double *)&v15[6] = a8;
  *(double *)&v15[7] = a9;
  *(CGFloat *)&v15[8] = a2;
  *(CGFloat *)&v15[9] = a3;
  *(CGFloat *)&v15[10] = a4;
  *(CGFloat *)&v15[11] = a5;
  v13 = __SBIconBadgeViewCalculateAccessoryCenter_block_invoke((uint64_t)v15);
  v17.origin.x = a2;
  v17.origin.y = a3;
  v17.size.width = a4;
  v17.size.height = a5;
  CGRectGetMinY(v17);
  return v13;
}

double SBHIconListLayoutIconAccessorySize(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;

  v1 = a1;
  v2 = 26.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "iconAccessoryVisualConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "size");
    v2 = v4;

  }
  return v2;
}

double SBHIconListLayoutIconAccessoryOffset(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;

  v1 = a1;
  v2 = 11.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "iconAccessoryVisualConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "offset");
    v2 = v4;

  }
  return v2;
}

double SBHDisplayCornerRadiusForScreenType(uint64_t a1)
{
  double result;

  result = 0.0;
  if ((unint64_t)(a1 - 3) <= 0x2C)
    return dbl_1D0190930[a1 - 3];
  return result;
}

void getRootMetrics(unint64_t a1, char a2, uint64_t a3)
{
  uint64_t v6;
  _BOOL4 v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  __int128 *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char v43;
  char v44;
  double *v45;
  double v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  uint64_t v51;
  _QWORD v52[3];

  v52[2] = *MEMORY[0x1E0C80C00];
  v6 = a2 & 0x18;
  v7 = v6 != 0;
  switch(a1)
  {
    case 0uLL:
      v8 = 0;
      v9 = 0;
      v12 = 0;
      v10 = 8u;
      v11 = 0x28u;
      break;
    case 1uLL:
      v8 = 0;
      v9 = 0x90u;
      v10 = 0x98u;
      v11 = 0xB8u;
      v12 = v9;
      break;
    case 2uLL:
      v8 = 0;
      v9 = 0x120u;
      v10 = 0x128u;
      v11 = 0x148u;
      v12 = v9;
      break;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x14uLL:
    case 0x18uLL:
    case 0x1CuLL:
      v8 = 0;
      v9 = 0x1B0u;
      v10 = 0x1B8u;
      v11 = 0x1D8u;
      v12 = v9;
      break;
    case 4uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x1AuLL:
      v8 = 0;
      v9 = 0x240u;
      v10 = 0x248u;
      v11 = 0x268u;
      v12 = v9;
      break;
    case 5uLL:
    case 7uLL:
      v8 = 0;
      v9 = 0x2D0u;
      v10 = 0x2D8u;
      v11 = 0x2F8u;
      v12 = v9;
      break;
    case 0xBuLL:
    case 0x11uLL:
      v8 = 0;
      v9 = 0x360u;
      v10 = 0x368u;
      v11 = 0x388u;
      v12 = v9;
      break;
    case 0xDuLL:
    case 0x13uLL:
      v8 = 0;
      v9 = 0x3F0u;
      v10 = 0x3F8u;
      v11 = 0x418u;
      v12 = v9;
      break;
    case 0x15uLL:
      v8 = 0;
      v7 = 0;
      v13 = v6 == 0;
      v9 = 1152;
      v14 = 1224;
      goto LABEL_17;
    case 0x17uLL:
      v8 = 0;
      v9 = 0x510u;
      v10 = 0x518u;
      v11 = 0x538u;
      v12 = v9;
      break;
    case 0x19uLL:
      v8 = 0;
      v7 = 0;
      v13 = v6 == 0;
      v9 = 1440;
      v14 = 1512;
LABEL_17:
      if (!v13)
        v9 = v14;
      v10 = v9 + 8;
      v11 = v9 + 40;
      v12 = v9;
      break;
    case 0x1BuLL:
      v8 = 0;
      v9 = 0x630u;
      v10 = 0x638u;
      v11 = 0x658u;
      v12 = v9;
      break;
    case 0x1DuLL:
    case 0x29uLL:
      v8 = 1;
      v12 = 0x6C0u;
      v9 = 0x708u;
      v10 = 0x710u;
      v11 = 0x730u;
      break;
    case 0x1EuLL:
      v8 = 1;
      v12 = 0x7E0u;
      v9 = 0x828u;
      v10 = 0x830u;
      v11 = 0x850u;
      break;
    case 0x1FuLL:
      v8 = 1;
      v12 = 0x900u;
      v9 = 0x948u;
      v10 = 0x950u;
      v11 = 0x970u;
      break;
    case 0x20uLL:
      v8 = 1;
      v12 = 0xA20u;
      v9 = 0xA68u;
      v10 = 0xA70u;
      v11 = 0xA90u;
      break;
    case 0x21uLL:
    case 0x28uLL:
      v8 = 1;
      v12 = 0xB40u;
      v9 = 0xB88u;
      v10 = 0xB90u;
      v11 = 0xBB0u;
      break;
    case 0x22uLL:
      v8 = 1;
      v12 = 0x10E0u;
      v9 = 0x1128u;
      v10 = 0x1130u;
      v11 = 0x1150u;
      break;
    case 0x23uLL:
    case 0x24uLL:
      v8 = 1;
      v12 = 0xC60u;
      v9 = 0xCA8u;
      v10 = 0xCB0u;
      v11 = 0xCD0u;
      break;
    case 0x25uLL:
      v8 = 1;
      v12 = 0xD80u;
      v9 = 0xDC8u;
      v10 = 0xDD0u;
      v11 = 0xDF0u;
      break;
    case 0x26uLL:
      v8 = 1;
      v12 = 0xEA0u;
      v9 = 0xEE8u;
      v10 = 0xEF0u;
      v11 = 0xF10u;
      break;
    case 0x27uLL:
      v8 = 1;
      v12 = 0xFC0u;
      v9 = 0x1008u;
      v10 = 0x1010u;
      v11 = 0x1030u;
      break;
    case 0x2AuLL:
      v8 = 1;
      v12 = 0x1200u;
      v9 = 0x1248u;
      v10 = 0x1250u;
      v11 = 0x1270u;
      break;
    case 0x2BuLL:
      v8 = 1;
      v12 = 0x1320u;
      v9 = 0x1368u;
      v10 = 0x1370u;
      v11 = 0x1390u;
      break;
    case 0x2CuLL:
      v8 = 1;
      v12 = 0x1440u;
      v9 = 0x1488u;
      v10 = 0x1490u;
      v11 = 0x14B0u;
      break;
    case 0x2DuLL:
      v8 = 1;
      v12 = 0x1680u;
      v9 = 0x16C8u;
      v10 = 0x16D0u;
      v11 = 0x16F0u;
      break;
    case 0x2EuLL:
      v8 = 1;
      v12 = 0x1560u;
      v9 = 0x15A8u;
      v10 = 0x15B0u;
      v11 = 0x15D0u;
      break;
    case 0x2FuLL:
      v8 = 1;
      v12 = 0x17A0u;
      v9 = 0x17E8u;
      v10 = 0x17F0u;
      v11 = 0x1810u;
      break;
    default:
      v8 = 0;
      v7 = 0;
      v11 = 0;
      v10 = 0;
      v9 = 0;
      v12 = 0;
      break;
  }
  v15 = (__int128 *)((char *)&defaultRootMetrics + v10);
  v16 = (__int128 *)((char *)&defaultRootMetrics + v11);
  *(_DWORD *)a3 = *(_DWORD *)((char *)&defaultRootMetrics + v12);
  v17 = *v15;
  *(_OWORD *)(a3 + 24) = v15[1];
  *(_OWORD *)(a3 + 8) = v17;
  v18 = *v16;
  *(_OWORD *)(a3 + 56) = v16[1];
  *(_OWORD *)(a3 + 40) = v18;
  *(_DWORD *)(a3 + 72) = *(_DWORD *)((char *)&defaultRootMetrics + v9);
  v19 = v15[1];
  *(_OWORD *)(a3 + 80) = *v15;
  *(_OWORD *)(a3 + 96) = v19;
  v20 = v16[1];
  *(_OWORD *)(a3 + 112) = *v16;
  *(_OWORD *)(a3 + 128) = v20;
  if (SBHScreenTypeIsPad(a1))
  {
    _SBHDefaultIconGridSizeClassIconImageInfos(a1, a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));

    SBHDefaultIconImageSize(a1, a2 & 0xE7);
    SBHDefaultIconImageSize(a1, a2 | 8);
    SBHGetScreenSpecification(a1, (uint64_t)&v51);
    if (v8)
    {
      SBFFloatCeilForScale();
      UIEdgeInsetsSubtract();
      *(_QWORD *)(a3 + 8) = v22;
      *(_QWORD *)(a3 + 16) = v23;
      *(_QWORD *)(a3 + 24) = v24;
      *(_QWORD *)(a3 + 32) = v25;
    }
    if (v7)
    {
      SBFFloatCeilForScale();
      UIEdgeInsetsSubtract();
      *(_QWORD *)(a3 + 8) = v26;
      *(_QWORD *)(a3 + 16) = v27;
      *(_QWORD *)(a3 + 24) = v28;
      *(_QWORD *)(a3 + 32) = v29;
      UIEdgeInsetsSubtract();
      *(_QWORD *)(a3 + 40) = v30;
      *(_QWORD *)(a3 + 48) = v31;
      *(_QWORD *)(a3 + 56) = v32;
      *(_QWORD *)(a3 + 64) = v33;
      UIEdgeInsetsSubtract();
      *(_QWORD *)(a3 + 80) = v34;
      *(_QWORD *)(a3 + 88) = v35;
      *(_QWORD *)(a3 + 96) = v36;
      *(_QWORD *)(a3 + 104) = v37;
      UIEdgeInsetsSubtract();
      *(_QWORD *)(a3 + 112) = v38;
      *(_QWORD *)(a3 + 120) = v39;
      *(_QWORD *)(a3 + 128) = v40;
      *(_QWORD *)(a3 + 136) = v41;
    }
  }
  if (SBHScreenTypeIsPhone(a1) && (SBHScreenTypeHasHomeButton(a1) & 1) == 0)
  {
    v42 = 0;
    v52[0] = a3 + 8;
    v52[1] = a3 + 80;
    v43 = 1;
    do
    {
      v44 = v43;
      v45 = (double *)v52[v42];
      v46 = v45[1];
      objc_msgSend(MEMORY[0x1E0DC5B80], "sbh_displayEdgeInfoForScreenType:", a1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "safeAreaInsetsPortrait");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "topInset");
      v50 = v46 + v49 + -10.0;

      v43 = 0;
      v45[2] = v45[2] - (v50 - *v45);
      *v45 = v50;
      v42 = 1;
    }
    while ((v44 & 1) != 0);
  }
}

uint64_t SBHScreenTypeForCurrentDevice()
{
  if (SBHScreenTypeForCurrentDevice_onceToken != -1)
    dispatch_once(&SBHScreenTypeForCurrentDevice_onceToken, &__block_literal_global_11);
  return SBHScreenTypeForCurrentDevice_screenType;
}

BOOL SBHScreenTypeIsPhone(unint64_t a1)
{
  return a1 < 0x1D;
}

unint64_t SBHScreenTypeHasHomeButton(unint64_t a1)
{
  return (a1 > 0x2F) | (0x3E0000007uLL >> a1) & 1;
}

SBHMutableIconGridSizeClassSizeMap *SBHDefaultGridSizeClassSizes(uint64_t a1, void *a2)
{
  id v3;
  SBHMutableIconGridSizeClassSizeMap *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __CFString **v8;
  __CFString **v9;
  __CFString **v10;

  v3 = a2;
  v4 = objc_alloc_init(SBHMutableIconGridSizeClassSizeMap);
  -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", 65537, CFSTR("SBHIconGridSizeClassDefault"));
  if (!SBHScreenTypeIsPad(a1) || (objc_msgSend(v3, "isEqualToString:", CFSTR("SBIconLocationAppLibrary")) & 1) == 0)
  {
    v5 = 131074;
    if (SBHScreenTypeIsPad(a1))
    {
      -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", 65537, CFSTR("SBHIconGridSizeClassSmall"));
      -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", 65538, CFSTR("SBHIconGridSizeClassMedium"));
      v6 = 131076;
      v7 = 196610;
      v8 = SBHIconGridSizeClassExtraLarge;
      v9 = SBHIconGridSizeClassNewsLargeTall;
      v10 = SBHIconGridSizeClassLarge;
    }
    else
    {
      v7 = 262148;
      -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", 131074, CFSTR("SBHIconGridSizeClassSmall"));
      v5 = 131076;
      v6 = 393220;
      v8 = SBHIconGridSizeClassNewsLargeTall;
      v9 = SBHIconGridSizeClassLarge;
      v10 = SBHIconGridSizeClassMedium;
    }
    -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", v5, *v10);
    -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", v7, *v9);
    -[SBHMutableIconGridSizeClassSizeMap setGridSize:forGridSizeClass:](v4, "setGridSize:forGridSizeClass:", v6, *v8);
  }

  return v4;
}

BOOL SBHScreenTypeIsPad(uint64_t a1)
{
  return (unint64_t)(a1 - 29) < 0x13;
}

double _SBHDefaultDockAdditionalIconInset(unint64_t a1, char a2)
{
  double result;
  BOOL IsPhone;
  BOOL v4;

  result = 0.0;
  if (a1 <= 0x1C)
  {
    if (((1 << a1) & 0xA251400) != 0)
    {
      if ((a2 & 0x18) != 0)
      {
        IsPhone = SBHScreenTypeIsPhone(a1);
        result = 3.0;
        if (IsPhone)
          return result;
      }
      return 2.0;
    }
    if (((1 << a1) & 0x14400000) != 0)
    {
      if ((a2 & 0x18) == 0)
        return 2.0;
      v4 = SBHScreenTypeIsPhone(a1);
      result = 7.0;
      if (!v4)
        return 2.0;
    }
  }
  return result;
}

uint64_t SBHDefaultScreenSizeBucket(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 0x2D)
    return 0;
  else
    return qword_1D0193258[a1 - 2];
}

double SBHDefaultIconImageSize(unint64_t a1, char a2)
{
  uint64_t v4;

  v4 = SBHDefaultIconSizeBucket(a1, a2);
  return SBHDefaultIconImageSizeForIconSizeBucket(v4, a1, a2);
}

double SBHDefaultIconImageContinuousCornerRadius(double a1)
{
  double v1;

  if (a1 == 56.0)
    return 12.6;
  v1 = 13.5;
  if (a1 != 60.0)
  {
    if (a1 == 64.0)
    {
      return 14.4;
    }
    else if (a1 == 76.0)
    {
      return 17.125;
    }
    else if (a1 == 83.5)
    {
      return 18.75;
    }
    else
    {
      return a1 * 0.225;
    }
  }
  return v1;
}

void sub_1CFF35EF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF36278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id SBIconAccessoryCountedMap()
{
  if (SBIconAccessoryCountedMap_onceToken != -1)
    dispatch_once(&SBIconAccessoryCountedMap_onceToken, &__block_literal_global_75);
  return (id)SBIconAccessoryCountedMap___accessoryCountedMap;
}

uint64_t SBHIconListLayoutMaximumIconCount(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;

  v1 = a1;
  v2 = objc_msgSend(v1, "numberOfRowsForOrientation:", 1);
  v3 = objc_msgSend(v1, "numberOfColumnsForOrientation:", 1);

  return v3 * v2;
}

double SBHIconListLayoutFolderIconGridCellSize(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;

  v1 = a1;
  v2 = 12.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "folderIconVisualConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gridCellSize");
    v2 = v4;

  }
  return v2;
}

double SBHIconListLayoutFolderIconGridCellSpacing(void *a1)
{
  id v1;
  double v2;
  void *v3;
  double v4;

  v1 = a1;
  v2 = 2.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "folderIconVisualConfiguration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "gridCellSpacing");
    v2 = v4;

  }
  return v2;
}

void sub_1CFF3BBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF3BD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBIconViewQueryingHandleMethodRecursion(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t v16;

  v9 = a4;
  v10 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __SBIconViewQueryingHandleMethodRecursion_block_invoke;
  v13[3] = &unk_1E8D89CF8;
  v15 = v10;
  v16 = a3;
  v14 = v9;
  v11 = v10;
  v12 = v9;
  SBIconViewQueryingEnumerateIconViewQueryable(a1, a2, v13);

}

BOOL SBRootFolderPageStateIsSearch(uint64_t a1)
{
  return ((a1 - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

void sub_1CFF3DDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBHStringFromContentVisibility(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E8D8C410[a1];
}

id SBIconViewQueryingBestIconViewForIcon(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v8 = a2;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = a3;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v23 != v12)
          objc_enumerationMutation(v9);
        SBIconViewQueryingIconViewForIconInLocation(v7, v8, *(void **)(*((_QWORD *)&v22 + 1) + 8 * i), a4);
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          v16 = (void *)v14;
          v18 = v9;
          goto LABEL_13;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v11)
        continue;
      break;
    }
  }

  v15 = a4 | 0x10;
  SBIconViewQueryingFirstIconViewForIcon(v7, v8, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    if (objc_msgSend(v8, "isApplicationIcon"))
    {
      objc_msgSend(v8, "applicationBundleID");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __SBIconViewQueryingBestIconViewForIcon_block_invoke;
      v20[3] = &unk_1E8D860C8;
      v21 = v17;
      v18 = v17;
      SBIconViewQueryingFirstIconViewForIconPassingTest(v7, v15, v20);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
    }
    else
    {
      v16 = 0;
    }
  }

  return v16;
}

id SBIconViewQueryingFirstIconViewForIconPassingTest(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v5 = a1;
  v6 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  v23 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke;
  v13[3] = &unk_1E8D89D70;
  v16 = &v18;
  v8 = v5;
  v14 = v8;
  v17 = a2;
  v9 = v6;
  v15 = v9;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __SBIconViewQueryingFirstIconViewForIconPassingTest_block_invoke_2;
  v12[3] = &unk_1E8D85AF8;
  v12[4] = &v18;
  SBIconViewQueryingOptionalMethodImplementation(v8, a2, (uint64_t)sel_firstIconViewWithOptions_iconPassingTest_, v13, v12);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

void sub_1CFF3F508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBIconViewQueryingFirstIconViewForIcon(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v5 = a1;
  v6 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__11;
  v25 = __Block_byref_object_dispose__11;
  v26 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __SBIconViewQueryingFirstIconViewForIcon_block_invoke;
  v16[3] = &unk_1E8D89D20;
  v19 = &v21;
  v17 = v5;
  v18 = v6;
  v20 = a3;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __SBIconViewQueryingFirstIconViewForIcon_block_invoke_2;
  v12[3] = &unk_1E8D89D48;
  v15 = &v21;
  v8 = v17;
  v13 = v8;
  v9 = v18;
  v14 = v9;
  SBIconViewQueryingOptionalMethodImplementation(v8, a3, (uint64_t)sel_firstIconViewForIcon_options_, v16, v12);
  v10 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v10;
}

void sub_1CFF3F698(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF3F97C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFF40DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBRootFolderPageStateVerticalGroupForRootFolderPageState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5)
    return 0;
  else
    return qword_1D0190F30[a1 + 1];
}

BOOL SBRootFolderPageStateVerticalGroupContainsRootFolderPageState(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  if ((unint64_t)(a2 + 1) > 5)
    v2 = 0;
  else
    v2 = qword_1D0190F30[a2 + 1];
  return v2 == a1;
}

uint64_t SBHEnumerateScreenTypes(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  char v5;

  v2 = 0;
  do
  {
    v5 = 0;
    result = (*(uint64_t (**)(uint64_t, uint64_t, char *))(a1 + 16))(a1, v2, &v5);
    if (v5)
      break;
  }
  while (v2++ != 47);
  return result;
}

uint64_t SBHGetScreenSpecification@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;

  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  if ((unint64_t)(result - 3) > 0x2C)
    v2 = 1;
  else
    v2 = qword_1D01958D8[result - 3];
  *(_QWORD *)(a2 + 32) = v2;
  switch(result)
  {
    case 0:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 16);
      v5 = 0x4000000000000000;
      v6 = 568;
      goto LABEL_58;
    case 1:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 32);
      v5 = 0x4000000000000000;
      v6 = 569;
      goto LABEL_58;
    case 2:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 48);
      v5 = 0x4008000000000000;
      v6 = 570;
      goto LABEL_58;
    case 3:
      v10 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
      goto LABEL_22;
    case 4:
      v10 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
LABEL_22:
      *(_OWORD *)a2 = v10;
      v5 = 0x4008000000000000;
      v6 = 2436;
      goto LABEL_58;
    case 5:
      v11 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 112);
      goto LABEL_25;
    case 6:
      v11 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
LABEL_25:
      *(_OWORD *)a2 = v11;
      v5 = 0x4008000000000000;
      v6 = 2688;
      goto LABEL_58;
    case 7:
      v12 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 112);
      goto LABEL_28;
    case 8:
      v12 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
LABEL_28:
      *(_OWORD *)a2 = v12;
      v5 = 0x4000000000000000;
      v6 = 1792;
      goto LABEL_58;
    case 9:
    case 15:
      v4 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
      goto LABEL_9;
    case 10:
    case 16:
      v4 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
LABEL_9:
      *(_OWORD *)a2 = v4;
      v5 = 0x4008000000000000;
      v6 = 2340;
      goto LABEL_58;
    case 11:
    case 17:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 96);
      goto LABEL_11;
    case 12:
    case 18:
      v3 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
LABEL_11:
      *(_OWORD *)a2 = v3;
      v5 = 0x4008000000000000;
      v6 = 2532;
      goto LABEL_58;
    case 13:
    case 19:
      v7 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 128);
      goto LABEL_14;
    case 14:
    case 20:
      v7 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
LABEL_14:
      *(_OWORD *)a2 = v7;
      v5 = 0x4008000000000000;
      v6 = 2778;
      goto LABEL_58;
    case 21:
      v13 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 144);
      goto LABEL_31;
    case 22:
      v13 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
LABEL_31:
      *(_OWORD *)a2 = v13;
      v5 = 0x4008000000000000;
      v6 = 2556;
      goto LABEL_58;
    case 23:
      v14 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 160);
      goto LABEL_34;
    case 24:
      v14 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
LABEL_34:
      *(_OWORD *)a2 = v14;
      v5 = 0x4008000000000000;
      v6 = 2796;
      goto LABEL_58;
    case 25:
      v15 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 176);
      goto LABEL_37;
    case 26:
      v15 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 64);
LABEL_37:
      *(_OWORD *)a2 = v15;
      v5 = 0x4008000000000000;
      v6 = 2622;
      goto LABEL_58;
    case 27:
      v16 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 192);
      goto LABEL_40;
    case 28:
      v16 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 80);
LABEL_40:
      *(_OWORD *)a2 = v16;
      v5 = 0x4008000000000000;
      v6 = 2868;
      goto LABEL_58;
    case 29:
    case 30:
    case 41:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 208);
      *(_QWORD *)(a2 + 16) = 0x4000000000000000;
      return result;
    case 31:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 224);
      v5 = 0x4000000000000000;
      v6 = 2160;
      goto LABEL_58;
    case 32:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 240);
      v5 = 0x4000000000000000;
      v6 = 2224;
      goto LABEL_58;
    case 33:
    case 40:
      v8 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 256);
      goto LABEL_50;
    case 34:
      *(_OWORD *)a2 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 272);
      v5 = 0x4000000000000000;
      v6 = 2266;
      goto LABEL_58;
    case 35:
    case 36:
      v9 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 320);
      goto LABEL_45;
    case 37:
      v9 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 336);
LABEL_45:
      *(_OWORD *)a2 = v9;
      v5 = 0x4000000000000000;
      v6 = 2360;
      goto LABEL_58;
    case 38:
      v17 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 352);
      goto LABEL_48;
    case 39:
      v17 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 368);
LABEL_48:
      *(_OWORD *)a2 = v17;
      v5 = 0x4000000000000000;
      v6 = 2388;
      goto LABEL_58;
    case 42:
      v8 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 432);
LABEL_50:
      *(_OWORD *)a2 = v8;
      v5 = 0x4000000000000000;
      v6 = 2732;
      goto LABEL_58;
    case 43:
      v18 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 384);
      goto LABEL_53;
    case 44:
      v18 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 400);
LABEL_53:
      *(_OWORD *)a2 = v18;
      v5 = 0x4000000000000000;
      v6 = 2420;
      goto LABEL_58;
    case 45:
      v19 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 448);
      goto LABEL_57;
    case 46:
      v19 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 304);
      goto LABEL_57;
    case 47:
      v19 = *(_OWORD *)(MEMORY[0x1E0DAB260] + 464);
LABEL_57:
      *(_OWORD *)a2 = v19;
      v5 = 0x4000000000000000;
      v6 = 2752;
LABEL_58:
      *(_QWORD *)(a2 + 16) = v5;
      *(_QWORD *)(a2 + 24) = v6;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBHScreenSpecificationEqualToScreenSpecification(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;

  v3 = *(double *)(a1 + 16) == *(double *)(a2 + 16);
  if (*(double *)a1 != *(double *)a2)
    v3 = 0;
  result = *(double *)(a1 + 8) == *(double *)(a2 + 8) && v3;
  v5 = *(_QWORD *)(a1 + 24);
  if (v5)
  {
    v6 = *(_QWORD *)(a2 + 24);
    if (v6)
      v7 = v5 == v6;
    else
      v7 = 1;
    if (v7)
      result = result;
    else
      result = 0;
  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8 != -1)
  {
    v9 = *(_QWORD *)(a2 + 32);
    v10 = ((v8 != 2) ^ (v9 == 2)) & result;
    if (v9 == -1)
      return result;
    else
      return v10;
  }
  return result;
}

double SBHIconListLayoutDefaultEditingAnimationStrengthForGridSize(int a1)
{
  int v1;

  v1 = HIWORD(a1);
  if (HIWORD(a1) <= (unsigned __int16)a1)
    v1 = (unsigned __int16)a1;
  if (v1 <= 1)
    v1 = 1;
  return 1.0 / (double)v1;
}

void SBHEnumerateIconGridSizeClasses(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enumerateGridSizeClassesUsingBlock:", v1);

}

uint64_t _SBHDefaultNumberOfRowsAndColumnsInFolders(uint64_t a1)
{
  if (SBHScreenTypeIsPad(a1))
    return 4;
  else
    return 3;
}

id _SBHDefaultIconGridSizeClassEditingAnimationStrengths(void *a1, uint64_t a2)
{
  void *v3;
  _BOOL4 IsPad;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  BOOL v19;

  SBHDefaultGridSizeClassSizes(a2, a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsPad = SBHScreenTypeIsPad(a2);
  v5 = IsPad;
  if (IsPad)
  {
    +[SBHIconGridSizeClassDomain builtInDomain](SBHIconGridSizeClassDomain, "builtInDomain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "allGridSizeClasses");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = ___SBHDefaultIconGridSizeClassEditingAnimationStrengths_block_invoke;
  v15[3] = &unk_1E8D8C260;
  v19 = v5;
  v16 = v3;
  v17 = v7;
  v9 = v8;
  v18 = v9;
  v10 = v7;
  v11 = v3;
  SBHEnumerateIconGridSizeClasses(v15);
  v12 = v18;
  v13 = v9;

  return v13;
}

uint64_t _SBHEquivalentPhoneScreenTypeForScreenType(unint64_t a1)
{
  if (a1 > 0x2F)
    return 0;
  else
    return qword_1D0193A00[a1];
}

double SBHDefaultWidgetContentMargins(unint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  _BYTE v6[16];

  _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  SBHGetScreenSpecification(a1, (uint64_t)v6);
  BSFloatRoundForScale();
  v4 = v3;

  return v4;
}

SBHMutableIconGridSizeClassIconImageInfoMap *_SBHDefaultIconGridSizeClassIconImageInfos(unint64_t a1, char a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SBHMutableIconGridSizeClassIconImageInfoMap *v19;
  double v21;
  double v22;

  v4 = SBHDefaultIconImageScale(a1, a2);
  switch(a1)
  {
    case 0uLL:
    case 4uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
      goto LABEL_13;
    case 1uLL:
      v5 = 148.0;
      v6 = 324.0;
      v7 = 321.0;
      v8 = 500.0;
      goto LABEL_14;
    case 2uLL:
      v5 = 157.0;
      v6 = 351.0;
      v7 = 348.0;
      v8 = 545.0;
      goto LABEL_14;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x14uLL:
    case 0x18uLL:
    case 0x1CuLL:
      v5 = 155.0;
      v6 = 345.0;
      v7 = 329.0;
      v8 = 535.0;
      goto LABEL_14;
    case 5uLL:
    case 7uLL:
      v5 = 169.0;
      v6 = 379.0;
      v7 = 360.0;
      v8 = 589.0;
      goto LABEL_14;
    case 0xBuLL:
    case 0x11uLL:
    case 0x15uLL:
      if ((a2 & 0x10) != 0)
        goto LABEL_21;
      v10 = dbl_1D0193DA0[a1 == 21];
      v5 = 158.0;
      v6 = 354.0;
      v7 = 338.0;
      v8 = 550.0;
      goto LABEL_25;
    case 0xDuLL:
    case 0x13uLL:
    case 0x17uLL:
    case 0x1BuLL:
      v5 = 170.0;
      v6 = 382.0;
      v7 = 364.0;
      v8 = 594.0;
      goto LABEL_14;
    case 0x16uLL:
    case 0x1AuLL:
      if ((a2 & 0x10) == 0)
      {
LABEL_13:
        v5 = 141.0;
        v6 = 311.0;
        v7 = 292.0;
        v8 = 481.0;
        goto LABEL_14;
      }
      v5 = 138.0;
      v10 = 290.0;
      *(double *)&v11 = 487.0;
      goto LABEL_37;
    case 0x19uLL:
      if ((a2 & 0x10) != 0)
      {
LABEL_21:
        v5 = 165.0;
        v10 = 349.0;
        *(double *)&v11 = 571.0;
LABEL_37:
        v21 = *(double *)&v11;
        v22 = v10;
        v7 = v10;
      }
      else
      {
        v5 = 162.0;
        v6 = 366.0;
        v7 = 344.0;
        v8 = 550.0;
LABEL_14:
        v10 = v7;
LABEL_25:
        if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1))
        {
          UIRoundToScale();
          v5 = v5 + v12;
          v10 = v10 + v12;
          v6 = v6 + v12;
          v7 = v7 + v12;
          v8 = v8 + v12;
        }
        v21 = v8;
        v22 = v6;
      }
      v13 = SBHDefaultIconSizeBucket(a1, a2);
      v14 = SBHDefaultIconImageSizeForIconSizeBucket(v13, a1, a2);
      v16 = v15;
      if (v14 == 56.0)
      {
        v17 = 12.6;
      }
      else
      {
        v17 = 13.5;
        if (v14 != 60.0)
        {
          if (v14 == 64.0)
          {
            v17 = 14.4;
          }
          else if (v14 == 76.0)
          {
            v17 = 17.125;
          }
          else if (v14 == 83.5)
          {
            v17 = 18.75;
          }
          else
          {
            v17 = v14 * 0.225;
          }
        }
      }
      v18 = SBHDefaultWidgetContinuousCornerRadius(a1);
      v19 = objc_alloc_init(SBHMutableIconGridSizeClassIconImageInfoMap);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"), v14, v16, v4, v17);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"), v5, v5, v4, v18);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"), v10, v5, v4, v18);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge"), v10, v22, v4, v18);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassExtraLarge"), v7, v22, v4, v18);
      -[SBHMutableIconGridSizeClassIconImageInfoMap setIconImageInfo:forGridSizeClass:](v19, "setIconImageInfo:forGridSizeClass:", CFSTR("SBHIconGridSizeClassNewsLargeTall"), v10, v21, v4, v18);
      return v19;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x22uLL:
    case 0x29uLL:
    case 0x2EuLL:
      v5 = 120.0;
      v6 = 260.0;
      v7 = 540.0;
      *(double *)&v9 = 400.0;
      goto LABEL_6;
    case 0x1FuLL:
      v5 = 124.0;
      v6 = 272.0;
      v7 = 568.0;
      v8 = 420.0;
      goto LABEL_24;
    case 0x20uLL:
      v5 = 132.0;
      v6 = 288.0;
      v7 = 600.0;
      v8 = 444.0;
      goto LABEL_24;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2DuLL:
      v5 = 160.0;
      v6 = 356.0;
      v7 = 748.0;
      v8 = 552.0;
      goto LABEL_24;
    case 0x23uLL:
    case 0x24uLL:
    case 0x26uLL:
    case 0x2BuLL:
      v5 = 136.0;
      v6 = 300.0;
      v7 = 628.0;
      *(double *)&v9 = 464.0;
LABEL_6:
      v8 = *(double *)&v9;
      goto LABEL_24;
    case 0x25uLL:
    case 0x27uLL:
    case 0x2CuLL:
      v5 = 162.0;
      v6 = 350.0;
      v7 = 726.0;
      v8 = 538.0;
      goto LABEL_24;
    case 0x2AuLL:
    case 0x2FuLL:
      v5 = 188.0;
      v6 = 412.0;
      v7 = 860.0;
      v8 = 636.0;
LABEL_24:
      v10 = v6;
      goto LABEL_25;
    default:
      v8 = 0.0;
      v7 = 0.0;
      v6 = 0.0;
      v10 = 0.0;
      v5 = 0.0;
      goto LABEL_25;
  }
}

double SBHDefaultIconImageSizeForIconSizeBucket(uint64_t a1, unint64_t a2, char a3)
{
  double v3;
  uint64_t v4;
  double v5;

  v3 = 0.0;
  if (a1 <= 151)
  {
    if (a1 > 127)
    {
      if (a1 == 128)
        goto LABEL_19;
      if (a1 == 136)
        v3 = 68.0;
    }
    else
    {
      if (a1 == 112)
      {
LABEL_18:
        v4 = 0x404C000000000000;
        goto LABEL_21;
      }
      if (a1 == 120)
      {
LABEL_10:
        v4 = 0x404E000000000000;
LABEL_21:
        v3 = *(double *)&v4;
      }
    }
  }
  else
  {
    if (a1 > 1679)
    {
      if (a1 != 1920)
      {
        if (a1 != 1800)
        {
          if (a1 != 1680)
            goto LABEL_22;
          goto LABEL_18;
        }
        goto LABEL_10;
      }
LABEL_19:
      v4 = 0x4050000000000000;
      goto LABEL_21;
    }
    if (a1 == 152)
    {
      v4 = 0x4053000000000000;
      goto LABEL_21;
    }
    if (a1 == 167)
      v3 = 83.5;
  }
LABEL_22:
  v5 = 0.0;
  if ((a3 & 0x18) != 0 && a2 <= 0x1C)
    v5 = dbl_1D0193538[a2];
  return v3 + v5;
}

double SBHDefaultWidgetContinuousCornerRadius(unint64_t a1)
{
  double result;

  result = 0.0;
  if (a1 <= 0x2F)
    return dbl_1D0193620[a1];
  return result;
}

double SBHDefaultIconImageScale(uint64_t a1, char a2)
{
  uint64_t v2;
  double result;
  double v4;

  v2 = SBHDefaultIconSizeBucket(a1, a2);
  result = 0.0;
  if (v2 > 1679)
  {
    if (v2 == 1680 || v2 == 1800 || v2 == 1920)
      return 3.0;
  }
  else
  {
    v4 = 2.0;
    if (((1 << (v2 - 112)) & 0x80010001010101) == 0)
      v4 = 0.0;
    if ((unint64_t)(v2 - 112) <= 0x37)
      return v4;
  }
  return result;
}

uint64_t SBHDefaultIconSizeBucket(uint64_t a1, char a2)
{
  uint64_t result;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;

  switch(a1)
  {
    case 0:
      return 112;
    case 1:
    case 8:
      return 120;
    case 2:
    case 3:
    case 6:
    case 9:
    case 11:
    case 14:
    case 15:
    case 17:
    case 20:
    case 21:
    case 24:
    case 25:
    case 28:
      return 1800;
    case 4:
    case 10:
    case 12:
    case 16:
    case 18:
    case 22:
    case 26:
      return 1680;
    case 5:
    case 13:
    case 19:
    case 23:
    case 27:
      return 1920;
    case 7:
      return 128;
    case 29:
    case 31:
    case 32:
    case 35:
    case 36:
    case 37:
    case 38:
    case 39:
    case 41:
    case 43:
    case 44:
    case 46:
      v3 = (a2 & 8) == 0;
      v4 = 152;
      v5 = 120;
      goto LABEL_9;
    case 30:
    case 34:
      v3 = (a2 & 8) == 0;
      v4 = 152;
      v5 = 128;
      goto LABEL_9;
    case 33:
    case 40:
    case 42:
    case 45:
    case 47:
      v3 = (a2 & 8) == 0;
      v4 = 167;
      v5 = 136;
LABEL_9:
      if (v3)
        result = v5;
      else
        result = v4;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

id SBLogIconImageCache()
{
  if (SBLogIconImageCache_onceToken != -1)
    dispatch_once(&SBLogIconImageCache_onceToken, &__block_literal_global_2_0);
  return (id)SBLogIconImageCache___logObj;
}

uint64_t SBIconViewQueryingDisplayingIconView(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a1;
  v6 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __SBIconViewQueryingDisplayingIconView_block_invoke;
  v16[3] = &unk_1E8D89D20;
  v19 = &v21;
  v17 = v5;
  v18 = v6;
  v20 = a3;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __SBIconViewQueryingDisplayingIconView_block_invoke_2;
  v12[3] = &unk_1E8D89D48;
  v15 = &v21;
  v8 = v17;
  v13 = v8;
  v9 = v18;
  v14 = v9;
  SBIconViewQueryingOptionalMethodImplementation(v8, a3, (uint64_t)sel_isDisplayingIconView_options_, v16, v12);
  v10 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void sub_1CFF454D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1CFF45DD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF45ED0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogProactiveAppLibrary()
{
  if (SBLogProactiveAppLibrary_onceToken != -1)
    dispatch_once(&SBLogProactiveAppLibrary_onceToken, &__block_literal_global_12_0);
  return (id)SBLogProactiveAppLibrary___logObj;
}

id NSDictionaryFromSBHLibraryCategoryMapRefreshOptions(unint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x1E0C80C00];
  v1 = a1 & 1;
  v2 = (a1 >> 2) & 1;
  v3 = (a1 >> 3) & 1;
  v10[0] = CFSTR("fetch proactive categories");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (a1 >> 1) & 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v4;
  v10[1] = CFSTR("fetch categories");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[1] = v5;
  v10[2] = CFSTR("startFromScratch");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v6;
  v10[3] = CFSTR("refreshNow");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[3] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1CFF46A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF46F38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, id *a14, id *a15)
{
  uint64_t v15;

  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak(a15);
  objc_destroyWeak((id *)(v15 - 112));
  _Unwind_Resume(a1);
}

void sub_1CFF4743C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1CFF48324(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF49648(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getDMFApplicationPolicyMonitorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!DeviceManagementLibraryCore_frameworkLibrary)
  {
    DeviceManagementLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!DeviceManagementLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("DMFApplicationPolicyMonitor");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getDMFApplicationPolicyMonitorClass_block_invoke_cold_1();
    free(v3);
  }
  getDMFApplicationPolicyMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SBLogWidgetIntent()
{
  if (SBLogWidgetIntent_onceToken != -1)
    dispatch_once(&SBLogWidgetIntent_onceToken, &__block_literal_global_32);
  return (id)SBLogWidgetIntent___logObj;
}

id SBHStringForIconGridSizeClass(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "descriptionForGridSizeClass:", v1);
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (!v3)
    v3 = v1;

  return v3;
}

uint64_t SBHIconGridSizeClassToStackLayoutSize(void *a1)
{
  void *v1;
  uint64_t v2;

  SBHGetIconGridSizeClassInfoValue(a1, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyATXStackLayoutSize"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

id SBHConfigurationIdentifierFromDataSource(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "configurationStorageIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1CFF4ECC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF4EF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF4F008(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id SBHContainerBundleIdentifierForDataSource(void *a1)
{
  id v1;
  void *v2;
  char isKindOfClass;
  void *v4;
  char v5;
  void *v6;

  v1 = a1;
  objc_opt_self();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0
    || (objc_opt_self(),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_opt_isKindOfClass(),
        v4,
        (v5 & 1) != 0))
  {
    objc_msgSend(v1, "containerBundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

double SBHUnionFloatRange(double result, double a2, double a3)
{
  if (result >= a3)
    return a3;
  return result;
}

uint64_t SBHStringFromFloatRange(double a1, double a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%f, %f}"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

void sub_1CFF5F5EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF5FAC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF601D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF60B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF61744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF62FF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF63A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF64218(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF64D80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF65154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1CFF65754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF65CEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF65EDC(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 64));
  _Unwind_Resume(a1);
}

void sub_1CFF6635C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF66A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF670D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF6727C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF67520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1CFF676B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1CFF677C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void SBIconResizeHandleMetricsForIconResizingSettings(void *a1@<X0>, uint64_t a2@<X8>)
{
  double v3;
  double v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  __int128 v24;
  id v25;

  v25 = a1;
  v3 = 0.0;
  if ((objc_msgSend(v25, "resizeHandleFollowsIconCornerRadius") & 1) == 0)
  {
    objc_msgSend(v25, "resizeHandleCornerRadius");
    v3 = v4;
  }
  v5 = objc_msgSend(v25, "resizeHandleUsesTruncatedSectorHitArea");
  if (v5)
  {
    objc_msgSend(v25, "resizeHandleTruncatedSectorHitAreaTopInset");
    v7 = v6;
    objc_msgSend(v25, "resizeHandleTruncatedSectorHitAreaLeadingInset");
    v9 = v8;
    objc_msgSend(v25, "resizeHandleTruncatedSectorHitAreaBottomInset");
    v11 = v10;
    objc_msgSend(v25, "resizeHandleTruncatedSectorHitAreaTrailingInset");
  }
  else
  {
    objc_msgSend(v25, "resizeHandleHitAreaTopInset");
    v7 = v13;
    objc_msgSend(v25, "resizeHandleHitAreaLeadingInset");
    v9 = v14;
    objc_msgSend(v25, "resizeHandleHitAreaBottomInset");
    v11 = v15;
    objc_msgSend(v25, "resizeHandleHitAreaTrailingInset");
  }
  v16 = v12;
  objc_msgSend(v25, "resizeHandleLineWidth");
  v18 = v17;
  objc_msgSend(v25, "resizeHandleLineLength");
  v20 = v19;
  objc_msgSend(v25, "resizeHandleHorizontalOffset");
  v22 = v21;
  objc_msgSend(v25, "resizeHandleVerticalOffset");
  *(_QWORD *)&v24 = v7;
  *((_QWORD *)&v24 + 1) = v9;
  SBIconResizeHandleMetricsMake(v5, a2, v18, v20, v3, v22, v23, v24, v11, v16);

}

void sub_1CFF72EC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBHIconListLayoutSupportedIconGridSizeClasses(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v1, "supportedIconGridSizeClasses");
  else
    +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

uint64_t SBHIconListLayoutSupportsIconGridSizeClass(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  SBHIconListLayoutSupportedIconGridSizeClasses(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsGridSizeClass:", v3);

  return v5;
}

BOOL SBHIconListLayoutListGridSizeMatchesListLayout(void *a1, void *a2, uint64_t a3)
{
  id v5;

  v5 = a2;
  LODWORD(a1) = SBHIconListLayoutListGridSize(a1, a3);
  LODWORD(a3) = SBHIconListLayoutListGridSize(v5, a3);

  return SBHIconGridSizeEqualToIconGridSize((int)a1, a3);
}

BOOL SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(void *a1, void *a2, void *a3, uint64_t a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _BOOL8 v11;

  v7 = a3;
  v8 = a2;
  objc_msgSend(a1, "layoutForIconLocation:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutForIconLocation:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = SBHIconListLayoutListGridSizeMatchesListLayout(v9, v10, a4);
  return v11;
}

double SBHIconListLayoutListIconSpacing(void *a1, uint64_t a2)
{
  return SBHIconListLayoutListIconSpacingWithDefault(a1, a2, *MEMORY[0x1E0C9D820]);
}

double SBHIconListLayoutListIconSpacingWithDefault(void *a1, uint64_t a2, double a3)
{
  id v5;
  double v6;

  v5 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "iconSpacingForOrientation:", a2);
    a3 = v6;
  }

  return a3;
}

double SBHIconListLayoutExtraIconImageSizeForGridSizeClass(void *a1, uint64_t a2, void *a3)
{
  double v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;

  v5 = *MEMORY[0x1E0C9D820];
  v6 = a3;
  v7 = a1;
  v8 = SBHIconListLayoutListIconSpacingWithDefault(v7, a2, v5);
  v10 = SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacing(v7, v6, v8, v9, 0.0);

  return v10;
}

double SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacing(void *a1, void *a2, double a3, double a4, double a5)
{
  id v8;
  __CFString *v9;
  __CFString *v10;
  double v11;
  void *v12;
  int v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int v20;
  double v21;

  v8 = a1;
  v9 = a2;
  v10 = v9;
  v11 = *MEMORY[0x1E0C9D820];
  if (CFSTR("SBHIconGridSizeClassDefault") != v9
    && (-[__CFString isEqualToString:](v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")) & 1) == 0)
  {
    SBHIconListLayoutIconGridSizeClassSizes(v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOWORD(v13) = objc_msgSend(v12, "gridSizeForGridSizeClass:", v10);
    v14 = SBHIconListLayoutIconImageInfoForGridSizeClass(v8, CFSTR("SBHIconGridSizeClassDefault"));
    v16 = v15;
    v17 = SBHIconListLayoutIconImageInfoForGridSizeClass(v8, v10);
    if (a5 <= 0.0)
    {
      v13 = (unsigned __int16)v13;
      v20 = (unsigned __int16)v13 - 1;
      v21 = 0.0;
    }
    else
    {
      objc_msgSend(v8, "layoutInsetsForOrientation:", 1);
      v13 = (unsigned __int16)v13;
      v20 = (unsigned __int16)v13 - 1;
      v21 = SBHIconListLayoutCalculateHorizontalColumnBump(v20, objc_msgSend(v8, "numberOfColumnsForOrientation:", 1), v14, a3, a5 - v18 - v19, v16);
    }
    v11 = v17 - (a3 * (double)v20 + v14 * (double)v13 + v21);

  }
  return v11;
}

double SBHIconListLayoutLargestExtraIconImageSize(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  double v5;

  v3 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SBHIconListLayoutLargestExtraIconImageSizeInDomain(v3, a2, v4);

  return v5;
}

double SBHIconListLayoutLargestExtraIconImageSizeInDomain(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  __int128 *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  double v12;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  void *v22;
  __int128 v23;

  v5 = a1;
  v6 = a3;
  v7 = (__int128 *)MEMORY[0x1E0C9D820];
  v8 = SBHIconListLayoutListIconSpacingWithDefault(v5, a2, *MEMORY[0x1E0C9D820]);
  v10 = v9;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x3010000000;
  v22 = &unk_1D01C8D52;
  v23 = *v7;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __SBHIconListLayoutLargestExtraIconImageSizeInDomain_block_invoke;
  v14[3] = &unk_1E8D85A80;
  v11 = v5;
  v17 = v8;
  v18 = v10;
  v15 = v11;
  v16 = &v19;
  objc_msgSend(v6, "enumerateGridSizeClassesUsingBlock:", v14);
  v12 = v20[4];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void sub_1CFF73DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSize(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = CFSTR("SBHIconGridSizeClassDefault");
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithLargestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E8D85AA8;
  v5 = v3;
  v9 = v5;
  v10 = v12;
  v11 = &v13;
  objc_msgSend(v4, "enumerateGridSizeClassesUsingBlock:", v8);
  v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1CFF73FD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSize(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = CFSTR("SBHIconGridSizeClassDefault");
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithWidestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E8D85AA8;
  v5 = v3;
  v9 = v5;
  v10 = v12;
  v11 = &v13;
  objc_msgSend(v4, "enumerateGridSizeClassesUsingBlock:", v8);
  v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1CFF741E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

id SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSize(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain(v1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  _QWORD *v10;
  uint64_t *v11;
  _QWORD v12[4];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  __CFString *v18;

  v3 = a1;
  v4 = a2;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  v18 = CFSTR("SBHIconGridSizeClassDefault");
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __SBHIconListLayoutLookUpGridSizeClassWithTallestIconImageSizeInDomain_block_invoke;
  v8[3] = &unk_1E8D85AA8;
  v5 = v3;
  v9 = v5;
  v10 = v12;
  v11 = &v13;
  objc_msgSend(v4, "enumerateGridSizeClassesUsingBlock:", v8);
  v6 = (id)v14[5];

  _Block_object_dispose(v12, 8);
  _Block_object_dispose(&v13, 8);

  return v6;
}

void sub_1CFF743EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

double SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(void *a1, uint64_t a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v3 = a1;
  SBHIconListLayoutExtraIconImageSizeForGridSizeClass(v3, a2, CFSTR("SBHIconGridSizeClassLarge"));
  v5 = v4 * 0.5;
  objc_msgSend(v3, "layoutInsetsForOrientation:", a2);
  v7 = v6;

  return v7 - v5;
}

double SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsetsWithIconSpacing(void *a1, uint64_t a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v9 = a1;
  SBHIconListLayoutIconGridSizeClassSizes(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("SBHIconGridSizeClassLarge");
  if ((objc_msgSend(v10, "hasGridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge")) & 1) != 0
    || (v11 = CFSTR("SBHIconGridSizeClassMedium"),
        (objc_msgSend(v10, "hasGridSizeForGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium")) & 1) != 0))
  {
    v12 = v11;
    SBHIconListLayoutExtraIconImageSizeForGridSizeClassAndSpacing(v9, v12, a3, a4, a5);
    v14 = v13 * 0.5;
    objc_msgSend(v9, "layoutInsetsForOrientation:", a2);
    v16 = v15 - v14;

  }
  else
  {
    v16 = *MEMORY[0x1E0DC49E8];
  }

  return v16;
}

uint64_t SBHIconListLayoutShowsLabels(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "showsLabels");
  else
    v2 = 1;

  return v2;
}

uint64_t SBHIconListLayoutIconSpacingAxisMatchingBehavior(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "iconSpacingAxisMatchingBehavior");
  else
    v2 = 0;

  return v2;
}

id SBHIconListLayoutLabelVisualConfiguration(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  _BOOL4 IsBoldTextEnabled;
  void *v5;

  v1 = (void *)*MEMORY[0x1E0DC4730];
  v2 = a1;
  objc_msgSend(v1, "preferredContentSizeCategory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  IsBoldTextEnabled = UIAccessibilityIsBoldTextEnabled();
  SBHIconListLayoutLabelVisualConfigurationForContentSizeCategory(v2, v3, IsBoldTextEnabled);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

SBHIconLabelVisualConfiguration *SBHIconListLayoutLabelVisualConfigurationForContentSizeCategory(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  SBHIconLabelVisualConfiguration *v7;
  SBHIconLabelVisualConfiguration *v8;

  v5 = a1;
  v6 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "labelVisualConfigurationForContentSizeCategory:options:", v6, a3);
    v7 = (SBHIconLabelVisualConfiguration *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  }
  v8 = v7;

  return v8;
}

__CFString *SBHIconListLayoutRotatedLayoutGridCellClusterSizeClass(void *a1)
{
  id v1;
  __CFString *v2;
  __CFString *v3;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "rotatedLayoutClusterGridSizeClass");
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = CFSTR("SBHIconGridSizeClassDefault");
  }
  v3 = v2;

  return v3;
}

double SBHIconListLayoutEditingAnimationStrengthForGridSizeClass(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  unsigned int v8;
  int v9;

  v3 = a2;
  v4 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "editingAnimationStrengthForGridSizeClass:", v3);
    v6 = v5;
  }
  else
  {
    SBHIconListLayoutIconGridSizeClassSizes(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "gridSizeForGridSizeClass:", v3);
    v9 = HIWORD(v8);
    if (HIWORD(v8) <= (unsigned __int16)v8)
      v9 = (unsigned __int16)v8;
    if (v9 <= 1)
      v9 = 1;
    v6 = 1.0 / (double)v9;
    v4 = v7;
  }

  return v6;
}

void sub_1CFF77738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUISuggestionsWidgetViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary)
  {
    AppPredictionUIWidgetLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("APUISuggestionsWidgetViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getAPUISuggestionsWidgetViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CFF77B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBVisibleColumnRangeMaxIconListIndex(uint64_t *a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *a1;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v2 != 0x7FFFFFFFFFFFFFFFLL)
    return a1[2] + 1;
  return result;
}

uint64_t SBVisibleColumnRangeGetNextColumn(unint64_t *a1, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v11;
  BOOL v12;
  unint64_t v13;

  result = 0;
  if (a2 && a3)
  {
    v7 = *a1;
    v8 = a1[2];
    v9 = *a1 != 0x7FFFFFFFFFFFFFFFLL && v8 >= v7;
    if (v9
      && ((v10 = a1[3], v11 = a1[1], v7 == v8) ? (v12 = v10 >= v11) : (v12 = 1),
          v12 && (v10 + 1 < a2 ? (v13 = v10 + 1) : (++v8, v13 = 0), v8 < a3)))
    {
      if (a4)
        *a4 = v8;
      if (a5)
        *a5 = v13;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t SBVisibleColumnRangeGetPreviousColumn(unint64_t *a1, unint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v10;

  v5 = 0;
  if (a2 && a3)
  {
    v6 = *a1;
    if (*a1 != 0x7FFFFFFFFFFFFFFFLL
      && (v6 || a1[1])
      && (v7 = a1[2], v7 >= v6)
      && ((v8 = a1[1], v6 != v7) || a1[3] >= v8))
    {
      if (v8)
        v10 = a1[1];
      else
        v10 = a2;
      if (a4)
        *a4 = (__PAIR128__(v6, v8) - 1) >> 64;
      if (a5)
        *a5 = v10 - 1;
      return 1;
    }
    else
    {
      return 0;
    }
  }
  return v5;
}

BOOL SBVisibleColumnRangeContainsIconListIndex(unint64_t *a1, unint64_t a2)
{
  unint64_t v2;
  unint64_t v3;

  v2 = *a1;
  v3 = a1[2];
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL || v3 < v2)
    return 0;
  return (v2 != v3 || a1[3] >= a1[1]) && v2 <= a2 && v3 >= a2;
}

void SBVisibleColumnRangeEnumerateContainedIconListIndexes(unint64_t *a1, uint64_t a2, void *a3)
{
  unint64_t v5;
  unint64_t v6;
  BOOL v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  void (**v13)(id, uint64_t, uint64_t, uint64_t);

  v13 = a3;
  v5 = *a1;
  v6 = a1[2];
  if (*a1 != 0x7FFFFFFFFFFFFFFFLL && v6 >= v5)
  {
    v8 = a1[3] < a1[1] && v5 == v6;
    v9 = v6 + 1;
    if (!v8 && v5 < v9)
    {
      do
      {
        if (v5 == *a1)
        {
          v11 = a1[1];
          v12 = a2 - v11;
        }
        else
        {
          v11 = 0;
          if (v5 == a1[2])
            v12 = a1[3];
          else
            v12 = -1;
        }
        v13[2](v13, v5++, v11, v12);
      }
      while (v9 != v5);
    }
  }

}

BOOL SBVisibleColumnRangeContainsVisibleColumnRange(_QWORD *a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  _BOOL8 result;

  result = 0;
  if (*a1 <= *a2 && (*a1 != *a2 || a1[1] <= a2[1]))
  {
    v2 = a1[2];
    v3 = a2[2];
    if (v2 >= v3 && (v2 != v3 || a1[3] >= a2[3]))
      return 1;
  }
  return result;
}

uint64_t *SBVisibleColumnRangeUnion@<X0>(uint64_t *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  v3 = *result;
  if ((unint64_t)*result >= *a2)
  {
    if ((unint64_t)*result <= *a2)
    {
      *(_QWORD *)a3 = v3;
      v4 = result[1];
      if (v4 >= a2[1])
        v4 = a2[1];
    }
    else
    {
      *(_QWORD *)a3 = *a2;
      v4 = a2[1];
    }
  }
  else
  {
    *(_QWORD *)a3 = v3;
    v4 = result[1];
  }
  *(_QWORD *)(a3 + 8) = v4;
  v5 = result[2];
  v6 = a2[2];
  if (v5 <= v6)
  {
    if (v5 >= v6)
    {
      *(_QWORD *)(a3 + 16) = v5;
      v7 = result[3];
      if (v7 <= a2[3])
        v7 = a2[3];
    }
    else
    {
      *(_QWORD *)(a3 + 16) = v6;
      v7 = a2[3];
    }
  }
  else
  {
    *(_QWORD *)(a3 + 16) = v5;
    v7 = result[3];
  }
  *(_QWORD *)(a3 + 24) = v7;
  return result;
}

void sub_1CFF78700(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
  {
    ControlCenterUIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ControlCenterUIKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CCUICustomContentModuleBackgroundViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getCCUICustomContentModuleBackgroundViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                                + 24);
  return result;
}

void sub_1CFF7B500(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF7C344(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7C4B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7C5F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7C77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7C89C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7CC94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7CDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7CF2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7D484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7EB40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF7EDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF807C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF82568(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFF83F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF86798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF8B248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF8C6D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFF8CAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHScreenTypeForDeviceAndDisplayContexts(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  id v20;
  uint64_t v21;
  _QWORD v23[4];
  id v24;

  v3 = a1;
  v4 = *MEMORY[0x1E0DC5CD0];
  v5 = a2;
  v6 = objc_msgSend(v3, "deviceInfoIntegerValueForKey:", v4);
  LODWORD(v4) = objc_msgSend(v3, "deviceInfoIntegerValueForKey:", *MEMORY[0x1E0DC5CB8]);
  v7 = objc_msgSend(v5, "artworkSubtype");
  objc_msgSend(v5, "displayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  objc_msgSend(v5, "displayConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "pointScale");
  v19 = v18;

  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __SBHScreenTypeForDeviceAndDisplayContexts_block_invoke_3;
  v23[3] = &unk_1E8D866B0;
  v24 = v3;
  v20 = v3;
  v21 = _SBHScreenTypeLookup(v4, v6, v7, &__block_literal_global_11_0, &__block_literal_global_12, v23, v10, v12, v14, v16, v19);

  return v21;
}

uint64_t SBHScreenTypeLookup(unsigned int a1, uint64_t a2, uint64_t a3, int a4, double a5, double a6, double a7, double a8, double a9)
{
  _QWORD v10[4];
  __int16 v11;
  char v12;
  _QWORD v13[4];
  __int16 v14;
  char v15;
  _QWORD v16[4];
  __int16 v17;
  char v18;

  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __SBHScreenTypeLookup_block_invoke;
  v16[3] = &__block_descriptor_35_e5_B8__0l;
  v17 = a4;
  v18 = BYTE2(a4);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __SBHScreenTypeLookup_block_invoke_2;
  v13[3] = &__block_descriptor_35_e5_B8__0l;
  v14 = a4;
  v15 = BYTE2(a4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __SBHScreenTypeLookup_block_invoke_3;
  v10[3] = &__block_descriptor_35_e5_B8__0l;
  v11 = a4;
  v12 = BYTE2(a4);
  return _SBHScreenTypeLookup(a1, a2, a3, v16, v13, v10, a5, a6, a7, a8, a9);
}

void sub_1CFF8F0E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id _SBCreateRearrangeAppsApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = objc_alloc(MEMORY[0x1E0DAADB8]);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v7 = CFSTR("apps.ipad.landscape");
  else
    v7 = CFSTR("apps.iphone");
  v8 = (void *)objc_msgSend(v4, "initWithSystemImageName:", v7);
  objc_msgSend(v3, "setIcon:", v8);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.rearrange-icons"));
  return v3;
}

id _SBCreateShareApplicationShortcutItemWithLocalizedTitle(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (objc_class *)MEMORY[0x1E0DAADA0];
  v5 = a1;
  v6 = objc_alloc_init(v4);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("square.and.arrow.up"));
  objc_msgSend(v6, "setIcon:", v7);

  objc_msgSend(v6, "setLocalizedTitle:", v5);
  objc_msgSend(v6, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.share"));
  if (v3)
  {
    v10 = *MEMORY[0x1E0CD8110];
    v11[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInfo:", v8);

  }
  return v6;
}

id _SBCreateAppProtectionApplicationShortcutItemForBundleIdentifier(uint64_t a1)
{
  void *v1;
  void *v2;
  char v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint8_t v14[16];
  id v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CF9688], "applicationWithBundleIdentifier:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CF96E0], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v3 = objc_msgSend(v2, "getPreferredEnablementAction:preferredEnableableFeature:forSubject:error:", &v17, &v16, v1, &v15);
  v4 = v15;

  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CF96E8], "sharedManager");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0DAADA0]);
    -[NSObject systemImageNameForEnablementAction:ofFeature:](v5, "systemImageNameForEnablementAction:ofFeature:", v17, v16);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", v7);
    objc_msgSend(v6, "setIcon:", v8);
    -[NSObject titleForEnablementAction:ofFeature:](v5, "titleForEnablementAction:ofFeature:", v17, v16);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLocalizedTitle:", v9);

    v18[0] = kSBHIconAppProtectionFeatureUserInfoKey;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18[1] = kSBHIconAppProtectionActionUserInfoKey;
    v19[0] = v10;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v19[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setUserInfo:", v12);

    objc_msgSend(v6, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.app-protection"));
  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_INFO, "Error fetching preferred app protection enablement action", v14, 2u);
    }
    v6 = 0;
  }

  return v6;
}

id _SBCreateHideAppSuggestionApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("minus.circle"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.hide-app-suggestion"));
  return v3;
}

id _SBCreateRemoveAppApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("minus.circle"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-app"));
  return v3;
}

id _SBCreateConfigureStackApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("rectangle.stack"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.configure-stack"));
  return v3;
}

id _SBCreateConfigureWidgetApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("info.circle"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.configure-widget"));
  return v3;
}

id _SBCreateRemoveWidgetApplicationShortcutItemWithLocalizedTitle(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0DAADA0];
  v2 = a1;
  v3 = objc_alloc_init(v1);
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAADB8]), "initWithSystemImageName:", CFSTR("minus.circle"));
  objc_msgSend(v3, "setIcon:", v4);

  objc_msgSend(v3, "setLocalizedTitle:", v2);
  objc_msgSend(v3, "setType:", CFSTR("com.apple.springboardhome.application-shortcut-item.remove-widget"));
  return v3;
}

id SBHContainingBundleRecordForWidgetWithBundleIdentifier(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (objc_class *)MEMORY[0x1E0CA5848];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithBundleIdentifier:error:", v2, 0);

  objc_msgSend(v3, "containingBundleRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id SBHContainingBundleIdentifierForWidgetWithBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    SBHContainingBundleRecordForWidgetWithBundleIdentifier(v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "bundleIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3_1()
{
  return objc_opt_class();
}

void sub_1CFFA1178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFA27F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFA35BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFA3910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFA418C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFA5508(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHMultitaskingApplicationSupportedShortcutActionMaskFromSBSMask(char a1)
{
  return a1 & 0x1F;
}

uint64_t SBHMultitaskingApplicationSupportedShortcutActionMaskToSBSMask(char a1)
{
  return a1 & 0x1F;
}

double SBHAddWidgetSheetPreferredSheetCornerRadiusForStyle(uint64_t a1)
{
  double result;

  result = 35.0;
  if (a1 != 1)
    return 30.0;
  return result;
}

BOOL SBHHardwareSupportsHomeScreenSearchAffordance()
{
  _BOOL8 result;

  result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
  if (result)
    return SBFEffectiveHomeButtonType() == 2;
  return result;
}

BOOL SBHHardwareSupportsSearchAffordancePresentationAnimation()
{
  _BOOL4 v0;
  void *v1;

  if (__sb__runningInSpringBoard())
  {
    v0 = SBFEffectiveDeviceClass() == 2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v0 = objc_msgSend(v1, "userInterfaceIdiom") == 1;

  }
  return !v0;
}

BOOL SBHHomeScreenSearchAffordanceEnabled()
{
  _BOOL8 result;

  result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
  if (result)
  {
    result = SBHHardwareSupportsSearchAffordancePresentationAnimation();
    if (result)
      return SBFEffectiveHomeButtonType() == 2;
  }
  return result;
}

void sub_1CFFB10BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak(&a21);
  _Unwind_Resume(a1);
}

void sub_1CFFB24B0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v2 = objc_msgSend((id)v0, "_shouldShowDisfavoredSection");
  if ((_DWORD)v2)
  {
    __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_9(v2, v1);
    if (*(_BYTE *)(v0 + 1539))
      __71__SBHAddWidgetSheetViewController__generateSnapshotDiffedFromSnapshot___block_invoke_10(v3, *(void **)(v0 + 1576), v1);
  }
  JUMPOUT(0x1CFFB2480);
}

uint64_t CHSWidgetFamilyForATXStackLayoutSize(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return qword_1D0190DD0[a1];
}

uint64_t SBHItemAtIndexIsOfSize(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  BOOL v6;
  uint64_t v7;

  v3 = a1;
  if (objc_msgSend(v3, "count") <= a2)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v4)
      v6 = v5 == 1;
    else
      v6 = 1;
    v7 = v6;
  }

  return v7;
}

uint64_t SBHSizeClassForItemAtIndex(void *a1, unint64_t a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a1;
  if (objc_msgSend(v3, "count") <= a2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v3, "objectAtIndex:", a2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

  }
  return v5;
}

void sub_1CFFBAFB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBC2C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBC47C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBC60C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBC79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBC938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBCAA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBCC08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBCD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFBD060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1CFFC142C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFC3A24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location, id *a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a65;
  id a66;
  id a69;
  id *v69;
  id *v70;
  id *v71;
  id *v72;

  objc_destroyWeak(v69);
  objc_destroyWeak(v71);
  objc_destroyWeak(v70);
  objc_destroyWeak(v72);
  objc_destroyWeak(location);
  objc_destroyWeak(a13);
  objc_destroyWeak(&a65);
  objc_destroyWeak(&a66);
  objc_destroyWeak(&a69);
  _Unwind_Resume(a1);
}

__CFString *SBHStringForIconImageStyleConfigurationType(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E8D875D8[a1];
}

void sub_1CFFCB07C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFCC36C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 160));
  _Unwind_Resume(a1);
}

void sub_1CFFCF128(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFD4FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD52C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD554C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD5970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD5B1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD5C10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD5D60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD75A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD7A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFD7F68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBFolderRelativeIconIndex(void *a1)
{
  if (a1)
    return objc_msgSend(a1, "sbIconIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t SBFolderRelativeSubFolderPath(void *a1, const char *a2)
{
  return objc_msgSend(a1, "bs_subpathFromPosition:", 2);
}

void sub_1CFFDB050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDB55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDC17C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDCFB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDD524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDD7A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDDA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDDDB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDE248(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFDE860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFE0100(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFE0788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFE0E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFE101C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFE1EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBFolderIndexPathsAreOnSamePage(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL8 v12;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "length");
  if (v5 >= 2
    && (v6 = v5, v5 == objc_msgSend(v4, "length"))
    && (v7 = objc_msgSend(v3, "indexAtPosition:", 0), v7 == objc_msgSend(v4, "indexAtPosition:", 0)))
  {
    v8 = 2;
    do
    {
      v9 = v8 - 1;
      if (v6 == v8)
        break;
      v10 = objc_msgSend(v3, "indexAtPosition:", v8 - 1);
      v11 = objc_msgSend(v4, "indexAtPosition:", v8++ - 1);
    }
    while (v10 == v11);
    v12 = v9 >= v6 - 1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

__CFString *SBStringForRootFolderPageState(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 5)
    return 0;
  else
    return off_1E8D87F40[a1 + 1];
}

BOOL SBRootFolderPageStateIsOnLeadingCustomPage(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

BOOL SBRootFolderPageStateIsOnIconPage(unint64_t a1)
{
  return a1 < 2;
}

BOOL SBRootFolderPageStateIsOnTrailingCustomPage(uint64_t a1)
{
  return a1 == 4;
}

BOOL SBRootFolderPageStateIsOnHorizontalScrollingPlane(unint64_t a1)
{
  return (a1 & 1) == 0 && a1 < 5;
}

BOOL SBRootFolderPageStateVerticalGroupMatches(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  if ((unint64_t)(a1 + 1) > 5)
    v2 = 0;
  else
    v2 = qword_1D0190F30[a1 + 1];
  if ((unint64_t)(a2 + 1) > 5)
    v3 = 0;
  else
    v3 = qword_1D0190F30[a2 + 1];
  return v2 == v3;
}

void sub_1CFFE73A0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFEDA1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 104));
  _Unwind_Resume(a1);
}

void sub_1CFFEE4F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id SBHomeAccessibilityTintColor(unint64_t a1, void *a2)
{
  id v3;

  v3 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, &v3, 0);
  return v3;
}

void SBHomeAccessibilityTintColorAndStyle(unint64_t a1, void *a2, _QWORD *a3, uint64_t *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  uint64_t v15;
  uint64_t v16;

  v7 = a2;
  v8 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 2;
LABEL_8:
    if (!a3)
      goto LABEL_10;
    goto LABEL_9;
  }
  v15 = 0;
  v16 = 0;
  v14 = 0.0;
  v9 = 0;
  v10 = v7;
  if (!objc_msgSend(v7, "getHue:saturation:brightness:alpha:", &v16, &v15, &v14, 0))
    goto LABEL_8;
  v11 = 0.0;
  if (a1 <= 3)
    v11 = dbl_1D0190FE0[a1];
  if (v14 >= 0.9)
  {
    v12 = 0.392156863;
    if (a1 == 1)
    {
      v12 = 1.0;
      v11 = 0.9;
    }
    v9 = 2;
  }
  else
  {
    v12 = dbl_1D0190FD0[v14 < 0.4];
    v9 = 1;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v12, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBFComposedColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
LABEL_9:
    *a3 = objc_retainAutorelease(v10);
LABEL_10:
  if (a4)
    *a4 = v9;

}

uint64_t SBHomeAccessibilityTintLegibilityStyle(unint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, 0, &v3);
  return v3;
}

id SBHomeAccessibilityTintLegibiliitySettings(unint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  id v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  SBHomeAccessibilityTintColorAndStyle(a1, a2, &v6, &v7);
  v2 = v6;
  v3 = objc_alloc(MEMORY[0x1E0DC4270]);
  v4 = (void *)objc_msgSend(v3, "initWithStyle:contentColor:", v7, v2);

  return v4;
}

BOOL SBHIsHomeButtonDevice()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0D01800], "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "homeButtonType") != 2;

  return v1;
}

uint64_t SBHIsSpotlightFloatingWindowEnabled()
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
  v0 = (void *)getSPUIDefaultsClass_softClass;
  v7 = getSPUIDefaultsClass_softClass;
  if (!getSPUIDefaultsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSPUIDefaultsClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getSPUIDefaultsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = objc_retainAutorelease(v0);
  _Block_object_dispose(&v4, 8);
  return objc_msgSend(v1, "enableFloatingWindow");
}

void sub_1CFFF12EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHWeatherWidgetTestIntent()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v0 = objc_alloc(MEMORY[0x1E0C99D50]);
  objc_msgSend(CFSTR("/Td6WFoAAAD/EtlBAgAhARYAAAB0L+Wj4B9IEJ5dADEcCbwef02oFXxbODFLJ6lFXbr0DHqsTF+vT2q/BDIO2FiDjAilU8tTgPSYbYL/W/B+tKbY3nJzTUcH6BiMVSyTpgss1A43qH34miQjtY882XmTB5YsDJCDZKn3deWhWBlsU+ghAa7WiEaYuXEUwKu0DpWTO6Hp2+PNqAV8fm0dpVJSfPL6p4fxICk3P5mr+dO4KCIpxFMhPp32uUW0wrIR7QzXEocL5erNDyDo1s+4uOj44VWkbBieWt7QhZJgjHYWKXPj7OGx7eB6y2FuoY/Mv/glFZEq0RpF1CFr88QR3zPm/FuvhGxVombp5p8pvf9Xd28ymUT6b9YJq0g+cmYDw6Xlw2JDpAQw26AVNS/oPgvV0E1JOpFvWhsBJIgNQWFWdtlfps2kUMbobXg9RphWrh+AryoGWjeO1PKAMYuaydjkmJlA0E/wktQh3J51ojZ45SOhz3CqLqsJWUVTNuHv1lDQvUmb/OCTWB4JA/JxWQ9hKGWei+VKs0R8gIijsnsie/nAZIFI0yW94AkcVHw5d4+hygxntBgA+A1M6KjpSP6HJTQHqOAhCfyKrqg9Pax7BL0JwmI9JUfbMmXDDkEdPTBs/fd8EQDc6Aq6rJ8pCkJaXPEgPYz/1abq6f+TskilLkqEgjJLwbo78+07z2BrW2tQK0kJs42aqwa4mEbK7OdbMLgc9P2JuY9nvM5C0bUkrOEucLqBJ/mbn4+NdW0tSu5L0imDBfMlZ9sAWrrHgBHYB2QNFwqMZ5jOKdNBN1cihTCCVIWN+ni+nTNbgwbhfftqBn9elUerixeWg1+zGDesSl/HiPTIAk4qNgCFc0JH4+VrktML1Ojhab0aKhVdkmEQhb8jVcIDUWe0QGD3aWcP4Cnsf9EkSVhgdvGbiKIJ7yIVljyJXmcCdD+NFhIPNpzf4Xfqf81IROLpoQojUU7KcMvy9KUEtckfnNG+64JQVhXcmcyb42aMBXkl9yuliTmVANiZmxEPEnNSgR+GtCHmV2NPgCY7RCaNQUuYtduBu1U9AZ8a782pLYYjeTlYdaTyxXXc2c/DVuc3NnEw2SDcWv6pUUz+2g3W7GxRngI0eaK4YcZ/8bQQIcgtPfejYybGeYXzILpEIZ7mDJl1/c+22iipEMAUIIBLDKuNneaC7pcAUBM3SqAolEMV6zaL0QhwKJ3M9TzDrUTa9D5Z0w+KUCfCeCnOoOBaPf+XFueEKfhaSlU8OSrGAYiBxFlkQsflpswJmlWv5j+GsOMjEhy5SRVlTMMm6srHZq0fGpdZiFfAD2fgVhXTIOWqwb1Dp7OW3nHv2FGrmhGviP5+mjx8PFgmA0h7gJF4LxQXYjFy9kEyMB756QM6pezthoLNk5y8o0cLcNoTP1KoTRPFh+BOnt9Pu3yQkC74EKaSWf4FDPTLsLxROz8N1qaKBtNW/4i7y/yJ1x2zHndy7EubdURmsXV0Oa2HnD5cA6XqSATr7rooeKL7vBOcQuweSV3vLiRT+2PZYpodhU6BdjmShivpKw9VeEelJ9Yb9qrNVNffJKfY2nQm4OZgAMj4X9Xdcw84uqEYFABKutHnD1PMwjX6D49pEA8a/NciM/jY/lPyWHnpYBaatVD0opE0GhVKgA/dZ7tVbafzY7gYw2XAe7jCnjh8oL9otkmPMqR+gCBqUmmw1hR5+8mZEBpdIP00CTBKL+fZMcIOeHPmjg58jD5TNcCaerWMkOFeqdNIG8l/swSucvLdXjNaan71fVA5fTzG228sXIEmvUB551XqUw3h64R4iB/1c+p8zPWTboe5ALndoKDbSVx6QfE80qYvelZ/+W/MGCNAbhP7+B/YSDC0vxMkHTtmqGnjgcr/z3Bvhcq4UHp9Ffwy29HgrAIS+RTr913SkvpcDh+YOe0D813wn/z8XSMULPYsYGDrNOkRLMKHjRPdVxm0YfCPdobZdFbz1vbjK8T2NZ++G4j8lIW+R1nlAQyxC/8qn8ehhjHT0sG9g2YJnfj4PHwGRy6y3RlM8zNLU5A2SGeOcJsHUEpZkz4woU/KX0YzFDegzfpkEEXNgH7Iw4uvRjtQZA9SZ2iZNZ8ILlg578gvbmCpOnHgxw7ND4EepEDvnG3N2i7NfPBM5mccWRKQ1sR8hmHtEgfKuHuzaEEpdSK+SI2KetQhUrC4dMxqy9sEGiZKeZZqJWN7IsbRMd92txDb8U9TvgugSkgPSc67337xSJLMR9dkPbPJNO5H1PiVdqQK90sAS8cVZCJG/Dt1333tZa2I8S+zOXvFdb2kSSE/ZI7kpuM4GTtam1f8F4FpZppLimoUy1PdJrH789aD2pBtU/584JDMzrdVDEJy8GeqegcCmb11Na7AuFoUsdQArBH50c4v7Qm4725/IAa+BfGoARI2WymTcpiSMa1j1SyWjr+WQjJvEJa7kHfTozhm8hZYWY1R3ec8l9S5DCZTic9tR701+GPVZ51e4bYDFIr+xzfEwh0YjmAJpk5uquwMvunz8n5M1ttWlgoXi5Scca"), "stringByAppendingString:", CFSTR("lbVtjvJQkShqq/aVRu02btidukA5bqPbMPavQZ7BmnshthaSkkXiVrb2UqwatMRZHUS20r0A1JWt4H0niatxwGi7sE87eWgFoHhXbcNICaPpOm4HdtLfr5UI0lrpzb+0X5wojvWF8uqLHeKSaZZPNUY0N+wkvvIkmwieEmAstAHoNRRBHo75/HblGKLPmrzpnGUM99GaVsBru5ZWngawSUJxh0AtTGuMiXTbmZ8Wv6mgxAtsY6ThV4pOnaz+MHgK5xgslyh/BsljBi2tfJG4BBMCYcadVcUrSDNg9L0kXZuD8mNWmidQUWcwlV+RjvzK6Wr48BKPDG9nW/xnIam4/PFadfYY9MS7AkX1INN2tSprt6mD9aO+6hc86cc0tRwWZWHi01yH7t3U+KGjJPG1lOnb1Yroda2/7b+RP0jE37TG8ZlhJ1gmdyBQdzoR68mCAOpXO7XmM/VsPP1tFUMcXCipgPAbewqyxvrpKSWqN/BCba8YSrVhteqdFvWWsPfVYqf10GqnDWG99zAsdZz8h2htgDxSQAvvB9eJAj/pL4ZKgtAYZ9uCEWwWV1OJPsulI5aa+J5XMbORotvp2d9Gdr4gzkH5LpcAKU4Lm3qlXl3Tq0yL5gt0qvHUJ/0u0xPT2IEzhWP8ZMY1YHripF1yIOqEG2P6iuGrw/PcUc1Rr6z7WV2kSWMjEi85n9jHQ2pq93Qkqh5rx2k+7/W0s+55pz7A4z5ZruxyEtyAygXRh55iROgrmbDG1+4EdPYKQF4FdGY04wwC78yN2mb5x364VKO40zCbSgF1dGOJ9Z36eLIMHiYYNE6igscIssCtoR29X1H13DTUz+ZBLIRVBhrt35ogXJbIfLTWvSuBgauT5lyAH5n6h+mDU2qo5iIwFSJUwo+fuOzQ7xSrJfE2CSD1WZqdWJqUvLuuOicCbkaDk6pe3VaTM3dj+T8c63cpex9xpUWpCS3PFNgqeB+J6YbDQKT5VzJrUpP3yCXP5DkGh26PUdf58q8xk8Krfnb3o1bc2/37rZT6BLjUrNem/imKMWZSWF4tEI1nOY/f94vzpHXE0Jv0fdVav/JszNZxK+NHxHWgbUvY7nGcnuwZxl1nKVs0NPB4yRGunidFv6aHf9namJK306PxFB0bsi1oKSy7lk1kKFzNtWttM8+v2ui0CmIMLqy9RX6DgUGjnTpW6c9pnWpT+T4+iS0lEJ7DrfQE7QhFCsYKaJKZ8H12vIRGgmBgvPctewkQjhdgVtGKb77o+zXScldBznf8qj8LCQyDmxO4UXfVlmC+kjKdgtyBiGAyMOBY3EYfqF7QaX/5Lgg2T00ABKqnh5MZada3dwkvftr9RP20RDiPvBqF8VSovluEi9iFSGezeR2Sy/WH3ps0XZtfYtRxJxsgnd3w0+SwhEHGrJN20xVoi9H9Kv2QX/E9iEiNxuh/oXsd9qNG+R2IaBIGSqRLIgnRQQX6tMJ1sNoDhI9rshr69qibkJ7YJerHfBRPS9/Tlha06QysbjxWZKiZZprOKgEi/1uwcLM+qkb7boPVEMsn9Xm5Uuxdwh9bMkb2wM8y2lI/HQzU13fO6c0rirgL3tNBHl7WpyZdMsB9LadrYPJr0aVyMCRrVYr1WtDcNTJDaS+3wNhx7rx64eeSyY0ZsgRsIFpvOfD+bw8vfQaD7+rPehKE7kgCWw+04YXkLNiUaCiI7UKUfYvXW2DJ9tIvHslN4Rfmm186nB2MTrBrg2DjZu1GRT0OH7NWA0QfVq8Uh+JXyw0hb69QrCHt6V3mgw09z4VBgp4m9DJWoliqsGWP1wvsFFO8XDFWIDc9gh8ninLtWM/Q3OnbG3vnwJ5vMLBxUx2zopY28IVfQ1mWOB6KrMD5tam2N7asj1KwDQELAO4J4TQBNEn/cDN+Ck/SLVCYcCQrB+7G6N5Q3rzu69pgwni7uDV/Xyz+umZe4rYUiLBXhvdf69z5Z2vmAqroR7Tp+qvZP3TcTWyAKwLv6t2nuGLSha9mUnTaGHu8Sxwnoc2dFhsUOjAY8GgDRJ6pK0J4y+caxJ5+XuPPJKM3wGFr4JV+W3aMei+6ba81jFVmGZHQWurKW82PnNMoe66Dw/YH3YJz8t8K1ie0E5uCJMa/d6F2o16/hgEY1o/7LkPSq2JCN41GH4dEiuZKTcxLwZRktdhZ2SR1mSQ/plj7AMUXq5oAZe2o4FC/FSNfoU4vzD5DwG4uSzOO72HAKYERFit8DqFT2C4mPET7/vdSFIHhJnfdrXZ6vjK5eSv0BfEXkR90gIOWA0VK42FoFZ+huxaAZHqQf4wiVq9CWXbR5oO57AthJK0ThopXuuLG52xhkFNrjoKMRHDsHmVvurSZPFCr8YuEm6Vr2p+YoHB+HoZMPiDR0CpNjYD8jQ6JkOuO9761xGysBeMgWiQ7ACYqjcsk9sRctzV179n0WA6t8FhrPKMawKtkfvKzCg09nisQ6oa7Jrladh8VWUXnTxR4WkCZp+VzK5btbC9tOFLTjN1wj7+CYeHKwpRvDBjzvVhGeIxnFZuk+L7tl9SgaPqzIEBFR+2lWw/GLRKMPqG3VjY2M/I/1QxaMsv/5LId6DNLSrbChI79wWt77+FwrfHB0Uf6CuwgnaCbhLM+mIC9vxX1XH1Mhf0kTojyXRx/s7U45S/PKuD72PMhLZIfkEvo9A8IMKSR7R0xB80NwLQve+80qjUcXYoseXaHbQqiqjHwgm4iLXuIflvkALJ3Bw9r8KhE+DvuLQxm9BsJv2ZJSXVAx+kvNd3k/NV+Rk6naePSlYWeHF2l4pOBmO9Glrss5eNvd9a3K3+K7B40WfEHVbuaVImlQKSco9sJDN1YWr8wlVDilQItsqtEwSLtMIvRPnoXB8IlFMOGHSe2BQYGu0ryFxJoAj6yirHh42xXD75oi/cqv/WF8b1xoY8z2IVQW/WeXcwJiAUwnK631QC+jaopxjL4Iu/eHjgxX3Fv2esrZXM6ZTsicc/ir7IaAxfovgVsTFuoOEzE0KrKN8WcB+0d577i2xQSMO8c79D3qxCzKtn6FviWQ6YsvOk1AkWt41+HOLXPiMCIIoxFsgLEQ2h2DlLf8a8diW9nxeLUe3RZMSdF0GO8W9wRb8kVaHUsFTA0fV9odBSEXtxMtAlfviJkic3WGl3lqUEgAAAAABsiHJPgAAAQlGTagACvwCAAAAAABZWg=="));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v0, "initWithBase64EncodedString:options:", v1, 1);
  objc_msgSend(v2, "decompressedDataUsingAlgorithm:error:", 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

Class __getSPUIDefaultsClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SpotlightUILibraryCore_frameworkLibrary)
  {
    SpotlightUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SpotlightUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SPUIDefaults");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSPUIDefaultsClass_block_invoke_cold_1();
    free(v3);
  }
  getSPUIDefaultsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

const __CFString *SBHStringFromUIInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("unknown");
  else
    return off_1E8D882A8[a1 - 1];
}

void sub_1CFFF3B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF3CAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF3E2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF3FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF4150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF4350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF46D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFFF49C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBLogFolderIconImageCache()
{
  if (SBLogFolderIconImageCache_onceToken != -1)
    dispatch_once(&SBLogFolderIconImageCache_onceToken, &__block_literal_global_4_0);
  return (id)SBLogFolderIconImageCache___logObj;
}

id SBLogRecentsDocumentExtension()
{
  if (SBLogRecentsDocumentExtension_onceToken != -1)
    dispatch_once(&SBLogRecentsDocumentExtension_onceToken, &__block_literal_global_10_0);
  return (id)SBLogRecentsDocumentExtension___logObj;
}

id SBLogLibrarySearchController()
{
  if (SBLogLibrarySearchController_onceToken != -1)
    dispatch_once(&SBLogLibrarySearchController_onceToken, &__block_literal_global_16);
  return (id)SBLogLibrarySearchController___logObj;
}

id SBLogContinuity()
{
  if (SBLogContinuity_onceToken != -1)
    dispatch_once(&SBLogContinuity_onceToken, &__block_literal_global_18_0);
  return (id)SBLogContinuity___logObj;
}

id SBLogLibrary()
{
  if (SBLogLibrary_onceToken != -1)
    dispatch_once(&SBLogLibrary_onceToken, &__block_literal_global_20);
  return (id)SBLogLibrary___logObj;
}

id SBLogIconContextMenu()
{
  if (SBLogIconContextMenu_onceToken != -1)
    dispatch_once(&SBLogIconContextMenu_onceToken, &__block_literal_global_22);
  return (id)SBLogIconContextMenu___logObj;
}

id SBLogAppPlaceholder()
{
  if (SBLogAppPlaceholder_onceToken != -1)
    dispatch_once(&SBLogAppPlaceholder_onceToken, &__block_literal_global_24);
  return (id)SBLogAppPlaceholder___logObj;
}

id SBLogTelemetrySignposts()
{
  if (SBLogTelemetrySignposts_onceToken != -1)
    dispatch_once(&SBLogTelemetrySignposts_onceToken, &__block_literal_global_26);
  return (id)SBLogTelemetrySignposts___logObj;
}

id SBLogWidgetMultiplexing()
{
  if (SBLogWidgetMultiplexing_onceToken != -1)
    dispatch_once(&SBLogWidgetMultiplexing_onceToken, &__block_literal_global_30_0);
  return (id)SBLogWidgetMultiplexing___logObj;
}

id SBLogWidgetCleanup()
{
  if (SBLogWidgetCleanup_onceToken != -1)
    dispatch_once(&SBLogWidgetCleanup_onceToken, &__block_literal_global_34);
  return (id)SBLogWidgetCleanup___logObj;
}

id SBLogWidgetDiscoverabilityMigration()
{
  if (SBLogWidgetDiscoverabilityMigration_onceToken != -1)
    dispatch_once(&SBLogWidgetDiscoverabilityMigration_onceToken, &__block_literal_global_36);
  return (id)SBLogWidgetDiscoverabilityMigration___logObj;
}

id SBLogWidgetResizing()
{
  if (SBLogWidgetResizing_onceToken != -1)
    dispatch_once(&SBLogWidgetResizing_onceToken, &__block_literal_global_38);
  return (id)SBLogWidgetResizing___logObj;
}

id SBLogLabels()
{
  if (SBLogLabels_onceToken != -1)
    dispatch_once(&SBLogLabels_onceToken, &__block_literal_global_46);
  return (id)SBLogLabels___logObj;
}

id SBLogProtectedApps()
{
  if (SBLogProtectedApps_onceToken != -1)
    dispatch_once(&SBLogProtectedApps_onceToken, &__block_literal_global_48_0);
  return (id)SBLogProtectedApps___logObj;
}

id SBLogAddWidgetSheet()
{
  if (SBLogAddWidgetSheet_onceToken != -1)
    dispatch_once(&SBLogAddWidgetSheet_onceToken, &__block_literal_global_50);
  return (id)SBLogAddWidgetSheet___logObj;
}

id SBLogIconStylePicker()
{
  if (SBLogIconStylePicker_onceToken != -1)
    dispatch_once(&SBLogIconStylePicker_onceToken, &__block_literal_global_52);
  return (id)SBLogIconStylePicker___logObj;
}

void sub_1CFFF8B40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFFF91BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBHAppDragLocalContextStartLocationFromSBSLocation(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xC)
    return 0;
  return result;
}

uint64_t SBHAppDragLocalContextStartLocationToSBSLocation(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 0xC)
    return 0;
  return result;
}

void sub_1D0003EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUIAppPredictionViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_0)
  {
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("APUIAppPredictionViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAPUIAppPredictionViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getAPUIAppPredictionViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D00061C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHWidgetViewControllerDescriptionsForSysdiagnose(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        SBHWidgetViewControllerSysdiagnoseDescription(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKey:", v9, v8, (_QWORD)v11);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  return v2;
}

id SBHWidgetViewControllerSysdiagnoseDescription(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  _QWORD v11[4];
  id v12;

  v1 = a1;
  objc_msgSend(v1, "sbh_underlyingAvocadoHostViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  if (objc_msgSend(v2, "count"))
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __SBHWidgetViewControllerSysdiagnoseDescription_block_invoke;
    v11[3] = &unk_1E8D889B0;
    v12 = v3;
    objc_msgSend(v2, "bs_each:", v11);
    v4 = v12;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    v6 = objc_opt_class();
    if (objc_msgSend(v1, "isViewLoaded"))
      v7 = CFSTR("Y");
    else
      v7 = CFSTR("N");
    if (objc_msgSend(v1, "bs_isAppearingOrAppeared"))
      v8 = CFSTR("Y");
    else
      v8 = CFSTR("N");
    objc_msgSend(v5, "stringWithFormat:", CFSTR("<%@:%p l:%@ v:%@>"), v6, v1, v7, v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v4);
  }

  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void sub_1D0007988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00083C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCPSWebClipStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ClipServicesLibraryCore_frameworkLibrary)
  {
    ClipServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ClipServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CPSWebClipStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCPSWebClipStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getCPSWebClipStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getIXAppInstallCoordinatorClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!InstallCoordinationLibraryCore_frameworkLibrary)
  {
    InstallCoordinationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!InstallCoordinationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("IXAppInstallCoordinator");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getIXAppInstallCoordinatorClass_block_invoke_cold_1();
    free(v3);
  }
  getIXAppInstallCoordinatorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D000D5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D000E1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1D0010828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D0011368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00115C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0015554(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1D0015644(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 40));
  _Unwind_Resume(a1);
}

void sub_1D0017918(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0017984(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D00185B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D0019044(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D00199E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_6_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t SBHSpecialWidgetDescriptorTypeForKind(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSiri")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindFiles")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsFolder")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindShortcutsSingle")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindSmartStack")) & 1) != 0)
  {
    v2 = 5;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("SBHSpecialAvocadoDescriptorKindAppPredictions")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

double SBHZPositionForScale(double a1, double a2)
{
  return (1.0 / a1 + -1.0) / a2;
}

double SBHInterpolateEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + (a5 - a1) * a9;
}

double SBHDirectionalEdgeInsetsByClearingEdges(char a1)
{
  double result;

  if ((a1 & 1) != 0)
    return 0.0;
  return result;
}

double SBHDirectionalEdgeInsetsInsetRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1)
    a7 = a9;
  return a2 + a7;
}

double SBHAlignSizeInRectUsingBaseline(double a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  CGRect v8;

  v8.origin.x = a4;
  v8.origin.y = a5;
  v8.size.width = a6;
  v8.size.height = a7;
  CGRectGetMaxY(v8);
  return 0.0;
}

double SBHCenterNormalizedFromLayerAnchorPoint(void *a1)
{
  id v1;
  double v2;
  CGFloat v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v15;
  CGRect v16;
  CGRect v17;

  v1 = a1;
  objc_msgSend(v1, "bounds");
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v9 = v8;
  objc_msgSend(v1, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "anchorPoint");
  v15 = v11;

  objc_msgSend(v1, "center");
  v13 = v12;

  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  CGRectGetHeight(v16);
  v17.origin.x = v3;
  v17.origin.y = v5;
  v17.size.width = v7;
  v17.size.height = v9;
  return v13 + CGRectGetWidth(v17) * (0.5 - v15);
}

id SBHPinViewWithinView(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  return v14;
}

double SBHEdgeInsetsForTransformingRectIntoRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v20.origin.x = a5;
  v20.origin.y = a6;
  v20.size.width = a7;
  v20.size.height = a8;
  MinY = CGRectGetMinY(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  v19 = MinY - CGRectGetMinY(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  CGRectGetMinX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  CGRectGetMinX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetMaxY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetMaxY(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetMaxX(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetMaxX(v27);
  return v19;
}

BOOL SBHSizeGreaterThanOrEqualToSize(double a1, double a2, double a3, double a4)
{
  return a2 >= a4 && a1 >= a3;
}

double SBHSizeScaledToFill(double a1, double a2, double a3, double a4)
{
  return a3 * fmax(a1 / a3, a2 / a4);
}

double SBHSizeScaleSizeToFill(double a1, double a2, double a3, double a4)
{
  return fmax(a1 / a3, a2 / a4);
}

double SBHSizeScaled(double a1, double a2, double a3)
{
  return a1 * a3;
}

double SBHSizeCeiling(double a1)
{
  return ceil(a1);
}

double SBHSizeConstrain(double result, double a2, double a3, double a4, double a5)
{
  if (result < a3)
    result = a3;
  if (result > a5)
    return a5;
  return result;
}

void SBHCGRectIntersectionAsPercentage(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v16;
  CGRect v17;

  if (CGRectIntersectsRect(*(CGRect *)&a1, *(CGRect *)&a5))
  {
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    v17.origin.x = a5;
    v17.origin.y = a6;
    v17.size.width = a7;
    v17.size.height = a8;
    CGRectIntersection(v16, v17);
  }
}

double SBHNormalizedRectFromSubRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  v20 = MinX / CGRectGetWidth(v22);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetHeight(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetWidth(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetHeight(v28);
  return v20;
}

double SBHSubRectFromNormalizedRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinX;
  double v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;

  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  MinX = CGRectGetMinX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  v20 = MinX * CGRectGetWidth(v22);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  CGRectGetMinY(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  CGRectGetHeight(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetWidth(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetWidth(v26);
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  CGRectGetHeight(v27);
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  CGRectGetHeight(v28);
  return v20;
}

double SBHPointScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double SBHPointVectorMake(double a1, double a2, double a3)
{
  return a3 - a1;
}

double SBHPointDotProduct(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double SBHPointCrossProduct(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return ((a3 - a1) * (a6 - a4) - (a4 - a2) * (a5 - a3)) * ((a3 - a1) * (a6 - a4) - (a4 - a2) * (a5 - a3));
}

double SBHNearestPointInLine(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;

  v6 = a1 - a3;
  v7 = a5 - a3;
  v8 = ((a2 - a4) * (a6 - a4) + v6 * v7) / (v7 * v7 + (a6 - a4) * (a6 - a4));
  v9 = 0.0;
  if (v8 >= 0.0)
  {
    v9 = v8;
    if (v8 > 1.0)
      v9 = 1.0;
  }
  return a3 + v7 * v9;
}

double SBHPointAtDistanceFromPointToPoint(double a1, double a2, double a3, double a4, double a5)
{
  double v8;

  UIDistanceBetweenPoints();
  return a1 - (a1 - a3) * a5 / v8;
}

uint64_t SBHPolygonContainsPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  uint64_t v4;
  char v5;
  uint64_t v6;
  double *v7;
  double v8;
  double v9;
  BOOL v10;
  BOOL v11;

  if (a2)
  {
    v4 = 0;
    v5 = 0;
    v6 = a2 - 1;
    v7 = (double *)(a1 + 8);
    do
    {
      v8 = *v7;
      v9 = *(double *)(a1 + 16 * v6 + 8);
      v10 = *v7 <= a4 && a4 < v9;
      if (v10 || (a4 < v8 ? (v11 = v9 > a4) : (v11 = 1), !v11))
      {
        if (a3 < *(v7 - 1) + (a4 - v8) * (*(double *)(a1 + 16 * v6) - *(v7 - 1)) / (v9 - v8))
          v5 ^= 1u;
      }
      v6 = v4++;
      v7 += 2;
      --a2;
    }
    while (a2);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

double SBHPolygonNearestPointToPoint(uint64_t a1, uint64_t a2, double a3, double a4)
{
  char v8;
  uint64_t v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  double *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;

  v8 = SBHPolygonContainsPoint(a1, a2, a3, a4);
  if (!a2 || (v8 & 1) != 0)
    return a3;
  v9 = 0;
  v10 = a2 - 1;
  v11 = (double *)(a1 + 8);
  v12 = 0.0;
  v13 = a3;
  do
  {
    v14 = *(v11 - 1);
    v15 = *v11;
    if (v10)
      v16 = v9 + 1;
    else
      v16 = 0;
    v17 = (double *)(a1 + 16 * v16);
    v18 = *v17 - v14;
    v19 = v17[1] - v15;
    v20 = v19 * v19 + v18 * v18;
    v21 = ((a4 - v15) * v19 + (a3 - v14) * v18) / v20;
    v22 = 0.0;
    if (v21 >= 0.0)
    {
      v22 = ((a4 - v15) * v19 + (a3 - v14) * v18) / v20;
      if (v21 > 1.0)
        v22 = 1.0;
    }
    v23 = v9 + 1;
    v24 = v14 + v18 * v22;
    UIDistanceBetweenPoints();
    if (v25 < v12 || v9 == 0)
    {
      v13 = v24;
      v12 = v25;
    }
    --v10;
    v11 += 2;
    ++v9;
  }
  while (v23 != a2);
  return v13;
}

uint64_t SBHPolygonFindConvexHullPoints(const void *a1, size_t count, uint64_t a3)
{
  double *v6;
  double *v7;
  uint64_t v8;
  size_t v9;
  double *v10;
  size_t v11;
  double v12;
  double v13;
  double *v14;
  char v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (count < 0xB)
  {
    v6 = 0;
    v7 = (double *)&v16;
  }
  else
  {
    v6 = (double *)malloc_type_calloc(count, 0x10uLL, 0x1000040451B5BE8uLL);
    v7 = v6;
  }
  memmove(v7, a1, 16 * count);
  CFMergeSortArray();
  v8 = 0;
  v9 = 0;
  do
  {
    v10 = &v7[2 * v9];
    *(_OWORD *)(a3 + 16 * v8) = *(_OWORD *)v10;
    v9 = (v9 + 1) % count;
    v11 = 0;
    v12 = *v10;
    v13 = v10[1];
    v14 = v7 + 1;
    do
    {
      if ((uint64_t)((*v14 - v13) * (v7[2 * v9] - *(v14 - 1)) - (*(v14 - 1) - v12) * (v7[2 * v9 + 1] - *v14)) < 0)
        v9 = v11;
      ++v11;
      v14 += 2;
    }
    while (count != v11);
    ++v8;
  }
  while (v9);
  free(v6);
  return v8;
}

uint64_t comparePointX()
{
  return BSCompareFloats();
}

double SBHPolygonCreateRectangleFromLine(double *a1, double a2, double a3, double a4, double a5, double a6)
{
  char v12;
  double v13;
  double v14;
  char v15;
  double v16;
  __double2 v17;
  double result;

  v12 = BSFloatApproximatelyEqualToFloat();
  v13 = 0.0;
  if ((v12 & 1) != 0)
  {
    v14 = a6;
  }
  else
  {
    v15 = BSFloatApproximatelyEqualToFloat();
    v14 = 0.0;
    if ((v15 & 1) != 0)
    {
      v13 = a6;
    }
    else
    {
      v16 = atan((a5 - a3) / (a4 - a2));
      v17 = __sincos_stret(v16);
      v14 = v17.__cosval * a6;
      v13 = v17.__sinval * a6;
    }
  }
  *a1 = a2 + v14;
  a1[1] = a3 - v13;
  a1[2] = a4 + v14;
  a1[3] = a5 - v13;
  a1[4] = a4 - v14;
  a1[5] = a5 + v13;
  result = a3 + v13;
  a1[6] = a2 - v14;
  a1[7] = result;
  return result;
}

void sub_1D001C0BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D001F4EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D001FCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00208E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D002314C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getCCUICAPackageDescriptionClass_block_invoke(uint64_t a1)
{
  ControlCenterUIKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CCUICAPackageDescription");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCCUICAPackageDescriptionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCCUICAPackageDescriptionClass_block_invoke_cold_1();
    ControlCenterUIKitLibrary();
  }
}

void ControlCenterUIKitLibrary()
{
  void *v0;

  if (!ControlCenterUIKitLibraryCore_frameworkLibrary_0)
    ControlCenterUIKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!ControlCenterUIKitLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

SBHIconGridSizeClassSet *__getCCUILabeledRoundButtonViewControllerClass_block_invoke(uint64_t a1)
{
  SBHIconGridSizeClassSet *result;
  void *v3;
  SEL v4;
  _NSZone *v5;

  ControlCenterUIKitLibrary();
  result = (SBHIconGridSizeClassSet *)objc_getClass("CCUILabeledRoundButtonViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCCUILabeledRoundButtonViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1();
    return +[SBHIconGridSizeClassSet allocWithZone:](v3, v4, v5);
  }
  return result;
}

id getCNMonogrammerClass()
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
  v0 = (void *)getCNMonogrammerClass_softClass;
  v7 = getCNMonogrammerClass_softClass;
  if (!getCNMonogrammerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNMonogrammerClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getCNMonogrammerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D002875C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0029030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getCNMonogrammerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!ContactsUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CNMonogrammer");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCNMonogrammerClass_block_invoke_cold_1();
    free(v3);
  }
  getCNMonogrammerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCNContactStoreClass_block_invoke(uint64_t a1)
{
  ContactsLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNContactStore");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNContactStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNContactStoreClass_block_invoke_cold_1();
    ContactsLibrary();
  }
}

void ContactsLibrary()
{
  void *v0;

  if (!ContactsLibraryCore_frameworkLibrary)
    ContactsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCNMutableContactClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  unint64_t v6;
  int64_t v7;

  ContactsLibrary();
  result = objc_getClass("CNMutableContact");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNMutableContactClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getCNMutableContactClass_block_invoke_cold_1();
    return (Class)+[SBHLibraryCategoryIdentifier categoryWithLocalizedDisplayName:categoryID:categoryIndex:](v3, v4, v5, v6, v7);
  }
  return result;
}

void sub_1D0029B38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SBHScreenBounds(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGAffineTransform v12;
  CGRect v13;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  switch(a1)
  {
    case 1:
      v11 = 0.0;
      break;
    case 3:
      v11 = 1.57079633;
      break;
    case 4:
      v11 = -1.57079633;
      break;
    default:
      v11 = 3.14159265;
      if (a1 != 2)
        v11 = 0.0;
      break;
  }
  CGAffineTransformMakeRotation(&v12, v11);
  v13.origin.x = v4;
  v13.origin.y = v6;
  v13.size.width = v8;
  v13.size.height = v10;
  CGRectApplyAffineTransform(v13, &v12);
}

void *SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice()
{
  if (SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_onceToken != -1)
    dispatch_once(&SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_onceToken, &__block_literal_global_3_0);
  return _Block_copy((const void *)SBHHomeScreenMaterialViewBackdropScaleAdjustmentHandlerForCurrentDevice_handler);
}

void sub_1D0031B58(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void sub_1D0033FC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00366C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D0037D00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D0039D3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D003B870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D003CAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SBHStringForIconCoordinate(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(%ld,%ld)"), a1, a2);
}

void OUTLINED_FUNCTION_3_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void sub_1D00409EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0041084(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00428C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1D00484CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t SBIconViewQueryingDisplayingIcon(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  uint64_t v10;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  char v24;

  v5 = a1;
  v6 = a2;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __SBIconViewQueryingDisplayingIcon_block_invoke;
  v16[3] = &unk_1E8D89D20;
  v19 = &v21;
  v17 = v5;
  v18 = v6;
  v20 = a3;
  v12[0] = v7;
  v12[1] = 3221225472;
  v12[2] = __SBIconViewQueryingDisplayingIcon_block_invoke_2;
  v12[3] = &unk_1E8D89D48;
  v15 = &v21;
  v8 = v17;
  v13 = v8;
  v9 = v18;
  v14 = v9;
  SBIconViewQueryingOptionalMethodImplementation(v8, a3, (uint64_t)sel_isDisplayingIcon_options_, v16, v12);
  v10 = *((unsigned __int8 *)v22 + 24);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void sub_1D004C1B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D004E1E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

id SBHStackLayoutSizeToIconGridSizeClass(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __SBHStackLayoutSizeToIconGridSizeClass_block_invoke;
  v2[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v2[4] = a1;
  SBHGetIconGridSizeClassPassingTest(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t PosterUIFoundationLibraryCore()
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
  v0 = PosterUIFoundationLibraryCore_frameworkLibrary;
  v6 = PosterUIFoundationLibraryCore_frameworkLibrary;
  if (!PosterUIFoundationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E8D89F58;
    v8 = *(_OWORD *)&off_1E8D89F68;
    v1 = _sl_dlopen();
    v4[3] = v1;
    PosterUIFoundationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1D00519C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t PosterUIFoundationLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = PosterUIFoundationLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getPUIMutableStylePickerConfigurationClass()
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
  v0 = (void *)getPUIMutableStylePickerConfigurationClass_softClass;
  v7 = getPUIMutableStylePickerConfigurationClass_softClass;
  if (!getPUIMutableStylePickerConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIMutableStylePickerConfigurationClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIMutableStylePickerConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0051AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMutableStylePickerConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIMutableStylePickerConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIMutableStylePickerConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPUIMutableStylePickerConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerComponentsClass(v3);
  }
  return result;
}

id getPUIStylePickerComponentsClass()
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
  v0 = (void *)getPUIStylePickerComponentsClass_softClass;
  v7 = getPUIStylePickerComponentsClass_softClass;
  if (!getPUIStylePickerComponentsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerComponentsClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIStylePickerComponentsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0051BE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerComponentsClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIStylePickerComponents");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerComponentsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPUIStylePickerComponentsClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerHomeScreenConfigurationClass();
  }
  return result;
}

id getPUIStylePickerHomeScreenConfigurationClass()
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
  v0 = (void *)getPUIStylePickerHomeScreenConfigurationClass_softClass;
  v7 = getPUIStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIStylePickerHomeScreenConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerHomeScreenConfigurationClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0051CF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerHomeScreenConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIStylePickerHomeScreenConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerHomeScreenConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIMutableStylePickerHomeScreenConfigurationClass(v3);
  }
  return result;
}

id getPUIMutableStylePickerHomeScreenConfigurationClass()
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
  v0 = (void *)getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  v7 = getPUIMutableStylePickerHomeScreenConfigurationClass_softClass;
  if (!getPUIMutableStylePickerHomeScreenConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0051DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIMutableStylePickerHomeScreenConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIMutableStylePickerHomeScreenConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 24);
  }
  else
  {
    __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
    return (Class)getPUIStylePickerViewControllerClass();
  }
  return result;
}

id getPUIStylePickerViewControllerClass()
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
  v0 = (void *)getPUIStylePickerViewControllerClass_softClass;
  v7 = getPUIStylePickerViewControllerClass_softClass;
  if (!getPUIStylePickerViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIStylePickerViewControllerClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIStylePickerViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0051F08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIStylePickerViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIStylePickerViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIStylePickerViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getPUIStylePickerViewControllerClass_block_invoke_cold_1();
    return (Class)getPUIGradientViewClass(v3);
  }
  return result;
}

id getPUIGradientViewClass()
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
  v0 = (void *)getPUIGradientViewClass_softClass;
  v7 = getPUIGradientViewClass_softClass;
  if (!getPUIGradientViewClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPUIGradientViewClass_block_invoke;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getPUIGradientViewClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D0052014(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPUIGradientViewClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  PosterUIFoundationLibrary();
  result = objc_getClass("PUIGradientView");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getPUIGradientViewClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getPUIGradientViewClass_block_invoke_cold_1();
    return (Class)_SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(v3);
  }
  return result;
}

id _SBIconUserInterfaceStyleTypeFromPUIHomeScreenStyleType(uint64_t a1)
{
  id *v1;

  if ((unint64_t)(a1 - 1) > 2)
    v1 = (id *)MEMORY[0x1E0DAA270];
  else
    v1 = (id *)qword_1E8D89F78[a1 - 1];
  return *v1;
}

uint64_t _PUIHomeScreenStyleTypeFromSBIconUserInterfaceStyleType(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DAA278]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DAA280]) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DAA268]))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetPUIStylePickerHomeScreenConfiguration(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  SBLogIcon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "Updating home screen configuration: %{public}@", (uint8_t *)&v7, 0xCu);
  }

  objc_msgSend(v4, "sbh_setHomeScreenConfiguration:", v3);
  SBLogIcon();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138543362;
    v8 = v3;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Updated home screen configuration: %{public}@", (uint8_t *)&v7, 0xCu);
  }

}

id SBHIconImageStyleConfigurationFromUserDefaults(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sbh_homeScreenConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    +[SBHIconImageStyleConfiguration styleConfigurationWithHomeScreenConfiguration:](SBHIconImageStyleConfiguration, "styleConfigurationWithHomeScreenConfiguration:", v1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetIconImageStyleConfiguration(void *a1, void *a2)
{
  id v3;
  id v4;

  v3 = a1;
  objc_msgSend(a2, "homeScreenConfiguration");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbh_setHomeScreenConfiguration:", v4);

}

id SBHHomeScreenDefaultsIconTintColor(void *a1)
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "sbh_homeScreenConfiguration");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "styleType") == 3)
  {
    objc_msgSend(v1, "accentColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SBHHomeScreenDefaultsSetIconTintColor(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;

  v3 = (objc_class *)MEMORY[0x1E0D7FCE8];
  v4 = a2;
  v5 = a1;
  v6 = objc_alloc_init(v3);
  v8 = v6;
  if (v4)
    v7 = 3;
  else
    v7 = 0;
  objc_msgSend(v6, "setStyleType:", v7);
  objc_msgSend(v8, "setAccentColor:", v4);

  SBHHomeScreenDefaultsSetPUIStylePickerHomeScreenConfiguration(v5, v8);
}

void sub_1D005281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D0055600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0056184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D0056458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0056894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00576CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

uint64_t _SBIconListIsCoordinateValidForGridSize(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5)
{
  unint64_t v5;
  unint64_t v6;

  v5 = a1 - 1;
  v6 = a1 - 1 + (unsigned __int16)a3;
  if ((a3 & 0xFFFE) != 0 && v6 <= (unsigned __int16)a4)
  {
    if ((a5 & 2) == 0
      && a1 != 1
      && (unsigned __int16)a4 - (unint64_t)(unsigned __int16)a3 != v5
      && v5 % (unsigned __int16)a3)
    {
      return 0;
    }
  }
  else if (v6 > (unsigned __int16)a4)
  {
    return 0;
  }
  return (a2 - 1 + (unint64_t)HIWORD(a3) <= HIWORD(a4)) & ((((a2 - 1) & 1) == 0) | ((a3 & 0xFFFE0000) == 0) | a5);
}

void sub_1D005888C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0058D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50)
{
  _Block_object_dispose(&a42, 8);
  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a50, 8);
  _Unwind_Resume(a1);
}

void sub_1D00592AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_1D005A6E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
  _Unwind_Resume(a1);
}

void sub_1D005C3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  _Block_object_dispose(&a34, 8);
  _Unwind_Resume(a1);
}

void sub_1D005C564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D005C808(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D005D080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D005DDEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1D00609B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0060B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D00615B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,char a63)
{
  char a67;

  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a63, 8);
  _Block_object_dispose(&a67, 8);
  _Unwind_Resume(a1);
}

void sub_1D0062BEC(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x200], 8);
  _Unwind_Resume(a1);
}

void sub_1D006336C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  _Block_object_dispose(&a39, 8);
  _Unwind_Resume(a1);
}

void sub_1D0064D10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0065E74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0065FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00661E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D006640C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D0066880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  uint64_t v32;

  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_1D00682AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D006985C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _SBIconListIsColumnValidForGridSize(unint64_t a1, unint64_t a2, unsigned __int16 a3, char a4)
{
  unint64_t v5;
  _BOOL8 result;

  v5 = a1 + a3;
  result = v5 <= a2;
  if ((a3 & 0xFFFE) != 0 && v5 <= a2)
  {
    result = 1;
    if ((a4 & 2) == 0)
    {
      if (a1)
      {
        if (a2 - a3 != a1)
          return a1 % a3 == 0;
      }
    }
  }
  return result;
}

uint64_t _SBIconListIsRowValidForGridSize(uint64_t a1, int a2, int a3, unsigned int a4)
{
  return (a1 + (unint64_t)HIWORD(a2) <= HIWORD(a3)) & (((a1 & 1) == 0) | ((a2 & 0xFFFE0000) == 0) | a4);
}

void sub_1D006BBD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D006C0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

BOOL tapInsideView(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = a2;
  objc_msgSend(a1, "locationInView:", v3);
  v6 = 0;
  if (v4 >= 0.0)
  {
    v7 = v5;
    if (v5 >= 0.0)
    {
      v8 = v4;
      objc_msgSend(v3, "bounds");
      if (v8 <= v9)
      {
        objc_msgSend(v3, "bounds");
        v6 = v7 <= v10;
      }
      else
      {
        v6 = 0;
      }
    }
  }

  return v6;
}

void sub_1D0078B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SBHGetApplicationIconImageWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  id v11;
  objc_class *v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  int v23;
  id v24;
  __int16 v25;
  double v26;
  __int16 v27;
  double v28;
  __int16 v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = (objc_class *)MEMORY[0x1E0D3A820];
  v13 = a2;
  v14 = (void *)objc_msgSend([v12 alloc], "initWithBundleIdentifier:", v11);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a4, a5, a6);
  SBHModifyImageDescriptorWithImageAppearance(v15, v13, a3);

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    SBLogIconImageCache();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138413058;
      v24 = v11;
      v25 = 2048;
      v26 = a4;
      v27 = 2048;
      v28 = a5;
      v29 = 1024;
      v30 = objc_msgSend(v15, "shouldApplyMask");
      _os_log_debug_impl(&dword_1CFEF3000, v16, OS_LOG_TYPE_DEBUG, "Main thread load of icon image for app %@ of size %fx%f, masked: %{BOOL}u", (uint8_t *)&v23, 0x26u);
    }

  }
  objc_msgSend(v14, "prepareImageForDescriptor:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v19 = (void *)MEMORY[0x1E0DC3870];
    v20 = objc_msgSend(v17, "CGImage");
    objc_msgSend(v18, "scale");
    objc_msgSend(v19, "imageWithCGImage:scale:orientation:", v20, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

void SBHModifyImageDescriptorWithImageAppearance(void *a1, void *a2, char a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v13 = a1;
  v5 = a2;
  v6 = objc_msgSend(v5, "appearanceType");
  if (v6 == 3)
  {
    objc_msgSend(v13, "setBackground:", 1);
    v8 = v13;
    v7 = 2;
    goto LABEL_5;
  }
  if (v6 != 2)
  {
    v7 = v6 == 1;
    v8 = v13;
LABEL_5:
    objc_msgSend(v8, "setAppearance:", v7);
    goto LABEL_6;
  }
  objc_msgSend(v5, "tintColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAppearance:", 2);
  if (v9)
  {
    v10 = objc_alloc(MEMORY[0x1E0D3A7A0]);
    v11 = objc_retainAutorelease(v9);
    v12 = (void *)objc_msgSend(v10, "initWithCGColor:", objc_msgSend(v11, "CGColor"));
    objc_msgSend(v13, "setTintColor:", v12);

  }
LABEL_6:
  objc_msgSend(v13, "setShouldApplyMask:", (a3 & 1) == 0);

}

id SBHIconServicesAddDebugImageOverlayWithImageAppearance(void *a1)
{
  return a1;
}

id SBHImageDescriptorWithTraitCollection(void *a1, char a2, double a3, double a4, double a5)
{
  objc_class *v9;
  id v10;
  void *v11;

  v9 = (objc_class *)MEMORY[0x1E0D3A830];
  v10 = a1;
  v11 = (void *)objc_msgSend([v9 alloc], "initWithSize:scale:", a3, a4, a5);
  SBHModifyImageDescriptorWithTraitCollection(v11, (uint64_t)v10, a2);

  return v11;
}

void SBHModifyImageDescriptorWithTraitCollection(void *a1, uint64_t a2, char a3)
{
  void *v5;
  id v6;
  id v7;

  v5 = (void *)MEMORY[0x1E0DC3E88];
  v6 = a1;
  objc_msgSend(v5, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  SBHModifyImageDescriptorWithImageAppearance(v6, v7, a3);

}

id SBHGetApplicationIconImageWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (void *)MEMORY[0x1E0DC3E88];
  v12 = a1;
  objc_msgSend(v11, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconImageWithImageAppearance(v12, v13, a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id SBHGetApplicationIconLayer(void *a1, char a2, double a3, double a4, double a5, double a6)
{
  id v11;
  void *v12;
  void *v13;

  v11 = a1;
  +[SBHIconImageAppearance defaultAppearance](SBHIconImageAppearance, "defaultAppearance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconLayerWithImageAppearance(v11, v12, a2, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id SBHGetApplicationIconLayerWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6, double a7)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  double v25;
  double v26;
  double v27;
  double v28;
  int v30;
  id v31;
  __int16 v32;
  double v33;
  __int16 v34;
  double v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v13 = a1;
  v14 = (objc_class *)MEMORY[0x1E0D3A820];
  v15 = a2;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithBundleIdentifier:", v13);
  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a4, a5, a6);
  SBHModifyImageDescriptorWithImageAppearance(v17, v15, a3);

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    SBLogIconImageCache();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v30 = 138413058;
      v31 = v13;
      v32 = 2048;
      v33 = a4;
      v34 = 2048;
      v35 = a5;
      v36 = 1024;
      v37 = objc_msgSend(v17, "shouldApplyMask");
      _os_log_debug_impl(&dword_1CFEF3000, v18, OS_LOG_TYPE_DEBUG, "Main thread load of icon layer for app %@ of size %fx%f, masked: %{BOOL}u", (uint8_t *)&v30, 0x26u);
    }

  }
  objc_msgSend(v16, "prepareImageForDescriptor:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "CALayer");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    if (v19)
    {
      v21 = (void *)MEMORY[0x1E0DC3870];
      v22 = objc_msgSend(v19, "CGImage");
      objc_msgSend(v19, "scale");
      objc_msgSend(v21, "imageWithCGImage:scale:orientation:", v22, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v23;
      if (v23)
      {
        objc_msgSend(v23, "size");
        v26 = v25;
        v28 = v27;
        v20 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
        objc_msgSend(v20, "setBounds:", 0.0, 0.0, v26, v28);
        v24 = objc_retainAutorelease(v24);
        objc_msgSend(v20, "setContents:", objc_msgSend(v24, "CGImage"));
        if (objc_msgSend(v17, "shouldApplyMask"))
        {
          objc_msgSend(v20, "setCornerRadius:", a7);
          objc_msgSend(v20, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
        }
        goto LABEL_12;
      }
    }
    else
    {
      v24 = 0;
    }
    v20 = 0;
LABEL_12:

  }
  return v20;
}

id SBHGetApplicationIconLayerWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6, double a7)
{
  void *v13;
  id v14;
  void *v15;
  void *v16;

  v13 = (void *)MEMORY[0x1E0DC3E88];
  v14 = a1;
  objc_msgSend(v13, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SBHGetApplicationIconLayerWithImageAppearance(v14, v15, a3, a4, a5, a6, a7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

id SBHTintedImageFromTintableImage(void *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[2];

  v26[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "scale");
  v10 = v9;
  v11 = objc_alloc(MEMORY[0x1E0D3A7C0]);
  v12 = objc_retainAutorelease(v4);
  v13 = objc_msgSend(v12, "CGImage");

  v14 = (void *)objc_msgSend(v11, "initWithCGImage:scale:", v13, v10);
  v15 = objc_alloc(MEMORY[0x1E0D3A820]);
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v15, "initWithImages:", v16);

  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v6, v8, v10);
  objc_msgSend(v18, "setAppearance:", 2);
  v19 = objc_alloc(MEMORY[0x1E0D3A7A0]);
  v20 = objc_retainAutorelease(v3);
  v21 = objc_msgSend(v20, "CGColor");

  v22 = (void *)objc_msgSend(v19, "initWithCGColor:", v21);
  objc_msgSend(v18, "setTintColor:", v22);
  objc_msgSend(v17, "prepareImageForDescriptor:", v18);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3870]), "initWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), 0, v10);

  return v24;
}

void SBHCacheIconImagesForApplications(void *a1, char a2, double a3, double a4, double a5)
{
  SBHCacheIconImagesForApplicationsWithTraitCollection(a1, 0, a2, a3, a4, a5);
}

void SBHCacheIconImagesForApplicationsWithTraitCollection(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(v11, (uint64_t)v12, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1D17DF4E4](v15);
        v21 = objc_alloc(MEMORY[0x1E0D3A820]);
        v22 = (void *)objc_msgSend(v21, "initWithBundleIdentifier:", v19, (_QWORD)v23);
        objc_msgSend(v22, "prepareImagesForImageDescriptors:", v13);

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v16 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v16 = v15;
    }
    while (v15);
  }

}

id imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(void *a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v11 = (void *)MEMORY[0x1E0DC3E88];
  v12 = a1;
  objc_msgSend(v11, "sbh_iconImageAppearanceFromTraitCollection:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(v13, a3, a4, a5, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void SBHCacheIconImagesForApplicationsWithImageAppearance(void *a1, void *a2, char a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v11 = a1;
  v12 = a2;
  imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(v12, a3, a4, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v11;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18);
        v20 = (void *)MEMORY[0x1D17DF4E4](v15);
        v21 = objc_alloc(MEMORY[0x1E0D3A820]);
        v22 = (void *)objc_msgSend(v21, "initWithBundleIdentifier:", v19, (_QWORD)v23);
        objc_msgSend(v22, "prepareImagesForImageDescriptors:", v13);

        objc_autoreleasePoolPop(v20);
        ++v18;
      }
      while (v16 != v18);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      v16 = v15;
    }
    while (v15);
  }

}

id imageDescriptorsForCachingIconImagesForApplicationsWithImageAppearance(void *a1, char a2, double a3, double a4, double a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;

  v9 = a1;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((a2 & 1) != 0)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a3, a4, a5);
    SBHModifyImageDescriptorWithImageAppearance(v11, v9, 0);
    objc_msgSend(v10, "addObject:", v11);

  }
  if ((a2 & 2) != 0)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", a3, a4, a5);
    SBHModifyImageDescriptorWithImageAppearance(v12, v9, 1);
    objc_msgSend(v10, "addObject:", v12);

  }
  return v10;
}

uint64_t SBHHasCachedIconImagesForApplications(void *a1, char a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v9 = a1;
  imageDescriptorsForCachingIconImagesForApplicationsWithTraitCollection(v9, 0, a2, a3, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = v9;
  v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v28)
  {
    v12 = *(_QWORD *)v34;
    v13 = 0x1E0D3A000uLL;
    v27 = *(_QWORD *)v34;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v11);
        v15 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1D17DF4E4]();
        v17 = (void *)objc_msgSend(objc_alloc(*(Class *)(v13 + 2080)), "initWithBundleIdentifier:", v15);
        v29 = 0u;
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v18 = v10;
        v19 = v10;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v30;
          while (2)
          {
            for (i = 0; i != v21; ++i)
            {
              if (*(_QWORD *)v30 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(v17, "imageForDescriptor:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i), v27);
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {

                objc_autoreleasePoolPop(v16);
                v25 = 0;
                v10 = v18;
                goto LABEL_19;
              }
            }
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            if (v21)
              continue;
            break;
          }
        }

        objc_autoreleasePoolPop(v16);
        ++v14;
        v10 = v18;
        v12 = v27;
        v13 = 0x1E0D3A000;
      }
      while (v14 != v28);
      v25 = 1;
      v28 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v28);
  }
  else
  {
    v25 = 1;
  }
LABEL_19:

  return v25;
}

uint64_t SBHIconServicesOptionsForImageOptions(int a1)
{
  return ~a1 & 1;
}

uint64_t SBHIconServicesCacheOptionsForImageOptions(char a1)
{
  if ((a1 & 1) != 0)
    return 1;
  else
    return 2;
}

id SBHIconServicesAddDebugImageOverlayWithTraitCollection(void *a1)
{
  return a1;
}

double _SBScaleIconZoomAnimatorCameraPositionToScaleModelPointToTargetPoint(double a1, double a2, double a3, double a4, double a5)
{
  double result;

  result = 1.0;
  if (a5 > 1.0)
    return -(a3 - a5 * a1) / (a5 + -1.0);
  return result;
}

void sub_1D007D0D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 144));
  _Unwind_Resume(a1);
}

void sub_1D007DE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getIXUninstallOptionsClass_block_invoke(uint64_t a1)
{
  InstallCoordinationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("IXUninstallOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIXUninstallOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getIXUninstallOptionsClass_block_invoke_cold_1();
    InstallCoordinationLibrary();
  }
}

void InstallCoordinationLibrary()
{
  void *v0;

  if (!InstallCoordinationLibraryCore_frameworkLibrary_0)
    InstallCoordinationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!InstallCoordinationLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getIXAppInstallCoordinatorClass_block_invoke_0(uint64_t a1)
{
  Class result;
  SBHFloatingDockVisualConfiguration *v3;
  SEL v4;
  id v5;

  InstallCoordinationLibrary();
  result = objc_getClass("IXAppInstallCoordinator");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getIXAppInstallCoordinatorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SBHFloatingDockVisualConfiguration *)__getIXAppInstallCoordinatorClass_block_invoke_cold_1();
    return (Class)-[SBHFloatingDockVisualConfiguration isEqual:](v3, v4, v5);
  }
  return result;
}

uint64_t SBHLibraryPresentationErrorForCode(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryPresentationErrorDomain"), a1, MEMORY[0x1E0C9AA70]);
}

uint64_t SBHLibraryPresentationErrorForCodeWithInfo(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryPresentationErrorDomain"), a1, a2);
}

uint64_t SBSLibraryPodPresentationErrorCodeForErrorCode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 9)
    return 0;
  return result;
}

id __BSSafeCast(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a1;
  if (a2)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = v3;
    else
      v4 = 0;
  }
  else
  {
    v4 = 0;
  }
  v5 = v4;

  return v5;
}

void sub_1D00848E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0084A54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0084B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0084CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0084E60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0084F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00850A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00851E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0085400(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00855A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0085770(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0085914(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0087534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D008AB20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D008AF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D008BFAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D008F908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CHSWidgetFamilyForSBHIconGridSizeClass(void *a1)
{
  void *v1;
  uint64_t v2;

  SBHGetIconGridSizeClassInfoValue(a1, CFSTR("SBHIconGridSizeClassRegistrationInfoKeyCHSWidgetFamily"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "integerValue");

  return v2;
}

id SBHIconGridSizeClassForCHSWidgetFamily(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __SBHIconGridSizeClassForCHSWidgetFamily_block_invoke;
  v2[3] = &__block_descriptor_40_e22_B16__0__NSDictionary_8l;
  v2[4] = a1;
  SBHGetIconGridSizeClassPassingTest(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t SBHFilterKnownCHSWidgetFamilies(uint64_t a1)
{
  uint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __SBHFilterKnownCHSWidgetFamilies_block_invoke;
  v4[3] = &unk_1E8D8B2A8;
  v4[4] = &v5;
  SBHEnumerateIconGridSizeClasses(v4);
  v2 = v6[3] & a1;
  _Block_object_dispose(&v5, 8);
  return v2;
}

void sub_1D0091FB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00921AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0092420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0093D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1D0094034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00942C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0094530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0094A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0094D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00950C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00951F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0095F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBTreeNodeContainsDescendantIndexPath(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  unint64_t v6;
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    v7 = v5;
    while (1)
    {
      objc_msgSend(v7, "children");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");
      v10 = objc_msgSend(v4, "indexAtPosition:", v6);
      if (v10 >= v9)
        break;
      objc_msgSend(v8, "objectAtIndex:", v10);
      v11 = objc_claimAutoreleasedReturnValue();

      ++v6;
      v7 = (void *)v11;
      if (v6 >= objc_msgSend(v4, "length"))
      {
        v12 = 1;
        v7 = (void *)v11;
        goto LABEL_8;
      }
    }

    v12 = 0;
  }
  else
  {
    v12 = 1;
    v7 = v5;
  }
LABEL_8:

  return v12;
}

id SBTreeNodeGetDescendantAtIndexPath(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  id v13;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  if (objc_msgSend(v4, "length"))
  {
    v7 = 0;
    v8 = v5;
    do
    {
      objc_msgSend(v8, "children");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");
      v11 = objc_msgSend(v4, "indexAtPosition:", v7);
      if (v11 >= v10)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Index %lu out of bounds for children array of length %lu"), v11, v10);
        objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99858], objc_claimAutoreleasedReturnValue(), 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        objc_exception_throw(v13);
      }
      objc_msgSend(v9, "objectAtIndex:", v11);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      ++v7;
      v8 = v6;
    }
    while (v7 < objc_msgSend(v4, "length"));
  }

  return v6;
}

uint64_t SBTreeNodeIsDescendantOfTreeNode(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(a1, "parent");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    do
    {
      v6 = objc_msgSend(v5, "isEqual:", v3);
      if ((v6 & 1) != 0)
        break;
      objc_msgSend(v5, "parent");
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v7;
    }
    while (v7);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id SBTreeNodeGetIndexPathForDescendantTreeNode(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  size_t v15;
  size_t v16;
  char *v17;
  char *v18;
  _QWORD v20[6];
  char v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "isEqual:", v4))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v4;
    objc_msgSend(v7, "parent");
    v8 = objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v9 = (void *)v8;
      while (1)
      {
        objc_msgSend(v9, "children");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "indexOfObject:", v7);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        if (objc_msgSend(v9, "isEqual:", v3))
          break;
        v13 = v9;

        objc_msgSend(v13, "parent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v7 = v13;
        if (!v9)
        {
          v5 = 0;
          v7 = v13;
          goto LABEL_16;
        }
      }
      v14 = v6;
      v15 = objc_msgSend(v14, "count");
      if (v15)
      {
        v16 = v15;
        if (v15 >= 0x10)
        {
          v17 = (char *)malloc_type_calloc(v15, 4uLL, 0x100004052888210uLL);
          v18 = v17;
        }
        else
        {
          v17 = 0;
          v18 = &v21;
        }
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = ___SBTreeNodeIndexPathFromReverseOfNSArray_block_invoke;
        v20[3] = &__block_descriptor_48_e25_v32__0__NSNumber_8Q16_B24l;
        v20[4] = v18;
        v20[5] = v16;
        objc_msgSend(v14, "enumerateObjectsWithOptions:usingBlock:", 2, v20);
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndexes:length:", v18, v16);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        free(v17);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "bs_emptyPath");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v5 = 0;
    }
LABEL_16:

  }
  return v5;
}

void SBTreeNodeInformOfAncestryChange(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "ancestryDidChange");
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(v1, "children", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        SBTreeNodeInformOfAncestryChange(*(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

id SBTreeNodeGetRootNode(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "parent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "parent");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      do
      {
        v5 = (void *)v4;

        objc_msgSend(v5, "parent");
        v4 = objc_claimAutoreleasedReturnValue();
        v3 = v5;
      }
      while (v4);
    }
    else
    {
      v5 = v3;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void SBTreeNodeSetParent(void *a1, uint64_t a2)
{
  id v3;

  v3 = a1;
  objc_msgSend(v3, "setParent:", a2);
  SBTreeNodeInformOfAncestryChange(v3);

}

void SBIconLocationGroupAddLocation(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;

  v8 = a1;
  v3 = a2;
  SBGetIconLocationGroups();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "addObject:", v3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v3);
    v7 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setObject:forKey:", v7, v8);
    v3 = (id)v7;
  }

}

__CFString *SBIconLocationSelectLocationWithWidgets(void *a1, int a2)
{
  __CFString *v3;
  int v4;
  __CFString *v5;
  __CFString *v6;

  v3 = a1;
  v4 = -[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("SBIconLocationRoot"));
  v5 = CFSTR("SBIconLocationRootWithWidgets");
  if (!v4 || (a2 & 1) == 0)
  {
    if (-[__CFString isEqualToString:](v3, "isEqualToString:", CFSTR("SBIconLocationRootWithWidgets")) ^ 1 | a2)
      v5 = v3;
    else
      v5 = CFSTR("SBIconLocationRoot");
  }
  v6 = v5;

  return v6;
}

BOOL SBHIconGridSizeEqualToIconGridSize(int a1, int a2)
{
  return a2 == a1;
}

uint64_t SBHIconGridSizeGetSmallestDimension(uint64_t result)
{
  if ((unsigned __int16)result >= WORD1(result))
    return WORD1(result);
  else
    return (unsigned __int16)result;
}

uint64_t SBHIconGridSizeGetLargestDimension(uint64_t result)
{
  if ((unsigned __int16)result <= WORD1(result))
    return WORD1(result);
  else
    return (unsigned __int16)result;
}

BOOL SBHIconGridSizeIsPortrait(int a1)
{
  return HIWORD(a1) > (unsigned __int16)a1;
}

BOOL SBHIconGridSizeIsLandscape(int a1)
{
  return HIWORD(a1) < (unsigned __int16)a1;
}

uint64_t SBHIconGridSizeRotate(int a1)
{
  unint64_t v2;

  HIDWORD(v2) = a1;
  LODWORD(v2) = a1;
  return (v2 >> 16);
}

uint64_t SBHIconGridSizeRotateWithOptions(uint64_t result, char a2)
{
  unsigned int v2;
  unint64_t v3;

  HIDWORD(v3) = result;
  LODWORD(v3) = result;
  v2 = v3 >> 16;
  if ((a2 & 2) != 0)
    return v2;
  else
    return result;
}

BOOL SBHIconGridSizeIsDefault(int a1)
{
  return a1 == 65537;
}

BOOL SBHIconGridSizeIsEmpty(int a1)
{
  return (a1 & 0xFFFF0000) == 0 || (unsigned __int16)a1 == 0;
}

BOOL SBHIconGridSizeContainsCellIndex(int a1, unint64_t a2)
{
  return HIWORD(a1) * (unint64_t)(unsigned __int16)a1 > a2;
}

id SBHStringForGridCellInfoOptions(char a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("ReversedOrder"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_10;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("RotatedGrid"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
LABEL_11:
    objc_msgSend(v3, "addObject:", CFSTR("IconReordering"));
    if ((a1 & 0x10) == 0)
      goto LABEL_7;
    goto LABEL_6;
  }
LABEL_10:
  objc_msgSend(v3, "addObject:", CFSTR("AllowGaps"));
  if ((a1 & 8) != 0)
    goto LABEL_11;
LABEL_5:
  if ((a1 & 0x10) != 0)
LABEL_6:
    objc_msgSend(v3, "addObject:", CFSTR("FlippedGrid"));
LABEL_7:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

unint64_t SBHIconGridDistanceBetweenGridCellIndexes(unint64_t a1, unint64_t a2, unsigned __int16 a3)
{
  unint64_t v3;
  unint64_t v4;

  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    v3 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v3 = a1 % a3 + 1;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v4 = a2 % a3 + 1;
  return v4 - v3;
}

uint64_t SBHIconGridDistanceBetweenGridRanges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  unsigned __int16 v6;
  int v11;
  int64x2_t v12;
  BOOL v13;
  unint64_t v14;
  int v15;
  uint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  int64x2_t v24;
  uint64_t v25;
  int64x2_t v27;

  v6 = a4;
  SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  v12.i64[0] = 0;
  if ((_WORD)v11)
    v13 = (v11 & 0xFFFF0000) == 0;
  else
    v13 = 1;
  if (v13)
  {
    v14 = 0;
    v15 = HIWORD(a2);
    v16 = a1 + (unsigned __int16)a2 - 1;
    v17 = a5;
    v18 = v16 + (v15 - 1) * (unint64_t)a5;
    v19 = a1 + v17 * (uint64_t)(v15 - 1);
    v20 = a3 + v6 - 1;
    v12 = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    do
    {
      v27 = v12;
      if (v14 >= 0xC)
        v21 = v19;
      else
        v21 = v18;
      if (v14 < 8)
        v21 = v16;
      if (v14 >= 4)
        v22 = v21;
      else
        v22 = a1;
      if ((v14 & 3) != 0)
        v23 = v20;
      else
        v23 = a3;
      v24.i64[0] = SBHIconGridDistanceBetweenGridCellIndexes(v22, v23, a5);
      v24.i64[1] = v25;
      v12 = (int64x2_t)vbslq_s8((int8x16_t)vcgtq_u64((uint64x2_t)vabsq_s64(v27), (uint64x2_t)vabsq_s64(v24)), (int8x16_t)v24, (int8x16_t)v27);
      ++v14;
    }
    while (v14 != 16);
  }
  return v12.i64[0];
}

uint64_t SBHIconGridRangeIntersection(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  result = 0x7FFFFFFFFFFFFFFFLL;
  if (a1 != 0x7FFFFFFFFFFFFFFFLL && a3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = a1 / a5;
    v9 = a1 % a5;
    v10 = a3 / a5;
    v11 = a3 % a5;
    if (v9 + (unsigned __int16)a2 > v11)
    {
      v12 = v11 + (unsigned __int16)a4;
      if (v12 > v9)
      {
        v13 = v8 + HIWORD(a2);
        if (v13 > v10)
        {
          v14 = v10 + HIWORD(a4);
          if (v14 > v8)
          {
            if (v9 <= v11)
              v9 = a3 % a5;
            if (v8 > v10)
              v10 = v8;
            return v9 + v10 * a5;
          }
        }
      }
    }
  }
  return result;
}

uint64_t SBHIconGridRangeMaxCellIndexOnRow(uint64_t a1, unsigned __int16 a2, unsigned __int16 a3, uint64_t a4)
{
  return a1 + a2 + a3 * a4;
}

unint64_t SBHIconGridRangeMaxCellIndex(uint64_t a1, int a2, unsigned __int16 a3)
{
  return a1 + (unsigned __int16)a2 + (HIWORD(a2) - 1) * (unint64_t)a3;
}

uint64_t SBHIconGridRangeMinCellIndexOnRow(uint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  return a1 + a3 * a4;
}

__CFString *SBStringForIconListDragHitRegion(char a1)
{
  id v2;
  void *v3;
  __CFString *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("inside"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 4) == 0)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("center"));
  if ((a1 & 4) == 0)
  {
LABEL_4:
    if ((a1 & 8) == 0)
      goto LABEL_5;
    goto LABEL_13;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", CFSTR("top"));
  if ((a1 & 8) == 0)
  {
LABEL_5:
    if ((a1 & 0x10) == 0)
      goto LABEL_6;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(v3, "addObject:", CFSTR("bottom"));
  if ((a1 & 0x10) == 0)
  {
LABEL_6:
    if ((a1 & 0x20) == 0)
      goto LABEL_8;
    goto LABEL_7;
  }
LABEL_14:
  objc_msgSend(v3, "addObject:", CFSTR("left"));
  if ((a1 & 0x20) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("right"));
LABEL_8:
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("none");
  }

  return v4;
}

__CFString *SBHStringForIconListIconSpacingAxisMatchingBehavior(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E8D8B670[a1];
}

void SBHRegisterIconGridSizeClass(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerIconGridSizeClass:info:", v4, v3);

}

void SBHRegisterIconGridSizeClasses(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "registerIconGridSizeClasses:", v1);

}

id SBHGetIconGridSizeClassInfoValue(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoValueForGridSizeClass:forKey:", v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id SBHGetIconGridSizeClassPassingTest(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconGridSizeClassPassingTest:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SBHShortStringForIconGridSizeClass(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "shortDescriptionForGridSizeClass:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id SBHIconGridSizeClassForString(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gridSizeClassForDescription:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void SBHEnumerateFilteredIconGridSizeClasses(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v4 = a1;
  +[SBHIconGridSizeClassDomain globalDomain](SBHIconGridSizeClassDomain, "globalDomain");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateGridSizeClassesFilteredBySet:usingBlock:", v4, v3);

}

void SBHIconGridSizeClassGroupAddGridSizeClass(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a1;
  v3 = a2;
  v4 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
  if (!SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("SBHIconGridSizeClassGroupBuiltIn"), CFSTR("SBHIconGridSizeClassGroupBuiltInNonDefault"), 0);
    v6 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
    SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups = v5;

    v4 = (void *)SBGetBuiltInGridSizeClassGroups_builtInGridSizeClassGroups;
  }
  if ((objc_msgSend(v4, "containsObject:", v11) & 1) == 0)
  {
    SBGetGridSizeClassGroups();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "addObject:", v3);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v3);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKey:", v10, v11);

    }
  }

}

id SBGetGridSizeClassGroups()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v0 = (void *)SBGetGridSizeClassGroups_groups;
  if (!SBGetGridSizeClassGroups_groups)
  {
    v1 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v2 = (void *)SBGetGridSizeClassGroups_groups;
    SBGetGridSizeClassGroups_groups = (uint64_t)v1;

    v3 = (void *)SBGetGridSizeClassGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBHIconGridSizeClassDefault"), CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("SBHIconGridSizeClassGroupAll"));

    v5 = (void *)SBGetGridSizeClassGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("SBHIconGridSizeClassGroupAllNonDefault"));

    v7 = (void *)SBGetGridSizeClassGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBHIconGridSizeClassDefault"), CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKey:", v8, CFSTR("SBHIconGridSizeClassGroupBuiltIn"));

    v9 = (void *)SBGetGridSizeClassGroups_groups;
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), CFSTR("SBHIconGridSizeClassExtraLarge"), CFSTR("SBHIconGridSizeClassNewsLargeTall"), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("SBHIconGridSizeClassGroupBuiltInNonDefault"));

    v0 = (void *)SBGetGridSizeClassGroups_groups;
  }
  return v0;
}

uint64_t SBHIconGridSizeClassGroupContainsGridSizeClass(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  v4 = a1;
  SBGetGridSizeClassGroups();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "containsObject:", v3);
  return v7;
}

id SBHIconGridSizeClassGroupGetSizeClasses(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  SBGetGridSizeClassGroups();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(v3, "copy");
  return v4;
}

uint64_t SBHIconLocationIsAppPrediction(void *a1)
{
  id v1;
  _QWORD *v2;
  uint64_t v3;
  _Unwind_Exception *IsAppPrediction_cold_1;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (_QWORD *)getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  v10 = getAPUIIconLocationAppPredictionsSymbolLoc_ptr;
  if (!getAPUIIconLocationAppPredictionsSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke;
    v6[3] = &unk_1E8D85AF8;
    v6[4] = &v7;
    __getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (_QWORD *)v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    IsAppPrediction_cold_1 = (_Unwind_Exception *)SBHIconLocationIsAppPrediction_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(IsAppPrediction_cold_1);
  }
  v3 = objc_msgSend(v1, "isEqualToString:", *v2);

  return v3;
}

id SBHIconGridRangeCellIndexes(uint64_t a1, int a2, unsigned __int16 a3)
{
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __SBHIconGridRangeCellIndexes_block_invoke;
  v9[3] = &unk_1E8D88CB0;
  v7 = v6;
  v10 = v7;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a3, v9);

  return v7;
}

void SBHIconGridRangeEnumerateSubranges(unint64_t a1, int a2, int a3, unsigned __int16 a4, char a5, void *a6)
{
  uint64_t v10;
  uint64_t v11;
  char v12;
  unint64_t v13;
  int v14;
  int v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  void (**v29)(id, unint64_t, _QWORD, char *);
  unsigned int v30;
  char v32;

  v29 = a6;
  v30 = a3;
  if ((a5 & 1) != 0)
    v10 = 1;
  else
    v10 = (unsigned __int16)a3;
  if ((a5 & 1) != 0)
    v11 = 1;
  else
    v11 = HIWORD(a3);
  v26 = v11;
  v27 = HIWORD(a2);
  if (HIWORD(a2))
  {
    v12 = a5;
    v28 = 0;
    v13 = (unsigned __int16)a2;
    v25 = a5 & 6;
    v14 = a3;
    v15 = a2;
    v24 = (unsigned __int16)a2 - 1;
    while (!v13)
    {
LABEL_24:
      v28 += v26;
      if (v28 >= v27)
        goto LABEL_25;
    }
    v16 = 0;
    v17 = v27 + ~v28;
    if (!v25)
      v17 = v28;
    v18 = v24;
    v19 = a1 + v17 * a4;
    while (1)
    {
      v20 = (v12 & 4) != 0 ? v18 : v16;
      v21 = v19 + v20;
      v32 = 0;
      if (SBHIconGridRangeIntersection(a1, v15, v19 + v20, v14, a4) == v19 + v20 && v22 == v30)
      {
        v29[2](v29, v21, v30, &v32);
        if (v32)
          break;
      }
      v16 += v10;
      v18 -= v10;
      if (v16 >= v13)
        goto LABEL_24;
    }
  }
LABEL_25:

}

BOOL SBHIconGridRangeContainsIconGridRange(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t v7;
  int v8;
  _BOOL4 v9;

  v7 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  v9 = ((v8 ^ a4) & 0xFFFF0000) == 0 && (unsigned __int16)v8 == (unsigned __int16)a4;
  return v7 == a3 && v9;
}

void SBHIconGridRangeEnumerateRows(unint64_t a1, int a2, unsigned __int16 a3, char a4, void *a5)
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];

  v9 = a5;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __SBHIconGridRangeEnumerateRows_block_invoke;
  v11[3] = &unk_1E8D8A170;
  v10 = v9;
  v12 = v10;
  v13 = v14;
  SBHIconGridRangeEnumerateSubranges(a1, a2, (unsigned __int16)a2 | 0x10000, a3, a4, v11);

  _Block_object_dispose(v14, 8);
}

void sub_1D009998C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHIconGridRangeCellIndexBelowColumn(uint64_t a1, int a2, int a3, uint64_t a4)
{
  if (a1 + a4 + (unint64_t)(HIWORD(a2) * (unsigned __int16)a3) >= HIWORD(a3)
                                                                                      * (unint64_t)(unsigned __int16)a3)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return a1 + a4 + HIWORD(a2) * (unsigned __int16)a3;
}

uint64_t SBHIconGridRangeCellIndexAboveColumn(unint64_t a1, uint64_t a2, unsigned __int16 a3, uint64_t a4)
{
  if (a1 >= a3)
    return a1 + a4 - a3;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t SBHIconGridRangeRowForCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 / a4 - a1 / a4;
}

unint64_t SBHIconGridRangeColumnForCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a4 + a1 / a4 * a4 - a1;
}

unint64_t SBHIconGridRangeRelativeCellIndexForCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a4 + a1 / a4 * a4 - a1 + (a3 / a4 - a1 / a4) * a2;
}

unint64_t SBHIconGridRangeCellIndexForRelativeCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, unsigned __int16 a4)
{
  return a3 % a2 + a1 % a4 + (a3 / a2 + a1 / a4) * a4;
}

unint64_t SBHIconGridRangeRelativeRowForRelativeCellIndex(uint64_t a1, unsigned __int16 a2, unint64_t a3)
{
  return a3 / a2;
}

unint64_t SBHIconGridRangeRelativeColumnForRelativeCellIndex(uint64_t a1, unsigned __int16 a2, unint64_t a3)
{
  return a3 % a2;
}

uint64_t SBHIconGridRangeCellIndexForCorner(uint64_t result, int a2, char a3, unsigned __int16 a4)
{
  uint64_t v4;
  int v5;
  unint64_t v6;

  if ((a3 & 1) == 0)
  {
    if ((a3 & 2) != 0)
    {
      return result + (unsigned __int16)a2 - 1;
    }
    else
    {
      v4 = 0x7FFFFFFFFFFFFFFFLL;
      v5 = HIWORD(a2) - 1;
      if ((a3 & 4) != 0)
        v4 = result + v5 * (unint64_t)a4;
      v6 = result + (unsigned __int16)a2 + v5 * (unint64_t)a4 - 1;
      if ((a3 & 8) != 0)
        return v6;
      else
        return v4;
    }
  }
  return result;
}

void SBHIconGridRangeEnumerateCorners(uint64_t a1, int a2, unsigned __int16 a3, void *a4)
{
  void (**v7)(id, uint64_t, uint64_t, char *);
  uint64_t v8;
  int v9;
  char v10;

  v7 = a4;
  v10 = 0;
  v7[2](v7, 1, a1, &v10);
  if (!v10)
  {
    v8 = a1 + (unsigned __int16)a2 - 1;
    v7[2](v7, 2, v8, &v10);
    if (!v10)
    {
      v9 = HIWORD(a2) - 1;
      v7[2](v7, 8, v8 + v9 * (unint64_t)a3, &v10);
      if (!v10)
        v7[2](v7, 4, v9 * (unint64_t)a3 + a1, &v10);
    }
  }

}

uint64_t SBHIconGridRangeContainsCellIndex(uint64_t a1, int a2, uint64_t a3, unsigned __int16 a4)
{
  uint64_t v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __SBHIconGridRangeContainsCellIndex_block_invoke;
  v6[3] = &unk_1E8D8B638;
  v6[4] = &v7;
  v6[5] = a3;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a4, v6);
  v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void sub_1D0099C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SBHIconGridRangeAddCellIndex(unint64_t a1, uint64_t a2, unint64_t a3, unsigned __int16 a4)
{
  return SBHIconGridRangeUnion(a1, a2, a3, 65537, a4);
}

unint64_t SBHIconGridRangeUnion(unint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4, unsigned __int16 a5)
{
  unint64_t v5;
  unint64_t v6;

  if (a1 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    {
      return a1;
    }
    else
    {
      v5 = a1 / a5;
      v6 = a1 % a5;
      if (v6 >= a3 % a5)
        v6 = a3 % a5;
      if (v5 >= a3 / a5)
        v5 = a3 / a5;
      return v6 + v5 * a5;
    }
  }
  return a3;
}

id SBHIconGridRangeCellIndexesNotInIconGridRange(uint64_t a1, int a2, uint64_t a3, uint64_t a4, int a5)
{
  id v10;
  id v11;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  int v17;

  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __SBHIconGridRangeCellIndexesNotInIconGridRange_block_invoke;
  v13[3] = &unk_1E8D8B258;
  v15 = a3;
  v16 = a4;
  v17 = a5;
  v11 = v10;
  v14 = v11;
  SBHIconGridRangeEnumerateCellIndexes(a1, a2, a5, v13);

  return v11;
}

BOOL SBHIconGridRangeEqualToIconGridRange(uint64_t a1, int a2, uint64_t a3, int a4)
{
  _BOOL4 v4;

  v4 = ((a4 ^ a2) & 0xFFFF0000) == 0 && (unsigned __int16)a4 == (unsigned __int16)a2;
  return a1 == a3 && v4;
}

uint64_t SBHStringForIconGridRange(uint64_t a1, int a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu:%u×%u"), a1, (unsigned __int16)a2, HIWORD(a2));
}

id SBHLayoutDescriptionForIconGridRange(uint64_t a1, int a2, unsigned int a3)
{
  unint64_t v3;
  void *v7;
  int v8;
  uint64_t v9;
  int v10;
  const __CFString *v11;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3 >= 0x10000)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v10 = (unsigned __int16)a3;
      if ((_WORD)a3)
      {
        do
        {
          v3 = v3 & 0xFFFFFFFF00000000 | a3;
          if (SBHIconGridRangeContainsCellIndex(a1, a2, v9, v3))
            v11 = CFSTR("*\t");
          else
            v11 = CFSTR("-\t");
          objc_msgSend(v7, "appendString:", v11);
          ++v9;
          --v10;
        }
        while (v10);
      }
      objc_msgSend(v7, "appendString:", CFSTR("\n"));
      ++v8;
    }
    while (v8 != HIWORD(a3));
  }
  return v7;
}

unint64_t SBHIconGridRangeGetBounds@<X0>(unint64_t result@<X0>, int a2@<W1>, unsigned __int16 a3@<W2>, unint64_t *a4@<X8>)
{
  unint64_t v4;
  unint64_t v5;

  v4 = result / a3;
  v5 = result % a3;
  *a4 = v5;
  a4[1] = v5 + (unsigned __int16)a2;
  a4[2] = v4;
  a4[3] = v4 + HIWORD(a2);
  return result;
}

uint64_t SBHIconGridRangeBoundsGetRange(uint64_t *a1, unsigned __int16 a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
    return v3 + a1[2] * a2;
  return result;
}

BOOL SBHIconGridRangeIntersects(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  int v5;

  SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  return (v5 & 0xFFFF0000) != 0 && (unsigned __int16)v5 != 0;
}

BOOL SBHIconGridRangeIsEmpty(uint64_t a1, int a2)
{
  return (a2 & 0xFFFF0000) == 0 || (unsigned __int16)a2 == 0;
}

uint64_t SBHIconGridRangeDivide(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, int a6, unsigned __int16 a7)
{
  unint64_t v7;

  v7 = a2 >> 16;
  switch(a6)
  {
    case 0:
      *(_QWORD *)a3 = result;
      *(_WORD *)(a3 + 8) = a5;
      *(_WORD *)(a3 + 10) = WORD1(a2);
      *(_QWORD *)a4 = result + a5;
      goto LABEL_5;
    case 1:
      *(_QWORD *)a3 = result;
      *(_WORD *)(a3 + 8) = a2;
      *(_WORD *)(a3 + 10) = a5;
      *(_QWORD *)a4 = result + a7 * (unint64_t)a5;
      goto LABEL_7;
    case 2:
      *(_QWORD *)a3 = result + (unsigned __int16)a2 - a5;
      *(_WORD *)(a3 + 8) = a5;
      *(_WORD *)(a3 + 10) = WORD1(a2);
      *(_QWORD *)a4 = result;
LABEL_5:
      *(_WORD *)(a4 + 8) = a2 - a5;
      goto LABEL_8;
    case 3:
      *(_QWORD *)a3 = result + a7 * WORD1(a2) - a7 * a5;
      *(_WORD *)(a3 + 8) = a2;
      *(_WORD *)(a3 + 10) = a5;
      *(_QWORD *)a4 = result;
LABEL_7:
      *(_WORD *)(a4 + 8) = a2;
      LOWORD(v7) = WORD1(a2) - a5;
LABEL_8:
      *(_WORD *)(a4 + 10) = v7;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t SBHIconGridRangeInset(unint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5)
{
  int v6;
  __int16 v7;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int16 v16;
  int v17;
  unsigned __int16 v18;

  v6 = a4;
  v7 = a3;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v9 = a1 % (unsigned __int16)a5 + 1;
    v10 = a1 / (unsigned __int16)a5 + 1;
  }
  v11 = v9 + a3;
  v12 = v10 + a4;
  if ((uint64_t)(v10 + a4) <= 1)
    v13 = 1;
  else
    v13 = v10 + a4;
  if (v11 <= 1)
    v14 = 1;
  else
    v14 = v9 + a3;
  if (SBIconCoordinateIsNotFound(v14, v13))
    v15 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v15 = v14 + (v13 - 1) * (unsigned __int16)a5 - 1;
  v16 = v11 - 1;
  v17 = v12 - 1;
  if (v11 > 0)
    v16 = 0;
  v18 = a2 - 2 * v7 + v16;
  if (v12 > 0)
    v17 = 0;
  return SBHIconGridRangeIntersection(v15, ((v17 - 2 * v6 + HIWORD(a2)) << 16) | v18, 0, a5, a5);
}

unint64_t SBHIconGridRangeSubrangeIncludingCellIndex(unint64_t a1, unsigned __int16 a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 IsNotFound;
  unint64_t v13;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    v9 = a5;
  }
  else
  {
    v9 = a5;
    v8 = a3 % a5 + 1;
    v7 = a3 / a5 + 1;
  }
  v10 = (uint64_t)(v8 - 1) / (unsigned __int16)a4 * (unsigned __int16)a4;
  v11 = (uint64_t)(v7 - 1) / HIWORD(a4) * HIWORD(a4);
  IsNotFound = SBIconCoordinateIsNotFound(v10 + 1, v11 + 1);
  v13 = v10 + v11 * v9;
  if (IsNotFound)
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  return v13 % a2 + a1 % v9 + (v13 / a2 + a1 / v9) * v9;
}

uint64_t SBHIconGridRangeAnchoredEdges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  uint64_t v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v9 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5);
  v12 = v9 + v11 + (v10 - 1) * (unint64_t)a5 - 1;
  v13 = SBHIconGridRangeContainsCellIndex(a3, (unsigned __int16)a4 | 0x10000u, v9, a5);
  if (SBHIconGridRangeContainsCellIndex(a3 - a5 + a5 * HIWORD(a4), (unsigned __int16)a4 | 0x10000u, v12, a5))v14 = v13 | 4;
  else
    v14 = v13;
  if (SBHIconGridRangeContainsCellIndex(a3, a4 & 0xFFFF0000 | 1, v9, a5))
    v15 = v14 | 2;
  else
    v15 = v14;
  if (SBHIconGridRangeContainsCellIndex(a3 + (unsigned __int16)a4 - 1, a4 & 0xFFFF0000 | 1, v12, a5))
    return v15 | 8;
  else
    return v15;
}

uint64_t SBHIconGridRangeTouchedEdges(unint64_t a1, int a2, unint64_t a3, int a4, unsigned __int16 a5)
{
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  uint64_t v19;
  BOOL v20;
  unint64_t v21;
  uint64_t v22;
  unint64_t v23;
  _BOOL4 v24;
  _BOOL4 v25;
  uint64_t v26;
  int v27;
  uint64_t v28;

  if (SBHIconGridRangeIntersection(a1, a2, a3, (HIWORD(a4) << 16) | (unsigned __int16)a4, a5) != 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v10 = a1 / a5;
  v11 = a1 % a5;
  v12 = v10 + HIWORD(a2);
  v13 = a3 / a5;
  v14 = a3 % a5;
  v15 = v13 + HIWORD(a4);
  v16 = v10 - HIWORD(a4);
  if (v10 < HIWORD(a4))
    v16 = 0;
  v17 = v13 >= v16;
  v18 = v15 <= v12 + HIWORD(a4);
  v19 = 2;
  if (v11 != v14 + (unsigned __int16)a4 || !v17 || !v18)
    v19 = 0;
  v20 = !v17 || !v18;
  v21 = v11 + (unsigned __int16)a2;
  v22 = v19 | 8;
  if (v20)
    v22 = 0;
  v23 = v11 - (unsigned __int16)a4;
  if (v11 < (unsigned __int16)a4)
    v23 = 0;
  v24 = v14 >= v23;
  v25 = v14 <= v21;
  if (v21 == v14)
    v26 = v22;
  else
    v26 = v19;
  v27 = v24 && v25;
  v20 = v27 == 0;
  v28 = v26 | (v10 == v15) & v27;
  if (!v20)
    v26 = v28 | 4;
  if (v12 == v13)
    return v26;
  else
    return v28;
}

void SBHIconGridRangeEnumerateTouchingRanges(unint64_t a1, unint64_t a2, unint64_t a3, unsigned int a4, uint64_t a5, void *a6)
{
  unint64_t v7;
  unint64_t v10;
  void (**v11)(id, unint64_t, _QWORD, unint64_t *);
  BOOL v12;
  unsigned int v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  BOOL v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  BOOL v52;
  BOOL v53;
  uint64_t v54;
  unint64_t v55;
  unint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (**v60)(id, unint64_t, _QWORD, unint64_t *);
  id v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  char v66;
  int v67;
  int v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  int v72;
  unint64_t v73;
  unint64_t v74;
  uint64_t v75;

  v7 = a3;
  v10 = a3 >> 16;
  v11 = a6;
  if (((unsigned __int16)v7 | ((unsigned __int16)v10 << 16)) >= 0x10000u)
  {
    v12 = !(_WORD)v7 || (unsigned __int16)a4 == 0;
    if (!v12 && (a4 & 0xFFFF0000) != 0)
    {
      v59 = (unsigned __int16)v7 | ((unsigned __int16)v10 << 16);
      v60 = v11;
      v68 = a4;
      v72 = (unsigned __int16)(a4 + 2 * v7);
      if (a4 >= 0xFFFF0000)
        v14 = -65536;
      else
        v14 = (a4 & 0xFFFF0000) + ((_DWORD)v10 << 17);
      v15 = v14 & 0xFFFF0000 | (unsigned __int16)(a4 + 2 * v7);
      v70 = (unsigned __int16)v7 + v72 * WORD1(v7);
      v58 = (unsigned __int16)a4;
      v16 = a1 % (unsigned __int16)a4
          + ((unsigned __int16)v7 + v72 * WORD1(v7)) % (unsigned __int16)v15
          + (a1 / (unsigned __int16)a4 + ((unsigned __int16)v7 + v72 * WORD1(v7)) / (unsigned __int16)v15)
          * (unsigned __int16)v15;
      v67 = a2;
      v17 = v16 + (unsigned __int16)a2;
      v18 = v7;
      v61 = objc_alloc_init(MEMORY[0x1E0CB3788]);
      v19 = 0;
      v66 = 0;
      v63 = (unsigned __int16)v7;
      v20 = v16 < (unsigned __int16)v15;
      if (v16 >= (unsigned __int16)v15)
        v21 = ~(unint64_t)(unsigned __int16)v15 + (unsigned __int16)a2 + v16;
      else
        v21 = 0x7FFFFFFFFFFFFFFFLL;
      v57 = WORD1(v7) - 1;
      v23 = v21 < (unsigned __int16)v15 || v21 - (unsigned __int16)v15 == 0x7FFFFFFFFFFFFFFFLL;
      v53 = v23;
      v24 = v72 * WORD1(a2);
      v25 = v16 + v24;
      v26 = (v15 >> 16) * (unint64_t)(unsigned __int16)v15;
      if (v16 + v24 >= v26)
        v25 = 0x7FFFFFFFFFFFFFFFLL;
      v51 = v16 - (unsigned __int16)v15;
      if (v51 == 0x7FFFFFFFFFFFFFFFLL)
        v20 = 1;
      v52 = v20;
      v69 = v16;
      v27 = v24 + (unsigned __int16)a2 + v16 - 1;
      if (v27 >= v26)
        v27 = 0x7FFFFFFFFFFFFFFFLL;
      v64 = v27;
      v65 = (unsigned __int16)v15;
      v62 = WORD1(v7);
      v54 = (unsigned __int16)v7;
      v55 = v21;
      v47 = v21 + (unsigned __int16)v15 - (unsigned __int16)v15 * (unint64_t)WORD1(v7);
      v56 = v25;
      v48 = v25 - (unsigned __int16)v7;
      v50 = -(uint64_t)(unsigned __int16)v15;
      v73 = v15;
      v49 = 2 * (unsigned __int16)v15 + 0x7FFFFFFFFFFFFFFFLL;
      v28 = v15;
      while (1)
      {
        while (1)
        {
          v7 = v7 & 0xFFFFFFFF00000000 | v73;
          v30 = SBHIconGridRangeIntersection(v17, v18, v70, v68, v7) == v17 && v29 == v18;
          if (v30 && (objc_msgSend(v61, "containsIndex:", v17) & 1) == 0)
          {
            LOBYTE(v74) = 0;
            v60[2](v60, v17 % v65+ (v70 / v65) * (unint64_t)v65- v70+ (v17 / v65 - v70 / v65) * v58, v59, &v74);
            if ((_BYTE)v74)
            {
LABEL_91:

              v11 = v60;
              goto LABEL_92;
            }
            objc_msgSend(v61, "addIndex:", v17);
          }
          if (v19 - 2 < 2)
          {
            v32 = v63;
            v31 = v71;
          }
          else
          {
            v31 = v71;
            v32 = v19 > 1 ? 0 : v62;
          }
          v74 = v17;
          v75 = v18;
          v33 = v31 & 0xFFFFFFFF00000000;
          v71 = v33 | v28;
          v34 = SBHIconGridRangeOffset(&v74, v19, v32, v33 | v28);
          v35 = v74;
          v36 = v75;
          a2 = a2 & 0xFFFFFFFF00000000 | v28;
          v37 = SBHIconGridRangeTouchedEdges(v69, v67, v74, v75, a2);
          if (v35 == v17 || !v37 || v34 != v32)
            break;
          v17 = v35;
          v18 = v36;
LABEL_46:
          if ((v66 & (v19 == 2)) == 1)
            goto LABEL_91;
        }
        switch(v19)
        {
          case 0uLL:
            if (v64 / v65 == (v64 + (unsigned __int16)v18) / v65)
              v17 = v64 + 1;
            else
              v17 = v64;
            v19 = 2;
            goto LABEL_46;
          case 1uLL:
            if (v62)
            {
              v39 = v63;
              if (v52)
              {
                v17 = v69;
              }
              else
              {
                v18 = v18;
                v45 = v62;
                v46 = v51;
                do
                {
                  v17 = v46;
                  if (!--v45)
                    break;
                  v46 -= v65;
                  if (v17 < v65)
                    break;
                }
                while (v46 != 0x7FFFFFFFFFFFFFFFLL);
              }
            }
            else
            {
              v17 = v69;
              v39 = v63;
            }
            if (v39)
            {
              v41 = v17 - v54;
              v42 = v39;
              while (v17 && v17 / v65 == (v17 - 1) / v65)
              {
                --v17;
                if (!--v42)
                {
                  v17 = v41;
                  break;
                }
              }
            }
            v19 = 3;
            break;
          case 2uLL:
            v40 = v63;
            if (v63)
            {
              v17 = v56;
              while (v17 && v17 / v65 == (v17 - 1) / v65)
              {
                --v17;
                if (!--v40)
                {
                  v17 = v48;
                  break;
                }
              }
            }
            else
            {
              v17 = v56;
            }
            v19 = 1;
            break;
          default:
            if ((_DWORD)v57 && !v53)
            {
              v18 = v18;
              v43 = v57;
              v44 = v55;
              while (--v43)
              {
                v38 = v44 - v65;
                if (v50 + v44 >= v65)
                {
                  v12 = v49 == v44;
                  v44 -= v65;
                  if (!v12)
                    continue;
                }
                goto LABEL_87;
              }
              v38 = v47;
            }
            else
            {
              v38 = v55;
            }
LABEL_87:
            v19 = 0;
            if (v38 / v65 == (v38 + (unsigned __int16)v18) / v65)
              v17 = v38 + 1;
            else
              v17 = v38;
            v66 = 1;
            break;
        }
      }
    }
  }
LABEL_92:

}

uint64_t SBHIconGridRangeOffset(_QWORD *a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v8;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int v13;
  unint64_t v15;
  uint64_t v16;
  _QWORD *v17;

  v5 = *a1;
  v4 = a1[1];
  if (!a3)
  {
    v8 = 0;
    goto LABEL_20;
  }
  v16 = a1[1];
  v17 = a1;
  v8 = 0;
  v10 = (unsigned __int16)a4;
  v15 = *a1;
  v11 = v16;
  while (2)
  {
    v4 = v11;
    v12 = v5;
    switch(a2)
    {
      case 0:
        v5 += v10;
        if (SBHIconGridRangeIntersection(0, a4, v12 + v10, v16, a4) == v5)
        {
          v11 = v16;
          if (v13 == v16)
            goto LABEL_15;
        }
        goto LABEL_18;
      case 1:
        v5 -= v10;
        if (v12 < v10)
          goto LABEL_18;
        v11 = v16;
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
          goto LABEL_18;
        goto LABEL_15;
      case 2:
        if (v5)
        {
          --v5;
          if (v12 / v10 != (v12 - 1) / v10)
          {
LABEL_18:
            v5 = v12;
            goto LABEL_19;
          }
LABEL_15:
          if (a3 == ++v8)
          {
            v4 = v11;
            v8 = a3;
            goto LABEL_19;
          }
          continue;
        }
        v5 = 0;
LABEL_19:
        a1 = v17;
LABEL_20:
        *a1 = v5;
        a1[1] = v4;
        return v8;
      case 3:
        if (v5 / v10 != (v5 + (unsigned __int16)v11) / v10)
          goto LABEL_18;
        ++v5;
        goto LABEL_15;
      default:
        v8 = 0;
        v4 = v16;
        a1 = v17;
        v5 = v15;
        goto LABEL_20;
    }
  }
}

uint64_t SBHIconGridRangeFitInsideIconGridRange(unint64_t a1, int a2, unint64_t a3, uint64_t a4, int a5)
{
  unsigned __int16 v5;
  uint64_t v6;
  unint64_t v7;
  int v11;
  BOOL v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v27;
  uint64_t v28;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v12 = SBHIconGridRangeIntersection(a1, a2, a3, a4, a5) == a3 && v11 == v6;
  if (v12)
    goto LABEL_30;
  if ((unsigned __int16)a2 >= (unsigned __int16)v6 && HIWORD(a2) >= WORD1(v6))
  {
    v13 = a1 / v5;
    v14 = a1 % v5;
    v15 = v7 / v5;
    v16 = v7 % v5;
    v27 = v7;
    v28 = v6;
    v17 = v14 - v16;
    if (v14 <= v16)
    {
      v18 = v14 + (unsigned __int16)a2;
      v19 = v16 + (unsigned __int16)v6;
      v20 = v19 >= v18;
      v21 = v19 - v18;
      if (v21 == 0 || !v20)
        goto LABEL_18;
      do
      {
        if (!v7)
          break;
        if (v7 / v5 != (v7 - 1) / v5)
          break;
        --v7;
        --v21;
      }
      while (v21);
    }
    else
    {
      do
      {
        if (v7 / v5 != ((unsigned __int16)v6 + v7) / v5)
          break;
        ++v7;
        --v17;
      }
      while (v17);
    }
    v27 = v7;
LABEL_18:
    if (v13 > v15)
    {
      SBHIconGridRangeOffset(&v27, 0, v13 - v15, a5);
      return v27;
    }
    v22 = v13 + HIWORD(a2);
    v23 = v15 + WORD1(v6);
    v20 = v23 >= v22;
    v24 = v23 - v22;
    if (v24 == 0 || !v20)
      return v7;
    if (v7 >= v5 && v7 - v5 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = v6;
      do
      {
        v25 = v7 - v5;
        if (!--v24)
          break;
        if (v7 - v5 < v5)
          break;
        v12 = 2 * v5 + 0x7FFFFFFFFFFFFFFFLL == v7;
        v7 -= v5;
      }
      while (!v12);
      v7 = v25;
    }
LABEL_30:
    v28 = v6;
    return v7;
  }
  LODWORD(v28) = 0;
  return 0x7FFFFFFFFFFFFFFFLL;
}

unint64_t SBHIconGridRangeExtendToGridEdges(unint64_t result, uint64_t a2, char a3, unsigned __int16 a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  if ((a3 & 2) == 0)
  {
    if ((a3 & 8) == 0)
      goto LABEL_3;
LABEL_9:
    if ((a3 & 1) == 0)
      return result;
    goto LABEL_10;
  }
  if (result == 0x7FFFFFFFFFFFFFFFLL)
    v4 = 0x7FFFFFFFFFFFFFFELL;
  else
    v4 = result % a4;
  result -= v4;
  if ((a3 & 8) != 0)
    goto LABEL_9;
LABEL_3:
  if ((a3 & 1) == 0)
    return result;
LABEL_10:
  if (result == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5 = 0x7FFFFFFFFFFFFFFELL;
    v6 = a4;
  }
  else
  {
    v6 = a4;
    v5 = result / a4;
  }
  result -= v5 * v6;
  return result;
}

uint64_t SBHStringForIconImageInfo(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.1f×%.1f scale:%.1f corner:%.1f"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

uint64_t SBIconResizeHandleMetricsMake@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, double a7@<D4>, __int128 a8, uint64_t a9, uint64_t a10)
{
  *(double *)a2 = a3;
  *(double *)(a2 + 8) = a4;
  *(double *)(a2 + 16) = a5;
  *(double *)(a2 + 24) = a6;
  *(double *)(a2 + 32) = a7;
  *(_QWORD *)(a2 + 40) = result;
  *(_OWORD *)(a2 + 48) = a8;
  *(_QWORD *)(a2 + 64) = a9;
  *(_QWORD *)(a2 + 72) = a10;
  return result;
}

uint64_t SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(double *)a1 == *(double *)a2
    && *(double *)(a1 + 8) == *(double *)(a2 + 8)
    && *(double *)(a1 + 16) == *(double *)(a2 + 16)
    && *(double *)(a1 + 24) == *(double *)(a2 + 24)
    && *(double *)(a1 + 32) == *(double *)(a2 + 32)
    && *(_QWORD *)(a1 + 40) == *(_QWORD *)(a2 + 40))
  {
    v2 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 64), *(float64x2_t *)(a2 + 64)))), 0xFuLL)));
  }
  else
  {
    v2 = 0;
  }
  return v2 & 1;
}

__CFString *SBHStringForFixedIconLocationBehavior(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E8D8B688[a1];
}

__CFString *SBHStringForIconLayoutBehavior(char a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if ((a1 & 1) != 0)
    objc_msgSend(v2, "addObject:", CFSTR("allowedOnAnyRow"));
  if ((a1 & 2) != 0)
    objc_msgSend(v3, "addObject:", CFSTR("allowedOnAnyColumn"));
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = CFSTR("default");
  }

  return v4;
}

void *__getAPUIIconLocationAppPredictionsSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AppPredictionUIWidgetLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)AppPredictionUIWidgetLibraryCore_frameworkLibrary_1;
  }
  else
  {
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    v2 = (void *)AppPredictionUIWidgetLibraryCore_frameworkLibrary_1;
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_1)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "APUIIconLocationAppPredictions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAPUIIconLocationAppPredictionsSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D009EFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  id *v27;
  id *v28;

  objc_destroyWeak(v27);
  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D009F4C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D00A0054(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id *location)
{
  objc_destroyWeak(location);
  _Unwind_Resume(a1);
}

void sub_1D00A0BEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00A3B88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00A8FEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t pressesContainSelect(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _BYTE v10[128];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v6 = 0u;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v7;
    while (2)
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v7 != v3)
          objc_enumerationMutation(v1);
        if (pressIsSelect(*(void **)(*((_QWORD *)&v6 + 1) + 8 * i)))
        {
          v2 = 1;
          goto LABEL_11;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v6, v10, 16);
      if (v2)
        continue;
      break;
    }
  }
LABEL_11:

  return v2;
}

void sub_1D00AA62C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL pressIsSelect(void *a1)
{
  id v1;
  _BOOL8 v2;
  void *v3;

  v1 = a1;
  if (objc_msgSend(v1, "type") == 4)
  {
    v2 = 1;
  }
  else
  {
    objc_msgSend(v1, "key");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "keyCode") == 81 && objc_msgSend(v3, "modifierFlags") == 0x100000;

  }
  return v2;
}

BOOL __pressesWithoutSelect_block_invoke(uint64_t a1, void *a2)
{
  return !pressIsSelect(a2);
}

void sub_1D00B1B2C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1D00B1D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SBStringForIconDragContextState(unint64_t a1)
{
  if (a1 > 6)
    return 0;
  else
    return off_1E8D8BC08[a1];
}

id _SBHIconLibraryQueryCanonicalizedString(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = _SBHIconLibraryQueryCanonicalizedString_onceToken;
  v6 = a3;
  v7 = a2;
  v8 = a1;
  if (v5 != -1)
    dispatch_once(&_SBHIconLibraryQueryCanonicalizedString_onceToken, &__block_literal_global_81_0);
  objc_msgSend(v8, "stringByTrimmingCharactersInSet:", _SBHIconLibraryQueryCanonicalizedString_queryDisallowedCharacterSet);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "componentsSeparatedByCharactersInSet:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "bs_filter:", &__block_literal_global_85);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1D00B40A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBHContentSizeCategoryOneSmallerThanSizeCategory(void *a1)
{
  NSString *v1;
  NSComparisonResult v2;
  void *v3;
  NSComparisonResult v4;
  NSComparisonResult v5;
  NSComparisonResult v6;
  NSComparisonResult v7;
  NSComparisonResult v8;
  NSComparisonResult v9;
  NSComparisonResult v10;
  NSComparisonResult v11;
  NSComparisonResult v12;
  NSComparisonResult v13;
  id v14;

  v1 = a1;
  v2 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48B8]);
  v3 = (void *)*MEMORY[0x1E0DC48C0];
  if (v2)
  {
    v4 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48C0]);
    v3 = (void *)*MEMORY[0x1E0DC48C8];
    if (v4)
    {
      v5 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48C8]);
      v3 = (void *)*MEMORY[0x1E0DC48D0];
      if (v5)
      {
        v6 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]);
        v3 = (void *)*MEMORY[0x1E0DC48D8];
        if (v6)
        {
          v7 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48D8]);
          v3 = (void *)*MEMORY[0x1E0DC48F0];
          if (v7)
          {
            v8 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48F0]);
            v3 = (void *)*MEMORY[0x1E0DC48F8];
            if (v8)
            {
              v9 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC48F8]);
              v3 = (void *)*MEMORY[0x1E0DC4900];
              if (v9)
              {
                v10 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4900]);
                v3 = (void *)*MEMORY[0x1E0DC4918];
                if (v10)
                {
                  v11 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4918]);
                  v3 = (void *)*MEMORY[0x1E0DC4920];
                  if (v11)
                  {
                    v12 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4920]);
                    v3 = (void *)*MEMORY[0x1E0DC4930];
                    if (v12)
                    {
                      v13 = UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4930]);
                      v3 = (void *)*MEMORY[0x1E0DC4908];
                      if (v13)
                      {
                        if (UIContentSizeCategoryCompareToCategory(v1, (UIContentSizeCategory)*MEMORY[0x1E0DC4908]))
                          v3 = (void *)*MEMORY[0x1E0DC4938];
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
  v14 = v3;

  return v14;
}

BOOL SBHContentSizeCategoryIsEqualToCategory(NSString *a1, NSString *a2)
{
  return UIContentSizeCategoryCompareToCategory(a1, a2) == NSOrderedSame;
}

BOOL SBHContentSizeCategoryIsInRange(void *a1, void *a2, void *a3)
{
  id v5;
  NSString *v6;
  NSComparisonResult v7;

  v5 = a1;
  SBHContentSizeCategoryClip(v5, a2, a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v5, v6);

  return v7 == NSOrderedSame;
}

void sub_1D00B6F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

BOOL SBLibraryUseSectionsForQuery(void *a1)
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "searchString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "length") == 0;

  return v2;
}

id SBHLibrarySectionIdentifierForSectionWithIndex(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "sectionTitles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("section-(%ld)-%@-indexable"), a2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

void sub_1D00C19C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00C5A0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00C76D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00C9594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHLibraryScreenSizeBucket(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 0x2D)
    return 0;
  else
    return qword_1D01933C8[a1 - 2];
}

double SBHDefaultWidgetScaleFactor(unint64_t a1)
{
  double v2;
  void *v3;
  double v4;

  v2 = 1.0;
  if (!SBHScreenTypeIsPhone(a1))
  {
    _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    v2 = v4 / _SBHDefaultSmallWidgetCanvasDimension(a1);

  }
  return v2;
}

double _SBHDefaultSmallWidgetCanvasDimension(unint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  unint64_t v5;

  _SBHDefaultIconGridSizeClassIconImageInfos(a1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  v4 = v3;
  v5 = a1 - 29;
  if (a1 - 29 <= 0x11 && ((0x35AFFu >> v5) & 1) != 0)
    v4 = dbl_1D0193970[v5];

  return v4;
}

id _SBHLayoutOptionsKeyTypeForListLayoutProvider(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = objc_msgSend(v1, "layoutOptions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = &unk_1E8E16D98;
  }

  return v3;
}

id SBHStringForDefaultListLayoutProviderLayoutOptions(char a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 4) == 0)
  {
    if ((a1 & 8) == 0)
      goto LABEL_3;
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("LargeDefaultSizedIcons"));
    if ((a1 & 0x10) == 0)
      goto LABEL_5;
    goto LABEL_4;
  }
  objc_msgSend(v2, "addObject:", CFSTR("ExtendedFloatingDockCapacity"));
  if ((a1 & 8) != 0)
    goto LABEL_7;
LABEL_3:
  if ((a1 & 0x10) != 0)
LABEL_4:
    objc_msgSend(v3, "addObject:", CFSTR("LargeNonDefaultSizedIcons"));
LABEL_5:
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(","));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double _SBHDefaultDockPlatterMetrics(unint64_t a1, char a2)
{
  double result;

  result = 0.0;
  switch(a1)
  {
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 9uLL:
    case 0xFuLL:
      return 10.0;
    case 4uLL:
      return 7.0;
    case 5uLL:
    case 7uLL:
      return 12.0;
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
      goto LABEL_12;
    case 0xBuLL:
    case 0x11uLL:
    case 0x15uLL:
      if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1))
        return 12.0;
      else
        return 12.0;
    case 0xDuLL:
    case 0x13uLL:
    case 0x17uLL:
      goto LABEL_19;
    case 0xEuLL:
    case 0x14uLL:
    case 0x18uLL:
      return 9.0;
    case 0x16uLL:
    case 0x1AuLL:
      if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(a1))
        result = 10.0;
      else
LABEL_12:
        result = 8.0;
      break;
    case 0x19uLL:
      result = 17.0;
      break;
    case 0x1BuLL:
      result = 17.0;
      break;
    case 0x1CuLL:
      if ((a2 & 0x18) != 0 && SBHScreenTypeIsPhone(0x1CuLL))
        result = 14.0;
      else
LABEL_19:
        result = 14.0;
      break;
    default:
      return result;
  }
  return result;
}

double _SBHDefaultDockCornerRadiusAdjustment(unint64_t a1, char a2)
{
  double result;
  _BOOL4 IsPhone;
  double v5;
  BOOL v6;

  result = 0.0;
  if (a1 <= 0x1C)
  {
    if (((1 << a1) & 0x651400) != 0)
    {
      if ((a2 & 0x18) != 0)
      {
        IsPhone = SBHScreenTypeIsPhone(a1);
        result = -2.0;
        v5 = -1.0;
        if (a1 == 22)
          v5 = 2.0;
        if (IsPhone)
          return v5;
      }
      else
      {
        return -2.0;
      }
    }
    else
    {
      if (((1 << a1) & 0xA000000) != 0)
        return -6.0;
      if (((1 << a1) & 0x14000000) != 0)
      {
        if ((a2 & 0x18) == 0)
          return -6.0;
        v6 = SBHScreenTypeIsPhone(a1);
        result = -4.0;
        if (!v6)
          return -6.0;
      }
    }
  }
  return result;
}

double _SBHDefaultCategoryPodIconInset(unint64_t a1)
{
  uint64_t v2;
  double *v3;

  if (SBHScreenTypeIsPhone(a1))
  {
    v2 = SBHDefaultScreenSizeBucket(a1);
    v3 = (double *)&unk_1D0193B80;
  }
  else
  {
    v2 = SBHLibraryScreenSizeBucket(a1);
    v3 = (double *)&unk_1D0193B98;
  }
  return v3[v2];
}

id SBHCreateAppLibraryGhostPodView(void *a1, void *a2)
{
  int v3;
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
  id v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  int v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  void *v71;
  id v73;
  double v74;
  double v75;
  double v76;
  id v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  id v82;
  int v83;
  void *v84;
  void *v85;
  _QWORD v86[4];
  id v87;
  _QWORD v88[4];
  _QWORD v89[4];
  _QWORD v90[4];
  _QWORD v91[4];
  void *v92;
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  id location[4];

  location[2] = *(id *)MEMORY[0x1E0C80C00];
  v82 = a1;
  v73 = a2;
  v81 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
  v3 = 0;
  do
  {
    v83 = v3;
    objc_msgSend(v82, "iconInsets");
    v75 = v5;
    v76 = v4;
    v74 = v6;
    v8 = v7;
    objc_msgSend(v82, "iconContentScale");
    v10 = v9;
    objc_msgSend(v82, "iconSize");
    v13 = v11;
    v14 = v12;
    if (v83 == 3)
    {
      v15 = v82;
      v77 = v73;
      v84 = v15;
      objc_msgSend(v15, "iconSize");
      v16 = objc_alloc(MEMORY[0x1E0DC3F10]);
      BSRectWithSize();
      v17 = (void *)objc_msgSend(v16, "initWithFrame:");
      objc_msgSend(v77, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibraryCategoryPodAdditionalItems"));
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = SBHIconListLayoutFolderIconGridCellSize(v79);
      v20 = v19;
      v21 = 0;
      v22 = -(v18 + SBHIconListLayoutFolderIconGridCellSpacing(v79));
      v24 = -(v20 + v23);
      do
      {
        objc_msgSend(v84, "iconContentScale");
        v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v18, v20, v25);
        v27 = objc_alloc(MEMORY[0x1E0DC3F10]);
        BSRectWithSize();
        v28 = (void *)objc_msgSend(v27, "initWithFrame:");
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_62);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setBackgroundColor:", v29);
        objc_msgSend(v26, "continuousCornerRadius");
        objc_msgSend(v28, "_setContinuousCornerRadius:");

        switch(v21)
        {
          case 0:
            objc_msgSend(v28, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerYAnchor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            location[0] = v32;
            objc_msgSend(v28, "leadingAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerXAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v22);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            location[1] = v35;
            v36 = location;
            goto LABEL_9;
          case 1:
            objc_msgSend(v28, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerYAnchor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = v32;
            objc_msgSend(v28, "leadingAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerXAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v96[1] = v35;
            v36 = (id *)v96;
            goto LABEL_9;
          case 2:
            objc_msgSend(v28, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerYAnchor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 0.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v95[0] = v32;
            objc_msgSend(v28, "leadingAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerXAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v22);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v95[1] = v35;
            v36 = (id *)v95;
            goto LABEL_9;
          case 3:
            objc_msgSend(v28, "topAnchor");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerYAnchor");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, 0.0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v94[0] = v32;
            objc_msgSend(v28, "leadingAnchor");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "centerXAnchor");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, 0.0);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v94[1] = v35;
            v36 = (id *)v94;
LABEL_9:
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
            v37 = (void *)objc_claimAutoreleasedReturnValue();

            break;
          default:
            v37 = 0;
            break;
        }
        objc_msgSend(v28, "widthAnchor");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "constraintEqualToConstant:", v18);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v93[0] = v39;
        objc_msgSend(v28, "heightAnchor");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "constraintEqualToConstant:", v20);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v93[1] = v41;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v42);
        v43 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v17, "addSubview:", v28);
        objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v43);

        ++v21;
      }
      while (v21 != 4);

    }
    else
    {
      v44 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", v11, v12, v10);
      v45 = objc_alloc(MEMORY[0x1E0DC3F10]);
      BSRectWithSize();
      v17 = (void *)objc_msgSend(v45, "initWithFrame:");
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithDynamicProvider:", &__block_literal_global_62);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setBackgroundColor:", v46);
      objc_msgSend(v44, "continuousCornerRadius");
      objc_msgSend(v17, "_setContinuousCornerRadius:");

    }
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "traitCollection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = objc_msgSend(v48, "userInterfaceStyle");

    objc_msgSend(v17, "setFilterForUserInterface:", v49);
    objc_initWeak(location, v17);
    objc_opt_self();
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = v50;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __SBHCreateAppLibraryGhostPodView_block_invoke;
    v86[3] = &unk_1E8D8C288;
    objc_copyWeak(&v87, location);
    v52 = (id)objc_msgSend(v17, "registerForTraitChanges:withHandler:", v51, v86);

    switch(v83)
    {
      case 2:
        objc_msgSend(v17, "bottomAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "bottomAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "constraintEqualToAnchor:constant:", v85, -v75);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v89[0] = v80;
        objc_msgSend(v17, "leadingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "leadingAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, v76);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v89[1] = v55;
        objc_msgSend(v17, "widthAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToConstant:", v13);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v89[2] = v57;
        objc_msgSend(v17, "heightAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintEqualToConstant:", v14);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v89[3] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v89, 4);
        v60 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 1:
        objc_msgSend(v17, "topAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "topAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "constraintEqualToAnchor:constant:", v85, v8);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v90[0] = v80;
        objc_msgSend(v17, "trailingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "trailingAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, -v74);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v90[1] = v55;
        objc_msgSend(v17, "widthAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToConstant:", v13);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v90[2] = v57;
        objc_msgSend(v17, "heightAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintEqualToConstant:", v14);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v90[3] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v90, 4);
        v60 = objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      case 0:
        objc_msgSend(v17, "topAnchor");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "topAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "constraintEqualToAnchor:constant:", v85, v8);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v91[0] = v80;
        objc_msgSend(v17, "leadingAnchor");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "leadingAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "constraintEqualToAnchor:constant:", v54, v76);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v91[1] = v55;
        objc_msgSend(v17, "widthAnchor");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "constraintEqualToConstant:", v13);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v91[2] = v57;
        objc_msgSend(v17, "heightAnchor");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "constraintEqualToConstant:", v14);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v91[3] = v59;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v91, 4);
        v60 = objc_claimAutoreleasedReturnValue();
LABEL_20:
        v61 = (void *)v60;
LABEL_21:

        goto LABEL_22;
      case 3:
        objc_msgSend(v73, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibraryCategoryPodAdditionalItems"));
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = SBHIconListLayoutFolderIconGridCellSize(v62);
        v65 = v64;
        v78 = v62;
        v66 = SBHIconListLayoutFolderIconGridCellSpacing(v62);
        v68 = v67;
        objc_msgSend(v17, "centerXAnchor");
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "trailingAnchor");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v66 + v63 * 2.0;
        objc_msgSend(v85, "constraintEqualToAnchor:constant:", v80, v69 * -0.5 - v75);
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        v88[0] = v53;
        objc_msgSend(v17, "centerYAnchor");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "bottomAnchor");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v68 + v65 * 2.0;
        objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, v70 * -0.5 - v74);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v88[1] = v56;
        objc_msgSend(v17, "widthAnchor");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "constraintEqualToConstant:", v69);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        v88[2] = v58;
        objc_msgSend(v17, "heightAnchor");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "constraintEqualToConstant:", v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        v88[3] = v71;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v88, 4);
        v61 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_21;
    }
    v61 = 0;
LABEL_22:
    objc_msgSend(v81, "addSubview:", v17);
    objc_msgSend(v17, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v61);

    objc_destroyWeak(&v87);
    objc_destroyWeak(location);

    v3 = v83 + 1;
  }
  while (v83 != 3);

  return v81;
}

void sub_1D00CAE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id *location)
{
  uint64_t v16;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v16 - 176));
  _Unwind_Resume(a1);
}

id __drawShadedIcon_block_invoke(uint64_t a1, void *a2)
{
  double v2;
  double v3;

  if (objc_msgSend(a2, "userInterfaceStyle") == 2)
  {
    v2 = 0.07;
    v3 = 1.0;
  }
  else
  {
    v2 = 0.12;
    v3 = 0.0;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v3, v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_1D00CC8F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 232), 8);
  _Block_object_dispose((const void *)(v34 - 184), 8);
  _Unwind_Resume(a1);
}

id SBIconIndexCompleteNodePath(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  v3 = a2;
  objc_msgSend(a1, "nodesAlongIndexPath:consumedIndexes:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = objc_msgSend(v3, "length");

  v7 = 0;
  if (v5 == v6 + 1)
    v7 = v4;

  return v7;
}

id SBIconIndexDebugStringForNodeIdentifier(void *a1)
{
  id v1;
  id v2;
  void *v3;

  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%p"), objc_opt_class(), v1);
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;

  return v3;
}

void sub_1D00D7670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00DC41C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D00DE974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00E4DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00E6A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1D00E80D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

void sub_1D00ED070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

id getAPUIAppPredictionViewControllerClass()
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
  v0 = (void *)getAPUIAppPredictionViewControllerClass_softClass_0;
  v7 = getAPUIAppPredictionViewControllerClass_softClass_0;
  if (!getAPUIAppPredictionViewControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAPUIAppPredictionViewControllerClass_block_invoke_0;
    v3[3] = &unk_1E8D85AF8;
    v3[4] = &v4;
    __getAPUIAppPredictionViewControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1D00EF004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00EF65C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, id *a11)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 160));
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)(v11 - 168));
  _Unwind_Resume(a1);
}

void sub_1D00F0FAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F2040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D00F2B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F668C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1D00F68FC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1D00F71B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F7300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F7478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F75DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F774C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F78AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F7AC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00F7F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D00FA1B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D00FB3F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D00FDA2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1D00FFADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D010087C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0102BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0103DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAPUIAppPredictionViewControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_2)
  {
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("APUIAppPredictionViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAPUIAppPredictionViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getAPUIAppPredictionViewControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_3_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_4_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1D0109290(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

id SBHIconDragItemWithIconAndIconView(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  char isKindOfClass;
  uint64_t v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  char v31;
  id v32;
  SBIconViewDragInfo *v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  id v62;
  id obj;
  __CFString *obja;
  id v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  id v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v61 = objc_alloc_init(MEMORY[0x1E0CB36C8]);
  objc_msgSend(v61, "registerDataRepresentationForTypeIdentifier:visibility:loadHandler:", v7, 0, &__block_literal_global_64);
  objc_msgSend(v5, "nodeIdentifier");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationBundleID");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "draggingUserActivity");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = CFSTR("SBHIconGridSizeClassDefault");
  v9 = v8;
  v54 = v7;
  v55 = v6;
  if (!v6)
  {
    obja = v8;
    v65 = 0;
    v56 = 0;
    v11 = 0;
    v57 = 0;
    v10 = 0;
    goto LABEL_48;
  }
  objc_msgSend(v6, "draggingLaunchActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "draggingLaunchURL");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "draggingStartLocation");
  if (objc_msgSend(v5, "isWidgetIcon"))
    v12 = v5;
  else
    v12 = 0;
  v13 = v12;
  if (v13)
  {
    v52 = v11;
    v60 = v10;
    v65 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend(v13, "activeDataSource");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uniqueIdentifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "gridSizeClass");
    v50 = objc_claimAutoreleasedReturnValue();

    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    v51 = v13;
    objc_msgSend(v13, "iconDataSources");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
    if (!v15)
      goto LABEL_34;
    v16 = v15;
    v17 = *(_QWORD *)v72;
    while (1)
    {
      v18 = 0;
      v62 = (id)v16;
      do
      {
        if (*(_QWORD *)v72 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * v18);
        objc_opt_self();
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          v22 = v17;
          v23 = v19;
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v23, "kind");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("kind"));
          objc_msgSend(v23, "uniqueIdentifier", v50);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("uniqueIdentifier"));
          objc_msgSend(v23, "extensionBundleIdentifier");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("extensionBundleIdentifier"));
          objc_msgSend(v23, "containerBundleIdentifier");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          if (v28)
            objc_msgSend(v24, "setObject:forKey:", v28, CFSTR("containerBundleIdentifier"));
          objc_msgSend(v23, "supportedGridSizeClasses");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          if (v29)
            objc_msgSend(v24, "setObject:forKey:", v29, CFSTR("supportedGridSizeClasses"));
          objc_msgSend(v65, "addObject:", v24);

          v17 = v22;
          v16 = (uint64_t)v62;
        }
        else
        {
          objc_opt_self();
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = objc_opt_isKindOfClass();

          if ((v31 & 1) == 0)
            goto LABEL_32;
          v32 = v19;
          v24 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(v32, "uniqueIdentifier");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          if (v25)
            objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("uniqueIdentifier"));
          objc_msgSend((id)objc_opt_class(), "elementIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if (v26)
            objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("elementIdentifier"));
          objc_msgSend(v32, "supportedGridSizeClasses", v50);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("supportedGridSizeClasses"));
          objc_msgSend(v65, "addObject:", v24);
        }

LABEL_32:
        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v76, 16);
      if (!v16)
      {
LABEL_34:

        v9 = (__CFString *)v50;
        v13 = v51;
        v10 = v60;
        v11 = v52;
        goto LABEL_37;
      }
    }
  }
  v65 = 0;
  v56 = 0;
LABEL_37:
  v33 = objc_alloc_init(SBIconViewDragInfo);
  -[SBIconViewDragInfo setUniqueIdentifier:](v33, "setUniqueIdentifier:", v59);
  -[SBIconViewDragInfo setApplicationBundleIdentifier:](v33, "setApplicationBundleIdentifier:", v58);
  -[SBIconViewDragInfo setLaunchURL:](v33, "setLaunchURL:", v57);
  -[SBIconViewDragInfo setStartLocation:](v33, "setStartLocation:", v11);
  if (v13)
  {
    -[SBIconViewDragInfo setActiveCustomIconDataSourceUniqueIdentifier:](v33, "setActiveCustomIconDataSourceUniqueIdentifier:", v56);
    -[SBIconViewDragInfo setCustomIconDataSourceConfigurations:](v33, "setCustomIconDataSourceConfigurations:", v65);
    -[SBIconViewDragInfo setGridSizeClass:](v33, "setGridSizeClass:", v9);
  }
  obja = v9;
  v70 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v33, 1, &v70, v50);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v70;
  if (v34)
  {
    if ((unint64_t)objc_msgSend(v34, "length") <= 0x2000)
    {
      objc_msgSend(v61, "setTeamData:", v34);
      goto LABEL_47;
    }
    SBLogIconDragging();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      SBHIconDragItemWithIconAndIconView_cold_2((uint64_t)v33, v36);
  }
  else
  {
    SBLogIconDragging();
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      SBHIconDragItemWithIconAndIconView_cold_1((uint64_t)v35, (uint64_t)v33, v36);
  }

LABEL_47:
LABEL_48:
  if (objc_msgSend(v5, "isFolderIcon"))
  {
    objc_msgSend(v5, "folder");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "leafIcons");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    v66 = 0u;
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v40 = v38;
    v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
    if (v41)
    {
      v42 = v41;
      v43 = *(_QWORD *)v67;
      do
      {
        for (i = 0; i != v42; ++i)
        {
          if (*(_QWORD *)v67 != v43)
            objc_enumerationMutation(v40);
          objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * i), "uniqueIdentifier");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          if (v45)
            objc_msgSend(v39, "addObject:", v45);

        }
        v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v66, v75, 16);
      }
      while (v42);
    }

  }
  else
  {
    v39 = 0;
  }
  v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v61);
  v47 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAD68]), "initWithUniqueIdentifier:withLaunchActions:startLocation:", v59, v10, SBHAppDragLocalContextStartLocationToSBSLocation(v11));
  objc_msgSend(v47, "setApplicationBundleIdentifier:", v58);
  objc_msgSend(v47, "setLaunchURL:", v57);
  objc_msgSend(v5, "representedSceneIdentifier");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "setDraggedSceneIdentifier:", v48);

  objc_msgSend(v47, "setSourceLocal:", 1);
  objc_msgSend(v47, "setUserActivity:", v53);
  objc_msgSend(v47, "setContainedIconIdentifiers:", v39);
  objc_msgSend(v47, "setActiveCustomIconDataSourceUniqueIdentifier:", v56);
  objc_msgSend(v47, "setCustomIconDataSourceConfigurations:", v65);
  objc_msgSend(v47, "setGridSizeClass:", obja);
  objc_msgSend(v46, "sbh_setAppDragLocalContext:", v47);

  return v46;
}

__CFString *SBHIconLocationForSBHAppDragLocalContextStartLocation(uint64_t a1)
{
  __CFString *result;
  __CFString **v2;

  switch(a1)
  {
    case 0:
      return CFSTR("SBHAppDragLocalContextStartLocationUnknown");
    case 1:
      v2 = SBIconLocationRoot;
      goto LABEL_14;
    case 2:
      v2 = SBIconLocationStackConfiguration;
      goto LABEL_14;
    case 3:
      v2 = SBIconLocationAddWidgetSheet;
      goto LABEL_14;
    case 4:
      v2 = SBIconLocationAppLibrary;
      goto LABEL_14;
    case 5:
      return CFSTR("SBHAppDragLocalContextStartLocationSpotlight");
    case 6:
      v2 = SBIconLocationFloatingDock;
      goto LABEL_14;
    case 7:
      return CFSTR("SBHAppDragLocalContextStartLocationFloatingDockSuggestions");
    case 8:
      return CFSTR("SBHAppDragLocalContextStartLocationWindow");
    case 9:
      return CFSTR("SBHAppDragLocalContextStartLocationNotification");
    case 10:
      v2 = SBIconLocationTodayView;
LABEL_14:
      result = *v2;
      break;
    case 11:
      result = CFSTR("SBHAppDragLocalContextStartLocationSwitcher");
      break;
    case 12:
      result = CFSTR("SBHAppDragLocalContextStartLocationShelf");
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

void sub_1D010BD94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t _SBIconIsLeafIconAndNotWidgetIcon(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (objc_msgSend(v1, "isLeafIcon"))
    v2 = objc_msgSend(v1, "isWidgetIcon") ^ 1;
  else
    v2 = 0;

  return v2;
}

void sub_1D010CBD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D010D000(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0110A9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SBIconImageInfoEqualToIconImageInfo(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

BOOL SBIconImageInfoSizeAndScaleEqualToIconImageInfo(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a1 == a5 && a2 == a6 && a3 == a7;
}

void sub_1D0117B70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, id *a10)
{
  id *v10;
  id *v11;
  id *v12;
  id *v13;
  id *v14;
  uint64_t v15;

  objc_destroyWeak(v14);
  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v11);
  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v15 - 168));
  _Unwind_Resume(a1);
}

void sub_1D0117BDC()
{
  JUMPOUT(0x1D0117BBCLL);
}

void sub_1D0117BE4()
{
  JUMPOUT(0x1D0117BC4);
}

void sub_1D0117D5C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D0117E48(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D0117F34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D0118020(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D011810C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D01181F8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1D01182E4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void SBHAddWidgetSheetCompactViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = 0x4030000000000000;
  *(double *)(a1 + 8) = SBIconImageInfoMake(48.0, 48.0, a2, 12.0);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
}

void SBHAddWidgetSheetSplitViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_OWORD *)(a1 + 24) = 0u;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_QWORD *)a1 = 0x4028000000000000;
  *(double *)(a1 + 8) = SBIconImageInfoMake(32.0, 32.0, a2, 10.0);
  *(_QWORD *)(a1 + 16) = v3;
  *(_QWORD *)(a1 + 24) = v4;
  *(_QWORD *)(a1 + 32) = v5;
}

void SBHAddWidgetSheetListViewIconMetricsForScale(uint64_t a1@<X8>, double a2@<D0>)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  *(_QWORD *)(a1 + 32) = 0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D3A830]), "initWithSize:scale:", 29.0, 29.0, a2);
  objc_msgSend(v12, "size");
  v5 = v4;
  v7 = v6;
  objc_msgSend(v12, "continuousCornerRadius");
  *(double *)(a1 + 8) = SBIconImageInfoMake(v5, v7, a2, v8);
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(a1 + 24) = v10;
  *(_QWORD *)(a1 + 32) = v11;

}

uint64_t SBHWidgetFilteringParametersNone()
{
  return 0;
}

BOOL SBHStackLayoutMetricsEqualToMetrics(double *a1, double *a2)
{
  if (*a1 != *a2 || a1[6] != a2[6] || a1[5] != a2[5] || a1[7] != a2[7])
    return 0;
  if (a1[1] != a2[1] || a1[2] != a2[2])
    return 0;
  if (a1[4] == a2[4])
    return a1[3] == a2[3];
  return 0;
}

id SBViewClassForIconLabelAccessoryType(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return (id)objc_opt_class();
}

void sub_1D011C738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D011C9CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D011CDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D011CFE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation@<Q0>(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  __int128 *v6;
  __n128 result;
  __int128 v8;
  __int128 v9;
  __int128 v10;

  if (SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_onceToken != -1)
    dispatch_once(&SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_onceToken, &__block_literal_global_71);
  if (SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sCurrentScreenType == a1)
  {
    if ((unint64_t)(a2 - 3) > 1)
      v6 = &SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sPortraitMetrics;
    else
      v6 = &SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation_sLandscapeMetrics;
    v8 = v6[5];
    *(_OWORD *)(a3 + 64) = v6[4];
    *(_OWORD *)(a3 + 80) = v8;
    *(_OWORD *)(a3 + 96) = v6[6];
    *(_QWORD *)(a3 + 112) = *((_QWORD *)v6 + 14);
    v9 = v6[1];
    *(_OWORD *)a3 = *v6;
    *(_OWORD *)(a3 + 16) = v9;
    result = (__n128)v6[2];
    v10 = v6[3];
    *(__n128 *)(a3 + 32) = result;
    *(_OWORD *)(a3 + 48) = v10;
  }
  else
  {
    _uncachedMetricsForScreenTypeAndInterfaceOrientation(a1, a2, a3);
  }
  return result;
}

void _uncachedMetricsForScreenTypeAndInterfaceOrientation(unint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  unint64_t v5;
  double v6;
  double v7;
  BOOL v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  uint64x2_t v16;
  uint64x2_t v17;
  double v18;
  double v19;
  _BOOL4 v20;
  _QWORD *v21;
  double v22;
  _BOOL4 v23;
  double *v24;
  double v25;
  double v26;
  BOOL v27;
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
  double v38;
  int64x2_t v39;
  int8x16_t v40;
  int8x16_t v41;
  unint64_t v42;
  BOOL v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  double v48;
  double v49;

  *(_OWORD *)(a3 + 80) = 0u;
  *(_OWORD *)(a3 + 96) = 0u;
  *(_OWORD *)(a3 + 48) = 0u;
  *(_OWORD *)(a3 + 64) = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_OWORD *)(a3 + 32) = 0u;
  v5 = a2 - 3;
  v6 = 0.0;
  *(_OWORD *)a3 = 0u;
  v7 = 0.0;
  switch(a1)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 5uLL:
    case 7uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
      v7 = 16.0;
      goto LABEL_10;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x29uLL:
    case 0x2EuLL:
      v8 = v5 >= 2;
      v9 = 20.0;
      goto LABEL_8;
    case 0x1FuLL:
    case 0x20uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x2BuLL:
    case 0x2CuLL:
      v8 = v5 >= 2;
      v9 = 24.0;
LABEL_8:
      if (!v8)
        v7 = v9;
      goto LABEL_10;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2AuLL:
    case 0x2DuLL:
    case 0x2FuLL:
      v7 = 36.0;
      if (v5 >= 2)
        v7 = 0.0;
      goto LABEL_10;
    case 0x22uLL:
      v18 = 57.5;
      if (v5 >= 2)
        v18 = 0.0;
      *(double *)a3 = v18;
LABEL_31:
      v19 = 19.0;
      if (v5 < 2)
        v19 = 26.0;
      *(double *)(a3 + 8) = v19;
LABEL_34:
      v20 = v5 < 2;
      v21 = &unk_1D01951E0;
LABEL_64:
      *(_QWORD *)(a3 + 16) = v21[v20];
      *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
      *(_QWORD *)(a3 + 24) = v16.i64[0];
      *(_QWORD *)(a3 + 32) = v16.i64[0];
LABEL_65:
      v12 = 16.0;
      goto LABEL_88;
    default:
LABEL_10:
      *(double *)a3 = v7;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 5uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
          v6 = 24.0;
          goto LABEL_18;
        case 3uLL:
        case 4uLL:
        case 6uLL:
        case 9uLL:
        case 0x18uLL:
        case 0x1CuLL:
          v6 = 16.0;
          goto LABEL_18;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x29uLL:
          v10 = v5 >= 2;
          v6 = 19.0;
          v11 = 20.0;
          goto LABEL_16;
        case 0x1FuLL:
          v22 = 16.0;
          if (v5 < 2)
            v22 = 24.0;
          *(double *)(a3 + 8) = v22;
LABEL_38:
          v23 = v5 < 2;
          v24 = (double *)&unk_1D01951B0;
          goto LABEL_85;
        case 0x20uLL:
          v25 = 17.0;
          if (v5 < 2)
            v25 = 24.0;
          *(double *)(a3 + 8) = v25;
LABEL_42:
          *(_QWORD *)(a3 + 16) = qword_1D01951A0[v5 < 2];
          *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
          *(_QWORD *)(a3 + 24) = v16.i64[0];
          *(_QWORD *)(a3 + 32) = v16.i64[0];
LABEL_43:
          *(_QWORD *)(a3 + 40) = 0x4038000000000000;
LABEL_89:
          v38 = 1.0;
          goto LABEL_90;
        case 0x21uLL:
        case 0x28uLL:
          v10 = v5 >= 2;
          v6 = 16.0;
          v11 = 26.0;
          goto LABEL_16;
        case 0x22uLL:
          goto LABEL_31;
        case 0x23uLL:
        case 0x24uLL:
          v10 = v5 >= 2;
          v6 = 15.5;
          v11 = 24.0;
LABEL_16:
          if (!v10)
            v6 = v11;
          goto LABEL_18;
        case 0x25uLL:
          v26 = 15.5;
          if (v5 < 2)
            v26 = 24.0;
          *(double *)(a3 + 8) = v26;
LABEL_47:
          v27 = v5 >= 2;
          v28 = 180.5;
          v29 = 288.0;
          goto LABEL_74;
        case 0x26uLL:
          v30 = 17.5;
          if (v5 < 2)
            v30 = 24.0;
          *(double *)(a3 + 8) = v30;
LABEL_51:
          v20 = v5 < 2;
          v21 = &unk_1D0195190;
          goto LABEL_64;
        case 0x27uLL:
          v31 = 17.5;
          if (v5 < 2)
            v31 = 24.0;
          *(double *)(a3 + 8) = v31;
LABEL_55:
          v23 = v5 < 2;
          v24 = (double *)&unk_1D0195170;
          goto LABEL_85;
        case 0x2AuLL:
          v32 = 16.0;
          if (v5 < 2)
            v32 = 26.0;
          *(double *)(a3 + 8) = v32;
LABEL_59:
          v27 = v5 >= 2;
          v28 = 256.0;
          v29 = 290.0;
          goto LABEL_74;
        case 0x2BuLL:
          v33 = 17.5;
          if (v5 < 2)
            v33 = 24.0;
          *(double *)(a3 + 8) = v33;
LABEL_63:
          v20 = v5 < 2;
          v21 = &unk_1D0195180;
          goto LABEL_64;
        case 0x2CuLL:
          v34 = 17.5;
          if (v5 < 2)
            v34 = 24.0;
          *(double *)(a3 + 8) = v34;
LABEL_69:
          v23 = v5 < 2;
          v24 = (double *)&unk_1D0195160;
          goto LABEL_85;
        case 0x2DuLL:
          v35 = 16.0;
          if (v5 < 2)
            v35 = 26.0;
          *(double *)(a3 + 8) = v35;
LABEL_73:
          v27 = v5 >= 2;
          v28 = 232.0;
          v29 = 276.0;
LABEL_74:
          if (!v27)
            v28 = v29;
          goto LABEL_86;
        case 0x2EuLL:
          v36 = 19.0;
          if (v5 < 2)
            v36 = 20.0;
          *(double *)(a3 + 8) = v36;
LABEL_80:
          v23 = v5 < 2;
          v24 = (double *)&unk_1D01951C0;
          goto LABEL_85;
        case 0x2FuLL:
          v37 = 16.0;
          if (v5 < 2)
            v37 = 26.0;
          *(double *)(a3 + 8) = v37;
LABEL_84:
          v23 = v5 < 2;
          v24 = (double *)&unk_1D0195150;
LABEL_85:
          v28 = v24[v23];
LABEL_86:
          *(double *)(a3 + 16) = v28;
          *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
          *(_QWORD *)(a3 + 24) = v16.i64[0];
          *(_QWORD *)(a3 + 32) = v16.i64[0];
LABEL_87:
          v12 = 26.0;
          break;
        default:
LABEL_18:
          *(double *)(a3 + 8) = v6;
          v12 = 0.0;
          v13 = 0.0;
          switch(a1)
          {
            case 0uLL:
            case 1uLL:
            case 2uLL:
            case 5uLL:
            case 7uLL:
            case 8uLL:
            case 0xAuLL:
            case 0xBuLL:
            case 0xCuLL:
            case 0xDuLL:
            case 0xEuLL:
            case 0xFuLL:
            case 0x10uLL:
            case 0x11uLL:
            case 0x12uLL:
            case 0x13uLL:
            case 0x14uLL:
            case 0x15uLL:
            case 0x16uLL:
            case 0x17uLL:
            case 0x19uLL:
            case 0x1AuLL:
            case 0x1BuLL:
              v13 = 249.0;
              goto LABEL_26;
            case 3uLL:
            case 4uLL:
            case 6uLL:
            case 9uLL:
            case 0x18uLL:
            case 0x1CuLL:
              v13 = 232.0;
              goto LABEL_26;
            case 0x1DuLL:
            case 0x1EuLL:
            case 0x29uLL:
              v13 = dbl_1D01951D0[v5 < 2];
              goto LABEL_26;
            case 0x1FuLL:
              goto LABEL_38;
            case 0x20uLL:
              goto LABEL_42;
            case 0x21uLL:
            case 0x28uLL:
              v14 = v5 >= 2;
              v13 = 224.0;
              v15 = 266.0;
              goto LABEL_24;
            case 0x22uLL:
              goto LABEL_34;
            case 0x23uLL:
            case 0x24uLL:
              v14 = v5 >= 2;
              v13 = 216.0;
              v15 = 268.0;
LABEL_24:
              if (!v14)
                v13 = v15;
              goto LABEL_26;
            case 0x25uLL:
              goto LABEL_47;
            case 0x26uLL:
              goto LABEL_51;
            case 0x27uLL:
              goto LABEL_55;
            case 0x2AuLL:
              goto LABEL_59;
            case 0x2BuLL:
              goto LABEL_63;
            case 0x2CuLL:
              goto LABEL_69;
            case 0x2DuLL:
              goto LABEL_73;
            case 0x2EuLL:
              goto LABEL_80;
            case 0x2FuLL:
              goto LABEL_84;
            default:
LABEL_26:
              *(double *)(a3 + 16) = v13;
              *(double *)v16.i64 = _addWidgetSheetTrailingPadding(a1, a2);
              *(_QWORD *)(a3 + 24) = v16.i64[0];
              *(_QWORD *)(a3 + 32) = v16.i64[0];
              switch(a1)
              {
                case 0uLL:
                case 1uLL:
                case 2uLL:
                case 3uLL:
                case 4uLL:
                case 5uLL:
                case 6uLL:
                case 7uLL:
                case 8uLL:
                case 9uLL:
                case 0xAuLL:
                case 0xBuLL:
                case 0xCuLL:
                case 0xDuLL:
                case 0xEuLL:
                case 0xFuLL:
                case 0x10uLL:
                case 0x11uLL:
                case 0x12uLL:
                case 0x13uLL:
                case 0x14uLL:
                case 0x15uLL:
                case 0x16uLL:
                case 0x17uLL:
                case 0x18uLL:
                case 0x19uLL:
                case 0x1AuLL:
                case 0x1BuLL:
                case 0x1CuLL:
                  v12 = 20.0;
                  goto LABEL_88;
                case 0x1DuLL:
                case 0x1EuLL:
                case 0x1FuLL:
                case 0x21uLL:
                case 0x23uLL:
                case 0x25uLL:
                case 0x27uLL:
                case 0x28uLL:
                case 0x29uLL:
                case 0x2AuLL:
                case 0x2CuLL:
                case 0x2DuLL:
                case 0x2EuLL:
                case 0x2FuLL:
                  goto LABEL_87;
                case 0x20uLL:
                  goto LABEL_43;
                case 0x22uLL:
                case 0x24uLL:
                case 0x26uLL:
                case 0x2BuLL:
                  goto LABEL_65;
                default:
                  goto LABEL_88;
              }
          }
      }
LABEL_88:
      *(double *)(a3 + 40) = v12;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x25uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          goto LABEL_89;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x22uLL:
        case 0x29uLL:
        case 0x2EuLL:
          v43 = v5 >= 2;
          v38 = 0.95;
          goto LABEL_121;
        case 0x23uLL:
        case 0x24uLL:
        case 0x26uLL:
        case 0x2BuLL:
          v43 = v5 >= 2;
          v38 = 0.875;
LABEL_121:
          if (!v43)
            v38 = 1.0;
          break;
        default:
          v38 = 0.0;
          break;
      }
LABEL_90:
      *(double *)(a3 + 48) = v38;
      switch(a1)
      {
        case 0uLL:
        case 1uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 9uLL:
        case 0xAuLL:
        case 0xBuLL:
        case 0xCuLL:
        case 0xDuLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x10uLL:
        case 0x11uLL:
        case 0x12uLL:
        case 0x13uLL:
        case 0x14uLL:
        case 0x15uLL:
        case 0x16uLL:
        case 0x17uLL:
        case 0x18uLL:
        case 0x19uLL:
        case 0x1AuLL:
        case 0x1BuLL:
        case 0x1CuLL:
          v39 = vdupq_n_s64(0x405DC00000000000uLL);
          break;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x22uLL:
        case 0x29uLL:
        case 0x2EuLL:
          v16.i64[0] = v5;
          v17.i64[0] = 2;
          v40 = (int8x16_t)vdupq_lane_s64(vcgtq_u64(v17, v16).i64[0], 0);
          v41 = *(int8x16_t *)MEMORY[0x1E0C9D820];
          v42 = 0x405C800000000000;
          goto LABEL_96;
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x25uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          v39 = *(int64x2_t *)MEMORY[0x1E0C9D820];
          break;
        case 0x23uLL:
        case 0x24uLL:
        case 0x26uLL:
        case 0x2BuLL:
          v16.i64[0] = v5;
          v17.i64[0] = 2;
          v40 = (int8x16_t)vdupq_lane_s64(vcgtq_u64(v17, v16).i64[0], 0);
          v41 = *(int8x16_t *)MEMORY[0x1E0C9D820];
          v42 = 0x405DC00000000000;
LABEL_96:
          v39 = (int64x2_t)vbslq_s8(v40, v41, (int8x16_t)vdupq_n_s64(v42));
          break;
        default:
          v39 = 0uLL;
          break;
      }
      *(int64x2_t *)(a3 + 56) = v39;
      if (a1 >= 0x1D)
      {
        if (a1 - 29 >= 0x13)
        {
          v44 = 0;
        }
        else
        {
          v44 = 4;
          if (v5 < 2)
            v44 = 5;
        }
      }
      else
      {
        v44 = 2;
      }
      *(_QWORD *)(a3 + 72) = v44;
      v45 = 0;
      v46 = 0;
      v47 = 0;
      if (a1 <= 0x2F)
      {
        v46 = qword_1D0195340[a1];
        v47 = 0x4046800000000000;
      }
      *(_QWORD *)(a3 + 80) = v47;
      *(_QWORD *)(a3 + 88) = v46;
      if (a1 <= 0x2F)
        v45 = qword_1D01954C0[a1];
      *(_QWORD *)(a3 + 112) = v45;
      if (a1 >= 0x1D)
      {
        if (a1 - 29 >= 0x13)
        {
          v48 = 0.0;
        }
        else
        {
          v48 = 50.0;
          if (v5 < 2)
            v48 = 30.0;
        }
      }
      else
      {
        v48 = 5.0;
      }
      *(double *)(a3 + 96) = v48;
      if (a1 > 0x2F)
      {
        v49 = 0.0;
      }
      else if (((1 << a1) & 0xEFFFDA7) != 0)
      {
        v49 = 24.0;
      }
      else if (((1 << a1) & 0xFFFFE0000000) != 0)
      {
        v49 = 50.0;
        if (v5 < 2)
          v49 = 46.0;
      }
      else
      {
        v49 = 21.0;
      }
      *(double *)(a3 + 104) = v49;
      return;
  }
}

double _addWidgetSheetTrailingPadding(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  double result;
  BOOL v4;
  double v5;
  BOOL v6;
  double v7;

  v2 = a2 - 3;
  switch(a1)
  {
    case 0:
    case 1:
    case 2:
    case 5:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 25:
    case 26:
    case 27:
      return 24.0;
    case 3:
    case 4:
    case 6:
    case 9:
    case 24:
    case 28:
      return 16.0;
    case 29:
    case 30:
    case 41:
    case 46:
      v4 = v2 >= 2;
      result = 16.0;
      v5 = 20.0;
      goto LABEL_13;
    case 31:
    case 38:
    case 43:
      v4 = v2 >= 2;
      result = 18.0;
      goto LABEL_12;
    case 32:
      v4 = v2 >= 2;
      result = 17.5;
      goto LABEL_12;
    case 33:
    case 40:
    case 45:
      v4 = v2 >= 2;
      result = 18.0;
      v5 = 29.0;
      goto LABEL_13;
    case 34:
      v4 = v2 >= 2;
      result = 16.0;
      v5 = 26.0;
      goto LABEL_13;
    case 35:
    case 36:
      v4 = v2 >= 2;
      result = 19.5;
LABEL_12:
      v5 = 24.0;
LABEL_13:
      if (!v4)
        return v5;
      return result;
    case 37:
      v6 = v2 >= 2;
      result = 49.5;
      v7 = 16.0;
      goto LABEL_18;
    case 39:
    case 44:
      v6 = v2 >= 2;
      result = 60.5;
      v7 = 18.0;
      goto LABEL_18;
    case 42:
    case 47:
      v6 = v2 >= 2;
      result = 59.0;
      v7 = 30.0;
LABEL_18:
      if (v6)
        result = v7;
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

void sub_1D011F720(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D011FEB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL _SBHTraitEnvironmentIsAccessibilityTextSize(void *a1)
{
  void *v1;
  NSString *v2;
  _BOOL8 IsAccessibilityCategory;

  objc_msgSend(a1, "traitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "preferredContentSizeCategory");
  v2 = (NSString *)objc_claimAutoreleasedReturnValue();

  if (v2)
    IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v2);
  else
    IsAccessibilityCategory = 0;

  return IsAccessibilityCategory;
}

void sub_1D01259E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0127E50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0128EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D012ADA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D012B198(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SBHWidgetMetricsSpecificationWithLayoutProviderAndScreenType(void *a1, unint64_t a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D100D0];
  v4 = a1;
  v5 = objc_alloc_init(v3);
  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(1, v4, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetrics:forFamily:", v6, 1);

  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(2, v4, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetrics:forFamily:", v7, 2);

  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(3, v4, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetrics:forFamily:", v8, 3);

  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(4, v4, a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMetrics:forFamily:", v9, 4);

  SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(6, v4, a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setMetrics:forFamily:", v10, 6);
  return v5;
}

id SBHWidgetMetricsForFamilyWithLayoutProviderAndScreenType(uint64_t a1, void *a2, unint64_t a3)
{
  void *v5;
  __CFString *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  char v13;
  uint64_t v14;
  void *v15;
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  id v34;
  double v35;
  double v36;
  uint64_t v37;
  id v38;
  void *v39;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;

  objc_msgSend(a2, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    SBHIconGridSizeClassForCHSWidgetFamily(a1);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "iconImageInfoForGridSizeClass:", v6);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    if (v6 != CFSTR("SBHIconGridSizeClassSmall"))
    {
      v13 = -[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("SBHIconGridSizeClassSmall"));
      v7 = v8;
      if ((v13 & 1) == 0)
        objc_msgSend(v5, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"), v8);
    }
    v44 = v12;
    v45 = v10;
    v41 = v7;
    if (a3 - 2 > 0x2D)
      v14 = 2;
    else
      v14 = qword_1D0195660[a3 - 2];
    v16 = *MEMORY[0x1E0DC49E8];
    v17 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v19 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "widgetContentMargins", v16, v17, v18, v19);
    CHSEdgeInsetsMake();
    v42 = v21;
    v43 = v20;
    v23 = v22;
    v25 = v24;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v5, "widgetContentMarginsWithBackgroundRemoved");
    CHSEdgeInsetsMake();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v34 = v5;
    if ((objc_opt_respondsToSelector() & 1) == 0
      || (objc_msgSend(v34, "widgetScaleFactor"), v36 = v35, BSFloatIsZero()))
    {
      v36 = 1.0;
      if (!SBHScreenTypeIsPhone(a3))
        v36 = v41 / _SBHDefaultSmallWidgetCanvasDimension(a3);
    }

    if ((BSFloatIsOne() & 1) == 0)
    {
      v8 = v8 / v36;
      v44 = v44 / v36;
      v45 = v45 / v36;
      v42 = v42 / v36;
      v43 = v43 / v36;
      v23 = v23 / v36;
      v25 = v25 / v36;
      v27 = v27 / v36;
      v29 = v29 / v36;
      v31 = v31 / v36;
      v33 = v33 / v36;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (objc_msgSend(v34, "widgetsSupportDynamicText"))
        v37 = 1;
      else
        v37 = 2;
    }
    else
    {
      v37 = 0;
    }
    v38 = objc_alloc(MEMORY[0x1E0D101E8]);
    v39 = (void *)objc_msgSend(v38, "initWithSafeAreaInsets:layoutInsets:contentMargins:backgroundRemovedContentMargins:", *MEMORY[0x1E0D0FEC0], *(double *)(MEMORY[0x1E0D0FEC0] + 8), *(double *)(MEMORY[0x1E0D0FEC0] + 16), *(double *)(MEMORY[0x1E0D0FEC0] + 24), *MEMORY[0x1E0D0FEC0], *(double *)(MEMORY[0x1E0D0FEC0] + 8), *(double *)(MEMORY[0x1E0D0FEC0] + 16), *(double *)(MEMORY[0x1E0D0FEC0] + 24), *(_QWORD *)&v43, *(_QWORD *)&v42, *(_QWORD *)&v23, *(_QWORD *)&v25, *(_QWORD *)&v27, *(_QWORD *)&v29, *(_QWORD *)&v31, *(_QWORD *)&v33);
    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D101F0]), "initWithSize:cornerRadius:scaleFactor:fontStyle:margins:supportsDynamicText:", v14, v39, v37, v8, v45, v44, v36);

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

void sub_1D012F728(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SBHSearchIconImageSymbolConfiguration()
{
  return objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithWeight:", 4);
}

uint64_t SBHOverrideFeatureEnabled(uint64_t result, int a2)
{
  int v2;
  uint64_t v3;

  v2 = 1 << result;
  if (a2)
    v3 = overriddenEnabledFeatures | v2;
  else
    v3 = overriddenEnabledFeatures & ~v2;
  overriddenEnabledFeatures = v3;
  return result;
}

__CFString *SBHStringForIconImageAppearanceType(unint64_t a1)
{
  if (a1 > 3)
    return 0;
  else
    return off_1E8D8DF30[a1];
}

unint64_t SBHScreenTypeIsMoreSpace(unint64_t a1)
{
  return (a1 > 0x2E) | (0x14A000000000uLL >> a1) & 1;
}

unint64_t SBHScreenTypeIsZoomed(unint64_t a1)
{
  return (a1 > 0x2F) | (0x420015555550uLL >> a1) & 1;
}

__CFString *SBHStringForScreenType(unint64_t a1)
{
  if (a1 > 0x2F)
    return 0;
  else
    return off_1E8D8DF50[a1];
}

__CFString *SBHShortStringForScreenType(unint64_t a1)
{
  if (a1 > 0x2F)
    return 0;
  else
    return off_1E8D8E0D0[a1];
}

uint64_t SBHScreenTypeForShortString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("N61")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("N56")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("N41")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D22")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D22Zoomed")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D33")) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D33Zoomed")) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("N84")) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("N84Zoomed")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D52")) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D52Zoomed")) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D53")) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D53Zoomed")) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D54")) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D54Zoomed")) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D16")) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D16Zoomed")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D63")) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D63Zoomed")) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D64")) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D64Zoomed")) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D73")) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D73Zoomed")) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D74")) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D74Zoomed")) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D93")) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D93Zoomed")) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D94")) & 1) != 0)
  {
    v2 = 27;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("D94Zoomed")) & 1) != 0)
  {
    v2 = 28;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J1")) & 1) != 0)
  {
    v2 = 29;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J85")) & 1) != 0)
  {
    v2 = 30;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J171")) & 1) != 0)
  {
    v2 = 31;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J207")) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J99")) & 1) != 0)
  {
    v2 = 33;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J310")) & 1) != 0)
  {
    v2 = 34;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J271")) & 1) != 0)
  {
    v2 = 35;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J307")) & 1) != 0)
  {
    v2 = 36;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J307MoreSpace")) & 1) != 0)
  {
    v2 = 37;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J317")) & 1) != 0)
  {
    v2 = 38;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J317MoreSpace")) & 1) != 0)
  {
    v2 = 39;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J320")) & 1) != 0)
  {
    v2 = 40;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J320Zoomed")) & 1) != 0)
  {
    v2 = 41;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J320MoreSpace")) & 1) != 0)
  {
    v2 = 42;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J717")) & 1) != 0)
  {
    v2 = 43;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J717MoreSpace")) & 1) != 0)
  {
    v2 = 44;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J720")) & 1) != 0)
  {
    v2 = 45;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("J720Zoomed")) & 1) != 0)
  {
    v2 = 46;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("J720MoreSpace")))
  {
    v2 = 47;
  }
  else
  {
    v2 = 1;
  }

  return v2;
}

void sub_1D013B76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location)
{
  id *v12;
  id *v13;
  id *v14;

  objc_destroyWeak(v13);
  objc_destroyWeak(v12);
  objc_destroyWeak(v14);
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  _Unwind_Resume(a1);
}

uint64_t __buildIconComparatorForIconsFromRelevancyMap_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v5, "leafIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = *(void **)(a1 + 32);
  objc_msgSend(v6, "leafIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && v12)
  {
    v13 = objc_msgSend(v9, "compare:", v12);
    if (v13 != -1)
    {
      if (!v13)
      {
        v14 = objc_msgSend(v5, "localizedCompareDisplayNames:", v6);
        goto LABEL_18;
      }
LABEL_8:
      v14 = -1;
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (v9 && !v12)
    goto LABEL_8;
  if (!v9 && v12)
  {
LABEL_11:
    v14 = 1;
    goto LABEL_18;
  }
  v15 = objc_msgSend(v5, "localizedCompareDisplayNames:", v6);
  if (v15 == 1)
    v16 = -1;
  else
    v16 = 0;
  if (v15 == -1)
    v14 = 1;
  else
    v14 = v16;
LABEL_18:

  return v14;
}

void sub_1D013E35C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D013E8F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D013EA7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D0140250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D0142238(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAPUISuggestionsWidgetViewControllerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_3)
  {
    AppPredictionUIWidgetLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!AppPredictionUIWidgetLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("APUISuggestionsWidgetViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getAPUISuggestionsWidgetViewControllerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1D014C55C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D014E8E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D014F8CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

char *sub_1D01532E0(double a1, double a2, double a3, double a4)
{
  _BYTE *v4;
  _OWORD *v9;
  uint64_t v10;
  id v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  double *v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  double v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  id v44;
  id v45;
  id v46;
  void *v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  void *v61;
  id v62;
  id v63;
  id v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  id v70;
  id v71;
  void *v72;
  uint64_t v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  void *v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  id v89;
  double v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  id v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  id v106;
  id v107;
  id v108;
  id v109;
  void *v110;
  id v112;
  uint64_t v113;
  id v114;
  id v115;
  id v116;
  id v117;
  uint64_t v118;
  id v119;
  id v120;
  id v121;
  id v122;
  id v123;
  id v124;
  uint64_t v125;
  id v126;
  uint64_t v127;
  id v128;
  uint64_t v129;
  _QWORD aBlock[6];
  objc_super v131;

  v9 = &v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  *v9 = 0u;
  v9[1] = 0u;
  *(_QWORD *)&v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView] = 0;
  v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible] = 1;
  v4[OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView] = 1;
  v10 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  v11 = objc_allocWithZone(MEMORY[0x1E0DC3990]);
  v12 = v4;
  *(_QWORD *)&v4[v10] = objc_msgSend(v11, sel_init);
  v13 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  *(_QWORD *)&v12[v13] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v14 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  *(_QWORD *)&v12[v14] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v15 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  *(_QWORD *)&v12[v15] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v16 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  *(_QWORD *)&v12[v16] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v17 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  *(_QWORD *)&v12[v17] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_init);
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = 0;
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = 0;
  v18 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews;
  *(_QWORD *)&v12[v18] = objc_msgSend((id)objc_opt_self(), sel_weakToWeakObjectsMapTable);
  *(_QWORD *)&v12[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines] = 2;

  v131.receiver = v12;
  v131.super_class = (Class)SBHAddWidgetSheetIconListCell;
  v19 = (char *)objc_msgSendSuper2(&v131, sel_initWithFrame_, a1, a2, a3, a4);
  v112 = objc_msgSend(v19, sel_contentView);
  v129 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  v20 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView];
  objc_msgSend(v20, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v20, sel_setAxis_, 0);
  objc_msgSend(v20, sel_setAlignment_, 3);
  objc_msgSend(v20, sel_setSpacing_, 8.0);
  objc_msgSend(v112, sel_addSubview_, v20);
  v21 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView];
  v22 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  objc_msgSend(v21, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v23 = (double *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  objc_msgSend(v21, sel__setContinuousCornerRadius_, *(double *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 24]);
  v24 = objc_msgSend((id)objc_opt_self(), sel_configurationWithPointSize_weight_scale_, 6, 2, 14.0);
  v25 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView];
  v26 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  v127 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  v128 = v24;
  objc_msgSend(v25, sel_setPreferredSymbolConfiguration_, v24);
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v27 = (void *)objc_opt_self();
  v28 = v25;
  v29 = objc_msgSend(v27, sel_whiteColor);
  objc_msgSend(v28, sel_setTintColor_, v29);

  objc_msgSend(*(id *)&v19[v22], sel_addSubview_, *(_QWORD *)&v19[v26]);
  v30 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel];
  v31 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  v118 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  v32 = (void *)objc_opt_self();
  v33 = *MEMORY[0x1E0DC4B10];
  v34 = *MEMORY[0x1E0DC1438];
  v35 = v30;
  v36 = objc_msgSend(v32, sel__preferredFontForTextStyle_weight_, v33, v34);
  objc_msgSend(v35, sel_setFont_, v36);

  v37 = *(void **)&v19[v31];
  objc_msgSend(v37, sel_setNumberOfLines_, 2);
  objc_msgSend(v37, sel_setAdjustsFontSizeToFitWidth_, 1);
  objc_msgSend(v37, sel_setAdjustsFontForContentSizeCategory_, 1);
  objc_msgSend(v37, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v38 = *(void **)&v19[v129];
  v39 = v22;
  v125 = v22;
  v40 = *(void **)&v19[v22];
  objc_msgSend(v38, sel_addArrangedSubview_, v40);
  objc_msgSend(v38, sel_addArrangedSubview_, v37);
  v41 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView];
  v42 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  objc_msgSend(v41, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v112, (SEL)&selRef_addGridSizeClass_, v41);
  v43 = objc_msgSend(v40, sel_widthAnchor);
  v44 = objc_msgSend(v43, sel_constraintEqualToConstant_, *v23);

  v45 = objc_msgSend(*(id *)&v19[v39], sel_heightAnchor);
  v46 = objc_msgSend(v45, (SEL)&selRef_currentIconListModel + 2, v23[1]);

  v47 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = v44;
  v123 = v44;

  v48 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = v46;
  v121 = v46;

  v49 = objc_msgSend(*(id *)&v19[v129], sel_leadingAnchor);
  v50 = objc_msgSend(v112, (SEL)&selRef_layoutPageControlWithMetrics_ + 6);
  v51 = objc_msgSend(v49, sel_constraintEqualToAnchor_, v50);

  v52 = objc_msgSend(*(id *)&v19[v129], sel_trailingAnchor);
  v53 = objc_msgSend(v112, (SEL)&selRef_startView);
  v54 = objc_msgSend(v52, (SEL)&selRef_currentConfiguringIconView + 6, v53);

  v55 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = v51;
  v116 = v51;

  v56 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = v54;
  v57 = v54;

  v58 = objc_msgSend(*(id *)&v19[v129], sel_bottomAnchor);
  v113 = v42;
  v59 = objc_msgSend(*(id *)&v19[v42], sel_topAnchor);
  v60 = objc_msgSend(v58, sel_constraintEqualToAnchor_constant_, v59, 0.0);

  v61 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = v60;
  v114 = v60;

  v62 = objc_msgSend(v112, sel_topAnchor);
  v63 = objc_msgSend(*(id *)&v19[v42], sel_topAnchor);
  v64 = objc_msgSend(v62, (SEL)&selRef_currentDevice + 7, v63, -8.0);

  v65 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint];
  *(_QWORD *)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = v64;
  v126 = v64;

  v66 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  v67 = *(void **)&v19[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView];
  objc_msgSend(v67, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  v68 = objc_allocWithZone(MEMORY[0x1E0DC3658]);
  aBlock[4] = sub_1D01540C0;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1D0155E38;
  aBlock[3] = &block_descriptor_7;
  v69 = _Block_copy(aBlock);
  v70 = v67;
  v71 = objc_msgSend(v68, sel_initWithDynamicProvider_, v69);
  _Block_release(v69);
  swift_release();
  objc_msgSend(v70, sel_setBackgroundColor_, v71);

  v72 = *(void **)&v19[v66];
  objc_msgSend(v72, sel__setContinuousCornerRadius_, 0.5);
  objc_msgSend(v112, sel_addSubview_, v72);
  v120 = (id)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4E8);
  v73 = swift_allocObject();
  *(_OWORD *)(v73 + 16) = xmmword_1D0195BF0;
  v74 = objc_msgSend(*(id *)&v19[v129], sel_topAnchor);
  v75 = objc_msgSend(v112, sel_topAnchor);
  v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

  *(_QWORD *)(v73 + 32) = v76;
  *(_QWORD *)(v73 + 40) = v116;
  *(_QWORD *)(v73 + 48) = v57;
  v77 = *(void **)&v19[v129];
  v117 = v116;
  v115 = v57;
  v78 = objc_msgSend(v77, sel_heightAnchor);
  v79 = objc_msgSend(*(id *)&v19[v118], sel_heightAnchor);
  v80 = objc_msgSend(v78, sel_constraintEqualToAnchor_constant_, v79, 54.0);

  *(_QWORD *)(v73 + 56) = v80;
  *(_QWORD *)(v73 + 64) = v114;
  v81 = *(void **)&v19[v113];
  v119 = v114;
  v82 = objc_msgSend(v81, sel_leadingAnchor);
  v83 = objc_msgSend(v112, sel_leadingAnchor);
  v84 = objc_msgSend(v82, sel_constraintEqualToAnchor_, v83);

  *(_QWORD *)(v73 + 72) = v84;
  v85 = objc_msgSend(*(id *)&v19[v113], sel_trailingAnchor);
  v86 = objc_msgSend(v112, sel_trailingAnchor);
  v87 = objc_msgSend(v85, (SEL)&selRef_currentConfiguringIconView + 6, v86);

  *(_QWORD *)(v73 + 80) = v87;
  v88 = objc_msgSend(*(id *)&v19[v113], sel_bottomAnchor);
  v89 = objc_msgSend(v112, sel_bottomAnchor);
  sub_1D0154148();
  v91 = objc_msgSend(v88, sel_constraintEqualToAnchor_constant_, v89, -(v90 + 4.0 + 24.0 + 1.0));

  *(_QWORD *)(v73 + 88) = v91;
  *(_QWORD *)(v73 + 96) = v123;
  *(_QWORD *)(v73 + 104) = v121;
  v92 = *(void **)&v19[v127];
  v124 = v123;
  v122 = v121;
  v93 = objc_msgSend(v92, sel_centerXAnchor);
  v94 = objc_msgSend(*(id *)&v19[v125], sel_centerXAnchor);
  v95 = objc_msgSend(v93, sel_constraintEqualToAnchor_, v94);

  *(_QWORD *)(v73 + 112) = v95;
  v96 = objc_msgSend(*(id *)&v19[v127], sel_centerYAnchor);
  v97 = objc_msgSend(*(id *)&v19[v125], sel_centerYAnchor);
  v98 = objc_msgSend(v96, sel_constraintEqualToAnchor_, v97);

  *(_QWORD *)(v73 + 120) = v98;
  v99 = objc_msgSend(*(id *)&v19[v66], sel_leadingAnchor);
  v100 = objc_msgSend(*(id *)&v19[v129], sel_leadingAnchor);
  v101 = objc_msgSend(v99, sel_constraintEqualToAnchor_constant_, v100, -4.0);

  *(_QWORD *)(v73 + 128) = v101;
  v102 = objc_msgSend(*(id *)&v19[v66], sel_trailingAnchor);
  v103 = objc_msgSend(*(id *)&v19[v129], sel_trailingAnchor);
  v104 = objc_msgSend(v102, sel_constraintEqualToAnchor_, v103);

  *(_QWORD *)(v73 + 136) = v104;
  v105 = objc_msgSend(*(id *)&v19[v66], sel_heightAnchor);
  v106 = objc_msgSend(v105, sel_constraintEqualToConstant_, 1.0);

  *(_QWORD *)(v73 + 144) = v106;
  v107 = objc_msgSend(*(id *)&v19[v66], sel_bottomAnchor);
  v108 = objc_msgSend(v112, sel_bottomAnchor);
  v109 = objc_msgSend(v107, sel_constraintEqualToAnchor_, v108);

  *(_QWORD *)(v73 + 152) = v109;
  aBlock[0] = v73;
  sub_1D015F048();
  sub_1D01562D8(0, &qword_1EFC0F4F0);
  v110 = (void *)sub_1D015F03C();
  swift_bridgeObjectRelease();
  objc_msgSend(v120, sel_activateConstraints_, v110);

  sub_1D0154240();
  return v19;
}

id sub_1D01540C0(void *a1)
{
  id v2;
  void *v3;
  char **v4;
  id v5;
  id v6;

  v2 = objc_msgSend(a1, sel_userInterfaceStyle);
  v3 = (void *)objc_opt_self();
  v4 = &selRef_systemFillColor;
  if (v2 != (id)2)
    v4 = &selRef_separatorColor;
  v5 = objc_msgSend(v3, *v4);
  v6 = objc_msgSend(v5, sel_resolvedColorWithTraitCollection_, a1);

  return v6;
}

void sub_1D0154148()
{
  char *v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E0DC4AA0], 256);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_lineHeight);
    v3 = *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines];
    objc_msgSend(v2, sel_leading);
    if (!__OFSUB__(v3, 1))
    {
      v4 = objc_msgSend(v0, sel_traitCollection);
      objc_msgSend(v4, sel_displayScale);

      UICeilToScale();
      return;
    }
    __break(1u);
  }
  __break(1u);
}

id sub_1D0154240()
{
  char *v0;
  id v1;
  void *v2;
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id result;

  v1 = objc_msgSend(v0, sel_iconListView);
  if (v1 && (v2 = v1, v3 = objc_msgSend(v1, sel_layout), v2, v3))
  {
    objc_msgSend(v3, sel_layoutInsetsForOrientation_, 1);
    v5 = v4;
    v7 = v6;
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v7 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result = *(id *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint];
  if (result)
  {
    objc_msgSend(result, sel_setConstant_, v5 + 4.0);
    result = *(id *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint];
    if (result)
      return objc_msgSend(result, sel_setConstant_, -v7);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

void __swiftcall SBHAddWidgetSheetIconListCell.init(coder:)(SBHAddWidgetSheetIconListCell_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id sub_1D0154438(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  double *v5;
  id result;

  v5 = (double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo);
  result = (id)SBIconImageInfoEqualToIconImageInfo(*(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 8), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 16), *(double *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo + 24), a1, a2, a3, a4);
  if ((result & 1) == 0)
  {
    result = *(id *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint);
    if (result)
    {
      objc_msgSend(result, sel_setConstant_, *v5);
      result = *(id *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint);
      if (result)
      {
        objc_msgSend(result, sel_setConstant_, v5[1]);
        return objc_msgSend(*(id *)(v4 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView), sel__setContinuousCornerRadius_, v5[3]);
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1D0154704(void *a1)
{
  uint64_t v1;
  unsigned __int8 v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  id v7;
  id v8;

  v8 = a1;
  if (a1)
  {
    v2 = objc_msgSend(a1, sel_isSymbolImage);
    v3 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
    if ((v2 & 1) != 0)
    {
      v4 = 0;
      v5 = 1;
      goto LABEL_7;
    }
    a1 = v8;
  }
  else
  {
    v3 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView);
  }
  v4 = a1;
  v5 = 0;
LABEL_7:
  objc_msgSend(v3, sel_setImage_, v4);

  v6 = *(void **)(v1 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView);
  if (v5)
    v7 = v8;
  else
    v7 = 0;
  objc_msgSend(v6, sel_setImage_, v7);

}

void sub_1D0154894(void *a1)
{
  char *v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  id v32;
  char isEscapingClosureAtFileLocation;
  id v34;
  _QWORD v35[6];

  v2 = *(void **)&v1[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView];
  if (v2)
  {
    v3 = v1;
    v4 = *(void **)&v1[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView];
    v5 = v2;
    objc_msgSend(v4, sel_addSubview_, v5);
    objc_msgSend(v5, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v5, sel_iconSpacing);
    v7 = v6;
    v9 = v8;
    sub_1D0154148();
    v11 = v10 + 4.0 + 4.0;
    if (v9 > v11)
      v12 = v9;
    else
      v12 = v11;
    objc_msgSend(v5, sel_setIconSpacing_, v7, v12);
    v13 = (void *)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4E8);
    v14 = swift_allocObject();
    *(_OWORD *)(v14 + 16) = xmmword_1D0195C00;
    v15 = objc_msgSend(v5, sel_leadingAnchor);
    v16 = objc_msgSend(v4, sel_leadingAnchor);
    v17 = objc_msgSend(v15, sel_constraintEqualToAnchor_, v16);

    *(_QWORD *)(v14 + 32) = v17;
    v18 = objc_msgSend(v5, sel_trailingAnchor);
    v19 = objc_msgSend(v4, sel_trailingAnchor);
    v20 = objc_msgSend(v18, sel_constraintEqualToAnchor_, v19);

    *(_QWORD *)(v14 + 40) = v20;
    v21 = objc_msgSend(v5, sel_bottomAnchor);
    v22 = objc_msgSend(v4, sel_bottomAnchor);
    v23 = objc_msgSend(v21, sel_constraintEqualToAnchor_, v22);

    *(_QWORD *)(v14 + 48) = v23;
    v24 = objc_msgSend(v5, sel_topAnchor);
    v25 = objc_msgSend(v4, sel_topAnchor);
    v26 = objc_msgSend(v24, sel_constraintEqualToAnchor_, v25);

    *(_QWORD *)(v14 + 56) = v26;
    sub_1D015F048();
    sub_1D01562D8(0, &qword_1EFC0F4F0);
    v27 = (void *)sub_1D015F03C();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_activateConstraints_, v27, v14);

    v28 = swift_allocObject();
    *(_QWORD *)(v28 + 16) = v3;
    *(_QWORD *)(v28 + 24) = v5;
    v29 = swift_allocObject();
    *(_QWORD *)(v29 + 16) = sub_1D015633C;
    *(_QWORD *)(v29 + 24) = v28;
    v35[4] = sub_1D0156370;
    v35[5] = v29;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 1107296256;
    v35[2] = sub_1D0154F60;
    v35[3] = &block_descriptor;
    v30 = _Block_copy(v35);
    v31 = v5;
    v32 = v3;
    swift_retain();
    swift_release();
    objc_msgSend(v31, sel_enumerateIconViewsUsingBlock_, v30);
    _Block_release(v30);
    isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
    swift_release();
    if ((isEscapingClosureAtFileLocation & 1) != 0)
    {
      __break(1u);
    }
    else
    {
      objc_msgSend(v31, sel_addLayoutObserver_, v32);
      v34 = objc_msgSend(v32, sel_contentView);
      objc_msgSend(v34, sel_setNeedsLayout);

      sub_1D0154240();
      swift_release();

    }
  }
  else if (a1)
  {
    objc_msgSend(a1, sel_removeFromSuperview);
  }
}

void sub_1D0154CEC(void *a1, void *a2)
{
  uint64_t v2;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;

  v5 = *(void **)(v2 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews);
  v6 = objc_msgSend(v5, sel_objectForKey_, a1);

  if (!v6)
  {
    v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
    objc_msgSend(v7, sel_setNumberOfLines_, *(_QWORD *)(v2 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines));
    v8 = objc_msgSend(a1, sel_icon);
    v9 = v8;
    if (v8)
    {
      v10 = objc_msgSend(v8, sel_displayName);

      sub_1D015F030();
      v9 = (void *)sub_1D015F024();
      swift_bridgeObjectRelease();
    }
    objc_msgSend(v7, sel_setText_, v9);

    v11 = objc_msgSend((id)objc_opt_self(), sel__preferredFontForTextStyle_variant_, *MEMORY[0x1E0DC4AA0], 256);
    if (v11)
    {
      v12 = v11;
      objc_msgSend(v7, sel_setFont_, v11);

      v13 = objc_msgSend((id)objc_opt_self(), sel_labelColor);
      objc_msgSend(v7, sel_setTextColor_, v13);

      objc_msgSend(v7, sel_setTextAlignment_, 1);
      objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
      objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
      objc_msgSend(v5, sel_setObject_forKey_, v7, a1);
      v14 = objc_msgSend(a1, sel_contentContainerView);
      objc_msgSend(v14, sel_addSubview_, v7);
      sub_1D01552E8(v7, v14, a1, a2);

    }
    else
    {
      __break(1u);
    }
  }
}

void sub_1D0154F60(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id sub_1D0155034()
{
  uint64_t v0;
  uint64_t v1;
  id result;

  v1 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView;
  objc_msgSend(*(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView), sel_setHidden_, (*(_BYTE *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView) & 1) == 0);
  result = *(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint);
  if (result)
  {
    objc_msgSend(result, sel_setActive_, *(unsigned __int8 *)(v0 + v1));
    result = *(id *)(v0 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint);
    if (result)
      return objc_msgSend(result, sel_setActive_, (*(_BYTE *)(v0 + v1) & 1) == 0);
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.prepareForReuse()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  objc_super v5;

  v5.super_class = (Class)SBHAddWidgetSheetIconListCell;
  objc_msgSendSuper2(&v5, sel_prepareForReuse);
  objc_msgSend(v0, sel_setTitle_, 0);
  objc_msgSend(v0, sel_setIconImage_, 0);
  objc_msgSend(v0, sel_setIconBackgroundColor_, 0);
  v1 = objc_msgSend(v0, sel_iconListView);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_model);

    if (v3)
    {

      sub_1D01562D8(0, &qword_1EFC0F3C0);
      v4 = (void *)sub_1D015F03C();
      objc_msgSend(v3, sel_setIcons_, v4);

    }
  }
  objc_msgSend(v0, sel_setSeparatorVisible_, 1);
  objc_msgSend(v0, sel_setWantsHeaderView_, 1);
}

Swift::Bool __swiftcall SBHAddWidgetSheetIconListCell._descendantsShouldHighlight()()
{
  return 0;
}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.iconListView(_:didAdd:)(SBIconListView *_, SBIconView *didAdd)
{
  sub_1D0154CEC(didAdd, _);
}

void sub_1D01552E8(void *a1, void *a2, id a3, void *a4)
{
  void *v4;
  id v9;
  char **v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  _QWORD *v21;
  id v22;
  _QWORD *v23;
  uint64_t v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  _QWORD *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  NSObject *v38;
  os_log_type_t v39;
  uint8_t *v40;
  _QWORD *v41;
  id v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  CGFloat v47;
  double v48;
  CGFloat v49;
  id v50;
  unsigned int v51;
  void *v52;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v57;
  id v58;
  void *v59;
  id v60;
  id v61;
  id v62;
  double v63;
  double MaxY;
  double v65;
  id v66;
  id v67;
  id v68;
  id v69;
  void *v70;
  uint64_t v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v79;
  void *rect;
  CGFloat recta;
  void *rect_8;
  void *rect_16a;
  void *rect_16;
  CGRect v85;
  CGRect v86;
  CGRect v87;

  v9 = objc_msgSend(a3, sel_icon);
  v10 = &selRef_canShowResizeHandle;
  if (!v9)
    goto LABEL_10;
  v11 = v9;
  v12 = objc_msgSend(a4, sel_model);
  if (!v12)
  {

LABEL_10:
    if (qword_1EFC0F3B8 != -1)
      swift_once();
    v24 = sub_1D015F000();
    __swift_project_value_buffer(v24, (uint64_t)qword_1EFC0FEC0);
    v25 = a3;
    v26 = sub_1D015EFF4();
    v27 = sub_1D015F084();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v28 = 138412290;
      rect_16a = a1;
      v30 = a2;
      v31 = v25;
      v10 = &selRef_canShowResizeHandle;
      sub_1D015F0B4();
      *v29 = v25;

      a2 = v30;
      a1 = rect_16a;
      _os_log_impl(&dword_1CFEF3000, v26, v27, "Unable to get icon and model for icon view: %@", v28, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4F8);
      swift_arrayDestroy();
      MEMORY[0x1D17DF970](v29, -1, -1);
      MEMORY[0x1D17DF970](v28, -1, -1);

    }
    else
    {

    }
    goto LABEL_29;
  }
  v13 = v12;
  v14 = objc_msgSend(v12, sel_indexForIcon_, v11);
  v15 = sub_1D015EFC4();
  if ((v15 & 0x8000000000000000) == 0 && v14 == (id)v15)
  {
    if (qword_1EFC0F3B8 != -1)
      swift_once();
    v16 = sub_1D015F000();
    __swift_project_value_buffer(v16, (uint64_t)qword_1EFC0FEC0);
    v17 = v11;
    v18 = sub_1D015EFF4();
    v19 = sub_1D015F084();
    if (os_log_type_enabled(v18, v19))
    {
      rect = v13;
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v20 = 138412290;
      v22 = v17;
      sub_1D015F0B4();
      *v21 = v11;

      _os_log_impl(&dword_1CFEF3000, v18, v19, "Unable to get index for icon: %@", v20, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4F8);
      swift_arrayDestroy();
      v23 = v21;
      v10 = &selRef_canShowResizeHandle;
      MEMORY[0x1D17DF970](v23, -1, -1);
      MEMORY[0x1D17DF970](v20, -1, -1);

    }
    else
    {

    }
LABEL_29:
    v68 = objc_msgSend(a1, sel_widthAnchor, rect);
    v69 = objc_msgSend(a2, sel_widthAnchor);
    v67 = objc_msgSend(v68, v10[322], v69, 16.0);

    v63 = 4.0;
    goto LABEL_30;
  }
  rect_8 = a2;
  rect_16 = a1;
  v32 = objc_msgSend(a4, sel_layoutMetrics);
  v33 = objc_msgSend(a4, sel_iconCoordinateForIndex_metrics_, v14, v32);
  v35 = v34;
  if (SBIconCoordinateIsNotFound((uint64_t)v33, v34))
  {
    if (qword_1EFC0F3B8 != -1)
      swift_once();
    v36 = sub_1D015F000();
    __swift_project_value_buffer(v36, (uint64_t)qword_1EFC0FEC0);
    v37 = v11;
    v38 = sub_1D015EFF4();
    v39 = sub_1D015F084();
    if (os_log_type_enabled(v38, v39))
    {
      rect = v13;
      v40 = (uint8_t *)swift_slowAlloc();
      v41 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v40 = 138412290;
      v42 = v37;
      sub_1D015F0B4();
      *v41 = v11;

      _os_log_impl(&dword_1CFEF3000, v38, v39, "Unable to get coordinate for icon: %@", v40, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4F8);
      swift_arrayDestroy();
      MEMORY[0x1D17DF970](v41, -1, -1);
      MEMORY[0x1D17DF970](v40, -1, -1);

    }
    else
    {

    }
    a2 = rect_8;
    a1 = rect_16;
    v10 = &selRef_canShowResizeHandle;
    goto LABEL_29;
  }
  objc_msgSend(a4, sel_rectForCellAtIconCoordinate_metrics_, v33, v35, v32);
  recta = v43;
  v45 = v44;
  v47 = v46;
  v49 = v48;
  v50 = objc_msgSend(v11, sel_gridSizeClass);
  v51 = objc_msgSend(a4, sel_iconGridSizeForClass_, v50);

  v52 = v32;
  objc_msgSend(a4, sel_rectForDefaultSizedCellsOfSize_startingAtCoordinate_metrics_, v51, v33, v35, v32);
  x = v85.origin.x;
  y = v85.origin.y;
  width = v85.size.width;
  height = v85.size.height;
  v57 = CGRectGetWidth(v85);
  v58 = objc_msgSend(v4, sel_window);
  if (!v58)
    goto LABEL_25;
  v59 = v58;
  v60 = objc_msgSend(v58, sel_windowScene);

  if (!v60)
    goto LABEL_25;
  v61 = objc_msgSend(v60, sel_interfaceOrientation);

  v62 = objc_msgSend(objc_msgSend(a4, sel_layout), sel_numberOfColumnsForOrientation_, v61);
  v52 = v32;
  swift_unknownObjectRelease();
  if (v62 == (id)(unsigned __int16)v51)
  {

    v63 = 4.0;
  }
  else
  {
LABEL_25:
    v86.origin.x = x;
    v86.origin.y = y;
    v86.size.width = width;
    v86.size.height = height;
    MaxY = CGRectGetMaxY(v86);
    v87.origin.x = recta;
    v87.origin.y = v45;
    v87.size.width = v47;
    v87.size.height = v49;
    v65 = CGRectGetMaxY(v87);

    v63 = MaxY - v65 + 4.0;
  }
  a2 = rect_8;
  v66 = objc_msgSend(a1, sel_widthAnchor);
  v67 = objc_msgSend(v66, sel_constraintEqualToConstant_, v57 + 16.0);

  v10 = &selRef_canShowResizeHandle;
LABEL_30:
  v70 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F4E8);
  v71 = swift_allocObject();
  *(_OWORD *)(v71 + 16) = xmmword_1D0195C10;
  v72 = objc_msgSend(a1, sel_centerXAnchor);
  v73 = objc_msgSend(a2, sel_centerXAnchor);
  v74 = objc_msgSend(v72, sel_constraintEqualToAnchor_, v73);

  *(_QWORD *)(v71 + 32) = v74;
  *(_QWORD *)(v71 + 40) = v67;
  v75 = v67;
  v76 = objc_msgSend(a1, sel_topAnchor);
  v77 = objc_msgSend(a2, sel_bottomAnchor);
  v78 = objc_msgSend(v76, v10[322], v77, v63);

  *(_QWORD *)(v71 + 48) = v78;
  sub_1D015F048();
  sub_1D01562D8(0, &qword_1EFC0F4F0);
  v79 = (void *)sub_1D015F03C();
  swift_bridgeObjectRelease();
  objc_msgSend(v70, sel_activateConstraints_, v79);

}

Swift::Void __swiftcall SBHAddWidgetSheetIconListCell.iconListView(_:didRemove:)(SBIconListView *_, SBIconView *didRemove)
{
  uint64_t v2;
  void *v4;
  id v5;

  v4 = *(void **)(v2 + OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews);
  v5 = objc_msgSend(v4, sel_objectForKey_, didRemove);
  if (v5)
    objc_msgSend(v5, sel_removeFromSuperview);
  objc_msgSend(v4, sel_removeObjectForKey_, didRemove);

}

id sub_1D0155E38(uint64_t a1, void *a2)
{
  uint64_t (*v3)(void);
  id v4;
  void *v5;

  v3 = *(uint64_t (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v5 = (void *)v3();
  swift_release();

  return v5;
}

void sub_1D0155E88(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_1D0155E94@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void _sSo29SBHAddWidgetSheetIconListCellC15SpringBoardHomeE5coderABSgSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v1 = &v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconImageInfo];
  *v1 = 0u;
  v1[1] = 0u;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_iconListView] = 0;
  v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorVisible] = 1;
  v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_wantsHeaderView] = 1;
  v2 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_textLabel;
  *(_QWORD *)&v0[v2] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v3 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageView;
  *(_QWORD *)&v0[v3] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v4 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_symbolImageView;
  *(_QWORD *)&v0[v4] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3890]), sel_init);
  v5 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_separatorView;
  *(_QWORD *)&v0[v5] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v6 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerView;
  *(_QWORD *)&v0[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v7 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackView;
  *(_QWORD *)&v0[v7] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA8]), sel_init);
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageWidthConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_imageHeightConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerLeadingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_headerTrailingConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_titleStackViewBottomConstraint] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_listContainerViewTopConstraint] = 0;
  v8 = OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelViewsForIconViews;
  *(_QWORD *)&v0[v8] = objc_msgSend((id)objc_opt_self(), sel_weakToWeakObjectsMapTable);
  *(_QWORD *)&v0[OBJC_IVAR___SBHAddWidgetSheetIconListCell_labelNumberOfLines] = 2;

  sub_1D015F0C0();
  __break(1u);
}

uint64_t type metadata accessor for SBHAddWidgetSheetIconListCell(uint64_t a1)
{
  return sub_1D01562D8(a1, &qword_1EFC0F4C0);
}

_DWORD *__swift_memcpy4_2(_DWORD *result, _DWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_1D01560A8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 4))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D01560C8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_DWORD *)result = a2 - 1;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 4) = v3;
  return result;
}

void type metadata accessor for SBHIconGridSize(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F4C8);
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t sub_1D0156120(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 80))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D0156140(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = (a2 - 1);
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 80) = v3;
  return result;
}

void type metadata accessor for SBIconResizeHandleMetrics(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F4D0);
}

uint64_t sub_1D0156194(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_1D01561D0(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D01561F0(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for SBIconImageInfo(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F4D8);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1D015623C(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1D015625C(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for SBIconCoordinate(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F4E0);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17DF91C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1D01562D8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1D0156310()
{
  uint64_t v0;

  return swift_deallocObject();
}

void sub_1D015633C(void *a1)
{
  uint64_t v1;

  sub_1D0154CEC(a1, *(void **)(v1 + 24));
}

uint64_t sub_1D0156360()
{
  return swift_deallocObject();
}

uint64_t sub_1D0156370()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F500);
}

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F508);
}

void type metadata accessor for SBIconResizeHandleHitAreaShape(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F510);
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_1D0156424(a1, &qword_1EFC0F518);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_1D0156424(a1, (unint64_t *)&unk_1EFC0F520);
}

void sub_1D0156424(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

id static SBLeafIcon.iconWithUniqueLeafIdentifier()()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUniqueLeafIdentifier);
}

uint64_t sub_1D015655C(_OWORD *a1, void *a2, double a3, double a4, double a5, CGFloat a6)
{
  _BYTE *v6;
  _BYTE *v7;
  _OWORD *v14;
  _QWORD *v15;
  _OWORD *v16;
  __int128 v17;
  __int128 v18;
  double *v19;
  id v20;
  char *v21;
  id v22;
  uint64_t v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  double v36;
  CGFloat v37;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v42;
  CGFloat *v43;
  uint64_t v44;
  void *v45;
  char *v46;
  uint64_t result;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  char *v55;
  char *v56;
  id v57;
  id v58;
  id v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;
  uint64_t v72;
  uint64_t v73;
  id v74;
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  id v82;
  __int128 v83;
  id v84;
  void *v85;
  id v86;
  uint64_t ObjectType;
  _QWORD v88[3];
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  objc_super v92;
  __int128 aBlock;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  CGRect v98;
  CGRect v99;

  v7 = v6;
  ObjectType = swift_getObjectType();
  v14 = &v7[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  *v14 = 0u;
  v14[1] = 0u;
  v15 = &v7[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *v15 = 0;
  v15[1] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle__isResizing] = 0;
  v7[OBJC_IVAR___SBHIconResizeHandle_isDarkStyle] = 0;
  *(_QWORD *)&v7[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = 0;
  v16 = &v7[OBJC_IVAR___SBHIconResizeHandle_metrics];
  v17 = a1[3];
  v16[2] = a1[2];
  v16[3] = v17;
  v16[4] = a1[4];
  v18 = a1[1];
  *v16 = *a1;
  v16[1] = v18;
  v19 = (double *)&v7[OBJC_IVAR___SBHIconResizeHandle_iconImageInfo];
  *v19 = a3;
  v19[1] = a4;
  v19[2] = a5;
  v19[3] = a6;
  *(_QWORD *)&v7[OBJC_IVAR___SBHIconResizeHandle_backgroundView] = a2;
  v20 = objc_allocWithZone(MEMORY[0x1E0DC3F10]);
  v21 = v7;
  v86 = a2;
  v22 = objc_msgSend(v20, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v23 = OBJC_IVAR___SBHIconResizeHandle_whiteTintView;
  *(_QWORD *)&v21[OBJC_IVAR___SBHIconResizeHandle_whiteTintView] = v22;
  v24 = (void *)objc_opt_self();
  v25 = v22;
  v26 = objc_msgSend(v24, sel_whiteColor);
  objc_msgSend(v25, sel_setBackgroundColor_, v26);

  objc_msgSend(*(id *)&v21[v23], sel_setAlpha_, 0.42);
  v27 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v28 = OBJC_IVAR___SBHIconResizeHandle_highlightView;
  *(_QWORD *)&v21[OBJC_IVAR___SBHIconResizeHandle_highlightView] = v27;
  v29 = v27;
  v30 = objc_msgSend(v24, sel_blackColor);
  objc_msgSend(v29, sel_setBackgroundColor_, v30);

  v31 = *(void **)&v21[v28];
  objc_msgSend(v31, sel_setAlpha_, 0.0);
  v32 = objc_msgSend(v31, sel_layer);
  v33 = (id)*MEMORY[0x1E0CD2EC0];
  objc_msgSend(v32, sel_setCompositingFilter_, v33);

  v92.receiver = v21;
  v92.super_class = (Class)SBHIconResizeHandle;
  v34 = objc_msgSendSuper2(&v92, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v35 = objc_msgSend(v34, sel_traitCollection);
  objc_msgSend(v35, sel_displayScale);

  BSFloatCeilForScale();
  v37 = -v36;
  v98.origin.x = 0.0;
  v98.origin.y = 0.0;
  v98.size.width = a6;
  v98.size.height = a6;
  v99 = CGRectInset(v98, v37, v37);
  x = v99.origin.x;
  y = v99.origin.y;
  width = v99.size.width;
  height = v99.size.height;
  v42 = (void *)objc_opt_self();
  v43 = (CGFloat *)swift_allocObject();
  *((_QWORD *)v43 + 2) = v34;
  v43[3] = x;
  v43[4] = y;
  v43[5] = width;
  v43[6] = height;
  v44 = swift_allocObject();
  *(_QWORD *)(v44 + 16) = sub_1D015835C;
  *(_QWORD *)(v44 + 24) = v43;
  *(_QWORD *)&v95 = sub_1D0156370;
  *((_QWORD *)&v95 + 1) = v44;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  *(_QWORD *)&v94 = sub_1D0156F3C;
  *((_QWORD *)&v94 + 1) = &block_descriptor_9;
  v45 = _Block_copy(&aBlock);
  v46 = (char *)v34;
  swift_retain();
  swift_release();
  objc_msgSend(v42, sel_performWithoutAnimation_, v45);
  _Block_release(v45);
  LOBYTE(v34) = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((v34 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    v94 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 16];
    v95 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 32];
    v96 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 48];
    v97 = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics + 64];
    aBlock = *(_OWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_metrics];
    sub_1D0157E6C((uint64_t)&aBlock, (uint64_t)objc_msgSend(v46, sel_effectiveUserInterfaceLayoutDirection), (uint64_t)v88, a6);
    v48 = v88[0];
    v85 = (void *)v88[0];
    v49 = v88[1];
    v50 = v88[2];
    v83 = v89;
    v51 = v90;
    v52 = v91;
    v53 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2840]), sel_init);
    objc_msgSend(v53, sel_setPath_, v48);
    v54 = *(void **)&v46[OBJC_IVAR___SBHIconResizeHandle_shapeLayer];
    *(_QWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = v53;
    v84 = v53;

    v55 = &v46[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
    *(_QWORD *)v55 = v49;
    *((_QWORD *)v55 + 1) = v50;
    v56 = &v46[OBJC_IVAR___SBHIconResizeHandle_hitArea];
    *(_OWORD *)v56 = v83;
    *((_QWORD *)v56 + 2) = v51;
    *((_QWORD *)v56 + 3) = v52;
    v57 = objc_msgSend(v46, sel_layer);
    objc_msgSend(v57, sel_setMask_, v84);

    v58 = objc_msgSend(v46, sel_layer);
    objc_msgSend(v58, sel_setHitTestsAsOpaque_, 1);

    sub_1D015F030();
    v59 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
    v60 = (void *)sub_1D015F024();
    swift_bridgeObjectRelease();
    v61 = objc_msgSend(v59, sel_initWithType_, v60);

    v62 = (void *)sub_1D015F024();
    objc_msgSend(v61, sel_setName_, v62);

    v63 = (void *)sub_1D015F078();
    v64 = (void *)sub_1D015F024();
    objc_msgSend(v61, sel_setValue_forKey_, v63, v64);

    sub_1D015F030();
    v65 = objc_allocWithZone(MEMORY[0x1E0CD2780]);
    v66 = (void *)sub_1D015F024();
    swift_bridgeObjectRelease();
    v67 = objc_msgSend(v65, sel_initWithType_, v66);

    v68 = (void *)sub_1D015F024();
    objc_msgSend(v67, sel_setName_, v68);

    v69 = (void *)sub_1D015F078();
    v70 = (void *)sub_1D015F024();
    objc_msgSend(v67, sel_setValue_forKey_, v69, v70);

    v71 = objc_msgSend(v46, sel_layer);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F608);
    v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_1D0195D30;
    v73 = sub_1D01562D8(0, &qword_1EFC0F610);
    *(_QWORD *)(v72 + 32) = v61;
    *(_QWORD *)(v72 + 88) = v73;
    *(_QWORD *)(v72 + 56) = v73;
    *(_QWORD *)(v72 + 64) = v67;
    v74 = v61;
    v75 = v67;
    v76 = (void *)sub_1D015F03C();
    swift_bridgeObjectRelease();
    objc_msgSend(v71, sel_setFilters_, v76);

    objc_msgSend(v46, sel_addSubview_, v86);
    objc_msgSend(v46, sel_addSubview_, *(_QWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_whiteTintView]);
    objc_msgSend(v46, sel_addSubview_, *(_QWORD *)&v46[OBJC_IVAR___SBHIconResizeHandle_highlightView]);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFC0F618);
    v77 = swift_allocObject();
    *(_OWORD *)(v77 + 16) = xmmword_1D0195D40;
    v78 = sub_1D015F018();
    v79 = MEMORY[0x1E0DC1F50];
    *(_QWORD *)(v77 + 32) = v78;
    *(_QWORD *)(v77 + 40) = v79;
    v80 = swift_allocObject();
    *(CGFloat *)(v80 + 16) = a6;
    *(_QWORD *)(v80 + 24) = v84;
    *(_QWORD *)(v80 + 32) = ObjectType;
    type metadata accessor for SBHIconResizeHandle(v80);
    v81 = v46;
    v82 = v84;
    sub_1D015F09C();
    swift_release();

    swift_unknownObjectRelease();
    swift_bridgeObjectRelease();
    swift_release();

    return (uint64_t)v81;
  }
  return result;
}

id sub_1D0156E70(char *a1, double a2, double a3, double a4, double a5)
{
  id v10;

  objc_msgSend(a1, sel_setFrame_);
  v10 = objc_msgSend(a1, sel_backgroundView);
  objc_msgSend(v10, sel_setFrame_, a2, a3, a4, a5);

  objc_msgSend(*(id *)&a1[OBJC_IVAR___SBHIconResizeHandle_whiteTintView], sel_setFrame_, a2, a3, a4, a5);
  return objc_msgSend(*(id *)&a1[OBJC_IVAR___SBHIconResizeHandle_highlightView], sel_setFrame_, a2, a3, a4, a5);
}

uint64_t sub_1D0156F3C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

__n128 sub_1D0156F5C(char *a1, double a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  __n128 *v15;
  __n128 result;
  __n128 v17;
  _QWORD v18[3];
  __n128 v19;
  unint64_t v20;
  unint64_t v21;
  __int128 v22;

  v7 = objc_msgSend(a1, sel_effectiveUserInterfaceLayoutDirection);
  objc_msgSend(a1, sel_metrics);
  v8 = objc_msgSend(a1, sel_traitCollection);
  objc_msgSend(v8, sel_displayScale);

  sub_1D0157E6C((uint64_t)&v22, (uint64_t)v7, (uint64_t)v18, a2);
  v9 = (void *)v18[0];
  v10 = v18[1];
  v11 = v18[2];
  v17 = v19;
  v12 = v20;
  v13 = v21;
  objc_msgSend(a4, sel_setPath_, v18[0]);

  v14 = &a1[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *(_QWORD *)v14 = v10;
  *((_QWORD *)v14 + 1) = v11;
  v15 = (__n128 *)&a1[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  result = v17;
  *v15 = v17;
  v15[1].n128_u64[0] = v12;
  v15[1].n128_u64[1] = v13;
  return result;
}

void __swiftcall SBHIconResizeHandle.init(coder:)(SBHIconResizeHandle *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

Swift::Void __swiftcall SBHIconResizeHandle.layoutSubviews()()
{
  char *v0;
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;

  objc_msgSend(v0, sel_bounds);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v9 = objc_msgSend(v0, sel_backgroundView);
  objc_msgSend(v9, sel_setFrame_, v2, v4, v6, v8);

  objc_msgSend(*(id *)&v0[OBJC_IVAR___SBHIconResizeHandle_whiteTintView], sel_setFrame_, v2, v4, v6, v8);
  objc_msgSend(*(id *)&v0[OBJC_IVAR___SBHIconResizeHandle_highlightView], sel_setFrame_, v2, v4, v6, v8);
}

CGSize __swiftcall SBHIconResizeHandle.sizeThatFits(_:)(CGSize a1)
{
  void *v1;
  double v2;
  double v3;
  double v4;
  CGSize result;

  objc_msgSend(v1, sel_iconImageInfo, a1.width, a1.height);
  v3 = v2;
  v4 = v2;
  result.height = v4;
  result.width = v3;
  return result;
}

void sub_1D01573CC(char a1)
{
  char *v1;
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  char *v12;
  id v13;
  _QWORD aBlock[6];

  v2 = OBJC_IVAR___SBHIconResizeHandle_isHighlighted;
  if (v1[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] != (a1 & 1))
  {
    v13 = objc_msgSend(v1, sel_layer);
    if (v1[v2] == 1)
    {
      v3 = (void *)sub_1D015F054();
      v4 = (void *)sub_1D015F024();
      objc_msgSend(v13, sel_setValue_forKeyPath_, v3, v4);

      v5 = objc_msgSend(v1, sel_traitCollection);
      objc_msgSend(v5, sel_userInterfaceStyle);

      v6 = (void *)sub_1D015F054();
      v7 = (void *)sub_1D015F024();
      objc_msgSend(v13, sel_setValue_forKeyPath_, v6, v7);

      objc_msgSend(*(id *)&v1[OBJC_IVAR___SBHIconResizeHandle_highlightView], sel_setAlpha_, 0.533333333);
    }
    else
    {
      v8 = (void *)objc_opt_self();
      v9 = swift_allocObject();
      *(_QWORD *)(v9 + 16) = v13;
      *(_QWORD *)(v9 + 24) = v1;
      aBlock[4] = sub_1D0158318;
      aBlock[5] = v9;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1D01576E8;
      aBlock[3] = &block_descriptor_0;
      v10 = _Block_copy(aBlock);
      v11 = v13;
      v12 = v1;
      swift_release();
      objc_msgSend(v8, sel_animateWithDuration_animations_, v10, 0.3);

      _Block_release(v10);
    }
  }
}

id sub_1D015760C(void *a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = (void *)sub_1D015F054();
  v5 = (void *)sub_1D015F024();
  objc_msgSend(a1, sel_setValue_forKeyPath_, v4, v5);

  v6 = (void *)sub_1D015F054();
  v7 = (void *)sub_1D015F024();
  objc_msgSend(a1, sel_setValue_forKeyPath_, v6, v7);

  return objc_msgSend(*(id *)(a2 + OBJC_IVAR___SBHIconResizeHandle_highlightView), sel_setAlpha_, 0.0);
}

uint64_t sub_1D01576E8(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

Swift::Bool __swiftcall SBHIconResizeHandle._shouldAnimateProperty(withKey:)(Swift::String_optional withKey)
{
  void *v1;
  void *object;
  uint64_t countAndFlagsBits;
  unsigned __int8 v4;
  char v5;
  BOOL v6;
  objc_super v8;

  object = withKey.value._object;
  if (!withKey.value._object)
    goto LABEL_12;
  countAndFlagsBits = withKey.value._countAndFlagsBits;
  if (withKey.value._countAndFlagsBits == 0xD000000000000027 && withKey.value._object == (void *)0x80000001D01AA090)
    return 1;
  v5 = sub_1D015F0D8();
  v6 = object == (void *)0x80000001D01AA060 && countAndFlagsBits == 0xD000000000000027;
  v4 = 1;
  if (!v6 && (v5 & 1) == 0 && (sub_1D015F0D8() & 1) == 0)
  {
    object = (void *)sub_1D015F024();
LABEL_12:
    v8.receiver = v1;
    v8.super_class = (Class)SBHIconResizeHandle;
    v4 = objc_msgSendSuper2(&v8, sel__shouldAnimatePropertyWithKey_, object);

  }
  return v4;
}

id SBHIconResizeHandle.touchesBegan(_:with:)(uint64_t a1, uint64_t a2)
{
  return sub_1D0157B2C(a1, a2, (SEL *)&selRef_touchesBegan_withEvent_, 1);
}

id SBHIconResizeHandle.touchesCancelled(_:with:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v4;
  id result;
  objc_super v6;

  sub_1D01562D8(0, &qword_1EFC0F5A0);
  sub_1D0158280();
  v4 = (void *)sub_1D015F060();
  v6.receiver = v2;
  v6.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v6, sel_touchesCancelled_withEvent_, v4, a2);

  result = objc_msgSend(v2, sel_isResizing);
  if ((result & 1) == 0)
    return objc_msgSend(v2, sel_setHighlighted_, 0);
  return result;
}

id SBHIconResizeHandle.touchesEnded(_:with:)(uint64_t a1, uint64_t a2)
{
  return sub_1D0157B2C(a1, a2, (SEL *)&selRef_touchesEnded_withEvent_, 0);
}

id sub_1D0157B2C(uint64_t a1, uint64_t a2, SEL *a3, char a4)
{
  void *v4;
  void *v8;
  objc_super v10;

  sub_1D01562D8(0, &qword_1EFC0F5A0);
  sub_1D0158280();
  v8 = (void *)sub_1D015F060();
  v10.receiver = v4;
  v10.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v10, *a3, v8, a2);

  return objc_msgSend(v4, sel_setHighlighted_, a4 & 1);
}

uint64_t sub_1D0157BE8(void *a1, uint64_t a2, uint64_t a3, void *a4, SEL *a5, char a6)
{
  id v10;
  id v11;
  void *v12;
  objc_super v14;

  sub_1D01562D8(0, &qword_1EFC0F5A0);
  sub_1D0158280();
  sub_1D015F06C();
  v10 = a4;
  v11 = a1;
  v12 = (void *)sub_1D015F060();
  v14.receiver = v11;
  v14.super_class = (Class)SBHIconResizeHandle;
  objc_msgSendSuper2(&v14, *a5, v12, v10);

  objc_msgSend(v11, sel_setHighlighted_, a6 & 1);
  return swift_bridgeObjectRelease();
}

void __swiftcall SBHIconResizeHandle.init(frame:)(SBHIconResizeHandle *__return_ptr retstr, __C::CGRect frame)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithFrame_, frame.origin.x, frame.origin.y, frame.size.width, frame.size.height);
}

void SBHIconResizeHandle.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1D0157DEC(void *a1)
{
  char *v1;
  uint64_t v3;
  void *v4;
  id v5;

  v3 = OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer;
  if (*(_QWORD *)&v1[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer])
  {
    objc_msgSend(v1, sel_removeGestureRecognizer_);
    v4 = *(void **)&v1[v3];
  }
  else
  {
    v4 = 0;
  }
  *(_QWORD *)&v1[v3] = a1;
  v5 = a1;

  if (*(_QWORD *)&v1[v3])
    objc_msgSend(v1, sel_addGestureRecognizer_);
}

void sub_1D0157E6C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGMutablePathRef Mutable;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
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
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v8 = *(double *)a1;
  v40 = *(double *)a1 * 0.5;
  BSFloatCeilForScale();
  v11 = *(double *)(a1 + 16);
  v10 = *(double *)(a1 + 24);
  if (a2 == 1)
    v10 = -v10;
  v12 = v9 + v10;
  v38 = v9;
  v13 = v9 + *(double *)(a1 + 32);
  v14 = 0.0;
  if (BSFloatGreaterThanFloat())
    v15 = v11;
  else
    v15 = a4;
  v16 = *(double *)(a1 + 8);
  Mutable = CGPathCreateMutable();
  v39 = a4;
  if (BSFloatGreaterThanFloat() && BSFloatLessThanFloat())
    v14 = (1.57079633 - v16 / v15) * 0.5;
  if (a2 == 1)
  {
    v18 = v13 + a4 - v15;
    v19 = v14 + 1.57079633;
    v20 = 3.14159265 - v14;
    v41 = v18;
    v42 = v12 + v15;
    sub_1D015F090();
  }
  else
  {
    v21 = v12 + a4 - v15;
    v22 = v13 + a4 - v15;
    v20 = 1.57079633 - v14;
    v41 = v22;
    v42 = v21;
    sub_1D015F090();
    v19 = v14;
  }
  v23 = sub_1D015F0A8();
  v24 = *(double *)(a1 + 48);
  v25 = *(double *)(a1 + 56);
  v26 = *(double *)(a1 + 64);
  v27 = *(double *)(a1 + 72);
  if (*(_QWORD *)(a1 + 40))
  {

    v28 = v15 - v40 + v25;
    if (a2 == 1)
      v29 = -v24 / v15;
    else
      v29 = -v26 / v15;
    if (a2 == 1)
      v30 = -v26 / v15;
    else
      v30 = -v24 / v15;
    v31 = v19 - v30;
    v32 = v8 - v25 - v27;
    v33 = v29 + v20 - v19 + v30;
  }
  else
  {
    SBHDirectionalEdgeInsetsGetEdgeInsets();
    v35 = v34;
    v37 = v36;

    v28 = UIEdgeInsetsInsetRect(v38, v38, v39, v39, v35, v37);
  }
  *(_QWORD *)a3 = v23;
  *(double *)(a3 + 8) = v42;
  *(double *)(a3 + 16) = v41;
  *(double *)(a3 + 24) = v28;
  *(double *)(a3 + 32) = v31;
  *(double *)(a3 + 40) = v32;
  *(double *)(a3 + 48) = v33;
}

void _sSo19SBHIconResizeHandleC15SpringBoardHomeE5coderABSo7NSCoderC_tcfc_0()
{
  _BYTE *v0;
  _OWORD *v1;
  _QWORD *v2;

  v1 = &v0[OBJC_IVAR___SBHIconResizeHandle_hitArea];
  *v1 = 0u;
  v1[1] = 0u;
  v2 = &v0[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
  *v2 = 0;
  v2[1] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHIconResizeHandle_resizingGestureRecognizer] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle_isHighlighted] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle__isResizing] = 0;
  v0[OBJC_IVAR___SBHIconResizeHandle_isDarkStyle] = 0;
  *(_QWORD *)&v0[OBJC_IVAR___SBHIconResizeHandle_shapeLayer] = 0;

  sub_1D015F0C0();
  __break(1u);
}

BOOL _sSo19SBHIconResizeHandleC15SpringBoardHomeE5point6inside4withSbSo7CGPointV_So7UIEventCSgtF_0(CGFloat a1, long double a2)
{
  char *v2;
  CGFloat v5;
  long double v6;
  uint64_t v8;
  CGPoint v9;

  objc_msgSend(v2, sel_metrics);
  if (v8 == 1)
  {
    v5 = a1 - *(double *)&v2[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin];
    v6 = a2 - *(double *)&v2[OBJC_IVAR___SBHIconResizeHandle_shapePathOrigin + 8];
    a1 = sqrt(v5 * v5 + v6 * v6);
    a2 = atan(v6 / v5);
    if (BSFloatLessThanFloat())
    {
      a2 = a2 + 3.14159265;
    }
    else if (BSFloatLessThanFloat())
    {
      a2 = a2 + 6.28318531;
    }
  }
  v9.x = a1;
  v9.y = a2;
  return CGRectContainsPoint(*(CGRect *)&v2[OBJC_IVAR___SBHIconResizeHandle_hitArea], v9);
}

unint64_t sub_1D0158280()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFC0F5A8;
  if (!qword_1EFC0F5A8)
  {
    v1 = sub_1D01562D8(255, &qword_1EFC0F5A0);
    result = MEMORY[0x1D17DF928](MEMORY[0x1E0DEFCF8], v1);
    atomic_store(result, (unint64_t *)&qword_1EFC0F5A8);
  }
  return result;
}

uint64_t type metadata accessor for SBHIconResizeHandle(uint64_t a1)
{
  return sub_1D01562D8(a1, &qword_1EFC0F600);
}

uint64_t sub_1D01582EC()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1D0158318()
{
  uint64_t v0;

  return sub_1D015760C(*(void **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1D0158338()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_1D015835C()
{
  uint64_t v0;

  return sub_1D0156E70(*(char **)(v0 + 16), *(double *)(v0 + 24), *(double *)(v0 + 32), *(double *)(v0 + 40), *(double *)(v0 + 48));
}

uint64_t sub_1D015836C()
{
  return swift_deallocObject();
}

uint64_t sub_1D015837C()
{
  uint64_t v0;

  return swift_deallocObject();
}

double sub_1D01583A0(char *a1, uint64_t a2)
{
  uint64_t v2;
  double result;

  *(_QWORD *)&result = sub_1D0156F5C(a1, *(double *)(v2 + 16), a2, (void *)*(_QWORD *)(v2 + 24)).n128_u64[0];
  return result;
}

double UIEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

uint64_t sub_1D0158428(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  *(_QWORD *)(a1 + *a4) = a3;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

unint64_t sub_1D015866C@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  void *v2;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t result;

  v2 = v1;
  v4 = objc_msgSend(objc_allocWithZone((Class)SBHAddWidgetSheetConfiguration), sel_init);
  objc_msgSend(v4, sel_setListLayoutProvider_, objc_msgSend(v2, sel_listLayoutProvider));
  swift_unknownObjectRelease();
  objc_msgSend(v4, sel_setIconViewProvider_, objc_msgSend(v2, sel_iconViewProvider));
  swift_unknownObjectRelease();
  v5 = objc_msgSend(v2, sel_gridSizeClassDomain);
  objc_msgSend(v4, sel_setGridSizeClassDomain_, v5);

  v6 = objc_msgSend(v2, sel_gridSizeClassForContentWidth);
  objc_msgSend(v4, sel_setGridSizeClassForContentWidth_, v6);

  objc_msgSend(v4, sel_setStyle_, objc_msgSend(v2, sel_style));
  objc_msgSend(v4, sel_setBackgroundMaterial_, objc_msgSend(v2, sel_backgroundMaterial));
  v7 = objc_msgSend(v2, sel_searchPlaceholderText);
  objc_msgSend(v4, sel_setSearchPlaceholderText_, v7);

  v8 = objc_msgSend(v2, sel_searchTintColor);
  objc_msgSend(v4, sel_setSearchTintColor_, v8);

  objc_msgSend(v4, sel_setApplicationCellIncludesGalleryListView_, objc_msgSend(v2, sel_applicationCellIncludesGalleryListView));
  objc_msgSend(v4, sel_setContentContainsInteractiveUIControls_, objc_msgSend(v2, sel_contentContainsInteractiveUIControls));
  objc_msgSend(v4, sel_setWantsCustomApplicationsSection_, objc_msgSend(v2, sel_wantsCustomApplicationsSection));
  result = type metadata accessor for SBHAddWidgetSheetConfiguration();
  a1[3] = result;
  *a1 = v4;
  return result;
}

void __swiftcall SBHAddWidgetSheetConfiguration.init()(SBHAddWidgetSheetConfiguration *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SBHAddWidgetSheetConfiguration.init()()
{
  uint64_t v0;
  _QWORD *v1;
  objc_super v3;

  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_listLayoutProvider) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_iconViewProvider) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassDomain) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_gridSizeClassForContentWidth) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_style) = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_backgroundMaterial) = 2;
  v1 = (_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchPlaceholderText);
  *v1 = 0;
  v1[1] = 0;
  *(_QWORD *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_searchTintColor) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_applicationCellIncludesGalleryListView) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_contentContainsInteractiveUIControls) = 0;
  *(_BYTE *)(v0 + OBJC_IVAR___SBHAddWidgetSheetConfiguration_wantsCustomApplicationsSection) = 0;
  v3.super_class = (Class)SBHAddWidgetSheetConfiguration;
  return objc_msgSendSuper2(&v3, sel_init);
}

unint64_t type metadata accessor for SBHAddWidgetSheetConfiguration()
{
  unint64_t result;

  result = qword_1EFC0F678;
  if (!qword_1EFC0F678)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC0F678);
  }
  return result;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

BOOL SBIconCoordinate.isNotFound.getter(uint64_t a1, uint64_t a2)
{
  return SBIconCoordinateIsNotFound(a1, a2);
}

void SBIconLocationGroup.add(_:)(void *a1, void *a2)
{
  SBIconLocationGroupAddLocation(a2, a1);
}

uint64_t SBIconLocationGroup.contains(_:)(void *a1, void *a2)
{
  return SBIconLocationGroupContainsLocation(a2, a1);
}

__CFString *SBIconLocation.withWidgets(_:)(char a1, void *a2)
{
  return SBIconLocationSelectLocationWithWidgets(a2, a1 & 1);
}

double sub_1D0158B74()
{
  double result;

  result = *(double *)&SBIconCoordinateNotFound;
  xmmword_1EFC0F680 = SBIconCoordinateNotFound;
  return result;
}

uint64_t static SBIconCoordinate.notFound.getter()
{
  if (qword_1EFC0F3A0 != -1)
    swift_once();
  return xmmword_1EFC0F680;
}

uint64_t SBIconCoordinate.description.getter(uint64_t a1, uint64_t a2)
{
  id v2;
  uint64_t v3;

  v2 = (id)SBHStringForIconCoordinate(a1, a2);
  v3 = sub_1D015F030();

  return v3;
}

uint64_t sub_1D0158C1C()
{
  uint64_t *v0;
  id v1;
  uint64_t v2;

  v1 = (id)SBHStringForIconCoordinate(*v0, v0[1]);
  v2 = sub_1D015F030();

  return v2;
}

BOOL static SBIconImageInfo.== infix(_:_:)(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return SBIconImageInfoEqualToIconImageInfo(a1, a2, a3, a4, a5, a6, a7, a8);
}

BOOL sub_1D0158C7C(double *a1, double *a2)
{
  return SBIconImageInfoEqualToIconImageInfo(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

Swift::Bool __swiftcall SBIconImageInfo.hasEqualSizeAndScale(to:)(SBIconImageInfo to)
{
  double v1;
  double v2;
  double v3;
  double v4;

  return SBIconImageInfoSizeAndScaleEqualToIconImageInfo(v1, v2, v3, v4, to.size.width, to.size.height, to.scale);
}

uint64_t SBIconImageInfo.description.getter(double a1, double a2, double a3, double a4)
{
  id v4;
  uint64_t v5;

  v4 = (id)SBHStringForIconImageInfo(a1, a2, a3, a4);
  v5 = sub_1D015F030();

  return v5;
}

uint64_t sub_1D0158D2C()
{
  double *v0;
  id v1;
  uint64_t v2;

  v1 = (id)SBHStringForIconImageInfo(*v0, v0[1], v0[2], v0[3]);
  v2 = sub_1D015F030();

  return v2;
}

uint64_t static SBIconResizeHandleMetrics.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v2 = *(_QWORD *)(a2 + 32);
  v3 = *(_QWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v6;
  v17 = v4;
  v18 = v5;
  v7 = *(_OWORD *)(a1 + 64);
  v19 = *(_OWORD *)(a1 + 48);
  v20 = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v8;
  v12 = v2;
  v13 = v3;
  v9 = *(_OWORD *)(a2 + 64);
  v14 = *(_OWORD *)(a2 + 48);
  v15 = v9;
  return SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics((uint64_t)v16, (uint64_t)v11);
}

uint64_t sub_1D0158DE0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[2];
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a2 + 32);
  v5 = *(_QWORD *)(a2 + 40);
  v6 = *(_OWORD *)(a1 + 16);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v6;
  v17 = v2;
  v18 = v3;
  v7 = *(_OWORD *)(a1 + 64);
  v19 = *(_OWORD *)(a1 + 48);
  v20 = v7;
  v8 = *(_OWORD *)(a2 + 16);
  v11[0] = *(_OWORD *)a2;
  v11[1] = v8;
  v12 = v4;
  v13 = v5;
  v9 = *(_OWORD *)(a2 + 64);
  v14 = *(_OWORD *)(a2 + 48);
  v15 = v9;
  return SBIconResizeHandleMetricsEqualToIconResizeHandleMetrics((uint64_t)v16, (uint64_t)v11);
}

void SBHIconGridSizeClassGroup.add(_:)(void *a1, void *a2)
{
  SBHIconGridSizeClassGroupAddGridSizeClass(a2, a1);
}

uint64_t SBHIconGridSizeClassGroup.contains(_:)(void *a1, void *a2)
{
  return SBHIconGridSizeClassGroupContainsGridSizeClass(a2, a1);
}

BOOL static SBHIconGridSize.== infix(_:_:)(int a1, int a2)
{
  return SBHIconGridSizeEqualToIconGridSize(a1, a2);
}

BOOL sub_1D0158E90(int *a1, int *a2)
{
  return SBHIconGridSizeEqualToIconGridSize(*a1, *a2);
}

uint64_t SBHIconGridSize.area.getter(int a1)
{
  return SBHIconGridSizeGetArea(a1);
}

uint64_t SBHIconGridSize.smallestDimension.getter(unsigned int a1)
{
  return SBHIconGridSizeGetSmallestDimension(a1);
}

uint64_t SBHIconGridSize.largestDimension.getter(unsigned int a1)
{
  return SBHIconGridSizeGetLargestDimension(a1);
}

BOOL SBHIconGridSize.isPortrait.getter(int a1)
{
  return SBHIconGridSizeIsPortrait(a1);
}

BOOL SBHIconGridSize.isLandscape.getter(int a1)
{
  return SBHIconGridSizeIsLandscape(a1);
}

SBHIconGridSize __swiftcall SBHIconGridSize.rotated()()
{
  int v0;

  return (SBHIconGridSize)SBHIconGridSizeRotate(v0);
}

BOOL SBHIconGridSize.isDefault.getter(int a1)
{
  return SBHIconGridSizeIsDefault(a1);
}

BOOL SBHIconGridSize.isEmpty.getter(int a1)
{
  return SBHIconGridSizeIsEmpty(a1);
}

Swift::Bool __swiftcall SBHIconGridSize.contains(cellIndex:)(Swift::UInt cellIndex)
{
  int v1;

  return SBHIconGridSizeContainsCellIndex(v1, cellIndex);
}

Swift::UInt __swiftcall SBHIconGridSize.gridCellIndex(for:)(__C::SBIconCoordinate a1)
{
  unsigned __int16 v1;

  return SBIconCoordinateGetGridCellIndex(a1.column, a1.row, v1);
}

__C::SBIconCoordinate __swiftcall SBHIconGridSize.coordinate(for:)(Swift::UInt a1)
{
  unsigned __int16 v1;
  Swift::Int v2;
  Swift::Int v3;
  __C::SBIconCoordinate result;

  v2 = SBIconCoordinateMakeWithGridCellIndex(a1, v1);
  result.row = v3;
  result.column = v2;
  return result;
}

void sub_1D0158F7C()
{
  dword_1EFC0F690 = 65537;
}

uint64_t static SBHIconGridSize.default.getter()
{
  return sub_1D0158FEC(&qword_1EFC0F3A8, (unsigned int *)&dword_1EFC0F690);
}

void sub_1D0158FB4()
{
  dword_1EFC0F694 = 0;
}

uint64_t static SBHIconGridSize.empty.getter()
{
  return sub_1D0158FEC(&qword_1EFC0F3B0, (unsigned int *)&dword_1EFC0F694);
}

uint64_t sub_1D0158FEC(_QWORD *a1, unsigned int *a2)
{
  if (*a1 != -1)
    swift_once();
  return *a2;
}

uint64_t SBHIconGridSize.description.getter(int a1)
{
  id v1;
  uint64_t v2;

  v1 = (id)SBHStringForIconGridSize(a1);
  v2 = sub_1D015F030();

  return v2;
}

uint64_t sub_1D0159070()
{
  int *v0;
  id v1;
  uint64_t v2;

  v1 = (id)SBHStringForIconGridSize(*v0);
  v2 = sub_1D015F030();

  return v2;
}

id sub_1D01590BC()
{
  uint64_t v0;
  id result;

  v0 = sub_1D015F000();
  __swift_allocate_value_buffer(v0, qword_1EFC0FEC0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EFC0FEC0);
  result = SBLogAddWidgetSheet();
  if (result)
    return (id)sub_1D015F00C();
  __break(1u);
  return result;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t SBHPageManagementIcon.canReceiveGrabbedIcon.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeReceivedByIcon.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeAddedToSubfolder.getter()
{
  return 0;
}

uint64_t SBHPageManagementIcon.canBeAddedToMultiItemDrag.getter()
{
  return 0;
}

void __swiftcall SBHPageManagementIcon.init(leafIdentifier:applicationBundleID:)(SBHPageManagementIcon *__return_ptr retstr, Swift::String leafIdentifier, Swift::String_optional applicationBundleID)
{
  void *object;
  void *v4;
  void *v5;

  object = applicationBundleID.value._object;
  v4 = (void *)sub_1D015F024();
  swift_bridgeObjectRelease();
  if (object)
  {
    v5 = (void *)sub_1D015F024();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithLeafIdentifier_applicationBundleID_, v4, v5);

}

void SBHPageManagementIcon.init(leafIdentifier:applicationBundleID:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for SBHPageManagementIcon()
{
  unint64_t result;

  result = qword_1EFC0F6A0;
  if (!qword_1EFC0F6A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EFC0F6A0);
  }
  return result;
}

uint64_t sub_1D01593EC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getAPUISuggestionsWidgetViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1(v0);
}

void __getCCUICustomContentModuleBackgroundViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;

  v0 = abort_report_np();
  __77__SBHIconViewContextMenuStateController_dismissAppIconForceTouchControllers___block_invoke_2_cold_1(v0, v1);
}

uint64_t __getDMFApplicationPolicyMonitorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBHAddWidgetSheetViewController _presentDetailSheetViewControllerForApplicationWidgetCollection:configuredWithGalleryItem:selectedSizeClass:fromCell:atIndexPath:].cold.1(v0);
}

uint64_t __getSPUIDefaultsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBHIconLayoutHidingCompoundAssertion dealloc].cold.1(v0);
}

uint64_t __getAPUIAppPredictionViewControllerClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return __41__SBHBookmark__cleanupAppClipIfNecessary__block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getCPSWebClipStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getIXAppInstallCoordinatorClass_block_invoke_cold_1(v0);
}

uint64_t __getIXAppInstallCoordinatorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBHWidgetInsertionRippleIconAnimator animateWithCompletion:].cold.1(v0);
}

uint64_t __getCCUICAPackageDescriptionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getCCUILabeledRoundButtonViewControllerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[SBSApplicationShortcutItem(SBHAdditions) sb_buildIconImageWithApplicationBundleURL:image:systemImageName:].cold.1(v0);
}

uint64_t __getCNMonogrammerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNContactStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getCNContactStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCNMutableContactClass_block_invoke_cold_1(v0);
}

uint64_t __getCNMutableContactClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBHIconLayoutHidingAssertion dealloc].cold.1(v0);
}

uint64_t __getPUIMutableStylePickerConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPUIStylePickerComponentsClass_block_invoke_cold_1(v0);
}

uint64_t __getPUIStylePickerComponentsClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1();
}

uint64_t __getPUIStylePickerHomeScreenConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getPUIMutableStylePickerHomeScreenConfigurationClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getPUIStylePickerViewControllerClass_block_invoke_cold_1();
}

uint64_t __getPUIStylePickerViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPUIGradientViewClass_block_invoke_cold_1(v0);
}

void __getPUIGradientViewClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  -[SBIconListModel insertIcons:atIndex:options:].cold.1(v0);
}

uint64_t __getIXUninstallOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SBLeafIcon _noteActiveDataSourceDidGenerateImageNotification:].cold.1(v0);
}

uint64_t SBHIconLocationIsAppPrediction_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  dlerror();
  v0 = abort_report_np();
  return __64__SBIconView_activateShortcut_withBundleIdentifier_forIconView___block_invoke_3_cold_1(v0, v1, v2);
}

void SBHIconDragItemWithIconAndIconView_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Skipping setTeamData on the provider. Drag info data is nil with error:%@ for dragInfo:%@.", (uint8_t *)&v3, 0x16u);
}

void SBHIconDragItemWithIconAndIconView_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Skipping setTeamData on the provider. Drag info data is too large for dragInfo:%@.", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_1D015EFC4()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1D015EFD0()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1D015EFDC()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1D015EFE8()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1D015EFF4()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1D015F000()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1D015F00C()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_1D015F018()
{
  return MEMORY[0x1E0DC1F58]();
}

uint64_t sub_1D015F024()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1D015F030()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1D015F03C()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1D015F048()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1D015F054()
{
  return MEMORY[0x1E0CB1B50]();
}

uint64_t sub_1D015F060()
{
  return MEMORY[0x1E0CB1BB0]();
}

uint64_t sub_1D015F06C()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1D015F078()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1D015F084()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1D015F090()
{
  return MEMORY[0x1E0C9B970]();
}

uint64_t sub_1D015F09C()
{
  return MEMORY[0x1E0DC2FC0]();
}

uint64_t sub_1D015F0A8()
{
  return MEMORY[0x1E0C9BA48]();
}

uint64_t sub_1D015F0B4()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1D015F0C0()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1D015F0CC()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1D015F0D8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t BSCompareFloats()
{
  return MEMORY[0x1E0D01130]();
}

uint64_t BSCompareIntegers()
{
  return MEMORY[0x1E0D01138]();
}

uint64_t BSDegreesToRadians()
{
  return MEMORY[0x1E0D01190]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssert()
{
  return MEMORY[0x1E0D01210]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueAssertNotMain()
{
  return MEMORY[0x1E0D01230]();
}

uint64_t BSDispatchQueueCreate()
{
  return MEMORY[0x1E0D01238]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchQueueCreateSerialWithQoS()
{
  return MEMORY[0x1E0D01248]();
}

uint64_t BSDispatchQueueCreateWithQualityOfService()
{
  return MEMORY[0x1E0D01250]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1E0D01260]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x1E0D01270]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualSets()
{
  return MEMORY[0x1E0D01288]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatApproximatelyEqualToFloat()
{
  return MEMORY[0x1E0D012B8]();
}

uint64_t BSFloatCeilForScale()
{
  return MEMORY[0x1E0D012C8]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatFloorForScale()
{
  return MEMORY[0x1E0D012D8]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSIntervalFractionForValue()
{
  return MEMORY[0x1E0D01378]();
}

uint64_t BSIntervalMax()
{
  return MEMORY[0x1E0D01390]();
}

uint64_t BSIntervalValueForFraction()
{
  return MEMORY[0x1E0D013B8]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSRectCenteredAboutPoint()
{
  return MEMORY[0x1E0D014D8]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x1E0D014E0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSizeCeilForScale()
{
  return MEMORY[0x1E0D015B8]();
}

uint64_t BSSizeEqualToSize()
{
  return MEMORY[0x1E0D015C0]();
}

uint64_t BSSizeGreaterThanOrEqualToSize()
{
  return MEMORY[0x1E0D015C8]();
}

uint64_t BSSizeRoundForScale()
{
  return MEMORY[0x1E0D015D8]();
}

uint64_t BSStringFromBOOL()
{
  return MEMORY[0x1E0D015F8]();
}

uint64_t BSTimeDifferenceFromMachTimeToMachTime()
{
  return MEMORY[0x1E0D01640]();
}

uint64_t BSUIConstrainValueToIntervalWithRubberBand()
{
  return MEMORY[0x1E0D018E0]();
}

uint64_t BSUIConstrainValueWithRubberBand()
{
  return MEMORY[0x1E0D018E8]();
}

uint64_t CAColorMatrixConcat()
{
  return MEMORY[0x1E0CD2330]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x1E0CD2348]();
}

uint64_t CAColorMatrixMakeContrast()
{
  return MEMORY[0x1E0CD2350]();
}

uint64_t CAColorMatrixMakeMultiplyColor()
{
  return MEMORY[0x1E0CD2358]();
}

uint64_t CAColorMatrixMakeSaturation()
{
  return MEMORY[0x1E0CD2370]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x1E0CD25F0](retstr, a, b);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return MEMORY[0x1E0CD2628](t);
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

uint64_t CFMergeSortArray()
{
  return MEMORY[0x1E0C98860]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopObserverInvalidate(CFRunLoopObserverRef observer)
{
  MEMORY[0x1E0C98C78](observer);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGBitmapContextGetColorSpace(CGContextRef context)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BB68](context);
}

CGColorRef CGColorCreateGenericGray(CGFloat gray, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCA0](gray, alpha);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

uint64_t CGColorSpaceGetType()
{
  return MEMORY[0x1E0C9BEF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

uint64_t CGContextClear()
{
  return MEMORY[0x1E0C9C018]();
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C020](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextSetAlpha(CGContextRef c, CGFloat alpha)
{
  MEMORY[0x1E0C9C3B8](c, alpha);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x1E0C9D310](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
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

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

uint64_t CHSEdgeInsetsMake()
{
  return MEMORY[0x1E0D0FEB8]();
}

uint64_t CHSWidgetFamilyIsAccessory()
{
  return MEMORY[0x1E0D0FF30]();
}

uint64_t CHSWidgetFamilyMaskContainsFamily()
{
  return MEMORY[0x1E0D0FF40]();
}

uint64_t CHSWidgetFamilyMaskDescription()
{
  return MEMORY[0x1E0D0FF48]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

uint64_t DOCShouldApplicationShowRecentsPopover()
{
  return MEMORY[0x1E0D1D888]();
}

uint64_t FBSInstallTypeIsCloudDemoted()
{
  return MEMORY[0x1E0D22CB0]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGIsDeviceOfType()
{
  return MEMORY[0x1E0DE2B88]();
}

uint64_t MTCGColorPerceivedLightness()
{
  return MEMORY[0x1E0D16B58]();
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle()
{
  return MEMORY[0x1E0D47468]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x1E0DC32D8](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

uint64_t NSStringFromCHUISWidgetColorScheme()
{
  return MEMORY[0x1E0D102D0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromDirectionalEdgeInsets(NSDirectionalEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC32F8](*(__n128 *)&insets.top, *(__n128 *)&insets.leading, *(__n128 *)&insets.bottom, *(__n128 *)&insets.trailing);
}

uint64_t NSStringFromFBSApplicationPlaceholderProgressState()
{
  return MEMORY[0x1E0D22F30]();
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x1E0DC3300](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *__cdecl NSStringFromUIOffset(UIOffset offset)
{
  return (NSString *)MEMORY[0x1E0DC3308]((__n128)offset, *(__n128 *)&offset.vertical);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF90]();
}

uint64_t SBFApplyParallaxSettingsToView()
{
  return MEMORY[0x1E0DAA000]();
}

uint64_t SBFApplyParallaxSettingsToViewWithFactor()
{
  return MEMORY[0x1E0DAA008]();
}

uint64_t SBFBoolEquals()
{
  return MEMORY[0x1E0DAA028]();
}

uint64_t SBFComposedColor()
{
  return MEMORY[0x1E0DAA038]();
}

uint64_t SBFEdgeInsetsRelativeToRectEdge()
{
  return MEMORY[0x1E0DAA058]();
}

uint64_t SBFEffectiveArtworkSubtype()
{
  return MEMORY[0x1E0DAA068]();
}

uint64_t SBFEffectiveDeviceClass()
{
  return MEMORY[0x1E0DAA070]();
}

uint64_t SBFEffectiveDisplayCornerRadius()
{
  return MEMORY[0x1E0DAA078]();
}

uint64_t SBFEffectiveHomeButtonType()
{
  return MEMORY[0x1E0DAA080]();
}

uint64_t SBFEqualStrings()
{
  return MEMORY[0x1E0DAA090]();
}

uint64_t SBFFloatCeilForScale()
{
  return MEMORY[0x1E0DAA0A0]();
}

uint64_t SBFFloatEqualsFloat()
{
  return MEMORY[0x1E0DAA0A8]();
}

uint64_t SBFFloatFloorForScale()
{
  return MEMORY[0x1E0DAA0B0]();
}

uint64_t SBFFloatRoundForScale()
{
  return MEMORY[0x1E0DAA0B8]();
}

uint64_t SBFInterfaceOrientationMaskContainsInterfaceOrientation()
{
  return MEMORY[0x1E0DAA0D8]();
}

uint64_t SBFIsChamoisExternalDisplayControllerAvailable()
{
  return MEMORY[0x1E0DAA0E8]();
}

uint64_t SBFPointEqualToPointAtScale()
{
  return MEMORY[0x1E0DAA190]();
}

uint64_t SBFPreheatImageData()
{
  return MEMORY[0x1E0DAA198]();
}

uint64_t SBFRectRoundForScale()
{
  return MEMORY[0x1E0DAA1A8]();
}

uint64_t SBFSafeCast()
{
  return MEMORY[0x1E0DAA1B8]();
}

uint64_t SBFWindowForViewControllerTransition()
{
  return MEMORY[0x1E0DAA258]();
}

uint64_t SBLogFocusModes()
{
  return MEMORY[0x1E0DAB3C0]();
}

uint64_t SBLogIconDragging()
{
  return MEMORY[0x1E0DAB3E8]();
}

uint64_t SBLogReusableViewCache()
{
  return MEMORY[0x1E0DAA290]();
}

uint64_t SBLogRootController()
{
  return MEMORY[0x1E0DAB490]();
}

uint64_t SBLogSpotlight()
{
  return MEMORY[0x1E0DAB4A8]();
}

uint64_t SBRectWithSize()
{
  return MEMORY[0x1E0DAC798]();
}

uint64_t SBSCreateOpenApplicationService()
{
  return MEMORY[0x1E0DAB620]();
}

uint64_t SBStringFromAnimationUpdateMode()
{
  return MEMORY[0x1E0DAA2A0]();
}

uint64_t SBUILegibilityImageSizeForContentSizeAndStyle()
{
  return MEMORY[0x1E0DAC8D0]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0DC4548]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0DC4880]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

uint64_t UIContentSizeCategoryClip()
{
  return MEMORY[0x1E0DACA00]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0DC48E0](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

uint64_t UIEdgeInsetsFromApplicationSupportDisplayEdgeInsetsWrapper()
{
  return MEMORY[0x1E0DC49A8]();
}

uint64_t UIEdgeInsetsMakeWithEdges()
{
  return MEMORY[0x1E0DC49B8]();
}

uint64_t UIEdgeInsetsMax()
{
  return MEMORY[0x1E0DC49C0]();
}

uint64_t UIEdgeInsetsMin()
{
  return MEMORY[0x1E0DC49C8]();
}

uint64_t UIEdgeInsetsSubtract()
{
  return MEMORY[0x1E0DC49E0]();
}

uint64_t UIFloorToScale()
{
  return MEMORY[0x1E0DC4A08]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0DC4A10]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIPointRoundToScale()
{
  return MEMORY[0x1E0DC5200]();
}

uint64_t UIPointRoundToViewScale()
{
  return MEMORY[0x1E0DC5208]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0DC5238]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0DC5248]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredRect()
{
  return MEMORY[0x1E0DC5258]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0DC5260]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

uint64_t UIRectContainInRect()
{
  return MEMORY[0x1E0DC5288]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0DC52A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectInsetEdges()
{
  return MEMORY[0x1E0DC52C0]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0DC5398]();
}

uint64_t UISizeRoundToViewScale()
{
  return MEMORY[0x1E0DC53A0]();
}

uint64_t WFWidgetGetDefaultColors()
{
  return MEMORY[0x1E0DDA128]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _SBFLoggingMethodProem()
{
  return MEMORY[0x1E0DAA2B8]();
}

uint64_t _UIScrollViewNotifyForScrollView()
{
  return MEMORY[0x1E0DC59B8]();
}

uint64_t _UISheetMinimumTopInset()
{
  return MEMORY[0x1E0DC59D8]();
}

uint64_t _UIUpdateCycleRegisterIdleObserver()
{
  return MEMORY[0x1E0DC5A58]();
}

uint64_t _UIUpdateCycleUnregisterIdleObserver()
{
  return MEMORY[0x1E0DC5A60]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t __MDQueryCreateStringByAddingBackslashEscapes()
{
  return MEMORY[0x1E0D4DD00]();
}

uint64_t __sb__mainScreenReferenceBounds()
{
  return MEMORY[0x1E0DABCE0]();
}

uint64_t __sb__mainScreenScale()
{
  return MEMORY[0x1E0DABCE8]();
}

uint64_t __sb__runningInSpringBoard()
{
  return MEMORY[0x1E0DABCF0]();
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

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

float atanf(float a1)
{
  float result;

  MEMORY[0x1E0C81630](a1);
  return result;
}

int bcmp(const void *a1, const void *a2, size_t a3)
{
  return MEMORY[0x1E0C816E8](a1, a2, a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t convertDampingRatioAndResponseToTensionAndFriction()
{
  return MEMORY[0x1E0DAA348]();
}

uint64_t ct_green_tea_logging_enabled()
{
  return MEMORY[0x1E0DDFEA0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FD8](label);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
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

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
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

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

long double nexttoward(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C843B8](__x, __y);
  return result;
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
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

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

