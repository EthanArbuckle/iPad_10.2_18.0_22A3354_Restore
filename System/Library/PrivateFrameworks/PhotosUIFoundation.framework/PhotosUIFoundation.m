double PXRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 + a3 * -0.5;
}

double PXSizeScale(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PXSizeSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

uint64_t PXFloatCompare(double a1, double a2)
{
  if (a1 < a2)
    return -1;
  else
    return a1 > a2;
}

double PXSizeAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double PXEdgeInsetsInsetRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 + a6;
}

double PXRectGetCenter(double a1, double a2, double a3)
{
  return a1 + a3 * 0.5;
}

BOOL PXFloatApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.00000999999975;
}

double PXEdgeInsetsInsetSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return a1 - (a4 + a6);
}

double PXDistanceBetweenPoints(double a1, double a2, double a3, double a4)
{
  return hypot(a3 - a1, a4 - a2);
}

double PXPointSubtract(double a1, double a2, double a3)
{
  return a1 - a3;
}

BOOL PXEdgeInsetsEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a2 == a6 && a1 == a5 && a4 == a8 && a3 == a7;
}

BOOL PXFloatGreaterThanFloat(double a1, double a2)
{
  return a1 - a2 > 0.00000011920929;
}

double PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits(uint64_t a1, unint64_t a2, uint64_t a3, double a4)
{
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  _QWORD v16[7];
  int v17;

  if (PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_onceToken != -1)
    dispatch_once(&PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_onceToken, &__block_literal_global_4908);
  UserPreferredContentSizeCategory();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryFromPXPreferredContentSizeCategory(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != (void *)*MEMORY[0x24BEBE0D8]
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v8, (UIContentSizeCategory)v9) == NSOrderedDescending)
  {
    v10 = v9;

    v8 = v10;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("PXFontScaledValue-%@-%.3f-%ld-%d"), v8, *(_QWORD *)&a4, a1, a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_block_invoke_2;
  v16[3] = &__block_descriptor_60_e15___NSNumber_8__0l;
  v17 = a3;
  v16[4] = a1;
  v16[5] = a2;
  *(double *)&v16[6] = a4;
  objc_msgSend((id)PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits_cache, "px_objectForKey:usingPromise:", v11, v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v13;

  return v14;
}

id _PXFontWithTextStyleSymbolicTraits(uint64_t a1, uint64_t a2, unint64_t a3)
{
  void *v5;
  NSString *v6;
  NSString *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;

  UIFontTextStyleFromPXFontTextStyle(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryFromPXPreferredContentSizeCategory(a3);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  UserPreferredContentSizeCategory();
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == (NSString *)*MEMORY[0x24BEBE0D8] || UIContentSizeCategoryCompareToCategory(v7, v6) != NSOrderedDescending)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", v5, a2, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = (void *)MEMORY[0x24BEBB528];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "preferredFontDescriptorWithTextStyle:compatibleWithTraitCollection:", v5, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)a2)
    {
      objc_msgSend(v11, "fontDescriptorWithSymbolicTraits:", objc_msgSend(v11, "symbolicTraits") | a2);
      v12 = objc_claimAutoreleasedReturnValue();

      v11 = (void *)v12;
    }
  }
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v11, 0.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id UserPreferredContentSizeCategory()
{
  void *v0;
  void *v1;
  void *v2;

  if (*MEMORY[0x24BEBDF78])
  {
    objc_msgSend((id)*MEMORY[0x24BEBDF78], "preferredContentSizeCategory");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "traitCollection");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "preferredContentSizeCategory");
    v0 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v0;
}

id UIContentSizeCategoryFromPXPreferredContentSizeCategory(unint64_t a1)
{
  if (a1 > 0xC)
    return 0;
  else
    return **((id **)&unk_2514D02C0 + a1);
}

__CFString *_PXFontTextStyleString(uint64_t a1)
{
  __CFString *result;
  id *v2;

  switch(a1)
  {
    case 0:
      return CFSTR("Undefined");
    case 1:
      v2 = (id *)MEMORY[0x24BEBE210];
      goto LABEL_16;
    case 2:
      v2 = (id *)MEMORY[0x24BEBE240];
      goto LABEL_16;
    case 3:
      v2 = (id *)MEMORY[0x24BEBE248];
      goto LABEL_16;
    case 4:
      v2 = (id *)MEMORY[0x24BEBE250];
      goto LABEL_16;
    case 5:
      v2 = (id *)MEMORY[0x24BEBE200];
      goto LABEL_16;
    case 6:
      v2 = (id *)MEMORY[0x24BEBE218];
      goto LABEL_16;
    case 7:
      v2 = (id *)MEMORY[0x24BEBE220];
      goto LABEL_16;
    case 8:
      v2 = (id *)MEMORY[0x24BEBE1D0];
      goto LABEL_16;
    case 9:
      v2 = (id *)MEMORY[0x24BEBE1D8];
      goto LABEL_16;
    case 10:
      v2 = (id *)MEMORY[0x24BEBE1F0];
      goto LABEL_16;
    case 11:
      v2 = (id *)MEMORY[0x24BEBE1E0];
      goto LABEL_16;
    case 12:
      v2 = (id *)MEMORY[0x24BEBE1E8];
LABEL_16:
      result = (__CFString *)*v2;
      break;
    default:
      result = (__CFString *)0;
      break;
  }
  return result;
}

__CFString *UIFontTextStyleFromPXFontTextStyle(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;

  if (a1)
    return _PXFontTextStyleString(a1);
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIFontTextStyle  _Nonnull UIFontTextStyleFromPXFontTextStyle(PXFontTextStyle)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXFont.m"), 163, CFSTR("Invalid text style"));

  v4 = CFSTR("Undefined");
  return CFSTR("Undefined");
}

void sub_244312FE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

BOOL PXSizeIsNull(double a1, double a2)
{
  return a2 == INFINITY && a1 == INFINITY;
}

double PXEdgeInsetsInvert(double a1)
{
  return -a1;
}

BOOL PXAssetBadgeInfoIsNull(uint64_t a1)
{
  _BOOL8 result;

  result = 0;
  if (!*(_QWORD *)a1 && *(double *)(a1 + 8) == 0.0 && *(_QWORD *)(a1 + 16) == 0)
    return *(_QWORD *)(a1 + 24) == 0;
  return result;
}

double PXSizeCeilingToPixel(double a1, double a2, double a3)
{
  return ceil(a1 * a3) / a3;
}

uint64_t PXSizeIsEmpty(double a1, double a2)
{
  _BOOL4 v2;

  v2 = a1 == INFINITY;
  if (a2 != INFINITY)
    v2 = 0;
  if (a2 == 0.0)
    v2 = 1;
  return a1 == 0.0 || v2;
}

double PXPointAdd(double a1, double a2, double a3)
{
  return a1 + a3;
}

double PXClamp(double result, double a2, double a3)
{
  if (a2 >= a3)
    a2 = a3;
  if (a2 > result)
    return a2;
  return result;
}

BOOL PXPointIsNull(double a1, double a2)
{
  return a2 == INFINITY && a1 == INFINITY;
}

double PXMatrixMakeTranslation()
{
  return *(double *)&_PromotedConst;
}

void _PXRunLoopObserverTrampoline(__CFRunLoopObserver *a1, int a2, void *aBlock)
{
  __CFRunLoop *Current;
  void (**v6)(void);

  v6 = (void (**)(void))_Block_copy(aBlock);
  v6[2]();
  CFRelease(aBlock);
  Current = CFRunLoopGetCurrent();
  CFRunLoopRemoveObserver(Current, a1, (CFRunLoopMode)*MEMORY[0x24BDBD598]);

}

float PXFrameRateRangeTypeGetCAFrameRateRange(uint64_t a1)
{
  float result;
  int v2;
  float v3;
  float v4;

  switch(a1)
  {
    case 1:
      v2 = 1111490560;
      goto LABEL_5;
    case 2:
      v2 = 1114636288;
LABEL_5:
      v3 = *(float *)&v2;
      v4 = 0.0;
      goto LABEL_7;
    case 3:
      v3 = 80.0;
      v4 = 120.0;
LABEL_7:
      LODWORD(result) = CAFrameRateRangeMake(v3, 120.0, v4);
      break;
    default:
      result = *MEMORY[0x24BDE5430];
      break;
  }
  return result;
}

double PXSizeMin(double result, double a2, double a3)
{
  if (result >= a3)
    return a3;
  return result;
}

BOOL PXRectApproximatelyEqualToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a1, a5) <= 0.00000999999975
      && vabdd_f64(a2, a6) <= 0.00000999999975
      && vabdd_f64(a3, a7) <= 0.00000999999975
      && vabdd_f64(a4, a8) <= 0.00000999999975;
}

double PXEdgeInsetsAdd(char a1, double a2, double a3, double a4, double a5, double a6)
{
  double result;

  result = a2 + a6;
  if ((a1 & 1) == 0)
    return 0.0;
  return result;
}

double PXCGImageGetSizeWithOrientation(CGImage *a1, int a2)
{
  size_t Width;
  size_t Height;

  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  if ((a2 - 5) >= 4)
    return (double)Width;
  else
    return (double)Height;
}

BOOL PXPointApproximatelyEqualToPoint(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) <= 0.00000999999975;
  return vabdd_f64(a2, a4) <= 0.00000999999975 && v4;
}

id PXDiffArraysWithObjectComparator(void *a1, void *a2, void *a3, uint64_t a4, id *a5, id *a6, id *a7, CFTypeRef *a8, id *a9)
{
  size_t v12;
  size_t v13;
  char *v14;
  char *v15;
  id *v16;
  _QWORD *v17;
  size_t v18;
  size_t v19;
  size_t v20;
  size_t v21;
  int v22;
  size_t v23;
  id *v24;
  char *v25;
  void *v26;
  size_t v27;
  id *v28;
  char *v29;
  void *v30;
  void *v31;
  uint64_t i;
  id *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id *v44;
  id v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char *v51;
  void *v52;
  uint64_t v53;
  char *v54;
  char *v55;
  uint64_t v56;
  id *v57;
  CFIndex v58;
  CFMutableArrayRef v59;
  CFArrayRef *v60;
  id v61;
  CFIndex Count;
  id v63;
  size_t v64;
  unint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  size_t v69;
  uint64_t v70;
  void *v71;
  uint64_t v72;
  uint64_t v73;
  id *v74;
  id v75;
  id v76;
  id v77;
  id v78;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id *v84;
  id v85;
  id *v86;
  id *v87;
  CFTypeRef *v88;
  id *v89;
  id v90;
  id *v91;
  id *v92;
  size_t v93;
  _QWORD v94[9];
  _QWORD __compar[5];
  CFArrayCallBacks callBacks;
  uint64_t v97;

  v82 = a3;
  v97 = *MEMORY[0x24BDAC8D0];
  v86 = a5;
  *a5 = 0;
  v89 = a6;
  *a6 = 0;
  v87 = a7;
  *a7 = 0;
  v88 = a8;
  *a8 = 0;
  v84 = a9;
  *a9 = 0;
  v83 = (void *)MEMORY[0x24950CD7C]();
  v12 = objc_msgSend(a2, "count");
  v13 = objc_msgSend(a1, "count");
  v14 = (char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * (v13 + v12)), "mutableBytes");
  v15 = &v14[8 * v13];
  v90 = a1;
  objc_msgSend(a1, "getObjects:range:", v14, 0, v13);
  v85 = a2;
  objc_msgSend(a2, "getObjects:range:", v15, 0, v12);
  v16 = (id *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithLength:", 8 * (v13 + v12)), "mutableBytes");
  v92 = &v16[v13];
  v91 = v16;
  if (a4)
  {
    __compar[0] = MEMORY[0x24BDAC760];
    __compar[1] = 3221225472;
    __compar[2] = __PXDiffArraysWithObjectComparator_block_invoke;
    __compar[3] = &unk_2514CFDC8;
    __compar[4] = a4;
    v17 = __compar;
  }
  else
  {
    v17 = &__block_literal_global_3685;
  }
  qsort_b(v14, v13, 8uLL, v17);
  qsort_b(v15, v12, 8uLL, v17);
  v18 = 0;
  v93 = v12;
  v19 = 0;
  v20 = 0;
  v21 = 0;
  if (v13 && v12)
  {
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    do
    {
      v22 = ((uint64_t (*)(_QWORD *, char *, char *))v17[2])(v17, &v14[8 * v19], &v15[8 * v18]);
      if (v22 < 0)
      {
        v91[v21++] = *(id *)&v14[8 * v19++];
      }
      else
      {
        if (v22)
          v92[v20++] = *(id *)&v15[8 * v18];
        else
          ++v19;
        ++v18;
      }
      v12 = v93;
    }
    while (v19 < v13 && v18 < v93);
  }
  v23 = v13 - v19;
  if (v13 > v19)
  {
    v24 = &v91[v21];
    v25 = &v14[8 * v19];
    do
    {
      v26 = *(void **)v25;
      v25 += 8;
      *v24++ = v26;
      --v23;
    }
    while (v23);
    v21 = v13 + v21 - v19;
  }
  v27 = v12 - v18;
  if (v12 > v18)
  {
    v28 = &v91[v13] + v20;
    v29 = &v14[8 * v13 + 8 * v18];
    do
    {
      v30 = *(void **)v29;
      v29 += 8;
      *v28++ = v30;
      --v27;
    }
    while (v27);
    v20 = v12 + v20 - v18;
  }
  if (v21)
  {
    objc_msgSend(v90, "getObjects:range:", v14, 0, v13);
    v31 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    if (v13)
    {
      for (i = 0; i != v13; ++i)
      {
        if (bsearch_b(v14, v91, v21, 8uLL, v17))
          objc_msgSend(v31, "addIndex:", i);
        v14 += 8;
      }
    }
    v33 = v86;
    *v86 = v31;
    v34 = v31;
    v35 = v90;
    v36 = (id)objc_msgSend(v90, "mutableCopy");
    objc_msgSend(v36, "removeObjectsAtIndexes:", *v33);
    v12 = v93;
  }
  else
  {
    v36 = 0;
    v35 = v90;
  }
  v37 = objc_msgSend(v85, "getObjects:range:", v15, 0, v12);
  if (v20)
  {
    v91 = &v82;
    MEMORY[0x24BDAC7A8](v37);
    v39 = (char *)&v82 - v38;
    if (v20 > 0x200)
      v39 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v82 - v38, 8 * v20);
    v40 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    if (v12)
    {
      v41 = 0;
      v42 = 0;
      v43 = 0;
      do
      {
        if (bsearch_b(&v15[v41], v92, v20, 8uLL, v17))
        {
          objc_msgSend(v40, "addIndex:", v42);
          *(_QWORD *)&v39[8 * v43++] = *(_QWORD *)&v15[8 * v42];
        }
        ++v42;
        v41 += 8;
      }
      while (v93 != v42);
    }
    else
    {
      v43 = 0;
    }
    v44 = v89;
    *v89 = v40;
    v45 = v40;
    v35 = v90;
    if (!v36)
      v36 = (id)objc_msgSend(v90, "mutableCopy");
    objc_msgSend(v36, "insertObjects:atIndexes:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, v43), *v44);
    if (v20 >= 0x201)
      NSZoneFree(0, v39);
  }
  if (v36)
  {
    v46 = objc_msgSend(v36, "count");
    if (v46 != objc_msgSend(v85, "count"))
    {
      v80 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      objc_msgSend(v80, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXDiffArraysWithObjectComparator(NSArray * _Nonnull, NSArray * _Nonnull, NSArray * _Nonnull, NSComparator _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, CFArrayRef  _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable)"), CFSTR("NSArrayAdditions.m"), 204, CFSTR("Mismatched value counts after additions and subtractions."));
    }
    v35 = v36;
  }
  v47 = objc_msgSend(v35, "count");
  v48 = MEMORY[0x24BDAC7A8](v47);
  v51 = (char *)&v82 - v50;
  if (v48 > 0x200)
    v51 = (char *)NSAllocateScannedUncollectable();
  else
    bzero((char *)&v82 - v50, 8 * v49);
  objc_msgSend(v35, "getObjects:range:", v51, 0, v47);
  v52 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  if (v47)
  {
    v53 = 0;
    v54 = v51;
    v55 = v15;
    do
    {
      if (((unsigned int (*)(_QWORD *, char *, char *))v17[2])(v17, v54, v55))
        objc_msgSend(v52, "addIndex:", v53);
      ++v53;
      v55 += 8;
      v54 += 8;
    }
    while (v47 != v53);
  }
  if (objc_msgSend(v52, "count"))
  {
    v56 = objc_msgSend(v52, "copy");
    v57 = v87;
    *v87 = (id)v56;
    v58 = objc_msgSend(v52, "count");
    *(_OWORD *)&callBacks.version = xmmword_2514CF3E0;
    *(_OWORD *)&callBacks.release = unk_2514CF3F0;
    callBacks.equal = 0;
    v59 = CFArrayCreateMutable(0, v58, &callBacks);
    v60 = (CFArrayRef *)v88;
    *v88 = v59;
    v61 = *v57;
    v94[0] = MEMORY[0x24BDAC760];
    v94[1] = 3221225472;
    v94[2] = __PXDiffArraysWithObjectComparator_block_invoke_3;
    v94[3] = &unk_2514CFE58;
    v94[4] = v52;
    v94[5] = v17;
    v94[6] = v15;
    v94[7] = v51;
    v94[8] = v59;
    objc_msgSend(v61, "enumerateIndexesUsingBlock:", v94);
    Count = CFArrayGetCount(*v60);
    if (Count != objc_msgSend(*v57, "count"))
    {
      v81 = (void *)objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      objc_msgSend(v81, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXDiffArraysWithObjectComparator(NSArray * _Nonnull, NSArray * _Nonnull, NSArray * _Nonnull, NSComparator _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable, CFArrayRef  _Nonnull * _Nullable, NSIndexSet * _Nonnull * _Nullable)"), CFSTR("NSArrayAdditions.m"), 252, CFSTR("Mismatched move counts."));
    }
  }
  if (v47 >= 0x201)
    NSZoneFree(0, v51);
  v63 = v82;
  if (objc_msgSend(v82, "count"))
  {
    v64 = objc_msgSend(v63, "count");
    v65 = MEMORY[0x24BDAC7A8](v64);
    v68 = (char *)&v82 - v67;
    if (v65 > 0x200)
      v68 = (char *)NSAllocateScannedUncollectable();
    else
      bzero((char *)&v82 - v67, 8 * v66);
    v69 = v93;
    objc_msgSend(v63, "getObjects:range:", v68, 0, v64);
    qsort_b(v68, v64, 8uLL, v17);
    v70 = objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
    if (v69)
    {
      v71 = (void *)v70;
      v72 = 0;
      v73 = 0;
      while (1)
      {
        if (bsearch_b(v15, v68, v64, 8uLL, v17))
        {
          objc_msgSend(v71, "addIndex:", v72);
          if (++v73 == v64)
            break;
        }
        ++v72;
        v15 += 8;
        if (v69 == v72)
        {
          if (!v73)
            goto LABEL_78;
          goto LABEL_75;
        }
      }
      if (!v64)
        goto LABEL_78;
LABEL_75:
      v74 = v89;
      if (objc_msgSend(*v89, "count"))
        objc_msgSend(v71, "removeIndexes:", *v74);
      v75 = v71;
      *v84 = v75;
    }
LABEL_78:
    if (v64 >= 0x201)
      NSZoneFree(0, v68);
  }
  objc_autoreleasePoolPop(v83);
  v76 = *v86;
  v77 = *v89;
  v78 = *v87;
  if (*v88)
    CFAutorelease(*v88);
  return *v84;
}

void sub_244316DC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_244318148(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_2443183B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_2443186C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244318784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443189D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244318E08(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_244318F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PXSizeGetAspectRatioWithDefault(double a1, double a2, double a3)
{
  if (a1 == 0.0 || a2 == 0.0)
    return a3;
  if (a1 == *MEMORY[0x24BE71BF0] && a2 == *(double *)(MEMORY[0x24BE71BF0] + 8))
    return a3;
  else
    return fabs(a1 / a2);
}

float PXMatrixMakeOrthoProjection(float a1, float a2)
{
  return (float)(1.0 / (float)(a2 - a1)) + (float)(1.0 / (float)(a2 - a1));
}

BOOL PXSizeApproximatelyEqualToSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) <= 0.00000999999975;
  return vabdd_f64(a2, a4) <= 0.00000999999975 && v4;
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSizeWithTolerance(double a1, double a2, double a3, double a4, double a5)
{
  double v5;
  BOOL v6;
  BOOL v7;
  _BOOL4 v8;

  v5 = vabdd_f64(a1, a3);
  if (a1 <= a3)
  {
    v7 = v5 == a5;
    v6 = v5 >= a5;
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }
  if (!v7 && v6)
    return 0;
  v8 = vabdd_f64(a2, a4) <= a5;
  return a2 > a4 || v8;
}

double PXPointValueForAxis(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a1 != 1)
  {
    if (a1 == 2)
    {
      return a2;
    }
    else if (!a1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v4, v3, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXPointValueForAxis(CGPoint, PXAxis)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXAxis.m"), 16, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  return a3;
}

double PXFloatSign(double a1)
{
  BOOL v1;
  BOOL v2;
  double result;

  v1 = a1 < 0.0;
  v2 = a1 <= 0.0;
  result = 0.0;
  if (v1)
    result = -1.0;
  if (!v2)
    return 1.0;
  return result;
}

double PXFloatSaturate(double a1)
{
  return fmax(fmin(a1, 1.0), 0.0);
}

id PXMap(void *a1, void *a2)
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

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && (v5 = objc_msgSend(v3, "performSelector:", sel_count)) != 0)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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

double PXEdgeInsetsForEdges(char a1)
{
  double result;

  if ((a1 & 1) == 0)
    return 0.0;
  return result;
}

void px_dispatch_on_main_queue(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      block[2]();
    else
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    v1 = block;
  }

}

uint64_t PXUserInterfaceStyleFromUITraitCollection(void *a1)
{
  uint64_t result;

  result = objc_msgSend(a1, "userInterfaceStyle");
  if (result != 2)
    return result == 1;
  return result;
}

double PXRectShortestDistanceToPoint(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;

  v6 = a1 + a3;
  if (a5 < v6)
    v6 = a5;
  if (a1 < v6)
    a1 = v6;
  v7 = a2 + a4;
  if (a6 < a2 + a4)
    v7 = a6;
  if (a2 < v7)
    a2 = v7;
  return hypot(a1 - a5, a2 - a6);
}

CGColorSpaceRef PXGetColorSpace(uint64_t a1)
{
  CGColorSpaceRef result;
  CFStringRef *v3;

  result = (CGColorSpaceRef)colorspaces[a1];
  if (!result)
  {
    result = 0;
    v3 = (CFStringRef *)MEMORY[0x24BDBF320];
    switch(a1)
    {
      case 0:
        goto LABEL_17;
      case 1:
        goto LABEL_16;
      case 2:
        v3 = (CFStringRef *)MEMORY[0x24BDBF328];
        goto LABEL_16;
      case 3:
        v3 = (CFStringRef *)MEMORY[0x24BDBF290];
        goto LABEL_16;
      case 4:
        v3 = (CFStringRef *)MEMORY[0x24BDBF280];
        goto LABEL_16;
      case 5:
        v3 = (CFStringRef *)MEMORY[0x24BDBF228];
        goto LABEL_16;
      case 6:
        v3 = (CFStringRef *)MEMORY[0x24BDBF220];
        goto LABEL_16;
      case 7:
        v3 = (CFStringRef *)MEMORY[0x24BDBF2D8];
        goto LABEL_16;
      case 8:
        v3 = (CFStringRef *)MEMORY[0x24BDBF2B8];
        goto LABEL_16;
      case 9:
        v3 = (CFStringRef *)MEMORY[0x24BDBF258];
        goto LABEL_16;
      case 10:
        v3 = (CFStringRef *)MEMORY[0x24BDBF270];
        goto LABEL_16;
      case 11:
        v3 = (CFStringRef *)MEMORY[0x24BDBF278];
        goto LABEL_16;
      case 12:
        v3 = (CFStringRef *)MEMORY[0x24BDBF318];
        goto LABEL_16;
      case 13:
        v3 = (CFStringRef *)MEMORY[0x24BDBF2C8];
        goto LABEL_16;
      case 14:
        v3 = (CFStringRef *)MEMORY[0x24BDBF2D0];
LABEL_16:
        result = CGColorSpaceCreateWithName(*v3);
LABEL_17:
        colorspaces[a1] = (uint64_t)result;
        break;
      default:
        __assert_rtn("PXGetColorSpace", "PXColorSpaceNameAdditions.m", 68, "NO");
    }
  }
  return result;
}

uint64_t CGImagePropertyOrientationFromPXImageOrientation(unint64_t a1)
{
  void *v2;
  void *v3;

  if (a1 >= 8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGImagePropertyOrientation CGImagePropertyOrientationFromPXImageOrientation(PXImageOrientation)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXMediaProvider.m"), 39, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return dword_24438B9F8[a1];
}

uint64_t PXDataSourceIdentifierMakeUnique()
{
  signed int v0;

  do
    v0 = __ldaxr((unsigned int *)&uniqueDataSourceIdentifier);
  while (__stlxr(v0 + 1, (unsigned int *)&uniqueDataSourceIdentifier));
  return v0;
}

void PXSizeGetAspectRatio(double a1, double a2)
{
  BOOL v4;
  int v5;
  double v6;
  __int16 v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1 == 0.0
    || a2 == 0.0
    || (a1 == *MEMORY[0x24BE71BF0] ? (v4 = a2 == *(double *)(MEMORY[0x24BE71BF0] + 8)) : (v4 = 0), v4))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
    {
      v5 = 134218496;
      v6 = a1;
      v7 = 2048;
      v8 = a2;
      v9 = 2048;
      v10 = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_24430E000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "PFSizeGetAspectRatio produced an undefined aspect ratio from size {%lf, %lf}. Returning %f. Use PFSizeGetAspectRatioWithDefault() to provide a value for this case.", (uint8_t *)&v5, 0x20u);
    }
  }
}

uint64_t PXAxisTransposed(uint64_t a1)
{
  if (a1 == 2)
    return 1;
  else
    return 2 * (a1 == 1);
}

uint64_t PXEdgesFromCGRectEdge(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return qword_24438BB50[a1];
}

double PXSizeValueForAxis(uint64_t a1, double a2, double a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  if (a1 != 1)
  {
    if (a1 == 2)
    {
      return a2;
    }
    else if (!a1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v4, v3, v5, v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXSizeValueForAxis(CGSize, PXAxis)");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("PXAxis.m"), 40, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
  }
  return a3;
}

BOOL PXEdgeInsetsEqualToEdgeInsetsForEdges(char a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  double v12;
  double v13;

  if ((a1 & 1) == 0)
  {
    a2 = 0.0;
    a6 = 0.0;
  }
  if ((a1 & 2) == 0)
  {
    a3 = 0.0;
    a7 = 0.0;
  }
  if ((a1 & 8) == 0)
  {
    a5 = 0.0;
    a9 = 0.0;
  }
  if (a3 != a7 || a2 != a6 || a5 != a9)
    return 0;
  if ((a1 & 4) != 0)
    v12 = a8;
  else
    v12 = 0.0;
  if ((a1 & 4) != 0)
    v13 = a4;
  else
    v13 = 0.0;
  return v13 == v12;
}

double *PXPointSetValueForAxis(double *result, uint64_t a2, double a3)
{
  void *v3;
  void *v4;

  switch(a2)
  {
    case 1:
      ++result;
      goto LABEL_6;
    case 2:
LABEL_6:
      *result = a3;
      return result;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXPointSetValueForAxis(CGPoint * _Nonnull, CGFloat, PXAxis)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXAxis.m"), 27, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

uint64_t PXEdgesForAxis(uint64_t a1)
{
  uint64_t v1;

  v1 = 10;
  if (a1 != 2)
    v1 = 0;
  if (a1 == 1)
    return 5;
  else
    return v1;
}

double PXRectScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

BOOL PXEdgeInsetsApproximatelyEqualToEdgeInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return vabdd_f64(a2, a6) <= 0.00000999999975
      && vabdd_f64(a1, a5) <= 0.00000999999975
      && vabdd_f64(a4, a8) <= 0.00000999999975
      && vabdd_f64(a3, a7) <= 0.00000999999975;
}

double *PXSizeSetValueForAxis(double *result, uint64_t a2, double a3)
{
  void *v3;
  void *v4;

  switch(a2)
  {
    case 1:
      ++result;
      goto LABEL_6;
    case 2:
LABEL_6:
      *result = a3;
      return result;
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXSizeSetValueForAxis(CGSize * _Nonnull, CGFloat, PXAxis)");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXAxis.m"), 51, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

double PXFloatProgressBetween(double a1, double a2, double a3)
{
  BOOL v3;
  double v4;
  double result;

  v3 = a3 <= a1;
  v4 = 1.0 - (a2 - a3) / (a1 - a3);
  result = (a2 - a1) / (a3 - a1);
  if (v3)
    return v4;
  return result;
}

CGImageRef PXCreateCGImageWithDrawBlock(char a1, uint64_t a2, void *a3, double a4, double a5)
{
  void (**v9)(id, CGContext *, double, double, double, double);
  CGContext *v10;
  CGImageRef Image;

  v9 = a3;
  v10 = PXCreateContextWithAutomaticFormat(a1, a2, a4, a5);
  v9[2](v9, v10, 0.0, 0.0, a4, a5);

  Image = CGBitmapContextCreateImage(v10);
  CGContextRelease(v10);
  return Image;
}

CGContext *PXCreateContextWithAutomaticFormat(char a1, uint64_t a2, double a3, double a4)
{
  double v6;
  double v7;
  double v8;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  CGContext *v14;
  void *v16;
  void *v17;
  _QWORD aBlock[4];
  char v19;
  uint64_t v20;
  _QWORD v21[2];
  CGRect v22;

  v21[1] = *MEMORY[0x24BDAC8D0];
  v6 = round(a3);
  v7 = round(a4);
  v8 = 1.0 - v6;
  if (1.0 - v7 > 0.00000011920929 || v8 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v8);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContextWithAutomaticFormat(CGSize, BOOL, PXGColorFormatRange)");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("CGImage+PhotosUIFoundation.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXPixelSizeAreaIsZero(roundedSize)"));

  }
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 3221225472;
  aBlock[2] = __PXCreateContextWithAutomaticFormat_block_invoke;
  aBlock[3] = &__block_descriptor_33_e91_B32__0_CGBitmapContextContentInfo_IiIBB_8__CGBitmapContextInfo_IQQQQiII__CGColorSpace_BI_24l;
  v19 = a1;
  v10 = _Block_copy(aBlock);
  if (a2 == 1)
    v11 = 5;
  else
    v11 = 1;
  v20 = *MEMORY[0x24BDBF1F8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (CGContext *)CGBitmapContextCreateWithCallbacks();
  v22.size.width = (double)(unint64_t)v6;
  v22.size.height = (double)(unint64_t)v7;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  CGContextClearRect(v14, v22);

  return v14;
}

double PXEdgeInsetsRoundToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return round(a1 * a5) / a5;
}

double PXSizeGetArea(double a1, double a2)
{
  return a1 * a2;
}

double PXSizeRoundToPixel(double a1, double a2, double a3)
{
  return round(a1 * a3) / a3;
}

void sub_24431CD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double PXRectGetMaxForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  switch(a1)
  {
    case 1:
      return CGRectGetMaxY(*(CGRect *)&result);
    case 2:
      return CGRectGetMaxX(*(CGRect *)&result);
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v6, v5, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXRectGetMaxForAxis(CGRect, PXAxis)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXAxis.m"), 119, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

double PXFloatByLinearlyInterpolatingFloats(double a1, double a2, double a3)
{
  return a1 + a3 * (a2 - a1);
}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_3(uint64_t a1)
{
  dispatch_time_t v2;

  v2 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 40) * 1000000000.0));
  dispatch_after(v2, MEMORY[0x24BDAC9B8], *(dispatch_block_t *)(a1 + 32));
}

id PXUIApplicationGetFirstKeyWindow(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "connectedScenes");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v23;
    v17 = v1;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v23 != v4)
        objc_enumerationMutation(v1);
      v6 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v5);
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = v6;

        if (!v7 || objc_msgSend(v7, "activationState") == -1)
          goto LABEL_21;
        objc_msgSend(v7, "windows");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = v8;
        v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v19;
LABEL_12:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v19 != v11)
              objc_enumerationMutation(v6);
            v13 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v12);
            if ((objc_msgSend(v13, "isKeyWindow") & 1) != 0)
              break;
            if (v10 == ++v12)
            {
              v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
              if (v10)
                goto LABEL_12;
              goto LABEL_18;
            }
          }
          v14 = v13;

          if (!v14)
          {
            v1 = v17;
            goto LABEL_21;
          }

          v1 = v17;
          goto LABEL_28;
        }
LABEL_18:

        v1 = v17;
      }
      else
      {
        v7 = 0;
      }

LABEL_21:
      if (++v5 == v3)
      {
        v15 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        v3 = v15;
        if (v15)
          goto LABEL_3;
        break;
      }
    }
  }
  v14 = 0;
LABEL_28:

  return v14;
}

void PXSoftClamp(double a1, double a2, double a3, double a4)
{
  if (a2 >= a1)
  {
    if (a2 > a3)
      log((a2 - a3) / a4 + 1.0);
  }
  else
  {
    log((a1 - a2) / a4 + 1.0);
  }
}

double PXSizeMax(double result, double a2, double a3)
{
  if (result < a3)
    return a3;
  return result;
}

uint64_t PXMaxRectEdgeForAxis(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  if (result != 2)
  {
    if (!result)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v2, v1, v3, v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRectEdge PXMaxRectEdgeForAxis(PXAxis)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXAxis.m"), 86, CFSTR("Code which should be unreachable has been reached"));

      abort();
    }
    return 3;
  }
  return result;
}

_PXWrappingDisplayAssetFetchResult *PXDisplayAssetFetchResultSubfetchResultWithRange(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  uint64_t v6;
  _PXWrappingDisplayAssetFetchResult *v7;
  _PXWrappingDisplayAssetFetchResult *v8;

  v5 = a1;
  v6 = objc_msgSend(v5, "count");
  if (a2 || v6 != a3)
    v7 = -[_PXWrappingDisplayAssetFetchResult initWithFetchResult:range:]([_PXWrappingDisplayAssetFetchResult alloc], "initWithFetchResult:range:", v5, a2, a3);
  else
    v7 = (_PXWrappingDisplayAssetFetchResult *)v5;
  v8 = v7;

  return v8;
}

uint64_t PXMinRectEdgeForAxis(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;

  if (a1 == 2)
    return 0;
  if (!a1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v2, v1, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRectEdge PXMinRectEdgeForAxis(PXAxis)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXAxis.m"), 75, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 1;
}

void sub_24431DF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD v3[4];
  id v4;
  uint64_t v5;

  dispatch_get_global_queue(-32768, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_2;
  v3[3] = &unk_2514D11F0;
  v5 = *(_QWORD *)(a1 + 40);
  v4 = *(id *)(a1 + 32);
  dispatch_async(v2, v3);

}

uint64_t PXColorSpaceSupportsExtendedRange(unint64_t a1)
{
  return (a1 > 0xF) | (0x6F60u >> a1) & 1;
}

uint64_t PXGPixelFormatNameToMetalFormat(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return qword_24438BA50[a1 - 1];
}

BOOL PXPixelSizeAreaIsZero(double a1, double a2)
{
  return 1.0 - a1 > 0.00000011920929 || 1.0 - a2 > 0.00000011920929;
}

double px_dispatch_queue_wait(void *a1, double a2)
{
  double v2;
  NSObject *v4;
  uint64_t v5;
  dispatch_block_t v6;
  dispatch_time_t v7;
  double v8;

  v2 = 0.0;
  if (a2 > 0.0)
  {
    v4 = a1;
    v5 = mach_absolute_time();
    v6 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_7921);
    dispatch_async(v4, v6);

    v7 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
    dispatch_block_wait(v6, v7);
    v8 = (double)(uint64_t)(mach_absolute_time() - v5);
    if (PXTimebaseConversionFactor_onceToken != -1)
      dispatch_once(&PXTimebaseConversionFactor_onceToken, &__block_literal_global_4682);
    v2 = *(double *)&PXTimebaseConversionFactor_timebaseConversion * v8;

  }
  return v2;
}

double PXTimebaseConversionFactor()
{
  if (PXTimebaseConversionFactor_onceToken != -1)
    dispatch_once(&PXTimebaseConversionFactor_onceToken, &__block_literal_global_4682);
  return *(double *)&PXTimebaseConversionFactor_timebaseConversion;
}

void px_dispatch_on_main_queue_when_idle_after_delay(void *a1, double a2)
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;
  double v7;

  v3 = a1;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke;
  v5[3] = &unk_2514D11F0;
  v7 = a2;
  v6 = v3;
  v4 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);

}

id px_dispatch_queue_create_serial(const char *a1, dispatch_qos_class_t a2)
{
  NSObject *v4;
  void *v5;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  px_dispatch_queue_create_with_priority(a1, v4, a2, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

dispatch_queue_t px_dispatch_queue_create_with_priority(const char *a1, dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  NSObject *v5;
  dispatch_queue_t v6;

  dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create(a1, v5);

  return v6;
}

void sub_24431ED30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void static AnyPhotosObservableHosted.subscript.getter(uint64_t *a1@<X1>, _QWORD *a2@<X2>, uint64_t a3@<X8>)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;

  v4 = *a1;
  v5 = (_QWORD *)MEMORY[0x24BEE35B8];
  v6 = *(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE35B8] + *a2 + 8) + 32);
  v7 = *(_QWORD *)(*a1 + *MEMORY[0x24BEE35B8]);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v12 - v10;
  (*(void (**)(uint64_t, uint64_t))(v6 + 16))(v7, v6);
  OUTLINED_FUNCTION_7();
  swift_readAtKeyPath();
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6();
  swift_unknownObjectRelease();
  OUTLINED_FUNCTION_4();
  swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v5 + v4 + 8) - 8) + 16))(a3);
  OUTLINED_FUNCTION_6();
  swift_release_n();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
  OUTLINED_FUNCTION_1();
}

void static AnyPhotosObservableHosted.subscript.setter(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  void (*v17)(_BYTE *, _QWORD);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  _BYTE v22[32];

  v20 = a1;
  v21 = a3;
  v3 = *(_QWORD *)(*a3 + *MEMORY[0x24BEE35B8] + 8);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v19 - v5;
  v9 = *(_QWORD *)(*(_QWORD *)(v7 + v8) + 32);
  v12 = *(_QWORD *)(v10 + v11);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v16 = (char *)&v19 - v15;
  (*(void (**)(uint64_t, uint64_t))(v9 + 16))(v12, v9);
  OUTLINED_FUNCTION_7();
  swift_retain();
  v17 = (void (*)(_BYTE *, _QWORD))swift_readAtKeyPath();
  swift_retain();
  v17(v22, 0);
  swift_release();
  swift_unknownObjectRelease();
  v18 = v20;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v20, v3);
  swift_setAtReferenceWritableKeyPath();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v18, v3);
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, AssociatedTypeWitness);
  OUTLINED_FUNCTION_1();
}

void (*static AnyPhotosObservableHosted.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t *a3, _QWORD *a4))(uint64_t **a1, char a2)
{
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  size_t v11;
  void *v12;

  v8 = malloc(0x38uLL);
  *a1 = v8;
  v8[1] = a3;
  v8[2] = a4;
  *v8 = a2;
  v9 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a3 + 8);
  v8[3] = v9;
  v10 = *(_QWORD *)(v9 - 8);
  v8[4] = v10;
  v11 = *(_QWORD *)(v10 + 64);
  v8[5] = malloc(v11);
  v12 = malloc(v11);
  v8[6] = v12;
  static AnyPhotosObservableHosted.subscript.getter(a3, a4, (uint64_t)v12);
  return sub_24431F1C4;
}

void sub_24431F1C4(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;

  v2 = *a1;
  v3 = (void *)(*a1)[5];
  v4 = (void *)(*a1)[6];
  if ((a2 & 1) != 0)
  {
    v5 = v2[3];
    v6 = v2[4];
    v7 = (_QWORD *)v2[1];
    v8 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[5], v4, v5);
    OUTLINED_FUNCTION_4();
    swift_retain();
    swift_unknownObjectRetain();
    static AnyPhotosObservableHosted.subscript.setter((uint64_t)v3, v8, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    v9 = (_QWORD *)v2[1];
    v10 = *v2;
    swift_retain();
    OUTLINED_FUNCTION_4();
    swift_unknownObjectRetain();
    static AnyPhotosObservableHosted.subscript.setter((uint64_t)v4, v10, v9);
  }
  free(v4);
  free(v3);
  free(v2);
}

void AnyPhotosObservableHosted.wrappedValue.getter()
{
  OUTLINED_FUNCTION_0_0();
  __break(1u);
}

void sub_24431F2D0()
{
  AnyPhotosObservableHosted.wrappedValue.getter();
}

void sub_24431F2DC(uint64_t a1)
{
  uint64_t v1;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(void))(v1 + 16))();
  AnyPhotosObservableHosted.wrappedValue.setter();
}

void AnyPhotosObservableHosted.wrappedValue.setter()
{
  OUTLINED_FUNCTION_0_0();
  __break(1u);
}

void AnyPhotosObservableHosted.wrappedValue.modify()
{
  AnyPhotosObservableHosted.wrappedValue.getter();
}

uint64_t AnyPhotosObservableHosted.init(_:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t AnyPhotosObservableHosted.observableKeyPath.getter()
{
  return swift_retain();
}

void AnyPhotosObservableHosted.observableKeyPath.setter(uint64_t a1)
{
  _QWORD *v1;

  swift_release();
  *v1 = a1;
  OUTLINED_FUNCTION_2();
}

uint64_t (*AnyPhotosObservableHosted.observableKeyPath.modify())()
{
  return nullsub_1;
}

uint64_t sub_24431F3A8()
{
  return 24;
}

__n128 sub_24431F3B4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_24431F3C8()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for AnyPhotosObservableHosted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyPhotosObservableHosted);
}

void type metadata accessor for PXMenuActionState(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257357088);
}

void type metadata accessor for PXMenuActionRole(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257357090);
}

void type metadata accessor for PXImageContentMode(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257357098);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24431F428(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24431F448(uint64_t result, int a2, int a3)
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

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570A0);
}

void type metadata accessor for PXImageDynamicRange(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570A8);
}

void type metadata accessor for PXDisplayAssetMediaSubtype(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570B0);
}

void type metadata accessor for PXDisplayAssetMediaType(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570B8);
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosAnyEquatable(uint64_t *a1, uint64_t *a2)
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

uint64_t sub_24431F4FC(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_24431F51C(uint64_t result, int a2, int a3)
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

void type metadata accessor for PXAssetBadgeInfo(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570C0);
}

void type metadata accessor for PXSimpleIndexPath(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570C8);
}

void type metadata accessor for CGRectEdge(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570D0);
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_24431FBA8(a1, (unint64_t *)&unk_2573570D8);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257356EE0);
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosDisplayRect(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 48))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for PhotosDisplayRect(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 40) = 0;
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
  *(_BYTE *)(result + 48) = v3;
  return result;
}

void type metadata accessor for CGAffineTransform(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_2573570E8);
}

BOOL sub_24431F62C(uint64_t a1, uint64_t a2)
{
  return (a1 & ~a2) == 0;
}

void sub_24431F63C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  swift_bridgeObjectRelease();
  *a2 = v4;
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24431F68C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    v2 = 0;
    v3 = (uint64_t *)(a1 + 32);
    do
    {
      v5 = *v3++;
      v4 = v5;
      if ((v5 & ~v2) == 0)
        v4 = 0;
      v2 |= v4;
      --v1;
    }
    while (v1);
  }
  else
  {
    v2 = 0;
  }
  swift_bridgeObjectRelease();
  return v2;
}

void sub_24431F6DC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return 0;
}

void sub_24431F6EC(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_3(a1);
}

uint64_t sub_24431F6F4(uint64_t a1, uint64_t a2)
{
  return a2 | a1;
}

void sub_24431F6FC(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_3(a1);
}

uint64_t sub_24431F704(uint64_t a1, uint64_t a2)
{
  return a2 ^ a1;
}

BOOL sub_24431F70C(_QWORD *a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & a2;
  if (v3 != a2)
    *v2 |= a2;
  *a1 = a2;
  return v3 != a2;
}

void sub_24431F73C(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  if ((*v2 & a2) != 0)
    *v2 &= ~a2;
  OUTLINED_FUNCTION_5(a1);
}

uint64_t sub_24431F75C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t result;

  result = *v1 & a1;
  if (result)
    *v1 &= ~a1;
  return result;
}

void sub_24431F784(uint64_t a1@<X8>, uint64_t a2@<X0>)
{
  _QWORD *v2;

  *v2 |= a2;
  OUTLINED_FUNCTION_5(a1);
}

uint64_t sub_24431F79C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *v1 |= a1;
  return v2 & a1;
}

void sub_24431F7B4(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_8(*v1 | a1);
}

uint64_t sub_24431F7C0(uint64_t result)
{
  _QWORD *v1;

  *v1 |= result;
  return result;
}

void sub_24431F7D0(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_8(*v1 ^ a1);
}

uint64_t sub_24431F7DC(uint64_t result)
{
  _QWORD *v1;

  *v1 ^= result;
  return result;
}

void sub_24431F7EC(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_3(a1);
}

uint64_t sub_24431F7F4(uint64_t a1, uint64_t a2)
{
  return a2 & ~a1;
}

BOOL sub_24431F7FC(uint64_t a1, uint64_t a2)
{
  return (a2 & a1) == 0;
}

BOOL sub_24431F808(uint64_t a1)
{
  return a1 == 0;
}

void sub_24431F814(uint64_t a1)
{
  _QWORD *v1;

  OUTLINED_FUNCTION_8(*v1 & ~a1);
}

uint64_t sub_24431F820(uint64_t result)
{
  _QWORD *v1;

  *v1 &= ~result;
  return result;
}

_QWORD *sub_24431F830@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_24431F840(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_3(a1);
}

void sub_24431F848(_QWORD *a1@<X8>)
{
  OUTLINED_FUNCTION_3(a1);
}

void sub_24431F850(uint64_t a1@<X8>)
{
  uint64_t v2;
  char v3;

  sub_24431F880();
  *(_QWORD *)a1 = v2;
  *(_BYTE *)(a1 + 8) = v3 & 1;
}

void sub_24431F888(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = nullsub_1(*v1);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24431F8AC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = OUTLINED_FUNCTION_0();
  *a1 = result;
  return result;
}

BOOL sub_24431F8D0(uint64_t *a1)
{
  uint64_t *v1;

  return sub_24431F62C(*a1, *v1);
}

uint64_t sub_24431F8DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_24431F6F4(*a1, *v2);
  *a2 = result;
  return result;
}

void sub_24431F908(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  *a2 = sub_244323664(*a1, *v2);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24431F930@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_24431F704(*a1, *v2);
  *a2 = result;
  return result;
}

BOOL sub_24431F95C(_QWORD *a1, uint64_t *a2)
{
  return sub_24431F70C(a1, *a2);
}

uint64_t sub_24431F964@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_24431F75C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_24431F994@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;
  char v4;

  result = sub_24431F79C(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

uint64_t sub_24431F9C4(uint64_t *a1)
{
  return sub_24431F7C0(*a1);
}

uint64_t sub_24431F9CC(_QWORD *a1)
{
  return j__OUTLINED_FUNCTION_8_0(*a1);
}

uint64_t sub_24431F9D4(uint64_t *a1)
{
  return sub_24431F7DC(*a1);
}

uint64_t sub_24431F9DC@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;
  uint64_t result;

  result = sub_24431F7F4(*a1, *v2);
  *a2 = result;
  return result;
}

uint64_t sub_24431FA08(_QWORD *a1)
{
  _QWORD *v1;

  return sub_244323D0C(*a1, *v1);
}

BOOL sub_24431FA14(uint64_t *a1)
{
  uint64_t *v1;

  return sub_24431F7FC(*a1, *v1);
}

BOOL sub_24431FA20(uint64_t *a1)
{
  uint64_t *v1;

  return sub_24431FC0C(*a1, *v1);
}

BOOL sub_24431FA2C()
{
  uint64_t *v0;

  return sub_24431F808(*v0);
}

uint64_t sub_24431FA34()
{
  return sub_24437A850();
}

uint64_t sub_24431FA4C(uint64_t *a1)
{
  return sub_24431F820(*a1);
}

BOOL sub_24431FA54(uint64_t *a1, uint64_t *a2)
{
  return sub_244322D50(*a1, *a2);
}

uint64_t sub_24431FA60@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = sub_24431F68C(a1);
  *a2 = result;
  return result;
}

uint64_t sub_24431FA84()
{
  return sub_24431FACC(&qword_2573570F0, (uint64_t)&unk_244388878);
}

uint64_t sub_24431FAA8()
{
  return sub_24431FACC(&qword_2573570F8, (uint64_t)&unk_244388844);
}

uint64_t sub_24431FACC(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for PXDisplayAssetMediaSubtype(255);
    result = MEMORY[0x24950D28C](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_24431FB0C()
{
  return sub_24431FACC(&qword_257357100, (uint64_t)&unk_2443888A4);
}

uint64_t sub_24431FB30()
{
  return sub_24431FACC(&qword_257357108, (uint64_t)&unk_2443888E0);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x24950D214](a1, v6, a5);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257357110);
}

void type metadata accessor for PXAssetBadges(uint64_t a1)
{
  sub_24431FBA8(a1, &qword_257357118);
}

void sub_24431FBA8(uint64_t a1, unint64_t *a2)
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

uint64_t OUTLINED_FUNCTION_0_0()
{
  return sub_24437A9B8();
}

void OUTLINED_FUNCTION_3(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = v1;
}

uint64_t OUTLINED_FUNCTION_4()
{
  return swift_retain();
}

void OUTLINED_FUNCTION_5(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v2;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = v2;
}

uint64_t OUTLINED_FUNCTION_6()
{
  uint64_t (*v0)(uint64_t, _QWORD);
  uint64_t v1;

  return v0(v1 - 120, 0);
}

uint64_t OUTLINED_FUNCTION_7()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 88) = v0;
  return swift_unknownObjectRetain();
}

void OUTLINED_FUNCTION_8(uint64_t a1@<X8>)
{
  _QWORD *v1;

  *v1 = a1;
}

uint64_t static Logger.photosUI(category:)()
{
  sub_24437A4A8();
  swift_bridgeObjectRetain();
  return sub_24437A310();
}

uint64_t PhotosBasicItem.__allocating_init(id:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = swift_allocObject();
  PhotosBasicItem.init(id:value:)(a1, a2, a3);
  return v6;
}

char *PhotosBasicItem.init(id:value:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v4;

  v4 = *(_QWORD *)v3;
  *((_QWORD *)v3 + 2) = a1;
  *((_QWORD *)v3 + 3) = a2;
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(*(_QWORD *)(v4 + 80) - 8) + 32))(&v3[*(_QWORD *)(v4 + 96)], a3);
  return v3;
}

uint64_t PhotosBasicItem.id.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t PhotosBasicItem.value.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 96));
}

uint64_t PhotosBasicItem.diagnosticDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;
  unint64_t v8;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  sub_24437A8B0();
  swift_bridgeObjectRelease();
  v7 = 1029990779;
  v8 = 0xE400000000000000;
  swift_bridgeObjectRetain();
  sub_24437A49C();
  swift_bridgeObjectRelease();
  sub_24437A49C();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1 + *(_QWORD *)(*(_QWORD *)v1 + 96), v2);
  sub_24437A484();
  sub_24437A49C();
  swift_bridgeObjectRelease();
  sub_24437A49C();
  return v7;
}

uint64_t PhotosBasicItem.debugDescription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  swift_getMetatypeMetadata();
  v1 = sub_24437A484();
  v3 = v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257357240);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_244388A80;
  v5 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 56) = MEMORY[0x24BEE0D00];
  v6 = sub_244320020();
  *(_QWORD *)(v4 + 32) = v1;
  *(_QWORD *)(v4 + 40) = v3;
  v7 = MEMORY[0x24BEE17F0];
  *(_QWORD *)(v4 + 96) = MEMORY[0x24BEE1768];
  *(_QWORD *)(v4 + 104) = v7;
  *(_QWORD *)(v4 + 64) = v6;
  *(_QWORD *)(v4 + 72) = v0;
  v9 = *(_QWORD *)(v0 + 16);
  v8 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v4 + 136) = v5;
  *(_QWORD *)(v4 + 144) = v6;
  *(_QWORD *)(v4 + 112) = v9;
  *(_QWORD *)(v4 + 120) = v8;
  swift_bridgeObjectRetain();
  return sub_24437A478();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950D274]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_244320020()
{
  unint64_t result;

  result = qword_257357248;
  if (!qword_257357248)
  {
    result = MEMORY[0x24950D28C](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_257357248);
  }
  return result;
}

uint64_t *PhotosBasicItem.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 80) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 96));
  return v0;
}

uint64_t PhotosBasicItem.__deallocating_deinit()
{
  PhotosBasicItem.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2443200C4()
{
  return MEMORY[0x24BEE0D20];
}

uint64_t sub_2443200D0()
{
  return MEMORY[0x24BEE0D10];
}

uint64_t sub_2443200DC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = PhotosBasicItem.id.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_244320104@<X0>(uint64_t a1@<X8>)
{
  return PhotosBasicItem.value.getter(a1);
}

uint64_t sub_244320124(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItem<A>);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_244320150()
{
  return PhotosBasicItem.debugDescription.getter();
}

uint64_t sub_244320170(uint64_t a1)
{
  return PhotosBasicItem.diagnosticDescription.getter(a1);
}

uint64_t sub_244320194()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PhotosBasicItem(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosBasicItem);
}

uint64_t method lookup function for PhotosBasicItem()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosBasicItem.__allocating_init(id:value:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

BOOL static PXAssetBadgeInfo.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, double a7, double a8)
{
  _BOOL4 v9;

  v9 = a1 == a4 && a2 == a5;
  if (a7 != a8)
    v9 = 0;
  return a3 == a6 && v9;
}

BOOL sub_244320254(uint64_t a1, uint64_t a2)
{
  return static PXAssetBadgeInfo.== infix(_:_:)(*(_QWORD *)a1, *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)a2, *(_QWORD *)(a2 + 16), *(_QWORD *)(a2 + 24), *(double *)(a1 + 8), *(double *)(a2 + 8));
}

uint64_t PhotosBasicItemList.__allocating_init(items:loadingStatus:)(uint64_t a1, char *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  PhotosBasicItemList.init(items:loadingStatus:)(a1, a2);
  return v4;
}

_QWORD *PhotosBasicItemList.init(items:loadingStatus:)(uint64_t a1, char *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  char v6;
  uint64_t Unique;
  uint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[6];

  v3 = v2;
  v5 = *v2;
  v6 = *a2;
  Unique = PXDataSourceIdentifierMakeUnique();
  v3[2] = a1;
  v3[3] = Unique;
  *((_BYTE *)v3 + 40) = v6;
  v15[5] = a1;
  v8 = *(_QWORD *)(v5 + 88);
  v15[2] = *(_QWORD *)(v5 + 80);
  v15[3] = v8;
  v9 = sub_24437A5E0();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  swift_bridgeObjectRetain();
  v11 = MEMORY[0x24950D28C](MEMORY[0x24BEE12E0], v9);
  v13 = sub_2443203B0((void (*)(char *, uint64_t))sub_2443206BC, (uint64_t)v15, v9, AssociatedTypeWitness, MEMORY[0x24BEE4078], v11, MEMORY[0x24BEE40A8], v12);
  swift_bridgeObjectRelease();
  v3[4] = v13;
  return v3;
}

uint64_t sub_2443203B0(void (*a1)(char *, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t result;
  char *v25;
  char *v26;
  void (*v27)(char *, _QWORD);
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char v49[40];
  uint64_t v50;

  v37 = a5;
  v38 = a8;
  v44 = a1;
  v45 = a2;
  v36 = *(_QWORD *)(a5 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_2_0();
  v46 = v10;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v13 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v41 = (char *)&v32 - v14;
  MEMORY[0x24BDAC7A8](v13);
  OUTLINED_FUNCTION_2_0();
  v40 = v15;
  v16 = swift_getAssociatedTypeWitness();
  v39 = *(_QWORD *)(v16 - 8);
  v17 = MEMORY[0x24BDAC7A8](v16);
  v35 = (char *)&v32 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v32 - v19;
  v42 = v8;
  v21 = a6;
  v22 = sub_24437A6F4();
  if (!v22)
    return sub_24437A568();
  v23 = v22;
  v33 = v16;
  v50 = sub_24437A394();
  v43 = sub_24437A970();
  sub_24437A928();
  v34 = v20;
  result = sub_24437A6E8();
  if (v23 < 0)
  {
    __break(1u);
  }
  else
  {
    v47 = v21;
    v25 = v41;
    v26 = v34;
    while (1)
    {
      v27 = (void (*)(char *, _QWORD))sub_24437A778();
      (*(void (**)(char *))(v12 + 16))(v25);
      v27(v49, 0);
      v28 = v48;
      v44(v25, v46);
      if (v28)
        break;
      v48 = 0;
      OUTLINED_FUNCTION_1_0();
      sub_24437A958();
      sub_24437A70C();
      if (!--v23)
      {
        v29 = v39;
        v30 = v35;
        v31 = v33;
        (*(void (**)(char *, char *, uint64_t))(v39 + 32))(v35, v26, v33);
        sub_24437A868();
        (*(void (**)(char *, uint64_t))(v29 + 8))(v30, v31);
        return v50;
      }
    }
    OUTLINED_FUNCTION_1_0();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v26, v33);
    swift_release();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v36 + 32))(v38, v46, v37);
  }
  return result;
}

uint64_t sub_2443206BC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 64))(*(_QWORD *)(v0 + 16));
}

uint64_t PhotosBasicItemList.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t PhotosBasicItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosBasicItemList.loadingStatus.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 40);
}

void PhotosBasicItemList.numberOfItems.getter()
{
  JUMPOUT(0x24950BEB8);
}

uint64_t PhotosBasicItemList.item(at:)()
{
  return sub_24437A604();
}

uint64_t PhotosBasicItemList.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosBasicItemList.__deallocating_deinit()
{
  PhotosBasicItemList.deinit();
  return swift_deallocClassInstance();
}

void sub_244320770()
{
  PhotosBasicItemList.numberOfItems.getter();
}

void sub_244320790()
{
  PhotosBasicItemList.isEmpty.getter();
}

uint64_t sub_2443207A4(char a1)
{
  return a1 & 1;
}

void PhotosBasicItemList.isEmpty.getter()
{
  PhotosBasicItemList.numberOfItems.getter();
}

BOOL sub_2443207C0(uint64_t a1)
{
  return a1 == 0;
}

uint64_t sub_2443207D0()
{
  return PhotosBasicItemList.itemIdentifiers.getter();
}

uint64_t sub_2443207F0()
{
  return PhotosBasicItemList.item(at:)();
}

uint64_t sub_244320810()
{
  return PhotosBasicItemList.subscript.getter();
}

void sub_244320834(_BYTE *a1@<X8>)
{
  PhotosBasicItemList.loadingStatus.getter(a1);
}

uint64_t sub_244320854()
{
  return PhotosBasicItemList.version.getter();
}

uint64_t PhotosBasicItemList.subscript.getter()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v3;

  v1 = *v0;
  swift_retain();
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, v1);
  sub_24437AAE4();
  return v3;
}

uint64_t PhotosBasicItemList.startIndex.getter()
{
  return 0;
}

Swift::Int __swiftcall PhotosBasicItemList.index(after:)(Swift::Int after)
{
  BOOL v1;
  Swift::Int result;

  v1 = __OFADD__(after, 1);
  result = after + 1;
  if (v1)
    __break(1u);
  return result;
}

uint64_t sub_2443208F4(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

void sub_2443208FC()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_24432090C()
{
  return sub_244320C9C(&qword_257357328, MEMORY[0x24BEE1BD0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x24950D280](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_244320974()
{
  unint64_t result;

  result = qword_257357338;
  if (!qword_257357338)
  {
    result = MEMORY[0x24950D28C](MEMORY[0x24BEE1790], MEMORY[0x24BEE1768]);
    atomic_store(result, (unint64_t *)&qword_257357338);
  }
  return result;
}

uint64_t sub_2443209B0(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>);
  return MEMORY[0x24950D28C](MEMORY[0x24BEE4230], a1, &v3);
}

uint64_t sub_2443209F8()
{
  return sub_24437A6C4();
}

uint64_t sub_244320A08()
{
  return sub_24437A6DC();
}

void sub_244320A14()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_244320A24()
{
  return sub_244320C9C(&qword_257357340, MEMORY[0x24BEE1BA8]);
}

uint64_t sub_244320A48(uint64_t a1)
{
  uint64_t v3;

  v3 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>);
  return MEMORY[0x24950D28C](MEMORY[0x24BEE4218], a1, &v3);
}

uint64_t sub_244320A90()
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>);
  return sub_24437A6B8();
}

uint64_t sub_244320AE0(_QWORD *a1)
{
  uint64_t result;
  uint64_t v3;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>);
  result = sub_24437A6B8();
  *a1 = v3;
  return result;
}

uint64_t sub_244320B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a3);
  return sub_24437A6C4();
}

uint64_t sub_244320BA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a4);
  return sub_24437A6AC();
}

uint64_t sub_244320C08(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a3);
  return sub_24437A6DC();
}

void sub_244320C5C()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_244320C6C()
{
  return MEMORY[0x24BEE1780];
}

uint64_t sub_244320C78()
{
  return sub_244320C9C(&qword_257357348, MEMORY[0x24BEE1BD8]);
}

uint64_t sub_244320C9C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;
  unint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v5 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257357330);
    v6 = sub_244320974();
    v7[0] = MEMORY[0x24BEE17A8];
    v7[1] = v6;
    result = MEMORY[0x24950D28C](a2, v5, v7);
    atomic_store(result, a1);
  }
  return result;
}

void sub_244320D08()
{
  JUMPOUT(0x24950D28CLL);
}

void sub_244320D18()
{
  PhotosBasicItemList.endIndex.getter();
}

uint64_t sub_244320D30(uint64_t result)
{
  _QWORD *v1;

  *v1 = result;
  return result;
}

void (*sub_244320D40(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_244320DB8(v2);
  return sub_244320D90;
}

void sub_244320D90(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  OUTLINED_FUNCTION_0_1(v1);
}

void (*sub_244320DB8(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v3 = *(_QWORD *)(v2 - 8);
  *a1 = v2;
  a1[1] = v3;
  a1[2] = malloc(*(_QWORD *)(v3 + 64));
  PhotosBasicItemList.item(at:)();
  return sub_244320E18;
}

void sub_244320E18(_QWORD *a1)
{
  void *v1;

  v1 = (void *)a1[2];
  (*(void (**)(void *, _QWORD))(a1[1] + 8))(v1, *a1);
  OUTLINED_FUNCTION_0_1(v1);
}

uint64_t sub_244320E44@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  result = PhotosBasicItemList.subscript.getter();
  *a1 = result;
  a1[1] = v3;
  a1[2] = v4;
  return result;
}

uint64_t sub_244320E78(uint64_t a1)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a1);
  return sub_24437A6D0();
}

void sub_244320EC8(uint64_t a1@<X8>)
{
  *(_QWORD *)a1 = 0;
  *(_WORD *)(a1 + 8) = 256;
}

Swift::Int sub_244320EE4@<X0>(Swift::Int *a1@<X0>, Swift::Int *a2@<X8>)
{
  Swift::Int result;

  result = PhotosBasicItemList.index(after:)(*a1);
  *a2 = result;
  return result;
}

Swift::Int sub_244320F0C(Swift::Int *a1)
{
  Swift::Int result;

  result = PhotosBasicItemList.index(after:)(*a1);
  *a1 = result;
  return result;
}

void sub_244320F34()
{
  JUMPOUT(0x24950D28CLL);
}

void sub_244320F44(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
  a1[1] = 0;
}

uint64_t sub_244320F50(uint64_t a1)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a1);
  return sub_24437A724();
}

uint64_t sub_244320F84()
{
  return 2;
}

uint64_t sub_244320F8C(uint64_t a1)
{
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemList<A>, a1);
  return sub_24437A754();
}

uint64_t sub_244320FC4()
{
  return sub_24437A4FC();
}

uint64_t sub_244320FE4()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosBasicItemList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosBasicItemList);
}

uint64_t method lookup function for PhotosBasicItemList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosBasicItemList.__allocating_init(items:loadingStatus:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

void OUTLINED_FUNCTION_0_1(void *a1)
{
  free(a1);
}

uint64_t OUTLINED_FUNCTION_1_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
}

uint64_t PhotosDispatchAfter.__allocating_init(timeInterval:queue:fire:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_0_2();
  PhotosDispatchAfter.init(timeInterval:queue:fire:)(a1, a2, a3, a4);
  return v8;
}

uint64_t PhotosDispatchAfter.init(timeInterval:queue:fire:)(void *a1, uint64_t a2, uint64_t a3, double a4)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD aBlock[6];

  v29 = a1;
  v7 = sub_24437A334();
  v30 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_24437A34C();
  v27 = *(_QWORD *)(v10 - 8);
  v28 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_24437A364();
  v14 = *(_QWORD *)(v13 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)v25 - v18;
  sub_24437A358();
  MEMORY[0x24950BCA8](v17, a4);
  v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  v26(v17, v13);
  v20 = OUTLINED_FUNCTION_0_2();
  swift_weakInit();
  v21 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v21[2] = v20;
  v21[3] = a2;
  v21[4] = a3;
  aBlock[4] = sub_24432145C;
  aBlock[5] = v21;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244321468;
  aBlock[3] = &block_descriptor;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_24437A340();
  v31 = MEMORY[0x24BEE4AF8];
  sub_2443214AC();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356EA8);
  sub_2443214EC();
  sub_24437A85C();
  v23 = v29;
  MEMORY[0x24950C0E0](v19, v12, v9, v22);
  _Block_release(v22);

  swift_release();
  (*(void (**)(char *, uint64_t))(v30 + 8))(v9, v7);
  (*(void (**)(char *, uint64_t))(v27 + 8))(v12, v28);
  v26(v19, v13);
  swift_release();
  swift_release();
  return v25[1];
}

uint64_t sub_2443213A8()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_2443213CC(uint64_t a1, void (*a2)(void))
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    a2();
    return swift_release();
  }
  return result;
}

uint64_t sub_244321430()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24432145C()
{
  uint64_t v0;

  return sub_2443213CC(*(_QWORD *)(v0 + 16), *(void (**)(void))(v0 + 24));
}

uint64_t sub_244321468(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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

unint64_t sub_2443214AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257356E88;
  if (!qword_257356E88)
  {
    v1 = sub_24437A334();
    result = MEMORY[0x24950D28C](MEMORY[0x24BEE5468], v1);
    atomic_store(result, (unint64_t *)&qword_257356E88);
  }
  return result;
}

unint64_t sub_2443214EC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257356EB0;
  if (!qword_257356EB0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257356EA8);
    result = MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_257356EB0);
  }
  return result;
}

BOOL static PhotosDispatchAfter.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

uint64_t PhotosDispatchAfter.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PhotosDispatchAfter.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

BOOL sub_244321554(uint64_t *a1, uint64_t *a2)
{
  return static PhotosDispatchAfter.== infix(_:_:)(*a1, *a2);
}

uint64_t type metadata accessor for PhotosDispatchAfter()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhotosDispatchAfter()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosDispatchAfter.__allocating_init(timeInterval:queue:fire:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  return swift_allocObject();
}

uint64_t RangeReplaceableCollection.px_popFirst()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t AssociatedTypeWitness;

  if ((sub_24437A700() & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    sub_24437A784();
    v2 = 0;
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return __swift_storeEnumTagSinglePayload(a1, v2, 1, AssociatedTypeWitness);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

void PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_allocObject();
  OUTLINED_FUNCTION_2_1();
  PhotosMappingItemListManager.init<A>(itemListManager:itemProvider:)(v0, v1, v2, v3, v4);
  OUTLINED_FUNCTION_0_3();
}

_QWORD *PhotosMappingItemListManager.init<A>(itemListManager:itemProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;

  v6 = v5;
  v12 = *v5;
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  OUTLINED_FUNCTION_0_2();
  v13 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v5[11] = 0;
  v5[3] = 0;
  v5[4] = 0;
  v5[2] = v13;
  sub_24437A2EC();
  v14 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v15 = *(_QWORD *)(v12 + 80);
  v14[2] = v15;
  v14[3] = a4;
  v16 = *(_QWORD *)(v12 + 88);
  v14[4] = v16;
  v14[5] = a5;
  v14[6] = a1;
  v6[5] = sub_244321D68;
  v6[6] = v14;
  v17 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v17[2] = v15;
  v17[3] = a4;
  v17[4] = v16;
  v17[5] = a5;
  v17[6] = a1;
  v6[7] = sub_244321D94;
  v6[8] = v17;
  v18 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v18[2] = v15;
  v18[3] = a4;
  v18[4] = v16;
  v18[5] = a5;
  v18[6] = a1;
  v18[7] = a2;
  v18[8] = a3;
  v6[9] = sub_244321DFC;
  v6[10] = v18;
  swift_unknownObjectRetain_n();
  return v6;
}

uint64_t sub_2443217B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedConformanceWitness;
  char *v24;
  unint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v34 = a5;
  v35 = a3;
  v36 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v14 = *(_QWORD *)(v13 + 64);
  v15 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v33 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v31 - v16;
  (*(void (**)(uint64_t, uint64_t))(a8 + 40))(a6, a8);
  v37 = a7;
  if (!a1)
    goto LABEL_4;
  v32 = *(_QWORD *)(a1 + 32);
  v19 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  v20 = *(uint64_t (**)(uint64_t, uint64_t))(v19 + 8);
  swift_retain();
  v21 = v20(AssociatedTypeWitness, v19);
  if (v32 != v21)
  {
    swift_release();
    a7 = v37;
LABEL_4:
    v22 = v34;
    v32 = type metadata accessor for PhotosMappingItemList(0, v34, a7, v18);
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v31 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 112))(&v38, AssociatedTypeWitness, AssociatedConformanceWitness);
    v24 = v33;
    (*(void (**)(char *, char *, uint64_t))(v13 + 16))(v33, v17, AssociatedTypeWitness);
    v25 = (*(unsigned __int8 *)(v13 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
    v26 = (char *)swift_allocObject();
    *((_QWORD *)v26 + 2) = v22;
    *((_QWORD *)v26 + 3) = a6;
    *((_QWORD *)v26 + 4) = v37;
    *((_QWORD *)v26 + 5) = a8;
    (*(void (**)(char *, char *, uint64_t))(v13 + 32))(&v26[v25], v24, AssociatedTypeWitness);
    v27 = &v26[(v14 + v25 + 7) & 0xFFFFFFFFFFFFFFF8];
    v28 = v36;
    *(_QWORD *)v27 = v35;
    *((_QWORD *)v27 + 1) = v28;
    swift_retain();
    PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(v31, (char *)&v38, (uint64_t)sub_244322018, (uint64_t)v26);
    a1 = v29;
  }
  (*(void (**)(char *, uint64_t))(v13 + 8))(v17, AssociatedTypeWitness);
  return a1;
}

uint64_t sub_244321A10(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(char *))
{
  uint64_t AssociatedConformanceWitness;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v13;
  void (*v14)(char *);

  v14 = a4;
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v9 = (char *)&v13 - v8;
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 56);
  v11 = swift_checkMetadataState();
  v10(a1, v11, AssociatedConformanceWitness);
  v14(v9);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, AssociatedTypeWitness);
}

uint64_t PhotosMappingItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

void sub_244321B50()
{
  uint64_t v0;
  void (*v1)(void);
  uint64_t v2;

  v1 = *(void (**)(void))(v0 + 72);
  sub_244321BE8();
  v1();
  swift_release();
  v2 = swift_retain();
  sub_244321BF0(v2);
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_244321BA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 40))() & 1;
}

uint64_t sub_244321BC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 56))();
}

uint64_t sub_244321BE8()
{
  return swift_retain();
}

uint64_t sub_244321BF0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
  return swift_release();
}

uint64_t PhotosMappingItemListManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v1 = v0 + qword_2573573E8;
  v2 = sub_24437A2F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PhotosMappingItemListManager.__deallocating_deinit()
{
  PhotosMappingItemListManager.deinit();
  return swift_deallocClassInstance();
}

void sub_244321C98(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_244321B50();
  *a1 = v2;
}

uint64_t sub_244321CC4()
{
  return sub_244321BC8();
}

void PhotosItemListManager.map<A>(itemProvider:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  type metadata accessor for PhotosMappingItemListManager(0, a4, a6, a4);
  swift_unknownObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_2_1();
  PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)();
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_244321D44()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244321D68()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 40) + 56))(*(_QWORD *)(v0 + 24)) & 1;
}

uint64_t sub_244321D94(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 16) + 24))(a1, a2, *(_QWORD *)(v2 + 24));
}

uint64_t sub_244321DD0()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244321DFC(uint64_t a1)
{
  uint64_t *v1;

  return sub_2443217B8(a1, v1[6], v1[7], v1[8], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t type metadata accessor for PhotosMappingItemListManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosMappingItemListManager);
}

void sub_244321E1C()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_244321E2C(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosMappingItemListManager<A>);
  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosMappingItemListManager<A>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244321E74()
{
  unint64_t result;

  result = qword_257356BB8;
  if (!qword_257356BB8)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356BB8);
  }
  return result;
}

uint64_t sub_244321EB0()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A2F8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for PhotosMappingItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.__allocating_init<A>(itemListManager:itemProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.itemList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.waitForItemList(timeout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of PhotosMappingItemListManager.observeChanges(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t sub_244321F88()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80)), AssociatedTypeWitness);
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244322018(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_244321A10(a1, a2, v2 + v6, *(void (**)(char *))(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

uint64_t Int.times(_:)(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t (*v4)(void);

  if (a3 >= 1)
  {
    v3 = a3;
    v4 = (uint64_t (*)(void))result;
    do
    {
      result = v4();
      --v3;
    }
    while (v3);
  }
  return result;
}

uint64_t PhotosStrongObjectReference.init(_:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t result;

  result = sub_24437A448();
  *a2 = a1;
  a2[1] = result;
  return result;
}

uint64_t PhotosStrongObjectReference.objectIdentifierHash.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t PhotosStrongObjectReference.hashValue.getter(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE v6[72];
  uint64_t v7;
  uint64_t v8;

  v3 = v1[1];
  v7 = *v1;
  v8 = v3;
  OUTLINED_FUNCTION_4_0();
  v4 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosStrongObjectReference<A>, a1);
  PhotosObjectReference.hash(into:)((uint64_t)v6, a1, v4);
  return sub_24437AB14();
}

uint64_t PhotosObjectReference.init(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t v6;

  if (a1)
  {
    (*(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(a3 + 24))(a4, a1, a2);
    v6 = 0;
  }
  else
  {
    v6 = 1;
  }
  return __swift_storeEnumTagSinglePayload((uint64_t)a4, v6, 1, a2);
}

uint64_t sub_244322234(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosStrongObjectReference<A>);
  return PhotosObjectReference.hash(into:)(a1, a2, v4);
}

uint64_t PhotosObjectReference.hash(into:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  return sub_24437AB08();
}

uint64_t sub_2443222A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[72];

  sub_24437AAFC();
  v3 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosStrongObjectReference<A>, a2);
  PhotosObjectReference.hash(into:)((uint64_t)v5, a2, v3);
  return sub_24437AB14();
}

uint64_t sub_2443222FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosStrongObjectReference<A>, a3);
  return static PhotosObjectReference.== infix(_:_:)(a1, a2, a3, v6) & 1;
}

uint64_t static PhotosObjectReference.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v25;

  v8 = *(_QWORD *)(a3 - 8);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v11 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v25 - v12;
  v15 = *(uint64_t (**)(uint64_t, uint64_t))(v14 + 48);
  v17 = v15(v16, v14);
  v18 = v15(a3, a4);
  v19 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v19(v13, a1, a3);
  v19(v11, a2, a3);
  if (v17 != v18)
  {
LABEL_7:
    v22 = 0;
    goto LABEL_8;
  }
  v20 = OUTLINED_FUNCTION_3_0();
  v21 = OUTLINED_FUNCTION_3_0();
  v22 = v21;
  if (!v20)
  {
    if (!v21)
    {
      swift_unknownObjectRelease();
      v22 = 1;
      goto LABEL_8;
    }
    swift_unknownObjectRelease();
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  if (v22)
    v22 = v20 == v22;
LABEL_8:
  v23 = *(void (**)(char *, uint64_t))(v8 + 8);
  v23(v11, a3);
  v23(v13, a3);
  return v22;
}

uint64_t PhotosWeakObjectReference.init(_:)@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  swift_unknownObjectWeakInit();
  OUTLINED_FUNCTION_2_2();
  v2 = sub_24437A448();
  result = swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = v2;
  return result;
}

uint64_t sub_244322510@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  _BYTE v11[16];

  v7 = type metadata accessor for PhotosWeakObjectReference(0, *(_QWORD *)(a3 + a2 - 8), a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  v9 = MEMORY[0x24950D424](v11);
  result = (*(uint64_t (**)(_BYTE *, uint64_t))(v8 + 8))(v11, v7);
  *a5 = v9;
  return result;
}

uint64_t PhotosWeakObjectReference.object.setter()
{
  OUTLINED_FUNCTION_2_2();
  return OUTLINED_FUNCTION_0_4();
}

uint64_t (*PhotosWeakObjectReference.object.modify(_QWORD *a1))()
{
  uint64_t v1;

  a1[1] = v1;
  *a1 = MEMORY[0x24950D424](v1);
  return sub_2443225E4;
}

uint64_t sub_2443225E4()
{
  swift_unknownObjectWeakAssign();
  return OUTLINED_FUNCTION_0_4();
}

void PhotosWeakObjectReference.objectIfExists.getter()
{
  JUMPOUT(0x24950D424);
}

uint64_t PhotosWeakObjectReference.objectIdentifierHash.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t PhotosWeakObjectReference.hashValue.getter(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  OUTLINED_FUNCTION_4_0();
  v2 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, a1);
  PhotosObjectReference.hash(into:)((uint64_t)v4, a1, v2);
  return sub_24437AB14();
}

uint64_t sub_24432267C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>);
  return PhotosObjectReference.hash(into:)(a1, a2, v4);
}

uint64_t sub_2443226BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _BYTE v5[72];

  sub_24437AAFC();
  v3 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, a2);
  PhotosObjectReference.hash(into:)((uint64_t)v5, a2, v3);
  return sub_24437AB14();
}

uint64_t sub_244322710(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosStrongObjectReference<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_24432273C()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_24432274C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_244322778()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_244322788(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;

  v6 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, a3);
  return static PhotosObjectReference.== infix(_:_:)(a1, a2, a3, v6) & 1;
}

uint64_t sub_2443227E0()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2443227F0()
{
  return 8;
}

_QWORD *sub_2443227FC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_244322808()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_244322810(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_24432283C()
{
  return swift_unknownObjectRelease();
}

_QWORD *sub_244322844(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *sub_244322890(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_unknownObjectRelease();
  a1[1] = a2[1];
  return a1;
}

uint64_t sub_2443228CC(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 16))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_24432290C(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for PhotosStrongObjectReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosStrongObjectReference);
}

uint64_t sub_244322958(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_244322980(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_2443229A8(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t sub_2443229D0(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(result + 8) = *(_QWORD *)(a2 + 8);
  return result;
}

uint64_t type metadata accessor for PhotosWeakObjectReference(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosWeakObjectReference);
}

uint64_t dispatch thunk of PhotosObjectReference.init(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of PhotosObjectReference.objectIfExists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosObjectReference.objectIdentifierHash.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t OUTLINED_FUNCTION_0_4()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_1_1()
{
  return swift_unknownObjectRetain();
}

uint64_t OUTLINED_FUNCTION_2_2()
{
  return swift_unknownObjectWeakAssign();
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(v0, v1);
}

uint64_t OUTLINED_FUNCTION_4_0()
{
  return sub_24437AAFC();
}

uint64_t dispatch thunk of PhotosItemCounts.numberOfItemCollections.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosItemCounts.numberOfCollectionLists.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

id PhotosDebugColorOverlayView.__allocating_init(tintColor:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return PhotosDebugColorOverlayView.init(tintColor:)(a1);
}

id PhotosDebugColorOverlayView.init(tintColor:)(void *a1)
{
  void *v1;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;

  v10.receiver = v1;
  v10.super_class = (Class)type metadata accessor for PhotosDebugColorOverlayView();
  v3 = objc_msgSendSuper2(&v10, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  v4 = objc_msgSend(a1, sel_colorWithAlphaComponent_, 0.2);
  objc_msgSend(v3, sel_setBackgroundColor_, v4);

  v5 = OUTLINED_FUNCTION_0_5();
  v6 = objc_msgSend(a1, sel_colorWithAlphaComponent_, 0.8);
  v7 = objc_msgSend(v6, sel_CGColor);

  objc_msgSend(v5, sel_setBorderColor_, v7);
  v8 = OUTLINED_FUNCTION_0_5();

  objc_msgSend(v8, sel_setBorderWidth_, 5.0);
  return v3;
}

uint64_t type metadata accessor for PhotosDebugColorOverlayView()
{
  return objc_opt_self();
}

void sub_244322C0C()
{
  sub_24437A9B8();
  __break(1u);
}

id PhotosDebugColorOverlayView.__allocating_init(frame:)(double a1, double a2, double a3, double a4)
{
  objc_class *v4;

  return objc_msgSend(objc_allocWithZone(v4), sel_initWithFrame_, a1, a2, a3, a4);
}

void PhotosDebugColorOverlayView.init(frame:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PhotosDebugColorOverlayView.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosDebugColorOverlayView();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for PhotosDebugColorOverlayView()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosDebugColorOverlayView.__allocating_init(tintColor:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

id OUTLINED_FUNCTION_0_5()
{
  void *v0;
  uint64_t v1;

  return objc_msgSend(v0, (SEL)(v1 + 3656));
}

BOOL sub_244322D50(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

void sub_244322D5C(char a1)
{
  __asm { BR              X11 }
}

uint64_t sub_244322DA8(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_244322E04 + 4 * byte_244389204[a2]))(0x6E6F6974636573);
}

uint64_t sub_244322E04(uint64_t a1)
{
  uint64_t v1;
  char v3;

  if (a1 == 0x6E6F6974636573 && v1 == 0xE700000000000000)
    v3 = 1;
  else
    v3 = sub_24437AA6C();
  OUTLINED_FUNCTION_9();
  swift_bridgeObjectRelease();
  return v3 & 1;
}

BOOL sub_244322E8C(char a1, char a2)
{
  return a1 == a2;
}

double PXDisplayAsset.pixelSize.getter()
{
  void *v0;
  id v1;

  v1 = objc_msgSend(v0, sel_pixelWidth);
  objc_msgSend(v0, sel_pixelHeight);
  return (double)(uint64_t)v1;
}

unint64_t PXDisplayAssetMediaType.description.getter(uint64_t a1)
{
  unint64_t result;
  uint64_t v3;

  result = 0x6E776F6E6B6E75;
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = 0x6567616D69;
      break;
    case 2:
      v3 = 1701079414;
      goto LABEL_6;
    case 3:
      v3 = 1768191329;
LABEL_6:
      result = v3 & 0xFFFF0000FFFFFFFFLL | 0x6F00000000;
      break;
    default:
      result = 0x726F727265;
      break;
  }
  return result;
}

unint64_t sub_244322F64()
{
  uint64_t *v0;

  return PXDisplayAssetMediaType.description.getter(*v0);
}

uint64_t PXDisplayAssetMediaSubtype.description.getter(int a1)
{
  int64_t v1;
  uint64_t v2;
  _QWORD *v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unint64_t v10;
  char v11;
  _QWORD *v12;
  unint64_t v13;
  unsigned int v14;
  uint64_t v15;
  unint64_t v16;
  unsigned int v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  unint64_t v22;
  unint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  unsigned int v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unsigned int v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  char v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  int64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  _QWORD *v51;
  int64_t v52;
  uint64_t v53;
  uint64_t v54;
  _QWORD *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  int64_t v60;
  uint64_t v61;
  uint64_t v62;
  _QWORD *v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  _QWORD *v67;
  int64_t v68;
  uint64_t v69;
  uint64_t v70;
  _QWORD *v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD *v75;
  int64_t v76;
  uint64_t v77;
  uint64_t v78;
  _QWORD *v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  _QWORD *v83;
  int64_t v84;
  uint64_t v85;
  uint64_t v86;
  _QWORD *v87;
  char v88;
  uint64_t v89;
  uint64_t v90;
  _QWORD *v91;
  int64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD *v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  int64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD *v103;
  char v104;
  uint64_t v105;
  uint64_t v106;
  _QWORD *v107;
  int64_t v108;
  uint64_t v109;
  uint64_t v110;
  _QWORD *v111;
  char v112;
  uint64_t v113;
  uint64_t v114;
  _QWORD *v115;
  int64_t v116;
  uint64_t v117;
  uint64_t v118;
  _QWORD *v119;
  char v120;
  uint64_t v121;
  uint64_t v122;
  _QWORD *v123;

  if ((a1 & 1) != 0)
  {
    sub_2443236DC(0, 1, 1, MEMORY[0x24BEE4AF8], &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v5;
    v7 = v5[2];
    v6 = v5[3];
    v1 = v7 + 1;
    if (v7 >= v6 >> 1)
    {
      v40 = OUTLINED_FUNCTION_1_2(v6);
      OUTLINED_FUNCTION_0_6(v40, v7 + 1, v41, v42, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v43;
    }
    v4[2] = v1;
    OUTLINED_FUNCTION_10();
    *(_QWORD *)(v9 + 32) = v8 | 0x6E61506F00000000;
    *(_QWORD *)(v9 + 40) = 0xED0000616D61726FLL;
  }
  else
  {
    v4 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  if ((a1 & 2) != 0)
  {
    if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_0_6(0, v44, v45, v46, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v47;
    }
    OUTLINED_FUNCTION_7_0();
    if (v11)
    {
      v48 = OUTLINED_FUNCTION_1_2(v10);
      OUTLINED_FUNCTION_0_6(v48, v1, v49, v50, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v51;
    }
    v4[2] = v1;
    v12 = &v4[2 * v2];
    v12[4] = 0x5244486F746F6870;
    v12[5] = 0xE800000000000000;
    if ((a1 & 4) == 0)
    {
LABEL_8:
      if ((a1 & 8) == 0)
        goto LABEL_25;
      goto LABEL_20;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_8;
  }
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v52, v53, v54, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v55;
  }
  OUTLINED_FUNCTION_7_0();
  if (v11)
  {
    v56 = OUTLINED_FUNCTION_1_2(v13);
    OUTLINED_FUNCTION_0_6(v56, v1, v57, v58, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v59;
  }
  v4[2] = v1;
  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v15 + 32) = v14 | 0x7263536F00000000;
  *(_QWORD *)(v15 + 40) = 0xEF746F68736E6565;
  if ((a1 & 8) != 0)
  {
LABEL_20:
    if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_0_6(0, v60, v61, v62, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v63;
    }
    OUTLINED_FUNCTION_7_0();
    if (v11)
    {
      v64 = OUTLINED_FUNCTION_1_2(v16);
      OUTLINED_FUNCTION_0_6(v64, v1, v65, v66, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v67;
    }
    v4[2] = v1;
    OUTLINED_FUNCTION_10();
    *(_QWORD *)(v18 + 32) = v17 | 0x76694C6F00000000;
    *(_QWORD *)(v18 + 40) = 0xE900000000000065;
  }
LABEL_25:
  if ((a1 & 0x10) != 0)
  {
    if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_0_6(0, v68, v69, v70, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v71;
    }
    v20 = v4[2];
    v19 = v4[3];
    v1 = v20 + 1;
    if (v20 >= v19 >> 1)
    {
      v72 = OUTLINED_FUNCTION_1_2(v19);
      OUTLINED_FUNCTION_0_6(v72, v20 + 1, v73, v74, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v75;
    }
    v4[2] = v1;
    v21 = &v4[2 * v20];
    v21[4] = 0xD000000000000010;
    v21[5] = 0x8000000244382580;
    if ((a1 & 0x200) == 0)
    {
LABEL_27:
      if ((a1 & 0x800000) == 0)
        goto LABEL_28;
      goto LABEL_43;
    }
  }
  else if ((a1 & 0x200) == 0)
  {
    goto LABEL_27;
  }
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v76, v77, v78, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v79;
  }
  v23 = v4[2];
  v22 = v4[3];
  v1 = v23 + 1;
  if (v23 >= v22 >> 1)
  {
    v80 = OUTLINED_FUNCTION_1_2(v22);
    OUTLINED_FUNCTION_0_6(v80, v23 + 1, v81, v82, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v83;
  }
  v4[2] = v1;
  v24 = &v4[2 * v23];
  v24[4] = 0x5244486F746F6870;
  v24[5] = 0xEF70614D6E696147;
  if ((a1 & 0x800000) == 0)
  {
LABEL_28:
    if ((a1 & 0x10000) == 0)
      goto LABEL_29;
    goto LABEL_48;
  }
LABEL_43:
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v84, v85, v86, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v87;
  }
  OUTLINED_FUNCTION_5_0();
  if (v11)
  {
    v88 = OUTLINED_FUNCTION_1_2(v25);
    OUTLINED_FUNCTION_0_6(v88, v1, v89, v90, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v91;
  }
  v4[2] = v1;
  OUTLINED_FUNCTION_10();
  *(_QWORD *)(v27 + 32) = v26 | 0x5244586F00000000;
  *(_QWORD *)(v27 + 40) = 0xE800000000000000;
  if ((a1 & 0x10000) == 0)
  {
LABEL_29:
    if ((a1 & 0x20000) == 0)
      goto LABEL_30;
    goto LABEL_53;
  }
LABEL_48:
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v92, v93, v94, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v95;
  }
  OUTLINED_FUNCTION_5_0();
  if (v11)
  {
    v96 = OUTLINED_FUNCTION_1_2(v28);
    OUTLINED_FUNCTION_0_6(v96, v1, v97, v98, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v99;
  }
  OUTLINED_FUNCTION_11();
  *(_QWORD *)(v30 + 32) = v29 | 0x7274536F00000000;
  *(_QWORD *)(v30 + 40) = 0xED000064656D6165;
  if ((a1 & 0x20000) == 0)
  {
LABEL_30:
    if ((a1 & 0x40000) == 0)
      goto LABEL_31;
    goto LABEL_58;
  }
LABEL_53:
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v100, v101, v102, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v103;
  }
  OUTLINED_FUNCTION_5_0();
  if (v11)
  {
    v104 = OUTLINED_FUNCTION_1_2(v31);
    OUTLINED_FUNCTION_0_6(v104, v1, v105, v106, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v107;
  }
  v4[2] = v1;
  v4[0x48890DEE8DED0E4] = 0xD000000000000012;
  v4[0x48890DEE8DED0E5] = 0x8000000244382560;
  if ((a1 & 0x40000) == 0)
  {
LABEL_31:
    if ((a1 & 0x100000) == 0)
      goto LABEL_68;
    goto LABEL_63;
  }
LABEL_58:
  if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
  {
    OUTLINED_FUNCTION_3_1();
    OUTLINED_FUNCTION_0_6(0, v108, v109, v110, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v111;
  }
  OUTLINED_FUNCTION_5_0();
  if (v11)
  {
    v112 = OUTLINED_FUNCTION_1_2(v32);
    OUTLINED_FUNCTION_0_6(v112, v1, v113, v114, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
    v4 = v115;
  }
  OUTLINED_FUNCTION_11();
  *(_QWORD *)(v34 + 32) = v33 | 0x6D69546F00000000;
  *(_QWORD *)(v34 + 40) = 0xEE00657370616C65;
  if ((a1 & 0x100000) != 0)
  {
LABEL_63:
    if ((OUTLINED_FUNCTION_2_3() & 1) == 0)
    {
      OUTLINED_FUNCTION_3_1();
      OUTLINED_FUNCTION_0_6(0, v116, v117, v118, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v119;
    }
    v36 = v4[2];
    v35 = v4[3];
    if (v36 >= v35 >> 1)
    {
      v120 = OUTLINED_FUNCTION_1_2(v35);
      OUTLINED_FUNCTION_0_6(v120, v36 + 1, v121, v122, &qword_257357588, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_2443238A8, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
      v4 = v123;
    }
    v4[2] = v36 + 1;
    v37 = &v4[2 * v36];
    v37[4] = 0x5244486F65646976;
    v37[5] = 0xE800000000000000;
  }
LABEL_68:
  __swift_instantiateConcreteTypeFromMangledName(&qword_257357578);
  sub_24432367C();
  v38 = sub_24437A418();
  swift_bridgeObjectRelease();
  return v38;
}

uint64_t sub_244323650()
{
  _QWORD *v0;

  return PXDisplayAssetMediaSubtype.description.getter(*v0);
}

uint64_t sub_244323658@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a2 & result;
  return result;
}

uint64_t sub_244323664(uint64_t a1, uint64_t a2)
{
  return a2 & a1;
}

BOOL sub_244323670(uint64_t a1, uint64_t a2)
{
  return (a2 & ~a1) == 0;
}

unint64_t sub_24432367C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257357580;
  if (!qword_257357580)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257357578);
    result = MEMORY[0x24950D28C](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_257357580);
  }
  return result;
}

void sub_2443236C0(char a1, int64_t a2, char a3, uint64_t a4)
{
  sub_2443236DC(a1, a2, a3, a4, &qword_257356F38, (void (*)(_QWORD, uint64_t, _QWORD *, uint64_t))sub_24432399C, (void (*)(uint64_t, uint64_t, _QWORD *))sub_24433D3A4);
}

void sub_2443236DC(char a1, int64_t a2, char a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  unint64_t v11;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  size_t v16;
  _QWORD *v17;

  if ((a3 & 1) != 0)
  {
    v11 = *(_QWORD *)(a4 + 24);
    v12 = v11 >> 1;
    if ((uint64_t)(v11 >> 1) < a2)
    {
      if (v12 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v12 = v11 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v11 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v12 = a2;
    }
  }
  else
  {
    v12 = a2;
  }
  v13 = *(_QWORD *)(a4 + 16);
  if (v12 <= v13)
    v14 = *(_QWORD *)(a4 + 16);
  else
    v14 = v12;
  if (v14)
  {
    __swift_instantiateConcreteTypeFromMangledName(a5);
    v15 = (_QWORD *)swift_allocObject();
    v16 = _swift_stdlib_malloc_size(v15);
    v15[2] = v13;
    v15[3] = 2 * ((uint64_t)(v16 - 32) / 16);
  }
  else
  {
    v15 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v17 = v15 + 4;
  if ((a1 & 1) != 0)
  {
    a7(a4 + 32, v13, v17);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_9();
  }
  else
  {
    a6(0, v13, v17, a4);
  }
  OUTLINED_FUNCTION_0_3();
}

void sub_2443237C4(char a1, int64_t a2, char a3, uint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257356F30);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 24);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  if ((a1 & 1) != 0)
  {
    sub_24433D44C((char *)(a4 + 32), v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
    OUTLINED_FUNCTION_9();
  }
  else
  {
    sub_244323AB0(0, v8, (unint64_t)v12, a4);
  }
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_2443238A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_24437AA0C();
  __break(1u);
  return result;
}

uint64_t sub_24432399C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_257356D68);
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_24437AA0C();
  __break(1u);
  return result;
}

uint64_t sub_244323AB0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 24 * a1 + 32;
    v6 = a3 + 24 * v4;
    if (v5 >= v6 || v5 + 24 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      swift_bridgeObjectRelease();
      return v6;
    }
  }
  result = sub_24437AA0C();
  __break(1u);
  return result;
}

void *sub_244323BB0(char *__src, uint64_t a2, char *__dst)
{
  void *result;

  if ((a2 & 0x8000000000000000) == 0 && (&__dst[8 * a2] <= __src || &__src[8 * a2] <= __dst))
    return memcpy(__dst, __src, 8 * a2);
  OUTLINED_FUNCTION_4_1();
  result = (void *)OUTLINED_FUNCTION_12();
  __break(1u);
  return result;
}

uint64_t sub_244323C58(unint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  if ((a2 & 0x8000000000000000) == 0 && (a3 + 24 * a2 <= a1 || a1 + 24 * a2 <= a3))
    return swift_arrayInitWithCopy();
  OUTLINED_FUNCTION_4_1();
  result = OUTLINED_FUNCTION_12();
  __break(1u);
  return result;
}

void OUTLINED_FUNCTION_0_6(char a1, int64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, void (*a6)(_QWORD, uint64_t, _QWORD *, uint64_t), void (*a7)(uint64_t, uint64_t, _QWORD *))
{
  uint64_t v7;

  sub_2443236DC(a1, a2, 1, v7, a5, a6, a7);
}

BOOL OUTLINED_FUNCTION_1_2@<W0>(unint64_t a1@<X8>)
{
  return a1 > 1;
}

uint64_t OUTLINED_FUNCTION_2_3()
{
  return swift_isUniquelyReferenced_nonNull_native();
}

uint64_t OUTLINED_FUNCTION_8_0(uint64_t result)
{
  _QWORD *v1;

  *v1 &= result;
  return result;
}

uint64_t OUTLINED_FUNCTION_9()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_11()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_24437AA0C();
}

uint64_t PhotosWeakList.init()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result;

  type metadata accessor for PhotosWeakObjectReference(0, a1, a2, a3);
  result = sub_24437A568();
  *a4 = result;
  return result;
}

uint64_t PhotosWeakList.append(_:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  swift_unknownObjectRetain();
  v4 = PhotosWeakObjectReference.init(_:)((uint64_t)&v13);
  v8 = OUTLINED_FUNCTION_0_7(v4, v5, v6, v7);
  sub_24437A5E0();
  sub_24437A598();
  result = MEMORY[0x24950BEB8](*v2, v8);
  if (!(result % 100))
    return sub_244323E74(a2, v10, v11, v12);
  return result;
}

uint64_t sub_244323E74(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for PhotosWeakObjectReference(255, *(_QWORD *)(a1 + 16), a3, a4);
  v4 = sub_24437A5E0();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12B8], v4);
  MEMORY[0x24950D28C](MEMORY[0x24BEE12E8], v4);
  return sub_24437A790();
}

uint64_t PhotosWeakList.remove(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  type metadata accessor for PhotosWeakObjectReference(255, *(_QWORD *)(a2 + 16), a3, a4);
  v4 = OUTLINED_FUNCTION_1_3();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12B8], v4);
  MEMORY[0x24950D28C](MEMORY[0x24BEE12E8], v4);
  return sub_24437A790();
}

BOOL sub_244323F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  _BYTE v15[16];

  v6 = MEMORY[0x24950D424]();
  swift_unknownObjectRelease();
  v9 = type metadata accessor for PhotosWeakObjectReference(0, a3, v7, v8);
  v10 = *(_QWORD *)(v9 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v10 + 16))(v15, a1, v9);
  if (v6)
  {
    v11 = MEMORY[0x24950D424](v15);
    if (v11)
    {
      v12 = v11;
      swift_unknownObjectRelease();
      v13 = v12 == a2;
    }
    else
    {
      v13 = 0;
    }
  }
  else
  {
    v13 = 1;
  }
  (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v15, v9);
  return v13;
}

uint64_t PhotosWeakList.objects.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_7(a1, a2, a3, a4);
  v4 = OUTLINED_FUNCTION_1_3();
  swift_bridgeObjectRetain();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v4);
  v5 = sub_24437A4D8();
  swift_bridgeObjectRelease();
  return v5;
}

BOOL sub_2443240D0()
{
  uint64_t v0;

  v0 = MEMORY[0x24950D424]();
  if (v0)
    swift_unknownObjectRelease();
  return v0 == 0;
}

BOOL sub_24432410C(uint64_t a1)
{
  uint64_t v1;

  return sub_244323F84(a1, *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 16));
}

uint64_t sub_244324128@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = MEMORY[0x24950D424]();
  *a1 = result;
  return result;
}

uint64_t type metadata accessor for PhotosWeakList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosWeakList);
}

BOOL sub_244324160()
{
  return sub_2443240D0();
}

uint64_t OUTLINED_FUNCTION_0_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  return type metadata accessor for PhotosWeakObjectReference(255, v4, a3, a4);
}

uint64_t OUTLINED_FUNCTION_1_3()
{
  return sub_24437A5E0();
}

uint64_t photosAssertionFailure(log:_:file:line:)(void *a1, uint64_t a2, unint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v6 = sub_24437A31C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_2_4();
  v10 = v9 - v8;
  v11 = a1;
  sub_24437A328();
  photosAssertionFailure(logger:_:file:line:)(v10, a2, a3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v10, v6);
}

void photosAssertionFailure(logger:_:file:line:)(uint64_t a1, uint64_t a2, unint64_t a3)
{
  os_log_type_t v5;
  uint8_t *v6;
  NSObject *oslog;
  uint64_t v8;

  swift_bridgeObjectRetain_n();
  oslog = sub_24437A304();
  v5 = sub_24437A79C();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v8 = OUTLINED_FUNCTION_1_4();
    *(_DWORD *)v6 = 136315138;
    swift_bridgeObjectRetain();
    sub_24432469C(a2, a3, &v8);
    sub_24437A820();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24430E000, oslog, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_8();
  }
  swift_bridgeObjectRelease_n();

}

void photosAssert(_:logger:_:file:line:)(char a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if ((a1 & 1) == 0)
    photosAssertionFailure(logger:_:file:line:)(a2, a3, a4);
}

uint64_t photosUnwrapOrError<A>(_:_:_:logger:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v10;
  uint64_t v11;
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
  char *v22;
  int EnumTagSinglePayload;
  unint64_t v24;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v32 = a5;
  v33 = a4;
  v31 = a3;
  v34 = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_257357590);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_4();
  v13 = v12 - v11;
  v14 = sub_24437A31C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2_4();
  v18 = v17 - v16;
  v19 = sub_24437A808();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v29 - v21;
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))((char *)&v29 - v21, a1, v19);
  if (__swift_getEnumTagSinglePayload((uint64_t)v22, 1, a6) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(a7, v22, a6);
  v30 = a7;
  (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  sub_244324E10(v32, v13);
  EnumTagSinglePayload = __swift_getEnumTagSinglePayload(v13, 1, v14);
  v24 = v33;
  if (EnumTagSinglePayload == 1)
  {
    sub_24437A4A8();
    sub_24437A310();
    sub_244324E58(v13);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 32))(v18, v13, v14);
  }
  swift_bridgeObjectRetain_n();
  v26 = sub_24437A304();
  v27 = sub_24437A79C();
  if (os_log_type_enabled(v26, v27))
  {
    v32 = v14;
    v28 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v36 = OUTLINED_FUNCTION_1_4();
    *(_DWORD *)v28 = 136315138;
    swift_bridgeObjectRetain();
    v35 = sub_24432469C(v31, v24, &v36);
    sub_24437A820();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_24430E000, v26, v27, "%s", v28, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_8();
  }

  swift_bridgeObjectRelease_n();
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 16))(v30, v34, a6);
}

uint64_t sub_24432469C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_24432476C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_244324EB8((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_244324EB8((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_24432476C(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_2443248C0((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_24437A82C();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_244324984(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_24437A8F8();
    if (!v8)
    {
      result = sub_24437A9AC();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_2443248C0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_24437AA0C();
  __break(1u);
  return result;
}

uint64_t sub_244324984(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_244324A18(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_244324BEC(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_244324BEC((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_244324A18(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_24437A4B4();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x24BEE4AF8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x24BEE4AF8];
LABEL_6:
  v3 = sub_244324B88(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_24437A8BC();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_24437AA0C();
  __break(1u);
LABEL_14:
  result = sub_24437A9AC();
  __break(1u);
  return result;
}

_QWORD *sub_244324B88(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257357598);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_244324BEC(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257357598);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_244324D84(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244324CC0(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_244324CC0(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_24437AA0C();
  __break(1u);
  return result;
}

char *sub_244324D84(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_24437AA0C();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_244324E10(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257357590);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_244324E58(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257357590);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
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

uint64_t sub_244324EB8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void OUTLINED_FUNCTION_0_8()
{
  JUMPOUT(0x24950D370);
}

uint64_t OUTLINED_FUNCTION_1_4()
{
  return swift_slowAlloc();
}

Swift::Int __swiftcall NSUserDefaults.integer(forKey:defaultValue:)(Swift::String forKey, Swift::Int defaultValue)
{
  void *v2;
  void *v4;
  id v5;
  void *v6;
  _OWORD v8[2];

  v4 = (void *)sub_24437A460();
  v5 = objc_msgSend(v2, sel_objectForKey_, v4);

  if (v5)
  {
    sub_24437A838();
    swift_unknownObjectRelease();
    sub_244324FE4((uint64_t)v8);
    v6 = (void *)sub_24437A460();
    defaultValue = (Swift::Int)objc_msgSend(v2, sel_integerForKey_, v6);

  }
  else
  {
    memset(v8, 0, sizeof(v8));
    sub_244324FE4((uint64_t)v8);
  }
  return defaultValue;
}

uint64_t sub_244324FE4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257355AF0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

id PhotosScreenEdgeDismissalSlideTransition.__allocating_init(foregroundViewLateralInset:)(double a1)
{
  objc_class *v1;
  char *v3;
  objc_super v5;

  v3 = (char *)objc_allocWithZone(v1);
  *(double *)&v3[OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset] = a1;
  v5.receiver = v3;
  v5.super_class = v1;
  return objc_msgSendSuper2(&v5, sel_init);
}

id PhotosScreenEdgeDismissalSlideTransition.init(foregroundViewLateralInset:)(double a1)
{
  char *v1;
  objc_super v3;

  *(double *)&v1[OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset] = a1;
  v3.receiver = v1;
  v3.super_class = (Class)type metadata accessor for PhotosScreenEdgeDismissalSlideTransition();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for PhotosScreenEdgeDismissalSlideTransition()
{
  return objc_opt_self();
}

double sub_2443250CC()
{
  return 0.4;
}

uint64_t sub_2443250E4(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  __int128 v5;
  CGFloat v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  CGFloat v16;
  uint64_t v17;
  CGFloat v18;
  uint64_t v19;
  CGFloat a;
  id v21;
  id v22;
  CGFloat v23;
  id v24;
  uint64_t v25;
  unsigned __int8 v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  unsigned __int8 v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  CGFloat *v36;
  uint64_t v37;
  id v38;
  id v39;
  id v40;
  id v41;
  uint64_t result;
  CGFloat tx;
  CGFloat ty;
  CGFloat c;
  CGFloat d;
  CGFloat b;
  void *v48;
  CGAffineTransform v49;
  CGAffineTransform v50;
  __int128 v51;
  double v52;
  double v53;
  double v54;
  double v55;
  CGRect v56;
  CGRect v57;

  v2 = v1;
  v4 = objc_msgSend(a1, sel_containerView);
  type metadata accessor for PhotosSlideTransition();
  sub_24433904C(a1, &v51);
  v5 = v51;
  v6 = v52;
  v7 = v53;
  v8 = v54;
  v9 = v55;
  v10 = OUTLINED_FUNCTION_4_2();
  v11 = OUTLINED_FUNCTION_4_2();
  v12 = objc_msgSend(a1, sel_viewControllerForKey_, *MEMORY[0x24BEBE9B0]);
  if (v10)
  {
    v13 = v12;
    v14 = *(double *)(v2
                    + OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset)
        + *(double *)(v2
                    + OBJC_IVAR____TtC18PhotosUIFoundation40PhotosScreenEdgeDismissalSlideTransition_foregroundViewLateralInset);
    v15 = v10;
    OUTLINED_FUNCTION_1_5((uint64_t)v15, sel_bounds);
    v16 = 1.0 - v14 / CGRectGetWidth(v56);
    OUTLINED_FUNCTION_1_5(v17, sel_bounds);
    v18 = (1.0 - v16) * CGRectGetHeight(v57) * 0.5;
    v19 = 0;
    CGAffineTransformMakeTranslation(&v50, 0.0, v18);
    CGAffineTransformScale(&v49, &v50, v16, v16);
    a = v49.a;
    d = v49.d;
    b = v49.b;
    tx = v49.tx;
    ty = v49.ty;
    c = v49.c;
    v48 = v13;
    if (v11)
    {
      if (v13)
      {
        v21 = v11;
        v22 = v13;
        objc_msgSend(a1, sel_finalFrameForViewController_, v22);
        objc_msgSend(v21, sel_setFrame_);
        *(_OWORD *)&v50.a = v5;
        v50.c = v6;
        v50.d = v7;
        v50.tx = v8;
        v50.ty = v9;
        objc_msgSend(v21, sel_setTransform_, &v50);
        objc_msgSend(v4, sel_insertSubview_belowSubview_, v21, v15);

      }
      v23 = a;
      v24 = v11;
      objc_msgSend(v24, sel__continuousCornerRadius);
      v19 = v25;
      v26 = objc_msgSend(v24, sel_clipsToBounds);

      v27 = v24;
      objc_msgSend(v27, sel__setContinuousCornerRadius_, 10.0);
      objc_msgSend(v27, sel_setClipsToBounds_, 1);

    }
    else
    {
      v23 = v49.a;
      v26 = 2;
    }
    objc_msgSend(v15, sel__continuousCornerRadius);
    v29 = v28;
    v30 = objc_msgSend(v15, sel_clipsToBounds);
    objc_msgSend(v15, sel__setContinuousCornerRadius_, 10.0);
    objc_msgSend(v15, sel_setClipsToBounds_, 1);
    v31 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
    v32 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
    objc_msgSend(v31, sel_setBackgroundColor_, v32);

    OUTLINED_FUNCTION_1_5(v33, sel_bounds);
    objc_msgSend(v31, sel_setFrame_);
    objc_msgSend(v4, sel_insertSubview_belowSubview_, v31, v15);
    objc_msgSend(v31, sel_setAlpha_, 0.5);
    v34 = OUTLINED_FUNCTION_0_2();
    *(_QWORD *)(v34 + 16) = v31;
    *(_QWORD *)(v34 + 24) = 0;
    *(_QWORD *)(OUTLINED_FUNCTION_0_2() + 16) = v31;
    v35 = v31;
    sub_2443257FC((uint64_t)v35, 0, (uint64_t)sub_2443259E0, v34, sub_244325A14);
    swift_release();
    swift_release();
    v36 = (CGFloat *)OUTLINED_FUNCTION_0_2();
    *((_QWORD *)v36 + 2) = v11;
    v36[3] = 1.0;
    v36[4] = 0.0;
    v36[5] = 0.0;
    v36[6] = 1.0;
    v36[7] = 0.0;
    v36[8] = 0.0;
    *((_QWORD *)v36 + 9) = v15;
    v36[10] = v23;
    v36[11] = b;
    v36[12] = c;
    v36[13] = d;
    v36[14] = tx;
    v36[15] = ty;
    v37 = OUTLINED_FUNCTION_0_2();
    *(_QWORD *)(v37 + 16) = v19;
    *(_BYTE *)(v37 + 24) = v26;
    *(_QWORD *)(v37 + 32) = v11;
    *(_QWORD *)(v37 + 40) = v15;
    *(_QWORD *)(v37 + 48) = v29;
    *(_BYTE *)(v37 + 56) = v30;
    *(_QWORD *)(v37 + 64) = a1;
    sub_244325AB0();
    v38 = v15;
    v39 = v11;
    v40 = v38;
    v41 = v39;
    swift_unknownObjectRetain();
    OUTLINED_FUNCTION_5_1();
    sub_24437A7F0();

    swift_release();
    return swift_release();
  }
  else
  {
    result = sub_24437A9B8();
    __break(1u);
  }
  return result;
}

id sub_244325628(void *a1, __int128 *a2, void *a3, __int128 *a4)
{
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;

  v9 = a4[1];
  v10 = *a4;
  v5 = *((_QWORD *)a4 + 4);
  v6 = *((_QWORD *)a4 + 5);
  v7 = a2[1];
  v11 = *a2;
  v12 = v7;
  v13 = a2[2];
  objc_msgSend(a1, sel_setTransform_, &v11);
  v11 = v10;
  v12 = v9;
  *(_QWORD *)&v13 = v5;
  *((_QWORD *)&v13 + 1) = v6;
  return objc_msgSend(a3, sel_setTransform_, &v11);
}

id sub_2443256A8(int a1, uint64_t a2, char a3, id a4, id a5, double a6, char a7, void *a8)
{
  uint64_t v13;
  _QWORD v15[6];

  if (a3 == 2)
  {
    if (!a4)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a4)
  {
    v13 = a3 & 1;
    objc_msgSend(a4, sel__setContinuousCornerRadius_, *(double *)&a2);
    objc_msgSend(a4, sel_setClipsToBounds_, v13);
LABEL_6:
    v15[0] = 0x3FF0000000000000;
    v15[1] = 0;
    v15[2] = 0;
    v15[3] = 0x3FF0000000000000;
    v15[4] = 0;
    v15[5] = 0;
    objc_msgSend(a4, sel_setTransform_, v15);
  }
LABEL_7:
  objc_msgSend(a5, sel__setContinuousCornerRadius_, a6);
  objc_msgSend(a5, sel_setClipsToBounds_, a7 & 1);
  return objc_msgSend(a8, sel_completeTransition_, objc_msgSend(a8, sel_transitionWasCancelled) ^ 1);
}

void sub_2443257FC(uint64_t a1, char a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((a2 & 1) != 0)
  {
    sub_244325AB0();
    OUTLINED_FUNCTION_5_1();
    sub_24437A7F0();
  }
  else
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = OUTLINED_FUNCTION_2_5((uint64_t)sub_244321468, MEMORY[0x24BDAC760], 1107296256, v8, v10);
    swift_retain();
    swift_release();
    if (a5)
    {
      a5 = OUTLINED_FUNCTION_2_5((uint64_t)sub_244338C2C, v6, 1107296256, v9, v11);
      swift_retain();
      swift_release();
    }
    objc_msgSend((id)objc_opt_self(), sel_animateWithDuration_animations_completion_, v7, a5, 0.4);
    _Block_release(a5);
    _Block_release(v7);
  }
}

id PhotosScreenEdgeDismissalSlideTransition.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PhotosScreenEdgeDismissalSlideTransition.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PhotosScreenEdgeDismissalSlideTransition.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosScreenEdgeDismissalSlideTransition();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2443259C0()
{
  OUTLINED_FUNCTION_3_2();
  return swift_deallocObject();
}

id sub_2443259E0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_setAlpha_, *(double *)(v0 + 24));
}

uint64_t sub_2443259F4()
{
  OUTLINED_FUNCTION_3_2();
  return swift_deallocObject();
}

id sub_244325A14()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_removeFromSuperview);
}

uint64_t sub_244325A24()
{
  uint64_t v0;

  OUTLINED_FUNCTION_3_2();

  return swift_deallocObject();
}

id sub_244325A4C()
{
  uint64_t v0;

  return sub_244325628(*(void **)(v0 + 16), (__int128 *)(v0 + 24), *(void **)(v0 + 72), (__int128 *)(v0 + 80));
}

uint64_t sub_244325A60()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_244325A94(int a1)
{
  uint64_t v1;

  return sub_2443256A8(a1, *(_QWORD *)(v1 + 16), *(_BYTE *)(v1 + 24), *(id *)(v1 + 32), *(id *)(v1 + 40), *(double *)(v1 + 48), *(_BYTE *)(v1 + 56), *(void **)(v1 + 64));
}

unint64_t sub_244325AB0()
{
  unint64_t result;

  result = qword_257356F08;
  if (!qword_257356F08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257356F08);
  }
  return result;
}

uint64_t method lookup function for PhotosScreenEdgeDismissalSlideTransition()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.__allocating_init(foregroundViewLateralInset:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.transitionDuration(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t dispatch thunk of PhotosScreenEdgeDismissalSlideTransition.animateTransition(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x68))();
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

id OUTLINED_FUNCTION_1_5(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

void *OUTLINED_FUNCTION_2_5@<X0>(uint64_t a1@<X8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  a4 = a1;
  a5 = v5;
  return _Block_copy(&a2);
}

void OUTLINED_FUNCTION_3_2()
{
  uint64_t v0;

}

id OUTLINED_FUNCTION_4_2()
{
  uint64_t v0;
  void *v1;

  return objc_msgSend(v1, (SEL)(v0 + 2760));
}

uint64_t OUTLINED_FUNCTION_5_1()
{
  return 0;
}

void PhotosConcatenatedItemListManager.__allocating_init(mainItemListManager:prependItemListManager:appendItemListManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  swift_allocObject();
  PhotosConcatenatedItemListManager.init(mainItemListManager:prependItemListManager:appendItemListManager:)(a1, a2, a3);
}

uint64_t sub_244325BD4()
{
  uint64_t v0;

  return v0;
}

void PhotosConcatenatedItemListManager.init(mainItemListManager:prependItemListManager:appendItemListManager:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  _QWORD *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  v48 = a3;
  v6 = (_QWORD *)*v3;
  v7 = *(_QWORD *)(*v3 + 96);
  v45 = *(_QWORD *)(*v3 + 120);
  v47 = v7;
  v36 = OUTLINED_FUNCTION_7_1();
  sub_24437A808();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x24BDAC7A8](v8);
  v44 = (char *)&v32 - v9;
  v10 = v6[14];
  v46 = v6[11];
  v42 = OUTLINED_FUNCTION_7_1();
  sub_24437A808();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - v12;
  v14 = v6[13];
  v15 = v6[10];
  v33 = OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_6_0();
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v32 - v17;
  v3[6] = MEMORY[0x24BEE4AF8];
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  OUTLINED_FUNCTION_0_2();
  v3[7] = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v3[8] = objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_24437A2EC();
  v3[3] = a1;
  v3[4] = a2;
  v37 = v3;
  v3[5] = v48;
  v19 = *(void (**)(uint64_t, uint64_t))(v14 + 40);
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v34 = v18;
  v43 = a1;
  v20 = v46;
  v19(v15, v14);
  v41 = v10;
  v38 = a2;
  if (a2)
  {
    v21 = *(void (**)(uint64_t, uint64_t))(v10 + 40);
    swift_unknownObjectRetain();
    v21(v20, v10);
    swift_unknownObjectRelease();
    v22 = 0;
  }
  else
  {
    v22 = 1;
  }
  v39 = v15;
  v40 = v14;
  v23 = 1;
  v35 = v13;
  __swift_storeEnumTagSinglePayload((uint64_t)v13, v22, 1, v42);
  v24 = v45;
  if (v48)
  {
    v25 = *(void (**)(uint64_t, uint64_t))(v45 + 40);
    swift_unknownObjectRetain();
    v26 = (uint64_t)v44;
    v25(v47, v24);
    swift_unknownObjectRelease();
    v23 = 0;
  }
  else
  {
    v26 = (uint64_t)v44;
  }
  v27 = v36;
  __swift_storeEnumTagSinglePayload(v26, v23, 1, v36);
  v28 = v33;
  v32 = OUTLINED_FUNCTION_10_0();
  v29 = v42;
  v30 = OUTLINED_FUNCTION_10_0();
  v31 = OUTLINED_FUNCTION_10_0();
  v49 = v28;
  v50 = v29;
  v51 = v27;
  v52 = v32;
  v53 = v30;
  v54 = v31;
  type metadata accessor for PhotosConcatenatedItemList();
}

uint64_t sub_244325F40(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t inited;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void (*v18)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)();
  v9 = *(_QWORD *)(v7 - 312);
  *(_QWORD *)(v9 + 16) = v10;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356F40);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_244388A80;
  *(_QWORD *)(v7 - 136) = *(_QWORD *)(v7 - 264);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_4_3();
  v12 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v12[2] = v2;
  v12[3] = v4;
  v12[4] = v5;
  v12[5] = v1;
  v13 = *(_QWORD *)(v7 - 248);
  v12[6] = v6;
  v12[7] = v13;
  v12[8] = a1;
  (*(void (**)(uint64_t (*)(), _QWORD *, uint64_t))(*(_QWORD *)(v1 + 16) + 24))(sub_244326DE0, v12, v2);
  OUTLINED_FUNCTION_9_0();
  *(_QWORD *)(inited + 32) = v7 - 136;
  *(_QWORD *)(inited + 40) = v2;
  v14 = v13;
  v15 = *(_QWORD *)(v7 - 304);
  if (v15)
  {
    *(_QWORD *)(v7 - 136) = v15;
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_4_3();
    v16 = (_QWORD *)OUTLINED_FUNCTION_0_2();
    v16[2] = v3;
    v16[3] = v4;
    v16[4] = *(_QWORD *)(v7 - 232);
    v16[5] = v1;
    v16[6] = v6;
    v16[7] = v14;
    v16[8] = v7 - 136;
    v17 = *(_QWORD *)(v6 + 16);
    v18 = *(void (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v17 + 24);
    swift_unknownObjectRetain();
    v19 = v7 - 136;
    v18(sub_244326DE0, v16, v4, v17);
    OUTLINED_FUNCTION_9_0();
    swift_unknownObjectRelease();
  }
  else
  {
    v19 = 0;
    v17 = 0;
  }
  v20 = *(_QWORD *)(v7 - 224);
  *(_QWORD *)(inited + 48) = v19;
  *(_QWORD *)(inited + 56) = v17;
  v21 = v9;
  if (v20)
  {
    *(_QWORD *)(v7 - 136) = v20;
    OUTLINED_FUNCTION_0_2();
    OUTLINED_FUNCTION_4_3();
    v22 = (_QWORD *)OUTLINED_FUNCTION_0_2();
    v23 = *(_QWORD *)(v7 - 240);
    v24 = *(_QWORD *)(v7 - 232);
    v22[2] = *(_QWORD *)(v7 - 296);
    v22[3] = v23;
    v25 = *(_QWORD *)(v7 - 288);
    v22[4] = v24;
    v22[5] = v25;
    v26 = *(_QWORD *)(v7 - 248);
    v22[6] = *(_QWORD *)(v7 - 280);
    v22[7] = v26;
    v22[8] = v19;
    v27 = *(_QWORD *)(v26 + 16);
    v28 = *(uint64_t (**)(uint64_t (*)(), _QWORD *, uint64_t, uint64_t))(v27 + 24);
    swift_unknownObjectRetain();
    v29 = v28(sub_244326DE0, v22, v24, v27);
    v9 = v21;
    v30 = v29;
    v32 = v31;
    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    v30 = 0;
    v32 = 0;
  }
  *(_QWORD *)(inited + 64) = v30;
  *(_QWORD *)(inited + 72) = v32;
  if (*(_QWORD *)(inited + 32))
  {
    v9 = *(_QWORD *)(inited + 40);
    OUTLINED_FUNCTION_11_0();
    sub_2443236C0(0, 1, 1, MEMORY[0x24BEE4AF8]);
    v34 = v33;
    v35 = *(_QWORD *)(v33 + 24);
    if (*(_QWORD *)(v33 + 16) >= v35 >> 1)
    {
      OUTLINED_FUNCTION_0_9(v35);
      v34 = v39;
    }
    OUTLINED_FUNCTION_5_2();
  }
  else
  {
    v34 = MEMORY[0x24BEE4AF8];
  }
  if (*(_QWORD *)(inited + 48))
  {
    v9 = *(_QWORD *)(inited + 56);
    OUTLINED_FUNCTION_11_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_1_6(0, *(_QWORD *)(v34 + 16) + 1);
      v34 = v40;
    }
    v36 = *(_QWORD *)(v34 + 24);
    if (*(_QWORD *)(v34 + 16) >= v36 >> 1)
    {
      OUTLINED_FUNCTION_0_9(v36);
      v34 = v41;
    }
    OUTLINED_FUNCTION_5_2();
  }
  if (*(_QWORD *)(inited + 64))
  {
    v9 = *(_QWORD *)(inited + 72);
    OUTLINED_FUNCTION_11_0();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    {
      OUTLINED_FUNCTION_1_6(0, *(_QWORD *)(v34 + 16) + 1);
      v34 = v42;
    }
    v37 = *(_QWORD *)(v34 + 24);
    if (*(_QWORD *)(v34 + 16) >= v37 >> 1)
    {
      OUTLINED_FUNCTION_0_9(v37);
      v34 = v43;
    }
    OUTLINED_FUNCTION_5_2();
  }
  swift_bridgeObjectRelease();
  sub_2443262DC(v34, (uint64_t)&unk_244389458, (uint64_t)sub_244327098, (uint64_t (*)(uint64_t))MEMORY[0x24BEE4BC0]);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v9;
}

uint64_t PhotosConcatenatedItemListManager.itemList.setter(uint64_t a1)
{
  return sub_2443262DC(a1, (uint64_t)&unk_244389300, (uint64_t)sub_244326E60, (uint64_t (*)(uint64_t))MEMORY[0x24BEE4EF8]);
}

uint64_t sub_2443262DC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  swift_getKeyPath();
  sub_244326948();
  swift_release();
  return a4(a1);
}

void sub_244326370()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedConformanceWitness;
  uint64_t v24;
  uint64_t v25;
  _QWORD v26[3];
  char *v27;
  uint64_t v28;
  uint64_t AssociatedTypeWitness;
  char *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v1 = (_QWORD *)*v0;
  v2 = *(_QWORD *)(*v0 + 96);
  v27 = *(char **)(*v0 + 120);
  v28 = v2;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = sub_24437A808();
  MEMORY[0x24BDAC7A8](v3);
  v30 = (char *)v26 - v4;
  v5 = v1[14];
  v6 = v1[11];
  v7 = swift_getAssociatedTypeWitness();
  v8 = sub_24437A808();
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)v26 - v9;
  v11 = v1[13];
  v12 = v1[10];
  v13 = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](v13);
  v14 = *(void (**)(uint64_t, uint64_t))(v11 + 40);
  v26[1] = (char *)v26 - v15;
  v14(v12, v11);
  v31 = v0;
  v16 = v0[4];
  v26[2] = v6;
  v17 = v27;
  if (v16)
  {
    (*(void (**)(uint64_t, uint64_t))(v5 + 40))(v6, v5);
    v18 = 0;
  }
  else
  {
    v18 = 1;
  }
  v19 = 1;
  v27 = v10;
  __swift_storeEnumTagSinglePayload((uint64_t)v10, v18, 1, v7);
  v20 = v30;
  if (v31[5])
  {
    (*((void (**)(uint64_t, char *))v17 + 5))(v28, v17);
    v19 = 0;
  }
  v21 = (uint64_t)v20;
  v22 = AssociatedTypeWitness;
  __swift_storeEnumTagSinglePayload(v21, v19, 1, AssociatedTypeWitness);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v24 = swift_getAssociatedConformanceWitness();
  v25 = swift_getAssociatedConformanceWitness();
  v32 = v13;
  v33 = v7;
  v34 = v22;
  v35 = AssociatedConformanceWitness;
  v36 = v24;
  v37 = v25;
  type metadata accessor for PhotosConcatenatedItemList();
}

uint64_t sub_2443265CC()
{
  uint64_t v0;

  PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)();
  return PhotosConcatenatedItemListManager.itemList.setter(v0);
}

uint64_t sub_244326608()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
    sub_244326370();
  return result;
}

uint64_t sub_24432665C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v2 = *v1;
  v3 = *(_QWORD *)(a1 + *(_QWORD *)(*(_QWORD *)a1 + 152));
  v4 = PhotosConcatenatedItemListManager.itemList.getter();
  v5 = *(_QWORD *)(v4 + *(_QWORD *)(*(_QWORD *)v4 + 152));
  result = swift_release();
  if (v3 != v5)
  {
    v7 = swift_allocObject();
    swift_weakInit();
    v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = *(_OWORD *)(v2 + 80);
    *(_QWORD *)(v8 + 32) = *(_QWORD *)(v2 + 96);
    *(_OWORD *)(v8 + 40) = *(_OWORD *)(v2 + 104);
    *(_QWORD *)(v8 + 56) = *(_QWORD *)(v2 + 120);
    *(_QWORD *)(v8 + 64) = v7;
    swift_retain();
    PXObservable.performChanges(_:)((uint64_t)sub_244327050, v8);
    swift_release();
    return swift_release();
  }
  return result;
}

uint64_t PhotosConcatenatedItemListManager.itemList.getter()
{
  swift_getKeyPath();
  sub_2443268B0();
  swift_release();
  return swift_retain();
}

void sub_2443267A8()
{
  uint64_t Strong;
  id v1;

  swift_beginAccess();
  Strong = swift_weakLoadStrong();
  if (Strong)
  {
    v1 = *(id *)(Strong + 64);
    swift_release();
    objc_msgSend(v1, sel_signalChange_, 1);

  }
}

uint64_t sub_24432681C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  sub_24432665C(v2);
  swift_release();
  return swift_release();
}

uint64_t sub_244326860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_244326888()
{
  uint64_t v0;

  v0 = swift_retain();
  return PhotosConcatenatedItemListManager.itemList.setter(v0);
}

uint64_t sub_2443268B0()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>, *v0);
  return sub_24437A2C8();
}

uint64_t sub_244326910(uint64_t a1, uint64_t a2)
{
  swift_retain();
  return sub_24432681C(a2);
}

uint64_t sub_244326948()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>, *v0);
  return sub_24437A2BC();
}

uint64_t (*PhotosConcatenatedItemListManager.itemList.modify(uint64_t **a1))(uint64_t *a1, char a2)
{
  uint64_t *v1;
  uint64_t v3;

  a1[1] = v1;
  v3 = *v1;
  swift_getKeyPath();
  sub_2443268B0();
  swift_release();
  *a1 = v1;
  swift_getKeyPath();
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>, v3);
  sub_24437A2E0();
  swift_release();
  *a1 = (uint64_t *)v1[2];
  swift_retain();
  return sub_244326AE4;
}

uint64_t sub_244326AE4(uint64_t *a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)a1[1];
  if ((a2 & 1) != 0)
  {
    v3 = swift_retain();
    sub_24432681C(v3);
    swift_release();
  }
  else
  {
    sub_24432681C(*a1);
  }
  return sub_244326B28(v2);
}

uint64_t sub_244326B28(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  swift_getKeyPath();
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>, v1);
  sub_24437A2D4();
  return swift_release();
}

uint64_t sub_244326BB0()
{
  swift_getKeyPath();
  sub_2443268B0();
  swift_release();
  return swift_bridgeObjectRetain();
}

uint64_t sub_244326C0C()
{
  uint64_t v0;

  v0 = swift_bridgeObjectRetain();
  return sub_2443262DC(v0, (uint64_t)&unk_244389458, (uint64_t)sub_244327098, (uint64_t (*)(uint64_t))MEMORY[0x24BEE4BC0]);
}

uint64_t sub_244326C4C(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 48) = a2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PhotosConcatenatedItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

Swift::Bool __swiftcall PhotosConcatenatedItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(*(_QWORD *)v1 + 104) + 56))(*(_QWORD *)(*(_QWORD *)v1 + 80), timeout) & 1;
}

id PhotosConcatenatedItemListManager.observable.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 64);
}

uint64_t PhotosConcatenatedItemListManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  v1 = v0 + qword_2573569D0;
  v2 = sub_24437A2F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t PhotosConcatenatedItemListManager.__deallocating_deinit()
{
  PhotosConcatenatedItemListManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_244326D68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

id sub_244326D94@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = PhotosConcatenatedItemListManager.observable.getter();
  *a1 = result;
  return result;
}

uint64_t sub_244326DBC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_244326DE4()
{
  return sub_244326608();
}

uint64_t sub_244326E08()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244326E2C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosConcatenatedItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_244326E60()
{
  uint64_t v0;

  return sub_244326910(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_244326E78()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_244326E88(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>);
  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

unint64_t sub_244326ED0()
{
  unint64_t result;
  unint64_t v1;

  result = qword_257357628;
  if (!qword_257357628)
  {
    v1 = sub_244326F10();
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable, v1);
    atomic_store(result, (unint64_t *)&qword_257357628);
  }
  return result;
}

unint64_t sub_244326F10()
{
  unint64_t result;

  result = qword_257357630;
  if (!qword_257357630)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257357630);
  }
  return result;
}

uint64_t sub_244326F4C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItemListManager<A, B, C>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_244326F80()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A2F8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void type metadata accessor for PhotosConcatenatedItemListManager()
{
  JUMPOUT(0x24950D214);
}

uint64_t method lookup function for PhotosConcatenatedItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosConcatenatedItemListManager.__allocating_init(mainItemListManager:prependItemListManager:appendItemListManager:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

void sub_244327050()
{
  sub_2443267A8();
}

uint64_t sub_244327064@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_244326BB0();
  *a1 = result;
  return result;
}

uint64_t sub_244327098()
{
  uint64_t v0;

  return sub_244326C4C(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void OUTLINED_FUNCTION_0_9(unint64_t a1@<X8>)
{
  uint64_t v1;
  int64_t v2;

  sub_2443236C0(a1 > 1, v2, 1, v1);
}

void OUTLINED_FUNCTION_1_6(char a1, int64_t a2)
{
  uint64_t v2;

  sub_2443236C0(a1, a2, 1, v2);
}

__n128 OUTLINED_FUNCTION_2_6(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a1;
  v3 = *(_OWORD *)(a1 + 32);
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  *(_OWORD *)(a2 + 32) = v3;
  *(__n128 *)a2 = result;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return swift_weakInit();
}

void OUTLINED_FUNCTION_5_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(v0 + 16) = v2;
  v5 = v0 + 16 * v4;
  *(_QWORD *)(v5 + 32) = v1;
  *(_QWORD *)(v5 + 40) = v3;
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_8_1()
{
  return 48;
}

uint64_t OUTLINED_FUNCTION_9_0()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_10_0()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_11_0()
{
  return swift_unknownObjectRetain();
}

uint64_t PhotosAnyEquatable.init<A>(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *boxed_opaque_existential_0;
  void (*v12)(char *, uint64_t, uint64_t);
  unint64_t v13;
  uint64_t v14;
  uint64_t result;
  uint64_t v16;

  v8 = *(_QWORD *)(a2 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  a4[3] = v10;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(a4);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(boxed_opaque_existential_0, a1, a2);
  v12 = *(void (**)(char *, uint64_t, uint64_t))(v8 + 32);
  v12((char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  v13 = (*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = a2;
  *(_QWORD *)(v14 + 24) = a3;
  result = ((uint64_t (*)(unint64_t, char *, uint64_t))v12)(v14 + v13, (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a2);
  a4[4] = (uint64_t)sub_2443275EC;
  a4[5] = v14;
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_244327284(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  int v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  void (*v25)(char *, uint64_t);
  char v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, uint64_t);
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37[32];

  v33 = a4;
  v36 = a2;
  v6 = *(_QWORD *)(a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v32 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_24437A808();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v34 = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v10 = MEMORY[0x24BDAC7A8](TupleTypeMetadata2);
  v12 = (char *)&v31 - v11;
  v13 = *(_QWORD *)(v8 - 8);
  v14 = MEMORY[0x24BDAC7A8](v10);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x24BDAC7A8](v14);
  v19 = (char *)&v31 - v18;
  MEMORY[0x24BDAC7A8](v17);
  v21 = (char *)&v31 - v20;
  sub_244324EB8(a1, (uint64_t)v37);
  v22 = swift_dynamicCast();
  __swift_storeEnumTagSinglePayload((uint64_t)v21, v22 ^ 1u, 1, a3);
  v35 = v6;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v19, v36, a3);
  __swift_storeEnumTagSinglePayload((uint64_t)v19, 0, 1, a3);
  v36 = TupleTypeMetadata2;
  v23 = (uint64_t)&v12[*(int *)(TupleTypeMetadata2 + 48)];
  v24 = *(void (**)(char *, char *, uint64_t))(v13 + 16);
  v24(v12, v21, v8);
  v24((char *)v23, v19, v8);
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, a3) != 1)
  {
    v24(v16, v12, v8);
    if (__swift_getEnumTagSinglePayload(v23, 1, a3) != 1)
    {
      v27 = v35;
      v28 = v32;
      (*(void (**)(char *, uint64_t, uint64_t))(v35 + 32))(v32, v23, a3);
      v26 = sub_24437A454();
      v29 = *(void (**)(char *, uint64_t))(v27 + 8);
      v29(v28, a3);
      v25 = *(void (**)(char *, uint64_t))(v13 + 8);
      v25(v19, v8);
      v29(v16, a3);
      v25(v12, v8);
      goto LABEL_8;
    }
    v25 = *(void (**)(char *, uint64_t))(v13 + 8);
    v25(v19, v8);
    (*(void (**)(char *, uint64_t))(v35 + 8))(v16, a3);
    goto LABEL_6;
  }
  v25 = *(void (**)(char *, uint64_t))(v13 + 8);
  v25(v19, v8);
  if (__swift_getEnumTagSinglePayload(v23, 1, a3) != 1)
  {
LABEL_6:
    (*(void (**)(char *, uint64_t))(v34 + 8))(v12, v36);
    v26 = 0;
    goto LABEL_8;
  }
  v25(v12, v8);
  v26 = 1;
LABEL_8:
  v25(v21, v8);
  return v26 & 1;
}

uint64_t sub_244327594()
{
  uint64_t v0;

  (*(void (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 16) - 8) + 80)));
  return swift_deallocObject();
}

uint64_t sub_2443275EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_244327284(a1, v1 + ((v3 + 32) & ~v3), v2, *(_QWORD *)(v1 + 24));
}

uint64_t static PhotosAnyEquatable.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(a1 + 32))(a2) & 1;
}

uint64_t areEqual(_:_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v11[6];
  __int128 v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t *);
  _QWORD v15[4];
  _QWORD v16[4];

  sub_244327760(a1, (uint64_t)&v12);
  if (!v13)
  {
    OUTLINED_FUNCTION_3_3();
LABEL_6:
    v9 = *(_QWORD *)(a1 + 24);
    OUTLINED_FUNCTION_4_4();
    v8 = (v9 | v13) == 0;
    OUTLINED_FUNCTION_3_3();
    return v8 & 1;
  }
  sub_2443277E8(&v12, (uint64_t)v16);
  OUTLINED_FUNCTION_4_4();
  if (!v13)
  {
    OUTLINED_FUNCTION_3_3();
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    goto LABEL_6;
  }
  sub_2443277E8(&v12, (uint64_t)v15);
  __swift_project_boxed_opaque_existential_1(v16, v16[3]);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_0_10(v3, v4, v11[0]);
  OUTLINED_FUNCTION_2_7((uint64_t *)&v12);
  __swift_project_boxed_opaque_existential_1(v15, v15[3]);
  OUTLINED_FUNCTION_1_7();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_0_10(v6, v7, v11[0]);
  OUTLINED_FUNCTION_2_7(v11);
  v8 = v14(v11);
  sub_244327824((uint64_t)v11);
  sub_244327824((uint64_t)&v12);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v15);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
  return v8 & 1;
}

uint64_t sub_244327760(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257356EA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_2443277A8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257356EA0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_2443277E8(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_244327824(uint64_t a1)
{
  destroy for PhotosAnyEquatable(a1);
  return a1;
}

Swift::Bool __swiftcall areEqual(_:_:)(Swift::OpaquePointer a1, Swift::OpaquePointer a2)
{
  uint64_t v2;
  char *v3;
  char *v4;
  uint64_t v5;
  char v6;
  BOOL v8;
  _BYTE v10[40];
  _BYTE v11[40];

  v2 = *((_QWORD *)a1._rawValue + 2);
  if (v2 == *((_QWORD *)a2._rawValue + 2))
  {
    if (v2)
    {
      v3 = (char *)a1._rawValue + 32;
      v4 = (char *)a2._rawValue + 32;
      v5 = v2 - 1;
      do
      {
        sub_2443278FC((uint64_t)v3, (uint64_t)v11);
        sub_2443278FC((uint64_t)v4, (uint64_t)v10);
        v6 = areEqual(_:_:)((uint64_t)v11);
        sub_2443277A8((uint64_t)v10);
        sub_2443277A8((uint64_t)v11);
        v8 = v5-- != 0;
        if ((v6 & 1) == 0)
          break;
        v3 += 40;
        v4 += 40;
      }
      while (v8);
    }
    else
    {
      v6 = 1;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6 & 1;
}

uint64_t sub_2443278FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t destroy for PhotosAnyEquatable(uint64_t a1)
{
  __swift_destroy_boxed_opaque_existential_0(a1);
  return swift_release();
}

_QWORD *initializeWithCopy for PhotosAnyEquatable(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[3];
  a1[3] = v4;
  (**(void (***)(void))(v4 - 8))();
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_retain();
  return a1;
}

uint64_t *assignWithCopy for PhotosAnyEquatable(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;

  __swift_assign_boxed_opaque_existential_0(a1, a2);
  v4 = a2[5];
  a1[4] = a2[4];
  a1[5] = v4;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_0(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        swift_retain();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          swift_retain();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

_OWORD *assignWithTake for PhotosAnyEquatable(_OWORD *a1, _OWORD *a2)
{
  __int128 v4;

  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  a1[2] = a2[2];
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosAnyEquatable(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 48))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 24);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosAnyEquatable(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosAnyEquatable()
{
  return &type metadata for PhotosAnyEquatable;
}

uint64_t OUTLINED_FUNCTION_0_10@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&a3 - ((a2 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
}

uint64_t OUTLINED_FUNCTION_2_7@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return PhotosAnyEquatable.init<A>(_:)(v3, v1, v2, a1);
}

uint64_t OUTLINED_FUNCTION_3_3()
{
  uint64_t v0;

  return sub_2443277A8(v0 - 160);
}

uint64_t OUTLINED_FUNCTION_4_4()
{
  uint64_t v0;
  uint64_t v1;

  return sub_244327760(v0, v1 - 160);
}

void PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)()
{
  swift_allocObject();
  OUTLINED_FUNCTION_32();
  PhotosConcatenatedItemList.init(mainItemList:prependItemList:appendItemList:)();
  OUTLINED_FUNCTION_31();
}

uint64_t PhotosConcatenatedItemList.init(mainItemList:prependItemList:appendItemList:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v34;
  void (*v35)(uint64_t, uint64_t, uint64_t);
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  OUTLINED_FUNCTION_7_2();
  v46 = v1;
  v47 = v2;
  v43 = v3;
  v5 = v4;
  v7 = v6;
  v8 = *(_QWORD **)v0;
  v38 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v45 = sub_24437A808();
  v9 = *(_QWORD *)(v45 - 8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_29();
  v36 = v11;
  v12 = v8[11];
  v13 = OUTLINED_FUNCTION_35();
  v14 = *(_QWORD *)(v13 - 8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v34 - v16;
  v18 = v8[19];
  *(_QWORD *)(v0 + v18) = PXDataSourceIdentifierMakeUnique();
  v19 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 128);
  v20 = v8[10];
  v37 = *(_QWORD *)(v20 - 8);
  v21 = *(void (**)(uint64_t, uint64_t))(v37 + 16);
  v44 = v7;
  v34 = v20;
  v21(v19, v7);
  OUTLINED_FUNCTION_30(v0 + *(_QWORD *)(*(_QWORD *)v0 + 136));
  v22 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 144);
  v40 = v9;
  v35 = *(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16);
  v35(v22, v43, v45);
  v41 = v5;
  v42 = v13;
  OUTLINED_FUNCTION_30((uint64_t)v17);
  OUTLINED_FUNCTION_38((uint64_t)v17, 1, v12);
  v39 = v14;
  if (v23)
  {
    (*(void (**)(char *, uint64_t))(v14 + 8))(v17, v42);
    v24 = v8[13];
    v25 = v34;
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    sub_24437A568();
  }
  else
  {
    (*(void (**)(uint64_t))(v8[14] + 48))(v12);
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v12 - 8) + 8))(v17, v12);
    v24 = v8[13];
    v25 = v34;
  }
  (*(void (**)(uint64_t, uint64_t))(v24 + 48))(v25, v24);
  swift_getAssociatedTypeWitness();
  v26 = v25;
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_37();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v27 = v36;
  v28 = v43;
  v35(v36, v43, v45);
  v29 = v38;
  OUTLINED_FUNCTION_38(v27, 1, v38);
  if (v23)
  {
    v30 = v40;
    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v27, v45);
    sub_24437A568();
  }
  else
  {
    (*(void (**)(uint64_t))(v8[15] + 48))(v29);
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 8))(v27, v29);
    v30 = v40;
  }
  v31 = v39;
  v32 = OUTLINED_FUNCTION_37();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v45);
  (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v41, v42);
  (*(void (**)(uint64_t, uint64_t))(v37 + 8))(v44, v26);
  *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 160)) = v32;
  return v0;
}

uint64_t PhotosConcatenatedItemList.mainItemList.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 128));
}

uint64_t PhotosConcatenatedItemList.prependItemList.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_16();
  v0 = OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_19(v0, v1, v2, v3);
}

uint64_t PhotosConcatenatedItemList.appendItemList.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_16();
  v0 = OUTLINED_FUNCTION_20();
  return OUTLINED_FUNCTION_19(v0, v1, v2, v3);
}

uint64_t PhotosConcatenatedItemList.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152));
}

uint64_t PhotosConcatenatedItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosConcatenatedItemList.numberOfItems.getter()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  JUMPOUT(0x24950BEB8);
}

void PhotosConcatenatedItemList.placeholderObject.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  OUTLINED_FUNCTION_7_2();
  v1 = *(_QWORD *)(*(_QWORD *)v0 + 104);
  v2 = *(_QWORD *)(*(_QWORD *)v0 + 80);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_29();
  (*(void (**)(uint64_t, uint64_t))(v1 + 104))(v2, v1);
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_14();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_13();
  type metadata accessor for PhotosConcatenatedItem();
}

void sub_2443282E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  uint64_t v8;

  v8 = *(_QWORD *)(v7 - 248);
  sub_2443284C0((void (*)(char *, char *))sub_24432921C, v7 - 208, MEMORY[0x24BEE4078], a1, a7, *(_QWORD *)(v7 - 216));
  OUTLINED_FUNCTION_34(v8, *(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 224) + 8));
  OUTLINED_FUNCTION_1();
}

void sub_244328334(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedConformanceWitness();
  type metadata accessor for PhotosConcatenatedItem();
}

uint64_t sub_244328470(uint64_t a1)
{
  uint64_t v3;

  swift_storeEnumTagMultiPayload();
  return __swift_storeEnumTagSinglePayload(v3, 0, 1, a1);
}

uint64_t sub_2443284C0@<X0>(void (*a1)(char *, char *)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X6>, uint64_t a6@<X8>)
{
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t result;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *);

  v25 = a5;
  v26 = a4;
  v27 = a2;
  v28 = a1;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = MEMORY[0x24BDAC7A8](a1);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v13 + 16);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x24BDAC7A8](v10);
  v18 = (char *)&v24 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v21 + 16))(v20, v22);
  if (__swift_getEnumTagSinglePayload((uint64_t)v20, 1, v14) == 1)
    return __swift_storeEnumTagSinglePayload(a6, 1, 1, v26);
  v26 = a3;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v18, v20, v14);
  v28(v18, v12);
  result = (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v18, v14);
  if (v6)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(v25, v12, v26);
  return result;
}

void PhotosConcatenatedItemList.loadingStatus.getter()
{
  uint64_t v0;
  uint64_t v1;
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char v21;
  unsigned int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BYTE *v34;
  unsigned __int8 v35;
  unsigned __int8 v36;
  unsigned __int8 v37;

  OUTLINED_FUNCTION_7_2();
  v1 = v0;
  v34 = v2;
  v3 = *(_QWORD **)v0;
  v4 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v5 = sub_24437A808();
  v31 = *(_QWORD *)(v5 - 8);
  v32 = v5;
  OUTLINED_FUNCTION_10_1();
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v28 - v8;
  v33 = v4;
  v30 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_0();
  v29 = v10;
  v11 = v3[11];
  v12 = sub_24437A808();
  v13 = *(_QWORD *)(v12 - 8);
  OUTLINED_FUNCTION_10_1();
  v15 = MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v28 - v16;
  v18 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v15);
  v20 = (char *)&v28 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(unsigned __int8 *__return_ptr, _QWORD))(v3[13] + 112))(&v37, v3[10]);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v17, v1 + *(_QWORD *)(*(_QWORD *)v1 + 136), v12);
  OUTLINED_FUNCTION_38((uint64_t)v17, 1, v11);
  if (v21)
  {
    (*(void (**)(char *, uint64_t))(v13 + 8))(v17, v12);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v17, v11);
    v22 = v37;
    (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(v3[14] + 112))(&v35, v11);
    if (v35 < v22)
      LOBYTE(v22) = v35;
    (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v11);
    v37 = v22;
  }
  v23 = v31;
  (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v9, v1 + *(_QWORD *)(*(_QWORD *)v1 + 144), v32);
  v24 = v33;
  OUTLINED_FUNCTION_38((uint64_t)v9, 1, v33);
  if (v21)
  {
    OUTLINED_FUNCTION_34((uint64_t)v9, *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8));
    LOBYTE(v27) = v37;
  }
  else
  {
    v25 = v29;
    v26 = v30;
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(v29, v9, v24);
    v27 = v37;
    (*(void (**)(unsigned __int8 *__return_ptr, uint64_t))(v3[15] + 112))(&v36, v24);
    if (v36 < v27)
      LOBYTE(v27) = v36;
    (*(void (**)(uint64_t, uint64_t))(v26 + 8))(v25, v24);
  }
  *v34 = v27;
  OUTLINED_FUNCTION_1();
}

void PhotosConcatenatedItemList.item(at:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
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
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t AssociatedTypeWitness;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;

  OUTLINED_FUNCTION_7_2();
  v1 = v0;
  v73 = v2;
  v75 = v3;
  v4 = *(_QWORD **)v0;
  v5 = *(_QWORD *)(*(_QWORD *)v0 + 96);
  v71 = *(_QWORD *)(*(_QWORD *)v0 + 120);
  v72 = OUTLINED_FUNCTION_33();
  v68 = *(_QWORD *)(v72 - 8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_29();
  v67 = v7;
  v65 = OUTLINED_FUNCTION_35();
  v62 = *(_QWORD *)(v65 - 8);
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_29();
  v63 = v9;
  v74 = v5;
  v66 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_2_0();
  v64 = v11;
  v12 = v4[14];
  v13 = v4[11];
  v14 = OUTLINED_FUNCTION_33();
  v69 = *(_QWORD *)(v14 - 8);
  v70 = v14;
  OUTLINED_FUNCTION_10_1();
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v61 - v16;
  v18 = sub_24437A808();
  v19 = *(_QWORD *)(v18 - 8);
  OUTLINED_FUNCTION_10_1();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)&v61 - v22;
  v24 = *(_QWORD *)(v13 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v26 = (char *)&v61 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v23, v1 + v4[17], v18);
  OUTLINED_FUNCTION_38((uint64_t)v23, 1, v13);
  if (v27)
  {
    v69 = v12;
    (*(void (**)(char *, uint64_t))(v19 + 8))(v23, v18);
    v28 = v73;
    v29 = v74;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v24 + 32))(v26, v23, v13);
    v30 = OUTLINED_FUNCTION_36();
    v31 = v73;
    if (v30 > v73)
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 56))(v73, v13, v12);
      OUTLINED_FUNCTION_21();
      v32 = v70;
      (*(void (**)(uint64_t, char *, uint64_t))(v69 + 32))(v75, v17, v70);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      v34 = OUTLINED_FUNCTION_13();
      v35 = OUTLINED_FUNCTION_13();
      v36 = v72;
      v37 = OUTLINED_FUNCTION_13();
      v76 = AssociatedTypeWitness;
      v77 = v32;
      v78 = v36;
      v79 = v34;
      v80 = v35;
      v81 = v37;
      OUTLINED_FUNCTION_27();
    }
    v38 = OUTLINED_FUNCTION_36();
    OUTLINED_FUNCTION_21();
    v28 = v31 - v38;
    v29 = v74;
    if (__OFSUB__(v31, v38))
      goto LABEL_14;
    v69 = v12;
  }
  v39 = v4[13];
  v38 = *(_QWORD *)(v39 + 32);
  v40 = v4[10];
  v41 = OUTLINED_FUNCTION_39();
  v42 = v75;
  if (v28 < v41)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v39 + 56))(v28, v40, v39);
    v43 = OUTLINED_FUNCTION_17();
    v44 = OUTLINED_FUNCTION_6_1();
    v45 = v70;
    v46 = OUTLINED_FUNCTION_6_1();
    v47 = v72;
    v48 = OUTLINED_FUNCTION_6_1();
    v76 = v43;
    v77 = v45;
    v78 = v47;
    v79 = v44;
    v80 = v46;
    v81 = v48;
    OUTLINED_FUNCTION_27();
  }
  v49 = OUTLINED_FUNCTION_39();
  v50 = v28 - v49;
  if (__OFSUB__(v28, v49))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v38 = v62;
  v28 = v63;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v62 + 16))(v63, v1 + *(_QWORD *)(*(_QWORD *)v1 + 144), v65);
  OUTLINED_FUNCTION_38(v28, 1, v29);
  if (!v27)
  {
    v51 = v66;
    v52 = v64;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v66 + 32))(v64, v28, v29);
    v53 = v67;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v71 + 56))(v50, v29, v71);
    (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v29);
    v54 = v42;
    v55 = v72;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v68 + 32))(v54, v53, v72);
    v56 = OUTLINED_FUNCTION_17();
    v57 = OUTLINED_FUNCTION_6_1();
    v58 = v70;
    v59 = OUTLINED_FUNCTION_6_1();
    v60 = OUTLINED_FUNCTION_6_1();
    v76 = v56;
    v77 = v58;
    v78 = v55;
    v79 = v57;
    v80 = v59;
    v81 = v60;
    OUTLINED_FUNCTION_27();
  }
LABEL_15:
  OUTLINED_FUNCTION_34(v28, *(uint64_t (**)(uint64_t, uint64_t))(v38 + 8));
  sub_24437A9B8();
  __break(1u);
}

void PhotosConcatenatedItemList.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 128));
  v1 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v1);
  v2 = OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_15(v2);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_31();
}

uint64_t PhotosConcatenatedItemList.__deallocating_deinit()
{
  PhotosConcatenatedItemList.deinit();
  return swift_deallocClassInstance();
}

void sub_244328E54()
{
  PhotosConcatenatedItemList.numberOfItems.getter();
}

uint64_t sub_244328E74()
{
  return PhotosConcatenatedItemList.itemIdentifiers.getter();
}

void sub_244328E94()
{
  PhotosConcatenatedItemList.item(at:)();
}

void sub_244328EB4()
{
  PhotosConcatenatedItemList.placeholderObject.getter();
}

void sub_244328ED4()
{
  PhotosConcatenatedItemList.loadingStatus.getter();
}

uint64_t sub_244328EF4()
{
  return PhotosConcatenatedItemList.version.getter();
}

void PhotosConcatenatedItem.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_7_2();
  v2 = OUTLINED_FUNCTION_5_3(v0, v1);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_8(v6, v7, v11);
  v8 = OUTLINED_FUNCTION_18();
  if (v8)
  {
    if (v8 == 1)
    {
      OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
      OUTLINED_FUNCTION_25();
      v9 = OUTLINED_FUNCTION_32();
    }
    else
    {
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_26();
      v9 = OUTLINED_FUNCTION_22();
    }
  }
  else
  {
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_24();
    v9 = OUTLINED_FUNCTION_23();
  }
  v10(v9);
  OUTLINED_FUNCTION_1();
}

void PhotosConcatenatedItem.value.getter()
{
  _QWORD *v0;
  uint64_t v1;
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
  int v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  uint64_t AssociatedTypeWitness;
  uint64_t v16;
  void (*v17)(uint64_t);
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  OUTLINED_FUNCTION_7_2();
  v6 = OUTLINED_FUNCTION_5_3(v4, v5);
  MEMORY[0x24BDAC7A8](v6);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v7);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_4_5();
  MEMORY[0x24BDAC7A8](v9);
  OUTLINED_FUNCTION_1_8(v10, v11, v24);
  v12 = OUTLINED_FUNCTION_18();
  if (v12)
  {
    if (v12 == 1)
    {
      OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 32));
      v13 = v0[6];
      v14 = *(void (**)(uint64_t, uint64_t))(v13 + 72);
      AssociatedTypeWitness = swift_getAssociatedTypeWitness();
      OUTLINED_FUNCTION_12_0(AssociatedTypeWitness);
      v14(v1, v13);
      v16 = OUTLINED_FUNCTION_32();
    }
    else
    {
      OUTLINED_FUNCTION_9_1();
      v21 = v0[7];
      v22 = *(void (**)(uint64_t, uint64_t))(v21 + 72);
      v23 = swift_getAssociatedTypeWitness();
      OUTLINED_FUNCTION_12_0(v23);
      v22(v2, v21);
      v16 = OUTLINED_FUNCTION_22();
    }
  }
  else
  {
    OUTLINED_FUNCTION_8_2();
    v18 = v0[5];
    v19 = *(void (**)(uint64_t, uint64_t))(v18 + 72);
    v20 = swift_getAssociatedTypeWitness();
    OUTLINED_FUNCTION_12_0(v20);
    v19(v3, v18);
    v16 = OUTLINED_FUNCTION_23();
  }
  v17(v16);
  OUTLINED_FUNCTION_1();
}

void PhotosConcatenatedItem<>.value.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  uint64_t v11;
  uint64_t v12;

  OUTLINED_FUNCTION_7_2();
  v2 = OUTLINED_FUNCTION_5_3(v0, v1);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_3_4();
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_8();
  MEMORY[0x24BDAC7A8](v4);
  OUTLINED_FUNCTION_4_5();
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_1_8(v6, v7, v11);
  v8 = OUTLINED_FUNCTION_18();
  if (v8)
  {
    if (v8 == 1)
    {
      OUTLINED_FUNCTION_11_1(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 32));
      OUTLINED_FUNCTION_25();
      v9 = OUTLINED_FUNCTION_32();
    }
    else
    {
      OUTLINED_FUNCTION_9_1();
      OUTLINED_FUNCTION_26();
      v9 = OUTLINED_FUNCTION_22();
    }
  }
  else
  {
    OUTLINED_FUNCTION_8_2();
    OUTLINED_FUNCTION_24();
    v9 = OUTLINED_FUNCTION_23();
  }
  v10(v9);
  OUTLINED_FUNCTION_1();
}

void sub_24432921C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  sub_244328334(a1, a2);
}

void type metadata accessor for PhotosConcatenatedItem()
{
  JUMPOUT(0x24950D214);
}

void sub_24432924C()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_24432925C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24432927C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItem<A, B, C>);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_2443292A8()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_2443292C8(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosConcatenatedItem<A, B, C>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

uint64_t sub_2443292F4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = sub_24437A808();
    if (v2 <= 0x3F)
    {
      result = sub_24437A808();
      if (v3 <= 0x3F)
      {
        result = swift_initClassMetadata2();
        if (!result)
          return 0;
      }
    }
  }
  return result;
}

void type metadata accessor for PhotosConcatenatedItemList()
{
  JUMPOUT(0x24950D214);
}

uint64_t method lookup function for PhotosConcatenatedItemList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosConcatenatedItemList.__allocating_init(mainItemList:prependItemList:appendItemList:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

uint64_t sub_2443293E0()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2443293E8()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_checkMetadataState();
      if (v3 <= 0x3F)
      {
        swift_initEnumMetadataMultiPayload();
        return 0;
      }
    }
  }
  return result;
}

uint64_t *sub_244329490(uint64_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v12;
  unsigned int v13;
  uint64_t v14;
  char v15;

  v3 = a1;
  v4 = *(_QWORD *)(a3[2] - 8);
  v5 = *(_QWORD *)(a3[3] - 8);
  v6 = *(_QWORD *)(v5 + 64);
  if (v6 <= *(_QWORD *)(v4 + 64))
    v6 = *(_QWORD *)(v4 + 64);
  v7 = *(_QWORD *)(a3[4] - 8);
  if (*(_QWORD *)(v7 + 64) <= v6)
    v8 = v6;
  else
    v8 = *(_QWORD *)(v7 + 64);
  v9 = (*(_BYTE *)(v5 + 80) | *(_BYTE *)(v4 + 80) | *(_BYTE *)(v7 + 80));
  if (v9 <= 7
    && v8 + 1 <= 0x18
    && ((*(_DWORD *)(v5 + 80) | *(_DWORD *)(v4 + 80) | *(_DWORD *)(v7 + 80)) & 0x100000) == 0)
  {
    v13 = *((unsigned __int8 *)a2 + v8);
    if (v13 >= 3)
    {
      if (v8 <= 3)
        v14 = v8;
      else
        v14 = 4;
      __asm { BR              X17 }
    }
    if (v13 == 2)
    {
      (*(void (**)(uint64_t *))(v7 + 16))(a1);
      v15 = 2;
    }
    else
    {
      if (v13 != 1)
      {
        (*(void (**)(uint64_t *))(v4 + 16))(a1);
        *((_BYTE *)v3 + v8) = 0;
        return v3;
      }
      (*(void (**)(uint64_t *))(v5 + 16))(a1);
      v15 = 1;
    }
    *((_BYTE *)v3 + v8) = v15;
  }
  else
  {
    v12 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v12 + ((v9 + 16) & ~v9));
    swift_retain();
  }
  return v3;
}

uint64_t sub_2443295F4(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v3 = a2[3];
  v2 = a2[4];
  v4 = *(_QWORD *)(a2[2] - 8);
  v5 = *(_QWORD *)(*(_QWORD *)(v3 - 8) + 64);
  if (v5 <= *(_QWORD *)(v4 + 64))
    v5 = *(_QWORD *)(v4 + 64);
  v6 = *(_QWORD *)(v2 - 8);
  if (*(_QWORD *)(v6 + 64) > v5)
    v5 = *(_QWORD *)(v6 + 64);
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (v7 < 3)
  {
    if (*(_BYTE *)(a1 + v5))
    {
      if (v7 == 2)
        v4 = *(_QWORD *)(v2 - 8);
      else
        v4 = *(_QWORD *)(v3 - 8);
    }
    return (*(uint64_t (**)(void))(v4 + 8))();
  }
  else
  {
    if (v5 <= 3)
      v8 = v5;
    else
      v8 = 4;
    return ((uint64_t (*)(void))((char *)&loc_244329658 + 4 * byte_2443894E5[v8]))();
  }
}

uint64_t sub_2443296C0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  v4 = a3[2];
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  v8 = a3[4];
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_QWORD *)(v9 + 64) <= v7)
    v10 = v7;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X17 }
  }
  if (*(_BYTE *)(a2 + v10))
  {
    if (v11 == 2)
    {
      v13 = 2;
      v6 = *(_QWORD *)(v8 - 8);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
    v6 = *(_QWORD *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v6 + 16))(a1);
  *(_BYTE *)(a1 + v10) = v13;
  return a1;
}

uint64_t sub_2443297CC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;

  if (a1 != a2)
  {
    v5 = a3[2];
    v6 = a3[3];
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v7 + 64);
    v9 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v9 + 64) > v8)
      v8 = *(_QWORD *)(v9 + 64);
    v10 = a3[4];
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_QWORD *)(v11 + 64) <= v8)
      v12 = v8;
    else
      v12 = *(_QWORD *)(v11 + 64);
    v13 = *(unsigned __int8 *)(a1 + v12);
    if (v13 >= 3)
    {
      if (v12 <= 3)
        v14 = v12;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    v15 = *(_QWORD *)(v5 - 8);
    v16 = a3[2];
    if (*(_BYTE *)(a1 + v12))
    {
      v15 = *(_QWORD *)(v10 - 8);
      v16 = a3[4];
      if (v13 != 2)
      {
        v15 = *(_QWORD *)(v6 - 8);
        v16 = a3[3];
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v16);
    v17 = *(unsigned __int8 *)(a2 + v12);
    if (v17 >= 3)
    {
      if (v12 <= 3)
        v18 = v12;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (*(_BYTE *)(a2 + v12))
    {
      if (v17 == 2)
      {
        v19 = 2;
        v7 = v11;
        v5 = v10;
      }
      else
      {
        v19 = 1;
        v7 = v9;
        v5 = v6;
      }
    }
    else
    {
      v19 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v5);
    *(_BYTE *)(a1 + v12) = v19;
  }
  return a1;
}

uint64_t sub_2443299A0(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v12;
  char v13;

  v4 = a3[2];
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(a3[3] - 8);
  v7 = *(_QWORD *)(v6 + 64);
  if (v7 <= *(_QWORD *)(v5 + 64))
    v7 = *(_QWORD *)(v5 + 64);
  v8 = a3[4];
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_QWORD *)(v9 + 64) <= v7)
    v10 = v7;
  else
    v10 = *(_QWORD *)(v9 + 64);
  v11 = *(unsigned __int8 *)(a2 + v10);
  if (v11 >= 3)
  {
    if (v10 <= 3)
      v12 = v10;
    else
      v12 = 4;
    __asm { BR              X17 }
  }
  if (*(_BYTE *)(a2 + v10))
  {
    if (v11 == 2)
    {
      v13 = 2;
      v6 = *(_QWORD *)(v8 - 8);
    }
    else
    {
      v13 = 1;
    }
  }
  else
  {
    v13 = 0;
    v6 = *(_QWORD *)(v4 - 8);
  }
  (*(void (**)(uint64_t))(v6 + 32))(a1);
  *(_BYTE *)(a1 + v10) = v13;
  return a1;
}

uint64_t sub_244329AAC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unsigned int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  char v19;

  if (a1 != a2)
  {
    v5 = a3[2];
    v6 = a3[3];
    v7 = *(_QWORD *)(v5 - 8);
    v8 = *(_QWORD *)(v7 + 64);
    v9 = *(_QWORD *)(v6 - 8);
    if (*(_QWORD *)(v9 + 64) > v8)
      v8 = *(_QWORD *)(v9 + 64);
    v10 = a3[4];
    v11 = *(_QWORD *)(v10 - 8);
    if (*(_QWORD *)(v11 + 64) <= v8)
      v12 = v8;
    else
      v12 = *(_QWORD *)(v11 + 64);
    v13 = *(unsigned __int8 *)(a1 + v12);
    if (v13 >= 3)
    {
      if (v12 <= 3)
        v14 = v12;
      else
        v14 = 4;
      __asm { BR              X12 }
    }
    v15 = *(_QWORD *)(v5 - 8);
    v16 = a3[2];
    if (*(_BYTE *)(a1 + v12))
    {
      v15 = *(_QWORD *)(v10 - 8);
      v16 = a3[4];
      if (v13 != 2)
      {
        v15 = *(_QWORD *)(v6 - 8);
        v16 = a3[3];
      }
    }
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a1, v16);
    v17 = *(unsigned __int8 *)(a2 + v12);
    if (v17 >= 3)
    {
      if (v12 <= 3)
        v18 = v12;
      else
        v18 = 4;
      __asm { BR              X12 }
    }
    if (*(_BYTE *)(a2 + v12))
    {
      if (v17 == 2)
      {
        v19 = 2;
        v7 = v11;
        v5 = v10;
      }
      else
      {
        v19 = 1;
        v7 = v9;
        v5 = v6;
      }
    }
    else
    {
      v19 = 0;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v5);
    *(_BYTE *)(a1 + v12) = v19;
  }
  return a1;
}

uint64_t sub_244329C80(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  char v6;
  int v7;
  unsigned int v9;
  int v10;
  unsigned int v11;

  v3 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64) > v3)
    v3 = *(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64);
  v4 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
  if (v4 <= v3)
    v4 = v3;
  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_23;
  v5 = v4 + 1;
  v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    v9 = ((a2 + ~(-1 << v6) - 253) >> v6) + 1;
    if (HIWORD(v9))
    {
      v7 = *(_DWORD *)(a1 + v5);
      if (!v7)
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 > 0xFF)
    {
      v7 = *(unsigned __int16 *)(a1 + v5);
      if (!*(_WORD *)(a1 + v5))
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 < 2)
    {
LABEL_23:
      v11 = *(unsigned __int8 *)(a1 + v4);
      if (v11 >= 3)
        return (v11 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (!*(_BYTE *)(a1 + v5))
    goto LABEL_23;
LABEL_16:
  v10 = (v7 - 1) << v6;
  if (v5 > 3)
    v10 = 0;
  if (!(_DWORD)v5)
    return (v10 + 254);
  if (v5 > 3)
    LODWORD(v5) = 4;
  return ((uint64_t (*)(void))((char *)&loc_244329D5C + 4 * byte_244389508[(v5 - 1)]))();
}

void sub_244329DA8(_WORD *a1, unsigned int a2, unsigned int a3, _QWORD *a4)
{
  unint64_t v5;
  size_t v6;
  char v7;
  unsigned int v8;
  unsigned int v9;
  unsigned int v10;
  int v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a4[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a4[3] - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(a4[3] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a4[4] - 8) + 64) > v5)
    v5 = *(_QWORD *)(*(_QWORD *)(a4[4] - 8) + 64);
  v6 = v5 + 1;
  v7 = 8 * (v5 + 1);
  if (a3 < 0xFE)
  {
    v8 = 0;
  }
  else if (v6 <= 3)
  {
    v10 = ((a3 + ~(-1 << v7) - 253) >> v7) + 1;
    if (HIWORD(v10))
    {
      v8 = 4u;
    }
    else if (v10 >= 0x100)
    {
      v8 = 2;
    }
    else
    {
      v8 = v10 > 1;
    }
  }
  else
  {
    v8 = 1u;
  }
  if (a2 <= 0xFD)
    __asm { BR              X11 }
  v9 = a2 - 254;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v11 = v9 & ~(-1 << v7);
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v11;
        *((_BYTE *)a1 + 2) = BYTE2(v11);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v11;
      }
      else
      {
        *(_BYTE *)a1 = v11;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v9;
  }
  __asm { BR              X10 }
}

uint64_t sub_244329F64(uint64_t a1, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a2[2] - 8) + 64);
  if (*(_QWORD *)(*(_QWORD *)(a2[3] - 8) + 64) > v2)
    v2 = *(_QWORD *)(*(_QWORD *)(a2[3] - 8) + 64);
  v3 = *(_QWORD *)(*(_QWORD *)(a2[4] - 8) + 64);
  if (v3 <= v2)
    v3 = v2;
  if (*(unsigned __int8 *)(a1 + v3) < 3u)
    return *(unsigned __int8 *)(a1 + v3);
  if (v3 <= 3)
    v4 = v3;
  else
    v4 = 4;
  return ((uint64_t (*)(void))((char *)&loc_244329FC4 + 4 * byte_244389516[v4]))();
}

void sub_24432A00C(_BYTE *a1, unsigned int a2, _QWORD *a3)
{
  size_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v4 = *(_QWORD *)(*(_QWORD *)(a3[3] - 8) + 64);
  if (a2 > 2)
  {
    if (v4 <= *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64))
      v4 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
    if (*(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64) <= v4)
      v5 = v4;
    else
      v5 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
    v6 = a2 - 3;
    if (v5 < 4)
    {
      v7 = v6 >> (8 * v5);
      v8 = v6 & ~(-1 << (8 * v5));
      a1[v5] = v7 + 3;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v8;
        a1[2] = BYTE2(v8);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v8;
      }
      else
      {
        *a1 = v8;
      }
    }
    else
    {
      a1[v5] = 3;
      bzero(a1, v5);
      *(_DWORD *)a1 = v6;
    }
  }
  else
  {
    if (v4 <= *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64))
      v4 = *(_QWORD *)(*(_QWORD *)(a3[2] - 8) + 64);
    if (*(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64) > v4)
      v4 = *(_QWORD *)(*(_QWORD *)(a3[4] - 8) + 64);
    a1[v4] = a2;
  }
}

uint64_t OUTLINED_FUNCTION_1_8@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&a3 - ((a2 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
}

uint64_t OUTLINED_FUNCTION_5_3@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 88) = a2;
  *(_QWORD *)(v2 - 96) = *(_QWORD *)(*(_QWORD *)(result + 24) - 8);
  return result;
}

uint64_t OUTLINED_FUNCTION_6_1()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_8_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v1, v2, v0);
}

uint64_t OUTLINED_FUNCTION_9_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v0 + 32))(v2, v3, v1);
}

uint64_t OUTLINED_FUNCTION_11_1@<X0>(uint64_t (*a1)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return a1(v2, v3, v1);
}

uint64_t *OUTLINED_FUNCTION_12_0(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;

  v2 = *(uint64_t **)(v1 - 88);
  v2[3] = a1;
  return __swift_allocate_boxed_opaque_existential_0(v2);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_14()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_15(uint64_t a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a1 - 8) + 8))(v1, a1);
}

uint64_t OUTLINED_FUNCTION_16()
{
  return sub_24437A808();
}

uint64_t OUTLINED_FUNCTION_17()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_18()
{
  return swift_getEnumCaseMultiPayload();
}

uint64_t OUTLINED_FUNCTION_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_20()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_21()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 8))(v0, v2);
}

uint64_t OUTLINED_FUNCTION_22()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_23()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_24()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_25()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  return v0(v1);
}

uint64_t OUTLINED_FUNCTION_26()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;

  return v0(v1);
}

void OUTLINED_FUNCTION_27()
{
  type metadata accessor for PhotosConcatenatedItem();
}

uint64_t OUTLINED_FUNCTION_30(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_32()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_33()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_34@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_35()
{
  return sub_24437A808();
}

uint64_t OUTLINED_FUNCTION_36()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t OUTLINED_FUNCTION_37()
{
  return sub_24437A55C();
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_getEnumTagSinglePayload(a1, a2, a3);
}

uint64_t OUTLINED_FUNCTION_39()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v1, v2);
}

uint64_t dispatch thunk of PhotosVersionable.version.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

ValueMetadata *type metadata accessor for PhotosUniqueVersion()
{
  return &type metadata for PhotosUniqueVersion;
}

uint64_t OUTLINED_FUNCTION_11_2()
{
  return sub_24437A568();
}

uint64_t PhotosChildProvidingItemListManager.Options.init(excludeEmptyItems:)@<X0>(uint64_t result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = result;
  return result;
}

void PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)()
{
  uint64_t v0;
  char *v1;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_8_3();
  PhotosChildProvidingItemListManager.init(parentItemListManager:options:childProvider:childUpdater:)(v0, v1);
}

uint64_t sub_24432A444()
{
  uint64_t v0;

  return v0;
}

void PhotosChildProvidingItemListManager.init(parentItemListManager:options:childProvider:childUpdater:)(uint64_t a1, char *a2)
{
  uint64_t v2;
  char v3;

  v3 = *a2;
  *(_QWORD *)(v2 + 72) = 0;
  *(_QWORD *)(v2 + 80) = 0;
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_6_2();
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11_2();
  OUTLINED_FUNCTION_5_4();
  *(_QWORD *)(v2 + 88) = sub_24437A3C4();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_257356D68);
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_11_2();
  *(_QWORD *)(v2 + 96) = sub_24437A3C4();
  *(_BYTE *)(v2 + 104) = 0;
  *(_BYTE *)(v2 + 16) = v3;
  type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
}

void sub_24432A618()
{
  OUTLINED_FUNCTION_7_3();
}

void sub_24432A628(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t (*)(uint64_t *), _QWORD *, uint64_t, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  type metadata accessor for PhotosBasicItemListManager(0, v18, a1, a4);
  type metadata accessor for PhotosBasicItemList(0, v18, a1, v23);
  LOBYTE(a17) = 0;
  v24 = sub_24437A568();
  v25 = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v24, (char *)&a17);
  PhotosBasicItemListManager.__allocating_init(itemList:)(v25);
  v17[3] = v26;
  v17[4] = a12;
  v17[5] = a13;
  v17[6] = a14;
  v17[7] = a15;
  v17[8] = a16;
  a17 = a12;
  v27 = OUTLINED_FUNCTION_0_2();
  swift_weakInit();
  v28 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v28[2] = v20;
  v28[3] = v21;
  v28[4] = a10;
  v28[5] = v19;
  v28[6] = v27;
  v29 = *(_QWORD *)(a10 + 16);
  v30 = *(uint64_t (**)(uint64_t (*)(uint64_t *), _QWORD *, uint64_t, uint64_t))(v29 + 24);
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  v31 = v30(sub_24432BEF4, v28, v20, v29);
  v33 = v32;
  swift_release();
  v17[9] = v31;
  v17[10] = v33;
  swift_unknownObjectRelease();
  sub_24432A824();
}

uint64_t sub_24432A738()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return v0;
}

uint64_t sub_24432A774()
{
  OUTLINED_FUNCTION_2_9();
  return swift_bridgeObjectRetain();
}

uint64_t sub_24432A7A4(uint64_t a1)
{
  uint64_t v1;

  OUTLINED_FUNCTION_2_9();
  *(_QWORD *)(v1 + 88) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24432A7E4()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 104);
}

uint64_t sub_24432A7EC(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 104) = result;
  return result;
}

uint64_t sub_24432A7F4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*(_QWORD *)v0 + 96) + 40))(*(_QWORD *)(*(_QWORD *)v0 + 80));
}

void sub_24432A824()
{
  uint64_t *v0;
  uint64_t v1;
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
  _QWORD v12[20];
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;

  v13 = *v0;
  v12[10] = *(_QWORD *)(v13 + 96);
  OUTLINED_FUNCTION_6_2();
  v1 = OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_6_2();
  v2 = OUTLINED_FUNCTION_5_4();
  v3 = OUTLINED_FUNCTION_6_2();
  v14 = *(_QWORD *)(v3 - 8);
  v4 = MEMORY[0x24BDAC7A8](v3);
  v12[8] = (char *)v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v15 = (char *)v12 - v6;
  v7 = swift_checkMetadataState();
  OUTLINED_FUNCTION_9_2(*(_QWORD *)(v7 - 8));
  MEMORY[0x24BDAC7A8](v8);
  v12[2] = (char *)v12 - v9;
  v10 = swift_checkMetadataState();
  OUTLINED_FUNCTION_9_2(*(_QWORD *)(v10 - 8));
  MEMORY[0x24BDAC7A8](v11);
  sub_24432A7F4();
  v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v1 + 48))(v10, v1);
  sub_24437A5E0();
  v12[17] = v2;
  OUTLINED_FUNCTION_5_4();
  OUTLINED_FUNCTION_7_3();
}

uint64_t sub_24432AE80()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_24437A670();
}

uint64_t sub_24432AF9C(uint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void (*a7)(void))
{
  uint64_t v8;
  uint64_t result;

  v8 = *a1;
  OUTLINED_FUNCTION_2_9();
  result = swift_weakLoadStrong();
  if (result)
  {
    if ((v8 & 1) != 0)
      a7();
    return swift_release();
  }
  return result;
}

void sub_24432B000()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t AssociatedConformanceWitness;
  uint64_t v10;
  _QWORD *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];
  uint64_t v22;
  uint64_t v23;
  char *v24;
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

  v1 = v0;
  v2 = *v0;
  v3 = *(_QWORD *)(*v0 + 96);
  v4 = *(_QWORD *)(*v0 + 80);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)v21 - v7;
  if ((v0[13] & 1) == 0)
  {
    (*(void (**)(uint64_t, uint64_t))(v3 + 40))(v4, v3);
    v22 = v4;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v10 = (*(uint64_t (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 48))(AssociatedTypeWitness, AssociatedConformanceWitness);
    v11 = (*(_QWORD *(**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 112))(&v36, AssociatedTypeWitness, AssociatedConformanceWitness);
    v12 = *((unsigned __int8 *)v0 + 16);
    v24 = v8;
    v25 = v6;
    v23 = v2;
    if (v12 == 1)
    {
      v27 = v10;
      MEMORY[0x24BDAC7A8](v11);
      v21[-2] = v0;
      v21[-1] = &v36;
      swift_getAssociatedTypeWitness();
      swift_getAssociatedConformanceWitness();
      swift_getAssociatedTypeWitness();
      v13 = sub_24437A5E0();
      MEMORY[0x24950D28C](MEMORY[0x24BEE12F0], v13);
      v10 = sub_24437A904();
    }
    v26 = v0[3];
    PhotosBasicItemListManager.itemList.getter();
    swift_bridgeObjectRetain();
    swift_release();
    v14 = swift_getAssociatedTypeWitness();
    v15 = swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v16 = sub_24437A5EC();
    v17 = swift_bridgeObjectRelease();
    if ((v16 & 1) == 0
      || (v18 = *(unsigned __int8 *)(PhotosBasicItemListManager.itemList.getter() + 40),
          v17 = swift_release(),
          v18 != v36))
    {
      v21[1] = v21;
      v35 = v10;
      MEMORY[0x24BDAC7A8](v17);
      v21[-4] = v1;
      v21[-3] = v24;
      v21[-2] = &v36;
      sub_24437A5E0();
      v19 = *(_QWORD *)(v23 + 88);
      v20 = *(_QWORD *)(v23 + 104);
      v27 = v22;
      v28 = v19;
      v29 = v14;
      v30 = v19;
      v31 = v3;
      v32 = v20;
      v33 = v15;
      v34 = v20;
      type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v24, AssociatedTypeWitness);
  }
  OUTLINED_FUNCTION_1();
}

uint64_t sub_24432B480(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t AssociatedConformanceWitness;
  uint64_t result;
  void (*v14)(uint64_t, uint64_t);
  uint64_t v15;
  unsigned __int8 v16;
  char *v17;
  char v18;
  void (*v19)(char *, uint64_t);
  char *v20;
  unsigned __int8 *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v23 = a1;
  v21 = a3;
  v3 = *(_QWORD *)(*(_QWORD *)a2 + 104);
  v4 = *(_QWORD *)(*(_QWORD *)a2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v22 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v6 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v20 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v20 - v8;
  v10 = sub_24432A774();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  v11 = swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x24950BD14](&v25, v23, v10, v11, v4, AssociatedConformanceWitness);
  result = swift_bridgeObjectRelease();
  if (v25)
  {
    v14 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
    v14(v4, v3);
    v15 = swift_getAssociatedConformanceWitness();
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v15 + 112))(&v24, AssociatedTypeWitness, v15);
    v16 = v24;
    v17 = v20;
    if (*v21 < v24)
      v16 = *v21;
    *v21 = v16;
    v14(v4, v3);
    v18 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 40))(AssociatedTypeWitness, v15);
    swift_unknownObjectRelease();
    v19 = *(void (**)(char *, uint64_t))(v22 + 8);
    v19(v17, AssociatedTypeWitness);
    v19(v9, AssociatedTypeWitness);
    return (v18 & 1) == 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_24432B728(uint64_t a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, unsigned __int8 *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedTypeWitness;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedConformanceWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int8 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unsigned __int8 *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43[4];
  uint64_t v44;

  v42 = a3;
  v40 = a4;
  v41 = a5;
  v44 = a1;
  v5 = *a2;
  v6 = *(_QWORD *)(*a2 + 88);
  v32 = *(_QWORD *)(*a2 + 104);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v36 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v37 = AssociatedTypeWitness;
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v35 = (char *)&v30 - v8;
  v9 = *(_QWORD *)(v5 + 96);
  v10 = *(_QWORD *)(v5 + 80);
  swift_getAssociatedTypeWitness();
  v38 = v10;
  v39 = v9;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v12 = swift_getAssociatedTypeWitness();
  v13 = sub_24437A808();
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v30 - v15;
  v31 = *(_QWORD *)(v12 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v34 = (char *)&v30 - v17;
  v18 = sub_24432A774();
  v19 = swift_getAssociatedConformanceWitness();
  v20 = swift_getAssociatedTypeWitness();
  v33 = v19;
  v21 = v44;
  v22 = swift_getAssociatedConformanceWitness();
  MEMORY[0x24950BD14](v43, v21, v18, v20, v6, v22);
  swift_bridgeObjectRelease();
  if (v43[0])
  {
    v43[3] = v20;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v43);
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(boxed_opaque_existential_0, v21, v20);
    v24 = swift_checkMetadataState();
    PhotosItemList.item(for:)((uint64_t)v43, v24, AssociatedConformanceWitness);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v43);
    if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, v12) != 1)
    {
      v25 = (uint64_t)v34;
      (*(void (**)(char *, char *, uint64_t))(v31 + 32))(v34, v16, v12);
      v26 = v35;
      (*(void (**)(uint64_t, uint64_t))(v32 + 40))(v6, v32);
      v27 = v37;
      v28 = swift_getAssociatedConformanceWitness();
      (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v28 + 112))(v43, v27, v28);
      (*(void (**)(char *, uint64_t))(v36 + 8))(v26, v27);
      v29 = v43[0];
      if (*v40 < LOBYTE(v43[0]))
        v29 = *v40;
      *v40 = v29;
      PhotosChildProvidingItemListManager.ChildItem.init(parentItem:child:)(v25, v12, v41);
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void PhotosChildProvidingItemListManager.ChildItem.init(parentItem:child:)(uint64_t a1@<X0>, uint64_t a2@<X4>, uint64_t a3@<X8>)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1, a2);
  type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
}

uint64_t sub_24432BB14(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(result + 84)) = v1;
  return result;
}

void sub_24432BB3C()
{
  swift_retain();
  sub_244331C08();
}

uint64_t sub_24432BB6C()
{
  return PhotosBasicItemListManager.itemList.getter();
}

uint64_t sub_24432BB8C()
{
  return swift_retain();
}

void sub_24432BB98()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_retain();
  type metadata accessor for PhotosChildProvidingItemListManager.ChildItem();
}

void sub_24432BC8C()
{
  OUTLINED_FUNCTION_7_3();
}

id sub_24432BC9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  id v6;

  v5 = type metadata accessor for PhotosBasicItemListManager(0, v4, a1, a4);
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, v5);
  v6 = PhotosComposedObservable<>.observeChanges(using:)();
  swift_release();
  return v6;
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.parentItem.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) - 8) + 16))(a2, v2);
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.child.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.id.getter(uint64_t a1)
{
  return OUTLINED_FUNCTION_3_5(a1, *(_QWORD *)(a1 + 64), *(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 64));
}

uint64_t PhotosChildProvidingItemListManager.ChildItem.value.getter(uint64_t a1)
{
  return OUTLINED_FUNCTION_3_5(a1, *(_QWORD *)(a1 + 64), *(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 64) + 72));
}

uint64_t PhotosChildProvidingItemListManager.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosChildProvidingItemListManager.__deallocating_deinit()
{
  PhotosChildProvidingItemListManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24432BDC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_24432BB6C();
  *a1 = result;
  return result;
}

void sub_24432BDE8()
{
  sub_24432BB98();
}

void PhotosItemListManager.provideChildItemListManagers<A>(options:childProvider:childUpdater:)()
{
  type metadata accessor for PhotosChildProvidingItemListManager();
}

void sub_24432BE50()
{
  swift_unknownObjectRetain();
  swift_retain();
  swift_retain();
  OUTLINED_FUNCTION_8_3();
  PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)();
}

void type metadata accessor for PhotosChildProvidingItemListManager.ChildItem()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_24432BEAC()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_24432BED0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24432BEF4(uint64_t *a1)
{
  return sub_24432C7FC(a1, (void (*)(void))sub_24432A824);
}

void type metadata accessor for PhotosChildProvidingItemListManager()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_24432BF0C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24432BF2C()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24432BF4C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosChildProvidingItemListManager<A, B>.ChildItem<A1, B1>);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

void sub_24432BF78()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t sub_24432BF88(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosChildProvidingItemListManager<A, B>);
  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosChildProvidingItemListManager<A, B>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_24432BFCC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosChildProvidingItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.__allocating_init(parentItemListManager:options:childProvider:childUpdater:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 184))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.itemList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.changeDetailsRepository.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of PhotosChildProvidingItemListManager.observeChanges(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t sub_24432C088()
{
  return swift_allocateGenericValueMetadata();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_24432C09C(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t sub_24432C134(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_24432C180 + 4 * byte_2443896C5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_24432C1B4 + 4 * asc_2443896C0[v4]))();
}

uint64_t sub_24432C1B4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_24432C1BC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24432C1C4);
  return result;
}

uint64_t sub_24432C1D0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x24432C1D8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_24432C1DC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24432C1E4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

void type metadata accessor for PhotosChildProvidingItemListManager.Options()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_24432C1FC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_24432C204()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_24432C278(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    swift_unknownObjectRetain();
  }
  return v4;
}

uint64_t sub_24432C32C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 8))();
  return swift_unknownObjectRelease();
}

uint64_t sub_24432C36C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_unknownObjectRetain();
  return a1;
}

uint64_t sub_24432C3CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_24432C438(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 32))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  return a1;
}

uint64_t sub_24432C494(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_unknownObjectRelease();
  return a1;
}

uint64_t sub_24432C4F8(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 32);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_24432C574 + 4 * byte_2443896CA[v11]))();
  }
}

void sub_24432C5F4(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_24432C6E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
        v9 = a2 ^ 0x80000000;
      else
        v9 = (a2 - 1);
      *v8 = v9;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

void sub_24432C76C(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  sub_24432B728(a1, *(uint64_t **)(v2 + 16), *(_QWORD *)(v2 + 24), *(unsigned __int8 **)(v2 + 32), a2);
}

void sub_24432C78C()
{
  sub_24432BB3C();
}

uint64_t sub_24432C794(uint64_t a1)
{
  uint64_t v1;

  return sub_24432B480(a1, *(_QWORD *)(v1 + 16), *(unsigned __int8 **)(v1 + 24)) & 1;
}

uint64_t sub_24432C7B0()
{
  return sub_24432AE80();
}

uint64_t sub_24432C7C0(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 48))(a1, *a2) & 1;
}

uint64_t sub_24432C7F0(uint64_t *a1)
{
  return sub_24432C7FC(a1, sub_24432B000);
}

uint64_t sub_24432C7FC(uint64_t *a1, void (*a2)(void))
{
  uint64_t *v2;

  return sub_24432AF9C(a1, v2[6], v2[2], v2[3], v2[4], v2[5], a2);
}

uint64_t OUTLINED_FUNCTION_2_9()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_3_5(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  return a3(*(_QWORD *)(a1 + 32));
}

uint64_t OUTLINED_FUNCTION_4_6()
{
  uint64_t (*v0)(uint64_t, _QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return v0(v2, *(_QWORD *)(v3 - 264), v1);
}

uint64_t OUTLINED_FUNCTION_5_4()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t OUTLINED_FUNCTION_6_2()
{
  return swift_getAssociatedTypeWitness();
}

void OUTLINED_FUNCTION_7_3()
{
  JUMPOUT(0x24950D28CLL);
}

void OUTLINED_FUNCTION_9_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_10_2()
{
  return swift_getTupleTypeMetadata2();
}

BOOL sub_24432C898(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;
  _BYTE v10[16];
  _BYTE v11[16];

  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a2 + 8);
  sub_24432CA60(a1, (uint64_t)v11);
  sub_24432CA60(a2, (uint64_t)v10);
  if (v3 != v4)
    goto LABEL_7;
  v5 = MEMORY[0x24950D424](v11);
  v6 = MEMORY[0x24950D424](v10);
  v7 = v6;
  if (!v5)
  {
    if (!v6)
    {
      v8 = 1;
      goto LABEL_8;
    }
    OUTLINED_FUNCTION_0_11();
    goto LABEL_7;
  }
  swift_unknownObjectRelease();
  if (!v7)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  OUTLINED_FUNCTION_0_11();
  v8 = v5 == v7;
LABEL_8:
  sub_24432CAA8((uint64_t)v10);
  sub_24432CAA8((uint64_t)v11);
  return v8;
}

uint64_t PhotosDisplayRect.init(rect:in:)@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>)
{
  uint64_t v6;
  uint64_t result;

  *(double *)(a1 + 16) = a2;
  *(double *)(a1 + 24) = a3;
  *(double *)(a1 + 32) = a4;
  *(double *)(a1 + 40) = a5;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v6 = sub_24437A448();
  result = swift_unknownObjectRelease();
  *(_QWORD *)(a1 + 8) = v6;
  return result;
}

double PhotosDisplayRect.rect(in:)(uint64_t a1)
{
  uint64_t v1;
  double *v2;
  void *v4;
  double v5;
  double v6;
  _BYTE v8[16];

  v2 = (double *)v1;
  sub_24432CA60(v1, (uint64_t)v8);
  v4 = (void *)MEMORY[0x24950D424](v8);
  sub_24432CAA8((uint64_t)v8);
  if (!v4)
    return *MEMORY[0x24BDBF070];
  objc_msgSend(v4, sel_convertRect_toCoordinateSpace_, a1, v2[2], v2[3], v2[4], v2[5]);
  v6 = v5;
  OUTLINED_FUNCTION_0_11();
  return v6;
}

uint64_t sub_24432CA60(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356720);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_24432CAA8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356720);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

BOOL static PhotosDisplayRect.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  return sub_24432C898(a1, a2) && CGRectEqualToRect(*(CGRect *)(a1 + 16), *(CGRect *)(a2 + 16));
}

__n128 initializeWithCopy for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = swift_unknownObjectWeakCopyInit();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  result = *(__n128 *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

double assignWithCopy for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  double result;

  v3 = swift_unknownObjectWeakCopyAssign();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(v3 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(v3 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(v3 + 32) = *(_QWORD *)(a2 + 32);
  result = *(double *)(a2 + 40);
  *(double *)(v3 + 40) = result;
  return result;
}

__n128 initializeWithTake for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = swift_unknownObjectWeakTakeInit();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  result = *(__n128 *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

__n128 assignWithTake for PhotosDisplayRect(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  v3 = swift_unknownObjectWeakTakeAssign();
  *(_QWORD *)(v3 + 8) = *(_QWORD *)(a2 + 8);
  result = *(__n128 *)(a2 + 16);
  v5 = *(_OWORD *)(a2 + 32);
  *(__n128 *)(v3 + 16) = result;
  *(_OWORD *)(v3 + 32) = v5;
  return result;
}

ValueMetadata *type metadata accessor for PhotosDisplayRect()
{
  return &type metadata for PhotosDisplayRect;
}

uint64_t OUTLINED_FUNCTION_0_11()
{
  return swift_unknownObjectRelease();
}

double sub_24432CC20@<D0>(uint64_t a1@<X2>, _OWORD *a2@<X8>)
{
  unint64_t v4;
  char v5;
  double result;

  if (*(_QWORD *)(a1 + 16) && (v4 = sub_24432D690(), (v5 & 1) != 0))
  {
    sub_244324EB8(*(_QWORD *)(a1 + 56) + 32 * v4, (uint64_t)a2);
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_24432CC70(uint64_t a1, uint64_t a2)
{
  char v2;

  if (*(_QWORD *)(a2 + 16) && (sub_24432D6F0(a1), (v2 & 1) != 0))
    return swift_retain();
  else
    return 0;
}

double sub_24432CCB0@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  unint64_t v5;
  char v6;
  double result;

  if (*(_QWORD *)(a2 + 16) && (v5 = sub_24432D720(a1), (v6 & 1) != 0))
  {
    sub_244324EB8(*(_QWORD *)(a2 + 56) + 32 * v5, (uint64_t)a3);
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_24432CD00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _OWORD v6[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_24432DBD8((_OWORD *)a1, v6);
    sub_24432D990(v6, a2, a3);
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_244324FE4(a1);
    sub_244334D74(v6);
    swift_bridgeObjectRelease();
    return sub_244324FE4((uint64_t)v6);
  }
}

uint64_t PhotosEnvironment.value<A>(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a3 + 8))(&v4, a2, a3);
  swift_getAtKeyPath();
  return OUTLINED_FUNCTION_3_6();
}

uint64_t PhotosMutableEnvironment.setValue<A>(_:for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(_BYTE *, _QWORD);
  _BYTE v10[32];

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(_BYTE *))(v6 + 16))(&v10[-v7]);
  v8 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(a4 + 24))(v10, a3, a4);
  swift_setAtWritableKeyPath();
  return v8(v10, 0);
}

uint64_t PhotosMutableEnvironment.setValues(_:)(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v5)(_BYTE *, _QWORD);
  uint64_t v6;
  _BYTE v8[32];

  v5 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(a4 + 24))(v8, a3, a4);
  a1(v6);
  return v5(v8, 0);
}

uint64_t PhotosMutableEnvironment.adoptEnvironmentValues(from:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t ObjectType;
  uint64_t (*v8)(_BYTE *, _QWORD);
  _BYTE v10[32];
  uint64_t v11;
  uint64_t v12;

  ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 8))(&v12, ObjectType, a2);
  v11 = v12;
  v8 = (uint64_t (*)(_BYTE *, _QWORD))(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(a4 + 24))(v10, a3, a4);
  PhotosEnvironmentValues.takeValues(from:)((PhotosUIFoundation::PhotosEnvironmentValues)&v11);
  swift_bridgeObjectRelease();
  return v8(v10, 0);
}

Swift::Void __swiftcall PhotosEnvironmentValues.takeValues(from:)(PhotosUIFoundation::PhotosEnvironmentValues from)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  char v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  char v24;
  _OWORD *v25;
  _QWORD *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  _QWORD *v33;
  __int128 v34;
  _OWORD v35[2];
  uint64_t v36;
  uint64_t v37;
  __int128 v38;

  v2 = v1;
  v3 = *(_QWORD *)from.values._rawValue;
  v30 = v3 + 64;
  v4 = 1 << *(_BYTE *)(v3 + 32);
  v5 = -1;
  if (v4 < 64)
    v5 = ~(-1 << v4);
  v6 = v5 & *(_QWORD *)(v3 + 64);
  v31 = (unint64_t)(v4 + 63) >> 6;
  v32 = v3;
  swift_bridgeObjectRetain();
  v7 = 0;
  if (!v6)
    goto LABEL_6;
LABEL_4:
  v8 = __clz(__rbit64(v6));
  v6 &= v6 - 1;
  v9 = v8 | (v7 << 6);
LABEL_5:
  v10 = *(_QWORD *)(v32 + 56);
  v11 = (_QWORD *)(*(_QWORD *)(v32 + 48) + 16 * v9);
  v12 = v11[1];
  *(_QWORD *)&v34 = *v11;
  *((_QWORD *)&v34 + 1) = v12;
  sub_244324EB8(v10 + 32 * v9, (uint64_t)v35);
  swift_bridgeObjectRetain();
  while (1)
  {
    sub_24432DB90((uint64_t)&v34, (uint64_t)&v36);
    v16 = v37;
    if (!v37)
    {
      swift_release();
      return;
    }
    v17 = v36;
    sub_24432DBD8(&v38, &v34);
    swift_isUniquelyReferenced_nonNull_native();
    v18 = (_QWORD *)*v2;
    v33 = (_QWORD *)*v2;
    *v2 = 0x8000000000000000;
    v19 = OUTLINED_FUNCTION_1_9();
    if (__OFADD__(v18[2], (v20 & 1) == 0))
      break;
    v21 = v19;
    v22 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257356F20);
    if ((sub_24437A994() & 1) != 0)
    {
      v23 = OUTLINED_FUNCTION_1_9();
      if ((v22 & 1) != (v24 & 1))
        goto LABEL_40;
      v21 = v23;
    }
    if ((v22 & 1) != 0)
    {
      v25 = (_OWORD *)(v33[7] + 32 * v21);
      __swift_destroy_boxed_opaque_existential_0((uint64_t)v25);
      sub_24432DBD8(&v34, v25);
    }
    else
    {
      v33[(v21 >> 6) + 8] |= 1 << v21;
      v26 = (_QWORD *)(v33[6] + 16 * v21);
      *v26 = v17;
      v26[1] = v16;
      sub_24432DBD8(&v34, (_OWORD *)(v33[7] + 32 * v21));
      v27 = v33[2];
      v28 = __OFADD__(v27, 1);
      v29 = v27 + 1;
      if (v28)
        goto LABEL_37;
      v33[2] = v29;
      swift_bridgeObjectRetain();
    }
    *v2 = v33;
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_3_6();
    if (v6)
      goto LABEL_4;
LABEL_6:
    v13 = v7 + 1;
    if (__OFADD__(v7, 1))
      goto LABEL_38;
    if (v13 < v31)
    {
      v14 = *(_QWORD *)(v30 + 8 * v13);
      if (v14)
        goto LABEL_9;
      v15 = v7 + 2;
      ++v7;
      if (v13 + 1 < v31)
      {
        v14 = *(_QWORD *)(v30 + 8 * v15);
        if (v14)
          goto LABEL_12;
        v7 = v13 + 1;
        if (v13 + 2 < v31)
        {
          v14 = *(_QWORD *)(v30 + 8 * (v13 + 2));
          if (v14)
          {
            v13 += 2;
            goto LABEL_9;
          }
          v15 = v13 + 3;
          v7 = v13 + 2;
          if (v13 + 3 < v31)
          {
            v14 = *(_QWORD *)(v30 + 8 * v15);
            if (!v14)
            {
              while (1)
              {
                v13 = v15 + 1;
                if (__OFADD__(v15, 1))
                  goto LABEL_39;
                if (v13 >= v31)
                {
                  v7 = v31 - 1;
                  goto LABEL_23;
                }
                v14 = *(_QWORD *)(v30 + 8 * v13);
                ++v15;
                if (v14)
                  goto LABEL_9;
              }
            }
LABEL_12:
            v13 = v15;
LABEL_9:
            v6 = (v14 - 1) & v14;
            v9 = __clz(__rbit64(v14)) + (v13 << 6);
            v7 = v13;
            goto LABEL_5;
          }
        }
      }
    }
LABEL_23:
    v6 = 0;
    memset(v35, 0, sizeof(v35));
    v34 = 0u;
  }
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  sub_24437AAA8();
  __break(1u);
}

PhotosUIFoundation::PhotosEnvironmentValues __swiftcall PhotosEnvironmentValues.init()()
{
  _QWORD *v0;
  PhotosUIFoundation::PhotosEnvironmentValues result;

  *v0 = MEMORY[0x24BEE4B00];
  return result;
}

uint64_t PhotosEnvironmentValues.subscript.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;
  void (*v11)(uint64_t);
  _OWORD v12[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = sub_24437A808();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v12 - v6;
  v8 = *v1;
  sub_24432D428();
  sub_24432CC20(v8, v12);
  OUTLINED_FUNCTION_3_6();
  __swift_instantiateConcreteTypeFromMangledName(&qword_257355AF0);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_2_10((uint64_t)v7, 0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(a1, v7, AssociatedTypeWitness);
  }
  else
  {
    OUTLINED_FUNCTION_2_10((uint64_t)v7, 1);
    v10 = OUTLINED_FUNCTION_32();
    v11(v10);
    return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
}

uint64_t sub_24432D428()
{
  swift_getMetatypeMetadata();
  return sub_24437A484();
}

uint64_t PhotosEnvironmentValues.subscript.setter(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t *boxed_opaque_existential_0;
  uint64_t v7;
  uint64_t v9[4];

  v2 = sub_24432D428();
  v4 = v3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[3] = AssociatedTypeWitness;
  boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0(v9);
  v7 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v7 + 16))(boxed_opaque_existential_0, a1, AssociatedTypeWitness);
  sub_24432CD00((uint64_t)v9, v2, v4);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(a1, AssociatedTypeWitness);
}

void (*PhotosEnvironmentValues.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4))(uint64_t a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;
  size_t v12;
  uint64_t v13;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[2] = a4;
  v9[3] = v4;
  *v9 = a2;
  v9[1] = a3;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9[4] = AssociatedTypeWitness;
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v9[5] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[6] = malloc(v12);
  v9[7] = malloc(v12);
  OUTLINED_FUNCTION_32();
  PhotosEnvironmentValues.subscript.getter(v13);
  return sub_24432D5E0;
}

void sub_24432D5E0(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 48);
  v4 = *(void **)(*(_QWORD *)a1 + 56);
  if ((a2 & 1) != 0)
  {
    v5 = v2[4];
    v6 = v2[5];
    (*(void (**)(_QWORD, void *, uint64_t))(v6 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 48), v4, v5);
    PhotosEnvironmentValues.subscript.setter((uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    PhotosEnvironmentValues.subscript.setter(*(_QWORD *)(*(_QWORD *)a1 + 56));
  }
  free(v4);
  free(v3);
  free(v2);
}

unint64_t sub_24432D690()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_24437AAFC();
  sub_24437A490();
  sub_24437AB14();
  v0 = OUTLINED_FUNCTION_32();
  return sub_24432D750(v0, v1, v2);
}

unint64_t sub_24432D6F0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24437AAF0();
  return sub_24432D830(a1, v2);
}

unint64_t sub_24432D720(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24437A874();
  return sub_24432D8CC(a1, v2);
}

unint64_t sub_24432D750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24437AA6C() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24437AA6C() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_24432D830(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_24432D8CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_24432DD7C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x24950C1AC](v9, a1);
      sub_24432DDB8((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_24432D990(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v8;

  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v3;
  *v3 = 0x8000000000000000;
  sub_24432DA74(a1, a2, a3);
  *v3 = v8;
  return swift_bridgeObjectRelease();
}

uint64_t sub_24432DA0C()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  swift_isUniquelyReferenced_nonNull_native();
  v4 = *v0;
  *v0 = 0x8000000000000000;
  v1 = OUTLINED_FUNCTION_32();
  sub_24432DBE8(v1, v2);
  *v0 = v4;
  return swift_bridgeObjectRelease();
}

_OWORD *sub_24432DA74(_OWORD *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  _QWORD **v4;
  _QWORD *v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  unint64_t v13;
  char v14;
  _QWORD *v15;
  _OWORD *v16;
  _OWORD *result;

  v4 = (_QWORD **)v3;
  v8 = (_QWORD *)*v3;
  v9 = sub_24432D690();
  if (__OFADD__(v8[2], (v10 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v11 = v9;
  v12 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F20);
  if ((sub_24437A994() & 1) == 0)
    goto LABEL_5;
  v13 = sub_24432D690();
  if ((v12 & 1) != (v14 & 1))
  {
LABEL_9:
    result = (_OWORD *)sub_24437AAA8();
    __break(1u);
    return result;
  }
  v11 = v13;
LABEL_5:
  v15 = *v4;
  if ((v12 & 1) != 0)
  {
    v16 = (_OWORD *)(v15[7] + 32 * v11);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v16);
    return sub_24432DBD8(a1, v16);
  }
  else
  {
    sub_24432DCE4(v11, a2, a3, a1, v15);
    return (_OWORD *)swift_bridgeObjectRetain();
  }
}

uint64_t sub_24432DB90(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257355AE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_24432DBD8(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_24432DBE8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD **v3;
  _QWORD *v6;
  unint64_t v7;
  char v8;
  unint64_t v9;
  char v10;
  unint64_t v11;
  char v12;
  _QWORD *v13;
  uint64_t v14;
  unint64_t result;

  v3 = (_QWORD **)v2;
  v6 = (_QWORD *)*v2;
  v7 = sub_24432D6F0(a2);
  if (__OFADD__(v6[2], (v8 & 1) == 0))
  {
    __break(1u);
    goto LABEL_9;
  }
  v9 = v7;
  v10 = v8;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F28);
  if ((sub_24437A994() & 1) == 0)
    goto LABEL_5;
  v11 = sub_24432D6F0(a2);
  if ((v10 & 1) != (v12 & 1))
  {
LABEL_9:
    result = sub_24437AAA8();
    __break(1u);
    return result;
  }
  v9 = v11;
LABEL_5:
  v13 = *v3;
  if ((v10 & 1) == 0)
    return sub_24432DDEC(v9, a2, a1, v13);
  v14 = v13[7];
  result = swift_release();
  *(_QWORD *)(v14 + 8 * v9) = a1;
  return result;
}

_OWORD *sub_24432DCE4(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_24432DBD8(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t dispatch thunk of PhotosEnvironment.environmentValues.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosMutableEnvironment.environmentValues.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of PhotosMutableEnvironment.environmentValues.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

ValueMetadata *type metadata accessor for PhotosEnvironmentValues()
{
  return &type metadata for PhotosEnvironmentValues;
}

uint64_t dispatch thunk of static PhotosEnvironmentKey.defaultValue.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_24432DD7C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_24432DDB8(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

unint64_t sub_24432DDEC(unint64_t result, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  uint64_t v4;
  BOOL v5;
  uint64_t v6;

  a4[(result >> 6) + 8] |= 1 << result;
  *(_QWORD *)(a4[6] + 8 * result) = a2;
  *(_QWORD *)(a4[7] + 8 * result) = a3;
  v4 = a4[2];
  v5 = __OFADD__(v4, 1);
  v6 = v4 + 1;
  if (v5)
    __break(1u);
  else
    a4[2] = v6;
  return result;
}

unint64_t OUTLINED_FUNCTION_1_9()
{
  return sub_24432D690();
}

uint64_t OUTLINED_FUNCTION_2_10(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_3_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t dispatch thunk of PhotosModel.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t static BasicBuilder.buildBlock()()
{
  return sub_24437A568();
}

void static BasicBuilder.buildBlock(_:)()
{
  sub_24437A5E0();
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_1_10();
}

uint64_t sub_24432DEA0()
{
  uint64_t v0;
  uint64_t v1;

  MEMORY[0x24950D28C](v1, v0);
  return sub_24437A508();
}

uint64_t static BasicBuilder.buildExpression(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_24432E0A4(a2, a2);
  v4 = *(_QWORD *)(a2 - 8);
  swift_allocObject();
  v5 = sub_24437A544();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  OUTLINED_FUNCTION_0_12();
  return v5;
}

void static BasicBuilder.buildArray(_:)()
{
  uint64_t v0;

  sub_24437A5E0();
  v0 = sub_24437A5E0();
  swift_bridgeObjectRetain();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v0);
  OUTLINED_FUNCTION_1_10();
}

uint64_t sub_24432DFD0()
{
  uint64_t v0;

  sub_24437A514();
  v0 = sub_24437A97C();
  MEMORY[0x24950D28C](MEMORY[0x24BEE2AC8], v0);
  return sub_24437A5F8();
}

uint64_t static BasicBuilder.buildOptional(_:)(uint64_t a1)
{
  uint64_t v1;

  if (a1)
    v1 = a1;
  else
    v1 = sub_24437A568();
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_24432E088@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *a1;
  return swift_bridgeObjectRetain();
}

uint64_t sub_24432E0A4(uint64_t a1, uint64_t a2)
{
  if (dynamic_cast_existential_0_class_conditional(a2))
    return __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257357930);
  else
    return sub_24437AA48();
}

uint64_t sub_24432E0E4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t type metadata accessor for BasicBuilder(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for BasicBuilder);
}

uint64_t dynamic_cast_existential_0_class_conditional(uint64_t a1)
{
  if (swift_isClassType())
    return a1;
  else
    return 0;
}

uint64_t OUTLINED_FUNCTION_0_12()
{
  return sub_24437A5E0();
}

void OUTLINED_FUNCTION_1_10()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t UIAction.init(menuAction:)(void *a1)
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  id v7;

  v2 = objc_msgSend(a1, sel_image);
  if (!v2)
  {
    v2 = OUTLINED_FUNCTION_0_13(0, sel_systemImageName);
    v3 = v2;
    if (v2)
    {
      sub_24437A46C();

      sub_24432E3E4();
      v2 = sub_24432E28C();
    }
  }
  v4 = OUTLINED_FUNCTION_0_13((uint64_t)v2, sel_title);
  sub_24437A46C();

  v6 = OUTLINED_FUNCTION_0_13(v5, sel_role);
  v7 = OUTLINED_FUNCTION_0_13((uint64_t)v6, sel_state);
  sub_24432E2EC((unint64_t)v7);
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  return sub_24437A7FC();
}

id sub_24432E28C()
{
  void *v0;
  id v1;

  v0 = (void *)sub_24437A460();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_systemImageNamed_, v0);

  return v1;
}

unint64_t sub_24432E2EC(unint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5[16];
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (result >= 3)
  {
    v6 = v2;
    v7 = v1;
    v8 = v3;
    v9 = v4;
    sub_24437A8B0();
    swift_bridgeObjectRelease();
    strcpy(v5, "unknown state ");
    v5[15] = -18;
    type metadata accessor for PXMenuActionState(0);
    sub_24437A484();
    sub_24437A49C();
    swift_bridgeObjectRelease();
    result = sub_24437A9B8();
    __break(1u);
  }
  return result;
}

uint64_t sub_24432E3B0()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_24432E3D4()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 16), sel_performAction);
}

unint64_t sub_24432E3E4()
{
  unint64_t result;

  result = qword_2573579A0;
  if (!qword_2573579A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2573579A0);
  }
  return result;
}

id OUTLINED_FUNCTION_0_13(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t sub_24432E42C()
{
  uint64_t v0;

  v0 = swift_unknownObjectRetain();
  return sub_24432E454(v0);
}

uint64_t sub_24432E454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
  swift_unknownObjectRelease();
  if (v3 != a1)
  {
    swift_unknownObjectRetain();
    sub_24432E504();
    objc_msgSend(*(id *)(v1 + 48), sel_signalChange_, 1);
  }
  return swift_unknownObjectRelease();
}

uint64_t _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0()
{
  swift_getKeyPath();
  sub_24432E8E4();
  swift_release();
  return swift_unknownObjectRetain();
}

uint64_t sub_24432E504()
{
  swift_getKeyPath();
  sub_24432E97C();
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t PhotosGenericItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

void PhotosGenericItemListManager.__allocating_init(itemList:)(uint64_t a1)
{
  swift_allocObject();
  PhotosGenericItemListManager.init(itemList:)(a1);
  OUTLINED_FUNCTION_2();
}

_QWORD *PhotosGenericItemListManager.init(itemList:)(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;

  type metadata accessor for PhotosItemListChangeDetailsRepository();
  swift_allocObject();
  v3 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v1[3] = 0;
  v1[4] = 0;
  v1[2] = v3;
  v1[6] = objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_24437A2EC();
  v1[5] = a1;
  return v1;
}

uint64_t sub_24432E648@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(double *@<X0>, _BYTE *@<X8>);

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_24432EFBC;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24432ED10(v4);
}

uint64_t sub_24432E6D0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(double);
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_24432EFB4;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  swift_beginAccess();
  v8 = *(_QWORD *)(v7 + 24);
  *(_QWORD *)(v7 + 24) = v6;
  *(_QWORD *)(v7 + 32) = v5;
  sub_24432ED10(v3);
  return sub_24432ED20(v8);
}

uint64_t PhotosGenericItemListManager.waitForItemListHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_0_14();
  v1 = *(_QWORD *)(v0 + 24);
  sub_24432ED10(v1);
  return v1;
}

uint64_t PhotosGenericItemListManager.waitForItemListHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 24);
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return sub_24432ED20(v5);
}

uint64_t (*PhotosGenericItemListManager.waitForItemListHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Bool __swiftcall PhotosGenericItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, double);
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_0_14();
  v3 = *(uint64_t (**)(uint64_t, double))(v1 + 24);
  if (v3)
  {
    v4 = swift_retain();
    v5 = v3(v4, timeout);
    sub_24432ED20((uint64_t)v3);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

uint64_t sub_24432E8BC()
{
  swift_unknownObjectRetain();
  return sub_24432E504();
}

uint64_t sub_24432E8E4()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGenericItemListManager<A>, *v0);
  return sub_24437A2C8();
}

uint64_t sub_24432E944(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 40) = a2;
  swift_unknownObjectRetain();
  return swift_unknownObjectRelease();
}

uint64_t sub_24432E97C()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGenericItemListManager<A>, *v0);
  return sub_24437A2BC();
}

void PhotosGenericItemListManager.createMutator()()
{
  uint64_t *v0;

  type metadata accessor for PhotosGenericItemListManager.Mutator(0, *(_QWORD *)(*v0 + 80), *v0, *(_QWORD *)(*v0 + 88));
  sub_24432EA58((uint64_t)v0);
  swift_retain();
  OUTLINED_FUNCTION_2();
}

void sub_24432EA58(uint64_t a1)
{
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  OUTLINED_FUNCTION_2();
}

void sub_24432EA84()
{
  uint64_t v0;

  v0 = swift_unknownObjectRetain();
  sub_24432EAC8(v0);
}

void sub_24432EAAC()
{
  _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
  OUTLINED_FUNCTION_2();
}

void sub_24432EAC8(uint64_t a1)
{
  sub_24432E454(a1);
  OUTLINED_FUNCTION_2();
}

void (*sub_24432EAE4(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  sub_24432EAAC();
  *a1 = v3;
  return sub_24432EB18;
}

void sub_24432EB18(uint64_t *a1, char a2)
{
  uint64_t v2;

  if ((a2 & 1) != 0)
  {
    v2 = swift_unknownObjectRetain();
    sub_24432EAC8(v2);
    swift_unknownObjectRelease();
  }
  else
  {
    sub_24432EAC8(*a1);
    OUTLINED_FUNCTION_2();
  }
}

void sub_24432EB58(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  swift_retain();
  sub_24433C5A0(a2);
  swift_release();
  v3 = swift_unknownObjectRetain();
  sub_24432E454(v3);
  OUTLINED_FUNCTION_31();
}

uint64_t PhotosGenericItemListManager.Mutator.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PhotosGenericItemListManager.Mutator.__deallocating_deinit()
{
  PhotosGenericItemListManager.Mutator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24432EBE4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosGenericItemListManager.changeDetailsRepository.getter();
  *a1 = result;
  return result;
}

id PhotosGenericItemListManager.observable.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

void PhotosGenericItemListManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_release();
  sub_24432ED20(*(_QWORD *)(v0 + 24));
  swift_unknownObjectRelease();

  v1 = v0 + qword_2573567B8;
  v2 = sub_24437A2F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_2();
}

uint64_t PhotosGenericItemListManager.__deallocating_deinit()
{
  PhotosGenericItemListManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24432EC94@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosGenericItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

void sub_24432ECC0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  PhotosGenericItemListManager.createMutator()();
  *a1 = v2;
}

id sub_24432ECE8@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = PhotosGenericItemListManager.observable.getter();
  *a1 = result;
  return result;
}

uint64_t sub_24432ED10(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_24432ED20(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t type metadata accessor for PhotosGenericItemListManager.Mutator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosGenericItemListManager.Mutator);
}

void sub_24432ED3C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24432ED64(a1, a2, a3, (uint64_t)&protocol conformance descriptor for PhotosGenericItemListManager<A>, (uint64_t)&protocol conformance descriptor for PhotosGenericItemListManager<A>);
}

void sub_24432ED50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24432ED64(a1, a2, a3, (uint64_t)&protocol conformance descriptor for PhotosGenericItemListManager<A>, (uint64_t)&protocol conformance descriptor for PhotosGenericItemListManager<A>);
}

void sub_24432ED64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(_QWORD *)(a1 + 8) = MEMORY[0x24950D28C](a4);
  *(_QWORD *)(a1 + 16) = MEMORY[0x24950D28C](a5, a2);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_24432EDA4(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGenericItemListManager<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_24432EDD0(_QWORD *a1@<X8>)
{
  *a1 = PhotosGenericItemListManager.itemList.getter();
  OUTLINED_FUNCTION_2();
}

void sub_24432EE10(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_24432EAAC();
  *a1 = v2;
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24432EE38()
{
  return 24;
}

__n128 sub_24432EE44(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_24432EE58()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A2F8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PhotosGenericItemListManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosGenericItemListManager);
}

uint64_t method lookup function for PhotosGenericItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.__allocating_init(itemList:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_24432EF14()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosGenericItemListManager.Mutator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.itemList.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PhotosGenericItemListManager.Mutator.setItemList(_:changeDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_24432EF90()
{
  swift_release();
  return swift_deallocObject();
}

void sub_24432EFB4(double a1)
{
  uint64_t v1;

  sub_2443314BC(*(void (**)(char *__return_ptr, double *))(v1 + 16), a1);
}

void sub_24432EFBC(double *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  sub_244331490(a1, *(uint64_t (**)(double))(v2 + 16), a2);
}

void sub_24432EFC4(uint64_t *a1@<X8>)
{
  *a1 = _s18PhotosUIFoundation0A22GenericItemListManagerC04itemE0xvg_0();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_24432EFF4()
{
  uint64_t v0;

  return sub_24432E944(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t OUTLINED_FUNCTION_0_14()
{
  return swift_beginAccess();
}

__n128 OUTLINED_FUNCTION_3_7(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

uint64_t OUTLINED_FUNCTION_4_7()
{
  return 16;
}

double static UIEdgeInsets.+ infix(_:_:)(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5;
}

double static UIEdgeInsets.- infix(_:_:)(double a1, double a2, double a3, double a4, double a5)
{
  return PXEdgeInsetsInvert(a5) + a1;
}

uint64_t PhotosItemListChangeDetails.fromItemListVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t PhotosItemListChangeDetails.toItemListVersion.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

id PhotosItemListChangeDetails.itemChangeDetails.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 16);
}

uint64_t PhotosItemListChangeDetails.init(from:to:itemChangeDetails:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  *a4 = result;
  a4[1] = a2;
  a4[2] = a3;
  return result;
}

uint64_t static PhotosItemListChangeDetails.== infix(_:_:)(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  if (*a1 != *a2 || a1[1] != a2[1])
    return 0;
  v4 = (void *)a2[2];
  v5 = (void *)a1[2];
  v6 = v5;
  v7 = v4;
  if (v5 == v4)
    v3 = 1;
  else
    v3 = objc_msgSend(v6, "isEqual:", v7);

  return v3;
}

uint64_t initializeBufferWithCopyOfBuffer for PhotosItemListChangeDetails(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v3;
  v4 = v3;
  return a1;
}

void destroy for PhotosItemListChangeDetails(uint64_t a1)
{

}

_QWORD *assignWithCopy for PhotosItemListChangeDetails(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  id v5;

  *a1 = *a2;
  a1[1] = a2[1];
  v3 = (void *)a2[2];
  v4 = (void *)a1[2];
  a1[2] = v3;
  v5 = v3;

  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for PhotosItemListChangeDetails(uint64_t a1, uint64_t a2)
{
  void *v3;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  v3 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosItemListChangeDetails(uint64_t a1, int a2)
{
  unint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *(_BYTE *)(a1 + 24))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *(_QWORD *)(a1 + 16);
      if (v2 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosItemListChangeDetails(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for PhotosItemListChangeDetails()
{
  return &type metadata for PhotosItemListChangeDetails;
}

uint64_t lerp<A>(_:_:mix:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  _QWORD v15[4];

  v15[0] = a3;
  v15[1] = a1;
  v15[2] = a2;
  v15[3] = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = (char *)v15 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v15 - v12;
  swift_getAssociatedConformanceWitness();
  sub_24437AA84();
  sub_24437AA54();
  sub_24437A9D0();
  OUTLINED_FUNCTION_0_15((uint64_t)v8);
  OUTLINED_FUNCTION_1_11();
  OUTLINED_FUNCTION_0_15((uint64_t)v11);
  OUTLINED_FUNCTION_1_11();
  sub_24437A9C4();
  OUTLINED_FUNCTION_0_15((uint64_t)v11);
  return OUTLINED_FUNCTION_0_15((uint64_t)v13);
}

uint64_t Comparable.clamped(to:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24437AA90();
  sub_24437A43C();
  sub_24437AA9C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, a2);
}

uint64_t OUTLINED_FUNCTION_0_15(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_1_11()
{
  return sub_24437A6A0();
}

void Array<A>.duplicatedElements.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v9[8];

  v4 = MEMORY[0x24BDAC7A8](a1);
  v9[3] = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9[0] = v8;
  MEMORY[0x24BDAC7A8](v7);
  v9[7] = sub_24437A3A0();
  v9[2] = a3;
  v9[6] = sub_24437A3A0();
  swift_bridgeObjectRetain();
  v9[5] = sub_24437A538();
  OUTLINED_FUNCTION_6_3();
}

void Array.randomized()(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(char *, uint64_t);
  _QWORD v17[2];
  __int128 v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a1;
  v4 = *(_QWORD *)(a2 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v5);
  v10 = (char *)v17 - v9;
  v22 = v8;
  swift_bridgeObjectRetain();
  v21 = sub_24437A394();
  v11 = OUTLINED_FUNCTION_0_12();
  v12 = MEMORY[0x24BEE17A8];
  v13 = MEMORY[0x24BEE1BD8];
  while (1)
  {
    *(_QWORD *)&v18 = v3;
    MEMORY[0x24950D28C](MEMORY[0x24BEE12D8], v11);
    sub_24437A6D0();
    v18 = v19;
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_257357330);
    v15 = sub_244320974();
    v17[0] = v12;
    v17[1] = v15;
    MEMORY[0x24950D28C](v13, v14, v17);
    sub_24437A718();
    if ((v20 & 1) != 0)
      break;
    sub_24437A604();
    sub_24437A5B0();
    v16 = *(void (**)(char *, uint64_t))(v4 + 8);
    v16(v7, a2);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v10, a2);
    sub_24437A598();
    v16(v10, a2);
    v3 = v22;
  }
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
}

uint64_t Array.remove(at:)(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  v5 = *(_QWORD *)(a2 + 16);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_1_12();
  v6 = sub_24437A394();
  v12 = v6;
  v7 = sub_24432FAC4(a1);
  v8 = *((_QWORD *)v7 + 2);
  if (v8)
  {
    for (i = 0; i != v8; ++i)
    {
      v10 = *(_QWORD *)&v7[8 * i + 32];
      if ((v10 & 0x8000000000000000) == 0 && v10 < MEMORY[0x24950BEB8](*v3, v5))
      {
        sub_24437A5B0();
        sub_24437A5A4();
      }
    }
    OUTLINED_FUNCTION_8_4();
    return v12;
  }
  else
  {
    OUTLINED_FUNCTION_8_4();
  }
  return v6;
}

char *sub_24432FAC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;
  char *v9;

  v3 = sub_24437A2A4();
  MEMORY[0x24BDAC7A8](v3);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v3);
  sub_244330838();
  v9 = (char *)sub_24437A4CC();
  sub_24432FF28(&v9);
  v6 = v9;
  if (v1)
    swift_release();
  return v6;
}

uint64_t Array.indexes(where:)@<X0>(uint64_t (*a1)(uint64_t)@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t TupleTypeMetadata2;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  void (*v20)(uint64_t, char *, uint64_t);
  _QWORD v22[2];
  uint64_t (*v23)(uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v23 = a1;
  v24 = a2;
  v25 = *(_QWORD *)(a4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_1_12();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v10 = sub_24437A808();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)v22 - v15;
  v22[0] = a5;
  sub_24437A298();
  v28 = a3;
  v17 = OUTLINED_FUNCTION_0_12();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v17);
  sub_24437A4E4();
  v26 = v27;
  sub_24437AA00();
  sub_24437A9DC();
  v22[1] = sub_24437A9F4();
  sub_24437A9E8();
  v18 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
  v19 = v10;
  v18(v16, v14, v10);
  if (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, TupleTypeMetadata2) != 1)
  {
    v20 = *(void (**)(uint64_t, char *, uint64_t))(v25 + 32);
    do
    {
      v20(v5, &v16[*(int *)(TupleTypeMetadata2 + 48)], a4);
      if ((v23(v5) & 1) != 0)
        sub_24437A28C();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v5, a4);
      sub_24437A9E8();
      v18(v16, v14, v19);
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v16, 1, TupleTypeMetadata2) != 1);
  }
  return swift_bridgeObjectRelease();
}

uint64_t sub_24432FDB0(uint64_t a1)
{
  uint64_t result;

  if (a1 < 0)
  {
    result = sub_24437A9AC();
    __break(1u);
  }
  else if (a1)
  {
    result = sub_24437A574();
    *(_QWORD *)(result + 16) = a1;
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

char *sub_24432FE48(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_257357B78);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 8);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_24433D3F8(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_244323BB0(v13, v8, v12);
  }
  swift_release();
  return v10;
}

uint64_t sub_24432FF28(char **a1)
{
  char *v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5[2];

  v2 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_244330878((uint64_t)v2);
  v3 = *((_QWORD *)v2 + 2);
  v5[0] = (uint64_t)(v2 + 32);
  v5[1] = v3;
  result = sub_24432FF90(v5);
  *a1 = v2;
  return result;
}

uint64_t sub_24432FF90(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  char *v6;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  unint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  uint64_t v51;
  char v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  BOOL v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  uint64_t v82;
  uint64_t *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;

  v3 = a1[1];
  result = sub_24437AA3C();
  if (result >= v3)
  {
    if ((v3 & 0x8000000000000000) == 0)
    {
      if (v3)
        return sub_244330560(0, v3, 1, a1);
      return result;
    }
    goto LABEL_124;
  }
  v5 = result;
  result = sub_24432FDB0(v3 / 2);
  v83 = a1;
  v84 = result;
  v88 = v6;
  v86 = v3;
  if (v3 <= 0)
  {
    v9 = MEMORY[0x24BEE4AF8];
    v26 = *(_QWORD *)(MEMORY[0x24BEE4AF8] + 16);
LABEL_90:
    if (v26 < 2)
    {
LABEL_101:
      result = swift_bridgeObjectRelease();
      if (v86 >= -1)
      {
        *(_QWORD *)(v84 + 16) = 0;
        return swift_bridgeObjectRelease();
      }
      goto LABEL_129;
    }
    v76 = *v83;
    while (1)
    {
      v77 = v26 - 2;
      if (v26 < 2)
        break;
      if (!v76)
        goto LABEL_133;
      v78 = *(_QWORD *)(v9 + 32 + 16 * v77);
      v79 = *(_QWORD *)(v9 + 32 + 16 * (v26 - 1) + 8);
      result = sub_2443305B8((char *)(v76 + 8 * v78), (char *)(v76 + 8 * *(_QWORD *)(v9 + 32 + 16 * (v26 - 1))), v76 + 8 * v79, v88);
      if (v1)
        goto LABEL_86;
      if (v79 < v78)
        goto LABEL_119;
      result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        result = (uint64_t)sub_244330824(v9);
        v9 = result;
      }
      if (v77 >= *(_QWORD *)(v9 + 16))
        goto LABEL_120;
      v80 = (_QWORD *)(v9 + 32 + 16 * v77);
      *v80 = v78;
      v80[1] = v79;
      v81 = *(_QWORD *)(v9 + 16);
      if (v26 > v81)
        goto LABEL_121;
      result = (uint64_t)memmove((void *)(v9 + 32 + 16 * (v26 - 1)), (const void *)(v9 + 32 + 16 * v26), 16 * (v81 - v26));
      *(_QWORD *)(v9 + 16) = v81 - 1;
      v26 = v81 - 1;
      if (v81 <= 2)
        goto LABEL_101;
    }
LABEL_118:
    __break(1u);
LABEL_119:
    __break(1u);
LABEL_120:
    __break(1u);
LABEL_121:
    __break(1u);
LABEL_122:
    __break(1u);
LABEL_123:
    __break(1u);
LABEL_124:
    __break(1u);
LABEL_125:
    __break(1u);
LABEL_126:
    __break(1u);
LABEL_127:
    __break(1u);
LABEL_128:
    __break(1u);
LABEL_129:
    __break(1u);
LABEL_130:
    __break(1u);
LABEL_131:
    __break(1u);
LABEL_132:
    __break(1u);
LABEL_133:
    __break(1u);
    return result;
  }
  v7 = 0;
  v8 = *a1;
  v82 = *a1 - 8;
  v9 = MEMORY[0x24BEE4AF8];
  v85 = v5;
  v87 = *a1;
  while (1)
  {
    v10 = v7++;
    if (v7 < v3)
    {
      v11 = *(_QWORD *)(v8 + 8 * v7);
      v12 = *(_QWORD *)(v8 + 8 * v10);
      v7 = v10 + 2;
      if (v10 + 2 < v3)
      {
        v13 = v11;
        while (1)
        {
          v14 = *(_QWORD *)(v8 + 8 * v7);
          if (v12 < v11 == v13 >= v14)
            break;
          ++v7;
          v13 = v14;
          if (v7 >= v3)
          {
            v7 = v3;
            break;
          }
        }
      }
      if (v12 < v11)
      {
        if (v7 < v10)
          goto LABEL_126;
        if (v10 < v7)
        {
          v15 = v7 - 1;
          v16 = v10;
          do
          {
            if (v16 != v15)
            {
              if (!v8)
                goto LABEL_132;
              v17 = *(_QWORD *)(v8 + 8 * v16);
              *(_QWORD *)(v8 + 8 * v16) = *(_QWORD *)(v8 + 8 * v15);
              *(_QWORD *)(v8 + 8 * v15) = v17;
            }
            v57 = ++v16 < v15--;
          }
          while (v57);
        }
      }
    }
    if (v7 < v3)
    {
      if (__OFSUB__(v7, v10))
        goto LABEL_123;
      if (v7 - v10 < v5)
      {
        v18 = v10 + v5;
        if (__OFADD__(v10, v5))
          goto LABEL_127;
        if (v18 >= v3)
          v18 = v3;
        if (v18 < v10)
          goto LABEL_128;
        if (v7 != v18)
        {
          v19 = (uint64_t *)(v82 + 8 * v7);
          do
          {
            v20 = *(_QWORD *)(v8 + 8 * v7);
            v21 = v10;
            v22 = v19;
            do
            {
              v23 = *v22;
              if (*v22 >= v20)
                break;
              if (!v8)
                goto LABEL_130;
              *v22 = v20;
              v22[1] = v23;
              --v22;
              ++v21;
            }
            while (v7 != v21);
            ++v7;
            ++v19;
          }
          while (v7 != v18);
          v7 = v18;
        }
      }
    }
    if (v7 < v10)
      goto LABEL_122;
    result = swift_isUniquelyReferenced_nonNull_native();
    if ((result & 1) == 0)
    {
      result = (uint64_t)sub_244330730(0, *(_QWORD *)(v9 + 16) + 1, 1, (char *)v9);
      v9 = result;
    }
    v25 = *(_QWORD *)(v9 + 16);
    v24 = *(_QWORD *)(v9 + 24);
    v26 = v25 + 1;
    v8 = v87;
    if (v25 >= v24 >> 1)
    {
      result = (uint64_t)sub_244330730((char *)(v24 > 1), v25 + 1, 1, (char *)v9);
      v8 = v87;
      v9 = result;
    }
    *(_QWORD *)(v9 + 16) = v26;
    v27 = v9 + 32;
    v28 = (uint64_t *)(v9 + 32 + 16 * v25);
    *v28 = v10;
    v28[1] = v7;
    if (v25)
      break;
    v26 = 1;
LABEL_81:
    v5 = v85;
    v3 = v86;
    if (v7 >= v86)
      goto LABEL_90;
  }
  while (1)
  {
    v29 = v26 - 1;
    if (v26 >= 4)
    {
      v34 = v27 + 16 * v26;
      v35 = *(_QWORD *)(v34 - 64);
      v36 = *(_QWORD *)(v34 - 56);
      v40 = __OFSUB__(v36, v35);
      v37 = v36 - v35;
      if (v40)
        goto LABEL_107;
      v39 = *(_QWORD *)(v34 - 48);
      v38 = *(_QWORD *)(v34 - 40);
      v40 = __OFSUB__(v38, v39);
      v32 = v38 - v39;
      v33 = v40;
      if (v40)
        goto LABEL_108;
      v41 = v26 - 2;
      v42 = (uint64_t *)(v27 + 16 * (v26 - 2));
      v44 = *v42;
      v43 = v42[1];
      v40 = __OFSUB__(v43, v44);
      v45 = v43 - v44;
      if (v40)
        goto LABEL_109;
      v40 = __OFADD__(v32, v45);
      v46 = v32 + v45;
      if (v40)
        goto LABEL_111;
      if (v46 >= v37)
      {
        v64 = (uint64_t *)(v27 + 16 * v29);
        v66 = *v64;
        v65 = v64[1];
        v40 = __OFSUB__(v65, v66);
        v67 = v65 - v66;
        if (v40)
          goto LABEL_117;
        v57 = v32 < v67;
        goto LABEL_70;
      }
    }
    else
    {
      if (v26 != 3)
      {
        v58 = *(_QWORD *)(v9 + 32);
        v59 = *(_QWORD *)(v9 + 40);
        v40 = __OFSUB__(v59, v58);
        v51 = v59 - v58;
        v52 = v40;
        goto LABEL_64;
      }
      v31 = *(_QWORD *)(v9 + 32);
      v30 = *(_QWORD *)(v9 + 40);
      v40 = __OFSUB__(v30, v31);
      v32 = v30 - v31;
      v33 = v40;
    }
    if ((v33 & 1) != 0)
      goto LABEL_110;
    v41 = v26 - 2;
    v47 = (uint64_t *)(v27 + 16 * (v26 - 2));
    v49 = *v47;
    v48 = v47[1];
    v50 = __OFSUB__(v48, v49);
    v51 = v48 - v49;
    v52 = v50;
    if (v50)
      goto LABEL_112;
    v53 = (uint64_t *)(v27 + 16 * v29);
    v55 = *v53;
    v54 = v53[1];
    v40 = __OFSUB__(v54, v55);
    v56 = v54 - v55;
    if (v40)
      goto LABEL_114;
    if (__OFADD__(v51, v56))
      goto LABEL_116;
    if (v51 + v56 >= v32)
    {
      v57 = v32 < v56;
LABEL_70:
      if (v57)
        v29 = v41;
      goto LABEL_72;
    }
LABEL_64:
    if ((v52 & 1) != 0)
      goto LABEL_113;
    v60 = (uint64_t *)(v27 + 16 * v29);
    v62 = *v60;
    v61 = v60[1];
    v40 = __OFSUB__(v61, v62);
    v63 = v61 - v62;
    if (v40)
      goto LABEL_115;
    if (v63 < v51)
      goto LABEL_81;
LABEL_72:
    v68 = v9;
    v69 = v29 - 1;
    if (v29 - 1 >= v26)
    {
      __break(1u);
LABEL_104:
      __break(1u);
LABEL_105:
      __break(1u);
LABEL_106:
      __break(1u);
LABEL_107:
      __break(1u);
LABEL_108:
      __break(1u);
LABEL_109:
      __break(1u);
LABEL_110:
      __break(1u);
LABEL_111:
      __break(1u);
LABEL_112:
      __break(1u);
LABEL_113:
      __break(1u);
LABEL_114:
      __break(1u);
LABEL_115:
      __break(1u);
LABEL_116:
      __break(1u);
LABEL_117:
      __break(1u);
      goto LABEL_118;
    }
    if (!v8)
      goto LABEL_131;
    v70 = (uint64_t *)(v27 + 16 * v69);
    v71 = *v70;
    v72 = v27;
    v73 = (_QWORD *)(v27 + 16 * v29);
    v74 = v73[1];
    result = sub_2443305B8((char *)(v8 + 8 * *v70), (char *)(v8 + 8 * *v73), v8 + 8 * v74, v88);
    if (v1)
      break;
    if (v74 < v71)
      goto LABEL_104;
    if (v29 > *(_QWORD *)(v68 + 16))
      goto LABEL_105;
    *v70 = v71;
    *(_QWORD *)(v72 + 16 * v69 + 8) = v74;
    v75 = *(_QWORD *)(v68 + 16);
    if (v29 >= v75)
      goto LABEL_106;
    v9 = v68;
    v26 = v75 - 1;
    result = (uint64_t)memmove(v73, v73 + 2, 16 * (v75 - 1 - v29));
    v27 = v72;
    *(_QWORD *)(v68 + 16) = v75 - 1;
    v8 = v87;
    if (v75 <= 2)
      goto LABEL_81;
  }
LABEL_86:
  result = swift_bridgeObjectRelease();
  if (v86 < -1)
    goto LABEL_125;
  *(_QWORD *)(v84 + 16) = 0;
  return swift_bridgeObjectRelease();
}

uint64_t sub_244330560(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;

  if (a3 != a2)
  {
    v4 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    while (2)
    {
      v6 = *(_QWORD *)(v4 + 8 * a3);
      v7 = result;
      v8 = (uint64_t *)v5;
      do
      {
        v9 = *v8;
        if (*v8 >= v6)
          break;
        if (!v4)
        {
          __break(1u);
          return result;
        }
        *v8 = v6;
        v8[1] = v9;
        --v8;
        ++v7;
      }
      while (a3 != v7);
      ++a3;
      v5 += 8;
      if (a3 != a2)
        continue;
      break;
    }
  }
  return result;
}

uint64_t sub_2443305B8(char *a1, char *a2, unint64_t a3, char *a4)
{
  char *v4;
  char *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;
  BOOL v15;
  char *v18;
  char *v19;
  uint64_t v20;
  BOOL v21;
  BOOL v22;

  v4 = a4;
  v6 = a2;
  v7 = a1;
  v8 = a2 - a1;
  v9 = (a2 - a1) / 8;
  v10 = a3 - (_QWORD)a2;
  v11 = (uint64_t)(a3 - (_QWORD)a2) / 8;
  if (v9 >= v11)
  {
    sub_24433D3F8(a2, (uint64_t)(a3 - (_QWORD)a2) / 8, a4);
    v12 = &v4[8 * v11];
    if (v7 >= v6 || v10 < 8)
      goto LABEL_39;
    v18 = (char *)(a3 - 8);
    while (1)
    {
      v19 = v18 + 8;
      v20 = *((_QWORD *)v6 - 1);
      if (v20 >= *((_QWORD *)v12 - 1))
      {
        v22 = v19 != v12 || v18 >= v12;
        v20 = *((_QWORD *)v12 - 1);
        v12 -= 8;
        if (!v22)
          goto LABEL_35;
      }
      else
      {
        v21 = v19 != v6 || v18 >= v6;
        v6 -= 8;
        if (!v21)
          goto LABEL_35;
      }
      *(_QWORD *)v18 = v20;
LABEL_35:
      v18 -= 8;
      if (v6 <= v7 || v12 <= v4)
        goto LABEL_39;
    }
  }
  sub_24433D3F8(a1, (a2 - a1) / 8, a4);
  v12 = &v4[8 * v9];
  if ((unint64_t)v6 < a3 && v8 >= 8)
  {
    while (1)
    {
      v14 = *(_QWORD *)v6;
      if (*(_QWORD *)v4 < *(_QWORD *)v6)
        break;
      v14 = *(_QWORD *)v4;
      v15 = v7 == v4;
      v4 += 8;
      if (!v15)
        goto LABEL_11;
LABEL_12:
      v7 += 8;
      if (v4 >= v12 || (unint64_t)v6 >= a3)
        goto LABEL_17;
    }
    v15 = v7 == v6;
    v6 += 8;
    if (v15)
      goto LABEL_12;
LABEL_11:
    *(_QWORD *)v7 = v14;
    goto LABEL_12;
  }
LABEL_17:
  v6 = v7;
LABEL_39:
  sub_24433D3F8(v4, (v12 - v4) / 8, v6);
  return 1;
}

char *sub_244330730(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_257357B70);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 16);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || &v13[16 * v8] <= v12)
      memmove(v12, v13, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v12, v13, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

char *sub_244330824(uint64_t a1)
{
  return sub_244330730(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

unint64_t sub_244330838()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257357B68;
  if (!qword_257357B68)
  {
    v1 = sub_24437A2A4();
    result = MEMORY[0x24950D28C](MEMORY[0x24BDCF458], v1);
    atomic_store(result, (unint64_t *)&qword_257357B68);
  }
  return result;
}

char *sub_244330878(uint64_t a1)
{
  return sub_24432FE48(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t OUTLINED_FUNCTION_2_11(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

uint64_t OUTLINED_FUNCTION_3_8()
{
  return sub_24437A688();
}

uint64_t OUTLINED_FUNCTION_4_8(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t);

  return v2(a1, v1);
}

uint64_t OUTLINED_FUNCTION_5_5()
{
  return swift_bridgeObjectRelease();
}

void OUTLINED_FUNCTION_6_3()
{
  JUMPOUT(0x24950BEE8);
}

uint64_t OUTLINED_FUNCTION_8_4()
{
  return swift_bridgeObjectRelease();
}

id PXAssetsDataSource.lastAssetReference.getter()
{
  void *v0;
  __int128 v2;

  objc_msgSend(v0, sel_lastItemIndexPath);
  if ((_QWORD)v2)
    return objc_msgSend(v0, sel_assetReferenceAtItemIndexPath_, &v2);
  else
    return 0;
}

uint64_t Forwarded.wrappedValue.getter()
{
  uint64_t (**v0)(void);

  return (*v0)();
}

uint64_t sub_244330970()
{
  return Forwarded.wrappedValue.getter();
}

uint64_t sub_2443309A0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v4 = *(_QWORD *)(a4 + a3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v12 - v5;
  (*(void (**)(char *))(v7 + 16))((char *)&v12 - v5);
  v10 = type metadata accessor for Forwarded(0, v4, v8, v9);
  return Forwarded.wrappedValue.setter((uint64_t)v6, v10);
}

uint64_t Forwarded.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  (*(void (**)(void))(v2 + 16))();
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))(a1);
}

void (*Forwarded.wrappedValue.modify(_QWORD *a1, uint64_t a2))(uint64_t **a1, char a2)
{
  void (**v2)(void);
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;

  v5 = malloc(0x30uLL);
  *a1 = v5;
  *v5 = a2;
  v5[1] = v2;
  v6 = *(_QWORD *)(a2 + 16);
  v5[2] = v6;
  v7 = *(_QWORD *)(v6 - 8);
  v5[3] = v7;
  v8 = *(_QWORD *)(v7 + 64);
  v5[4] = malloc(v8);
  v5[5] = malloc(v8);
  (*v2)();
  return sub_244330AE8;
}

void sub_244330AE8(uint64_t **a1, char a2)
{
  uint64_t *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v2 = *a1;
  v3 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[5];
  if ((a2 & 1) != 0)
  {
    v5 = v2[2];
    v6 = v2[3];
    v7 = *v2;
    (*(void (**)(uint64_t, void *, uint64_t))(v6 + 16))((*a1)[4], v4, v5);
    Forwarded.wrappedValue.setter((uint64_t)v3, v7);
    (*(void (**)(void *, uint64_t))(v6 + 8))(v4, v5);
  }
  else
  {
    Forwarded.wrappedValue.setter((*a1)[5], *v2);
  }
  free(v4);
  free(v3);
  free(v2);
}

void Forwarded.init<A>(_:_:)(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t (**a3)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t (**v21)@<X0>(uint64_t@<X8>);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t (**v25)@<X0>(uint64_t@<X8>);

  v23 = a1;
  v24 = a2;
  v25 = a3;
  v3 = (_QWORD *)MEMORY[0x24BEE35B8];
  v4 = *a2;
  v5 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE35B8]);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v22 - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v22 - v10, v12, v5);
  v13 = *(unsigned __int8 *)(v6 + 80);
  v14 = (v13 + 32) & ~v13;
  v22 = v13 | 7;
  v15 = (v7 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  v16 = swift_allocObject();
  v17 = *(_QWORD *)(*v3 + v4 + 8);
  *(_QWORD *)(v16 + 16) = v17;
  *(_QWORD *)(v16 + 24) = v5;
  OUTLINED_FUNCTION_4_9(v16 + v14, (uint64_t)v11);
  v18 = v23;
  v19 = v24;
  *(_QWORD *)(v16 + v15) = v24;
  OUTLINED_FUNCTION_4_9((uint64_t)v9, v18);
  v20 = swift_allocObject();
  *(_QWORD *)(v20 + 16) = v17;
  *(_QWORD *)(v20 + 24) = v5;
  OUTLINED_FUNCTION_4_9(v20 + v14, (uint64_t)v9);
  *(_QWORD *)(v20 + v15) = v19;
  v21 = v25;
  *v25 = sub_244330D58;
  v21[1] = (uint64_t (*)@<X0>(uint64_t@<X8>))v16;
  v21[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_244330E58;
  v21[3] = (uint64_t (*)@<X0>(uint64_t@<X8>))v20;
  swift_retain();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_244330CE0@<X0>(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t *, _QWORD);
  uint64_t v6;

  v3 = *a1;
  v4 = (uint64_t (*)(uint64_t *, _QWORD))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE35B8] + v3 + 8) - 8) + 16))(a2);
  return v4(&v6, 0);
}

uint64_t sub_244330D58@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244330CE0(*(uint64_t **)(v1+ ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 64)+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80))+ 7) & 0xFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_244330D88(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - v2);
  return swift_setAtReferenceWritableKeyPath();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_16(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8));
  swift_release();
  return OUTLINED_FUNCTION_1_13();
}

uint64_t sub_244330E58(uint64_t a1)
{
  return sub_244330D88(a1);
}

void Forwarded<A>.init<A>(_:_:)(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X2>, uint64_t (**a4)@<X0>(uint64_t a1@<X8>)@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t (*v17)@<X0>(uint64_t@<X8>);
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t (*v21)@<X0>(uint64_t@<X8>);
  uint64_t (**v22)@<X0>(uint64_t@<X8>);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t (**v28)@<X0>(uint64_t@<X8>);

  v24 = a3;
  v26 = a1;
  v27 = a2;
  v28 = a4;
  v5 = *a2;
  v6 = *(_QWORD *)(*a2 + *MEMORY[0x24BEE35B8]);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v23 - v11, v13, v6);
  v14 = *(unsigned __int8 *)(v7 + 80);
  v15 = (v14 + 40) & ~v14;
  v25 = v14 | 7;
  v16 = (v8 + v15 + 7) & 0xFFFFFFFFFFFFFFF8;
  v17 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  v18 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + v5 + 8);
  *((_QWORD *)v17 + 2) = v18;
  *((_QWORD *)v17 + 3) = v6;
  *((_QWORD *)v17 + 4) = a3;
  OUTLINED_FUNCTION_3_9((uint64_t)v17 + v15, (uint64_t)v12);
  v19 = v26;
  v20 = v27;
  *(_QWORD *)((char *)v17 + v16) = v27;
  OUTLINED_FUNCTION_3_9((uint64_t)v10, v19);
  v21 = (uint64_t (*)@<X0>(uint64_t@<X8>))swift_allocObject();
  *((_QWORD *)v21 + 2) = v18;
  *((_QWORD *)v21 + 3) = v6;
  *((_QWORD *)v21 + 4) = v24;
  OUTLINED_FUNCTION_3_9((uint64_t)v21 + v15, (uint64_t)v10);
  *(_QWORD *)((char *)v21 + v16) = v20;
  v22 = v28;
  *v28 = sub_244331008;
  v22[1] = v17;
  v22[2] = (uint64_t (*)@<X0>(uint64_t@<X8>))sub_244331160;
  v22[3] = v21;
  swift_retain();
  OUTLINED_FUNCTION_1();
}

uint64_t sub_244331008@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_244330CE0(*(uint64_t **)(v1+ ((*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 64)+ ((*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v1 + 24) - 8) + 80))+ 7) & 0xFFFFFFFFFFFFF8)), a1);
}

uint64_t sub_244331038(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t result;
  uint64_t v10;

  v4 = *(_QWORD *)(*MEMORY[0x24BEE35B8] + *a3 + 8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v10 - v6;
  swift_getAtKeyPath();
  v8 = sub_24437A454();
  result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if ((v8 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    return swift_setAtReferenceWritableKeyPath();
  }
  return result;
}

uint64_t objectdestroy_5Tm()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_16(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8));
  swift_release();
  return OUTLINED_FUNCTION_1_13();
}

uint64_t sub_244331160(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *(_QWORD *)(*(_QWORD *)(v1 + 24) - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  return sub_244331038(a1, v1 + v3, *(_QWORD **)(v1 + ((*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFF8)));
}

uint64_t sub_244331198()
{
  return 8;
}

_QWORD *sub_2443311A4(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_2443311B0()
{
  swift_release();
  return swift_release();
}

uint64_t sub_2443311D8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  v3 = *(_QWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 24) = v3;
  swift_retain();
  swift_retain();
  return a1;
}

_QWORD *sub_244331220(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_retain();
  swift_release();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

_OWORD *sub_24433127C(_OWORD *a1, _OWORD *a2)
{
  *a1 = *a2;
  swift_release();
  a1[1] = a2[1];
  swift_release();
  return a1;
}

uint64_t sub_2443312C0(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (a2)
  {
    if (a2 < 0 && *((_BYTE *)a1 + 32))
    {
      LODWORD(v2) = *(_DWORD *)a1 + 0x7FFFFFFF;
    }
    else
    {
      v2 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v2) = -1;
    }
  }
  else
  {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t sub_244331300(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t type metadata accessor for Forwarded(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for Forwarded);
}

uint64_t OUTLINED_FUNCTION_0_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  return (*(uint64_t (**)(uint64_t))(a1 + 8))(v3 + (v2 & ~v1));
}

uint64_t OUTLINED_FUNCTION_1_13()
{
  return swift_deallocObject();
}

uint64_t OUTLINED_FUNCTION_3_9(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, a2, v3);
}

uint64_t OUTLINED_FUNCTION_4_9(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);

  return v3(a1, a2, v2);
}

unint64_t UIInterfaceOrientation.rotationRadians.getter(unint64_t result)
{
  if (result >= 5)
  {
    result = sub_24437A9B8();
    __break(1u);
  }
  return result;
}

void sub_2443313F8(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

void PhotosBasicItemListManager.__allocating_init(itemList:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  swift_allocObject();
  PhotosBasicItemListManager.init(itemList:)(a1, v2, v3, v4);
  OUTLINED_FUNCTION_2();
}

uint64_t PhotosBasicItemListManager.itemList.getter()
{
  swift_getKeyPath();
  sub_24433165C();
  swift_release();
  return swift_retain();
}

void sub_244331490(double *a1@<X0>, uint64_t (*a2)(double)@<X1>, _BYTE *a3@<X8>)
{
  *a3 = a2(*a1) & 1;
  OUTLINED_FUNCTION_2();
}

void sub_2443314BC(void (*a1)(char *__return_ptr, double *), double a2)
{
  char v2;
  double v3;

  v3 = a2;
  a1(&v2, &v3);
  OUTLINED_FUNCTION_8_5();
}

id sub_2443314F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  id result;

  v3 = PhotosBasicItemListManager.itemList.getter();
  result = (id)swift_release();
  if (v3 != a1)
    return objc_msgSend(*(id *)(v1 + 48), sel_signalChange_, 1);
  return result;
}

uint64_t sub_244331548(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(_QWORD *)(v1 + 16);
  *(_QWORD *)(v1 + 16) = a1;
  swift_retain();
  sub_2443314F0(v2);
  swift_release();
  return swift_release();
}

uint64_t sub_24433158C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosBasicItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

uint64_t sub_2443315B4()
{
  swift_retain();
  return sub_2443315DC();
}

uint64_t sub_2443315DC()
{
  swift_getKeyPath();
  sub_2443316F4();
  swift_release();
  return swift_release();
}

uint64_t sub_24433165C()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, *v0);
  return sub_24437A2C8();
}

uint64_t sub_2443316BC(uint64_t a1, uint64_t a2)
{
  swift_retain();
  return sub_244331548(a2);
}

uint64_t sub_2443316F4()
{
  _QWORD *v0;

  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, *v0);
  return sub_24437A2BC();
}

uint64_t PhotosBasicItemListManager.changeDetailsRepository.getter()
{
  return swift_retain();
}

uint64_t *PhotosBasicItemListManager.init(itemList:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v12;

  v6 = *v4;
  type metadata accessor for PhotosBasicItemList(0, *(_QWORD *)(*v4 + 80), *(_QWORD *)(*v4 + 88), a4);
  v7 = OUTLINED_FUNCTION_11_2();
  v12 = 2;
  v4[2] = PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v7, &v12);
  type metadata accessor for PhotosItemListChangeDetailsRepository();
  OUTLINED_FUNCTION_5_6();
  v8 = PhotosItemListChangeDetailsRepository.init(countLimit:)(100);
  v4[4] = 0;
  v4[5] = 0;
  v4[3] = v8;
  v4[6] = (uint64_t)objc_msgSend(objc_allocWithZone((Class)PXObservable), sel_init);
  sub_24437A2EC();
  v9 = OUTLINED_FUNCTION_5_6();
  *(_QWORD *)(v9 + 16) = v4;
  *(_QWORD *)(v9 + 24) = a1;
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_7_4();
  v10 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, v6);
  PhotosMutableComposedObservable<>.performChanges(using:)((uint64_t)sub_244331E60, v9, v6, v10);
  swift_release();
  swift_release();
  return v4;
}

void sub_2443318B8(uint64_t *a1@<X8>)
{
  *a1 = PhotosBasicItemListManager.itemList.getter();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2443318E8()
{
  swift_retain();
  return sub_2443315DC();
}

uint64_t sub_244331910@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(double *@<X0>, _BYTE *@<X8>);

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 32);
  v5 = *(_QWORD *)(v3 + 40);
  if (v4)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = v4;
    *(_QWORD *)(v6 + 24) = v5;
    v7 = sub_2443320A8;
  }
  else
  {
    v7 = 0;
    v6 = 0;
  }
  *a2 = v7;
  a2[1] = v6;
  return sub_24432ED10(v4);
}

uint64_t sub_244331998(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(double);
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = a1[1];
  if (*a1)
  {
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = v3;
    *(_QWORD *)(v5 + 24) = v4;
    v6 = sub_244332078;
  }
  else
  {
    v6 = 0;
    v5 = 0;
  }
  v7 = *a2;
  swift_beginAccess();
  v8 = *(_QWORD *)(v7 + 32);
  *(_QWORD *)(v7 + 32) = v6;
  *(_QWORD *)(v7 + 40) = v5;
  sub_24432ED10(v3);
  return sub_24432ED20(v8);
}

uint64_t PhotosBasicItemListManager.waitForItemListHandler.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_3_10();
  v1 = *(_QWORD *)(v0 + 32);
  sub_24432ED10(v1);
  return v1;
}

uint64_t PhotosBasicItemListManager.waitForItemListHandler.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;

  swift_beginAccess();
  v5 = *(_QWORD *)(v2 + 32);
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return sub_24432ED20(v5);
}

uint64_t (*PhotosBasicItemListManager.waitForItemListHandler.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

Swift::Bool __swiftcall PhotosBasicItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  uint64_t v1;
  uint64_t (*v3)(uint64_t, double);
  uint64_t v4;
  char v5;

  OUTLINED_FUNCTION_3_10();
  v3 = *(uint64_t (**)(uint64_t, double))(v1 + 32);
  if (v3)
  {
    v4 = OUTLINED_FUNCTION_7_4();
    v5 = v3(v4, timeout);
    sub_24432ED20((uint64_t)v3);
  }
  else
  {
    v5 = 0;
  }
  return v5 & 1;
}

void PhotosBasicItemListManager.createMutator()()
{
  uint64_t *v0;

  type metadata accessor for PhotosBasicItemListManager.Mutator(0, *(_QWORD *)(*v0 + 80), *v0, *(_QWORD *)(*v0 + 88));
  sub_24432EA58((uint64_t)v0);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_2();
}

uint64_t PhotosBasicItemListManager.Mutator.observable.getter()
{
  return swift_retain();
}

void sub_244331BC4()
{
  swift_retain();
  sub_244331C08();
}

void sub_244331BEC()
{
  PhotosBasicItemListManager.itemList.getter();
  OUTLINED_FUNCTION_2();
}

void sub_244331C08()
{
  sub_2443315DC();
  OUTLINED_FUNCTION_2();
}

void (*sub_244331C24(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  uint64_t v3;

  a1[1] = v1;
  sub_244331BEC();
  *a1 = v3;
  return sub_244331C58;
}

void sub_244331C58(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    OUTLINED_FUNCTION_6_4();
    sub_244331C08();
    swift_release();
  }
  else
  {
    sub_244331C08();
    OUTLINED_FUNCTION_2();
  }
}

void sub_244331C94(uint64_t a1, uint64_t a2)
{
  swift_retain();
  sub_24433C5A0(a2);
  swift_release();
  OUTLINED_FUNCTION_7_4();
  sub_2443315DC();
  OUTLINED_FUNCTION_31();
}

uint64_t PhotosBasicItemListManager.Mutator.deinit()
{
  uint64_t v0;

  OUTLINED_FUNCTION_10_3();
  return v0;
}

uint64_t PhotosBasicItemListManager.Mutator.__deallocating_deinit()
{
  PhotosBasicItemListManager.Mutator.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_244331D18@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosBasicItemListManager.Mutator.observable.getter();
  *a1 = result;
  return result;
}

id PhotosBasicItemListManager.observable.getter()
{
  uint64_t v0;

  return *(id *)(v0 + 48);
}

void PhotosBasicItemListManager.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_11_3();
  sub_24432ED20(*(_QWORD *)(v0 + 32));

  v1 = v0 + qword_257356730;
  v2 = sub_24437A2F8();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_2();
}

uint64_t PhotosBasicItemListManager.__deallocating_deinit()
{
  PhotosBasicItemListManager.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_244331DC0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosBasicItemListManager.itemList.getter();
  *a1 = result;
  return result;
}

void sub_244331DEC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  PhotosBasicItemListManager.createMutator()();
  *a1 = v2;
}

id sub_244331E14@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = PhotosBasicItemListManager.observable.getter();
  *a1 = result;
  return result;
}

uint64_t sub_244331E3C()
{
  OUTLINED_FUNCTION_10_3();
  OUTLINED_FUNCTION_11_3();
  return swift_deallocObject();
}

uint64_t sub_244331E60()
{
  return sub_2443318E8();
}

uint64_t type metadata accessor for PhotosBasicItemListManager.Mutator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosBasicItemListManager.Mutator);
}

void sub_244331E74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24432ED64(a1, a2, a3, (uint64_t)&protocol conformance descriptor for PhotosBasicItemListManager<A>, (uint64_t)&protocol conformance descriptor for PhotosBasicItemListManager<A>);
}

void sub_244331E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_24432ED64(a1, a2, a3, (uint64_t)&protocol conformance descriptor for PhotosBasicItemListManager<A>, (uint64_t)&protocol conformance descriptor for PhotosBasicItemListManager<A>);
}

uint64_t sub_244331E9C(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

void sub_244331EE0(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_244331BEC();
  *a1 = v2;
  OUTLINED_FUNCTION_2();
}

uint64_t sub_244331F08()
{
  return 24;
}

__n128 sub_244331F14(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_244331F28()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A2F8();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PhotosBasicItemListManager(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosBasicItemListManager);
}

uint64_t method lookup function for PhotosBasicItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.__allocating_init(itemList:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t sub_244331FDC()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosBasicItemListManager.Mutator()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.itemList.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of PhotosBasicItemListManager.Mutator.setItemList(_:changeDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t sub_244332058()
{
  OUTLINED_FUNCTION_11_3();
  return swift_deallocObject();
}

void sub_244332078(double a1)
{
  uint64_t v1;
  void (*v2)(char *__return_ptr, double *);
  char v3;
  double v4;

  v2 = *(void (**)(char *__return_ptr, double *))(v1 + 16);
  v4 = a1;
  v2(&v3, &v4);
  OUTLINED_FUNCTION_8_5();
}

void sub_2443320A8(double *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v2;

  *a2 = (*(uint64_t (**)(double))(v2 + 16))(*a1) & 1;
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2443320D4()
{
  uint64_t v0;

  return sub_2443316BC(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t OUTLINED_FUNCTION_3_10()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_5_6()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_6_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_7_4()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_10_3()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_11_3()
{
  return swift_release();
}

id FilteredImageProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FilteredImageProvider.init()()
{
  id v0;

  v0 = objc_allocWithZone((Class)type metadata accessor for FilteredImageProvider());
  FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(0, (uint64_t)&unk_257357C70, 0);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_2443321BC()
{
  uint64_t v0;

  return sub_244335130(*(uint64_t (**)(uint64_t))(v0 + 8), v0, 0);
}

id FilteredImageProvider.__allocating_init(unfilteredImageProvider:filterPromise:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(a1, a2, a3);
}

uint64_t type metadata accessor for FilteredImageProvider()
{
  return objc_opt_self();
}

id FilteredImageProvider.init(unfilteredImageProvider:filterPromise:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  objc_super v13;

  v7 = OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState;
  type metadata accessor for FilteredImageProvider.State();
  v8 = OUTLINED_FUNCTION_0_2();
  v9 = MEMORY[0x24BEE4B00];
  *(_QWORD *)(v8 + 16) = 1100;
  *(_QWORD *)(v8 + 24) = v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F10);
  v10 = OUTLINED_FUNCTION_0_2();
  *(_DWORD *)(v10 + 24) = 0;
  *(_QWORD *)&v3[v7] = v10;
  *(_QWORD *)&v3[OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_unfilteredImageProvider] = a1;
  *(_QWORD *)(v10 + 16) = v8;
  v11 = &v3[OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise];
  *(_QWORD *)v11 = a2;
  *((_QWORD *)v11 + 1) = a3;
  v13.receiver = v3;
  v13.super_class = (Class)type metadata accessor for FilteredImageProvider();
  return objc_msgSendSuper2(&v13, sel_init);
}

uint64_t type metadata accessor for FilteredImageProvider.State()
{
  return objc_opt_self();
}

uint64_t sub_244332334()
{
  swift_bridgeObjectRelease();
  return swift_deallocClassInstance();
}

void sub_244332358()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 24));
  ++*(_QWORD *)(*(_QWORD *)(v1 + 16) + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 24));
  OUTLINED_FUNCTION_2();
}

void sub_2443323A0(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;

  v3 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  v4 = v3 + 4;
  v5 = v3 + 6;
  os_unfair_lock_lock(v3 + 6);
  sub_2443323FC(v4, a1);
  os_unfair_lock_unlock(v5);
}

uint64_t sub_2443323FC(_QWORD *a1, uint64_t a2)
{
  uint64_t *v3;
  char v4;
  uint64_t v6;

  v3 = (uint64_t *)(*a1 + 24);
  swift_beginAccess();
  sub_24432D6F0(a2);
  if ((v4 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v6 = *v3;
    *v3 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257356F28);
    sub_24437A994();
    type metadata accessor for ImageRequest();
    sub_24437A9A0();
    *v3 = v6;
    swift_release();
    swift_bridgeObjectRelease();
  }
  return swift_endAccess();
}

uint64_t sub_2443324FC(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, os_unfair_lock_s *a5, double a6, double a7)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  uint64_t v29;

  v9 = v7;
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_21_0();
  sub_244332358();
  v17 = v16;
  v18 = *(_QWORD *)(v7 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_unfilteredImageProvider);
  v19 = *(_QWORD *)(v9 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise + 8);
  v29 = *(_QWORD *)(v9 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_filterPromise);
  v20 = OUTLINED_FUNCTION_0_2();
  swift_unknownObjectWeakInit();
  v21 = OUTLINED_FUNCTION_0_2();
  *(_QWORD *)(v21 + 16) = v20;
  *(_QWORD *)(v21 + 24) = v17;
  type metadata accessor for ImageRequest();
  swift_allocObject();
  swift_unknownObjectRetain();
  swift_retain();
  swift_unknownObjectRetain();
  v22 = a3;
  swift_retain();
  v23 = sub_244332ED4(a1, a2, (uint64_t)a3, a4, (uint64_t)a5, v18, v29, v19, a6, a7, (uint64_t)sub_244332770, v21);
  OUTLINED_FUNCTION_24_0(*(os_unfair_lock_s **)(v9
                                              + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState));
  sub_244332798();
  os_unfair_lock_unlock(a5);
  v24 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_15_0(v8, v25, v26, v24);
  v27 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v27[2] = 0;
  v27[3] = 0;
  v27[4] = v23;
  sub_244332848(v8, (uint64_t)&unk_257357CA8, (uint64_t)v27);
  swift_release();
  return v17;
}

uint64_t sub_2443326D8()
{
  swift_unknownObjectWeakDestroy();
  OUTLINED_FUNCTION_22_0();
  return swift_deallocObject();
}

void sub_2443326F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x24950D424](v3);
  if (v4)
  {
    v5 = (void *)v4;
    sub_2443323A0(a2);

  }
}

uint64_t sub_24433274C()
{
  swift_release();
  return swift_deallocObject();
}

void sub_244332770()
{
  uint64_t v0;

  sub_2443326F4(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t type metadata accessor for ImageRequest()
{
  return objc_opt_self();
}

uint64_t sub_244332798()
{
  swift_beginAccess();
  swift_retain();
  sub_24432DA0C();
  return swift_endAccess();
}

uint64_t sub_244332808(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_244332820()
{
  uint64_t v0;

  sub_2443330B4();
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244332848(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_24437A640();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_244334F8C(a1, (uint64_t *)&unk_257356EC8);
  }
  else
  {
    sub_24437A634();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24437A610();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_24433298C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_24437A640();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_244334F8C(a1, (uint64_t *)&unk_257356EC8);
  }
  else
  {
    sub_24437A634();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24437A610();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356F50);
  return swift_task_create();
}

void sub_244332BA8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_24437A3AC();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_244332C20(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  os_unfair_lock_s *v3;
  uint64_t v5;
  os_unfair_lock_s *v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;

  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_21_0();
  v6 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21FilteredImageProvider_lockedState);
  v7 = (uint64_t *)&v6[4];
  OUTLINED_FUNCTION_24_0(v6);
  sub_244332CF0(v7, a1, &v14);
  os_unfair_lock_unlock(v3);
  v8 = v14;
  v9 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_15_0(v2, v10, v11, v9);
  v12 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = v8;
  sub_24433298C(v2, (uint64_t)&unk_257357CB8, (uint64_t)v12);
  return swift_release();
}

uint64_t sub_244332CF0@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;

  v5 = *a1;
  swift_beginAccess();
  v6 = sub_24432CC70(a2, *(_QWORD *)(v5 + 24));
  swift_beginAccess();
  sub_244334E98(a2);
  swift_endAccess();
  result = swift_release();
  *a3 = v6;
  return result;
}

uint64_t sub_244332D94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a1;
  *(_QWORD *)(v4 + 24) = a4;
  return swift_task_switch();
}

uint64_t sub_244332DAC()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 24))
    return swift_task_switch();
  **(_BYTE **)(v0 + 16) = 1;
  return OUTLINED_FUNCTION_3_11();
}

uint64_t sub_244332DD4()
{
  sub_24433391C();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_0_17();
}

uint64_t sub_244332E04()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 16) = *(_QWORD *)(v0 + 24) == 0;
  return OUTLINED_FUNCTION_3_11();
}

id FilteredImageProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FilteredImageProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_244332ED4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, double a9, double a10, uint64_t a11, uint64_t a12)
{
  uint64_t v12;

  swift_defaultActor_initialize();
  *(_BYTE *)(v12 + 184) = 0;
  *(_WORD *)(v12 + 208) = 0;
  *(_BYTE *)(v12 + 232) = 1;
  *(int64x2_t *)(v12 + 240) = vdupq_n_s64(1uLL);
  *(_QWORD *)(v12 + 256) = 0;
  *(_QWORD *)(v12 + 112) = a1;
  *(double *)(v12 + 120) = a9;
  *(double *)(v12 + 128) = a10;
  *(_QWORD *)(v12 + 136) = a2;
  *(_QWORD *)(v12 + 144) = a3;
  *(_QWORD *)(v12 + 152) = a4;
  *(_QWORD *)(v12 + 160) = a5;
  *(_QWORD *)(v12 + 216) = a6;
  *(_QWORD *)(v12 + 224) = 0;
  *(_QWORD *)(v12 + 168) = a7;
  *(_QWORD *)(v12 + 176) = a8;
  *(_QWORD *)(v12 + 192) = a11;
  *(_QWORD *)(v12 + 200) = a12;
  return v12;
}

uint64_t sub_244332F94()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_19_0(v1);
  return sub_244332808(v2, v3, v4, v5);
}

uint64_t objectdestroy_5Tm_0()
{
  OUTLINED_FUNCTION_18_0();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244333014()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_19_0(v1);
  return sub_244332D94(v2, v3, v4, v5);
}

uint64_t method lookup function for FilteredImageProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FilteredImageProvider.__allocating_init(unfilteredImageProvider:filterPromise:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t dispatch thunk of FilteredImageProvider.requestImage(for:targetSize:contentMode:options:resultHandler:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of FilteredImageProvider.cancelImageRequest(_:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

void sub_2443330B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  _QWORD aBlock[6];

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)aBlock - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((*(_BYTE *)(v0 + 209) & 1) == 0 && (*(_BYTE *)(v0 + 208) & 1) == 0)
  {
    *(_BYTE *)(v0 + 208) = 1;
    v5 = *(_QWORD *)(v0 + 168);
    v4 = *(_QWORD *)(v0 + 176);
    v6 = sub_24437A640();
    __swift_storeEnumTagSinglePayload((uint64_t)v3, 1, 1, v6);
    v7 = swift_allocObject();
    swift_weakInit();
    v8 = (_QWORD *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v5;
    v8[5] = v4;
    v8[6] = v7;
    swift_retain();
    sub_244332848((uint64_t)v3, (uint64_t)&unk_257357D80, (uint64_t)v8);
    swift_release();
    if (*(_QWORD *)(v0 + 216))
    {
      v9 = *(id *)(v0 + 216);
    }
    else
    {
      v10 = objc_msgSend((id)objc_opt_self(), sel_defaultManager);
      v9 = objc_msgSend(v10, sel_imageProviderForAsset_, *(_QWORD *)(v0 + 112));

      *(_QWORD *)(v0 + 216) = v9;
      swift_unknownObjectRetain();
      swift_unknownObjectRelease();
    }
    v11 = *(_QWORD *)(v0 + 112);
    v12 = *(double *)(v0 + 120);
    v13 = *(double *)(v0 + 128);
    v14 = *(_QWORD *)(v0 + 136);
    v15 = *(_QWORD *)(v0 + 144);
    v16 = swift_allocObject();
    swift_weakInit();
    aBlock[4] = sub_244334CC8;
    aBlock[5] = v16;
    aBlock[0] = MEMORY[0x24BDAC760];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_244333888;
    aBlock[3] = &block_descriptor_1;
    v17 = _Block_copy(aBlock);
    swift_unknownObjectRetain();
    swift_release();
    v18 = objc_msgSend(v9, sel_requestImageForAsset_targetSize_contentMode_options_resultHandler_, v11, v14, v15, v17, v12, v13);
    swift_unknownObjectRelease();
    _Block_release(v17);
    *(_QWORD *)(v0 + 224) = v18;
    *(_BYTE *)(v0 + 232) = 0;
  }
}

uint64_t sub_244333308(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  _QWORD *v7;
  uint64_t (*v9)(void);

  *(_QWORD *)(v6 + 56) = a6;
  v9 = (uint64_t (*)(void))((char *)a4 + *a4);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v6 + 64) = v7;
  *v7 = v6;
  v7[1] = sub_244333360;
  return v9();
}

uint64_t sub_244333360()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_29_0();
  *v4 = *v3;
  *(_QWORD *)(v2 + 72) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v2 + 80) = v0;
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_6_5();
}

uint64_t sub_2443333B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v0 + 88) = *(_QWORD *)(v0 + 80);
  OUTLINED_FUNCTION_16_0();
  v1 = OUTLINED_FUNCTION_32_0();
  *(_QWORD *)(v0 + 96) = v1;
  if (v1)
    return OUTLINED_FUNCTION_0_17();
  OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244333414()
{
  uint64_t v0;

  sub_2443339E0(*(void **)(v0 + 88));
  swift_release();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_0_17();
}

uint64_t sub_24433344C()
{
  uint64_t v0;

  OUTLINED_FUNCTION_25_0();
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244333470()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  BOOL v4;
  void *v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v12;

  if (qword_257357008 != -1)
    swift_once();
  v1 = sub_24437A31C();
  __swift_project_value_buffer(v1, (uint64_t)qword_257357C58);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_23_0();
  v2 = sub_24437A304();
  v3 = sub_24437A79C();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(void **)(v0 + 72);
  if (v4)
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v12 = OUTLINED_FUNCTION_1_4();
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 40) = v5;
    v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257357D40);
    v8 = sub_24437A484();
    *(_QWORD *)(v0 + 48) = sub_24432469C(v8, v9, &v12);
    sub_24437A820();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_11_4();
    OUTLINED_FUNCTION_11_4();
    _os_log_impl(&dword_24430E000, v2, v3, "Filter promised failed: %s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_8();
  }
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_11_4();
  OUTLINED_FUNCTION_11_4();

  *(_QWORD *)(v0 + 88) = 0;
  swift_beginAccess();
  v10 = OUTLINED_FUNCTION_32_0();
  *(_QWORD *)(v0 + 96) = v10;
  if (v10)
    return swift_task_switch();
  OUTLINED_FUNCTION_25_0();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244333694(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  _QWORD *v10;
  uint64_t v12;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_24437A640();
  __swift_storeEnumTagSinglePayload((uint64_t)v6, 1, 1, v7);
  v8 = swift_allocObject();
  swift_beginAccess();
  swift_weakLoadStrong();
  swift_weakInit();
  swift_bridgeObjectRetain();
  v9 = a1;
  swift_release();
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v8;
  v10[5] = a1;
  v10[6] = a2;
  sub_24433298C((uint64_t)v6, (uint64_t)&unk_257357D90, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2443337BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[7] = a5;
  v6[8] = a6;
  v6[5] = a1;
  v6[6] = a4;
  return swift_task_switch();
}

uint64_t sub_2443337D8()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_16_0();
  v1 = OUTLINED_FUNCTION_32_0();
  *(_QWORD *)(v0 + 72) = v1;
  if (v1)
    return OUTLINED_FUNCTION_0_17();
  **(_BYTE **)(v0 + 40) = 1;
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_244333834()
{
  uint64_t v0;

  sub_244333A58(*(void **)(v0 + 56), *(_QWORD *)(v0 + 64));
  swift_release();
  OUTLINED_FUNCTION_27_0();
  return OUTLINED_FUNCTION_0_17();
}

uint64_t sub_244333870()
{
  uint64_t v0;

  **(_BYTE **)(v0 + 40) = *(_QWORD *)(v0 + 72) == 0;
  return OUTLINED_FUNCTION_3_11();
}

uint64_t sub_244333888(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v4)(void *, uint64_t);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(void *, uint64_t))(a1 + 32);
  if (a3)
    v5 = sub_24437A3B8();
  else
    v5 = 0;
  swift_retain();
  v6 = a2;
  v4(a2, v5);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_24433391C()
{
  uint64_t v0;
  void *v1;

  *(_BYTE *)(v0 + 209) = 1;
  if ((*(_BYTE *)(v0 + 232) & 1) == 0)
  {
    v1 = *(void **)(v0 + 216);
    if (v1)
      objc_msgSend(v1, sel_cancelImageRequest_, *(_QWORD *)(v0 + 224));
  }
}

uint64_t sub_244333948(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 184) != (result & 1))
  {
    if (*(_BYTE *)(v1 + 184))
    {
      return (*(uint64_t (**)(void))(v1 + 192))();
    }
    else
    {
      result = sub_24437A9B8();
      __break(1u);
    }
  }
  return result;
}

uint64_t sub_2443339D0(char a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = *(unsigned __int8 *)(v1 + 184);
  *(_BYTE *)(v1 + 184) = a1;
  return sub_244333948(v2);
}

void sub_2443339E0(void *a1)
{
  uint64_t v1;
  id v3;

  if ((*(_BYTE *)(v1 + 209) & 1) == 0)
  {
    v3 = a1;
    sub_244333A18(a1);
  }
}

void sub_244333A18(void *a1)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)(v1 + 240);
  *(_QWORD *)(v1 + 240) = a1;
  sub_244334AF0(a1);
  sub_244334C18(v3);
  sub_244333B00();
  sub_244334C18(a1);
}

void *sub_244333A58(void *result, uint64_t a2)
{
  uint64_t v2;
  void *v4;
  id v5;

  if ((*(_BYTE *)(v2 + 209) & 1) == 0)
  {
    v4 = result;
    swift_bridgeObjectRetain();
    v5 = v4;
    return sub_244333AAC(v4, a2);
  }
  return result;
}

void *sub_244333AAC(void *a1, uint64_t a2)
{
  uint64_t v2;
  void *v4;

  v4 = *(void **)(v2 + 248);
  *(_QWORD *)(v2 + 248) = a1;
  *(_QWORD *)(v2 + 256) = a2;
  sub_244334B00(a1);
  sub_244334BE8(v4);
  sub_244333B00();
  return sub_244334BE8(a1);
}

uint64_t sub_244333B00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  result = MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = (void *)v0[30];
  if (v5 != (void *)1)
  {
    v6 = (void *)v0[31];
    if (v6 != (void *)1)
    {
      v7 = v0[32];
      v8 = sub_24437A640();
      __swift_storeEnumTagSinglePayload((uint64_t)v4, 1, 1, v8);
      v9 = sub_2443349E0();
      v10 = (_QWORD *)swift_allocObject();
      v10[2] = v0;
      v10[3] = v9;
      v10[4] = v6;
      v10[5] = v7;
      v10[6] = v5;
      v10[7] = v0;
      swift_retain_n();
      sub_244334AF0(v5);
      sub_244334B00(v6);
      sub_244332848((uint64_t)v4, (uint64_t)&unk_257357D58, (uint64_t)v10);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_244333C08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;

  v7[15] = a6;
  v7[16] = a7;
  v7[13] = a4;
  v7[14] = a5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_257356EC8);
  v7[17] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_244333C6C()
{
  uint64_t v0;
  uint64_t v1;
  id v2;
  _QWORD *v3;

  v1 = qword_257356D80;
  v2 = *(id *)(v0 + 104);
  if (v1 != -1)
    swift_once();
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 144) = v3;
  *v3 = v0;
  v3[1] = sub_244333CF4;
  return sub_2443340AC(*(_QWORD *)(v0 + 120), *(void **)(v0 + 104));
}

uint64_t sub_244333CF4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = a1;
  swift_task_dealloc();
  return OUTLINED_FUNCTION_0_17();
}

uint64_t sub_244333D4C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v1 = *(void **)(v0 + 152);
  v2 = *(_QWORD *)(v0 + 128);
  v3 = *(_QWORD *)(v0 + 136);
  v5 = *(void **)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 112);
  v7 = *(_QWORD *)(v2 + 152);
  v6 = *(_QWORD *)(v2 + 160);
  v8 = OUTLINED_FUNCTION_31_0();
  OUTLINED_FUNCTION_15_0(v3, v9, v10, v8);
  sub_24437A628();
  swift_bridgeObjectRetain();
  v11 = v5;
  swift_retain();
  v12 = v1;
  v13 = sub_24437A61C();
  v14 = (_QWORD *)OUTLINED_FUNCTION_0_2();
  v15 = MEMORY[0x24BEE6930];
  v14[2] = v13;
  v14[3] = v15;
  v14[4] = v7;
  v14[5] = v6;
  v14[6] = v1;
  v14[7] = v5;
  v14[8] = v4;
  sub_244332848(v3, (uint64_t)&unk_257357D68, (uint64_t)v14);
  swift_release();
  if (!v4)
  {
    *(_OWORD *)(v0 + 56) = 0u;
    *(_OWORD *)(v0 + 72) = 0u;
    goto LABEL_7;
  }
  *(_QWORD *)(v0 + 88) = sub_24437A46C();
  *(_QWORD *)(v0 + 96) = v16;
  sub_24437A88C();
  sub_24432CCB0(v0 + 16, v4, (_OWORD *)(v0 + 56));
  sub_24432DDB8(v0 + 16);
  if (!*(_QWORD *)(v0 + 80))
  {
LABEL_7:
    sub_244334F8C(v0 + 56, &qword_257355AF0);
LABEL_8:
    sub_2443339D0(1);
    goto LABEL_9;
  }
  if (!swift_dynamicCast() || (*(_BYTE *)(v0 + 160) & 1) == 0)
    goto LABEL_8;
LABEL_9:
  v17 = *(void **)(v0 + 104);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244333EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[4] = a6;
  v8[5] = a8;
  v8[2] = a4;
  v8[3] = a5;
  sub_24437A628();
  v8[6] = sub_24437A61C();
  sub_24437A610();
  return swift_task_switch();
}

uint64_t sub_244333F6C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(void (**)(uint64_t, uint64_t))(v0 + 16);
  swift_release();
  v3(v2, v1);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id *sub_244333FB8()
{
  id *v0;

  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();
  swift_unknownObjectRelease();
  sub_244334C18(v0[30]);
  sub_244334BE8(v0[31]);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t sub_244334014()
{
  sub_244333FB8();
  return swift_defaultActor_deallocate();
}

uint64_t sub_244334028()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_244334038()
{
  uint64_t result;

  type metadata accessor for PXImageFilterer();
  swift_allocObject();
  result = sub_244334074();
  qword_257356D70 = result;
  return result;
}

uint64_t sub_244334074()
{
  uint64_t v0;

  swift_defaultActor_initialize();
  *(_QWORD *)(v0 + 112) = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDBF648]), sel_init);
  return v0;
}

uint64_t sub_2443340AC(uint64_t a1, void *a2)
{
  uint64_t v2;
  _QWORD *v3;
  id v6;
  _QWORD *v7;

  v3[4] = a2;
  v3[5] = v2;
  v6 = a2;
  v7 = (_QWORD *)swift_task_alloc();
  v3[6] = v7;
  *v7 = v3;
  v7[1] = sub_244334114;
  return sub_244334360(a1, (uint64_t)a2);
}

uint64_t sub_244334114()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  OUTLINED_FUNCTION_29_0();
  *v4 = *v3;
  *(_QWORD *)(v2 + 56) = v1;
  swift_task_dealloc();
  if (!v1)
    *(_QWORD *)(v2 + 64) = v0;
  return OUTLINED_FUNCTION_6_5();
}

uint64_t sub_244334170()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 64));
}

uint64_t sub_2443341A4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  void *v5;
  uint8_t *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;

  if (qword_257357008 != -1)
    swift_once();
  v1 = sub_24437A31C();
  __swift_project_value_buffer(v1, (uint64_t)qword_257357C58);
  OUTLINED_FUNCTION_23_0();
  OUTLINED_FUNCTION_23_0();
  v2 = sub_24437A304();
  v3 = sub_24437A79C();
  v4 = os_log_type_enabled(v2, v3);
  v5 = *(void **)(v0 + 56);
  if (v4)
  {
    v6 = (uint8_t *)OUTLINED_FUNCTION_1_4();
    v11 = OUTLINED_FUNCTION_1_4();
    *(_DWORD *)v6 = 136315138;
    *(_QWORD *)(v0 + 16) = v5;
    v7 = v5;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257357D40);
    v8 = sub_24437A484();
    *(_QWORD *)(v0 + 24) = sub_24432469C(v8, v9, &v11);
    sub_24437A820();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_13_0();
    OUTLINED_FUNCTION_13_0();
    _os_log_impl(&dword_24430E000, v2, v3, "Failed to apply filter to image: %s", v6, 0xCu);
    swift_arrayDestroy();
    OUTLINED_FUNCTION_0_8();
  }
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_13_0();
  OUTLINED_FUNCTION_13_0();

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 32));
}

uint64_t sub_244334360(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_24433437C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  _BYTE *v16;
  _BYTE *v17;
  _BYTE *v18;

  v1 = *(void **)(v0 + 16);
  v2 = *(id *)(v0 + 24);
  if (!v1 || !v2)
  {
    v14 = v2;
    return (*(uint64_t (**)(id))(v0 + 8))(v2);
  }
  v3 = objc_allocWithZone(MEMORY[0x24BDBF660]);
  v4 = v1;
  v5 = v2;
  v6 = objc_msgSend(v3, sel_initWithImage_, v5);
  if (v6)
  {
    v7 = v6;
    v8 = (void *)sub_24437A460();
    objc_msgSend(v4, sel_setValue_forKey_, v7, v8);

    v9 = objc_msgSend(v4, sel_outputImage);
    if (v9)
    {
      v10 = v9;
      v11 = *(void **)(*(_QWORD *)(v0 + 32) + 112);
      objc_msgSend(v9, sel_extent);
      v12 = objc_msgSend(v11, sel_createCGImage_fromRect_, v10);
      if (v12)
      {
        v13 = v12;
        v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD640]), sel_initWithCGImage_, v12);

        return (*(uint64_t (**)(id))(v0 + 8))(v2);
      }
      sub_2443347E0();
      OUTLINED_FUNCTION_17_0();
      *v18 = 3;
      OUTLINED_FUNCTION_26_0();

      v4 = v7;
    }
    else
    {
      sub_2443347E0();
      OUTLINED_FUNCTION_17_0();
      *v17 = 2;
      OUTLINED_FUNCTION_26_0();

      v4 = v5;
      v10 = v7;
    }
  }
  else
  {
    sub_2443347E0();
    OUTLINED_FUNCTION_17_0();
    *v16 = 0;
    OUTLINED_FUNCTION_26_0();
    v10 = v5;
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_244334590()
{
  uint64_t v0;

  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t type metadata accessor for PXImageFilterer()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for ImageRequest.ImageResult(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for ImageRequest.ImageResult(id *a1)
{

  return swift_bridgeObjectRelease();
}

uint64_t assignWithCopy for ImageRequest.ImageResult(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

id *assignWithTake for ImageRequest.ImageResult(id *a1, _OWORD *a2)
{

  *(_OWORD *)a1 = *a2;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ImageRequest.ImageResult(uint64_t *a1, unsigned int a2)
{
  int v2;
  uint64_t v3;

  if (a2)
  {
    if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    {
      v2 = *(_DWORD *)a1 + 2147483646;
    }
    else
    {
      v3 = *a1;
      if ((unint64_t)*a1 >= 0xFFFFFFFF)
        LODWORD(v3) = -1;
      v2 = v3 - 1;
      if (v2 < 0)
        v2 = -1;
    }
  }
  else
  {
    v2 = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ImageRequest.ImageResult(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ImageRequest.ImageResult()
{
  return &type metadata for ImageRequest.ImageResult;
}

uint64_t sub_244334778()
{
  return sub_24437AB08();
}

uint64_t sub_24433479C()
{
  sub_24437AAFC();
  sub_24437AB08();
  return sub_24437AB14();
}

unint64_t sub_2443347E0()
{
  unint64_t result;

  result = qword_257357D38;
  if (!qword_257357D38)
  {
    result = MEMORY[0x24950D28C](&unk_24438A000, &type metadata for Error);
    atomic_store(result, (unint64_t *)&qword_257357D38);
  }
  return result;
}

BOOL sub_24433481C(char *a1, char *a2)
{
  return sub_244322E8C(*a1, *a2);
}

uint64_t sub_244334828()
{
  return sub_24433479C();
}

uint64_t sub_244334830()
{
  return sub_244334778();
}

uint64_t sub_244334838()
{
  sub_24437AAFC();
  sub_24437AB08();
  return sub_24437AB14();
}

uint64_t sub_244334888()
{
  uint64_t v0;

  v0 = sub_24437A31C();
  __swift_allocate_value_buffer(v0, qword_257357C58);
  __swift_project_value_buffer(v0, (uint64_t)qword_257357C58);
  sub_24437A4A8();
  return sub_24437A310();
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_244334914(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_244334978;
  return v6(a1);
}

uint64_t sub_244334978()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_12();
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
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

unint64_t sub_2443349E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257356D60;
  if (!qword_257356D60)
  {
    v1 = type metadata accessor for ImageRequest();
    result = MEMORY[0x24950D28C](&unk_244389F5C, v1);
    atomic_store(result, (unint64_t *)&qword_257356D60);
  }
  return result;
}

uint64_t sub_244334A20()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_0();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244334A60()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = swift_task_alloc();
  v3 = (_QWORD *)OUTLINED_FUNCTION_10_4(v2);
  v4 = OUTLINED_FUNCTION_9_3(v3);
  return sub_244333C08(v4, v5, v6, v7, v8, v9, v1);
}

uint64_t sub_244334ACC()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_12();
  return OUTLINED_FUNCTION_1_14(*(uint64_t (**)(void))(v0 + 8));
}

id sub_244334AF0(id result)
{
  if (result != (id)1)
    return result;
  return result;
}

id sub_244334B00(id result)
{
  id v1;

  if (result != (id)1)
  {
    v1 = result;
    swift_bridgeObjectRetain();
    return v1;
  }
  return result;
}

uint64_t sub_244334B34()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_0();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244334B74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 64);
  v3 = swift_task_alloc();
  v4 = (_QWORD *)OUTLINED_FUNCTION_10_4(v3);
  v5 = OUTLINED_FUNCTION_9_3(v4);
  return sub_244333EFC(v5, v6, v7, v8, v9, v10, v1, v2);
}

void *sub_244334BE8(void *result)
{
  if (result != (void *)1)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

void sub_244334C18(id a1)
{
  if (a1 != (id)1)

}

uint64_t sub_244334C28()
{
  swift_weakDestroy();
  OUTLINED_FUNCTION_22_0();
  return swift_deallocObject();
}

uint64_t sub_244334C44()
{
  OUTLINED_FUNCTION_18_0();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244334C74()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int *v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_28();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_8_6(v1);
  return sub_244333308(v2, v3, v4, v5, v6, v7);
}

uint64_t sub_244334CC8(void *a1, uint64_t a2)
{
  return sub_244333694(a1, a2);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_244334CE8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_18_0();
  swift_release();

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_244334D20()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_28();
  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_8_6(v1);
  return sub_2443337BC(v2, v3, v4, v5, v6, v7);
}

double sub_244334D74@<D0>(_OWORD *a1@<X8>)
{
  uint64_t *v1;
  uint64_t *v2;
  unint64_t v4;
  char v5;
  char v6;
  double result;
  uint64_t v8;

  v2 = v1;
  swift_bridgeObjectRetain();
  v4 = sub_24432D690();
  v6 = v5;
  swift_bridgeObjectRelease();
  if ((v6 & 1) != 0)
  {
    swift_isUniquelyReferenced_nonNull_native();
    v8 = *v2;
    *v2 = 0x8000000000000000;
    __swift_instantiateConcreteTypeFromMangledName(&qword_257356F20);
    sub_24437A994();
    swift_bridgeObjectRelease();
    sub_24432DBD8((_OWORD *)(*(_QWORD *)(v8 + 56) + 32 * v4), a1);
    sub_24437A9A0();
    *v2 = v8;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a1 = 0u;
    a1[1] = 0u;
  }
  return result;
}

uint64_t sub_244334E98(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  unint64_t v3;
  char v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v2 = v1;
  v3 = sub_24432D6F0(a1);
  if ((v4 & 1) == 0)
    return 0;
  v5 = v3;
  swift_isUniquelyReferenced_nonNull_native();
  v8 = *v1;
  *v1 = 0x8000000000000000;
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F28);
  sub_24437A994();
  v6 = *(_QWORD *)(*(_QWORD *)(v8 + 56) + 8 * v5);
  type metadata accessor for ImageRequest();
  sub_24437A9A0();
  *v2 = v8;
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_244334F68()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  OUTLINED_FUNCTION_22_0();
  return swift_deallocObject();
}

void sub_244334F84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_244332BA8(a1, a2, *(_QWORD *)(v2 + 16));
}

void sub_244334F8C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  OUTLINED_FUNCTION_2();
}

uint64_t sub_244334FC4(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  *(_QWORD *)(v2 + 16) = a1;
  v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 24) = v3;
  *v3 = v2;
  v3[1] = sub_24433502C;
  return v5(v2 + 32);
}

uint64_t sub_24433502C()
{
  uint64_t *v0;
  uint64_t v1;
  _BYTE *v2;
  uint64_t v4;

  v1 = *v0;
  v2 = *(_BYTE **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();
  *v2 = *(_BYTE *)(v1 + 32);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_24433507C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_2443350A0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_14_0(v1);
  return OUTLINED_FUNCTION_7_5(v2, v3, v4, v5);
}

uint64_t sub_2443350E8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v5)(void);

  v0 = swift_task_alloc();
  v1 = (_QWORD *)OUTLINED_FUNCTION_10_4(v0);
  v2 = OUTLINED_FUNCTION_14_0(v1);
  return OUTLINED_FUNCTION_7_5(v2, v3, v4, v5);
}

uint64_t sub_244335130(uint64_t (*a1)(uint64_t), uint64_t a2, uint64_t a3)
{
  return a1(a3);
}

uint64_t getEnumTagSinglePayload for Error(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFD)
  {
    if (a2 + 3 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 3) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 4;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v5 = v6 - 4;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for Error(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_244335218 + 4 * byte_244389E35[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_24433524C + 4 * byte_244389E30[v4]))();
}

uint64_t sub_24433524C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244335254(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x24433525CLL);
  return result;
}

uint64_t sub_244335268(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244335270);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244335274(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_24433527C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244335288(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_244335290(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for Error()
{
  return &type metadata for Error;
}

unint64_t sub_2443352AC()
{
  unint64_t result;

  result = qword_257357DD0;
  if (!qword_257357DD0)
  {
    result = MEMORY[0x24950D28C](&unk_244389FD8, &type metadata for Error);
    atomic_store(result, (unint64_t *)&qword_257357DD0);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_17()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_1_14(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_2_12()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_3_11()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t OUTLINED_FUNCTION_6_5()
{
  return swift_task_switch();
}

uint64_t OUTLINED_FUNCTION_7_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  return a4();
}

uint64_t OUTLINED_FUNCTION_8_6(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_9_3(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_10_4(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = result;
  return result;
}

void OUTLINED_FUNCTION_11_4()
{
  void *v0;

}

void OUTLINED_FUNCTION_13_0()
{
  void *v0;

}

uint64_t OUTLINED_FUNCTION_14_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_15_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, a4);
}

uint64_t OUTLINED_FUNCTION_16_0()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_17_0()
{
  return swift_allocError();
}

uint64_t OUTLINED_FUNCTION_18_0()
{
  return swift_unknownObjectRelease();
}

uint64_t OUTLINED_FUNCTION_19_0(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *a1 = v3;
  a1[1] = v1;
  return v2;
}

uint64_t OUTLINED_FUNCTION_22_0()
{
  uint64_t v0;

  return v0;
}

id OUTLINED_FUNCTION_23_0()
{
  void *v0;

  return v0;
}

void OUTLINED_FUNCTION_24_0(os_unfair_lock_s *a1@<X8>)
{
  os_unfair_lock_lock(a1 + 6);
}

void OUTLINED_FUNCTION_25_0()
{
  uint64_t v0;

}

uint64_t OUTLINED_FUNCTION_26_0()
{
  return swift_willThrow();
}

void OUTLINED_FUNCTION_29_0()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
}

uint64_t OUTLINED_FUNCTION_31_0()
{
  return sub_24437A640();
}

uint64_t OUTLINED_FUNCTION_32_0()
{
  return swift_weakLoadStrong();
}

uint64_t sub_2443354B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  type metadata accessor for PhotosMappingItemListManager(0, *(_QWORD *)(a2 + 80), *(_QWORD *)(a2 + 88), a4);
  return OUTLINED_FUNCTION_0_18();
}

uint64_t PhotosItemListManager.forceMetadata(for:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t AssociatedTypeWitness;

  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 16))(a2, a1, AssociatedTypeWitness);
  return __swift_storeEnumTagSinglePayload(a2, 0, 1, AssociatedTypeWitness);
}

uint64_t sub_2443355BC()
{
  return 1;
}

Swift::Bool __swiftcall PhotosItemListManager.waitForItemList(timeout:)(Swift::Double timeout)
{
  return 1;
}

void sub_2443355CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_244335904(a1, a2, a3, (void (*)(_QWORD, _OWORD *))type metadata accessor for PhotosChildProvidingItemListManager);
}

uint64_t sub_2443355D8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosItemListManager.forceMetadata(for:)(a1, a2);
}

uint64_t sub_2443355F0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosItemListManager.forceMetadata(for:)(a1, a2);
}

uint64_t PhotosItemListManager.changeDetails<A, B>(from:to:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t *a9@<X8>)
{
  (*(void (**)(uint64_t, uint64_t))(a6 + 48))(a3, a6);
  sub_24433C7B0(a1, a2, a4, a5, a7, a8, a9);
  return swift_release();
}

uint64_t PhotosItemListManagerChangeDescriptor.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t PhotosItemListManagerChangeDescriptor.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

void static PhotosItemListManagerChangeDescriptor.itemList.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_2443356A4@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return PhotosItemListManagerChangeDescriptor.init(rawValue:)(*a1, a2);
}

void sub_2443356AC(_QWORD *a1@<X8>)
{
  sub_24431F6EC(a1);
}

uint64_t sub_2443356B8@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_244323658(*a1, *v2, a2);
}

void sub_2443356C4(_QWORD *a1@<X8>)
{
  sub_24431F6FC(a1);
}

uint64_t sub_2443356D0(_QWORD *a1)
{
  return sub_24431F738(*a1);
}

uint64_t sub_2443356D8(_QWORD *a1)
{
  return sub_24431F780(*a1);
}

void sub_2443356E0(uint64_t *a1)
{
  sub_24431F7B4(*a1);
}

void sub_2443356E8(uint64_t *a1)
{
  sub_24431F7D0(*a1);
}

void sub_2443356F0(_QWORD *a1@<X8>)
{
  sub_24431F7EC(a1);
}

BOOL sub_2443356FC(uint64_t *a1)
{
  uint64_t *v1;

  return sub_244323670(*a1, *v1);
}

void sub_244335708(uint64_t *a1)
{
  sub_24431F814(*a1);
}

uint64_t sub_244335710@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = PhotosItemListManagerChangeDescriptor.init(rawValue:)(*a1, (_QWORD *)a2);
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_244335738@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosItemListManagerChangeDescriptor.rawValue.getter();
  *a1 = result;
  return result;
}

unint64_t sub_244335760(uint64_t a1)
{
  unint64_t result;

  result = sub_244335784();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244335784()
{
  unint64_t result;

  result = qword_257356BB0;
  if (!qword_257356BB0)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356BB0);
  }
  return result;
}

unint64_t sub_2443357C4()
{
  unint64_t result;

  result = qword_257356B98;
  if (!qword_257356B98)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356B98);
  }
  return result;
}

unint64_t sub_244335804()
{
  unint64_t result;

  result = qword_257356BA0;
  if (!qword_257356BA0)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356BA0);
  }
  return result;
}

unint64_t sub_244335844()
{
  unint64_t result;

  result = qword_257356B90;
  if (!qword_257356B90)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356B90);
  }
  return result;
}

unint64_t sub_244335884()
{
  unint64_t result;

  result = qword_257356BA8;
  if (!qword_257356BA8)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListManagerChangeDescriptor, &type metadata for PhotosItemListManagerChangeDescriptor);
    atomic_store(result, (unint64_t *)&qword_257356BA8);
  }
  return result;
}

uint64_t dispatch thunk of PhotosItemListManager.itemList.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosItemListManager.changeDetailsRepository.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PhotosItemListManager.waitForItemList(timeout:)(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of PhotosItemListManager.forceMetadata(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of PhotosItemListManager.refreshContents()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

ValueMetadata *type metadata accessor for PhotosItemListManagerChangeDescriptor()
{
  return &type metadata for PhotosItemListManagerChangeDescriptor;
}

void sub_2443358F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  sub_244335904(a1, a2, a3, (void (*)(_QWORD, _OWORD *))type metadata accessor for PhotosGroupingItemListManager);
}

void sub_244335904(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(_QWORD, _OWORD *))
{
  __int128 v4;
  _OWORD v5[2];

  v4 = *(_OWORD *)(a2 + 96);
  v5[0] = *(_OWORD *)(a2 + 80);
  v5[1] = v4;
  a4(0, v5);
  JUMPOUT(0x244335938);
}

uint64_t OUTLINED_FUNCTION_0_18()
{
  uint64_t v0;
  uint64_t v1;

  return PhotosItemListManager.forceMetadata(for:)(v0, v1);
}

uint64_t NullPhotosObservable.observeChanges(using:)()
{
  type metadata accessor for NullObservation();
  return swift_allocObject();
}

uint64_t type metadata accessor for NullObservation()
{
  return objc_opt_self();
}

uint64_t sub_2443359B4()
{
  return swift_deallocClassInstance();
}

uint64_t dispatch thunk of PhotosAnalyticsProvider.analyticsDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void PXObservable.performChanges(_:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  void *v6;
  _QWORD v7[6];

  v5 = OUTLINED_FUNCTION_5_6();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  v7[4] = sub_244335AF4;
  v7[5] = v5;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 1107296256;
  v7[2] = sub_244335B14;
  v7[3] = &block_descriptor_2;
  v6 = _Block_copy(v7);
  OUTLINED_FUNCTION_6_4();
  OUTLINED_FUNCTION_6_6();
  objc_msgSend(v2, sel_performChanges_, v6);
  _Block_release(v6);
}

void PXObservable.observeChanges(using:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;

  objc_allocWithZone((Class)OUTLINED_FUNCTION_13_1());
  v5 = v2;
  OUTLINED_FUNCTION_6_4();
  sub_244335DF0(v5, a1, a2);
  OUTLINED_FUNCTION_31();
}

uint64_t sub_244335AD0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244335AF4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

void sub_244335B14(uint64_t a1, uint64_t a2)
{
  void (*v3)(_QWORD *);
  _QWORD v4[4];

  v3 = *(void (**)(_QWORD *))(a1 + 32);
  v4[3] = swift_getObjectType();
  v4[0] = a2;
  swift_retain();
  swift_unknownObjectRetain();
  v3(v4);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v4);
  OUTLINED_FUNCTION_8_7();
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t type metadata accessor for PXObservableObservation()
{
  return objc_opt_self();
}

void PXObservable.addObserver(using:)(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v5;
  id v6;

  v5 = OUTLINED_FUNCTION_5_6();
  *(_QWORD *)(v5 + 16) = a1;
  *(_QWORD *)(v5 + 24) = a2;
  objc_allocWithZone((Class)OUTLINED_FUNCTION_13_1());
  OUTLINED_FUNCTION_6_4();
  v6 = v2;
  swift_retain();
  sub_244335DF0(v6, (uint64_t)sub_244335ECC, v5);
  OUTLINED_FUNCTION_6_6();
  OUTLINED_FUNCTION_31();
}

uint64_t PXObservable.GenericChange.init(rawValue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

uint64_t PXObservable.GenericChange.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

uint64_t sub_244335C38@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  return PXObservable.GenericChange.init(rawValue:)(*a1, a2);
}

uint64_t sub_244335C44(_QWORD *a1)
{
  _QWORD *v1;

  return sub_24431FC14(*a1, *v1);
}

uint64_t sub_244335C50@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t *v2;

  return sub_244323D10(*a1, *v2, a2);
}

uint64_t sub_244335C5C(_QWORD *a1)
{
  _QWORD *v1;

  return sub_24431FC18(*a1, *v1);
}

BOOL sub_244335C68(_QWORD *a1, uint64_t *a2)
{
  return sub_24431FBEC(a1, *a2);
}

uint64_t sub_244335C70(_QWORD *a1)
{
  return sub_24431FC1C(*a1);
}

uint64_t sub_244335C78(_QWORD *a1)
{
  return j_j__OUTLINED_FUNCTION_8_0(*a1);
}

uint64_t sub_244335C80(_QWORD *a1)
{
  return sub_24431FC08(*a1);
}

uint64_t sub_244335C88(_QWORD *a1)
{
  _QWORD *v1;

  return sub_24431FC20(*a1, *v1);
}

BOOL sub_244335C94(uint64_t *a1)
{
  uint64_t *v1;

  return sub_24431FC10(*a1, *v1);
}

uint64_t sub_244335CA0(_QWORD *a1)
{
  return sub_24431FBF0(*a1);
}

uint64_t sub_244335CA8@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  result = PXObservable.GenericChange.init(rawValue:)(*a1, (_QWORD *)a2);
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_244335CD0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PXObservable.GenericChange.rawValue.getter();
  *a1 = result;
  return result;
}

void sub_244335CF4(uint64_t a1, uint64_t a2)
{
  PXObservable.addObserver(using:)(a1, a2);
}

void sub_244335D1C(uint64_t a1, uint64_t a2)
{
  PXObservable.performChanges(_:)(a1, a2);
}

id sub_244335D3C(uint64_t a1)
{
  return sub_244335D5C(a1);
}

id sub_244335D5C(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_signalChange_, a1);
}

BOOL OptionSet<>.hasAnyValue(_:)()
{
  return (sub_24437A844() & 1) == 0;
}

void sub_244335D90()
{
  uint64_t v0;
  void *v1;
  id v2;

  sub_244335EFC(0, 0);
  v1 = (void *)MEMORY[0x24950D424](v0+ OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_observable);
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_unregisterChangeObserver_context_, v0, 0);

  }
}

id sub_244335DF0(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t *v7;
  uint64_t v8;
  id v9;
  objc_super v11;

  swift_unknownObjectWeakInit();
  v7 = (uint64_t *)&v3[OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler];
  *v7 = 0;
  v7[1] = 0;
  swift_unknownObjectWeakAssign();
  v8 = *v7;
  *v7 = a2;
  v7[1] = a3;
  OUTLINED_FUNCTION_6_4();
  sub_24432ED20(v8);
  v11.receiver = v3;
  v11.super_class = (Class)OUTLINED_FUNCTION_13_1();
  v9 = objc_msgSendSuper2(&v11, sel_init);
  objc_msgSend(a1, sel_registerChangeObserver_context_, v9, 0);

  swift_release();
  return v9;
}

uint64_t sub_244335ECC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t *);
  uint64_t v5;

  v3 = *(uint64_t (**)(uint64_t *))(v2 + 16);
  v5 = a2;
  return v3(&v5);
}

uint64_t sub_244335EFC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(v2
                + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  v4 = *(_QWORD *)(v2
                 + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  *v3 = a1;
  v3[1] = a2;
  return sub_24432ED20(v4);
}

uint64_t sub_244335F1C(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void (*v3)(uint64_t, uint64_t);
  uint64_t v5;

  v3 = *(void (**)(uint64_t, uint64_t))(v2
                                               + OBJC_IVAR____TtC18PhotosUIFoundationP33_FE80CC77509C779DD805C2A85B1B119023PXObservableObservation_changeHandler);
  if (v3)
  {
    v5 = result;
    swift_retain();
    v3(v5, a2);
    return sub_24432ED20((uint64_t)v3);
  }
  return result;
}

void sub_244335FEC()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id sub_244336038()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PXObservableObservation();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void static AnyPhotosObservableProperty.subscript.getter(uint64_t *a1@<X1>, uint64_t a2@<X8>)
{
  uint64_t v3;
  void (*v4)(uint64_t *, _QWORD);
  uint64_t v5;

  v3 = *a1;
  v4 = (void (*)(uint64_t *, _QWORD))swift_readAtKeyPath();
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*MEMORY[0x24BEE35B8] + v3 + 8) - 8) + 16))(a2);
  v4(&v5, 0);
  OUTLINED_FUNCTION_8_7();
}

uint64_t static AnyPhotosObservableProperty.subscript.setter(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v31;
  _QWORD *v32;
  void (*v33)(char *, uint64_t, uint64_t);
  void (*v34)(uint64_t, uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  void (*v37)(char *, uint64_t);
  char *v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  unint64_t v42;
  void (*v43)(char *, uint64_t);
  uint64_t (*v44)(char *, uint64_t);
  uint64_t (*v45)(char *, uint64_t);
  uint64_t v46;
  char *v47;
  void (*v48)(uint64_t, uint64_t);
  uint64_t v49;
  char *v50;
  void (*v51)(char *, uint64_t);
  uint64_t v52;
  unint64_t v53;
  uint64_t v54;
  uint64_t AssociatedConformanceWitness;
  char *v56;
  _QWORD v58[3];
  uint64_t v59;
  char *v60;
  uint64_t AssociatedTypeWitness;
  uint64_t v62;
  void (*v63)(uint64_t, uint64_t);
  uint64_t v64;
  _QWORD *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _QWORD *v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  char *v76;
  unint64_t v77;
  unint64_t v78;

  v62 = a1;
  v72 = a3;
  v8 = *a3;
  v9 = *MEMORY[0x24BEE35B8];
  v10 = *MEMORY[0x24BEE35B8] + 8;
  v11 = *(_QWORD *)(*a4 + v10);
  v64 = *(_QWORD *)(v11 + 32);
  v12 = *(_QWORD *)(v64 + 8);
  v13 = *(_QWORD *)(v11 + 16);
  v14 = v11;
  v74 = v11;
  v58[2] = v12;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v71 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v15);
  v60 = (char *)v58 - v16;
  v70 = *(_QWORD *)(v14 - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v17);
  v73 = (char *)v58 - v18;
  v19 = *(_QWORD *)(v8 + v9);
  v65 = *(_QWORD **)(v19 - 8);
  OUTLINED_FUNCTION_4_10();
  v21 = MEMORY[0x24BDAC7A8](v20);
  v23 = (char *)v58 - v22;
  v24 = *(_QWORD *)(v8 + v10);
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v21);
  v27 = (char *)v58 - v26;
  v76 = (char *)v58 - v26;
  v28 = swift_getAssociatedTypeWitness();
  v68 = *(_QWORD *)(v28 - 8);
  v69 = v28;
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v29);
  v30 = *(void (**)(uint64_t, uint64_t))(a5 + 32);
  v66 = (char *)v58 - v31;
  v59 = a5;
  v30(v19, a5);
  OUTLINED_FUNCTION_10_5();
  swift_readAtKeyPath();
  (*(void (**)(char *))(v25 + 16))(v27);
  OUTLINED_FUNCTION_6();
  swift_release();
  v32 = v65;
  v33 = (void (*)(char *, uint64_t, uint64_t))v65[2];
  v33(v23, a2, v19);
  swift_modifyAtReferenceWritableKeyPath();
  v67 = v25;
  v34 = *(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 24);
  v35 = v62;
  v34(v36, v62, v24);
  OUTLINED_FUNCTION_6();
  v37 = (void (*)(char *, uint64_t))v32[1];
  v37(v23, v19);
  v75 = a2;
  v58[0] = v33;
  v33(v23, a2, v19);
  OUTLINED_FUNCTION_10_5();
  v38 = v73;
  swift_getAtKeyPath();
  v65 = a4;
  swift_release();
  v63 = (void (*)(uint64_t, uint64_t))v37;
  v37(v23, v19);
  v39 = v74;
  v40 = (unint64_t *)&v38[*(int *)(v74 + 44)];
  v42 = *v40;
  v41 = v40[1];
  sub_2443365E4(*v40);
  v43 = *(void (**)(char *, uint64_t))(v70 + 8);
  v43(v38, v39);
  v77 = v42;
  v78 = v41;
  v58[1] = v13;
  v70 = v24;
  type metadata accessor for AnyPhotosObservableProperty.ChangeDetectionType(0, v13, v24, v64);
  AnyPhotosObservableProperty.ChangeDetectionType.detector.getter();
  v45 = v44;
  sub_2443366D0(v42);
  LOBYTE(v45) = v45(v76, v35);
  swift_release();
  if ((v45 & 1) != 0)
  {
    v46 = v75;
    (*(void (**)(uint64_t, uint64_t))(v59 + 40))(v19, v59);
    ((void (*)(char *, uint64_t, uint64_t))v58[0])(v23, v46, v19);
    swift_retain();
    v47 = v73;
    swift_getAtKeyPath();
    OUTLINED_FUNCTION_6_6();
    v48 = v63;
    v63((uint64_t)v23, v19);
    v49 = v74;
    v50 = v60;
    v51 = v43;
    v52 = AssociatedTypeWitness;
    (*(void (**)(char *, char *, uint64_t))(v71 + 16))(v60, &v47[*(int *)(v74 + 48)], AssociatedTypeWitness);
    v51(v47, v49);
    swift_getAssociatedConformanceWitness();
    sub_24437A520();
    v53 = v77;
    v54 = v69;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v56 = v66;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 40))(v53, v54, AssociatedConformanceWitness);
    swift_release();
    OUTLINED_FUNCTION_6_6();
    v48(v75, v19);
    OUTLINED_FUNCTION_3_12();
    (*(void (**)(char *, uint64_t))(v71 + 8))(v50, v52);
    OUTLINED_FUNCTION_12_1();
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v56, v54);
  }
  else
  {
    swift_release();
    swift_release();
    v63(v75, v19);
    OUTLINED_FUNCTION_3_12();
    OUTLINED_FUNCTION_12_1();
    return (*(uint64_t (**)(char *, uint64_t))(v68 + 8))(v66, v69);
  }
}

unint64_t sub_2443365E4(unint64_t result)
{
  if (result >= 4)
    return swift_retain();
  return result;
}

void AnyPhotosObservableProperty.ChangeDetectionType.detector.getter()
{
  unint64_t *v0;
  unint64_t v1;
  __n128 *v2;

  v1 = *v0;
  switch(*v0)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
      v2 = (__n128 *)OUTLINED_FUNCTION_2_13();
      OUTLINED_FUNCTION_1_15(v2);
      break;
    default:
      break;
  }
  sub_2443365E4(v1);
  OUTLINED_FUNCTION_31();
}

uint64_t type metadata accessor for AnyPhotosObservableProperty.ChangeDetectionType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyPhotosObservableProperty.ChangeDetectionType);
}

unint64_t sub_2443366D0(unint64_t result)
{
  if (result >= 4)
    return swift_release();
  return result;
}

void (*static AnyPhotosObservableProperty.subscript.modify(_QWORD *a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5))(uint64_t a1, char a2)
{
  _QWORD *v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  size_t v17;

  v9 = malloc(0x58uLL);
  *a1 = v9;
  v9[1] = a4;
  v9[2] = a5;
  *v9 = a3;
  v10 = (uint64_t *)(*a3 + *MEMORY[0x24BEE35B8]);
  v11 = v10[1];
  v9[3] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v9[4] = v12;
  v13 = *(_QWORD *)(v12 + 64);
  v9[5] = malloc(v13);
  v14 = malloc(v13);
  v9[6] = v14;
  v15 = *v10;
  v9[7] = v15;
  v16 = *(_QWORD *)(v15 - 8);
  v9[8] = v16;
  v17 = *(_QWORD *)(v16 + 64);
  v9[9] = malloc(v17);
  v9[10] = malloc(v17);
  (*(void (**)(void))(v16 + 16))();
  static AnyPhotosObservableProperty.subscript.getter(a3, (uint64_t)v14);
  return sub_2443367E0;
}

void sub_2443367E0(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 72);
  v4 = *(void **)(*(_QWORD *)a1 + 80);
  if ((a2 & 1) != 0)
  {
    v5 = v2[8];
    v7 = (void *)v2[5];
    v6 = (void *)v2[6];
    v9 = v2[3];
    v8 = v2[4];
    v10 = (_QWORD *)v2[1];
    v15 = v2[7];
    v16 = v2[2];
    v11 = (_QWORD *)*v2;
    (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v7, v6, v9);
    (*(void (**)(void *, void *, uint64_t))(v5 + 32))(v3, v4, v15);
    OUTLINED_FUNCTION_10_5();
    swift_retain();
    static AnyPhotosObservableProperty.subscript.setter((uint64_t)v7, (uint64_t)v3, v11, v10, v16);
    (*(void (**)(void *, uint64_t))(v8 + 8))(v6, v9);
  }
  else
  {
    v7 = (void *)v2[5];
    v6 = (void *)v2[6];
    v13 = (_QWORD *)v2[1];
    v12 = v2[2];
    v14 = (_QWORD *)*v2;
    swift_retain();
    swift_retain();
    static AnyPhotosObservableProperty.subscript.setter((uint64_t)v6, (uint64_t)v4, v14, v13, v12);
  }
  free(v4);
  free(v3);
  free(v6);
  free(v7);
  free(v2);
}

uint64_t AnyPhotosObservableProperty.wrappedValue.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 24) - 8) + 16))(a2, v2);
}

uint64_t AnyPhotosObservableProperty.wrappedValue.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 24) - 8) + 40))(v2, a1);
}

uint64_t (*AnyPhotosObservableProperty.wrappedValue.modify())()
{
  return nullsub_1;
}

unint64_t AnyPhotosObservableProperty.changeDetectionType.getter@<X0>(uint64_t a1@<X0>, unint64_t *a2@<X8>)
{
  uint64_t v2;
  unint64_t *v3;
  unint64_t v4;
  unint64_t v5;

  v3 = (unint64_t *)(v2 + *(int *)(a1 + 44));
  v4 = *v3;
  v5 = v3[1];
  *a2 = *v3;
  a2[1] = v5;
  return sub_2443365E4(v4);
}

uint64_t AnyPhotosObservableProperty.init(wrappedValue:changeDescriptor:changeDetectionType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t result;
  _QWORD *v18;

  v12 = *a3;
  v13 = a3[1];
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(a7, a1, a5);
  v14 = type metadata accessor for AnyPhotosObservableProperty(0, a4, a5, a6);
  v15 = a7 + *(int *)(v14 + 48);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v15, a2, AssociatedTypeWitness);
  v18 = (_QWORD *)(a7 + *(int *)(v14 + 44));
  *v18 = v12;
  v18[1] = v13;
  return result;
}

uint64_t AnyPhotosObservableProperty.init(wrappedValue:_:changeDetectionType:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __int128 *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X8>)
{
  __int128 v8;

  v8 = *a3;
  return AnyPhotosObservableProperty.init(wrappedValue:changeDescriptor:changeDetectionType:)(a1, a2, (uint64_t *)&v8, a4, a5, a6, a7);
}

void AnyPhotosObservableProperty.init(_:changeDetectionType:)()
{
  sub_24437A9B8();
  __break(1u);
}

uint64_t AnyPhotosObservableProperty.ChangeDetectionType.description.getter()
{
  _QWORD *v0;
  uint64_t result;

  switch(*v0)
  {
    case 0:
      result = 0x49207463656A624FLL;
      break;
    case 1:
      result = 0x7974696C61757145;
      break;
    case 2:
      result = 0x6E6F6973726556;
      break;
    case 3:
      result = 0x737961776C41;
      break;
    default:
      result = 0x6C61756E614DLL;
      break;
  }
  return result;
}

BOOL sub_244336B28()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_24437AA60();
  v1 = sub_24437AA60();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  return v0 != v1;
}

BOOL sub_244336B84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v25[6];
  _QWORD v26[3];
  uint64_t v27;
  uint64_t v28;
  uint64_t v29[5];
  _QWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = *(void (**)(char *))(v9 + 16);
  v10((char *)v25 - v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356E98);
  swift_dynamicCast();
  v12 = v31;
  v13 = v32;
  v14 = __swift_project_boxed_opaque_existential_1(v30, v31);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v25 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v17 + 16))(v16);
  PhotosAnyEquatable.init<A>(_:)((uint64_t)v16, v12, v13, v29);
  ((void (*)(char *, uint64_t, uint64_t))v10)(v8, a2, a4);
  swift_dynamicCast();
  v18 = v27;
  v19 = v28;
  v20 = __swift_project_boxed_opaque_existential_1(v26, v27);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v25 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v23 + 16))(v22);
  PhotosAnyEquatable.init<A>(_:)((uint64_t)v22, v18, v19, v25);
  LOBYTE(v18) = ((uint64_t (*)(uint64_t *))v29[4])(v25);
  sub_244327824((uint64_t)v25);
  sub_244327824((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v26);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v30);
  return (v18 & 1) == 0;
}

BOOL sub_244336D78(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void (*v10)(char *);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  _QWORD v19[3];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[3];
  uint64_t v23;
  uint64_t v24;

  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = *(void (**)(char *))(v9 + 16);
  v10((char *)v19 - v11);
  __swift_instantiateConcreteTypeFromMangledName(qword_257356590);
  swift_dynamicCast();
  v12 = v23;
  v13 = v24;
  __swift_project_boxed_opaque_existential_1(v22, v23);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t))(v13 + 8))(v12, v13);
  ((void (*)(char *, uint64_t, uint64_t))v10)(v8, a2, a4);
  swift_dynamicCast();
  v15 = v20;
  v16 = v21;
  __swift_project_boxed_opaque_existential_1(v19, v20);
  v17 = v14 != (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 8))(v15, v16);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v19);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v22);
  return v17;
}

BOOL sub_244336ED0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_244336D78(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

BOOL sub_244336EE4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_244336B84(a1, a2, *(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
}

BOOL sub_244336EF4()
{
  return sub_244336B28();
}

uint64_t type metadata accessor for AnyPhotosObservableProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AnyPhotosObservableProperty);
}

uint64_t AnyPhotosObservableProperty<>.init(wrappedValue:_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  return sub_244336F28(a1, a2, a3, a4, a5, a6, xmmword_24438A5B0);
}

{
  return sub_244336F28(a1, a2, a3, a4, a5, a6, xmmword_24438A5C0);
}

uint64_t sub_244336F28@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>, __int128 a7@<Q0>)
{
  __int128 v8;

  v8 = a7;
  return AnyPhotosObservableProperty.init(wrappedValue:_:changeDetectionType:)(a1, a2, &v8, a3, a4, a5, a6);
}

unint64_t sub_244336F58(uint64_t a1)
{
  unint64_t result;

  result = sub_244336F7C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_244336F7C()
{
  unint64_t result;

  result = qword_257357E80;
  if (!qword_257357E80)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357E80);
  }
  return result;
}

unint64_t sub_244336FBC()
{
  unint64_t result;

  result = qword_257357E88;
  if (!qword_257357E88)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357E88);
  }
  return result;
}

unint64_t sub_244336FFC()
{
  unint64_t result;

  result = qword_257357E90;
  if (!qword_257357E90)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357E90);
  }
  return result;
}

unint64_t sub_24433703C()
{
  unint64_t result;

  result = qword_257357E98;
  if (!qword_257357E98)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357E98);
  }
  return result;
}

unint64_t sub_24433707C()
{
  unint64_t result;

  result = qword_257357EA0;
  if (!qword_257357EA0)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357EA0);
  }
  return result;
}

unint64_t sub_2443370BC()
{
  unint64_t result;

  result = qword_257357EA8;
  if (!qword_257357EA8)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXObservable.GenericChange, &type metadata for PXObservable.GenericChange);
    atomic_store(result, (unint64_t *)&qword_257357EA8);
  }
  return result;
}

ValueMetadata *type metadata accessor for PXObservable.GenericChange()
{
  return &type metadata for PXObservable.GenericChange;
}

uint64_t dispatch thunk of PXObservation.invalidate()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t sub_244337110()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_getAssociatedTypeWitness();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_2443371BC(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  int v10;
  uint64_t v11;
  unsigned int v12;
  BOOL v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = v10;
  v12 = v10 | *(_DWORD *)(v6 + 80) & 0xF8;
  if (((*(_DWORD *)(v6 + 80) | v10) & 0x100000) != 0
    || (((((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + v10 + 16) & ~(unint64_t)v10)
      + *(_QWORD *)(v9 + 64) <= 0x18
      ? (v13 = v12 > 7)
      : (v13 = 1),
        v13))
  {
    v18 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v18 + (((v12 | 7) + 16) & ~(unint64_t)(v12 | 7)));
    swift_retain();
  }
  else
  {
    v14 = AssociatedTypeWitness;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v6 + 16))(a1, a2, v5);
    v15 = ((unint64_t)a1 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    v16 = ((unint64_t)a2 + v7 + 7) & 0xFFFFFFFFFFFFFFF8;
    if (*(_QWORD *)v16 < 0xFFFFFFFFuLL)
    {
      *(_OWORD *)v15 = *(_OWORD *)v16;
    }
    else
    {
      v17 = *(_QWORD *)(v16 + 8);
      *(_QWORD *)v15 = *(_QWORD *)v16;
      *(_QWORD *)(v15 + 8) = v17;
      swift_retain();
    }
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))((v15 + v11 + 16) & ~v11, (v16 + v11 + 16) & ~v11, v14);
  }
  return a1;
}

uint64_t sub_244337318(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t AssociatedTypeWitness;

  v3 = *(_QWORD *)(*(_QWORD *)(a2 + 24) - 8);
  (*(void (**)(void))(v3 + 8))();
  v4 = (_QWORD *)((a1 + *(_QWORD *)(v3 + 64) + 7) & 0xFFFFFFFFFFFFFFF8);
  if (*v4 >= 0xFFFFFFFFuLL)
    swift_release();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return (*(uint64_t (**)(unint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8))(((unint64_t)v4 + *(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(AssociatedTypeWitness - 8) + 80), AssociatedTypeWitness);
}

uint64_t sub_2443373B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 16))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v7 = *(_OWORD *)v8;
  }
  else
  {
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v7 = *(_QWORD *)v8;
    *(_QWORD *)(v7 + 8) = v9;
    swift_retain();
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 16))((v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_244337488(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 24))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v11 = v8[1];
      *v7 = v9;
      v7[1] = v11;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v7 = *(_OWORD *)v8;
    goto LABEL_8;
  }
  if (v9 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v10 = v8[1];
  *v7 = v9;
  v7[1] = v10;
  swift_retain();
  swift_release();
LABEL_8:
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 24))(((unint64_t)v7 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_2443375A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t AssociatedTypeWitness;
  uint64_t v11;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 32))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (v6 + a1) & 0xFFFFFFFFFFFFFFF8;
  v8 = (v6 + a2) & 0xFFFFFFFFFFFFFFF8;
  if (*(_QWORD *)v8 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)v7 = *(_OWORD *)v8;
  }
  else
  {
    v9 = *(_QWORD *)(v8 + 8);
    *(_QWORD *)v7 = *(_QWORD *)v8;
    *(_QWORD *)(v7 + 8) = v9;
  }
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v11 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))((v7 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v8 + *(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_24433766C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t AssociatedTypeWitness;
  uint64_t v13;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 24) - 8);
  (*(void (**)(void))(v5 + 40))();
  v6 = *(_QWORD *)(v5 + 64) + 7;
  v7 = (_QWORD *)((v6 + a1) & 0xFFFFFFFFFFFFFFF8);
  v8 = (unint64_t *)((v6 + a2) & 0xFFFFFFFFFFFFFFF8);
  v9 = *v8;
  if (*v7 < 0xFFFFFFFFuLL)
  {
    if (v9 >= 0xFFFFFFFF)
    {
      v11 = v8[1];
      *v7 = v9;
      v7[1] = v11;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)v7 = *(_OWORD *)v8;
    goto LABEL_8;
  }
  if (v9 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v10 = v8[1];
  *v7 = v9;
  v7[1] = v10;
  swift_release();
LABEL_8:
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v13 = *(_QWORD *)(AssociatedTypeWitness - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 40))(((unint64_t)v7 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), ((unint64_t)v8 + *(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), AssociatedTypeWitness);
  return a1;
}

uint64_t sub_244337770(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  int v17;
  unsigned int v19;
  int v20;
  int v21;
  unint64_t *v22;
  unint64_t v23;
  unsigned int v24;
  unsigned int v25;

  v5 = *(_QWORD *)(a3 + 24);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int *)(v6 + 84);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v10 = *(unsigned int *)(v9 + 84);
  if (v7 <= v10)
    v11 = *(_DWORD *)(v9 + 84);
  else
    v11 = v7;
  if (v11 <= 0x7FFFFFFB)
    v12 = 2147483643;
  else
    v12 = v11;
  if (!a2)
    return 0;
  v13 = *(_QWORD *)(v6 + 64);
  v14 = *(unsigned __int8 *)(v9 + 80);
  if (a2 <= v12)
    goto LABEL_27;
  v15 = ((v14 + ((v13 + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~v14) + *(_QWORD *)(v9 + 64);
  v16 = 8 * v15;
  if (v15 <= 3)
  {
    v19 = ((a2 - v12 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      v17 = *(_DWORD *)(a1 + v15);
      if (!v17)
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      v17 = *(unsigned __int16 *)(a1 + v15);
      if (!*(_WORD *)(a1 + v15))
        goto LABEL_27;
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_27:
      if ((_DWORD)v7 == v12)
        return __swift_getEnumTagSinglePayload(a1, v7, v5);
      v22 = (unint64_t *)((a1 + v13 + 7) & 0xFFFFFFFFFFFFFFF8);
      if (v11 > 0x7FFFFFFB)
        return __swift_getEnumTagSinglePayload(((unint64_t)v22 + v14 + 16) & ~v14, v10, AssociatedTypeWitness);
      v23 = *v22;
      if (v23 >= 0xFFFFFFFF)
        LODWORD(v23) = -1;
      v24 = v23 + 1;
      v25 = v23 - 3;
      if (v24 >= 5)
        return v25;
      else
        return 0;
    }
  }
  v17 = *(unsigned __int8 *)(a1 + v15);
  if (!*(_BYTE *)(a1 + v15))
    goto LABEL_27;
LABEL_18:
  v20 = (v17 - 1) << v16;
  if (v15 > 3)
    v20 = 0;
  if ((_DWORD)v15)
  {
    if (v15 <= 3)
      v21 = v15;
    else
      v21 = 4;
    __asm { BR              X12 }
  }
  return v12 + v20 + 1;
}

void sub_244337978(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  size_t v12;
  char v13;
  unsigned int v14;
  int v15;
  unsigned int v16;
  int v17;

  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 24) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  v9 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  if (v8 <= *(_DWORD *)(v9 + 84))
    v10 = *(_DWORD *)(v9 + 84);
  else
    v10 = v8;
  if (v10 <= 0x7FFFFFFB)
    v11 = 2147483643;
  else
    v11 = v10;
  v12 = ((*(unsigned __int8 *)(v9 + 80) + ((*(_QWORD *)(v7 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 16) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80))
      + *(_QWORD *)(v9 + 64);
  v13 = 8 * v12;
  if (a3 <= v11)
  {
    v14 = 0;
  }
  else if (v12 <= 3)
  {
    v16 = ((a3 - v11 + ~(-1 << v13)) >> v13) + 1;
    if (HIWORD(v16))
    {
      v14 = 4u;
    }
    else if (v16 >= 0x100)
    {
      v14 = 2;
    }
    else
    {
      v14 = v16 > 1;
    }
  }
  else
  {
    v14 = 1u;
  }
  if (v11 < a2)
  {
    v15 = ~v11 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v17 = v15 & ~(-1 << v13);
        bzero(a1, v12);
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v17;
          a1[2] = BYTE2(v17);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v17;
        }
        else
        {
          *a1 = v17;
        }
      }
    }
    else
    {
      bzero(a1, v12);
      *(_DWORD *)a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t sub_244337BFC()
{
  return swift_allocateGenericValueMetadata();
}

_QWORD *sub_244337C08(_QWORD *result)
{
  if (*result >= 0xFFFFFFFFuLL)
    return (_QWORD *)swift_release();
  return result;
}

uint64_t sub_244337C24(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v3 = *(_QWORD *)(a2 + 8);
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_retain();
  }
  return a1;
}

unint64_t *sub_244337C6C(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_retain();
  swift_release();
  return a1;
}

unint64_t *sub_244337CF8(unint64_t *a1, unint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *a2;
  if (*a1 < 0xFFFFFFFF)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      v6 = a2[1];
      *a1 = v4;
      a1[1] = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[1];
  *a1 = v4;
  a1[1] = v5;
  swift_release();
  return a1;
}

uint64_t sub_244337D78(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFC && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 2147483644);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 3;
  if (v4 >= 5)
    return v5;
  else
    return 0;
}

uint64_t sub_244337DCC(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483644;
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2 + 3;
  }
  return result;
}

uint64_t sub_244337E28(uint64_t *a1)
{
  uint64_t v1;

  v1 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_244337E40(_QWORD *result, int a2)
{
  uint64_t v2;

  if (a2 < 0)
  {
    v2 = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else
  {
    if (!a2)
      return result;
    v2 = (a2 - 1);
  }
  *result = v2;
  return result;
}

uint64_t OUTLINED_FUNCTION_0_19()
{
  return swift_deallocObject();
}

__n128 OUTLINED_FUNCTION_1_15(__n128 *a1)
{
  __n128 *v1;
  __n128 result;

  result = v1[1];
  a1[1] = result;
  a1[2].n128_u64[0] = v1[2].n128_u64[0];
  return result;
}

uint64_t OUTLINED_FUNCTION_2_13()
{
  return swift_allocObject();
}

uint64_t OUTLINED_FUNCTION_3_12()
{
  uint64_t v0;
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)(v1 - 200) + 8))(v0, *(_QWORD *)(v1 - 176));
}

uint64_t OUTLINED_FUNCTION_6_6()
{
  return swift_release();
}

uint64_t OUTLINED_FUNCTION_10_5()
{
  return swift_retain();
}

uint64_t OUTLINED_FUNCTION_12_1()
{
  uint64_t (*v0)(_QWORD, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(*(_QWORD *)(v2 - 128), v1);
}

uint64_t OUTLINED_FUNCTION_13_1()
{
  return type metadata accessor for PXObservableObservation();
}

uint64_t PhotosNSCache.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  PhotosNSCache.init()();
  return v0;
}

uint64_t PhotosNSCache.init()()
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

  __swift_instantiateConcreteTypeFromMangledName(qword_257357F58);
  v1 = OUTLINED_FUNCTION_0_20();
  type metadata accessor for PhotosNSCache.WrappedKey(v1, v2, v3, v4);
  v5 = OUTLINED_FUNCTION_0_20();
  type metadata accessor for PhotosNSCache.WrappedValue(v5, v6, v7, v8);
  *(_QWORD *)(v0 + 16) = sub_24433851C();
  return v0;
}

uint64_t sub_244337F9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v6 = *(_QWORD *)(a4 + a3 - 24);
  v7 = sub_24437A808();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v16 - v10;
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)&v16 - v12;
  (*(void (**)(char *, uint64_t, uint64_t))(v14 + 16))((char *)&v16 - v12, a3, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v11, a1, v7);
  return PhotosNSCache.subscript.setter((uint64_t)v11, (uint64_t)v13);
}

uint64_t PhotosNSCache.subscript.setter(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v5;
  uint64_t v6;

  v5 = *v2;
  sub_2443381F4(a1, a2);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 80) - 8) + 8))(a2);
  v6 = sub_24437A808();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

uint64_t _s18PhotosUIFoundation0A7NSCacheCyq_Sgxcig_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  id *v2;
  id *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  char *v13;
  uint64_t v14;
  uint64_t v16;

  v3 = v2;
  v6 = *((_QWORD *)*v3 + 10);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *(_QWORD *)(v10 + 88);
  type metadata accessor for PhotosNSCache.WrappedKey(0, v6, v11, *(_QWORD *)(v10 + 96));
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  v12 = sub_244338558((uint64_t)v9);
  v13 = (char *)objc_msgSend(v3[2], sel_objectForKey_, v12);

  if (v13)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v11 - 8) + 16))(a2, &v13[*(_QWORD *)(*(_QWORD *)v13 + 104)], v11);
    swift_release();
    v14 = 0;
  }
  else
  {
    v14 = 1;
  }
  return __swift_storeEnumTagSinglePayload(a2, v14, 1, v11);
}

void sub_2443381F4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v18 = a2;
  v19 = a1;
  v3 = *v2;
  v4 = *(_QWORD *)(*v2 + 88);
  v5 = sub_24437A808();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v17 - v8;
  v10 = *(_QWORD *)(v3 + 80);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = *(_QWORD *)(v3 + 96);
  type metadata accessor for PhotosNSCache.WrappedKey(0, v10, v4, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v18, v10);
  v15 = sub_244338558((uint64_t)v13);
  type metadata accessor for PhotosNSCache.WrappedValue(0, v10, v4, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, v19, v5);
  v16 = sub_244338588(v9);
  if (v16)
  {
    objc_msgSend(*(id *)(v20 + 16), sel_setObject_forKey_, v16, v15);
    swift_release();
  }
  else
  {
    objc_msgSend(*(id *)(v20 + 16), sel_removeObjectForKey_, v15);
  }

}

void (*PhotosNSCache.subscript.modify(_QWORD *a1, uint64_t a2))(uint64_t a1, char a2)
{
  uint64_t *v2;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  size_t v13;

  v5 = malloc(0x48uLL);
  *a1 = v5;
  *v5 = v2;
  v6 = *v2;
  v7 = sub_24437A808();
  v5[1] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v5[2] = v8;
  v9 = *(_QWORD *)(v8 + 64);
  v5[3] = malloc(v9);
  v10 = malloc(v9);
  v5[4] = v10;
  v11 = *(_QWORD *)(v6 + 80);
  v5[5] = v11;
  v12 = *(_QWORD *)(v11 - 8);
  v5[6] = v12;
  v13 = *(_QWORD *)(v12 + 64);
  v5[7] = malloc(v13);
  v5[8] = malloc(v13);
  (*(void (**)(void))(v12 + 16))();
  _s18PhotosUIFoundation0A7NSCacheCyq_Sgxcig_0(a2, (uint64_t)v10);
  return sub_244338448;
}

void sub_244338448(uint64_t a1, char a2)
{
  _QWORD *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *(_QWORD **)a1;
  v3 = *(void **)(*(_QWORD *)a1 + 56);
  v4 = *(void **)(*(_QWORD *)a1 + 64);
  if ((a2 & 1) != 0)
  {
    v5 = v2[5];
    v6 = v2[6];
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    v9 = v2[1];
    v10 = v2[2];
    (*(void (**)(void *, void *, uint64_t))(v10 + 16))(v8, v7, v9);
    (*(void (**)(void *, void *, uint64_t))(v6 + 32))(v3, v4, v5);
    PhotosNSCache.subscript.setter((uint64_t)v8, (uint64_t)v3);
    (*(void (**)(void *, uint64_t))(v10 + 8))(v7, v9);
  }
  else
  {
    v8 = (void *)v2[3];
    v7 = (void *)v2[4];
    PhotosNSCache.subscript.setter((uint64_t)v7, (uint64_t)v4);
  }
  free(v4);
  free(v3);
  free(v7);
  free(v8);
  free(v2);
}

id sub_24433851C()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

uint64_t type metadata accessor for PhotosNSCache.WrappedKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosNSCache.WrappedKey);
}

uint64_t type metadata accessor for PhotosNSCache.WrappedValue(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosNSCache.WrappedValue);
}

id sub_244338558(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return sub_2443385C0(a1);
}

uint64_t sub_244338588(char *a1)
{
  swift_allocObject();
  return sub_2443388D0(a1);
}

id sub_2443385C0(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  uint64_t v5;
  id v6;
  objc_super v8;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x50);
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(&v1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)v1) + 0x68)], a1, v4);
  v8.receiver = v1;
  v8.super_class = ObjectType;
  v6 = objc_msgSendSuper2(&v8, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v6;
}

uint64_t sub_244338660(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  v2 = sub_244338690();

  return v2;
}

uint64_t sub_244338690()
{
  return sub_24437A40C();
}

uint64_t sub_2443386CC(uint64_t a1)
{
  char v2;
  void *v4;
  _BYTE v5[24];
  uint64_t v6;

  swift_getObjectType();
  sub_244338BD0(a1, (uint64_t)v5);
  if (!v6)
  {
    sub_244324FE4((uint64_t)v5);
    goto LABEL_5;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_5:
    v2 = 0;
    return v2 & 1;
  }
  v2 = sub_24437A454();

  return v2 & 1;
}

uint64_t sub_2443387B0(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  id v5;
  char v6;
  _OWORD v8[2];

  if (a3)
  {
    v4 = a1;
    swift_unknownObjectRetain();
    sub_24437A838();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = a1;
  }
  v6 = sub_2443386CC((uint64_t)v8);

  sub_244324FE4((uint64_t)v8);
  return v6 & 1;
}

void sub_244338824()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_244338850()
{
  sub_244338824();
}

id sub_244338870()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2443388A4(char *a1)
{
  return (*(uint64_t (**)(char *))(*(_QWORD *)(*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x50)
                                                       - 8)
                                           + 8))(&a1[*(_QWORD *)((*MEMORY[0x24BEE4EA0] & *(_QWORD *)a1) + 0x68)]);
}

uint64_t sub_2443388D0(char *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  void (*v9)(char *, char *, uint64_t);
  uint64_t v11;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](a1);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (__swift_getEnumTagSinglePayload(v5, 1, v3) == 1)
  {
    v8 = sub_24437A808();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(a1, v8);
    swift_deallocPartialClassInstance();
    return 0;
  }
  else
  {
    v9 = *(void (**)(char *, char *, uint64_t))(v4 + 32);
    v9(v7, a1, v3);
    v9((char *)(v1 + *(_QWORD *)(*(_QWORD *)v1 + 104)), v7, v3);
  }
  return v1;
}

uint64_t sub_2443389B8()
{
  uint64_t v0;

  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 88) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 104));
  return v0;
}

uint64_t sub_2443389E8()
{
  sub_2443389B8();
  return swift_deallocClassInstance();
}

uint64_t PhotosNSCache.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t PhotosNSCache.__deallocating_deinit()
{
  PhotosNSCache.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_244338A44(uint64_t a1, uint64_t a2)
{
  return PhotosNSCache.subscript.getter(a2);
}

uint64_t sub_244338A6C()
{
  return 24;
}

__n128 sub_244338A78(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  a2[1].n128_u64[0] = a1[1].n128_u64[0];
  *a2 = result;
  return result;
}

uint64_t sub_244338A8C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosNSCache(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosNSCache);
}

uint64_t method lookup function for PhotosNSCache()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosNSCache.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_244338AF0()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_244338B60()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_244338BD0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257355AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t OUTLINED_FUNCTION_0_20()
{
  return 0;
}

uint64_t sub_244338C2C(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);
  return swift_release();
}

Swift::Void __swiftcall UIViewController.configurePhotosSlideTransition()()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  _BYTE *v4;

  v1 = v0;
  v2 = sub_244338CD0();
  v3 = sub_244338DE4();

  objc_msgSend(v1, sel_setTransitioningDelegate_, v3);
  v4 = sub_244338CD0();
  v4[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured] = 1;

}

id sub_244338CD0()
{
  void *v0;
  id v1;
  uint64_t v3;
  _OWORD v4[2];
  _BYTE v5[24];
  uint64_t v6;

  if (objc_getAssociatedObject(v0, &unk_2573580E0))
  {
    sub_24437A838();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v4, 0, sizeof(v4));
  }
  sub_24433A128((uint64_t)v4, (uint64_t)v5);
  if (!v6)
  {
    sub_244324FE4((uint64_t)v5);
    goto LABEL_8;
  }
  _s14AssociatedDataCMa();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    v1 = objc_msgSend(objc_allocWithZone((Class)_s14AssociatedDataCMa()), sel_init);
    objc_setAssociatedObject(v0, &unk_2573580E0, v1, (void *)1);
    return v1;
  }
  return (id)v3;
}

uint64_t UIViewController.isConfiguredForPhotosSlideTransition.getter()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v0 = (unsigned __int8 *)sub_244338CD0();
  v1 = v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured];

  return v1;
}

id sub_244338DE4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate;
  v2 = *(void **)(v0
                + OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate);
  if (v2)
  {
    v3 = *(id *)(v0
               + OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransitionTransitioningDelegate()), sel_init);
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_244338E54()
{
  _BYTE *v0;
  objc_super v2;

  v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData_isConfigured] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtCE18PhotosUIFoundationCSo16UIViewControllerP33_245E59FB3AED492785587A094999446D14AssociatedData____lazy_storage___transitioningDelegate] = 0;
  v2.receiver = v0;
  v2.super_class = (Class)_s14AssociatedDataCMa();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_244338EC0()
{
  return sub_24433A0C0(0, _s14AssociatedDataCMa);
}

id PhotosSlideTransition.__allocating_init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(_BYTE *a1, char a2, char a3, char a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(a1, a2, a3, a4);
}

id PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(_BYTE *a1, char a2, char a3, char a4)
{
  _BYTE *v4;
  objc_super v6;

  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_direction] = *a1;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_useLinearAnimation] = a2;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground] = a3;
  v4[OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_roundDetailsViewCorners] = a4;
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for PhotosSlideTransition();
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t type metadata accessor for PhotosSlideTransition()
{
  return objc_opt_self();
}

BOOL static PhotosSlideTransition.Direction.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t PhotosSlideTransition.Direction.hash(into:)()
{
  return sub_24437AB08();
}

uint64_t PhotosSlideTransition.Direction.hashValue.getter()
{
  sub_24437AAFC();
  sub_24437AB08();
  return sub_24437AB14();
}

void sub_24433904C(void *a1@<X0>, __int128 *a2@<X8>)
{
  id v3;
  id v4;
  id v5;
  double Width;
  double v7;
  double v8;
  CGFloat v9;
  CGAffineTransform *Scale;
  CGFloat tx;
  CGFloat ty;
  id v13;
  double v14;
  double v15;
  double v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v29;
  CGRect v30;

  v3 = objc_msgSend(a1, sel_containerView);
  v4 = objc_msgSend(v3, sel_traitCollection);
  if (objc_msgSend(v4, sel_verticalSizeClass) == (id)1
    || (v5 = objc_msgSend(v4, sel_userInterfaceIdiom), v5 == (id)1)
    || ((OUTLINED_FUNCTION_0_13((uint64_t)v5, sel_frame), Width = CGRectGetWidth(v29), Width <= 393.0)
      ? (v7 = 16.0, v8 = 24.0)
      : (v7 = 20.0, v8 = 30.0),
        Width <= v8))
  {

    v18 = xmmword_24438A680;
    v20 = xmmword_24438A690;
    v19 = 0uLL;
  }
  else
  {
    v9 = (Width - v7) / Width;
    Scale = CGAffineTransformMakeScale(&t1, v9, v9);
    v22 = *(_OWORD *)&t1.c;
    v24 = *(_OWORD *)&t1.a;
    tx = t1.tx;
    ty = t1.ty;
    v13 = OUTLINED_FUNCTION_0_13((uint64_t)Scale, sel_safeAreaInsets);
    v15 = v14;
    OUTLINED_FUNCTION_0_13((uint64_t)v13, sel_frame);
    v16 = v15 + (1.0 - v9) * CGRectGetHeight(v30) * -0.5;
    v17 = 0.0;
    if (v16 > 0.0)
      v17 = v16;
    CGAffineTransformMakeTranslation(&t1, 0.0, v17);
    *(_OWORD *)&t2.a = v24;
    *(_OWORD *)&t2.c = v22;
    t2.tx = tx;
    t2.ty = ty;
    CGAffineTransformConcat(&v26, &t1, &t2);
    v23 = *(_OWORD *)&v26.c;
    v25 = *(_OWORD *)&v26.a;
    v21 = *(_OWORD *)&v26.tx;

    v19 = v21;
    v18 = v23;
    v20 = v25;
  }
  *a2 = v20;
  a2[1] = v18;
  a2[2] = v19;
}

void sub_244339224(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  id v4;
  CGFloat Height;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  BOOL v18;
  char v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  double v31;
  double v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  unsigned __int8 v36;
  double v37;
  id v38;
  double v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int8 v42;
  id v43;
  id v44;
  uint64_t v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  uint64_t v56;
  int v57;
  CGFloat v58;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int v62;
  double v63;
  void *v64;
  void *v65;
  void *v66;
  _QWORD v67[6];
  __int128 v68;
  double v69;
  double v70;
  double v71;
  double v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;

  v2 = v1;
  swift_getObjectType();
  v4 = objc_msgSend(a1, sel_containerView);
  objc_msgSend(v4, sel_bounds);
  Height = CGRectGetHeight(v73);
  sub_24433904C(a1, &v68);
  v57 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground);
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v7 = *(double *)&v68;
  else
    v7 = 1.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v8 = *((double *)&v68 + 1);
  else
    v8 = 0.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v9 = v69;
  else
    v9 = 0.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v10 = v70;
  else
    v10 = 1.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v11 = v71;
  else
    v11 = 0.0;
  if (*(_BYTE *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_animateBackground))
    v12 = v72;
  else
    v12 = 0.0;
  v13 = OUTLINED_FUNCTION_1_16(v6, sel_viewForKey_);
  v14 = OUTLINED_FUNCTION_1_16((uint64_t)v13, sel_viewControllerForKey_);
  v15 = OUTLINED_FUNCTION_1_16((uint64_t)v14, sel_viewForKey_);
  v16 = OUTLINED_FUNCTION_1_16((uint64_t)v15, sel_viewControllerForKey_);
  v17 = v16;
  if (v13)
    v18 = v14 == 0;
  else
    v18 = 1;
  v19 = v18;
  v66 = v13;
  v64 = v16;
  v62 = *(unsigned __int8 *)(v1 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_direction);
  if ((v62 & 1) != 0)
  {
    if ((v19 & 1) == 0)
    {
      v20 = v13;
      v21 = v14;
      OUTLINED_FUNCTION_4_11((uint64_t)objc_msgSend(a1, sel_initialFrameForViewController_, v21), sel_setFrame_);
      objc_msgSend(v20, sel_frame);
      v75 = CGRectOffset(v74, 0.0, Height);
      y = v75.origin.y;
      x = v75.origin.x;
      v58 = v75.size.height;
      width = v75.size.width;
      if (v15 && v17)
      {
        v22 = v15;
        v23 = v17;
        objc_msgSend(a1, sel_finalFrameForViewController_, v23);
        objc_msgSend(v22, sel_setFrame_);
        *(double *)v67 = v7;
        *(double *)&v67[1] = v8;
        *(double *)&v67[2] = v9;
        *(double *)&v67[3] = v10;
        *(double *)&v67[4] = v11;
        *(double *)&v67[5] = v12;
        objc_msgSend(v22, sel_setTransform_, v67);
        objc_msgSend(v4, sel_insertSubview_belowSubview_, v22, v20);

      }
      v24 = v15;
      v10 = 1.0;
      v12 = 0.0;
      v11 = 0.0;
      v9 = 0.0;
      v8 = 0.0;
      v63 = 1.0;
      goto LABEL_36;
    }
LABEL_49:
    sub_24437A9B8();
    __break(1u);
    return;
  }
  if ((v19 & 1) == 0)
  {
    v25 = v13;
    v26 = v14;
    v27 = OUTLINED_FUNCTION_2_14((uint64_t)v26, sel_initialFrameForViewController_);
    OUTLINED_FUNCTION_4_11((uint64_t)v27, sel_setFrame_);

  }
  if (!v15 || !v17)
    goto LABEL_49;
  v63 = v7;
  v28 = v17;
  v24 = v13;
  v20 = v15;
  v29 = v28;
  OUTLINED_FUNCTION_2_14((uint64_t)v29, sel_finalFrameForViewController_);
  y = v76.origin.y;
  x = v76.origin.x;
  v58 = v76.size.height;
  width = v76.size.width;
  CGRectOffset(v76, 0.0, Height);
  OUTLINED_FUNCTION_4_11(v30, sel_setFrame_);
  objc_msgSend(v4, sel_addSubview_, v20);

LABEL_36:
  v31 = v8;
  v65 = v15;
  v32 = v9;
  if (v24)
  {
    v33 = v24;
    objc_msgSend(v33, sel__continuousCornerRadius);
    v35 = v34;
    v36 = objc_msgSend(v33, sel_clipsToBounds);

    v37 = v11;
    if (v57)
    {
      v38 = v33;
      objc_msgSend(v38, sel__setContinuousCornerRadius_, 10.0);
      objc_msgSend(v38, sel_setClipsToBounds_, 1);

    }
  }
  else
  {
    v37 = v11;
    v35 = 0;
    v36 = 2;
  }
  v39 = v10;
  objc_msgSend(v20, sel__continuousCornerRadius);
  v41 = v40;
  v42 = objc_msgSend(v20, sel_clipsToBounds);
  if (*(_BYTE *)(v2 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_roundDetailsViewCorners) == 1)
  {
    objc_msgSend(v20, sel__setContinuousCornerRadius_, 10.0);
    objc_msgSend(v20, sel_setClipsToBounds_, 1);
  }
  v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBDB00]), sel_init);
  v44 = objc_msgSend((id)objc_opt_self(), sel_blackColor);
  objc_msgSend(v43, sel_setBackgroundColor_, v44);

  OUTLINED_FUNCTION_0_13(v45, sel_bounds);
  objc_msgSend(v43, sel_setFrame_);
  objc_msgSend(v4, sel_insertSubview_belowSubview_, v43, v20);
  if (v62)
    v46 = 0.5;
  else
    v46 = 0.0;
  if (v62)
    v47 = 0.0;
  else
    v47 = 0.5;
  objc_msgSend(v43, sel_setAlpha_, v46);
  v48 = swift_allocObject();
  *(_QWORD *)(v48 + 16) = v24;
  *(double *)(v48 + 24) = v63;
  *(double *)(v48 + 32) = v31;
  *(double *)(v48 + 40) = v32;
  *(double *)(v48 + 48) = v39;
  *(double *)(v48 + 56) = v37;
  *(double *)(v48 + 64) = v12;
  *(_QWORD *)(v48 + 72) = v43;
  *(double *)(v48 + 80) = v47;
  *(_QWORD *)(v48 + 88) = v20;
  *(CGFloat *)(v48 + 96) = x;
  *(CGFloat *)(v48 + 104) = y;
  *(CGFloat *)(v48 + 112) = width;
  *(CGFloat *)(v48 + 120) = v58;
  v49 = swift_allocObject();
  *(_QWORD *)(v49 + 16) = v43;
  *(_QWORD *)(v49 + 24) = v35;
  *(_BYTE *)(v49 + 32) = v36;
  *(_QWORD *)(v49 + 40) = v24;
  *(_QWORD *)(v49 + 48) = v20;
  *(_QWORD *)(v49 + 56) = v41;
  *(_BYTE *)(v49 + 64) = v42;
  *(_QWORD *)(v49 + 72) = a1;
  v50 = v24;
  v51 = v43;
  v52 = v20;
  v53 = v50;
  v54 = v51;
  v55 = v52;
  v56 = swift_unknownObjectRetain();
  sub_244339B3C(v56, (uint64_t)sub_24433995C, v48, sub_244339ACC);

  swift_release();
  swift_release();

}

id sub_24433987C(void *a1, _OWORD *a2, void *a3, void *a4, double a5, double a6, double a7, double a8, double a9)
{
  __int128 v16;
  _OWORD v18[3];

  v16 = a2[1];
  v18[0] = *a2;
  v18[1] = v16;
  v18[2] = a2[2];
  objc_msgSend(a1, sel_setTransform_, v18);
  objc_msgSend(a3, sel_setAlpha_, a5);
  return objc_msgSend(a4, sel_setFrame_, a6, a7, a8, a9);
}

uint64_t sub_244339928()
{
  id *v0;

  return swift_deallocObject();
}

id sub_24433995C()
{
  uint64_t v0;

  return sub_24433987C(*(void **)(v0 + 16), (_OWORD *)(v0 + 24), *(void **)(v0 + 72), *(void **)(v0 + 88), *(double *)(v0 + 80), *(double *)(v0 + 96), *(double *)(v0 + 104), *(double *)(v0 + 112), *(double *)(v0 + 120));
}

id sub_24433997C(int a1, id a2, double a3, uint64_t a4, unsigned __int8 a5, void *a6, void *a7, char a8, void *a9)
{
  int v15;
  _QWORD v17[6];

  v15 = a5;
  objc_msgSend(a2, sel_removeFromSuperview);
  if (v15 == 2)
  {
    if (!a6)
      goto LABEL_7;
    goto LABEL_6;
  }
  if (a6)
  {
    objc_msgSend(a6, sel__setContinuousCornerRadius_, *(double *)&a4);
    objc_msgSend(a6, sel_setClipsToBounds_, v15 & 1);
LABEL_6:
    v17[0] = 0x3FF0000000000000;
    v17[1] = 0;
    v17[2] = 0;
    v17[3] = 0x3FF0000000000000;
    v17[4] = 0;
    v17[5] = 0;
    objc_msgSend(a6, sel_setTransform_, v17);
  }
LABEL_7:
  objc_msgSend(a7, sel__setContinuousCornerRadius_, a3);
  objc_msgSend(a7, sel_setClipsToBounds_, a8 & 1);
  return objc_msgSend(a9, sel_completeTransition_, objc_msgSend(a9, sel_transitionWasCancelled) ^ 1);
}

uint64_t sub_244339A90()
{
  id *v0;

  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_244339ACC(int a1)
{
  uint64_t v1;

  return sub_24433997C(a1, *(id *)(v1 + 16), *(double *)(v1 + 56), *(_QWORD *)(v1 + 24), *(_BYTE *)(v1 + 32), *(void **)(v1 + 40), *(void **)(v1 + 48), *(_BYTE *)(v1 + 64), *(void **)(v1 + 72));
}

void sub_244339B3C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v4;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (*(_BYTE *)(v4 + OBJC_IVAR____TtC18PhotosUIFoundation21PhotosSlideTransition_useLinearAnimation) == 1)
  {
    v6 = MEMORY[0x24BDAC760];
    v7 = OUTLINED_FUNCTION_2_5((uint64_t)sub_244321468, MEMORY[0x24BDAC760], 1107296256, v8, v10);
    swift_retain();
    swift_release();
    if (a4)
    {
      a4 = OUTLINED_FUNCTION_2_5((uint64_t)sub_244338C2C, v6, 1107296256, v9, v11);
      swift_retain();
      swift_release();
    }
    objc_msgSend((id)objc_opt_self(), sel_animateWithDuration_delay_options_animations_completion_, 196608, v7, a4, 0.4, 0.0);
    _Block_release(a4);
    _Block_release(v7);
  }
  else
  {
    sub_244325AB0();
    sub_24437A7F0();
  }
}

id PhotosSlideTransition.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void PhotosSlideTransition.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id PhotosSlideTransition.__deallocating_deinit(uint64_t a1)
{
  return sub_24433A0C0(a1, type metadata accessor for PhotosSlideTransition);
}

unint64_t sub_244339D00()
{
  unint64_t result;

  result = qword_257358170;
  if (!qword_257358170)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosSlideTransition.Direction, &type metadata for PhotosSlideTransition.Direction);
    atomic_store(result, (unint64_t *)&qword_257358170);
  }
  return result;
}

uint64_t _s14AssociatedDataCMa()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhotosSlideTransition()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosSlideTransition.__allocating_init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PhotosSlideTransition.transitionDuration(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of PhotosSlideTransition.animateTransition(using:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t getEnumTagSinglePayload for PhotosSlideTransition.Direction(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFF)
  {
    if (a2 + 1 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 1) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 2;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v5 = v6 - 2;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosSlideTransition.Direction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_244339E7C + 4 * byte_24438A6A5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_244339EB0 + 4 * byte_24438A6A0[v4]))();
}

uint64_t sub_244339EB0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244339EB8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244339EC0);
  return result;
}

uint64_t sub_244339ECC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244339ED4);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_244339ED8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244339EE0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_244339EEC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosSlideTransition.Direction()
{
  return &type metadata for PhotosSlideTransition.Direction;
}

id sub_244339F08()
{
  id v0;
  char v2;

  v2 = 0;
  v0 = objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransition());
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(&v2, 0, 1, 0);
}

id sub_244339FC8()
{
  id v0;
  char v2;

  v2 = 1;
  v0 = objc_allocWithZone((Class)type metadata accessor for PhotosSlideTransition());
  return PhotosSlideTransition.init(_:useLinearAnimation:animateBackground:roundDetailsViewCorners:)(&v2, 0, 1, 0);
}

id sub_24433A05C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PhotosSlideTransitionTransitioningDelegate();
  return objc_msgSendSuper2(&v2, sel_init);
}

id sub_24433A0B0()
{
  return sub_24433A0C0(0, type metadata accessor for PhotosSlideTransitionTransitioningDelegate);
}

id sub_24433A0C0(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

uint64_t type metadata accessor for PhotosSlideTransitionTransitioningDelegate()
{
  return objc_opt_self();
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_24433A128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257355AF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

id OUTLINED_FUNCTION_1_16(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

id OUTLINED_FUNCTION_2_14(uint64_t a1, const char *a2)
{
  void *v2;
  uint64_t v3;

  return objc_msgSend(v2, a2, v3);
}

id OUTLINED_FUNCTION_4_11(uint64_t a1, const char *a2)
{
  void *v2;

  return objc_msgSend(v2, a2);
}

uint64_t PhotosWeakSet.init()@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v5;
  uint64_t result;

  v5 = type metadata accessor for PhotosWeakObjectReference(0, a1, a2, a3);
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, v5);
  result = sub_24437A3A0();
  *a4 = result;
  return result;
}

uint64_t PhotosWeakSet.insert(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  _BYTE v9[16];

  sub_24433A284(a2);
  v3 = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  PhotosWeakObjectReference.init(_:)((uint64_t)&v8);
  v6 = type metadata accessor for PhotosWeakObjectReference(255, v3, v4, v5);
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, v6);
  sub_24437A688();
  sub_24437A64C();
  return (*(uint64_t (**)(_BYTE *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v9, v6);
}

uint64_t sub_24433A284(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  int64_t v12;
  unint64_t v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _BYTE v23[24];
  _BYTE v24[16];
  _BYTE v25[16];

  v3 = *v1;
  v4 = *v1 + 56;
  v5 = 1 << *(_BYTE *)(*v1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(*v1 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  if (!v7)
    goto LABEL_5;
LABEL_4:
  v13 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  for (i = v13 | (v12 << 6); ; i = __clz(__rbit64(v16)) + (v12 << 6))
  {
    v18 = *(_QWORD *)(v3 + 48) + 16 * i;
    v19 = type metadata accessor for PhotosWeakObjectReference(0, *(_QWORD *)(a1 + 16), v10, v11);
    v20 = *(_QWORD *)(v19 - 8);
    (*(void (**)(_BYTE *, uint64_t, uint64_t))(v20 + 16))(v25, v18, v19);
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v20 + 32))(v24, v25, v19);
    v21 = MEMORY[0x24950D424](v24);
    swift_unknownObjectRelease();
    if (!v21)
    {
      MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, v19);
      sub_24437A688();
      sub_24437A658();
      v22 = sub_24437A808();
      (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v22 - 8) + 8))(v23, v22);
    }
    result = (*(uint64_t (**)(_BYTE *, uint64_t))(v20 + 8))(v24, v19);
    if (v7)
      goto LABEL_4;
LABEL_5:
    v15 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
      __break(1u);
      goto LABEL_23;
    }
    if (v15 >= v8)
      return swift_release();
    v16 = *(_QWORD *)(v4 + 8 * v15);
    ++v12;
    if (!v16)
    {
      v12 = v15 + 1;
      if (v15 + 1 >= v8)
        return swift_release();
      v16 = *(_QWORD *)(v4 + 8 * v12);
      if (!v16)
        break;
    }
LABEL_16:
    v7 = (v16 - 1) & v16;
  }
  v17 = v15 + 2;
  if (v17 >= v8)
    return swift_release();
  v16 = *(_QWORD *)(v4 + 8 * v17);
  if (v16)
  {
    v12 = v17;
    goto LABEL_16;
  }
  while (1)
  {
    v12 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v12 >= v8)
      return swift_release();
    v16 = *(_QWORD *)(v4 + 8 * v12);
    ++v17;
    if (v16)
      goto LABEL_16;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t PhotosWeakSet.remove(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE v10[16];
  _BYTE v11[24];

  swift_unknownObjectRetain();
  v3 = PhotosWeakObjectReference.init(_:)((uint64_t)v10);
  v7 = OUTLINED_FUNCTION_0_7(v3, v4, v5, v6);
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, v7);
  sub_24437A688();
  sub_24437A658();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v10, v7);
  v8 = sub_24437A808();
  (*(void (**)(_BYTE *, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v11, v8);
  return sub_24433A284(a2);
}

uint64_t PhotosWeakSet.objects.getter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = OUTLINED_FUNCTION_0_7(a1, a2, a3, a4);
  swift_bridgeObjectRetain();
  MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosWeakObjectReference<A>, v4);
  v5 = sub_24437A688();
  MEMORY[0x24950D28C](MEMORY[0x24BEE1718], v5);
  v6 = sub_24437A4D8();
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t type metadata accessor for PhotosWeakSet(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosWeakSet);
}

uint64_t static PhotosCollectionTitleDisplayIntent.== infix(_:_:)()
{
  return 1;
}

uint64_t PhotosCollectionTitleDisplayIntent.hash(into:)()
{
  return sub_24437AB08();
}

uint64_t PhotosCollectionTitleDisplayIntent.hashValue.getter()
{
  sub_24437AAFC();
  sub_24437AB08();
  return sub_24437AB14();
}

uint64_t sub_24433A64C()
{
  return PhotosCollectionTitleDisplayIntent.hashValue.getter();
}

uint64_t sub_24433A660()
{
  return PhotosCollectionTitleDisplayIntent.hash(into:)();
}

uint64_t sub_24433A674()
{
  sub_24437AAFC();
  sub_24437AB08();
  return sub_24437AB14();
}

uint64_t transform(title:subtitle:displayIntent:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v6 = objc_msgSend((id)objc_opt_self(), sel_defaultHelper);
  if (!a2)
  {
    if (a4)
      goto LABEL_3;
LABEL_5:

    return a2;
  }
  v7 = (void *)sub_24437A460();
  v8 = objc_msgSend(v6, sel_displayableTextForTitle_intent_, v7, 1);

  a2 = sub_24437A46C();
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)sub_24437A460();
  v10 = objc_msgSend(v6, sel_displayableTextForTitle_intent_, v9, 1);

  sub_24437A46C();
  return a2;
}

unint64_t sub_24433A7D8()
{
  unint64_t result;

  result = qword_257358248[0];
  if (!qword_257358248[0])
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosCollectionTitleDisplayIntent, &type metadata for PhotosCollectionTitleDisplayIntent);
    atomic_store(result, qword_257358248);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PhotosCollectionTitleDisplayIntent(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for PhotosCollectionTitleDisplayIntent(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_24433A8A8 + 4 * byte_24438A810[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_24433A8C8 + 4 * byte_24438A815[v4]))();
}

_BYTE *sub_24433A8A8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_24433A8C8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24433A8D0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24433A8D8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_24433A8E0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_24433A8E8(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_24433A8F4()
{
  return 0;
}

ValueMetadata *type metadata accessor for PhotosCollectionTitleDisplayIntent()
{
  return &type metadata for PhotosCollectionTitleDisplayIntent;
}

void PhotosStaticCollectionTitleModel.init(title:subtitle:symbolName:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;

  OUTLINED_FUNCTION_19_1();
  sub_24437A274();
  v13 = (int *)type metadata accessor for PhotosStaticCollectionTitleModel(0);
  v14 = (_QWORD *)(v9 + v13[5]);
  *v14 = v8;
  v14[1] = v7;
  v15 = (_QWORD *)(v9 + v13[6]);
  *v15 = v6;
  v15[1] = a4;
  v16 = (_QWORD *)(v9 + v13[7]);
  *v16 = a5;
  v16[1] = a6;
  OUTLINED_FUNCTION_14_1();
}

uint64_t type metadata accessor for PhotosStaticCollectionTitleModel(uint64_t a1)
{
  return sub_24433B8D8(a1, (uint64_t *)&unk_2573569C0);
}

void static PhotosStaticCollectionTitleModel.empty.getter(uint64_t a1@<X8>)
{
  int *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  sub_24437A274();
  v2 = (int *)type metadata accessor for PhotosStaticCollectionTitleModel(0);
  v3 = (_QWORD *)(a1 + v2[5]);
  *v3 = 0;
  v3[1] = 0xE000000000000000;
  v4 = (_QWORD *)(a1 + v2[6]);
  *v4 = 0;
  v4[1] = 0;
  v5 = (_QWORD *)(a1 + v2[7]);
  *v5 = 0;
  v5[1] = 0;
  OUTLINED_FUNCTION_2();
}

uint64_t PhotosStaticCollectionTitleModel.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_8();
  v0 = OUTLINED_FUNCTION_9_4();
  return OUTLINED_FUNCTION_19(v0, v1, v2, v3);
}

void PhotosStaticCollectionTitleModel.title.getter()
{
  type metadata accessor for PhotosStaticCollectionTitleModel(0);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_2();
}

void PhotosStaticCollectionTitleModel.subtitle.getter()
{
  type metadata accessor for PhotosStaticCollectionTitleModel(0);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_2();
}

void PhotosStaticCollectionTitleModel.symbolName.getter()
{
  type metadata accessor for PhotosStaticCollectionTitleModel(0);
  OUTLINED_FUNCTION_1_17();
  OUTLINED_FUNCTION_9_4();
  OUTLINED_FUNCTION_2();
}

void PhotosObservableCollectionTitleModel.__allocating_init(title:subtitle:symbolName:)()
{
  OUTLINED_FUNCTION_12_2();
  swift_allocObject();
  PhotosObservableCollectionTitleModel.init(title:subtitle:symbolName:)();
  OUTLINED_FUNCTION_14_1();
}

void PhotosObservableCollectionTitleModel.init(title:subtitle:symbolName:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;

  OUTLINED_FUNCTION_12_2();
  sub_24437A274();
  v3 = (_QWORD *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___subtitle);
  *v3 = 0;
  v3[1] = 0;
  v4 = (_QWORD *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___symbolName);
  *v4 = 0;
  v4[1] = 0;
  sub_24437A2EC();
  v5 = (_QWORD *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___title);
  *v5 = v2;
  v5[1] = v1;
  sub_24433ABFC();
  sub_24433ABFC();
  OUTLINED_FUNCTION_14_1();
}

uint64_t sub_24433AB90()
{
  swift_getKeyPath();
  sub_24433B0E0();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24433ABFC()
{
  swift_getKeyPath();
  sub_24433B0E0();
  swift_release();
  return OUTLINED_FUNCTION_5_5();
}

uint64_t PhotosObservableCollectionTitleModel.id.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(void);

  OUTLINED_FUNCTION_8_8();
  v0 = OUTLINED_FUNCTION_9_4();
  return OUTLINED_FUNCTION_19(v0, v1, v2, v3);
}

void PhotosObservableCollectionTitleModel.title.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v5;

  if (_s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSvg_0() == a1 && v3 == a2)
  {
    swift_bridgeObjectRelease_n();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    v5 = sub_24437AA6C();
    OUTLINED_FUNCTION_5_5();
    if ((v5 & 1) != 0)
      swift_bridgeObjectRelease();
    else
      sub_24433AB90();
  }
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSvg_0()
{
  uint64_t v0;
  uint64_t v1;

  swift_getKeyPath();
  sub_24433B9FC();
  sub_24437A2C8();
  swift_release();
  v1 = *(_QWORD *)(v0 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___title);
  swift_bridgeObjectRetain();
  return v1;
}

void PhotosObservableCollectionTitleModel.title.modify(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSvg_0();
  a1[1] = v3;
  OUTLINED_FUNCTION_2();
}

void sub_24433ADF8(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_4_12();
  }
  else
  {
    OUTLINED_FUNCTION_18_1();
    OUTLINED_FUNCTION_31();
  }
}

void PhotosObservableCollectionTitleModel.subtitle.setter(uint64_t a1, uint64_t a2)
{
  sub_24433AEE8(a1, a2, _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0);
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0()
{
  return sub_24433AFA8();
}

void PhotosObservableCollectionTitleModel.subtitle.modify(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0();
  a1[1] = v3;
  OUTLINED_FUNCTION_2();
}

void sub_24433AE9C(uint64_t a1, char a2)
{
  sub_24433B058(a1, a2);
}

void sub_24433AEAC()
{
  OUTLINED_FUNCTION_16_1();
  OUTLINED_FUNCTION_3_13();
  OUTLINED_FUNCTION_31();
}

void PhotosObservableCollectionTitleModel.symbolName.setter(uint64_t a1, uint64_t a2)
{
  sub_24433AEE8(a1, a2, _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0);
}

void sub_24433AEE8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5;
  uint64_t v6;
  char v8;

  v5 = a3();
  if (!a2)
  {
    if (!v6)
    {
LABEL_12:
      OUTLINED_FUNCTION_14_1();
      return;
    }
    swift_bridgeObjectRelease();
LABEL_11:
    OUTLINED_FUNCTION_10_6();
    goto LABEL_12;
  }
  if (!v6)
    goto LABEL_11;
  if (v5 != a1 || v6 != a2)
  {
    v8 = sub_24437AA6C();
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
      goto LABEL_14;
    goto LABEL_11;
  }
  OUTLINED_FUNCTION_5_5();
LABEL_14:
  swift_bridgeObjectRelease();
}

uint64_t _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0()
{
  return sub_24433AFA8();
}

uint64_t sub_24433AFA8()
{
  swift_getKeyPath();
  sub_24433B9FC();
  sub_24437A2C8();
  swift_release();
  OUTLINED_FUNCTION_1_17();
  return OUTLINED_FUNCTION_9_4();
}

void PhotosObservableCollectionTitleModel.symbolName.modify(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;

  a1[2] = v1;
  *a1 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0();
  a1[1] = v3;
  OUTLINED_FUNCTION_2();
}

void sub_24433B04C(uint64_t a1, char a2)
{
  sub_24433B058(a1, a2);
}

void sub_24433B058(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    OUTLINED_FUNCTION_3_13();
    OUTLINED_FUNCTION_4_12();
  }
  else
  {
    OUTLINED_FUNCTION_3_13();
    OUTLINED_FUNCTION_31();
  }
}

uint64_t sub_24433B09C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3 = (_QWORD *)(a1 + OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___title);
  *v3 = a2;
  v3[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_24433B0E0()
{
  OUTLINED_FUNCTION_19_1();
  sub_24433B9FC();
  return sub_24437A2BC();
}

void sub_24433B15C()
{
  swift_bridgeObjectRetain();
  OUTLINED_FUNCTION_10_6();
  OUTLINED_FUNCTION_0_3();
}

uint64_t sub_24433B194(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  _QWORD *v4;

  v4 = (_QWORD *)(a1 + *a4);
  *v4 = a2;
  v4[1] = a3;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t PhotosObservableCollectionTitleModel.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = OUTLINED_FUNCTION_8_8();
  OUTLINED_FUNCTION_15(v1);
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_6_7();
  OUTLINED_FUNCTION_6_7();
  v2 = sub_24437A2F8();
  OUTLINED_FUNCTION_15(v2);
  return v0;
}

uint64_t PhotosObservableCollectionTitleModel.__deallocating_deinit()
{
  PhotosObservableCollectionTitleModel.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_24433B264()
{
  return PhotosObservableCollectionTitleModel.title.getter();
}

uint64_t sub_24433B284()
{
  return PhotosObservableCollectionTitleModel.subtitle.getter();
}

uint64_t sub_24433B2A4()
{
  return PhotosObservableCollectionTitleModel.symbolName.getter();
}

void sub_24433B2C4()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = PhotosObservableCollectionTitleModel.title.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433B2E4()
{
  sub_24433AEAC();
}

void sub_24433B300()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = PhotosObservableCollectionTitleModel.subtitle.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433B320()
{
  sub_24433AEAC();
}

void sub_24433B33C()
{
  _QWORD *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = PhotosObservableCollectionTitleModel.symbolName.getter();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433B35C()
{
  sub_24433AEAC();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.title.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.subtitle.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PhotosCollectionTitleModel.symbolName.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t *initializeBufferWithCopyOfBuffer for PhotosStaticCollectionTitleModel(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;

  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v20 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v20 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_24437A280();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    v8 = a3[5];
    v9 = a3[6];
    v10 = (uint64_t *)((char *)a1 + v8);
    v11 = (uint64_t *)((char *)a2 + v8);
    v12 = v11[1];
    *v10 = *v11;
    v10[1] = v12;
    v13 = (uint64_t *)((char *)a1 + v9);
    v14 = (uint64_t *)((char *)a2 + v9);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = a3[7];
    v17 = (uint64_t *)((char *)a1 + v16);
    v18 = (uint64_t *)((char *)a2 + v16);
    v19 = v18[1];
    *v17 = *v18;
    v17[1] = v19;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for PhotosStaticCollectionTitleModel(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_24437A280();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;

  v6 = sub_24437A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  v7 = a3[5];
  v8 = a3[6];
  v9 = (_QWORD *)(a1 + v7);
  v10 = (_QWORD *)(a2 + v7);
  v11 = v10[1];
  *v9 = *v10;
  v9[1] = v11;
  v12 = (_QWORD *)(a1 + v8);
  v13 = (_QWORD *)(a2 + v8);
  v14 = v13[1];
  *v12 = *v13;
  v12[1] = v14;
  v15 = a3[7];
  v16 = (_QWORD *)(a1 + v15);
  v17 = (_QWORD *)(a2 + v15);
  v18 = v17[1];
  *v16 = *v17;
  v16[1] = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  _QWORD *v15;

  v6 = sub_24437A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 24))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (_QWORD *)(a2 + v7);
  *v8 = *v9;
  v8[1] = v9[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = a3[6];
  v11 = (_QWORD *)(a1 + v10);
  v12 = (_QWORD *)(a2 + v10);
  *v11 = *v12;
  v11[1] = v12[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v13 = a3[7];
  v14 = (_QWORD *)(a1 + v13);
  v15 = (_QWORD *)(a2 + v13);
  *v14 = *v15;
  v14[1] = v15[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_24437A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a1, a2, v6);
  v7 = a3[6];
  *(_OWORD *)(a1 + a3[5]) = *(_OWORD *)(a2 + a3[5]);
  *(_OWORD *)(a1 + v7) = *(_OWORD *)(a2 + v7);
  *(_OWORD *)(a1 + a3[7]) = *(_OWORD *)(a2 + a3[7]);
  return a1;
}

uint64_t assignWithTake for PhotosStaticCollectionTitleModel(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v6 = sub_24437A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 40))(a1, a2, v6);
  v7 = a3[5];
  v8 = (_QWORD *)(a1 + v7);
  v9 = (uint64_t *)(a2 + v7);
  v11 = *v9;
  v10 = v9[1];
  *v8 = v11;
  v8[1] = v10;
  swift_bridgeObjectRelease();
  v12 = a3[6];
  v13 = (_QWORD *)(a1 + v12);
  v14 = (uint64_t *)(a2 + v12);
  v16 = *v14;
  v15 = v14[1];
  *v13 = v16;
  v13[1] = v15;
  swift_bridgeObjectRelease();
  v17 = a3[7];
  v18 = (_QWORD *)(a1 + v17);
  v19 = (uint64_t *)(a2 + v17);
  v21 = *v19;
  v20 = v19[1];
  *v18 = v21;
  v18[1] = v20;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PhotosStaticCollectionTitleModel()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_24433B750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v8;

  v6 = OUTLINED_FUNCTION_8_8();
  if (*(_DWORD *)(*(_QWORD *)(v6 - 8) + 84) == (_DWORD)a2)
    return __swift_getEnumTagSinglePayload(a1, a2, v6);
  v8 = *(_QWORD *)(a1 + *(int *)(a3 + 20) + 8);
  if (v8 >= 0xFFFFFFFF)
    LODWORD(v8) = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosStaticCollectionTitleModel()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

void sub_24433B7D4(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;

  v8 = OUTLINED_FUNCTION_8_8();
  if (*(_DWORD *)(*(_QWORD *)(v8 - 8) + 84) == a3)
  {
    __swift_storeEnumTagSinglePayload(a1, a2, a2, v8);
  }
  else
  {
    *(_QWORD *)(a1 + *(int *)(a4 + 20) + 8) = (a2 - 1);
    OUTLINED_FUNCTION_31();
  }
}

uint64_t sub_24433B840()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A280();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t sub_24433B8BC()
{
  return type metadata accessor for PhotosObservableCollectionTitleModel(0);
}

uint64_t type metadata accessor for PhotosObservableCollectionTitleModel(uint64_t a1)
{
  return sub_24433B8D8(a1, (uint64_t *)&unk_257356B80);
}

uint64_t sub_24433B8D8(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_24433B908()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_24437A280();
  if (v1 <= 0x3F)
  {
    result = sub_24437A2F8();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

uint64_t method lookup function for PhotosObservableCollectionTitleModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosObservableCollectionTitleModel.__allocating_init(title:subtitle:symbolName:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

void sub_24433B9B8()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC10symbolNameSSSgvg_0();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433B9D8()
{
  sub_24433B15C();
}

unint64_t sub_24433B9FC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_257356B78;
  if (!qword_257356B78)
  {
    v1 = type metadata accessor for PhotosObservableCollectionTitleModel(255);
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosObservableCollectionTitleModel, v1);
    atomic_store(result, (unint64_t *)&qword_257356B78);
  }
  return result;
}

void sub_24433BA3C()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC8subtitleSSSgvg_0();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433BA5C()
{
  sub_24433B15C();
}

void sub_24433BA80()
{
  uint64_t *v0;
  uint64_t v1;

  OUTLINED_FUNCTION_13_2();
  *v0 = _s18PhotosUIFoundation0A30ObservableCollectionTitleModelC5titleSSvg_0();
  v0[1] = v1;
  OUTLINED_FUNCTION_2();
}

void sub_24433BAA0()
{
  sub_24433AEAC();
}

uint64_t sub_24433BABC()
{
  uint64_t *v0;

  return sub_24433B09C(v0[2], v0[3], v0[4]);
}

uint64_t sub_24433BAD8()
{
  uint64_t *v0;

  return sub_24433B194(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___symbolName);
}

uint64_t sub_24433BAFC()
{
  uint64_t *v0;

  return sub_24433B194(v0[2], v0[3], v0[4], &OBJC_IVAR____TtC18PhotosUIFoundation36PhotosObservableCollectionTitleModel___subtitle);
}

uint64_t OUTLINED_FUNCTION_1_17()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_3_13()
{
  uint64_t (*v0)(uint64_t, uint64_t);
  uint64_t v1;
  uint64_t v2;

  return v0(v2, v1);
}

uint64_t OUTLINED_FUNCTION_4_12()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_6_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_8_8()
{
  return sub_24437A280();
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_10_6()
{
  return sub_24433ABFC();
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  return swift_bridgeObjectRetain();
}

void OUTLINED_FUNCTION_18_1()
{
  uint64_t v0;
  uint64_t v1;

  PhotosObservableCollectionTitleModel.title.setter(v1, v0);
}

id MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  objc_class *v11;
  char v17;
  id v18;

  v17 = a7 & 1;
  v18 = objc_allocWithZone(v11);
  return MenuGroupAction.init(group:title:systemImageName:role:state:handler:)(a1, a2, a3, a4, a5, a6, v17, a8, a9 & 1, a10, a11);
}

id MenuGroupAction.init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7, uint64_t a8, char a9, uint64_t a10, uint64_t a11)
{
  _QWORD *v11;
  _QWORD *v15;
  _QWORD *v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  objc_class *v30;
  id v31;
  objc_super v38;

  v15 = (_QWORD *)MEMORY[0x24BEE4EA0];
  v16 = (_QWORD *)(*MEMORY[0x24BEE4EA0] & *v11);
  v17 = (char *)v11 + v16[12];
  v18 = v16[10];
  v19 = sub_24437A808();
  v20 = *(_QWORD *)(v19 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v20 + 16))(v17, a1, v19);
  OUTLINED_FUNCTION_1_18();
  v22 = (_QWORD *)((char *)v11 + *(_QWORD *)(v21 + 104));
  *v22 = a2;
  v22[1] = a3;
  OUTLINED_FUNCTION_1_18();
  v24 = (_QWORD *)((char *)v11 + *(_QWORD *)(v23 + 112));
  *v24 = a4;
  v24[1] = a5;
  v25 = a6;
  if ((a7 & 1) != 0)
    v25 = 0;
  *(_QWORD *)((char *)v11 + *(_QWORD *)((*v15 & *v11) + 0x78)) = v25;
  v26 = a8;
  if ((a9 & 1) != 0)
    v26 = 0;
  *(_QWORD *)((char *)v11 + *(_QWORD *)((*v15 & *v11) + 0x80)) = v26;
  OUTLINED_FUNCTION_1_18();
  v28 = (_QWORD *)((char *)v11 + *(_QWORD *)(v27 + 136));
  *v28 = a10;
  v28[1] = a11;
  v30 = (objc_class *)type metadata accessor for MenuGroupAction(0, v18, v16[11], v29);
  v38.receiver = v11;
  v38.super_class = v30;
  v31 = objc_msgSendSuper2(&v38, sel_init);
  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(a1, v19);
  return v31;
}

uint64_t type metadata accessor for MenuGroupAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MenuGroupAction);
}

id MenuGroupAction.__allocating_init<A>(group:menuAction:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t (*v11)(char *, uint64_t, uint64_t);
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  id v23;
  _QWORD *v24;
  uint64_t v25;
  id v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  v30 = a3;
  v6 = *(_QWORD *)(v3 + 80);
  v7 = sub_24437A808();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v28 - v9;
  v11 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16);
  v31 = a1;
  v12 = v11(v10, a1, v7);
  v13 = OUTLINED_FUNCTION_1_16(v12, sel_title);
  v14 = sub_24437A46C();
  v28 = v15;
  v29 = v14;

  v17 = OUTLINED_FUNCTION_1_16(v16, sel_systemImageName);
  if (v17)
  {
    v18 = v17;
    v19 = sub_24437A46C();
    v21 = v20;

  }
  else
  {
    v19 = 0;
    v21 = 0;
  }
  v22 = OUTLINED_FUNCTION_1_16((uint64_t)v17, sel_role);
  v23 = OUTLINED_FUNCTION_1_16((uint64_t)v22, sel_state);
  v24 = (_QWORD *)swift_allocObject();
  v25 = v30;
  v24[2] = v6;
  v24[3] = v25;
  v24[4] = *(_QWORD *)(v3 + 88);
  v24[5] = a2;
  v26 = MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)((uint64_t)v10, v29, v28, v19, v21, (uint64_t)v22, 0, (uint64_t)v23, 0, (uint64_t)sub_24433BFC0, (uint64_t)v24);
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v31, v7);
  return v26;
}

uint64_t sub_24433BF9C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

id sub_24433BFC0()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 40), sel_performAction);
}

uint64_t MenuGroupAction.group.getter@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  char *v3;
  uint64_t v4;

  v3 = (char *)v1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v1) + 0x60);
  v4 = OUTLINED_FUNCTION_4_13();
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id sub_24433C020()
{
  void *v0;

  MenuGroupAction.title.getter();
  v0 = (void *)sub_24437A460();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t MenuGroupAction.title.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_15();
  return v0;
}

id sub_24433C094()
{
  return 0;
}

id sub_24433C09C()
{
  uint64_t v0;
  void *v1;

  MenuGroupAction.systemImageName.getter();
  if (v0)
  {
    v1 = (void *)sub_24437A460();
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = 0;
  }
  return v1;
}

uint64_t MenuGroupAction.systemImageName.getter()
{
  uint64_t v0;

  OUTLINED_FUNCTION_2_15();
  return v0;
}

uint64_t sub_24433C11C()
{
  return MenuGroupAction.role.getter();
}

uint64_t MenuGroupAction.role.getter()
{
  _QWORD *v0;

  return *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x78));
}

uint64_t sub_24433C15C()
{
  return MenuGroupAction.state.getter();
}

uint64_t MenuGroupAction.state.getter()
{
  _QWORD *v0;

  return *(_QWORD *)((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x80));
}

id sub_24433C19C()
{
  return 0;
}

uint64_t sub_24433C1A4()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((char *)v0 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v0) + 0x88)))();
}

void sub_24433C1E0(void *a1)
{
  id v1;

  v1 = a1;
  sub_24433C1A4();

}

id MenuGroupAction.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void MenuGroupAction.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_24433C260()
{
  MenuGroupAction.init()();
}

id MenuGroupAction.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for MenuGroupAction(0, *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x50), *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *v4) + 0x58), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t sub_24433C2B8()
{
  uint64_t result;
  unint64_t v1;

  result = sub_24437A808();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_24433C358(_QWORD *a1)
{
  char *v1;
  uint64_t v2;

  v1 = (char *)a1 + *(_QWORD *)((*MEMORY[0x24BEE4EA0] & *a1) + 0x60);
  v2 = OUTLINED_FUNCTION_4_13();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_21();
  OUTLINED_FUNCTION_5_7();
  OUTLINED_FUNCTION_0_21();
  return swift_release();
}

uint64_t method lookup function for MenuGroupAction()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MenuGroupAction.__allocating_init(group:title:systemImageName:role:state:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 144))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of MenuGroupAction.image.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of MenuGroupAction.alternate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of MenuGroupAction.perform()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t OUTLINED_FUNCTION_2_15()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_4_13()
{
  return sub_24437A808();
}

uint64_t OUTLINED_FUNCTION_5_7()
{
  return swift_bridgeObjectRelease();
}

uint64_t PhotosItemListChangeDetailsRepository.__allocating_init(countLimit:)(uint64_t a1)
{
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_2();
  PhotosItemListChangeDetailsRepository.init(countLimit:)(a1);
  return v2;
}

uint64_t PhotosItemListChangeDetailsRepository.init(countLimit:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F18);
  v3 = OUTLINED_FUNCTION_0_2();
  *(_DWORD *)(v3 + 24) = 0;
  *(_QWORD *)(v3 + 16) = MEMORY[0x24BEE4AF8];
  *(_QWORD *)(v1 + 16) = a1;
  *(_QWORD *)(v1 + 24) = v3;
  return v1;
}

uint64_t sub_24433C520(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t inited;
  id v5;

  v1 = *a1;
  v2 = a1[1];
  v3 = (void *)a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356F30);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_24438AAE0;
  *(_QWORD *)(inited + 32) = v1;
  *(_QWORD *)(inited + 40) = v2;
  *(_QWORD *)(inited + 48) = v3;
  v5 = v3;
  sub_24433C5A0(inited);
  swift_setDeallocating();
  return sub_24433D2A4();
}

uint64_t sub_24433C5A0(uint64_t a1)
{
  uint64_t v1;
  os_unfair_lock_s *v3;

  v3 = *(os_unfair_lock_s **)(v1 + 24);
  swift_retain();
  os_unfair_lock_lock(v3 + 6);
  sub_24433C610((uint64_t)&v3[4], a1, v1);
  os_unfair_lock_unlock(v3 + 6);
  return swift_release();
}

uint64_t sub_24433C610(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  swift_bridgeObjectRetain();
  sub_24433C678(a2);
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = *(_QWORD *)(a3 + 16);
  result = v6 - v7;
  if (__OFSUB__(v6, v7))
  {
    __break(1u);
  }
  else if (result >= 1)
  {
    return sub_24433C754(result);
  }
  return result;
}

void sub_24433C678(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  int64_t v4;
  int64_t v5;
  int isUniquelyReferenced_nonNull_native;
  int64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 16);
  v5 = v4 + v2;
  if (__OFADD__(v4, v2))
  {
    __break(1u);
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v5 > *(_QWORD *)(v3 + 24) >> 1)
  {
    if (v4 <= v5)
      v8 = v4 + v2;
    else
      v8 = v4;
    sub_2443237C4(isUniquelyReferenced_nonNull_native, v8, 1, v3);
    v3 = v9;
  }
  if (!*(_QWORD *)(a1 + 16))
  {
    if (!v2)
      goto LABEL_14;
    goto LABEL_16;
  }
  v10 = *(_QWORD *)(v3 + 16);
  if ((*(_QWORD *)(v3 + 24) >> 1) - v10 < v2)
  {
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  sub_244323C58(a1 + 32, v2, v3 + 24 * v10 + 32);
  if (!v2)
  {
LABEL_14:
    swift_bridgeObjectRelease();
    *v1 = v3;
    return;
  }
  v11 = *(_QWORD *)(v3 + 16);
  v12 = __OFADD__(v11, v2);
  v13 = v11 + v2;
  if (!v12)
  {
    *(_QWORD *)(v3 + 16) = v13;
    goto LABEL_14;
  }
LABEL_18:
  __break(1u);
}

uint64_t sub_24433C754(uint64_t result)
{
  uint64_t v1;
  char v2;

  if (result)
  {
    if (result < 0)
    {
      __break(1u);
    }
    else
    {
      result = sub_24433D5AC(0, result, *(_QWORD *)(*(_QWORD *)v1 + 16));
      if ((v2 & 1) != 0)
      {
LABEL_9:
        __break(1u);
        return result;
      }
      if ((result & 0x8000000000000000) == 0)
        return sub_24433D4A8(0, result);
    }
    __break(1u);
    goto LABEL_9;
  }
  return result;
}

uint64_t PhotosItemListChangeDetailsRepository.countLimit.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

void sub_24433C7B0(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X8>)
{
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t AssociatedTypeWitness;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  uint64_t (*v26)(uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v29[2];
  id v30;

  v13 = *(_QWORD *)(a5 + 8);
  v26 = *(uint64_t (**)(uint64_t, uint64_t))(v13 + 8);
  v14 = v26(a3, v13);
  v24 = a6;
  v15 = *(_QWORD *)(a6 + 8);
  v27 = a2;
  v16 = a4;
  v25 = *(uint64_t (**)(uint64_t, uint64_t))(v15 + 8);
  v17 = v25(a4, v15);
  sub_24433C91C(v14, v17, v29);
  v19 = v29[0];
  v18 = v29[1];
  v20 = v30;
  if ((objc_msgSend(v30, sel_hasIncrementalChanges) & 1) == 0)
  {
    AssociatedTypeWitness = swift_getAssociatedTypeWitness();
    sub_24433CCC4(a1, v27, 1, AssociatedTypeWitness, a3, v16, a5, v24);
    v23 = v22;
    v19 = v26(a3, v13);
    v18 = v25(v16, v15);

    v20 = v23;
  }
  *a7 = v19;
  a7[1] = v18;
  a7[2] = (uint64_t)v20;
}

void sub_24433C91C(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  uint64_t v3;
  id v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  id v16;
  id v17;
  _QWORD *v18;

  if (a1 == a2)
  {
    v6 = objc_msgSend((id)objc_opt_self(), sel_changeDetailsWithNoChanges);
    v7 = a1;
  }
  else
  {
    v7 = a2;
    v8 = *(_QWORD *)(v3 + 24);
    swift_retain();
    os_unfair_lock_lock((os_unfair_lock_t)(v8 + 24));
    sub_24433CB04((uint64_t *)(v8 + 16), v7, a1, &v18);
    os_unfair_lock_unlock((os_unfair_lock_t)(v8 + 24));
    v9 = v18;
    swift_release();
    v10 = v9[2];
    if (v10 && (v11 = v9 + 4, v9[4] == a1) && v11[3 * v10 - 2] == v7)
    {
      v12 = (void *)v9[6];
      v13 = (void *)v11[3 * v10 - 1];
      v18 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v17 = v12;
      v14 = v13;
      sub_24437A934();
      v15 = 6;
      do
      {
        v16 = (id)v9[v15];
        sub_24437A910();
        sub_24437A940();
        sub_24437A94C();
        sub_24437A91C();
        v15 += 3;
        --v10;
      }
      while (v10);
      swift_bridgeObjectRelease();
      sub_24433D2D4();
      v6 = sub_24433CC54();

    }
    else
    {
      swift_bridgeObjectRelease();
      v6 = objc_msgSend((id)objc_opt_self(), sel_changeDetailsWithNoIncrementalChanges);
    }
  }
  *a3 = a1;
  a3[1] = v7;
  a3[2] = (uint64_t)v6;
  OUTLINED_FUNCTION_4_14();
}

uint64_t sub_24433CB04@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, _QWORD *a4@<X8>)
{
  uint64_t result;
  uint64_t v5;
  id *v7;
  _QWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  int isUniquelyReferenced_nonNull_native;
  _QWORD *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;

  result = *a1;
  v5 = *(_QWORD *)(result + 16);
  if (v5)
  {
    v17 = a4;
    result = swift_bridgeObjectRetain();
    v7 = (id *)(result + 24 * v5 + 24);
    v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v18 = a2;
    v19 = result;
    while (1)
    {
      a4 = *(_QWORD **)(result + 16);
      if (v5 > (uint64_t)a4)
        break;
      v9 = v8[2];
      v10 = a2;
      if (v9)
        v10 = v8[4];
      v11 = (uint64_t)*(v7 - 1);
      if (v11 != v10)
        goto LABEL_18;
      v12 = (uint64_t)*(v7 - 2);
      v13 = *v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      if (!isUniquelyReferenced_nonNull_native || v9 >= v8[3] >> 1)
      {
        sub_2443237C4(isUniquelyReferenced_nonNull_native, v9 + 1, 1, (uint64_t)v8);
        v8 = v15;
      }
      swift_arrayDestroy();
      v16 = v8[2];
      memmove(v8 + 7, v8 + 4, 24 * v16);
      v8[2] = v16 + 1;
      v8[4] = v12;
      v8[5] = v11;
      v8[6] = v13;
      a2 = v18;
      result = v19;
      if (v12 != a3)
      {
LABEL_18:
        v7 -= 3;
        if (--v5)
          continue;
      }
      result = swift_bridgeObjectRelease();
      a4 = v17;
      goto LABEL_13;
    }
    __break(1u);
  }
  v8 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_13:
  *a4 = v8;
  return result;
}

id sub_24433CC54()
{
  void *v0;
  id v1;

  sub_24433D2D4();
  v0 = (void *)sub_24437A52C();
  swift_bridgeObjectRelease();
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_changeDetailsByMergingChangeDetails_, v0);

  return v1;
}

void sub_24433CCC4(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t AssociatedConformanceWitness;

  swift_getAssociatedConformanceWitness();
  v12 = OUTLINED_FUNCTION_5_8();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  if (v12 == OUTLINED_FUNCTION_5_8())
  {
    v15 = (*(uint64_t (**)(uint64_t, uint64_t))(a7 + 48))(a5, a7);
    (*(void (**)(uint64_t, uint64_t))(a8 + 48))(a6, a8);
    v16 = sub_24437A988();
    swift_bridgeObjectRelease();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    sub_24433CE80(v15, v16, a3 & 1, v12, AssociatedConformanceWitness);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    OUTLINED_FUNCTION_4_14();
  }
  else
  {
    objc_msgSend((id)objc_opt_self(), sel_changeDetailsWithNoIncrementalChanges);
    OUTLINED_FUNCTION_4_14();
    v14 = v13;
  }
}

id sub_24433CE80(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if ((a3 & 1) != 0)
    swift_bridgeObjectRetain();
  else
    sub_24437A568();
  v7 = OUTLINED_FUNCTION_3_14();
  swift_bridgeObjectRelease();
  sub_24433D2D4();
  v8 = OUTLINED_FUNCTION_3_14();
  v9 = OUTLINED_FUNCTION_3_14();
  v10 = OUTLINED_FUNCTION_0_2();
  *(_QWORD *)(v10 + 16) = a4;
  *(_QWORD *)(v10 + 24) = a5;
  return sub_24433D090(v8, v9, v7, (uint64_t)sub_24433D384, v10);
}

uint64_t sub_24433CF5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t v12;
  void (*v13)(_BYTE *, uint64_t);
  _BYTE v15[32];

  v5 = *(_QWORD *)(a3 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = &v15[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = MEMORY[0x24BDAC7A8](v6);
  v11 = &v15[-v10];
  sub_244324EB8(v9, (uint64_t)v15);
  swift_dynamicCast();
  sub_244324EB8(a2, (uint64_t)v15);
  swift_dynamicCast();
  if ((sub_24437A430() & 1) != 0)
    v12 = -1;
  else
    v12 = sub_24437A424() & 1;
  v13 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v13(v8, a3);
  v13(v11, a3);
  return v12;
}

id sub_24433D090(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v13[6];

  v7 = (void *)sub_24437A52C();
  swift_bridgeObjectRelease();
  v8 = (void *)sub_24437A52C();
  swift_bridgeObjectRelease();
  v9 = (void *)sub_24437A52C();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v13[4] = a4;
    v13[5] = a5;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 1107296256;
    v13[2] = sub_24433D1C8;
    v13[3] = &block_descriptor_4;
    v10 = _Block_copy(v13);
    swift_release();
  }
  else
  {
    v10 = 0;
  }
  v11 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_changeDetailsFromArray_toArray_changedObjects_objectComparator_, v7, v8, v9, v10);
  _Block_release(v10);

  return v11;
}

uint64_t sub_24433D1C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v5)(_QWORD *, _QWORD *);
  uint64_t v6;
  _QWORD v8[4];
  _QWORD v9[4];

  v5 = *(uint64_t (**)(_QWORD *, _QWORD *))(a1 + 32);
  v9[3] = swift_getObjectType();
  v9[0] = a2;
  v8[3] = swift_getObjectType();
  v8[0] = a3;
  swift_retain();
  swift_unknownObjectRetain();
  swift_unknownObjectRetain();
  v6 = v5(v9, v8);
  swift_release();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v9);
  return v6;
}

uint64_t PhotosItemListChangeDetailsRepository.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t PhotosItemListChangeDetailsRepository.__deallocating_deinit()
{
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_24433D2A4()
{
  swift_arrayDestroy();
  return swift_deallocClassInstance();
}

unint64_t sub_24433D2D4()
{
  unint64_t result;

  result = qword_257356EF8;
  if (!qword_257356EF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257356EF8);
  }
  return result;
}

uint64_t type metadata accessor for PhotosItemListChangeDetailsRepository()
{
  return objc_opt_self();
}

uint64_t method lookup function for PhotosItemListChangeDetailsRepository()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.__allocating_init(countLimit:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.append(changeDetails:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.changeDetails<A, B>(from:to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of PhotosItemListChangeDetailsRepository.changeDetails(from:to:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 152))();
}

uint64_t sub_24433D374()
{
  return swift_deallocObject();
}

uint64_t sub_24433D384(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_24433CF5C(a1, a2, *(_QWORD *)(v2 + 16));
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

char *sub_24433D3A4(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_16();
    result = (char *)OUTLINED_FUNCTION_1_19();
    __break(1u);
  }
  else if (a3 != result || &result[16 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_22(a3, result);
  }
  return result;
}

char *sub_24433D3F8(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_16();
    result = (char *)OUTLINED_FUNCTION_1_19();
    __break(1u);
  }
  else if (a3 != result || &result[8 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_22(a3, result);
  }
  return result;
}

char *sub_24433D44C(char *result, uint64_t a2, char *a3)
{
  if (a2 < 0)
  {
    OUTLINED_FUNCTION_2_16();
    result = (char *)OUTLINED_FUNCTION_1_19();
    __break(1u);
  }
  else if (a3 != result || &result[24 * a2] <= a3)
  {
    return (char *)OUTLINED_FUNCTION_0_22(a3, result);
  }
  return result;
}

uint64_t sub_24433D4A8(uint64_t result, int64_t a2)
{
  uint64_t *v2;
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;

  if (result < 0)
  {
    __break(1u);
    goto LABEL_18;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_18:
    __break(1u);
    goto LABEL_19;
  }
  v6 = result;
  v7 = a2 - result;
  if (__OFSUB__(a2, result))
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v8 = result - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_21:
    __break(1u);
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    sub_2443237C4(isUniquelyReferenced_nonNull_native, v11, 1, v4);
    v4 = v12;
  }
  v13 = (char *)(v4 + 32 + 24 * v6);
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_16;
  v14 = *(_QWORD *)(v4 + 16);
  if (__OFSUB__(v14, a2))
    goto LABEL_22;
  result = (uint64_t)sub_24433D44C((char *)(v4 + 32 + 24 * a2), v14 - a2, v13);
  v15 = *(_QWORD *)(v4 + 16);
  v16 = __OFADD__(v15, v8);
  v17 = v15 - v7;
  if (!v16)
  {
    *(_QWORD *)(v4 + 16) = v17;
LABEL_16:
    *v2 = v4;
    return result;
  }
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_24433D5AC(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  BOOL v5;

  v3 = a3 - result;
  if (__OFSUB__(a3, result))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    return result;
  }
  if (a2 < 1)
  {
    if (v3 <= 0 && v3 > a2)
      return 0;
  }
  else if ((v3 & 0x8000000000000000) == 0 && v3 < (unint64_t)a2)
  {
    return 0;
  }
  v5 = __OFADD__(result, a2);
  result += a2;
  if (v5)
    goto LABEL_14;
  return result;
}

void *OUTLINED_FUNCTION_0_22@<X0>(void *__dst@<X2>, const void *a2@<X8>)
{
  size_t v2;

  return memmove(__dst, a2, v2);
}

uint64_t OUTLINED_FUNCTION_1_19()
{
  return sub_24437AA0C();
}

uint64_t OUTLINED_FUNCTION_3_14()
{
  return sub_24437A988();
}

uint64_t OUTLINED_FUNCTION_5_8()
{
  return swift_getAssociatedTypeWitness();
}

unint64_t PXImageDynamicRange.description.getter(uint64_t a1)
{
  uint64_t v1;
  unint64_t result;

  v1 = a1 + 1;
  result = 0x6669636570736E55;
  switch(v1)
  {
    case 0:
      return result;
    case 1:
      result = 0x647261646E617453;
      break;
    case 2:
      result = 0xD000000000000010;
      break;
    case 3:
      result = 1751607624;
      break;
    default:
      result = 16191;
      break;
  }
  return result;
}

unint64_t sub_24433D6FC()
{
  uint64_t *v0;

  return PXImageDynamicRange.description.getter(*v0);
}

void UniqueAddress.init()(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

uint64_t UniqueAddress._placeholder.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t UniqueAddress._placeholder.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*UniqueAddress._placeholder.modify())()
{
  return nullsub_1;
}

uint64_t UniqueAddress.wrappedValue.getter()
{
  uint64_t v0;

  return v0;
}

ValueMetadata *type metadata accessor for UniqueAddress()
{
  return &type metadata for UniqueAddress;
}

CGFloat CGAffineTransform.uniformlyScaled(by:)@<D0>(_OWORD *a1@<X8>, CGFloat a2@<D0>)
{
  _OWORD *v2;
  __int128 v4;
  CGFloat result;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v4 = v2[1];
  *(_OWORD *)&v9.a = *v2;
  *(_OWORD *)&v9.c = v4;
  *(_OWORD *)&v9.tx = v2[2];
  CGAffineTransformScale(&v8, &v9, a2, a2);
  result = v8.a;
  v6 = *(_OWORD *)&v8.c;
  v7 = *(_OWORD *)&v8.tx;
  *a1 = *(_OWORD *)&v8.a;
  a1[1] = v6;
  a1[2] = v7;
  return result;
}

__n128 sub_24433D798()
{
  __n128 result;

  qword_2573582D0 = 0;
  *(_QWORD *)algn_2573582D8 = 0;
  __asm { FMOV            V0.2D, #1.0 }
  xmmword_2573582E0 = (__int128)result;
  return result;
}

double static CGRect.unit.getter()
{
  if (qword_257357010 != -1)
    swift_once();
  return *(double *)&qword_2573582D0;
}

__C::CGRect __swiftcall CGRect.offsetBy(_:)(CGPoint a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __C::CGRect result;

  v5 = a1.x + v1;
  v6 = a1.y + v2;
  v7 = v3;
  v8 = v4;
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

__C::CGRect __swiftcall CGRect.insetBy(_:)(CGSize a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __C::CGRect result;

  v5 = PXEdgeInsetsInsetRect(v1, v2, v3, v4, a1.height, a1.width);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

__C::CGRect __swiftcall CGRect.insetBy(_:)(UIEdgeInsets a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  __C::CGRect result;

  v5 = PXEdgeInsetsInsetRect(v1, v2, v3, v4, a1.top, a1.left);
  result.size.height = v8;
  result.size.width = v7;
  result.origin.y = v6;
  result.origin.x = v5;
  return result;
}

double CGRect.roundedToPixel(screenScale:)(double a1, double a2, double a3, double a4, double a5)
{
  return PXRectRoundToPixel(a2, a3, a4, a5, a1);
}

void CGRect.rounded(accuracy:)(double a1, double a2, double a3, double a4, double a5)
{
  if (a1 <= 0.0)
  {
    sub_24437A9B8();
    __break(1u);
  }
  else
  {
    PXRectRoundToPixel(a2, a3, a4, a5, 1.0 / a1);
  }
}

double CGRect.scaledFromCenter(by:)()
{
  double v0;
  double v1;
  double v2;
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double MidX;
  CGRect v9;

  OUTLINED_FUNCTION_13_3();
  v2 = v1;
  v9.origin.x = v3;
  v9.origin.y = v4;
  v9.size.width = v5;
  v9.size.height = v6;
  MidX = CGRectGetMidX(v9);
  OUTLINED_FUNCTION_2_17();
  return MidX - v2 * v0 * 0.5;
}

double CGRect.center.getter()
{
  return sub_24433D9F0((uint64_t)MEMORY[0x24BDBF000], (void (*)(double))MEMORY[0x24BDBF008]);
}

__C::CGRect __swiftcall CGRect.init(center:size:)(CGPoint center, CGSize size)
{
  double v2;
  double v3;
  __C::CGRect result;

  v2 = center.x - size.width * 0.5;
  v3 = center.y - size.height * 0.5;
  result.size.height = size.height;
  result.size.width = size.width;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

double CGRect.topLeft.getter()
{
  return sub_24433D9F0((uint64_t)MEMORY[0x24BDBF010], (void (*)(double))MEMORY[0x24BDBF018]);
}

double CGRect.topRight.getter()
{
  return sub_24433D9F0((uint64_t)MEMORY[0x24BDBEFF0], (void (*)(double))MEMORY[0x24BDBF018]);
}

double CGRect.bottomLeft.getter()
{
  return sub_24433D9F0((uint64_t)MEMORY[0x24BDBF010], (void (*)(double))MEMORY[0x24BDBEFF8]);
}

double CGRect.bottomRight.getter()
{
  return sub_24433D9F0((uint64_t)MEMORY[0x24BDBEFF0], (void (*)(double))MEMORY[0x24BDBEFF8]);
}

double sub_24433D9F0(uint64_t a1, void (*a2)(double))
{
  double (*v3)(void);
  double v4;
  double v5;

  OUTLINED_FUNCTION_9_5();
  v4 = v3();
  v5 = OUTLINED_FUNCTION_10_7();
  a2(v5);
  return v4;
}

void CGRect.aspectRatio.getter(double a1, double a2, double a3, double a4)
{
  PXSizeGetAspectRatio(a3, a4);
}

void CGRect.divided(atDistance:from:spacing:)(CGRectEdge edge@<W0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>, CGFloat a8@<D5>)
{
  CGPoint origin;
  CGFloat width;
  CGFloat height;
  CGPoint v15;
  CGSize size;
  CGPoint v17;
  CGRect remainder;
  CGRect slice;
  uint64_t v20;
  CGRect v21;
  CGRect v22;

  v20 = *MEMORY[0x24BDAC8D0];
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectDivide(v21, &slice, &remainder, a3, edge);
  origin = slice.origin;
  width = slice.size.width;
  height = slice.size.height;
  v22 = remainder;
  memset(&slice, 0, sizeof(slice));
  v17 = origin;
  memset(&remainder, 0, sizeof(remainder));
  CGRectDivide(v22, &slice, &remainder, a4, edge);
  v15 = remainder.origin;
  size = remainder.size;
  *(CGPoint *)a2 = v17;
  *(CGFloat *)(a2 + 16) = width;
  *(CGFloat *)(a2 + 24) = height;
  *(CGPoint *)(a2 + 32) = v15;
  *(CGSize *)(a2 + 48) = size;
}

void CGRect.slice(length:from:)(int a1)
{
  CGRect v1;
  CGRect v2;

  switch(a1)
  {
    case 0:
    case 1:
      return;
    case 2:
      v1.origin.x = OUTLINED_FUNCTION_8_9();
      CGRectGetMaxX(v1);
      break;
    case 3:
      v2.origin.x = OUTLINED_FUNCTION_8_9();
      CGRectGetMaxY(v2);
      break;
    default:
      type metadata accessor for CGRectEdge(0);
      sub_24437AA78();
      __break(1u);
      break;
  }
}

BOOL CGRect.nilIfNull.getter()
{
  double v0;
  double v1;
  double v2;
  double v3;
  uint64_t v4;
  uint64_t v5;
  _BOOL8 result;
  double v7;
  double v8;
  double v9;
  double v10;
  CGRect v11;

  OUTLINED_FUNCTION_9_5();
  v5 = v4;
  result = CGRectIsNull(v11);
  v7 = 0.0;
  if (result)
    v8 = 0.0;
  else
    v8 = v3;
  if (result)
    v9 = 0.0;
  else
    v9 = v2;
  if (result)
    v10 = 0.0;
  else
    v10 = v1;
  *(double *)v5 = v8;
  *(double *)(v5 + 8) = v9;
  if (!result)
    v7 = v0;
  *(double *)(v5 + 16) = v10;
  *(double *)(v5 + 24) = v7;
  *(_BYTE *)(v5 + 32) = result;
  return result;
}

uint64_t CGRect.isValid.getter()
{
  return PXRectIsValid();
}

double static CGRect.withAspectRatio(_:fitting:)()
{
  return sub_24433DCD0();
}

double static CGSize.withAspectRatio(_:fitting:)(double a1, double a2, double a3)
{
  double result;

  result = 0.0;
  if (a2 != 0.0 && a3 != 0.0)
  {
    if (a2 / a3 <= a1)
      return a2;
    else
      return a1 * a3;
  }
  return result;
}

double static CGRect.withAspectRatio(_:filling:)()
{
  return sub_24433DCD0();
}

double sub_24433DCD0()
{
  double (*v0)(void);
  double v1;
  double MidX;
  CGRect v4;

  OUTLINED_FUNCTION_13_3();
  v1 = v0();
  v4.origin.x = OUTLINED_FUNCTION_10_7();
  MidX = CGRectGetMidX(v4);
  OUTLINED_FUNCTION_2_17();
  return MidX - v1 * 0.5;
}

double static CGSize.withAspectRatio(_:filling:)(double a1, double a2, double a3)
{
  double result;

  result = 0.0;
  if (a2 != 0.0 && a3 != 0.0)
  {
    if (a2 / a3 >= a1)
      return a2;
    else
      return a1 * a3;
  }
  return result;
}

BOOL CGPoint.isNull.getter(double a1, double a2)
{
  return PXPointIsNull(a1, a2);
}

uint64_t CGPoint.nilIfNull.getter(double a1, double a2)
{
  _BOOL4 IsNull;

  IsNull = PXPointIsNull(a1, a2);
  return OUTLINED_FUNCTION_3_15(IsNull);
}

double CGSize.aspectRatio.getter(double a1, double a2)
{
  return a1 / a2;
}

Swift::Bool __swiftcall CGSize.hasDimensionLargerThan(_:)(CGSize a1)
{
  double v1;
  double v2;

  return a1.height < v2 || a1.width < v1;
}

CGSize __swiftcall CGSize.roundedToEven()()
{
  double v0;
  double v1;
  double v2;
  double v3;
  CGSize result;

  v1 = round(v0 * 0.5);
  v2 = OUTLINED_FUNCTION_11_5(v1 + v1);
  result.height = v3;
  result.width = v2;
  return result;
}

double CGSize.init(from:)(float32x2_t a1)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vcvtq_f64_f32(a1);
  return result;
}

double static CGSize.+ infix(_:_:)(double a1, double a2, double a3)
{
  return a1 + a3;
}

BOOL CGSize.isEmpty.getter(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

double CGSize.interpolated(towards:amount:)(double a1, double a2, double a3, double a4)
{
  return (a1 - a4) * a3 + a4;
}

CGSize __swiftcall CGSize.insetBy(_:)(UIEdgeInsets a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  v3 = v1 - a1.left - a1.right;
  v4 = v2 - a1.top - a1.bottom;
  v5 = v3;
  result.height = v4;
  result.width = v5;
  return result;
}

uint64_t CGSize.nilIfNull.getter(double a1, double a2)
{
  _BOOL4 IsNull;

  IsNull = PXSizeIsNull(a1, a2);
  return OUTLINED_FUNCTION_3_15(IsNull);
}

double CGSize.scaled(by:)(double a1, double a2)
{
  return a1 * a2;
}

double CGSize.roundedToPixel(screenScale:)(double a1, double a2, double a3)
{
  return PXSizeRoundToPixel(a2, a3, a1);
}

double CGSize.px_area.getter(double a1, double a2)
{
  return a1 * a2;
}

uint64_t CGSize.isValid.getter()
{
  return PXSizeIsValid();
}

double * infix(_:_:)(double a1, double a2, double a3)
{
  return a1 * a3;
}

__n128 **= infix(_:_:)(__n128 *a1, float64x2_t a2, float64_t a3)
{
  a2.f64[1] = a3;
  return OUTLINED_FUNCTION_4_15(a1, (__n128)vmulq_f64(*(float64x2_t *)a1, a2));
}

__n128 **= infix(_:_:)(__n128 *a1, double a2)
{
  return OUTLINED_FUNCTION_4_15(a1, (__n128)vmulq_n_f64(*(float64x2_t *)a1, a2));
}

double / infix(_:_:)(double a1, double a2, double a3)
{
  return a1 / a3;
}

__n128 */= infix(_:_:)(__n128 *a1, float64x2_t a2, float64_t a3)
{
  a2.f64[1] = a3;
  return OUTLINED_FUNCTION_4_15(a1, (__n128)vdivq_f64(*(float64x2_t *)a1, a2));
}

__n128 */= infix(_:_:)(__n128 *a1, double a2)
{
  return OUTLINED_FUNCTION_4_15(a1, (__n128)vdivq_f64(*(float64x2_t *)a1, (float64x2_t)vdupq_lane_s64(*(uint64_t *)&a2, 0)));
}

BOOL CGFloat.isEqual(to:tolerance:)(double a1, double a2, double a3)
{
  return vabdd_f64(a3, a1) <= a2;
}

BOOL CGFloat.isEqual(toAngleInDegrees:tolerance:)(double a1, double a2, double a3)
{
  long double v3;

  v3 = vabdd_f64(a3, a1);
  return fabs(OUTLINED_FUNCTION_6_8(v3, 360.0, 360.0 - v3)) <= a2;
}

BOOL CGFloat.isEqual(to:modulo:tolerance:)(double a1, long double a2, double a3, double a4)
{
  long double v4;

  v4 = vabdd_f64(a4, a1);
  return fabs(OUTLINED_FUNCTION_6_8(v4, a2, 360.0 - v4)) <= a3;
}

BOOL CGFloat.isApproximatelyEqual(to:)(double a1, double a2)
{
  return vabdd_f64(a2, a1) <= 0.00001;
}

double OUTLINED_FUNCTION_0_23(double *a1, double a2, double a3)
{
  double result;
  double v4;

  result = *a1 + a2;
  v4 = a1[1] + a3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

double OUTLINED_FUNCTION_1_20(double *a1, double a2, double a3)
{
  double result;
  double v4;

  result = *a1 - a2;
  v4 = a1[1] - a3;
  *a1 = result;
  a1[1] = v4;
  return result;
}

double OUTLINED_FUNCTION_2_17()
{
  CGFloat v0;
  CGFloat v1;
  CGFloat v2;
  CGFloat v3;
  CGRect v5;

  v5.origin.x = v3;
  v5.origin.y = v2;
  v5.size.width = v1;
  v5.size.height = v0;
  return CGRectGetMidY(v5);
}

uint64_t OUTLINED_FUNCTION_3_15(int a1)
{
  uint64_t v1;

  if (a1)
    return 0;
  else
    return v1;
}

__n128 *OUTLINED_FUNCTION_4_15(__n128 *result, __n128 a2)
{
  *result = a2;
  return result;
}

double OUTLINED_FUNCTION_5_9(double a1, double a2, double a3)
{
  return a1 * a3;
}

double OUTLINED_FUNCTION_6_8(long double a1, long double a2, long double a3)
{
  if (a3 < a1)
    a1 = a3;
  return fmod(a1, a2);
}

double OUTLINED_FUNCTION_7_6(double a1, double a2, double a3)
{
  return a1 - a3;
}

double OUTLINED_FUNCTION_8_9()
{
  double v0;

  return v0;
}

double OUTLINED_FUNCTION_10_7()
{
  double v0;

  return v0;
}

double OUTLINED_FUNCTION_11_5(double a1)
{
  return round(a1);
}

double OUTLINED_FUNCTION_12_3(double a1, double a2, double a3)
{
  return a1 / a3;
}

id PXDisplayRect.init(rect:in:)()
{
  uint64_t v0;
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  OUTLINED_FUNCTION_1_21();
  v5 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRect_inCoordinateSpace_, v0, v4, v3, v2, v1);
  swift_unknownObjectRelease();
  return v5;
}

{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v10[8];
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  objc_super v17;

  OUTLINED_FUNCTION_1_21();
  v5 = &v0[OBJC_IVAR___PXDisplayRect_implementation];
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((_OWORD *)v5 + 2) = 0u;
  v5[48] = 1;
  v17.receiver = v0;
  v17.super_class = (Class)PXDisplayRect;
  v6 = objc_msgSendSuper2(&v17, sel_init);
  v12 = v4;
  v13 = v3;
  v14 = v2;
  v15 = v1;
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v7 = sub_24437A448();
  swift_unknownObjectRelease();
  v11 = v7;
  v16 = 0;
  v8 = (uint64_t)v6 + OBJC_IVAR___PXDisplayRect_implementation;
  swift_beginAccess();
  sub_24433E27C((uint64_t)v10, v8);
  swift_endAccess();
  return v6;
}

uint64_t sub_24433E27C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_257356588);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_24433E354()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  _BYTE v4[16];
  _BYTE v5[56];

  v1 = v0 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_0_24();
  result = sub_24433E97C(v1, (uint64_t)v5, &qword_257356588);
  if ((v5[48] & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    sub_24433E97C((uint64_t)v5, (uint64_t)v4, (uint64_t *)&unk_257356720);
    v3 = MEMORY[0x24950D424](v4);
    sub_24433E9C0((uint64_t)v4, (uint64_t *)&unk_257356720);
    sub_24433E608((uint64_t)v5);
    return v3;
  }
  return result;
}

uint64_t PXDisplayRect.isEqual(_:)(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t *v6;
  _BYTE v8[16];
  CGRect v9;
  _BYTE v10[16];
  CGRect v11;
  _BYTE v12[24];
  uint64_t v13;
  char v14;
  _BYTE v15[48];
  unsigned __int8 v16;
  _QWORD v17[7];

  sub_24433E97C(a1, (uint64_t)v12, &qword_257355AF0);
  if (!v13)
  {
    sub_24433E9C0((uint64_t)v12, &qword_257355AF0);
    goto LABEL_8;
  }
  type metadata accessor for PXDisplayRect();
  if ((swift_dynamicCast() & 1) == 0)
  {
LABEL_8:
    LOBYTE(v5) = 0;
    return v5 & 1;
  }
  v2 = (void *)v17[0];
  v3 = v17[0] + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_2_18(v3, (uint64_t)v17);
  v4 = v1 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_0_24();
  OUTLINED_FUNCTION_2_18((uint64_t)v17, (uint64_t)v12);
  OUTLINED_FUNCTION_2_18(v4, (uint64_t)v15);
  if ((v14 & 1) != 0)
  {

    sub_24433E9C0((uint64_t)v17, &qword_257356588);
    v5 = v16 << 31 >> 31;
    if ((v16 & 1) != 0)
      v6 = &qword_257356588;
    else
      v6 = (uint64_t *)&unk_2573582F8;
  }
  else
  {
    sub_24433E97C((uint64_t)v12, (uint64_t)v10, &qword_257356588);
    if ((v16 & 1) != 0)
    {

      sub_24433E9C0((uint64_t)v17, &qword_257356588);
      sub_24433E608((uint64_t)v10);
      LOBYTE(v5) = 0;
      v6 = (uint64_t *)&unk_2573582F8;
    }
    else
    {
      sub_24433E63C((uint64_t)v15, (uint64_t)v8);
      LOBYTE(v5) = sub_24432C898((uint64_t)v10, (uint64_t)v8) && CGRectEqualToRect(v11, v9);

      sub_24433E608((uint64_t)v8);
      v6 = &qword_257356588;
      sub_24433E9C0((uint64_t)v17, &qword_257356588);
      sub_24433E608((uint64_t)v10);
    }
  }
  sub_24433E9C0((uint64_t)v12, v6);
  return v5 & 1;
}

unint64_t type metadata accessor for PXDisplayRect()
{
  unint64_t result;

  result = qword_257356ED8;
  if (!qword_257356ED8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257356ED8);
  }
  return result;
}

uint64_t sub_24433E608(uint64_t a1)
{
  destroy for PhotosDisplayRect();
  return a1;
}

uint64_t sub_24433E63C(uint64_t a1, uint64_t a2)
{
  initializeWithTake for PhotosDisplayRect(a2, a1);
  return a2;
}

uint64_t sub_24433E6F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t result;
  void *v5;
  _BYTE v6[16];
  _BYTE v7[16];
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;

  v3 = v1 + OBJC_IVAR___PXDisplayRect_implementation;
  OUTLINED_FUNCTION_0_24();
  result = sub_24433E97C(v3, (uint64_t)v7, &qword_257356588);
  if ((v12 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    OUTLINED_FUNCTION_2_18((uint64_t)v7, (uint64_t)v6);
    v5 = (void *)MEMORY[0x24950D424](v6);
    sub_24433E9C0((uint64_t)v6, (uint64_t *)&unk_257356720);
    if (v5)
    {
      objc_msgSend(v5, sel_convertRect_toCoordinateSpace_, a1, v8, v9, v10, v11);
      swift_unknownObjectRelease();
    }
    return sub_24433E608((uint64_t)v7);
  }
  return result;
}

id sub_24433E86C@<X0>(_QWORD *a1@<X8>)
{
  id v3;

  a1[3] = type metadata accessor for PXDisplayRect();
  *a1 = v3;
  return v3;
}

void __swiftcall PXDisplayRect.init()(PXDisplayRect *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void PXDisplayRect.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_24433E97C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_24433E9C0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t OUTLINED_FUNCTION_0_24()
{
  return swift_beginAccess();
}

uint64_t OUTLINED_FUNCTION_2_18(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;

  return sub_24433E97C(a1, a2, v2);
}

void PhotosFilteredItemList.__allocating_init(originalItemList:removedId:insertedItem:allowedIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  PhotosFilteredItemList.init(originalItemList:removedId:insertedItem:allowedIds:)(a1, a2, a3, a4);
  OUTLINED_FUNCTION_0_3();
}

char *PhotosFilteredItemList.init(originalItemList:removedId:insertedItem:allowedIds:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  char *v5;
  char *v6;
  uint64_t v7;
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
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
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  char *v38;
  void (*v39)(char *, uint64_t, uint64_t);
  char v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  void (*v44)(char *, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  void (*v47)(uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  uint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t, uint64_t);
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  int v69;
  uint64_t v70;
  _QWORD *v71;
  char *v72;
  uint64_t (*v73)(_QWORD *, uint64_t);
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t i;
  uint64_t v84;
  uint64_t v85;
  uint64_t j;
  void (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t, uint64_t);
  void (*v89)(uint64_t, uint64_t);
  char *result;
  uint64_t v91;
  char *v92;
  _QWORD *v93;
  uint64_t v94;
  void (*v95)(char *, uint64_t, uint64_t);
  uint64_t v96;
  void (*v97)(char *, uint64_t, uint64_t);
  char *v98;
  uint64_t v99;
  uint64_t (*v100)(uint64_t, uint64_t);
  _QWORD *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t AssociatedConformanceWitness;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char v129;
  uint64_t v130;
  uint64_t v131;

  v5 = (char *)v4;
  v113 = a4;
  v118 = a3;
  v119 = a2;
  v6 = (char *)*v4;
  v121 = a1;
  v122 = v6;
  v7 = *((_QWORD *)v6 + 11);
  v120 = *((_QWORD *)v6 + 10);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v123 = v7;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = swift_getAssociatedTypeWitness();
  v107 = OUTLINED_FUNCTION_13_4();
  v106 = sub_24437A808();
  OUTLINED_FUNCTION_8_10(*(_QWORD *)(v106 - 8));
  MEMORY[0x24BDAC7A8](v10);
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x24BDAC7A8](v11);
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x24BDAC7A8](v12);
  v124 = (uint64_t)&v91 - v13;
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_257358300);
  v14 = OUTLINED_FUNCTION_13_4();
  OUTLINED_FUNCTION_8_10(*(_QWORD *)(v14 - 8));
  MEMORY[0x24BDAC7A8](v15);
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x24BDAC7A8](v16);
  v101 = (uint64_t *)((char *)&v91 - v17);
  v18 = sub_24437A808();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x24BDAC7A8](v18);
  v98 = (char *)&v91 - v21;
  v103 = v9;
  v115 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v20);
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x24BDAC7A8](v22);
  v92 = (char *)&v91 - v23;
  v24 = sub_24437A808();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  OUTLINED_FUNCTION_0_25();
  OUTLINED_FUNCTION_1_22();
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v91 - v27;
  v100 = (uint64_t (*)(uint64_t, uint64_t))AssociatedTypeWitness;
  v96 = sub_24437A808();
  OUTLINED_FUNCTION_8_10(*(_QWORD *)(v96 - 8));
  v30 = MEMORY[0x24BDAC7A8](v29);
  v32 = (char *)&v91 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v30);
  v34 = (char *)&v91 - v33;
  v35 = *((_QWORD *)v122 + 19);
  *(_QWORD *)&v5[v35] = PXDataSourceIdentifierMakeUnique();
  v36 = &v5[*(_QWORD *)(*(_QWORD *)v5 + 96)];
  v105 = *(_QWORD *)(v120 - 8);
  (*(void (**)(char *, uint64_t))(v105 + 16))(v36, v121);
  v37 = *(_QWORD *)(*(_QWORD *)v5 + 112);
  v122 = v5;
  v38 = &v5[v37];
  v111 = v19;
  v39 = *(void (**)(char *, uint64_t, uint64_t))(v19 + 16);
  v117 = v18;
  v95 = v39;
  v39(v38, v119, v18);
  v97 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
  v97(v28, v118, v24);
  OUTLINED_FUNCTION_38((uint64_t)v28, 1, v14);
  v116 = v24;
  v109 = v25;
  v102 = v14;
  if (v40)
  {
    OUTLINED_FUNCTION_9_6((uint64_t)v28, *(uint64_t (**)(uint64_t, uint64_t))(v25 + 8));
    v42 = 1;
    v41 = (uint64_t)v100;
  }
  else
  {
    v41 = (uint64_t)v100;
    (*(void (**)(char *, char *, uint64_t (*)(uint64_t, uint64_t)))(*((_QWORD *)v100 - 1) + 32))(v34, &v28[*(int *)(v14 + 48)], v100);
    v42 = 0;
  }
  __swift_storeEnumTagSinglePayload((uint64_t)v34, v42, 1, v41);
  v43 = v122;
  v44 = *(void (**)(char *, char *, uint64_t))(v94 + 32);
  v45 = v96;
  v44(&v43[*(_QWORD *)(*(_QWORD *)v43 + 120)], v34, v96);
  *(_QWORD *)&v43[*(_QWORD *)(*(_QWORD *)v43 + 104)] = v113;
  v46 = v123;
  v47 = *(void (**)(uint64_t, uint64_t))(v123 + 104);
  swift_bridgeObjectRetain();
  v48 = v120;
  v47(v120, v46);
  v44(&v43[*(_QWORD *)(*(_QWORD *)v43 + 144)], v32, v45);
  v100 = *(uint64_t (**)(uint64_t, uint64_t))(v46 + 48);
  v49 = v100(v48, v46);
  v131 = v49;
  v50 = (uint64_t)v98;
  v51 = v117;
  v95(v98, v119, v117);
  v52 = v103;
  OUTLINED_FUNCTION_38(v50, 1, v103);
  v53 = v115;
  if (v40)
  {
    v58 = v41;
    OUTLINED_FUNCTION_10_8();
    v54(v50, v51);
    v55 = v110;
  }
  else
  {
    v56 = v92;
    (*(void (**)(char *, uint64_t, uint64_t))(v115 + 32))(v92, v50, v52);
    v125 = v49;
    v57 = OUTLINED_FUNCTION_3_16();
    MEMORY[0x24950D28C](MEMORY[0x24BEE12E0], v57);
    v58 = v41;
    swift_getAssociatedConformanceWitness();
    sub_24437A76C();
    v55 = v110;
    if (v129 == 1)
    {
      (*(void (**)(char *, uint64_t))(v53 + 8))(v56, v52);
    }
    else
    {
      v59 = v112;
      sub_24437A5B0();
      v60 = *(void (**)(uint64_t, uint64_t))(v53 + 8);
      v60(v59, v52);
      v60((uint64_t)v56, v52);
    }
  }
  v61 = v102;
  v62 = v99;
  v97((char *)v99, v118, v116);
  OUTLINED_FUNCTION_38(v62, 1, v61);
  v63 = v58;
  v64 = v101;
  if (v40)
  {
    v65 = OUTLINED_FUNCTION_9_6(v62, *(uint64_t (**)(uint64_t, uint64_t))(v109 + 8));
  }
  else
  {
    v66 = *(int *)(v61 + 48);
    v67 = (char *)v101 + v66;
    v68 = *(_QWORD *)v62;
    v69 = *(unsigned __int8 *)(v62 + 8);
    *v101 = *(_QWORD *)v62;
    *((_BYTE *)v64 + 8) = v69;
    v70 = *(_QWORD *)(v63 - 8);
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 32))((char *)v64 + v66, v62 + v66, v63);
    v71 = v93;
    v72 = (char *)v93 + *(int *)(v61 + 48);
    *v93 = v68;
    *((_BYTE *)v71 + 8) = v69;
    (*(void (**)(char *, char *, uint64_t))(v70 + 16))(v72, v67, v63);
    (*(void (**)(char *, uint64_t))(v70 + 8))(v72, v63);
    (*(void (**)(uint64_t))(AssociatedConformanceWitness + 64))(v63);
    OUTLINED_FUNCTION_3_16();
    if (v69 == 1)
      sub_24437A598();
    else
      sub_24437A5A4();
    OUTLINED_FUNCTION_10_8();
    v65 = v73(v64, v61);
    v55 = v110;
  }
  v74 = v131;
  v75 = v120;
  if (v113)
  {
    v128 = v131;
    MEMORY[0x24BDAC7A8](v65);
    v76 = v123;
    *(&v91 - 4) = v75;
    *(&v91 - 3) = v76;
    *(&v91 - 2) = v77;
    v78 = OUTLINED_FUNCTION_3_16();
    swift_bridgeObjectRetain();
    MEMORY[0x24950D28C](MEMORY[0x24BEE12F0], v78);
    v74 = sub_24437A904();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v131 = v74;
  }
  else
  {
    v76 = v123;
  }
  *(_QWORD *)&v122[*(_QWORD *)(*(_QWORD *)v122 + 160)] = v74;
  v113 = v74;
  swift_bridgeObjectRetain();
  v110 = OUTLINED_FUNCTION_13_4();
  sub_24437A568();
  v123 = swift_getAssociatedConformanceWitness();
  v130 = sub_24437A3C4();
  v128 = v100(v75, v76);
  v79 = OUTLINED_FUNCTION_3_16();
  v80 = MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v79);
  sub_24437A4E4();
  swift_bridgeObjectRelease();
  v127 = v125;
  v102 = sub_24437AA00();
  sub_24437A9DC();
  AssociatedConformanceWitness = v79;
  v103 = v80;
  sub_24437A9F4();
  sub_24437A9E8();
  v81 = v124;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v104 + 32))(v124, v55, v106);
  v82 = v107;
  for (i = OUTLINED_FUNCTION_38(v81, 1, v107); !v40; i = OUTLINED_FUNCTION_38(v84, 1, v82))
  {
    OUTLINED_FUNCTION_14_2(i, v124 + *(int *)(v82 + 48));
    OUTLINED_FUNCTION_12_4();
    sub_24437A3DC();
    sub_24437A3F4();
    OUTLINED_FUNCTION_2_19();
    v84 = v124;
    OUTLINED_FUNCTION_6_9(v124);
  }
  swift_bridgeObjectRelease();
  *(_QWORD *)&v122[*(_QWORD *)(*(_QWORD *)v122 + 128)] = v130;
  sub_24437A568();
  v127 = sub_24437A3C4();
  v128 = v113;
  sub_24437A4E4();
  swift_bridgeObjectRelease();
  v126 = v125;
  sub_24437A9DC();
  OUTLINED_FUNCTION_2_19();
  v85 = v108;
  OUTLINED_FUNCTION_6_9(v108);
  for (j = OUTLINED_FUNCTION_38(v85, 1, v82); !v40; j = OUTLINED_FUNCTION_38(v85, 1, v82))
  {
    OUTLINED_FUNCTION_14_2(j, v85 + *(int *)(v82 + 48));
    OUTLINED_FUNCTION_12_4();
    sub_24437A3DC();
    sub_24437A3F4();
    OUTLINED_FUNCTION_2_19();
    OUTLINED_FUNCTION_6_9(v85);
  }
  OUTLINED_FUNCTION_10_8();
  v87(v118, v116);
  OUTLINED_FUNCTION_10_8();
  v88(v119, v117);
  OUTLINED_FUNCTION_10_8();
  v89(v121, v120);
  swift_bridgeObjectRelease();
  result = v122;
  *(_QWORD *)&v122[*(_QWORD *)(*(_QWORD *)v122 + 136)] = v127;
  return result;
}

uint64_t sub_24433F5C0()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  return sub_24437A670() & 1;
}

uint64_t PhotosFilteredItemList.originalItemList.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v1 + 80) - 8) + 16))(a1, v1 + *(_QWORD *)(*(_QWORD *)v1 + 96));
}

uint64_t PhotosFilteredItemList.allowedIds.getter()
{
  return OUTLINED_FUNCTION_5_10();
}

uint64_t PhotosFilteredItemList.placeholderObject.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 144);
  swift_getAssociatedTypeWitness();
  v4 = OUTLINED_FUNCTION_16_2();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t PhotosFilteredItemList.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 152));
}

uint64_t PhotosFilteredItemList.itemIdentifiers.getter()
{
  return OUTLINED_FUNCTION_5_10();
}

void PhotosFilteredItemList.numberOfItems.getter()
{
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  JUMPOUT(0x24950BEB8);
}

uint64_t PhotosFilteredItemList.item(at:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t AssociatedConformanceWitness;
  uint64_t v15;
  uint64_t result;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;

  v20 = a1;
  v21 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 88);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_24437A808();
  v18 = *(_QWORD *)(v6 - 8);
  v19 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v18 - v7;
  swift_getAssociatedConformanceWitness();
  v9 = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v18 - v11;
  sub_24437A604();
  v13 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 128));
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  MEMORY[0x24950BD14](&v22, v12, v13, v9, MEMORY[0x24BEE1768], AssociatedConformanceWitness);
  if ((v23 & 1) != 0)
  {
    v15 = v21;
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v8, v2 + *(_QWORD *)(*(_QWORD *)v2 + 120), v19);
    result = OUTLINED_FUNCTION_38((uint64_t)v8, 1, AssociatedTypeWitness);
    if (v17)
    {
      __break(1u);
    }
    else
    {
      OUTLINED_FUNCTION_9_6((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 32))(v15, v8, AssociatedTypeWitness);
    }
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 56))(v22, v4, v3);
    return OUTLINED_FUNCTION_9_6((uint64_t)v12, *(uint64_t (**)(uint64_t, uint64_t))(v10 + 8));
  }
  return result;
}

void PhotosFilteredItemList.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t);

  (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)v0 + 80) - 8) + 8))(v0 + *(_QWORD *)(*(_QWORD *)v0 + 96), *(_QWORD *)(*(_QWORD *)v0 + 80));
  OUTLINED_FUNCTION_11_6();
  v1 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 112);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  v2 = OUTLINED_FUNCTION_16_2();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + *(_QWORD *)(*(_QWORD *)v0 + 120);
  v4 = sub_24437A808();
  v5 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8);
  v5(v3, v4);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_11_6();
  v5(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144), v4);
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_0_3();
}

uint64_t PhotosFilteredItemList.__deallocating_deinit()
{
  PhotosFilteredItemList.deinit();
  return swift_deallocClassInstance();
}

void sub_24433FB64()
{
  PhotosFilteredItemList.numberOfItems.getter();
}

uint64_t sub_24433FB84()
{
  return PhotosFilteredItemList.itemIdentifiers.getter();
}

uint64_t sub_24433FBA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  return PhotosFilteredItemList.item(at:)(a1, a2);
}

uint64_t sub_24433FBC4@<X0>(uint64_t a1@<X8>)
{
  return PhotosFilteredItemList.placeholderObject.getter(a1);
}

uint64_t sub_24433FBE4()
{
  return PhotosFilteredItemList.version.getter();
}

uint64_t PhotosFilteredItemList<>.numberOfItemCollections.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_15_1();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v1 + 80));
}

uint64_t PhotosFilteredItemList<>.numberOfCollectionLists.getter()
{
  uint64_t v0;
  uint64_t v1;

  OUTLINED_FUNCTION_15_1();
  return (*(uint64_t (**)(_QWORD))(v0 + 16))(*(_QWORD *)(v1 + 80));
}

uint64_t sub_24433FC54()
{
  return PhotosFilteredItemList<>.numberOfItemCollections.getter();
}

uint64_t sub_24433FC78()
{
  return PhotosFilteredItemList<>.numberOfCollectionLists.getter();
}

uint64_t sub_24433FC9C()
{
  return sub_24433F5C0() & 1;
}

uint64_t sub_24433FCBC()
{
  return swift_getAssociatedConformanceWitness();
}

uint64_t sub_24433FCD8()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;

  v0 = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    swift_getAssociatedTypeWitness();
    v0 = sub_24437A808();
    if (v2 <= 0x3F)
    {
      v0 = sub_24437A808();
      if (v3 <= 0x3F)
        return swift_initClassMetadata2();
    }
  }
  return v0;
}

uint64_t type metadata accessor for PhotosFilteredItemList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosFilteredItemList);
}

uint64_t method lookup function for PhotosFilteredItemList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosFilteredItemList.__allocating_init(originalItemList:removedId:insertedItem:allowedIds:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 168))();
}

void OUTLINED_FUNCTION_1_22()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = v0;
}

uint64_t OUTLINED_FUNCTION_2_19()
{
  return sub_24437A9E8();
}

uint64_t OUTLINED_FUNCTION_3_16()
{
  return sub_24437A5E0();
}

uint64_t OUTLINED_FUNCTION_5_10()
{
  return swift_bridgeObjectRetain();
}

uint64_t OUTLINED_FUNCTION_6_9(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t, uint64_t, uint64_t);
  uint64_t v3;

  return v2(a1, v3, v1);
}

void OUTLINED_FUNCTION_8_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 256) = a1;
}

uint64_t OUTLINED_FUNCTION_9_6@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;

  return a2(a1, v2);
}

uint64_t OUTLINED_FUNCTION_11_6()
{
  return swift_bridgeObjectRelease();
}

uint64_t OUTLINED_FUNCTION_12_4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 160) = v0;
  *(_BYTE *)(v1 - 152) = 0;
  return 0;
}

uint64_t OUTLINED_FUNCTION_13_4()
{
  return swift_getTupleTypeMetadata2();
}

uint64_t OUTLINED_FUNCTION_14_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t);
  uint64_t v4;

  return v3(v2, a2, v4);
}

uint64_t OUTLINED_FUNCTION_16_2()
{
  return sub_24437A808();
}

uint64_t sub_24433FF20(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  type metadata accessor for os_unfair_lock_s(255);
  sub_24437A8EC();
  v4 = sub_24437A8E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 8))(a1, a2);
  return v4;
}

uint64_t sub_24433FFA4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v9;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, a2);
  v7 = sub_24433FF20((uint64_t)v6, a2);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
  return v7;
}

uint64_t sub_244340034()
{
  sub_244341DB8();
  return sub_24437A7CC();
}

uint64_t PhotosGroupingItemListManager.Options.init(queue:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)()
{
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_11();
  PhotosGroupingItemListManager.init(inputItemListManager:options:groupProvider:)();
}

void sub_2443400A0()
{
  OUTLINED_FUNCTION_0_3();
}

void PhotosGroupingItemListManager.init(inputItemListManager:options:groupProvider:)()
{
  uint64_t v0;
  void *v1;
  id v2;

  *(_QWORD *)(v0 + 40) = 0;
  *(_QWORD *)(v0 + 48) = 0;
  if (qword_257356BC8 != -1)
    swift_once();
  v1 = (void *)qword_257356BC0;
  *(_QWORD *)(v0 + 72) = qword_257356BC0;
  *(_BYTE *)(v0 + 80) = 0;
  v2 = v1;
  *(_QWORD *)(v0 + 88) = sub_24437A568();
  *(_QWORD *)(v0 + 96) = 0;
  type metadata accessor for PhotosGroupingItemListManager.FetchState();
}

uint64_t sub_24434028C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t result;

  v1 = *a1;
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    if ((v1 & 1) != 0)
      sub_244340320();
    return swift_release();
  }
  return result;
}

uint64_t sub_2443402F0()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 80);
}

uint64_t sub_2443402F8(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 80) = result;
  return result;
}

uint64_t sub_244340300(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 88) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t sub_244340310()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 96);
}

uint64_t sub_244340318(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = result;
  return result;
}

uint64_t sub_244340320()
{
  _QWORD *v0;
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t result;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  _QWORD aBlock[7];

  v1 = v0;
  v2 = (_QWORD *)*v0;
  v3 = sub_24437A334();
  v47 = *(_QWORD *)(v3 - 8);
  v48 = v3;
  MEMORY[0x24BDAC7A8](v3);
  OUTLINED_FUNCTION_2_0();
  v46 = v4;
  v5 = sub_24437A34C();
  v44 = *(_QWORD *)(v5 - 8);
  v45 = v5;
  MEMORY[0x24BDAC7A8](v5);
  OUTLINED_FUNCTION_2_0();
  v43 = v6;
  v7 = v2[12];
  v8 = v2[10];
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v41 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v42 = AssociatedTypeWitness;
  v10 = *(_QWORD *)(v41 + 64);
  v11 = MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v49 = (char *)&v36 - v13;
  v14 = OUTLINED_FUNCTION_8_11();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  OUTLINED_FUNCTION_2_4();
  v18 = v17 - v16;
  v19 = (void *)v1[2];
  *(_QWORD *)(v17 - v16) = v19;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v15 + 104))(v17 - v16, *MEMORY[0x24BEE5610], v14);
  v40 = v19;
  LOBYTE(v19) = sub_24437A388();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 8))(v18, v14);
  if ((v19 & 1) != 0)
  {
    if ((v1[10] & 1) == 0)
    {
      *((_BYTE *)v1 + 80) = 1;
      v21 = v49;
      (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v8, v7);
      v22 = v1[7];
      v37 = v1[8];
      v38 = v22;
      v39 = v1[9];
      v23 = OUTLINED_FUNCTION_0_2();
      swift_weakInit();
      v24 = v41;
      v25 = v8;
      v26 = v42;
      (*(void (**)(char *, char *))(v41 + 16))(v12, v21);
      v27 = (*(unsigned __int8 *)(v24 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v24 + 80);
      v28 = (v10 + v27 + 7) & 0xFFFFFFFFFFFFFFF8;
      v29 = (char *)swift_allocObject();
      *((_QWORD *)v29 + 2) = v25;
      *((_QWORD *)v29 + 3) = v2[11];
      *((_QWORD *)v29 + 4) = v7;
      *((_QWORD *)v29 + 5) = v2[13];
      *((_QWORD *)v29 + 6) = v23;
      v30 = v37;
      *((_QWORD *)v29 + 7) = v38;
      *((_QWORD *)v29 + 8) = v30;
      (*(void (**)(char *, char *, uint64_t))(v24 + 32))(&v29[v27], v12, v26);
      v31 = v40;
      *(_QWORD *)&v29[v28] = v40;
      aBlock[4] = sub_244342024;
      aBlock[5] = v29;
      aBlock[0] = MEMORY[0x24BDAC760];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_244321468;
      aBlock[3] = &block_descriptor_5;
      v32 = _Block_copy(aBlock);
      v33 = v31;
      swift_retain();
      swift_retain();
      v34 = v43;
      sub_24437A340();
      v50 = MEMORY[0x24BEE4AF8];
      sub_244342144((unint64_t *)&qword_257356E88, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
      __swift_instantiateConcreteTypeFromMangledName(&qword_257356EA8);
      sub_244342180((unint64_t *)&qword_257356EB0, &qword_257356EA8);
      v35 = v46;
      sub_24437A85C();
      MEMORY[0x24950C104](0, v34, v35, v32);
      _Block_release(v32);
      OUTLINED_FUNCTION_6_10(*(uint64_t (**)(uint64_t, uint64_t))(v47 + 8));
      (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v34, v45);
      (*(void (**)(char *, uint64_t))(v24 + 8))(v49, v26);
      swift_release();
      return swift_release();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_2443406E0(uint64_t a1, uint64_t (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t result;
  uint64_t v21;
  uint64_t AssociatedConformanceWitness;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[4];
  uint64_t v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t aBlock;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v30 = a7;
  v14 = sub_24437A334();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_24437A34C();
  v32 = *(_QWORD *)(v18 - 8);
  v33 = v18;
  MEMORY[0x24BDAC7A8](v18);
  v31 = (char *)v29 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    v29[3] = v15;
    v21 = a2(a4);
    swift_getAssociatedTypeWitness();
    v29[2] = v14;
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v29[0] = v17;
    v29[1] = a5;
    v23 = *(_QWORD *)(AssociatedConformanceWitness + 8);
    v24 = *(uint64_t (**)(uint64_t, uint64_t))(v23 + 8);
    v25 = swift_checkMetadataState();
    v26 = v24(v25, v23);
    v27 = sub_244340DE8();
    MEMORY[0x24BDAC7A8](v27);
    v28 = v30;
    v29[-6] = a6;
    v29[-5] = v28;
    v29[-4] = a8;
    v29[-3] = a9;
    v29[-2] = v21;
    v29[-1] = v26;
    aBlock = a6;
    v35 = v28;
    v36 = a8;
    v37 = a9;
    type metadata accessor for PhotosGroupingItemListManager.FetchState();
  }
  return result;
}

uint64_t sub_244340A60(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  swift_bridgeObjectRetain();
  result = swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return result;
}

uint64_t sub_244340AAC()
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
    sub_244340B00();
  return result;
}

void sub_244340B00()
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  sub_244340DE8();
  type metadata accessor for PhotosGroupingItemListManager.FetchState();
}

BOOL sub_244340BAC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t AssociatedConformanceWitness;
  uint64_t v21;

  sub_24437A5E0();
  swift_getTupleTypeMetadata2();
  v11 = sub_24437A808();
  sub_244341E8C((void (*)(uint64_t))sub_244341DF4, v9 - 176, v2, a1, v11);
  swift_release();
  v12 = *(_QWORD *)(v9 - 120);
  if (v12)
  {
    v13 = *(_QWORD *)(v9 - 112);
    swift_bridgeObjectRetain_n();
    sub_244340300(v12);
    *(_QWORD *)(v1 + 96) = v13;
    *(_QWORD *)(v9 - 120) = *(_QWORD *)(v1 + 24);
    v14 = (_QWORD *)OUTLINED_FUNCTION_0_2();
    *(_QWORD *)(v9 - 192) = v8;
    v15 = (uint64_t)v14;
    v14[2] = v4;
    v14[3] = v6;
    v14[4] = v3;
    v14[5] = v7;
    v14[6] = v12;
    v14[7] = v13;
    v17 = type metadata accessor for PhotosBasicItemListManager(0, v6, v7, v16);
    swift_retain();
    v18 = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, v17);
    PhotosMutableComposedObservable<>.performChanges(using:)((uint64_t)sub_244341E28, v15, v17, v18);
    v8 = *(_QWORD *)(v9 - 192);
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    *(_BYTE *)(v1 + 80) = 0;
  }
  v19 = *(_QWORD *)(v1 + 96);
  sub_24432A7F4();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v21 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(AssociatedConformanceWitness + 8) + 8))(v8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 184) + 8))(v5, v8);
  if (v19 != v21)
    sub_244340320();
  return v12 != 0;
}

void sub_244340D68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v7;
  char v8;

  type metadata accessor for PhotosBasicItemList(0, a5, a7, a4);
  sub_2443313F8(&v8);
  v7 = swift_bridgeObjectRetain();
  PhotosBasicItemList.__allocating_init(items:loadingStatus:)(v7, &v8);
  sub_244331C08();
}

uint64_t sub_244340DE8()
{
  return swift_retain();
}

void sub_244340DF0()
{
  PhotosBasicItemListManager.itemList.getter();
  OUTLINED_FUNCTION_2();
}

uint64_t sub_244340E0C(double a1)
{
  uint64_t v1;

  if (*(_BYTE *)(v1 + 80) == 1)
  {
    px_dispatch_queue_wait(*(void **)(v1 + 72), a1);
    sub_244340B00();
  }
  return 1;
}

void sub_244340E3C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = OUTLINED_FUNCTION_8_11();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  OUTLINED_FUNCTION_2_4();
  v5 = v4 - v3;
  v6 = *(void **)(v0 + 16);
  *(_QWORD *)(v4 - v3) = v6;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104))(v4 - v3, *MEMORY[0x24BEE5610], v1);
  v7 = v6;
  LOBYTE(v6) = sub_24437A388();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v5, v1);
  if ((v6 & 1) != 0)
  {
    swift_retain();
    OUTLINED_FUNCTION_0_3();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_244340EE0()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v1 = *v0;
  v2 = OUTLINED_FUNCTION_8_11();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  OUTLINED_FUNCTION_2_4();
  v6 = (void *)v0[2];
  *(_QWORD *)(v5 - v4) = v6;
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v5 - v4, *MEMORY[0x24BEE5610], v2);
  v7 = v6;
  LOBYTE(v6) = sub_24437A388();
  result = OUTLINED_FUNCTION_6_10(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8));
  if ((v6 & 1) != 0)
  {
    v10 = type metadata accessor for PhotosBasicItemListManager(0, *(_QWORD *)(v1 + 88), *(_QWORD *)(v1 + 104), v9);
    swift_retain();
    MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosBasicItemListManager<A>, v10);
    v11 = PhotosComposedObservable<>.observeChanges(using:)();
    swift_release();
    return (uint64_t)v11;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t PhotosGroupingItemListManager.GroupItem.id.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a1 + 32) - 8) + 16))(a2, v2);
}

uint64_t PhotosGroupingItemListManager.GroupItem.id.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 40))(v2, a1);
}

uint64_t (*PhotosGroupingItemListManager.GroupItem.id.modify())()
{
  return nullsub_1;
}

uint64_t PhotosGroupingItemListManager.GroupItem.contents.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t PhotosGroupingItemListManager.GroupItem.contents.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t result;

  v4 = *(int *)(a2 + 76);
  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + v4) = a1;
  return result;
}

uint64_t (*PhotosGroupingItemListManager.GroupItem.contents.modify())()
{
  return nullsub_1;
}

uint64_t PhotosGroupingItemListManager.GroupItem.value.getter@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v2;

  *a2 = *(_QWORD *)(v2 + *(int *)(a1 + 76));
  return swift_bridgeObjectRetain();
}

void PhotosGroupingItemListManager.GroupItem.init(id:contents:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  OUTLINED_FUNCTION_2_20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v0 - 8) + 32))(v2, v1, v0);
  type metadata accessor for PhotosGroupingItemListManager.GroupItem();
}

uint64_t sub_244341108(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + *(int *)(result + 76)) = v1;
  return result;
}

uint64_t static PhotosGroupingItemListManager.GroupItem.== infix(_:_:)()
{
  if ((sub_24437A454() & 1) != 0)
    type metadata accessor for PhotosGroupingItemListManager.GroupItem();
  return 0;
}

uint64_t sub_2443412C0()
{
  return static PhotosGroupingItemListManager.GroupItem.== infix(_:_:)() & 1;
}

uint64_t PhotosGroupingItemListManager.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  return v0;
}

uint64_t PhotosGroupingItemListManager.__deallocating_deinit()
{
  PhotosGroupingItemListManager.deinit();
  return swift_deallocClassInstance();
}

void sub_24434136C(_QWORD *a1@<X8>)
{
  uint64_t v2;

  sub_244340DF0();
  *a1 = v2;
}

uint64_t sub_244341398()
{
  return sub_244340EE0();
}

void PhotosItemListManager.groupBy<A>(options:groupProvider:)()
{
  OUTLINED_FUNCTION_2_20();
  type metadata accessor for PhotosGroupingItemListManager();
}

void sub_2443413F0()
{
  swift_unknownObjectRetain();
  swift_retain();
  OUTLINED_FUNCTION_5_11();
  sub_244340034();
  PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)();
}

uint64_t sub_244341444()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t (*v5)(uint64_t);
  uint64_t v6;
  uint64_t result;
  _QWORD v8[2];

  v0 = sub_24437A7C0();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x24BDAC7A8](v0);
  v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_24437A7A8();
  v5 = (uint64_t (*)(uint64_t))MEMORY[0x24BEE5688];
  MEMORY[0x24BDAC7A8](v4);
  v6 = sub_24437A34C();
  MEMORY[0x24BDAC7A8](v6);
  sub_244341DB8();
  sub_24437A340();
  v8[1] = MEMORY[0x24BEE4AF8];
  sub_244342144(&qword_257356EE8, v5, MEMORY[0x24BEE5698]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_257356EB8);
  sub_244342180(&qword_257356EC0, &qword_257356EB8);
  sub_24437A85C();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x24BEE5750], v0);
  result = sub_24437A7E4();
  qword_257356BC0 = result;
  return result;
}

void type metadata accessor for PhotosGroupingItemListManager.FetchState()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_24434160C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_244341630(uint64_t *a1)
{
  return sub_24434028C(a1);
}

void type metadata accessor for PhotosGroupingItemListManager.GroupItem()
{
  JUMPOUT(0x24950D214);
}

void type metadata accessor for PhotosGroupingItemListManager()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_244341658(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 56);
}

uint64_t sub_244341660(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 64);
}

uint64_t sub_244341668(uint64_t a1)
{
  uint64_t result;

  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGroupingItemListManager<A, B>.GroupItem<A1>);
  *(_QWORD *)(a1 + 24) = result;
  return result;
}

uint64_t sub_244341694(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_QWORD *)(a1 + 8) = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGroupingItemListManager<A, B>);
  result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosGroupingItemListManager<A, B>, a2);
  *(_QWORD *)(a1 + 16) = result;
  return result;
}

uint64_t sub_2443416D8()
{
  return swift_initClassMetadata2();
}

uint64_t method lookup function for PhotosGroupingItemListManager()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.__allocating_init(inputItemListManager:options:groupProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 192))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.itemList.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.waitForItemList(timeout:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.changeDetailsRepository.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of PhotosGroupingItemListManager.observeChanges(using:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

void type metadata accessor for PhotosGroupingItemListManager.Options()
{
  JUMPOUT(0x24950D214);
}

uint64_t sub_2443417C4()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_2443417CC()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_244341844(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v9;

  v4 = a1;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_DWORD *)(v5 + 80);
  if ((v7 & 0x1000F8) != 0 || ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > 0x18)
  {
    v9 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v9 + ((unsigned __int16)((v7 & 0xF8) + 23) & (unsigned __int16)~(v7 & 0xF8) & 0x1F8));
    swift_retain();
  }
  else
  {
    (*(void (**)(uint64_t *, uint64_t *))(v5 + 16))(a1, a2);
    *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)a2 + v6 + 7) & 0xFFFFFFFFFFFFF8);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_2443418F8(uint64_t a1, uint64_t a2)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 32) - 8) + 8))();
  return swift_bridgeObjectRelease();
}

uint64_t sub_244341938(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 16))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244341998(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 24))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244341A04(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 32) - 8);
  (*(void (**)(void))(v5 + 40))();
  *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a1) & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)((*(_QWORD *)(v5 + 64) + 7 + a2) & 0xFFFFFFFFFFFFF8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_244341A68(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unint64_t v13;

  v4 = *(_QWORD *)(a3 + 32);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(unsigned int *)(v5 + 84);
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = *(_DWORD *)(v5 + 84);
  if (!a2)
    return 0;
  v8 = *(_QWORD *)(v5 + 64);
  if (v7 >= a2)
  {
    if (v6 < 0x7FFFFFFF)
    {
      v13 = *(_QWORD *)((a1 + v8 + 7) & 0xFFFFFFFFFFFFF8);
      if (v13 >= 0xFFFFFFFF)
        LODWORD(v13) = -1;
      return (v13 + 1);
    }
    else
    {
      return __swift_getEnumTagSinglePayload(a1, v6, v4);
    }
  }
  else
  {
    if (((((v8 + 7) & 0xFFFFFFFFFFFFFFF8) + 8) & 0xFFFFFFF8) != 0)
      v9 = 2;
    else
      v9 = a2 - v7 + 1;
    if (v9 >= 0x10000)
      v10 = 4;
    else
      v10 = 2;
    if (v9 < 0x100)
      v10 = 1;
    if (v9 >= 2)
      v11 = v10;
    else
      v11 = 0;
    return ((uint64_t (*)(void))((char *)&loc_244341AE4 + 4 * byte_24438AC80[v11]))();
  }
}

void sub_244341B64(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;
  int v9;
  unsigned int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a4 + 32) - 8);
  if (*(_DWORD *)(v5 + 84) <= 0x7FFFFFFFu)
    v6 = 0x7FFFFFFF;
  else
    v6 = *(_DWORD *)(v5 + 84);
  if (v6 >= a3)
  {
    v9 = 0;
  }
  else
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) == 0xFFFFFFF8)
      v7 = a3 - v6 + 1;
    else
      v7 = 2;
    if (v7 >= 0x10000)
      v8 = 4;
    else
      v8 = 2;
    if (v7 < 0x100)
      v8 = 1;
    if (v7 >= 2)
      v9 = v8;
    else
      v9 = 0;
  }
  if (a2 > v6)
  {
    if (((*(_DWORD *)(v5 + 64) + 7) & 0xFFFFFFF8) != 0xFFFFFFF8)
    {
      v10 = ~v6 + a2;
      bzero(a1, ((*(_QWORD *)(v5 + 64) + 7) & 0xFFFFFFFFFFFFFFF8) + 8);
      *a1 = v10;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

uint64_t sub_244341C50(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  _QWORD *v8;
  uint64_t v9;

  *(_BYTE *)(v5 + v6) = 0;
  if ((_DWORD)a2)
  {
    if (a3 < 0x7FFFFFFF)
    {
      v8 = (_QWORD *)((v5 + v4 + 7) & 0xFFFFFFFFFFFFFFF8);
      if ((a2 & 0x80000000) != 0)
        v9 = a2 ^ 0x80000000;
      else
        v9 = (a2 - 1);
      *v8 = v9;
    }
    else
    {
      return __swift_storeEnumTagSinglePayload(v5, a2, a3, a4);
    }
  }
  return result;
}

uint64_t type metadata accessor for PhotosGroupingItemListManagerSharedState()
{
  return objc_opt_self();
}

_QWORD *sub_244341CFC(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_244341D28()
{
  return swift_bridgeObjectRelease();
}

_QWORD *sub_244341D30(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

_QWORD *sub_244341D7C(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  swift_bridgeObjectRelease();
  a1[1] = a2[1];
  return a1;
}

unint64_t sub_244341DB8()
{
  unint64_t result;

  result = qword_257356EF0;
  if (!qword_257356EF0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_257356EF0);
  }
  return result;
}

__n128 sub_244341DF4@<Q0>(__n128 *a1@<X0>, __n128 *a2@<X8>)
{
  __n128 result;

  result = *a1;
  a1->n128_u64[0] = 0;
  a1->n128_u64[1] = 0;
  *a2 = result;
  return result;
}

uint64_t sub_244341E04()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_244341E28(uint64_t a1)
{
  uint64_t *v1;

  sub_244340D68(a1, v1[6], v1[7], v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_244341E38@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  v2 = *a1;
  *(_DWORD *)((char *)a1 + ((*(unsigned int *)(*a1 + 48) + 3) & 0x1FFFFFFFCLL)) = 0;
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v2 + *MEMORY[0x24BEE27A8]) - 8) + 16))(a2);
}

void sub_244341E8C(void (*a1)(uint64_t), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;

  sub_244341EF4(a3 + *(_QWORD *)(*MEMORY[0x24BEE27A8] + *(_QWORD *)a3 + 16), (os_unfair_lock_t)(a3 + ((*(unsigned int *)(*(_QWORD *)a3 + 48) + 3) & 0x1FFFFFFFCLL)), a1, a2, a4, a5, &v5);
}

void sub_244341EF4(uint64_t a1, os_unfair_lock_t lock, void (*a3)(uint64_t), uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;

  os_unfair_lock_lock(lock);
  a3(a1);
  os_unfair_lock_unlock(lock);
  if (v7)
    *a7 = v7;
}

uint64_t sub_244341F74()
{
  uint64_t v0;
  uint64_t AssociatedTypeWitness;
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v2 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v4 = (*(_QWORD *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  swift_release();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, AssociatedTypeWitness);

  return swift_deallocObject();
}

uint64_t sub_244342024()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = *(_QWORD *)(v0 + 40);
  v5 = *(_QWORD *)(swift_getAssociatedTypeWitness() - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 72) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  return sub_2443406E0(*(_QWORD *)(v0 + 48), *(uint64_t (**)(uint64_t))(v0 + 56), *(_QWORD *)(v0 + 64), v0 + v6, *(_QWORD *)(v0 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFF8)), v1, v2, v3, v4);
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_2443420D8(_QWORD *a1)
{
  uint64_t v1;

  return sub_244340A60(a1, *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_2443420F8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_24434211C()
{
  return sub_244340AAC();
}

uint64_t sub_24434212C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  return sub_244341E38(a1, a2);
}

void sub_244342144(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t v5;

  if (!*a1)
  {
    v5 = a2(255);
    atomic_store(MEMORY[0x24950D28C](a3, v5), a1);
  }
  OUTLINED_FUNCTION_2();
}

void sub_244342180(unint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  if (!*a1)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    atomic_store(MEMORY[0x24950D28C](MEMORY[0x24BEE12C8], v3), a1);
  }
  OUTLINED_FUNCTION_2();
}

uint64_t OUTLINED_FUNCTION_5_11()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_6_10@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v2, v1);
}

uint64_t OUTLINED_FUNCTION_8_11()
{
  return sub_24437A370();
}

void PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  swift_allocObject();
  PhotosMappingItemList.init(itemIdentifiers:loadingStatus:itemProvider:)(a1, a2, a3, a4);
  OUTLINED_FUNCTION_0_3();
}

void PhotosMappingItemList.__allocating_init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(v0 + 80);
  v1 = *(_QWORD *)(v0 + 88);
  swift_getAssociatedTypeWitness();
  v3 = sub_24437A568();
  v5 = 0;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v1;
  PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)(v3, &v5, (uint64_t)sub_244342598, v4);
}

void sub_2443422F8()
{
  sub_24437A9B8();
  __break(1u);
}

void PhotosMappingItemList.init(itemIdentifiers:loadingStatus:itemProvider:)(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  char v8;

  v8 = *a2;
  *(_QWORD *)(v4 + 32) = PXDataSourceIdentifierMakeUnique();
  *(_QWORD *)(v4 + 40) = a1;
  *(_BYTE *)(v4 + 48) = v8;
  *(_QWORD *)(v4 + 16) = a3;
  *(_QWORD *)(v4 + 24) = a4;
  OUTLINED_FUNCTION_0_3();
}

uint64_t PhotosMappingItemList.version.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t PhotosMappingItemList.itemIdentifiers.getter()
{
  return swift_bridgeObjectRetain();
}

void PhotosMappingItemList.loadingStatus.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

void PhotosMappingItemList.numberOfItems.getter()
{
  swift_getAssociatedTypeWitness();
  JUMPOUT(0x24950BEB8);
}

uint64_t PhotosMappingItemList.item(at:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void (*v7)(uint64_t, char *);
  uint64_t v9;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v6 = (char *)&v9 - v5;
  v7 = *(void (**)(uint64_t, char *))(v1 + 16);
  sub_24437A604();
  v7(a1, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, AssociatedTypeWitness);
}

uint64_t PhotosMappingItemList.deinit()
{
  uint64_t v0;

  swift_release();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t PhotosMappingItemList.__deallocating_deinit()
{
  PhotosMappingItemList.deinit();
  return swift_deallocClassInstance();
}

void sub_2443424E8()
{
  PhotosMappingItemList.numberOfItems.getter();
}

uint64_t sub_244342508()
{
  return PhotosMappingItemList.itemIdentifiers.getter();
}

uint64_t sub_244342528(uint64_t a1)
{
  return PhotosMappingItemList.item(at:)(a1);
}

void sub_244342548(_BYTE *a1@<X8>)
{
  PhotosMappingItemList.loadingStatus.getter(a1);
}

uint64_t sub_244342568()
{
  return PhotosMappingItemList.version.getter();
}

uint64_t sub_244342588()
{
  return swift_deallocObject();
}

void sub_244342598()
{
  sub_2443422F8();
}

uint64_t sub_2443425A0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for PhotosMappingItemList(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PhotosMappingItemList);
}

uint64_t method lookup function for PhotosMappingItemList()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PhotosMappingItemList.__allocating_init(itemIdentifiers:loadingStatus:itemProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t sub_244342628(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PhotosItemList.index(for:)(a1, a2, a3);
}

uint64_t PhotosItemList.index(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;

  (*(void (**)(uint64_t, uint64_t))(a3 + 48))(a2, a3);
  swift_getAssociatedTypeWitness();
  swift_getAssociatedConformanceWitness();
  swift_getAssociatedTypeWitness();
  v3 = sub_24437A5E0();
  MEMORY[0x24950D28C](MEMORY[0x24BEE12E0], v3);
  swift_getAssociatedConformanceWitness();
  sub_24437A76C();
  swift_bridgeObjectRelease();
  return v5;
}

{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t AssociatedConformanceWitness;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void (*v25)(char *, uint64_t);
  uint64_t v26;
  uint64_t v27;
  void (*v28)(char *, char *, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  _OWORD v36[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_24437A808();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v30 - v8;
  v34 = a3;
  v33 = a2;
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v11 = swift_getAssociatedTypeWitness();
  v12 = sub_24437A808();
  v30 = *(_QWORD *)(v12 - 8);
  v31 = v12;
  v13 = MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v30 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = MEMORY[0x24BDAC7A8](v13);
  v18 = (char *)&v30 - v17;
  v32 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v16);
  v20 = (char *)&v30 - v19;
  OUTLINED_FUNCTION_18_2();
  if (OUTLINED_FUNCTION_10_9())
  {
    OUTLINED_FUNCTION_16_3((uint64_t)v9, 0);
    (*(void (**)(uint64_t, uint64_t))(AssociatedConformanceWitness + 64))(AssociatedTypeWitness, AssociatedConformanceWitness);
    OUTLINED_FUNCTION_5_12(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(AssociatedTypeWitness - 8) + 8));
    v21 = (uint64_t)v15;
    v22 = 0;
  }
  else
  {
    OUTLINED_FUNCTION_16_3((uint64_t)v9, 1);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v21 = (uint64_t)v15;
    v22 = 1;
  }
  OUTLINED_FUNCTION_2_10(v21, v22);
  OUTLINED_FUNCTION_18_2();
  if (__swift_getEnumTagSinglePayload((uint64_t)v15, 1, v11) != 1)
  {
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v36);
    v27 = v32;
    v28 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    v28(v18, v15, v11);
    OUTLINED_FUNCTION_2_10((uint64_t)v18, 0);
LABEL_9:
    v28(v20, v18, v11);
    v26 = (*(uint64_t (**)(char *, uint64_t))(v34 + 72))(v20, v33);
    (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v11);
    return v26;
  }
  sub_24432DBD8(v36, &v35);
  v23 = OUTLINED_FUNCTION_10_9();
  OUTLINED_FUNCTION_2_10((uint64_t)v18, v23 ^ 1u);
  v24 = v31;
  v25 = *(void (**)(char *, uint64_t))(v30 + 8);
  v25(v15, v31);
  if (__swift_getEnumTagSinglePayload((uint64_t)v18, 1, v11) != 1)
  {
    v27 = v32;
    v28 = *(void (**)(char *, char *, uint64_t))(v32 + 32);
    goto LABEL_9;
  }
  v25(v18, v24);
  return 0;
}

uint64_t sub_244342770(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return PhotosItemList.index(for:)(a1, a2, a3);
}

BOOL PhotosItemList.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;

  (*(void (**)(void))(a3 + 72))();
  return (v3 & 1) == 0;
}

{
  char v3;

  OUTLINED_FUNCTION_14_3(a1, a2, a3);
  return (v3 & 1) == 0;
}

uint64_t sub_244342AC0@<X0>(uint64_t a1@<X8>)
{
  return PhotosItemList.placeholderObject.getter(a1);
}

uint64_t PhotosItemList.placeholderObject.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t AssociatedTypeWitness;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  return __swift_storeEnumTagSinglePayload(a1, 1, 1, AssociatedTypeWitness);
}

uint64_t PhotosItemList.loadingStatus(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a4 + 112))(a3, a4);
}

BOOL PhotosItemList.isEmpty.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))() == 0;
}

uint64_t PhotosItemList.item(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v3 = OUTLINED_FUNCTION_14_3(a1, a2, a3);
  if ((v4 & 1) == 0)
    OUTLINED_FUNCTION_4_16(v3);
  OUTLINED_FUNCTION_0_26();
  v5 = OUTLINED_FUNCTION_3_17();
  return OUTLINED_FUNCTION_1_23(v5, v6, v7, v8);
}

void sub_244342BAC(_BYTE *a1@<X8>)
{
  PhotosItemList.loadingStatus.getter(a1);
}

void PhotosItemList.loadingStatus.getter(_BYTE *a1@<X8>)
{
  *a1 = 2;
}

uint64_t OUTLINED_FUNCTION_2_21()
{
  return 0;
}

BOOL static PhotosItemListLoadingStatus.< infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 < *a2;
}

uint64_t PhotosItemListLoadingStatus.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t PhotosItemListLoadingStatus.description.getter()
{
  _BYTE *v0;
  uint64_t v1;

  v1 = 0x6465646172676564;
  if (*v0 != 1)
    v1 = 0x6574656C706D6F63;
  if (*v0)
    return v1;
  else
    return 0x6C6F686563616C70;
}

PhotosUIFoundation::PhotosItemListLoadingStatus_optional __swiftcall PhotosItemListLoadingStatus.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 3;
  if ((unint64_t)rawValue < 3)
    v2 = rawValue;
  *v1 = v2;
  return (PhotosUIFoundation::PhotosItemListLoadingStatus_optional)rawValue;
}

void sub_244342C6C()
{
  sub_2443455A8();
}

void sub_244342C74()
{
  sub_2443456AC();
}

PhotosUIFoundation::PhotosItemListLoadingStatus_optional sub_244342C7C(Swift::Int *a1)
{
  return PhotosItemListLoadingStatus.init(rawValue:)(*a1);
}

uint64_t sub_244342C84@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = PhotosItemListLoadingStatus.rawValue.getter();
  *a1 = result;
  return result;
}

BOOL sub_244342CB0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244342CBC(*a1, *a2);
}

BOOL sub_244342CBC(unsigned __int8 a1, unsigned __int8 a2)
{
  return a2 >= a1;
}

BOOL sub_244342CCC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244342CD8(*a1, *a2);
}

BOOL sub_244342CD8(unsigned __int8 a1, unsigned __int8 a2)
{
  return a1 >= a2;
}

BOOL sub_244342CE8(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_244342CF4(*a1, *a2);
}

BOOL sub_244342CF4(unsigned __int8 a1, unsigned __int8 a2)
{
  return a2 < a1;
}

BOOL PhotosItemList.isContentUnavailable.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  _BOOL8 v10;
  uint64_t v12;

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_2_4();
  v7 = v6 - v5;
  v9 = (*(uint64_t (**)(void))(v8 + 40))();
  OUTLINED_FUNCTION_15_2(v7, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 16));
  if ((v9 & 1) != 0)
  {
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a2 + 112))(&v12, a1, a2);
    v10 = v12 == 2;
    OUTLINED_FUNCTION_12_5();
  }
  else
  {
    OUTLINED_FUNCTION_12_5();
    return 0;
  }
  return v10;
}

uint64_t PhotosItemList.item<A>(nearest:)@<X0>(uint64_t a1@<X1>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a3;
  v29 = a4;
  v27 = a1;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = sub_24437A808();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v27 - v9;
  MEMORY[0x24BDAC7A8](v8);
  OUTLINED_FUNCTION_2_4();
  v13 = v12 - v11;
  v14 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v16 = MEMORY[0x24BDAC7A8](v15);
  MEMORY[0x24BDAC7A8](v16);
  v18 = (char *)&v27 - v17;
  OUTLINED_FUNCTION_15_2(v13, *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 16));
  if ((OUTLINED_FUNCTION_10_9() & 1) != 0)
  {
    OUTLINED_FUNCTION_17_1((uint64_t)v10, 0);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v18, v10, AssociatedTypeWitness);
    v20 = v28;
    v21 = v27;
    v22 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 96))(v18, v27, v28);
    v23 = v29;
    if ((v24 & 1) != 0)
    {
      OUTLINED_FUNCTION_9_7();
      v25 = 1;
    }
    else
    {
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 56))(v22, v21, v20);
      OUTLINED_FUNCTION_9_7();
      v25 = OUTLINED_FUNCTION_10_9() ^ 1;
    }
  }
  else
  {
    v25 = 1;
    OUTLINED_FUNCTION_17_1((uint64_t)v10, 1);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    v23 = v29;
  }
  return __swift_storeEnumTagSinglePayload(v23, v25, 1, a2);
}

Swift::Int_optional __swiftcall PhotosItemList.indexClosest(to:)(Swift::Int to)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t (*v6)();
  uint64_t v7;
  Swift::Int v8;
  Swift::Bool v9;
  Swift::Int v10;
  Swift::Int_optional result;

  v3 = v2;
  v4 = v1;
  v6 = *(uint64_t (**)())(v2 + 32);
  v7 = v6();
  if (v7 < 1)
  {
    v8 = 0;
  }
  else
  {
    v8 = ((uint64_t (*)(uint64_t, uint64_t))v6)(v4, v3);
    v10 = v8 - 1;
    if (__OFSUB__(v8, 1))
    {
      __break(1u);
      goto LABEL_9;
    }
    if (v10 >= to)
      v10 = to;
    v8 = v10 & ~(v10 >> 63);
  }
  v9 = v7 < 1;
LABEL_9:
  result.value = v8;
  result.is_nil = v9;
  return result;
}

void PhotosItemList.item(for:offset:)(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v8 = *(_QWORD *)(a2 - 8);
  MEMORY[0x24BDAC7A8](a1);
  OUTLINED_FUNCTION_2_4();
  v13 = v11 + v12;
  if (!__OFADD__(v11, v12))
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v10 - v9, v4, a2);
    if (v13 < 0)
    {
      OUTLINED_FUNCTION_5_12(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
    }
    else
    {
      v14 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
      OUTLINED_FUNCTION_5_12(*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8));
      if (v13 < v14)
      {
        OUTLINED_FUNCTION_4_16(v13);
        v15 = OUTLINED_FUNCTION_0_26();
        v16 = 0;
LABEL_7:
        __swift_storeEnumTagSinglePayload(a4, v16, 1, v15);
        return;
      }
    }
    v15 = OUTLINED_FUNCTION_0_26();
    v16 = 1;
    goto LABEL_7;
  }
  __break(1u);
}

uint64_t PhotosItemList.firstItem.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (OUTLINED_FUNCTION_8_12(a1, a2) >= 1)
    OUTLINED_FUNCTION_4_16(0);
  OUTLINED_FUNCTION_0_26();
  v2 = OUTLINED_FUNCTION_3_17();
  return OUTLINED_FUNCTION_1_23(v2, v3, v4, v5);
}

uint64_t PhotosItemList.lastItem.getter(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(void);
  uint64_t v5;
  BOOL v6;
  uint64_t result;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v4 = *(uint64_t (**)(void))(a2 + 32);
  if (v4() < 1)
    goto LABEL_4;
  v5 = ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
  v6 = __OFSUB__(v5, 1);
  result = v5 - 1;
  if (!v6)
  {
    OUTLINED_FUNCTION_4_16(result);
LABEL_4:
    OUTLINED_FUNCTION_0_26();
    v8 = OUTLINED_FUNCTION_3_17();
    return __swift_storeEnumTagSinglePayload(v8, v9, v10, v11);
  }
  __break(1u);
  return result;
}

uint64_t PhotosItemList.singleItem.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (OUTLINED_FUNCTION_8_12(a1, a2) == 1)
    OUTLINED_FUNCTION_4_16(0);
  OUTLINED_FUNCTION_0_26();
  v2 = OUTLINED_FUNCTION_3_17();
  return OUTLINED_FUNCTION_1_23(v2, v3, v4, v5);
}

unint64_t sub_24434327C()
{
  unint64_t result;

  result = qword_257358668;
  if (!qword_257358668)
  {
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PhotosItemListLoadingStatus, &type metadata for PhotosItemListLoadingStatus);
    atomic_store(result, (unint64_t *)&qword_257358668);
  }
  return result;
}

uint64_t dispatch thunk of PhotosItemList.numberOfItems.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PhotosItemList.isEmpty.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosItemList.itemIdentifiers.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of PhotosItemList.subscript.getter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

void dispatch thunk of PhotosItemList.index(for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a3 + 72))();
  OUTLINED_FUNCTION_13_5();
}

{
  OUTLINED_FUNCTION_14_3(a1, a2, a3);
  OUTLINED_FUNCTION_13_5();
}

uint64_t dispatch thunk of PhotosItemList.contains(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

void dispatch thunk of PhotosItemList.index(nearest:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(a3 + 96))();
  OUTLINED_FUNCTION_13_5();
}

uint64_t dispatch thunk of PhotosItemList.placeholderObject.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of PhotosItemList.loadingStatus.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 112))();
}

uint64_t dispatch thunk of PhotosItemList.loadingStatus(for:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 120))();
}

uint64_t getEnumTagSinglePayload for PhotosItemListLoadingStatus(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  unsigned int v6;
  BOOL v7;

  if (!a2)
  {
    v5 = -1;
    return (v5 + 1);
  }
  if (a2 >= 0xFE)
  {
    if (a2 + 2 >= 0xFFFF00)
      v2 = 4;
    else
      v2 = 2;
    if ((a2 + 2) >> 8 < 0xFF)
      v3 = 1;
    else
      v3 = v2;
    if (v3 == 4)
    {
      v4 = *(_DWORD *)(a1 + 1);
      if (!v4)
        goto LABEL_17;
    }
    else if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
    }
    else
    {
      v4 = a1[1];
      if (!a1[1])
        goto LABEL_17;
    }
    v5 = (*a1 | (v4 << 8)) - 3;
    return (v5 + 1);
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v5 = v6 - 3;
  if (!v7)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for PhotosItemListLoadingStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_24434342C + 4 * byte_24438AFB5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_244343460 + 4 * byte_24438AFB0[v4]))();
}

uint64_t sub_244343460(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244343468(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244343470);
  return result;
}

uint64_t sub_24434347C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244343484);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_244343488(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244343490(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for PhotosItemListLoadingStatus()
{
  return &type metadata for PhotosItemListLoadingStatus;
}

uint64_t OUTLINED_FUNCTION_0_26()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_1_23(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_storeEnumTagSinglePayload(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_3_17()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_4_16(uint64_t a1)
{
  uint64_t (*v1)(uint64_t, uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;

  return v1(a1, v2, v3);
}

uint64_t OUTLINED_FUNCTION_5_12@<X0>(uint64_t (*a1)(uint64_t, uint64_t)@<X8>)
{
  uint64_t v1;
  uint64_t v2;

  return a1(v1, v2);
}

uint64_t OUTLINED_FUNCTION_6_11(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t OUTLINED_FUNCTION_8_12(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t OUTLINED_FUNCTION_9_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v0 + 8))(v2, v1);
}

uint64_t OUTLINED_FUNCTION_10_9()
{
  return swift_dynamicCast();
}

uint64_t OUTLINED_FUNCTION_12_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_14_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t OUTLINED_FUNCTION_15_2@<X0>(uint64_t a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t, uint64_t)@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  return a2(a1, v3, v2);
}

uint64_t OUTLINED_FUNCTION_16_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_17_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t OUTLINED_FUNCTION_18_2()
{
  uint64_t v0;
  uint64_t v1;

  return sub_244324EB8(v0, v1 - 112);
}

double Duration.timeInterval.getter()
{
  uint64_t v0;
  uint64_t v1;

  v0 = sub_24437AB38();
  return (double)v1 / 1.0e18 + (double)v0;
}

uint64_t static Duration.minutes(_:)()
{
  return OUTLINED_FUNCTION_0_27();
}

uint64_t static Duration.hours(_:)()
{
  return OUTLINED_FUNCTION_0_27();
}

uint64_t OUTLINED_FUNCTION_0_27()
{
  return sub_24437AB44();
}

uint64_t PhotosItem.matches(itemReference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  char v8;
  __int128 v10[2];
  uint64_t v11;
  _BYTE v12[32];
  _QWORD v13[3];
  uint64_t v14;
  uint64_t v15;

  sub_244324EB8(a1, (uint64_t)v12);
  __swift_instantiateConcreteTypeFromMangledName(qword_257356BD0);
  if (swift_dynamicCast())
  {
    sub_2443277E8(v10, (uint64_t)v13);
    v5 = v14;
    v6 = v15;
    v7 = __swift_project_boxed_opaque_existential_1(v13, v14);
    v8 = PhotosItem.matchesID<A>(of:)((uint64_t)v7, a2, v5, a3, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v13);
  }
  else
  {
    v11 = 0;
    memset(v10, 0, sizeof(v10));
    sub_2443436A4((uint64_t)v10);
    v8 = 0;
  }
  return v8 & 1;
}

uint64_t sub_2443436A4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_257358670);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_2443436E4()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_244343700()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_4_17();
  return OUTLINED_FUNCTION_0_28(v0, v1);
}

uint64_t PhotosItem.analyticsDescription.getter(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v4);
  (*(void (**)(uint64_t, uint64_t))(a2 + 64))(a1, a2);
  return sub_24437A484();
}

void sub_24434379C()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_2443437B8()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1_24(v0);
}

uint64_t PhotosItem.diagnosticDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(char *))(v2 + 16))((char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  return sub_24437A484();
}

void sub_244343830()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_24434384C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_4_17();
  return OUTLINED_FUNCTION_0_28(v0, v1);
}

void sub_244343858()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_244343874()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1_24(v0);
}

void sub_244343880()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_24434389C()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_4_17();
  return OUTLINED_FUNCTION_0_28(v0, v1);
}

void sub_2443438A8()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_2443438C4()
{
  uint64_t v0;

  return OUTLINED_FUNCTION_1_24(v0);
}

void sub_2443438D0()
{
  OUTLINED_FUNCTION_2_22();
}

uint64_t sub_2443438EC()
{
  uint64_t v0;
  uint64_t v1;

  v0 = OUTLINED_FUNCTION_4_17();
  return OUTLINED_FUNCTION_0_28(v0, v1);
}

uint64_t PhotosItem.matchesID<A>(of:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  char v20;
  void (*v21)(char *, uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v26 = a2;
  v27 = a4;
  v7 = OUTLINED_FUNCTION_5_13();
  v8 = sub_24437A808();
  v24 = *(_QWORD *)(v8 - 8);
  v25 = v8;
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v23 - v10;
  OUTLINED_FUNCTION_5_13();
  OUTLINED_FUNCTION_4_10();
  v13 = MEMORY[0x24BDAC7A8](v12);
  v14 = *(_QWORD *)(v7 - 8);
  v15 = MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v23 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v15);
  v19 = (char *)&v23 - v18;
  (*(void (**)(uint64_t, uint64_t))(a5 + 64))(a3, a5);
  if (swift_dynamicCast())
  {
    OUTLINED_FUNCTION_6_12((uint64_t)v11, 0);
    (*(void (**)(char *, char *, uint64_t))(v14 + 32))(v19, v11, v7);
    (*(void (**)(uint64_t, uint64_t))(v27 + 64))(v26, v27);
    swift_getAssociatedConformanceWitness();
    v20 = sub_24437A454();
    v21 = *(void (**)(char *, uint64_t))(v14 + 8);
    v21(v17, v7);
    v21(v19, v7);
  }
  else
  {
    OUTLINED_FUNCTION_6_12((uint64_t)v11, 1);
    (*(void (**)(char *, uint64_t))(v24 + 8))(v11, v25);
    v20 = 0;
  }
  return v20 & 1;
}

uint64_t dispatch thunk of PhotosItem.id.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 64))();
}

uint64_t dispatch thunk of PhotosItem.value.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 72))();
}

uint64_t dispatch thunk of PhotosItem.matches(itemReference:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 80))();
}

uint64_t OUTLINED_FUNCTION_0_28(uint64_t a1, uint64_t a2)
{
  return PhotosItem.analyticsDescription.getter(a1, a2);
}

uint64_t OUTLINED_FUNCTION_1_24(uint64_t a1)
{
  return PhotosItem.diagnosticDescription.getter(a1);
}

void OUTLINED_FUNCTION_2_22()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t OUTLINED_FUNCTION_4_17()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_5_13()
{
  return swift_getAssociatedTypeWitness();
}

uint64_t OUTLINED_FUNCTION_6_12(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return __swift_storeEnumTagSinglePayload(a1, a2, 1, v2);
}

uint64_t ObservingUpdater.__allocating_init(target:updatePolicy:)(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;

  v4 = swift_allocObject();
  ObservingUpdater.init(target:updatePolicy:)(a1, a2);
  return v4;
}

_QWORD *ObservingUpdater.init(target:updatePolicy:)(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedTypeWitness;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;

  v3 = v2;
  v32 = a2;
  v34 = a1;
  v5 = v2 + 2;
  v4 = *v2;
  v6 = *(_QWORD *)(v4 + 88);
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24437A808();
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v25 - v11;
  v26 = *(_QWORD *)(v4 + 96);
  v13 = *(_QWORD *)(v26 + 8);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v14);
  v30 = (char *)&v25 - v15;
  v31 = v13;
  v29 = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v33 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v17);
  v19 = (char *)&v25 - v18;
  v20 = *v32;
  v27 = v32[1];
  v28 = v20;
  v32 = v5;
  swift_unknownObjectWeakInit();
  v21 = sub_24437A568();
  if (MEMORY[0x24950BEF4](v21, v6))
  {
    v22 = sub_2443445F0(v21, v6, *(_QWORD *)(v26 + 16));
  }
  else
  {
    swift_bridgeObjectRelease();
    v22 = MEMORY[0x24BEE4B08];
  }
  v3[3] = v28;
  v3[4] = v27;
  v3[5] = v22;
  swift_unknownObjectWeakAssign();
  sub_24437A8C8();
  sub_24437A4C0();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_3_18();
  if (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) != 1)
  {
    v23 = *(void (**)(char *, char *, uint64_t))(v7 + 32);
    do
    {
      v23(v9, v12, v6);
      sub_244344350();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
      OUTLINED_FUNCTION_3_18();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v12, 1, v6) != 1);
  }
  swift_unknownObjectRelease();
  (*(void (**)(char *, uint64_t))(v33 + 8))(v19, AssociatedTypeWitness);
  return v3;
}

uint64_t ObservingUpdater.__allocating_init(target:needsUpdateHandler:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4[2];

  v4[0] = a2;
  v4[1] = a3;
  return ObservingUpdater.__allocating_init(target:updatePolicy:)(a1, v4);
}

void sub_244343E8C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  _QWORD v16[4];
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;

  v2 = *v1;
  v16[3] = v1 + 5;
  v3 = *(_QWORD *)(v2 + 88);
  v19 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v5 = (char *)v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24437A808();
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)v16 - v7;
  v16[1] = *(_QWORD *)(*(_QWORD *)(v2 + 96) + 8);
  swift_getAssociatedTypeWitness();
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v9);
  v16[2] = (char *)v16 - v10;
  v16[0] = *(_QWORD *)(swift_getAssociatedConformanceWitness() + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v17 = *(_QWORD *)(AssociatedTypeWitness - 8);
  OUTLINED_FUNCTION_4_10();
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)v16 - v13;
  v18 = v1;
  sub_244344574();
  OUTLINED_FUNCTION_2_9();
  sub_24437A688();
  sub_24437A67C();
  swift_endAccess();
  sub_24437A8C8();
  sub_24437A4C0();
  swift_getAssociatedConformanceWitness();
  OUTLINED_FUNCTION_2_23();
  if (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v3) != 1)
  {
    v15 = *(void (**)(char *, char *, uint64_t))(v19 + 32);
    do
    {
      v15(v5, v8, v3);
      if ((sub_24437A670() & 1) != 0)
        sub_244344350();
      (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v3);
      OUTLINED_FUNCTION_2_23();
    }
    while (__swift_getEnumTagSinglePayload((uint64_t)v8, 1, v3) != 1);
  }
  (*(void (**)(char *, uint64_t))(v17 + 8))(v14, AssociatedTypeWitness);
  swift_bridgeObjectRelease();
  OUTLINED_FUNCTION_1();
}

void sub_244344120(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;

  v3 = *v1;
  v4 = *(_QWORD *)(*v1 + 88);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v10 = (char *)&v13 - v9;
  sub_244344574();
  v14 = *(_QWORD *)(v3 + 96);
  v15 = sub_24437A664();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, a1, v4);
  OUTLINED_FUNCTION_2_9();
  sub_24437A688();
  sub_24437A64C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
  swift_endAccess();
  if ((v15 & 1) != 0)
  {
    v11 = v1[3];
    v12 = v1[4];
    v16 = v11;
    v17 = v12;
    sub_24432ED10(v11);
    type metadata accessor for ObservingUpdater.UpdatePolicy(0, *(_QWORD *)(v3 + 80), v4, v14);
    sub_244344280((uint64_t)v1);
    sub_24432ED20(v11);
  }
  OUTLINED_FUNCTION_1();
}

void sub_244344280(uint64_t a1)
{
  void (**v1)(uint64_t);
  void (*v3)(uint64_t);
  void *v4;
  _QWORD v5[6];

  v3 = *v1;
  if (*v1)
  {
    swift_retain();
    v3(a1);
    sub_24432ED20((uint64_t)v3);
  }
  else
  {
    v5[4] = sub_244344AAC;
    v5[5] = a1;
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 1107296256;
    v5[2] = sub_244321468;
    v5[3] = &block_descriptor_6;
    v4 = _Block_copy(v5);
    swift_retain();
    swift_release();
    px_perform_on_main_runloop(1, v4);
    _Block_release(v4);
  }
}

uint64_t sub_244344350()
{
  uint64_t v0;
  uint64_t result;
  uint64_t v2;

  result = MEMORY[0x24950D424](v0 + 16);
  if (result)
  {
    v2 = MEMORY[0x24BDAC7A8](result);
    MEMORY[0x24BDAC7A8](v2);
    sub_24437A2B0();
    return swift_unknownObjectRelease();
  }
  return result;
}

uint64_t (*sub_244344414(uint64_t *a1, uint64_t a2))()
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char *v9;
  uint64_t v11;

  v3 = *a1;
  v4 = *(_QWORD *)(*a1 + 88);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v7 = swift_allocObject();
  swift_weakInit();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a2, v4);
  v8 = (*(unsigned __int8 *)(v5 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  v9 = (char *)swift_allocObject();
  *((_QWORD *)v9 + 2) = *(_QWORD *)(v3 + 80);
  *((_QWORD *)v9 + 3) = v4;
  *((_QWORD *)v9 + 4) = *(_QWORD *)(v3 + 96);
  *((_QWORD *)v9 + 5) = v7;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v9[v8], (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  return sub_244344B9C;
}

uint64_t sub_244344510(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    sub_244344120(a2);
    return swift_release();
  }
  return result;
}

void sub_24434456C()
{
  JUMPOUT(0x24950D424);
}

uint64_t sub_244344574()
{
  OUTLINED_FUNCTION_2_9();
  return swift_bridgeObjectRetain();
}

uint64_t ObservingUpdater.deinit()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  sub_24432ED20(*(_QWORD *)(v0 + 24));
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t ObservingUpdater.__deallocating_deinit()
{
  ObservingUpdater.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_2443445F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  uint64_t (*v18)(char *, unint64_t, uint64_t);
  uint64_t result;
  BOOL v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void (*v33)(char *, uint64_t);
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x24BDAC7A8](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x24BDAC7A8](v6);
  v44 = (char *)&v37 - v10;
  v37 = v11;
  v12 = MEMORY[0x24BDAC7A8](v9);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x24950BEB8](v12))
  {
    sub_24437A8A4();
    v15 = sub_24437A898();
  }
  else
  {
    v15 = MEMORY[0x24BEE4B08];
  }
  v40 = MEMORY[0x24950BEF4](v5, a2);
  if (v40)
  {
    v16 = 0;
    v43 = v15 + 56;
    v38 = v14;
    v39 = v5;
    while (1)
    {
      v17 = sub_24437A580();
      sub_24437A550();
      if ((v17 & 1) != 0)
      {
        v18 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v45 + 16);
        result = v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      }
      else
      {
        result = sub_24437A8D4();
        if (v37 != 8)
          goto LABEL_24;
        v46 = result;
        v18 = *(uint64_t (**)(char *, unint64_t, uint64_t))(v45 + 16);
        v18(v14, (unint64_t)&v46, a2);
        result = swift_unknownObjectRelease();
      }
      v20 = __OFADD__(v16, 1);
      v21 = v16 + 1;
      if (v20)
        break;
      v22 = v45;
      v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
      v42 = v21;
      v41(v44, v14, a2);
      v23 = sub_24437A400();
      v24 = -1 << *(_BYTE *)(v15 + 32);
      v25 = v23 & ~v24;
      v26 = v25 >> 6;
      v27 = *(_QWORD *)(v43 + 8 * (v25 >> 6));
      v28 = 1 << v25;
      v29 = *(_QWORD *)(v22 + 72);
      if (((1 << v25) & v27) != 0)
      {
        v30 = ~v24;
        while (1)
        {
          v18(v8, *(_QWORD *)(v15 + 48) + v29 * v25, a2);
          v31 = a3;
          v32 = sub_24437A454();
          v33 = *(void (**)(char *, uint64_t))(v45 + 8);
          v33(v8, a2);
          if ((v32 & 1) != 0)
            break;
          v25 = (v25 + 1) & v30;
          v26 = v25 >> 6;
          v27 = *(_QWORD *)(v43 + 8 * (v25 >> 6));
          v28 = 1 << v25;
          a3 = v31;
          if ((v27 & (1 << v25)) == 0)
          {
            v14 = v38;
            v5 = v39;
            goto LABEL_14;
          }
        }
        v33(v44, a2);
        a3 = v31;
        v14 = v38;
        v5 = v39;
      }
      else
      {
LABEL_14:
        v34 = v44;
        *(_QWORD *)(v43 + 8 * v26) = v28 | v27;
        result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v29 * v25, v34, a2);
        v35 = *(_QWORD *)(v15 + 16);
        v20 = __OFADD__(v35, 1);
        v36 = v35 + 1;
        if (v20)
          goto LABEL_23;
        *(_QWORD *)(v15 + 16) = v36;
      }
      v16 = v42;
      if (v42 == v40)
        goto LABEL_21;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    __break(1u);
  }
  else
  {
LABEL_21:
    swift_bridgeObjectRelease();
    return v15;
  }
  return result;
}

uint64_t type metadata accessor for ObservingUpdater.UpdatePolicy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObservingUpdater.UpdatePolicy);
}

uint64_t sub_244344908()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for ObservingUpdater(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for ObservingUpdater);
}

uint64_t method lookup function for ObservingUpdater()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of ObservingUpdater.__allocating_init(target:updatePolicy:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 128))();
}

uint64_t dispatch thunk of ObservingUpdater.updateIfNeeded()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t dispatch thunk of ObservingUpdater.invalidate(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

_QWORD *sub_244344998(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;

  if (*a1 < 0xFFFFFFFFuLL)
    goto LABEL_5;
  if (*(_QWORD *)a2 < 0xFFFFFFFFuLL)
  {
    swift_release();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_release();
  return a1;
}

uint64_t sub_244344A00(uint64_t *a1, unsigned int a2)
{
  uint64_t v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *((_BYTE *)a1 + 16))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  if ((v3 + 1) >= 2)
    return v3;
  else
    return 0;
}

uint64_t sub_244344A50(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)result = a2;
  }
  return result;
}

uint64_t dispatch thunk of ObservingUpdaterEntity.update(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t sub_244344AC8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  v1 = v0[3];
  v2 = v0[4];
  v4 = v0[6];
  return (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 32))(&v4, v1);
}

uint64_t (*sub_244344B04())()
{
  uint64_t v0;

  return sub_244344414(*(uint64_t **)(v0 + 16), *(_QWORD *)(v0 + 24));
}

uint64_t sub_244344B0C()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_244344B30()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_244344B9C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 24) - 8) + 80);
  return sub_244344510(*(_QWORD *)(v0 + 40), v0 + ((v1 + 48) & ~v1));
}

uint64_t OUTLINED_FUNCTION_2_23()
{
  return sub_24437A814();
}

uint64_t OUTLINED_FUNCTION_3_18()
{
  return sub_24437A814();
}

uint64_t dispatch thunk of PhotosDiagnosticsProvider.diagnosticDescription.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

void sub_244344BF0()
{
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_6_13();
}

void sub_244344C10()
{
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_31();
}

id PhotosComposedObservable<>.observeChanges(using:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  void *v12;

  OUTLINED_FUNCTION_7_7();
  (*(void (**)(void **__return_ptr, uint64_t, uint64_t))(v4 + 32))(&v12, v5, v4);
  v6 = v12;
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v1;
  v7[3] = v0;
  v7[4] = v3;
  v7[5] = v2;
  v8 = objc_allocWithZone((Class)type metadata accessor for PXObservableObservation());
  swift_retain();
  v9 = v6;
  swift_retain();
  v10 = sub_244335DF0(v9, (uint64_t)sub_244345018, (uint64_t)v7);

  swift_release();
  return v10;
}

void PhotosMutableComposedObservable<>.performChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unint64_t v14;
  char *v15;
  void *v16;
  _QWORD aBlock[6];
  void *v19;

  v9 = *(_QWORD *)(a3 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x24BDAC7A8](a1);
  (*(void (**)(void **__return_ptr, uint64_t))(*(_QWORD *)(v11 + 8) + 32))(&v19, v12);
  v13 = v19;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), v4, a3);
  v14 = (*(unsigned __int8 *)(v9 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v15 = (char *)swift_allocObject();
  *((_QWORD *)v15 + 2) = a3;
  *((_QWORD *)v15 + 3) = a4;
  *((_QWORD *)v15 + 4) = a1;
  *((_QWORD *)v15 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v15[v14], (char *)&aBlock[-1] - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a3);
  aBlock[4] = sub_2443450EC;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x24BDAC760];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_244335B14;
  aBlock[3] = &block_descriptor_7;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  objc_msgSend(v13, sel_performChanges_, v16);
  _Block_release(v16);

  OUTLINED_FUNCTION_1();
}

void sub_244344E3C()
{
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_6_13();
}

void sub_244344E5C()
{
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_31();
}

void sub_244344E70()
{
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_6_13();
}

void sub_244344E90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_3_19(v0, v1, v2, v3);
}

void sub_244344E9C()
{
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_6_13();
}

void sub_244344EBC()
{
  OUTLINED_FUNCTION_0_29();
  OUTLINED_FUNCTION_31();
}

void sub_244344ED0()
{
  OUTLINED_FUNCTION_1_25();
  OUTLINED_FUNCTION_6_13();
}

void sub_244344EF0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v0 = OUTLINED_FUNCTION_8_13();
  OUTLINED_FUNCTION_3_19(v0, v1, v2, v3);
}

uint64_t sub_244344EFC(uint64_t a1, uint64_t a2, void (*a3)(char *))
{
  uint64_t AssociatedTypeWitness;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  _QWORD v10[2];

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v6 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v8 = (char *)v10 - v7;
  v10[1] = a2;
  swift_getAssociatedConformanceWitness();
  sub_24437AA54();
  a3(v8);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, AssociatedTypeWitness);
}

uint64_t sub_244344FF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_244345018(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_244344EFC(a1, a2, *(void (**)(char *))(v2 + 32));
}

uint64_t sub_244345024(uint64_t a1, void (*a2)(char *), uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v14;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v10 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v12 = (char *)&v14 - v11;
  (*(void (**)(uint64_t, uint64_t))(a6 + 24))(a5, a6);
  a2(v12);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, AssociatedTypeWitness);
}

uint64_t sub_2443450EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80);
  return sub_244345024(a1, *(void (**)(char *))(v1 + 32), *(_QWORD *)(v1 + 40), v1 + ((v3 + 48) & ~v3), v2, *(_QWORD *)(v1 + 24));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t PhotosComposedObservable<>.observeChanges(using:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t AssociatedTypeWitness;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t AssociatedConformanceWitness;
  uint64_t v9;
  uint64_t v11;

  OUTLINED_FUNCTION_7_7();
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v5 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v7 = (char *)&v11 - v6;
  (*(void (**)(uint64_t, uint64_t))(v0 + 32))(v1, v0);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(AssociatedConformanceWitness + 24))(v3, v2, AssociatedTypeWitness, AssociatedConformanceWitness);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, AssociatedTypeWitness);
  return v9;
}

void PhotosMutableComposedObservable.performChanges(using:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t AssociatedTypeWitness;
  uint64_t v14;
  char *v15;
  unint64_t v16;
  char *v17;
  uint64_t AssociatedConformanceWitness;
  void (*v19)(uint64_t (*)(), char *, uint64_t, uint64_t);
  uint64_t v20;
  uint64_t v21;

  v20 = a1;
  v8 = *(_QWORD *)(a3 - 8);
  v9 = *(_QWORD *)(v8 + 64);
  MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = *(_QWORD *)(v11 + 8);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v21 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v15 = (char *)&v20 - v14;
  (*(void (**)(uint64_t, uint64_t))(v12 + 32))(a3, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a3);
  v16 = (*(unsigned __int8 *)(v8 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = a3;
  *((_QWORD *)v17 + 3) = a4;
  *((_QWORD *)v17 + 4) = v20;
  *((_QWORD *)v17 + 5) = a2;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v17[v16], v10, a3);
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v19 = *(void (**)(uint64_t (*)(), char *, uint64_t, uint64_t))(AssociatedConformanceWitness + 32);
  swift_retain();
  v19(sub_2443454CC, v17, AssociatedTypeWitness, AssociatedConformanceWitness);
  swift_release();
  (*(void (**)(char *, uint64_t))(v21 + 8))(v15, AssociatedTypeWitness);
  OUTLINED_FUNCTION_1();
}

uint64_t sub_244345398(void (*a1)(char *), uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v13;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v9 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x24BDAC7A8](AssociatedTypeWitness);
  v11 = (char *)&v13 - v10;
  (*(void (**)(uint64_t, uint64_t))(a5 + 24))(a4, a5);
  a1(v11);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, AssociatedTypeWitness);
}

uint64_t objectdestroy_2Tm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_2443454CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_244345398(*(void (**)(char *))(v0 + 32), *(_QWORD *)(v0 + 40), v0 + ((v2 + 48) & ~v2), v1, *(_QWORD *)(v0 + 24));
}

uint64_t dispatch thunk of PhotosObservableMutating.observable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of PhotosComposedObservable.observable.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of PhotosComposedObservable.signalWillChange()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of PhotosObservableImplementation.performChanges(_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of PhotosObservableImplementation.signalChange(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of PhotosMutableComposedObservable.createMutator()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

id OUTLINED_FUNCTION_0_29()
{
  return PhotosComposedObservable<>.observeChanges(using:)();
}

void OUTLINED_FUNCTION_3_19(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  PhotosMutableComposedObservable<>.performChanges(using:)(a1, a2, a3, a4);
}

uint64_t OUTLINED_FUNCTION_5_14(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 24))();
}

void OUTLINED_FUNCTION_6_13()
{
  JUMPOUT(0x24950D28CLL);
}

uint64_t OUTLINED_FUNCTION_8_13()
{
  uint64_t v0;

  return v0;
}

BOOL PXSimpleIndexPath.isNull.getter(uint64_t a1)
{
  return a1 == 0;
}

void sub_2443455A8()
{
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_6_14();
}

uint64_t sub_2443455D0(char a1)
{
  _BYTE v3[72];

  sub_24437AAFC();
  sub_244345614((uint64_t)v3, a1);
  return sub_24437AB14();
}

void sub_244345614(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_244345658()
{
  sub_24437A490();
  return swift_bridgeObjectRelease();
}

void sub_2443456AC()
{
  sub_24437AAFC();
  OUTLINED_FUNCTION_8_14();
  OUTLINED_FUNCTION_7_8();
  OUTLINED_FUNCTION_6_14();
}

uint64_t sub_2443456D8(uint64_t a1, char a2)
{
  _BYTE v4[72];

  sub_24437AAFC();
  sub_244345614((uint64_t)v4, a2);
  return sub_24437AB14();
}

BOOL static PXSimpleIndexPath.== infix(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

double sub_244345730()
{
  double result;

  result = *(double *)&PXSimpleIndexPathNull;
  xmmword_257358678 = PXSimpleIndexPathNull;
  *(_OWORD *)&qword_257358688 = unk_24438BB80;
  return result;
}

uint64_t static PXSimpleIndexPath.null.getter()
{
  if (qword_257357020 != -1)
    swift_once();
  return xmmword_257358678;
}

uint64_t sub_244345794()
{
  unint64_t v0;

  v0 = sub_24437AA18();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

uint64_t sub_2443457E0(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_2_24
                                                                     + 4 * byte_24438B394[a1]))(0xD000000000000014, 0x8000000244382270);
}

uint64_t sub_244345820()
{
  return 0x6D657469627573;
}

uint64_t sub_244345838(unsigned __int8 a1)
{
  return ((uint64_t (*)(unint64_t, unint64_t))((char *)j__OUTLINED_FUNCTION_2_24_0
                                                                     + 4 * byte_24438B398[a1]))(0xD000000000000014, 0x8000000244382270);
}

uint64_t sub_244345878()
{
  return 0x6D657469627573;
}

BOOL sub_244345890(uint64_t *a1, uint64_t *a2)
{
  return static PXSimpleIndexPath.== infix(_:_:)(*a1, a1[1], a1[2], a1[3], *a2, a2[1], a2[2], a2[3]);
}

void sub_2443458AC(char *a1)
{
  sub_244322D5C(*a1);
}

uint64_t sub_2443458B8()
{
  char *v0;

  return sub_2443455D0(*v0);
}

void sub_2443458C0(uint64_t a1)
{
  char *v1;

  sub_244345614(a1, *v1);
}

uint64_t sub_2443458C8(uint64_t a1)
{
  char *v1;

  return sub_2443456D8(a1, *v1);
}

uint64_t sub_2443458D0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_244345794();
  *a1 = result;
  return result;
}

uint64_t sub_2443458FC@<X0>(uint64_t *a1@<X8>)
{
  unsigned __int8 *v1;
  uint64_t result;
  uint64_t v4;

  result = sub_2443457E0(*v1);
  *a1 = result;
  a1[1] = v4;
  return result;
}

uint64_t sub_244345924()
{
  unsigned __int8 *v0;

  return sub_244345838(*v0);
}

uint64_t sub_24434592C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_2443457DC();
  *a1 = result;
  return result;
}

void sub_244345950(_BYTE *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_24434595C()
{
  sub_244345AF4();
  return sub_24437AB50();
}

uint64_t sub_244345984()
{
  sub_244345AF4();
  return sub_24437AB5C();
}

uint64_t PXSimpleIndexPath.encode(to:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[2];
  char v13;
  char v14;
  char v15;
  char v16;

  v12[0] = a5;
  v12[1] = a3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_257358698);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)v12 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244345AF4();
  sub_24437AB2C();
  v16 = 0;
  OUTLINED_FUNCTION_0_30();
  if (!v5)
  {
    v15 = 1;
    OUTLINED_FUNCTION_0_30();
    v14 = 2;
    OUTLINED_FUNCTION_0_30();
    v13 = 3;
    OUTLINED_FUNCTION_0_30();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

unint64_t sub_244345AF4()
{
  unint64_t result;

  result = qword_2573586A0;
  if (!qword_2573586A0)
  {
    result = MEMORY[0x24950D28C](&unk_24438B570, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2573586A0);
  }
  return result;
}

uint64_t PXSimpleIndexPath.init(from:)(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2573586A8);
  MEMORY[0x24BDAC7A8](v2);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_244345AF4();
  sub_24437AB20();
  v3 = OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_1_26();
  OUTLINED_FUNCTION_3_20();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v3;
}

uint64_t sub_244345C90@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = PXSimpleIndexPath.init(from:)(a1);
  if (!v2)
  {
    *a2 = result;
    a2[1] = v5;
    a2[2] = v6;
    a2[3] = v7;
  }
  return result;
}

uint64_t sub_244345CBC(_QWORD *a1)
{
  uint64_t *v1;

  return PXSimpleIndexPath.encode(to:)(a1, *v1, v1[1], v1[2], v1[3]);
}

uint64_t PXSimpleIndexPath.hash(into:)()
{
  sub_24437AB08();
  sub_24437AB08();
  sub_24437AB08();
  return sub_24437AB08();
}

uint64_t PXSimpleIndexPath.hashValue.getter()
{
  OUTLINED_FUNCTION_4_0();
  sub_24437AB08();
  sub_24437AB08();
  sub_24437AB08();
  sub_24437AB08();
  return OUTLINED_FUNCTION_7_8();
}

uint64_t sub_244345DA0()
{
  return PXSimpleIndexPath.hashValue.getter();
}

uint64_t sub_244345DAC()
{
  return PXSimpleIndexPath.hash(into:)();
}

uint64_t sub_244345DB8()
{
  sub_24437AAFC();
  sub_24437AB08();
  sub_24437AB08();
  sub_24437AB08();
  sub_24437AB08();
  return sub_24437AB14();
}

unint64_t sub_244345E34()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2573586B0;
  if (!qword_2573586B0)
  {
    type metadata accessor for PXSimpleIndexPath(255);
    result = MEMORY[0x24950D28C](&protocol conformance descriptor for PXSimpleIndexPath, v1);
    atomic_store(result, (unint64_t *)&qword_2573586B0);
  }
  return result;
}

uint64_t _s10CodingKeysOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_244345EC0 + 4 * byte_24438B3A1[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_244345EF4 + 4 * byte_24438B39C[v4]))();
}

uint64_t sub_244345EF4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_244345EFC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x244345F04);
  return result;
}

uint64_t sub_244345F10(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x244345F18);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_244345F1C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_244345F24(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10CodingKeysOMa()
{
  return &_s10CodingKeysON;
}

unint64_t sub_244345F44()
{
  unint64_t result;

  result = qword_2573586B8;
  if (!qword_2573586B8)
  {
    result = MEMORY[0x24950D28C](&unk_24438B548, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2573586B8);
  }
  return result;
}

unint64_t sub_244345F84()
{
  unint64_t result;

  result = qword_2573586C0;
  if (!qword_2573586C0)
  {
    result = MEMORY[0x24950D28C](&unk_24438B480, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2573586C0);
  }
  return result;
}

unint64_t sub_244345FC4()
{
  unint64_t result;

  result = qword_2573586C8;
  if (!qword_2573586C8)
  {
    result = MEMORY[0x24950D28C](&unk_24438B4A8, &_s10CodingKeysON);
    atomic_store(result, (unint64_t *)&qword_2573586C8);
  }
  return result;
}

uint64_t OUTLINED_FUNCTION_0_30()
{
  return sub_24437AA30();
}

uint64_t OUTLINED_FUNCTION_1_26()
{
  return sub_24437AA24();
}

uint64_t OUTLINED_FUNCTION_2_24()
{
  return 0x6E6F6974636573;
}

uint64_t OUTLINED_FUNCTION_3_20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(v1, v0);
}

uint64_t OUTLINED_FUNCTION_4_18()
{
  return 1835365481;
}

uint64_t OUTLINED_FUNCTION_7_8()
{
  return sub_24437AB14();
}

uint64_t OUTLINED_FUNCTION_8_14()
{
  return sub_24437AB08();
}

CGImageRef PXCreateCGImageFromImageSourceWithMaxPixelSize(CGImageSource *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const __CFDictionary *v5;
  CGImageRef ThumbnailAtIndex;
  _QWORD v8[5];
  _QWORD v9[6];

  v9[5] = *MEMORY[0x24BDAC8D0];
  v2 = *MEMORY[0x24BDD9778];
  v8[0] = *MEMORY[0x24BDD97D0];
  v8[1] = v2;
  v9[0] = MEMORY[0x24BDBD1C0];
  v9[1] = MEMORY[0x24BDBD1C8];
  v3 = *MEMORY[0x24BDD9788];
  v8[2] = *MEMORY[0x24BDD97D8];
  v8[3] = v3;
  v9[2] = MEMORY[0x24BDBD1C8];
  v9[3] = MEMORY[0x24BDBD1C8];
  v8[4] = *MEMORY[0x24BDD9808];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[4] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 5);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, 0, v5);
  return ThumbnailAtIndex;
}

CGContext *PXCreateContext(int a1, unint64_t a2, int a3, double a4, double a5)
{
  double v8;
  double v9;
  double v10;
  CGColorSpace *v12;
  uint32_t v13;
  size_t v14;
  size_t AlignedBytesPerRow;
  CGContext *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CGRect v22;

  v8 = round(a4);
  v9 = round(a5);
  v10 = 1.0 - v8;
  if (1.0 - v9 <= 0.00000011920929 && v10 <= 0.00000011920929)
  {
    if (!a2)
    {
LABEL_20:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v10);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContext(CGSize, BOOL, PXGColorSpaceName, BOOL)");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "handleFailureInFunction:file:lineNumber:description:", v21, CFSTR("CGImage+PhotosUIFoundation.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("colorSpaceName != PXGColorSpaceUndefined"));

      v12 = (CGColorSpace *)colorspaces[0];
      if (!colorspaces[0])
        colorspaces[0] = 0;
      if (a1)
        v13 = 5;
      else
        v13 = 1;
      goto LABEL_15;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v10);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGContextRef  _Nonnull PXCreateContext(CGSize, BOOL, PXGColorSpaceName, BOOL)");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, CFSTR("CGImage+PhotosUIFoundation.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!PXPixelSizeAreaIsZero(roundedSize)"));

    if (!a2)
      goto LABEL_20;
  }
  v12 = PXGetColorSpace(a2);
  if (a1)
    v13 = 5;
  else
    v13 = 1;
  if (a3 && (a2 > 0xF) | (0x6F60u >> a2) & 1)
  {
    v13 |= 0x1100u;
    v14 = 16;
  }
  else
  {
    if (a2 <= 0xF && ((0xAu >> a2) & 1) == 0)
    {
LABEL_15:
      v13 |= 0x4000u;
      v14 = 8;
      goto LABEL_18;
    }
    v14 = 8;
  }
LABEL_18:
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow();
  v16 = CGBitmapContextCreate(0, (unint64_t)v8, (unint64_t)v9, v14, AlignedBytesPerRow, v12, v13);
  v22.size.width = (double)(unint64_t)v8;
  v22.size.height = (double)(unint64_t)v9;
  v22.origin.x = 0.0;
  v22.origin.y = 0.0;
  CGContextClearRect(v16, v22);
  return v16;
}

const __CFString *PXScrollViewSpeedometerRegimeDescription(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) > 4)
    return CFSTR("???");
  else
    return off_2514CF2C0[a1 + 1];
}

id PFAssetsDataSourceCountsGetLog()
{
  if (PFAssetsDataSourceCountsGetLog_predicate != -1)
    dispatch_once(&PFAssetsDataSourceCountsGetLog_predicate, &__block_literal_global_630);
  return (id)PFAssetsDataSourceCountsGetLog_log;
}

void PXDeferredDealloc(void *a1)
{
  id v1;
  _QWORD block[4];
  id v3;

  v1 = a1;
  if (v1)
  {
    if (PXDeferredDealloc_onceToken != -1)
      dispatch_once(&PXDeferredDealloc_onceToken, &__block_literal_global_686);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __PXDeferredDealloc_block_invoke_2;
    block[3] = &unk_2514D11A8;
    v3 = v1;
    dispatch_async(MEMORY[0x24BDAC9B8], block);

  }
}

id PXLocalizedVideoDuration(void *a1, double a2)
{
  id v3;
  double v4;
  double v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  v3 = a1;
  if (!v3)
    v3 = objc_alloc_init(MEMORY[0x24BDD14F8]);
  v4 = round(a2);
  if (v4 >= 0.0)
    v5 = v4;
  else
    v5 = -v4;
  v6 = objc_msgSend(v3, "allowedUnits");
  v7 = objc_msgSend(v3, "zeroFormattingBehavior");
  v8 = objc_msgSend(v3, "unitsStyle");
  if (v5 > -3600.0 && v5 < 3600.0)
    v10 = 192;
  else
    v10 = 224;
  objc_msgSend(v3, "setAllowedUnits:", v10);
  objc_msgSend(v3, "setZeroFormattingBehavior:", 0);
  objc_msgSend(v3, "setUnitsStyle:", 0);
  objc_msgSend(v3, "stringFromTimeInterval:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 < 0.0)
  {
    objc_msgSend(CFSTR("-"), "stringByAppendingString:", v11);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v12;
  }
  objc_msgSend(v3, "setAllowedUnits:", v6);
  objc_msgSend(v3, "setZeroFormattingBehavior:", v7);
  objc_msgSend(v3, "setUnitsStyle:", v8);

  return v11;
}

void sub_24434A238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CFMutableArrayRef PXCreateMutableIntegerArrayRef(CFIndex capacity)
{
  CFArrayCallBacks v2;

  *(_OWORD *)&v2.version = xmmword_2514CF3E0;
  *(_OWORD *)&v2.release = unk_2514CF3F0;
  v2.equal = 0;
  return CFArrayCreateMutable(0, capacity, &v2);
}

CFStringRef _indexArrayCopyDescription(uint64_t a1)
{
  return CFStringCreateWithFormat(0, 0, CFSTR("%lu"), a1);
}

uint64_t PXFirstIndexInSortedRangePassingTest(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unsigned int (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = (unsigned int (**)(_QWORD, _QWORD))v5;
  if (!a2)
    goto LABEL_11;
  if (((*((uint64_t (**)(id, uint64_t))v5 + 2))(v5, a1) & 1) != 0)
  {
    v7 = a1;
    goto LABEL_12;
  }
  v7 = a2 + a1 - 1;
  if (!v6[2](v6, v7))
  {
LABEL_11:
    v7 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_12;
  }
  while (a1 < v7 - 1)
  {
    v8 = v7 - a1;
    if (v7 < a1)
      ++v8;
    v9 = a1 + (v8 >> 1);
    if (v6[2](v6, v9))
      v7 = v9;
    else
      a1 = v9;
  }
LABEL_12:

  return v7;
}

uint64_t PXLastIndexInSortedRangePassingTest(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  unsigned int (**v6)(_QWORD, _QWORD);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v5 = a3;
  v6 = (unsigned int (**)(_QWORD, _QWORD))v5;
  if (a2 && (*((unsigned int (**)(id, uint64_t))v5 + 2))(v5, a1))
  {
    v7 = a2 + a1 - 1;
    if ((((uint64_t (*)(_QWORD, uint64_t))v6[2])(v6, v7) & 1) != 0)
    {
      a1 = v7;
    }
    else
    {
      while (a1 < v7 - 1)
      {
        v8 = v7 - a1;
        if (v7 < a1)
          ++v8;
        v9 = a1 + (v8 >> 1);
        if (v6[2](v6, v9))
          a1 = v9;
        else
          v7 = v9;
      }
    }
  }
  else
  {
    a1 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return a1;
}

id PXFilterArrayForObjectsOfClass(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v1, "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7);
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v2, "addObject:", v8, (_QWORD)v10);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id PXArrayByMovingObjectFromIndexToIndex(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  void *v6;

  v5 = (void *)objc_msgSend(a1, "mutableCopy");
  objc_msgSend(v5, "objectAtIndex:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectAtIndex:", a2);
  objc_msgSend(v5, "insertObject:atIndex:", v6, a3);

  return v5;
}

id PXArrayFromFrequencySortAndDeduplicationOfNSStringSet(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v1 = a1;
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __PXArrayFromFrequencySortAndDeduplicationOfNSStringSet_block_invoke;
  v6[3] = &unk_2514CF410;
  v7 = v1;
  v3 = v1;
  objc_msgSend(v2, "sortedArrayUsingComparator:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id PXArrayRotate(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = objc_msgSend(v3, "count");
  if (a2 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSArray * _Nonnull PXArrayRotate(NSArray *__strong _Nonnull, NSInteger)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("NSArray+PhotosUIFoundation.m"), 170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("rotationLength >= 0"));

  }
  v5 = (uint64_t)fmod((double)a2, (double)v4);
  if (v5)
    v6 = v4 == 0;
  else
    v6 = 1;
  if (v6)
  {
    v7 = (void *)objc_msgSend(v3, "copy");
  }
  else
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", v4);
    objc_msgSend(v3, "subarrayWithRange:", v5, v4 - v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v8);

    objc_msgSend(v3, "subarrayWithRange:", 0, v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v9);

  }
  return v7;
}

const __CFString *PXUserInterfaceLayoutDirectionDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("??");
  else
    return off_2514CF430[a1];
}

uint64_t PXFlipLayoutDirection(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v5;
  void *v6;

  if (a1 == 1)
    return 2;
  if (a1 != 2)
  {
    if (!a1)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PXUserInterfaceLayoutDirection PXFlipLayoutDirection(PXUserInterfaceLayoutDirection)");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("PXUserInterfaceLayoutDirection.m"), 28, CFSTR("Unable to flip unspecified layout direction"));

      abort();
    }
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PXUserInterfaceLayoutDirection PXFlipLayoutDirection(PXUserInterfaceLayoutDirection)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("PXUserInterfaceLayoutDirection.m"), 34, CFSTR("Unknown layout direction %ti"), a1);

    abort();
  }
  return 1;
}

uint64_t PXLeadingRectEdge(uint64_t result)
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  if (result == 1)
    return 0;
  if (result != 2)
  {
    if (!result)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRectEdge PXLeadingRectEdge(PXUserInterfaceLayoutDirection)");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PXUserInterfaceLayoutDirection.m"), 40, CFSTR("Unspecified layout direction"));

      abort();
    }
    v3 = result;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRectEdge PXLeadingRectEdge(PXUserInterfaceLayoutDirection)");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXUserInterfaceLayoutDirection.m"), 46, CFSTR("Unknown layout direction %ti"), v3);

    abort();
  }
  return result;
}

uint64_t PXTrailingRectEdge(uint64_t a1)
{
  uint64_t v1;

  v1 = PXFlipLayoutDirection(a1);
  return PXLeadingRectEdge(v1);
}

uint64_t PXUserInterfaceLayoutDirectionFromUIUserInterfaceLayoutDirection(uint64_t a1)
{
  if (a1)
    return 2 * (a1 == 1);
  else
    return 1;
}

uint64_t PXDisplayLinkDefaultPreferredFramesPerSecond()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "maximumFramesPerSecond");

  return v1;
}

uint64_t CGSizeHash(double a1, double a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4 + 961;

  return v6;
}

void sub_244350810(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244350908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443509A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244350A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244350B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244350BDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244350FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24435105C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443511AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id NSIndexPathsFromPXIndexPathSet(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v1 = (void *)MEMORY[0x24BDBCEB8];
  v2 = a1;
  objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __NSIndexPathsFromPXIndexPathSet_block_invoke;
  v6[3] = &unk_2514CFC58;
  v4 = v3;
  v7 = v4;
  objc_msgSend(v2, "enumerateItemIndexPathsUsingBlock:", v6);

  return v4;
}

id PXIndexPathSetFromIndexPaths(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v14[4];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  +[PXIndexPathSet indexPathSet](PXMutableIndexPathSet, "indexPathSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "px_section");
        v12 = objc_msgSend(v10, "px_item");
        v14[0] = a2;
        v14[1] = v11;
        v14[2] = v12;
        v14[3] = 0x7FFFFFFFFFFFFFFFLL;
        objc_msgSend(v4, "addIndexPath:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t PXDisplayAssetCollectionSharingShouldStartWithAllAssetsSelected(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "px_isMediaTypeSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isHiddenSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlyDeletedSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isUtilityCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentsCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isAllLibraryDuplicatesSmartAlbum") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlySavedCollection") & 1) != 0
    || (objc_msgSend(v1, "px_isRecentlyEditedSmartAlbum") & 1) != 0)
  {
    v2 = 0;
  }
  else
  {
    v2 = objc_msgSend(v1, "px_isImportHistoryCollection") ^ 1;
  }

  return v2;
}

void sub_244353C78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
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

uint64_t __Block_byref_object_copy__2712(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2713(uint64_t a1)
{

}

double PXEdgeInsetsMakeWithValueForEdges(char a1, double a2)
{
  if ((a1 & 1) != 0)
    return a2;
  else
    return 0.0;
}

double PXEdgeInsetsAbsoluteValue(double a1)
{
  return fabs(a1);
}

double PXEdgeInsetsInsetRectEdges(char a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  if ((a1 & 2) == 0)
    a7 = 0.0;
  return a2 + a7;
}

void sub_244355968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244355C8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

_PXDisplayAssetIndexSubfetchResult *PXDisplayAssetFetchResultSubfetchResultWithIndexSet(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  _PXDisplayAssetIndexSubfetchResult *v6;
  _PXArrayDisplayAssetFetchResult *v7;
  _PXDisplayAssetIndexSubfetchResult *v8;
  void *v10;
  void *v11;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_msgSend(v4, "lastIndex");
    if (v5 >= objc_msgSend(v3, "count"))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id<PXDisplayAssetFetchResult>  _Nonnull PXDisplayAssetFetchResultSubfetchResultWithIndexSet(__strong id<PXDisplayAssetFetchResult> _Nonnull, NSIndexSet *__strong _Nonnull)");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXDisplayAssetFetchResult.m"), 430, CFSTR("indexSet %@ out of bounds 0 ..< %li"), v4, objc_msgSend(v3, "count"));

    }
    v6 = -[_PXDisplayAssetIndexSubfetchResult initWithFetchResult:indexSet:]([_PXDisplayAssetIndexSubfetchResult alloc], "initWithFetchResult:indexSet:", v3, v4);
  }
  else
  {
    v7 = [_PXArrayDisplayAssetFetchResult alloc];
    v6 = -[_PXArrayDisplayAssetFetchResult initWithAssets:](v7, "initWithAssets:", MEMORY[0x24BDBD1A8]);
  }
  v8 = v6;

  return v8;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultEmpty()
{
  _PXArrayDisplayAssetFetchResult *v0;

  v0 = [_PXArrayDisplayAssetFetchResult alloc];
  return -[_PXArrayDisplayAssetFetchResult initWithAssets:](v0, "initWithAssets:", MEMORY[0x24BDBD1A8]);
}

_PXConcatenatingDisplayAssetFetchResult *PXDisplayAssetFetchResultFromFetchResults(void *a1)
{
  id v1;
  _PXConcatenatingDisplayAssetFetchResult *v2;

  v1 = a1;
  v2 = -[_PXConcatenatingDisplayAssetFetchResult initWithFetchResults:]([_PXConcatenatingDisplayAssetFetchResult alloc], "initWithFetchResults:", v1);

  return v2;
}

_PXDisplayAssetScaledFetchResult *PXDisplayAssetFetchResultScaledWithMultiplier(void *a1, uint64_t a2)
{
  id v3;
  _PXDisplayAssetScaledFetchResult *v4;

  v3 = a1;
  v4 = -[_PXDisplayAssetScaledFetchResult initWithFetchResult:multiplier:]([_PXDisplayAssetScaledFetchResult alloc], "initWithFetchResult:multiplier:", v3, a2);

  return v4;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultFromArray(void *a1)
{
  id v1;
  _PXArrayDisplayAssetFetchResult *v2;

  v1 = a1;
  v2 = -[_PXArrayDisplayAssetFetchResult initWithAssets:]([_PXArrayDisplayAssetFetchResult alloc], "initWithAssets:", v1);

  return v2;
}

_PXArrayDisplayAssetFetchResult *PXDisplayAssetFetchResultFromAsset(void *a1)
{
  id v1;
  _PXArrayDisplayAssetFetchResult *v2;
  void *v3;
  _PXArrayDisplayAssetFetchResult *v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  v2 = [_PXArrayDisplayAssetFetchResult alloc];
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[_PXArrayDisplayAssetFetchResult initWithAssets:](v2, "initWithAssets:", v3);
  return v4;
}

PXDisplayAssetFetchResultEnumerator *PXDisplayAssetFetchResultFastEnumeration(void *a1)
{
  id v1;
  void *v2;
  PXDisplayAssetFetchResultEnumerator *v3;
  PXDisplayAssetFetchResultEnumerator *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "conformsToProtocol:", &unk_25736C300))
      v3 = v2;
    else
      v3 = -[PXDisplayAssetFetchResultEnumerator initWithDisplayAssetFetchResult:]([PXDisplayAssetFetchResultEnumerator alloc], "initWithDisplayAssetFetchResult:", v2);
    v4 = v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult(void *a1, void *a2)
{
  id v3;
  id v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = a1;
  v4 = a2;
  if (v3 == v4)
  {

    goto LABEL_9;
  }
  v5 = objc_msgSend(v3, "isEqual:", v4);

  if ((v5 & 1) != 0)
    goto LABEL_9;
  v6 = 0;
  if (!v3 || !v4)
    goto LABEL_10;
  v7 = objc_msgSend(v3, "count");
  if (v7 != objc_msgSend(v4, "count"))
  {
    v6 = 0;
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v3;
    v9 = v4;
LABEL_14:
    v6 = objc_msgSend(v8, "hasIdentifiersEqualTo:", v9);
    goto LABEL_10;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v4;
    v9 = v3;
    goto LABEL_14;
  }
  v11 = objc_msgSend(v3, "count");
  if (v11 != objc_msgSend(v4, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL PXDisplayAssetFetchResultEqualToDisplayAssetFetchResult(__strong id<PXDisplayAssetFetchResult> _Nullable, __strong id<PXDisplayAssetFetchResult> _Nullable)");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("PXDisplayAssetFetchResult.m"), 476, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fetchResult1.count == fetchResult2.count"));

  }
  v12 = objc_msgSend(v3, "count");
  if (v12 < 1)
  {
LABEL_9:
    v6 = 1;
    goto LABEL_10;
  }
  v13 = v12;
  v14 = 1;
  do
  {
    objc_msgSend(v3, "objectAtIndex:", v14 - 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", v14 - 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v15, "isEqual:", v16);

    if (v14 >= v13)
      break;
    ++v14;
  }
  while ((v6 & 1) != 0);
LABEL_10:

  return v6;
}

uint64_t __Block_byref_object_copy__3019(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3020(uint64_t a1)
{

}

void sub_244357314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443578C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443598F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PXDiffArrays(void *a1, void *a2, void *a3, id *a4, id *a5, id *a6, CFTypeRef *a7, id *a8)
{
  return PXDiffArraysWithObjectComparator(a1, a2, a3, 0, a4, a5, a6, a7, a8);
}

void sub_244359ED0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

id PXFlatMap(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, _QWORD);
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v4[2](v4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v5, "addObjectsFromArray:", v11, (_QWORD)v13);

          ++v10;
        }
        while (v8 != v10);
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

id PXFilter(void *a1, void *a2)
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

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
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

id PXFind(void *a1, void *a2)
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

  v16 = *MEMORY[0x24BDAC8D0];
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

uint64_t PXExists(void *a1, void *a2)
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

  v15 = *MEMORY[0x24BDAC8D0];
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

id PXReduce(void *a1, void *a2, void *a3)
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

  v21 = *MEMORY[0x24BDAC8D0];
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

double PXReduceF(void *a1, void *a2, double a3)
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

  v17 = *MEMORY[0x24BDAC8D0];
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

void sub_24435C8A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t PXPointConvertFromCoordinateSpaceToCoordinateSpace(void *a1, const char *a2)
{
  return objc_msgSend(a1, "convertPoint:toCoordinateSpace:", a2);
}

uint64_t PXRectConvertFromCoordinateSpaceToCoordinateSpace(void *a1, const char *a2)
{
  return objc_msgSend(a1, "convertRect:toCoordinateSpace:", a2);
}

double PXRadiansToDegrees(double a1)
{
  return a1 * 180.0 / 3.14159265;
}

double PXDegreesToRadians(double a1)
{
  return a1 * 3.14159265 / 180.0;
}

double PXFloatSqrt(double a1)
{
  return sqrt(a1);
}

double PXFloatByParabolicallyInterpolatingFloats(double a1, double a2, double a3, double a4)
{
  return a1 + a4 * (a2 - a1 - (a3 - a3 * a4));
}

double PXFloatRoundToPixel(double a1, double a2)
{
  return round(a1 * a2) / a2;
}

double PXFloatFloorToPixel(double a1, double a2)
{
  return floor(a1 * a2) / a2;
}

double PXFloatCeilingToPixel(double a1, double a2)
{
  return ceil(a1 * a2) / a2;
}

BOOL PXFloatEqualToFloatWithTolerance(double a1, double a2, double a3)
{
  return vabdd_f64(a1, a2) <= a3;
}

BOOL PXFloatGreaterThanOrApproximatelyEqualToFloat(double a1, double a2)
{
  return vabdd_f64(a1, a2) <= 0.00000999999975 || a1 - a2 > 0.00000011920929;
}

double PXFloatRandomValueBetween(double a1, double a2)
{
  return (a2 - a1) * (double)arc4random() / 4294967300.0 + a1;
}

double PXFloatRoundInDirection(double a1, double a2)
{
  if (a2 > 0.0)
    return ceil(a1);
  if (a2 < 0.0)
    return floor(a1);
  return round(a1);
}

unint64_t PXSectionedFetchResultIndexOfObject(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t ResultIndexOfObjectInRange;
  unint64_t v6;

  v3 = a1;
  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    ResultIndexOfObjectInRange = objc_msgSend(v3, "indexOfObject:", v4);
  else
    ResultIndexOfObjectInRange = PXSectionedFetchResultIndexOfObjectInRange(v3, v4, 0, objc_msgSend(v3, "count"));
  v6 = ResultIndexOfObjectInRange;

  return v6;
}

unint64_t PXSectionedFetchResultIndexOfObjectInRange(void *a1, void *a2, unint64_t a3, uint64_t a4)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  char v11;

  v7 = a1;
  v8 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    a3 = objc_msgSend(v7, "indexOfObject:inRange:", v8, a3, a4);
  }
  else if (a3 >= a3 + a4)
  {
LABEL_7:
    a3 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", a3);
      v9 = (id)objc_claimAutoreleasedReturnValue();
      if (v9 == v8)
        break;
      v10 = v9;
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if ((v11 & 1) != 0)
        goto LABEL_9;
      ++a3;
      if (!--a4)
        goto LABEL_7;
    }

  }
LABEL_9:

  return a3;
}

void px_perform_on_main_runloop(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void px_perform_on_main_runloop(PXRunloopOrder, __strong dispatch_block_t _Nonnull)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("NSRunLoop+PhotosUIFoundation.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("block != nil"));

  }
  if (a1 == 1)
    v4 = 1999999;
  else
    v4 = 0;
  if (a1 == 2)
    v5 = 2000001;
  else
    v5 = v4;
  objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_class();
  v8 = _Block_copy(v3);
  v12[0] = *MEMORY[0x24BDBCB80];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSelector:target:argument:order:modes:", sel_perform_, v7, v8, v5, v9);

}

uint64_t PXRectEdgeAxis(int a1)
{
  if (((a1 - 1) & 0xFFFFFFFD) != 0)
    return 2;
  else
    return 1;
}

double PXRectGetMinForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  switch(a1)
  {
    case 1:
      return CGRectGetMinY(*(CGRect *)&result);
    case 2:
      return CGRectGetMinX(*(CGRect *)&result);
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v6, v5, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXRectGetMinForAxis(CGRect, PXAxis)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXAxis.m"), 97, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

double PXRectGetMidForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  switch(a1)
  {
    case 1:
      return CGRectGetMidY(*(CGRect *)&result);
    case 2:
      return CGRectGetMidX(*(CGRect *)&result);
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v6, v5, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXRectGetMidForAxis(CGRect, PXAxis)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXAxis.m"), 108, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

double PXRectGetLengthForAxis(uint64_t a1, double result, double a3, double a4, double a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;

  switch(a1)
  {
    case 1:
      return CGRectGetHeight(*(CGRect *)&result);
    case 2:
      return CGRectGetWidth(*(CGRect *)&result);
    case 0:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v6, v5, v7, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat PXRectGetLengthForAxis(CGRect, PXAxis)");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("PXAxis.m"), 130, CFSTR("Code which should be unreachable has been reached"));

      abort();
  }
  return result;
}

BOOL PXAssetBadgeInfoIsActionableDisabled(_QWORD *a1)
{
  return (*a1 & 0x80000004000) != 0;
}

BOOL PXAssetBadgeInfoIsActionable(_QWORD *a1)
{
  return (*a1 & 0x4C000002000) != 0;
}

BOOL PXAssetBadgeInfoIsToggleable(uint64_t a1)
{
  return (*(_BYTE *)(a1 + 2) & 0x60) != 0;
}

uint64_t PXAssetBadgeInfoIsLivePhotoToggleable(uint64_t a1)
{
  return (*(unsigned __int8 *)(a1 + 2) >> 5) & 1;
}

BOOL PXAssetBadgeInfoIsToggledOn(uint64_t a1)
{
  return (*(_WORD *)(a1 + 2) & 0x280) != 0;
}

BOOL PXAssetBadgeInfoEqualToBadgeInfo(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)a1 == *(_QWORD *)a2
      && *(double *)(a1 + 8) == *(double *)(a2 + 8)
      && *(_QWORD *)(a1 + 16) == *(_QWORD *)(a2 + 16)
      && *(_QWORD *)(a1 + 24) == *(_QWORD *)(a2 + 24);
}

uint64_t PXAssetBadgeInfoRequiresCountForBadges(unint64_t a1)
{
  return (a1 >> 3) & 1;
}

uint64_t PXAssetBadgeInfoCreateWithBadges@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  a2[2] = 0;
  a2[3] = 0;
  *a2 = result;
  a2[1] = 0;
  return result;
}

void PXAssetBadgeInfoCreateWithDuration(uint64_t a1@<X8>, double a2@<D0>)
{
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(double *)(a1 + 8) = a2;
}

void sub_24435F5D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PXImageDynamicRangeIsGreaterThanStandard(uint64_t a1)
{
  return (unint64_t)(a1 - 1) < 2;
}

id PXAttributedStringForBadgeText(void *a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7;
  uint64_t *v8;
  id v9;
  void *v10;

  v7 = a1;
  if (PXAttributedStringForBadgeText_onceToken == -1)
  {
    if (!a3)
    {
LABEL_6:
      objc_msgSend((id)PXAttributedStringForBadgeText_paragraphStyle, "setAlignment:", a2);
      goto LABEL_7;
    }
  }
  else
  {
    dispatch_once(&PXAttributedStringForBadgeText_onceToken, &__block_literal_global_4324);
    if (!a3)
      goto LABEL_6;
  }
  if (a3 == 1 && a2 <= 4)
  {
    a2 = qword_24438B870[a2];
    goto LABEL_6;
  }
LABEL_7:
  if (a4 == 1)
  {
    v8 = &PXAttributedStringForBadgeText_miniAttributes;
  }
  else
  {
    if (a4)
    {
      v9 = 0;
      goto LABEL_13;
    }
    v8 = &PXAttributedStringForBadgeText_defaultAttributes;
  }
  v9 = (id)*v8;
LABEL_13:
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v7, v9);

  return v10;
}

const __CFString *PXDisplayAssetCollectionCurationLengthDescription(unint64_t a1)
{
  if (a1 > 5)
    return CFSTR("?");
  else
    return off_2514D0048[a1];
}

void sub_2443618B8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

id PXAssertGetLog()
{
  if (PXAssertGetLog_predicate != -1)
    dispatch_once(&PXAssertGetLog_predicate, &__block_literal_global_4680);
  return (id)PXAssertGetLog_log;
}

double PXStoryRectOuterBounds(_OWORD *a1)
{
  __int128 v1;
  uint64_t v2;
  double v3;
  double v4;
  double result;
  CGAffineTransform v6;

  v1 = a1[1];
  *(_OWORD *)&v6.a = *a1;
  *(_OWORD *)&v6.c = v1;
  *(_OWORD *)&v6.tx = a1[2];
  v2 = 0;
  *(_QWORD *)&v1 = 0;
  v3 = 1.0;
  v4 = 1.0;
  *(_QWORD *)&result = (unint64_t)CGRectApplyAffineTransform(*(CGRect *)((char *)&v1 - 8), &v6);
  return result;
}

void PXStoryRectDecompose(_OWORD *a1, double *a2, double *a3)
{
  __int128 v6;
  uint64_t v7;
  double v8;
  double v9;
  double x;
  double y;
  double width;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGAffineTransform v19;
  CGRect v20;

  v6 = a1[1];
  *(_OWORD *)&v19.a = *a1;
  *(_OWORD *)&v19.c = v6;
  *(_OWORD *)&v19.tx = a1[2];
  v7 = 0;
  *(_QWORD *)&v6 = 0;
  v8 = 1.0;
  v9 = 1.0;
  v20 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v6 - 8), &v19);
  x = v20.origin.x;
  y = v20.origin.y;
  width = v20.size.width;
  height = v20.size.height;
  v17 = 0.0;
  v18 = 0.0;
  *(_OWORD *)&v20.origin.y = a1[1];
  *(_OWORD *)&v19.a = *a1;
  *(_OWORD *)&v19.c = *(_OWORD *)&v20.origin.y;
  *(_OWORD *)&v19.tx = a1[2];
  PXAffineTransformDecomposeTranslationScaleRotation((uint64_t)&v19, 0, &v17, &v18, a3);
  if (a2)
  {
    v14 = v17;
    v15 = v18;
    v16 = y + height * 0.5 + v18 * -0.5;
    *a2 = x + width * 0.5 + v17 * -0.5;
    a2[1] = v16;
    a2[2] = v14;
    a2[3] = v15;
  }
}

void PXStoryRectLinearlyInterpolatingRects(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>, double a4@<D0>)
{
  __int128 v7;
  __int128 v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  CGAffineTransform v19;

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0.0;
  v14 = 0.0;
  v7 = a1[1];
  *(_OWORD *)&v19.a = *a1;
  *(_OWORD *)&v19.c = v7;
  *(_OWORD *)&v19.tx = a1[2];
  PXStoryRectDecompose(&v19, (double *)&v17, &v14);
  v8 = a2[1];
  *(_OWORD *)&v19.a = *a2;
  *(_OWORD *)&v19.c = v8;
  *(_OWORD *)&v19.tx = a2[2];
  PXStoryRectDecompose(&v19, (double *)&v15, &v13);
  v9 = *(double *)&v17 + a4 * (*(double *)&v15 - *(double *)&v17);
  v10 = *((double *)&v17 + 1) + a4 * (*((double *)&v15 + 1) - *((double *)&v17 + 1));
  v11 = *(double *)&v18 + a4 * (*(double *)&v16 - *(double *)&v18);
  v12 = *((double *)&v18 + 1) + a4 * (*((double *)&v16 + 1) - *((double *)&v18 + 1));
  CGAffineTransformMakeRotation(&v19, v14 + a4 * (v13 - v14));
  PXStoryRectFromCGRectApplyingTransformWithAnchorPoint(&v19, a3, v9, v10, v11, v12, 0.5, 0.5);
}

CGFloat PXStoryRectFromCGRectApplyingTransformWithAnchorPoint@<D0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, double a7@<D4>, double a8@<D5>)
{
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CGFloat result;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CGAffineTransform t2;
  CGAffineTransform t1;

  *(_OWORD *)&a2->c = 0u;
  *(_OWORD *)&a2->tx = 0u;
  *(_OWORD *)&a2->a = 0u;
  PXStoryRectFromCGRect(a2, a3, a4, a5, a6);
  memset(&v25, 0, sizeof(v25));
  CGAffineTransformMakeTranslation(&v25, -(a3 + a7 * a5), -(a4 + a8 * a6));
  v16 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a2->tx;
  t2 = v25;
  CGAffineTransformConcat(a2, &t1, &t2);
  v17 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.c = v17;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a2->tx;
  v18 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v18;
  *(_OWORD *)&t2.tx = a1[2];
  CGAffineTransformConcat(&v24, &t1, &t2);
  v19 = *(_OWORD *)&v24.c;
  *(_OWORD *)&a2->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&a2->c = v19;
  *(_OWORD *)&a2->tx = *(_OWORD *)&v24.tx;
  t1 = v25;
  CGAffineTransformInvert(&v23, &t1);
  v20 = *(_OWORD *)&a2->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a2->a;
  *(_OWORD *)&t1.c = v20;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a2->tx;
  t2 = v23;
  CGAffineTransformConcat(&v24, &t1, &t2);
  v21 = *(_OWORD *)&v24.c;
  *(_OWORD *)&a2->a = *(_OWORD *)&v24.a;
  *(_OWORD *)&a2->c = v21;
  result = v24.tx;
  *(_OWORD *)&a2->tx = *(_OWORD *)&v24.tx;
  return result;
}

void PXStoryRectFromCGRect(_OWORD *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  __int128 v10;
  __int128 v11;
  _OWORD v12[3];

  if (CGRectIsNull(*(CGRect *)&a2))
  {
    *a1 = PXStoryRectNull;
    a1[1] = unk_24438B8D8;
    v10 = xmmword_24438B8E8;
  }
  else
  {
    PXAffineTransformMakeFromRects((uint64_t)v12, 0.0, 0.0, 1.0, 1.0, a2, a3, a4, a5);
    v11 = v12[1];
    *a1 = v12[0];
    a1[1] = v11;
    v10 = v12[2];
  }
  a1[2] = v10;
}

void PXStoryRectFromCGRectCenterRotation(CGAffineTransform *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>)
{
  CGAffineTransform v11;

  CGAffineTransformMakeRotation(&v11, a6);
  PXStoryRectFromCGRectApplyingTransformWithAnchorPoint(&v11, a1, a2, a3, a4, a5, 0.5, 0.5);
}

id PXStoryRectDescription(_OWORD *a1)
{
  __int128 v1;
  id v2;
  _OWORD v4[3];
  double v5;
  __int128 v6;
  __int128 v7;

  v6 = 0u;
  v7 = 0u;
  v5 = 0.0;
  v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  v4[2] = a1[2];
  PXStoryRectDecompose(v4, (double *)&v6, &v5);
  v2 = objc_alloc(MEMORY[0x24BDD17C8]);
  return (id)objc_msgSend(v2, "initWithFormat:", CFSTR("{ x=%0.4f, y=%0.4f, w=%0.4f, h=%0.4f, r=%0.2f° }"), v6, v7, v5 * 180.0 / 3.14159265);
}

CGPath *PXStoryRectPath(const CGAffineTransform *a1)
{
  CGPath *Mutable;
  CGRect v4;

  Mutable = CGPathCreateMutable();
  v4.origin.x = 0.0;
  v4.origin.y = 0.0;
  v4.size.width = 1.0;
  v4.size.height = 1.0;
  CGPathAddRect(Mutable, a1, v4);
  return Mutable;
}

BOOL PXStoryRectEqualToRect(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  CGAffineTransform v5;
  CGAffineTransform t1;

  v2 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tx = a1[2];
  v3 = a2[1];
  *(_OWORD *)&v5.a = *a2;
  *(_OWORD *)&v5.c = v3;
  *(_OWORD *)&v5.tx = a2[2];
  return CGAffineTransformEqualToTransform(&t1, &v5);
}

BOOL PXStoryRectIsNull(_OWORD *a1)
{
  __int128 v1;
  CGAffineTransform v3;
  CGAffineTransform t1;

  v1 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v1;
  *(_OWORD *)&t1.tx = a1[2];
  v3 = *(CGAffineTransform *)PXStoryRectNull;
  return CGAffineTransformEqualToTransform(&t1, &v3);
}

BOOL PXStoryRectIsEmpty(_OWORD *a1)
{
  __int128 v2;
  __int128 v4;
  uint64_t v5;
  double v6;
  double v7;
  CGAffineTransform v8;
  CGAffineTransform t1;
  CGRect v10;

  v2 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v2;
  *(_OWORD *)&t1.tx = a1[2];
  v8 = *(CGAffineTransform *)PXStoryRectNull;
  if (CGAffineTransformEqualToTransform(&t1, &v8))
    return 1;
  v4 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = a1[2];
  v5 = 0;
  *(_QWORD *)&v4 = 0;
  v6 = 1.0;
  v7 = 1.0;
  v10 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v4 - 8), &t1);
  return CGRectIsEmpty(v10);
}

CGAffineTransform *PXStoryRectApplyAffineTransform@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v3;
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform t1;

  v3 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = a1[2];
  v4 = a2[1];
  *(_OWORD *)&v6.a = *a2;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v6);
}

CGFloat PXStoryRectFromStoryRectApplyingTransformWithAnchorPoint@<D0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>, double a4@<D0>, double a5@<D1>)
{
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
  CGFloat result;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGAffineTransform v23;
  CGAffineTransform v24;
  CGFloat angle;
  __int128 v26;
  __int128 v27;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v26 = 0u;
  v27 = 0u;
  angle = 0.0;
  v9 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v9;
  *(_OWORD *)&t1.tx = a1[2];
  PXStoryRectDecompose(&t1, (double *)&v26, &angle);
  v10 = v26;
  v11 = v27;
  memset(&v24, 0, sizeof(v24));
  CGAffineTransformMakeTranslation(&v24, -(*(double *)&v26 + a4 * *(double *)&v27), -(*((double *)&v26 + 1) + a5 * *((double *)&v27 + 1)));
  *(_OWORD *)&a3->c = 0u;
  *(_OWORD *)&a3->tx = 0u;
  *(_OWORD *)&a3->a = 0u;
  PXStoryRectFromCGRect(a3, *(CGFloat *)&v10, *((CGFloat *)&v10 + 1), *(CGFloat *)&v11, *((CGFloat *)&v11 + 1));
  v12 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  t2 = v24;
  CGAffineTransformConcat(a3, &t1, &t2);
  CGAffineTransformMakeRotation(&v22, angle);
  v13 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  t2 = v22;
  CGAffineTransformConcat(&v23, &t1, &t2);
  v14 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->c = v14;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v23.tx;
  v15 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  v16 = a2[1];
  *(_OWORD *)&t2.a = *a2;
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = a2[2];
  CGAffineTransformConcat(&v23, &t1, &t2);
  v17 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->c = v17;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v23.tx;
  t1 = v24;
  CGAffineTransformInvert(&v21, &t1);
  v18 = *(_OWORD *)&a3->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&t1.c = v18;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
  t2 = v21;
  CGAffineTransformConcat(&v23, &t1, &t2);
  v19 = *(_OWORD *)&v23.c;
  *(_OWORD *)&a3->a = *(_OWORD *)&v23.a;
  *(_OWORD *)&a3->c = v19;
  result = v23.tx;
  *(_OWORD *)&a3->tx = *(_OWORD *)&v23.tx;
  return result;
}

CGAffineTransform *PXStoryRectNormalize@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  CGAffineTransform v8;
  CGAffineTransform t2;

  v5 = a2[1];
  *(_OWORD *)&v8.a = *a2;
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = a2[2];
  CGAffineTransformInvert(&t2, &v8);
  v6 = a1[1];
  *(_OWORD *)&v8.a = *a1;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = a1[2];
  return CGAffineTransformConcat(a3, &v8, &t2);
}

CGAffineTransform *PXStoryRectDenormalize@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v3;
  __int128 v4;
  CGAffineTransform v6;
  CGAffineTransform t1;

  v3 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v3;
  *(_OWORD *)&t1.tx = a1[2];
  v4 = a2[1];
  *(_OWORD *)&v6.a = *a2;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v6);
}

CGAffineTransform *PXStoryAffineTransformBetweenRects@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  CGAffineTransform v8;
  CGAffineTransform t1;

  v5 = a1[1];
  *(_OWORD *)&v8.a = *a1;
  *(_OWORD *)&v8.c = v5;
  *(_OWORD *)&v8.tx = a1[2];
  CGAffineTransformInvert(&t1, &v8);
  v6 = a2[1];
  *(_OWORD *)&v8.a = *a2;
  *(_OWORD *)&v8.c = v6;
  *(_OWORD *)&v8.tx = a2[2];
  return CGAffineTransformConcat(a3, &t1, &v8);
}

CGAffineTransform *PXStoryRectFitIntoUnitRect@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>)
{
  __int128 v2;
  _OWORD v4[3];

  v2 = a1[1];
  v4[0] = *a1;
  v4[1] = v2;
  v4[2] = a1[2];
  return PXStoryRectFitIntoRect(v4, a2, 0.0, 0.0, 1.0, 1.0);
}

CGAffineTransform *PXStoryRectFitIntoRect@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>)
{
  __int128 v12;
  uint64_t v13;
  double v14;
  double v15;
  __int128 v16;
  CGAffineTransform v18;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v21;

  memset(&v18, 0, sizeof(v18));
  v12 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = a1[2];
  v13 = 0;
  *(_QWORD *)&v12 = 0;
  v14 = 1.0;
  v15 = 1.0;
  v21 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &t1);
  _PXStoryAffineTransformFittingRectIntoRect((uint64_t)&v18, v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, a3, a4, a5, a6);
  v16 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = a1[2];
  t2 = v18;
  return CGAffineTransformConcat(a2, &t1, &t2);
}

uint64_t _PXStoryAffineTransformFittingRectIntoRect(uint64_t result, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
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

  v9 = a2 + a4;
  v10 = a3 + a5;
  v11 = a8 / (v9 - a2);
  if (v11 >= a9 / (v10 - a3))
    v11 = a9 / (v10 - a3);
  if (v11 > 1.0)
    v11 = 1.0;
  v12 = (a2 + v9) * 0.5;
  v13 = (a3 + v10) * 0.5;
  v14 = a6 - a2 * v11;
  v15 = 1.0 - v11;
  v16 = v12 * (1.0 - v11);
  v17 = a6 + a8 - v9 * v11;
  if (v16 < v17)
    v17 = v16;
  if (v17 > v14)
    v14 = v17;
  v18 = a7 - a3 * v11;
  v19 = v13 * v15;
  v20 = a7 + a9 - v10 * v11;
  if (v13 * v15 >= v20)
    v19 = v20;
  *(double *)result = v11;
  *(_QWORD *)(result + 8) = 0;
  *(_QWORD *)(result + 16) = 0;
  if (v19 > v18)
    v18 = v19;
  *(double *)(result + 24) = v11;
  *(double *)(result + 32) = v14;
  *(double *)(result + 40) = v18;
  return result;
}

CGFloat PXStoryRectsFitIntoUnitRect(_OWORD *a1, _OWORD *a2)
{
  return PXStoryRectsFitIntoRect(a1, a2, 0.0, 0.0, 1.0, 1.0);
}

CGFloat PXStoryRectsFitIntoRect(_OWORD *a1, _OWORD *a2, double a3, double a4, double a5, double a6)
{
  __int128 v12;
  uint64_t v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGFloat result;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  memset(&v26, 0, sizeof(v26));
  v12 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = a1[2];
  v13 = 0;
  *(_QWORD *)&v12 = 0;
  v14 = 1.0;
  v15 = 1.0;
  v29 = CGRectApplyAffineTransform(*(CGRect *)((char *)&v12 - 8), &t1);
  x = v29.origin.x;
  y = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  *(_OWORD *)&v29.origin.y = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = *(_OWORD *)&v29.origin.y;
  *(_OWORD *)&t1.tx = a2[2];
  v29.origin.x = 0.0;
  v29.origin.y = 0.0;
  v29.size.width = 1.0;
  v29.size.height = 1.0;
  v32 = CGRectApplyAffineTransform(v29, &t1);
  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  v31 = CGRectUnion(v30, v32);
  _PXStoryAffineTransformFittingRectIntoRect((uint64_t)&v26, v31.origin.x, v31.origin.y, v31.size.width, v31.size.height, a3, a4, a5, a6);
  v20 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v20;
  *(_OWORD *)&t1.tx = a1[2];
  t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  v21 = *(_OWORD *)&v25.c;
  *a1 = *(_OWORD *)&v25.a;
  a1[1] = v21;
  a1[2] = *(_OWORD *)&v25.tx;
  v22 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v22;
  *(_OWORD *)&t1.tx = a2[2];
  t2 = v26;
  CGAffineTransformConcat(&v25, &t1, &t2);
  v23 = *(_OWORD *)&v25.c;
  *a2 = *(_OWORD *)&v25.a;
  a2[1] = v23;
  result = v25.tx;
  a2[2] = *(_OWORD *)&v25.tx;
  return result;
}

uint64_t PXStoryAffineTransformFittingRectsIntoRect@<X0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D4>, double a4, double a5, double a6, double a7)
{
  CGRect v15;

  v15 = CGRectUnion(*(CGRect *)&a2, *(CGRect *)&a3);
  return _PXStoryAffineTransformFittingRectIntoRect(a1, v15.origin.x, v15.origin.y, v15.size.width, v15.size.height, a4, a5, a6, a7);
}

uint64_t PXSystemFontOfSizeAndWeight()
{
  return objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:");
}

id PXFontCreate(void *a1, CGFloat a2)
{
  id v3;
  void *v4;
  const __CTFontDescriptor *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  if (objc_msgSend(v3, "isEqualToString:", PXSanFranciscoProCompressedBold))
  {
    v11 = *MEMORY[0x24BDC4D70];
    v12[0] = PXSanFranciscoProCompressedBold;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (const __CTFontDescriptor *)CTFontDescriptorCreateWithAttributesAndOptions();

    v6 = CTFontCreateWithFontDescriptor(v5, a2, 0);
    CFRelease(v5);
  }
  else if (objc_msgSend(v3, "isEqualToString:", PXSanFranciscoSystemSerifBoldFontName))
  {
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", a2, *MEMORY[0x24BEBB610]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "fontDescriptor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontDescriptorWithDesign:", *MEMORY[0x24BEBB580]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v9, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBB520], "fontWithName:size:", v3, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

uint64_t PXFontCreateWithDescriptorAndSize(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", a1);
}

id PXCappedFontWithTextStyle(uint64_t a1, unint64_t a2)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, 0, a2);
}

id PXCappedFontWithTextStyleAndWeight(uint64_t a1, unint64_t a2, double a3)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, 0, a2, a3);
}

id _PXFontWithTextStyleSymbolicTraitsAndWeight(uint64_t a1, uint64_t a2, unint64_t a3, double a4)
{
  void *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  UIFontTextStyleFromPXFontTextStyle(a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  UIContentSizeCategoryFromPXPreferredContentSizeCategory(a3);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  UserPreferredContentSizeCategory();
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 == (NSString *)*MEMORY[0x24BEBE0D8] || UIContentSizeCategoryCompareToCategory(v9, v8) != NSOrderedDescending)
  {
    objc_msgSend(MEMORY[0x24BEBB528], "_preferredFontDescriptorWithTextStyle:addingSymbolicTraits:design:weight:compatibleWithTraitCollection:", v7, a2, *MEMORY[0x24BEBB568], 0, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = (void *)MEMORY[0x24BEBB528];
    v12 = *MEMORY[0x24BEBB568];
    objc_msgSend(MEMORY[0x24BEBDAB0], "traitCollectionWithPreferredContentSizeCategory:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_preferredFontDescriptorWithTextStyle:addingSymbolicTraits:design:weight:compatibleWithTraitCollection:", v7, a2, v12, v13, a4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v14, 0.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id PXFontWithTextStyle(uint64_t a1)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, 0, 9uLL);
}

id PXFontWithTextStyleSymbolicTraits(uint64_t a1, uint64_t a2)
{
  return _PXFontWithTextStyleSymbolicTraits(a1, a2, 9uLL);
}

id PXFontWithTextStyleAndWeight(uint64_t a1, double a2)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, 0, 9uLL, a2);
}

id PXFontWithTextStyleSymbolicTraitsAndWeight(uint64_t a1, uint64_t a2, double a3)
{
  return _PXFontWithTextStyleSymbolicTraitsAndWeight(a1, a2, 9uLL, a3);
}

id PXMonospacedNumberFontWithSize(double a1)
{
  return PXMonospacedNumberFontWithSizeAndWeight(a1, *MEMORY[0x24BEBB608]);
}

id PXMonospacedNumberFontWithSizeAndWeight(double a1, double a2)
{
  uint64_t v4;
  uint64_t v5;
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
  void *v17;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[2];
  _QWORD v28[2];
  _QWORD v29[4];

  v29[3] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BEBB598];
  v27[0] = *MEMORY[0x24BEBB5A0];
  v4 = v27[0];
  v27[1] = v5;
  v28[0] = &unk_2514EB590;
  v28[1] = &unk_2514EB5A8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = v6;
  v25[0] = v4;
  v25[1] = v5;
  v26[0] = &unk_2514EB5C0;
  v26[1] = &unk_2514EB5D8;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v7;
  v23[0] = v4;
  v23[1] = v5;
  v24[0] = &unk_2514EB5C0;
  v24[1] = &unk_2514EB5F0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v24, v23, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", a1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fontDescriptor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = *MEMORY[0x24BEBB620];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = *MEMORY[0x24BEBB548];
  v20 = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "fontWithDescriptor:size:", v16, a1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

double PXFontScaleForTextStyle(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  UIFontTextStyleFromPXFontTextStyle(a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _PXFontWithTextStyleSymbolicTraits(a1, 0, 9uLL);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lineHeight");
  v5 = v4;
  objc_msgSend(MEMORY[0x24BEBB520], "defaultFontForTextStyle:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lineHeight");
  v8 = v5 / v7;

  return v8;
}

double PXScaledValueForTextStyleWithSymbolicTraits(uint64_t a1, uint64_t a2, double a3)
{
  return PXScaledValueForTextStyleWithMaxContentSizeCategoryAndSymbolicTraits(a1, 0, a2, a3);
}

uint64_t PXIsSanFranciscoFontName(void *a1, const char *a2)
{
  return objc_msgSend(a1, "hasPrefix:", CFSTR(".SF"));
}

BOOL PXFontCanEncodeString(void *a1, void *a2)
{
  const __CTFont *v3;
  id v4;
  uint64_t v5;
  _BOOL8 GlyphsForCharacters;
  CFIndex v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v4, "length");
  GlyphsForCharacters = 1;
  if (v3)
  {
    v7 = v5;
    if (v5)
    {
      v8 = 2 * v5;
      MEMORY[0x24BDAC7A8](v5);
      v9 = (v8 + 15) & 0xFFFFFFFFFFFFFFF0;
      v10 = objc_msgSend(v4, "getCharacters:range:", (char *)v12 - v9, 0, v7);
      MEMORY[0x24BDAC7A8](v10);
      GlyphsForCharacters = CTFontGetGlyphsForCharacters(v3, (const UniChar *)((char *)v12 - v9), (CGGlyph *)((char *)v12 - v9), v7);
    }
  }

  return GlyphsForCharacters;
}

void sub_2443641E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_2443646B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244364878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443649BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_244364D7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__5028(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5029(uint64_t a1)
{

}

void sub_244365A5C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id PXImageFromCGImage(uint64_t a1)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEBD640]), "initWithCGImage:", a1);
}

void PXTileGeometryApplyAffineTransform(_OWORD *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  CGAffineTransform v14;
  CGAffineTransform t1;
  CGRect v16;

  v5 = a1[9];
  *(_OWORD *)(a3 + 128) = a1[8];
  *(_OWORD *)(a3 + 144) = v5;
  v6 = a1[11];
  *(_OWORD *)(a3 + 160) = a1[10];
  *(_OWORD *)(a3 + 176) = v6;
  v7 = a1[5];
  *(_OWORD *)(a3 + 64) = a1[4];
  *(_OWORD *)(a3 + 80) = v7;
  v8 = a1[7];
  *(_OWORD *)(a3 + 96) = a1[6];
  *(_OWORD *)(a3 + 112) = v8;
  v9 = a1[1];
  *(_OWORD *)a3 = *a1;
  *(_OWORD *)(a3 + 16) = v9;
  v10 = a1[3];
  *(_OWORD *)(a3 + 32) = a1[2];
  *(_OWORD *)(a3 + 48) = v10;
  v11 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tx = a2[2];
  v12 = *(_OWORD *)(a3 + 80);
  *(_OWORD *)&v14.a = *(_OWORD *)(a3 + 64);
  *(_OWORD *)&v14.c = v12;
  *(_OWORD *)&v14.tx = *(_OWORD *)(a3 + 96);
  CGAffineTransformConcat((CGAffineTransform *)(a3 + 64), &t1, &v14);
  v16 = *(CGRect *)a3;
  v13 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v13;
  *(_OWORD *)&t1.tx = a2[2];
  *(CGRect *)a3 = CGRectApplyAffineTransform(v16, &t1);
}

id PXTileGeometryDescription(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v10;
  double v11;
  double v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  CGAffineTransform t2;
  CGAffineTransform t1;

  v2 = (void *)MEMORY[0x24BDD16A8];
  NSStringFromCGRect(*(CGRect *)a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{frame:%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *(double *)(a1 + 16);
  v6 = *(double *)(a1 + 24);
  v7 = *(double *)(a1 + 32);
  v8 = *(double *)(a1 + 40);
  if (v7 != *(double *)a1 + v5 * 0.5 || v8 != *(double *)(a1 + 8) + v6 * 0.5)
  {
    NSStringFromCGPoint(*(CGPoint *)&v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" center:%@"), v10);

    v5 = *(double *)(a1 + 16);
    v6 = *(double *)(a1 + 24);
  }
  v11 = *(double *)(a1 + 48);
  v12 = *(double *)(a1 + 56);
  if (v11 != v5 || v12 != v6)
  {
    NSStringFromCGSize(*(CGSize *)&v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" size:%@"), v14);

  }
  v15 = *(_OWORD *)(a1 + 80);
  *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 64);
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 96);
  v16 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)&t2.a = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)&t2.c = v16;
  *(_OWORD *)&t2.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    v17 = *(_OWORD *)(a1 + 80);
    *(_OWORD *)&t1.a = *(_OWORD *)(a1 + 64);
    *(_OWORD *)&t1.c = v17;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 96);
    NSStringFromCGAffineTransform(&t1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" transform:%@"), v18);

  }
  if (*(double *)(a1 + 112) != 1.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" alpha:%f"), *(_QWORD *)(a1 + 112));
  if (*(_BYTE *)(a1 + 128))
    objc_msgSend(v4, "appendFormat:", CFSTR(" hidden:%@"), CFSTR("YES"));
  v19 = *(double *)(a1 + 136);
  v20 = *(double *)(a1 + 144);
  if (v19 != *(double *)(a1 + 48) || v20 != *(double *)(a1 + 56))
  {
    NSStringFromCGSize(*(CGSize *)&v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" contentSize:%@"), v21);

  }
  objc_msgSend(v4, "appendString:", CFSTR("}"));
  return v4;
}

uint64_t PXUpdateFlagsReset(uint64_t result)
{
  *(_QWORD *)result = 0;
  *(_QWORD *)(result + 8) = 0;
  *(_WORD *)(result + 16) = 0;
  return result;
}

id getPFCropUtilitiesCoreClass()
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
  v0 = (void *)getPFCropUtilitiesCoreClass_softClass;
  v7 = getPFCropUtilitiesCoreClass_softClass;
  if (!getPFCropUtilitiesCoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPFCropUtilitiesCoreClass_block_invoke;
    v3[3] = &unk_2514D0640;
    v3[4] = &v4;
    __getPFCropUtilitiesCoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_244367C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPFCropUtilitiesCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  void *v4;
  void *v5;

  if (!PhotosFormatsLibraryCore_frameworkLibrary)
    PhotosFormatsLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!PhotosFormatsLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *PhotosFormatsLibrary(void)");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, CFSTR("PXSyntheticAsset.m"), 26, CFSTR("%s"), 0);

    goto LABEL_8;
  }
  result = objc_getClass("PFCropUtilitiesCore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPFCropUtilitiesCoreClass(void)_block_invoke");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXSyntheticAsset.m"), 27, CFSTR("Unable to find class %s"), "PFCropUtilitiesCore");

LABEL_8:
    __break(1u);
  }
  getPFCropUtilitiesCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id PXChangeDetailsCoalescerGetLog()
{
  if (PXChangeDetailsCoalescerGetLog_predicate != -1)
    dispatch_once(&PXChangeDetailsCoalescerGetLog_predicate, &__block_literal_global_5679);
  return (id)PXChangeDetailsCoalescerGetLog_log;
}

_PXChangeDetailsEntry *_PXChangeDetailsEntryForSection(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _PXChangeDetailsEntry *v5;
  void *v6;
  _PXChangeDetailsEntry *v7;
  id v8;
  _PXChangeDetailsEntry *v9;
  _PXChangeDetailsEntry *v10;
  _QWORD v12[4];
  id v13;
  _PXChangeDetailsEntry *v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "itemChangesInSection:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[_PXChangeDetailsEntry initWithIndex:changeDetails:]([_PXChangeDetailsEntry alloc], "initWithIndex:changeDetails:", a1, v4);
  objc_msgSend(v3, "itemsWithSubitemChangesInSection:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = ___PXChangeDetailsEntryForSection_block_invoke;
  v12[3] = &unk_2514D06A0;
  v13 = v3;
  v15 = a1;
  v7 = v5;
  v14 = v7;
  v8 = v3;
  objc_msgSend(v6, "enumerateIndexesUsingBlock:", v12);
  v9 = v14;
  v10 = v7;

  return v10;
}

uint64_t PXMediaTypeForAssets(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v12;
    v6 = 1;
LABEL_3:
    v7 = 0;
    v8 = v4;
    while (1)
    {
      if (*(_QWORD *)v12 != v5)
        objc_enumerationMutation(v1);
      v9 = objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7), "mediaType", (_QWORD)v11);
      v4 = v9;
      if ((v6 & 1) == 0)
      {
        v4 = v8;
        if (v8 != v9)
          break;
      }
      v6 = 0;
      ++v7;
      v8 = v4;
      if (v3 == v7)
      {
        v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        v6 = 0;
        if (v3)
          goto LABEL_3;
        goto LABEL_12;
      }
    }
  }
  v4 = 0;
LABEL_12:

  return v4;
}

id PXDisplayAssetColorNormalizationData(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "fetchColorNormalizationData");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *PXDisplayAssetPlaybackStyleDescription(unint64_t a1)
{
  NSObject *v3;
  int v4;
  unint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (a1 < 6)
    return off_2514D0740[a1];
  PXAssertGetLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 134217984;
    v5 = a1;
    _os_log_error_impl(&dword_24430E000, v3, OS_LOG_TYPE_ERROR, "invalid playbackStyle %li", (uint8_t *)&v4, 0xCu);
  }

  return CFSTR("<invalid>");
}

__CFString *PXDisplayAssetDetailedCountsDescription(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = a1[1];
  v2 = a1[2];
  if (*a1 == 0x7FFFFFFFFFFFFFFFLL || v1 == 0x7FFFFFFFFFFFFFFFLL || v2 == 0x7FFFFFFFFFFFFFFFLL)
    return CFSTR("<detailed counts: invalid>");
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("<detailed counts: photos:%tu, videos:%tu, others:%tu>"), *a1, v1, v2);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void PXDisplayAssetDetailedCountsSubtract(unint64_t *a1@<X0>, unint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  unint64_t v6;
  BOOL v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE v22[24];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v6 = *a1;
  v8 = *a1 == 0x7FFFFFFFFFFFFFFFLL || a1[1] == 0x7FFFFFFFFFFFFFFFLL || a1[2] == 0x7FFFFFFFFFFFFFFFLL;
  if (v8
    || ((v9 = *a2, *a2 != 0x7FFFFFFFFFFFFFFFLL) ? (v10 = a2[1] == 0x7FFFFFFFFFFFFFFFLL) : (v10 = 1),
        !v10 ? (v11 = a2[2] == 0x7FFFFFFFFFFFFFFFLL) : (v11 = 1),
        v11))
  {
    PXAssertGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)v22 = *(_OWORD *)a1;
      *(_QWORD *)&v22[16] = a1[2];
      PXDisplayAssetDetailedCountsDescription(v22);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)v22 = *(_OWORD *)a2;
      *(_QWORD *)&v22[16] = a2[2];
      PXDisplayAssetDetailedCountsDescription(v22);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = v20;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v21;
      _os_log_fault_impl(&dword_24430E000, v12, OS_LOG_TYPE_FAULT, "Subtracting with invalid counts (%@ - %@)", v22, 0x16u);

    }
    v6 = *a1;
    v9 = *a2;
  }
  if (v6 < v9 || (v13 = a1[1], v14 = a2[1], v13 < v14) || (v15 = a1[2], v16 = a2[2], v15 < v16))
  {
    PXAssertGetLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_OWORD *)v22 = *(_OWORD *)a1;
      *(_QWORD *)&v22[16] = a1[2];
      PXDisplayAssetDetailedCountsDescription(v22);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_OWORD *)v22 = *(_OWORD *)a2;
      *(_QWORD *)&v22[16] = a2[2];
      PXDisplayAssetDetailedCountsDescription(v22);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v22 = 138412546;
      *(_QWORD *)&v22[4] = v18;
      *(_WORD *)&v22[12] = 2112;
      *(_QWORD *)&v22[14] = v19;
      _os_log_fault_impl(&dword_24430E000, v17, OS_LOG_TYPE_FAULT, "Subtracting a larger count from a smaller count (%@ - %@), which will underflow.", v22, 0x16u);

    }
    v6 = *a1;
    v13 = a1[1];
    v9 = *a2;
    v14 = a2[1];
    v15 = a1[2];
    v16 = a2[2];
  }
  *a3 = v6 - v9;
  a3[1] = v13 - v14;
  a3[2] = v15 - v16;
}

void sub_24436B1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PXSimpleIndexPathDescription(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("{"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (*a1)
  {
    objc_msgSend(v2, "appendFormat:", CFSTR("%lu, "), *a1);
    if (*a1)
    {
      v4 = a1[1];
      v5 = a1[2];
      if (v4 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v6 = a1[3];
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v6 == 0x7FFFFFFFFFFFFFFFLL)
            goto LABEL_14;
          goto LABEL_13;
        }
      }
      else
      {
        if (v5 == 0x7FFFFFFFFFFFFFFFLL)
        {
          objc_msgSend(v3, "appendFormat:", CFSTR("%lu"), a1[1], v8, v9);
          goto LABEL_14;
        }
        v6 = a1[3];
      }
      if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_13:
        objc_msgSend(v3, "appendFormat:", CFSTR("%lu, %lu, %lu"), v4, a1[2], v6);
        goto LABEL_14;
      }
      objc_msgSend(v3, "appendFormat:", CFSTR("%lu, %lu"), a1[1], v5, v9);
    }
  }
  else
  {
    objc_msgSend(v2, "appendString:", CFSTR("Null"));
  }
LABEL_14:
  objc_msgSend(v3, "appendFormat:", CFSTR("}"));
  return v3;
}

id PXIndexPathFromSimpleIndexPath(_QWORD *a1)
{
  BOOL v1;

  if (*a1)
    v1 = a1[2] == 0x7FFFFFFFFFFFFFFFLL;
  else
    v1 = 1;
  if (v1 || a1[3] != 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  objc_msgSend(MEMORY[0x24BDD15D8], "px_indexPathForItem:inSection:");
  return (id)objc_claimAutoreleasedReturnValue();
}

void PXSimpleIndexPathFromIndexPath(uint64_t a1@<X0>, void *a2@<X1>, int64x2_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "length") == 3)
  {
    v5 = objc_msgSend(v11, "indexAtPosition:", 0);
    v6 = objc_msgSend(v11, "indexAtPosition:", 1);
    v7 = objc_msgSend(v11, "indexAtPosition:", 2);
    a3->i64[0] = a1;
    a3->i64[1] = v5;
    a3[1].i64[0] = v6;
    a3[1].i64[1] = v7;
  }
  else if (objc_msgSend(v11, "length") == 2)
  {
    v8 = objc_msgSend(v11, "indexAtPosition:", 0);
    v9 = objc_msgSend(v11, "indexAtPosition:", 1);
    a3->i64[0] = a1;
    a3->i64[1] = v8;
    a3[1].i64[0] = v9;
    a3[1].i64[1] = 0x7FFFFFFFFFFFFFFFLL;
  }
  else if (objc_msgSend(v11, "length") == 1)
  {
    v10 = objc_msgSend(v11, "indexAtPosition:", 0);
    a3->i64[0] = a1;
    a3->i64[1] = v10;
    a3[1] = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
  }
  else
  {
    *a3 = *(int64x2_t *)PXSimpleIndexPathNull;
    a3[1] = *(int64x2_t *)&PXSimpleIndexPathNull[16];
  }

}

uint64_t PXSimpleIndexPathCompare(_QWORD *a1, _QWORD *a2)
{
  BOOL v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  v3 = __OFSUB__(*a1, *a2);
  v2 = (uint64_t)(*a1 - *a2) < 0;
  if (*a1 != *a2)
    goto LABEL_9;
  v4 = a1[1];
  v5 = a2[1];
  v3 = __OFSUB__(v4, v5);
  v2 = v4 - v5 < 0;
  if (v4 != v5)
    goto LABEL_9;
  v6 = a1[2];
  v7 = a2[2];
  v3 = __OFSUB__(v6, v7);
  v2 = v6 - v7 < 0;
  if (v6 == v7)
  {
    v8 = a1[3];
    v9 = a2[3];
    v3 = __OFSUB__(v8, v9);
    v10 = v8 == v9;
    v2 = v8 - v9 < 0;
    v11 = -1;
    if (v2 == v3)
      v11 = 1;
    if (v10)
      return 0;
    else
      return v11;
  }
  else
  {
LABEL_9:
    if (v2 != v3)
      return -1;
    else
      return 1;
  }
}

void sub_24436BD4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

void sub_24436C6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24436C938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6480(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6481(uint64_t a1)
{

}

uint64_t PXColorSpaceIsGrayscale(unint64_t a1)
{
  return (a1 > 0xF) | (0xAu >> a1) & 1;
}

uint64_t PXGetColorSpaceName(uint64_t a1)
{
  uint64_t result;

  result = 0;
  while (colorspaces[result] != a1)
  {
    if (++result == 15)
      return 0;
  }
  return result;
}

id PXCanonicalErrorForError(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v10;
  void *v11;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSError * _Nonnull PXCanonicalErrorForError(NSError *__strong _Nonnull)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("PXError.m"), 73, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  v2 = v1;
  objc_msgSend(v2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BDD1398];
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = v2;
  if (v5)
  {
    v7 = v2;
    do
    {
      v6 = v5;

      objc_msgSend(v6, "userInfo");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v6;
    }
    while (v5);
  }

  return v6;
}

id PXDebugDescriptionForError(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v8;
  void *v9;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString * _Nonnull PXDebugDescriptionForError(NSError *__strong _Nonnull)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXError.m"), 84, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("error"));

  }
  objc_msgSend(v1, "userInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x24BDD0BA0]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v1, "localizedDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

void sub_24436E7C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24436EAE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PXIndexSetIsEquivalentToIndexSet(void *a1, void *a2)
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
  else if (v3 && (v4 = v3, v5))
  {
    v6 = objc_msgSend(v3, "isEqualToIndexSet:", v5);
  }
  else
  {
    v6 = objc_msgSend(v4, "count") == 0;
  }

  return v6;
}

void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  objc_class *v17;
  void *v18;
  objc_class *v19;
  void *v20;
  id v21;

  v9 = a1;
  v10 = objc_msgSend(v9, "extendedHitTestInsetsEdges");
  v21 = v9;
  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(__strong id<PXDynamicHitTestInsetsView> _Nonnull, PXEdgeInsets)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (objc_class *)objc_opt_class();
    NSStringFromClass(v19);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "px_descriptionForAssertionMessage");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXDynamicHitTestInsetsView.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("view"), v18, v20);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXDynamicHitTestInsetsViewUpdateHitTestInsetsWithDefaultOutsets(__strong id<PXDynamicHitTestInsetsView> _Nonnull, PXEdgeInsets)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("PXDynamicHitTestInsetsView.m"), 24, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("view"), v18);
  }

LABEL_3:
  if ((v10 & 1) != 0)
    v11 = 30.0;
  else
    v11 = a2;
  if ((v10 & 2) != 0)
    v12 = 30.0;
  else
    v12 = a3;
  if ((v10 & 4) != 0)
    v13 = 30.0;
  else
    v13 = a4;
  if ((v10 & 8) != 0)
    v14 = 30.0;
  else
    v14 = a5;
  objc_msgSend(v21, "setHitTestInsets:", -v11, -v12, -v13, -v14);

}

double PXDynamicHitTestOutsetsWithDefaultOutsetsAndExtendedEdges(char a1)
{
  double result;

  if ((a1 & 1) != 0)
    return 30.0;
  return result;
}

uint64_t PXImageOrientationFromCGImagePropertyOrientation(int a1)
{
  if ((a1 - 2) > 6)
    return 0;
  else
    return qword_24438BA18[a1 - 2];
}

const __CFString *PXGColorSpaceNameDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0xE)
    return CFSTR("Undefined");
  else
    return off_2514D0A58[a1 - 1];
}

const __CFString *PXGPixelFormatNameDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("Undefined");
  else
    return off_2514D0AD0[a1 - 1];
}

void sub_244371C2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v8 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t PXUpdateFlagsInvalidate(uint64_t *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v6;
  void *v7;

  v2 = *a1;
  v3 = *((unsigned __int8 *)a1 + 16);
  if (!a2 || v2)
  {
    if (!*((_BYTE *)a1 + 16))
      goto LABEL_8;
  }
  else if (!*((_BYTE *)a1 + 16))
  {
    v3 = *((_BYTE *)a1 + 17) == 0;
    goto LABEL_8;
  }
  if ((a1[1] & a2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL PXUpdateFlagsInvalidate(PXUpdateFlags * _Nonnull, NSUInteger)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXUpdateSwiftOverlay.m"), 13, CFSTR("invalidating %lu after it already has been updated"), a2);

    abort();
  }
  v3 = 0;
LABEL_8:
  *a1 = v2 | a2;
  return v3;
}

void PXUpdateFlagsWillUpdate(uint64_t a1)
{
  void *v1;
  id v2;

  *(_BYTE *)(a1 + 17) = 1;
  if (*(_BYTE *)(a1 + 16))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXUpdateFlagsWillUpdate(PXUpdateFlags * _Nonnull)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PXUpdateSwiftOverlay.m"), 17, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(*updateFlags).isPerformingUpdate"));

  }
}

void PXUpdateFlagsDidUpdate(uint64_t a1)
{
  void *v1;
  id v2;

  if (*(_BYTE *)(a1 + 17))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXUpdateFlagsDidUpdate(PXUpdateFlags * _Nonnull)");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("PXUpdateSwiftOverlay.m"), 21, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(*updateFlags).willPerformUpdate"));

  }
}

BOOL PXUpdateShouldBeginUpdates(uint64_t *a1)
{
  uint64_t v1;
  void *v4;
  void *v5;

  *((_BYTE *)a1 + 17) = 0;
  v1 = *a1;
  if (*a1)
  {
    if (*((_BYTE *)a1 + 16))
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL PXUpdateShouldBeginUpdates(PXUpdateFlags * _Nonnull)");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("PXUpdateSwiftOverlay.m"), 25, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!(*updateFlags).isPerformingUpdate"));

    }
    *((_BYTE *)a1 + 16) = 1;
    a1[1] = 0;
  }
  return v1 != 0;
}

void PXUpdateEndUpdates(uint64_t a1)
{
  void *v2;
  id v3;

  *(_BYTE *)(a1 + 16) = 0;
  if (*(_QWORD *)a1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void PXUpdateEndUpdates(PXUpdateFlags * _Nonnull)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("PXUpdateSwiftOverlay.m"), 29, CFSTR("still needing to update %lu after update pass"), *(_QWORD *)a1);

  }
}

BOOL PXUpdateIsUpdateNeeded(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  void *v6;
  void *v7;

  if (!*((_BYTE *)a1 + 16))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL PXUpdateIsUpdateNeeded(PXUpdateFlags * _Nonnull, NSUInteger)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXUpdateSwiftOverlay.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(*updateFlags).isPerformingUpdate"));

  }
  v4 = *a1;
  a1[1] |= a2;
  if ((v4 & a2) != 0)
    *a1 = v4 & ~a2;
  return (v4 & a2) != 0;
}

double PXClampGreatherThanOrEqualToZero(double result)
{
  if (result < 0.0)
    return 0.0;
  return result;
}

double PXClampLessThanOrEqualToZero(double result)
{
  if (result > 0.0)
    return 0.0;
  return result;
}

double PXFloatNormalize(double a1, double a2, double a3)
{
  return (a2 - a1) / (a3 - a1);
}

double PXFloatDenormalize(double a1, double a2, double a3)
{
  return a1 + a2 * (a3 - a1);
}

double PXMapValueFromRangeToNewRange(double a1, double a2, double a3, double a4, double a5)
{
  return a4 + (a5 - a4) * ((a1 - a2) / (a3 - a2));
}

double PXProjectValueWithDecelerationRate(double a1, double a2, double a3)
{
  return a2 / 1000.0 * a3 / (1.0 - a3) + a1;
}

double PXPointMultiplyWithFloat(double a1, double a2, double a3)
{
  return a1 * a3;
}

double PXPointByLinearlyInterpolatingPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5 * (a3 - a1);
}

double PXPointDistanceFromOrigin(double a1, double a2)
{
  return fabs(hypot(a1 - *MEMORY[0x24BDBEFB0], a2 - *(double *)(MEMORY[0x24BDBEFB0] + 8)));
}

uint64_t PXPointIsValid()
{
  uint64_t result;

  result = CGFloatIsValid();
  if ((_DWORD)result)
    return CGFloatIsValid();
  return result;
}

BOOL PXPointEqualToPointWithTolerence(double a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v5;

  v5 = vabdd_f64(a1, a3) <= a5;
  return vabdd_f64(a2, a4) <= a5 && v5;
}

double PXPointRoundToPixel(double a1, double a2, double a3)
{
  return round(a1 * a3) / a3;
}

double PXPointFloorToPixel(double a1, double a2, double a3)
{
  return floor(a1 * a3) / a3;
}

double PXPointCeilingToPixel(double a1, double a2, double a3)
{
  return ceil(a1 * a3) / a3;
}

double PXPointNormalize(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double PXPointDenormalize(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

double PXContentOffsetFlippedHorizontally(double a1, double a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, double a7)
{
  double MaxX;
  CGRect v15;
  CGRect v16;

  v15.origin.x = a3;
  v15.origin.y = a4;
  v15.size.width = a5;
  v15.size.height = a6;
  MaxX = CGRectGetMaxX(v15);
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  return MaxX - (a7 + a1 - CGRectGetMinX(v16));
}

double PXVelocityFlippedHorizontally(double a1)
{
  return -a1;
}

double PXPointTransposed(double a1, double a2)
{
  return a2;
}

id PXPointDescription(double a1, double a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{%.2f, %.2f}"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t PXSizeIsValid()
{
  uint64_t result;

  result = CGFloatIsValid();
  if ((_DWORD)result)
    return CGFloatIsValid();
  return result;
}

double PXSizeTranspose(double a1, double a2)
{
  return a2;
}

BOOL PXAspectRatioIsPortrait(double a1)
{
  return a1 < 1.0;
}

uint64_t PXSizeApproximatelyEqualOrBiggerThanSize(double a1, double a2, double a3, double a4)
{
  _BOOL4 v5;

  if (a1 <= a3 && vabdd_f64(a1, a3) > 0.00000999999975)
    return 0;
  v5 = vabdd_f64(a2, a4) <= 0.00000999999975;
  return a2 > a4 || v5;
}

double PXSizeRoundToEven(double a1)
{
  double v1;

  v1 = round(a1 * 0.5);
  return round(v1 + v1);
}

double PXSizeRound(double a1)
{
  return round(a1);
}

double PXSizeClampToSize(double a1, double a2, double a3)
{
  return fmin(a1, a3);
}

double PXSizeByLinearlyInterpolatingSize(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a5 * (a3 - a1);
}

double PXSizeSafeInset(double a1, double a2, double a3)
{
  double v3;
  double v4;

  if (a1 >= a2)
    v3 = a2;
  else
    v3 = a1;
  v4 = v3 * 0.5;
  if (v4 <= a3)
    a3 = v4;
  return a1 - a3 * 2.0;
}

id PXSizeDescription(double a1, double a2)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{%.2f, %.2f}"), *(_QWORD *)&a1, *(_QWORD *)&a2);
}

void PXRectDiff(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  id v17;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double MaxX;
  double MaxY;
  double MinX;
  double MinY;
  _QWORD v28[4];
  id v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  _QWORD v34[4];
  id v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v17 = a1;
  v40.origin.x = a2;
  v40.origin.y = a3;
  v40.size.width = a4;
  v40.size.height = a5;
  v49.origin.x = a6;
  v49.origin.y = a7;
  v49.size.width = a8;
  v49.size.height = a9;
  if (CGRectIntersectsRect(v40, v49))
  {
    if (a2 == a6 && a4 == a8)
    {
      v45.origin.x = a2;
      v45.origin.y = a3;
      v45.size.width = a4;
      v45.size.height = a5;
      MinY = CGRectGetMinY(v45);
      v46.origin.x = a2;
      v46.origin.y = a3;
      v46.size.width = a4;
      v46.size.height = a5;
      MaxY = CGRectGetMaxY(v46);
      v47.origin.x = a6;
      v47.origin.y = a7;
      v47.size.width = a8;
      v47.size.height = a9;
      v23 = CGRectGetMinY(v47);
      v48.origin.x = a6;
      v48.origin.y = a7;
      v48.size.width = a8;
      v48.size.height = a9;
      v21 = CGRectGetMaxY(v48);
      v34[0] = MEMORY[0x24BDAC760];
      v34[1] = 3221225472;
      v34[2] = __PXRectDiff_block_invoke;
      v34[3] = &unk_2514D0DA8;
      v36 = a2;
      v37 = a3;
      v38 = a4;
      v39 = a5;
      v35 = v17;
      _PXDiffRanges(v34, MinY, MaxY, v23, v21);
      v20 = v35;
      goto LABEL_11;
    }
    if (a3 == a7 && a5 == a9)
    {
      v41.origin.x = a2;
      v41.origin.y = a3;
      v41.size.width = a4;
      v41.size.height = a5;
      MinX = CGRectGetMinX(v41);
      v42.origin.x = a2;
      v42.origin.y = a3;
      v42.size.width = a4;
      v42.size.height = a5;
      MaxX = CGRectGetMaxX(v42);
      v43.origin.x = a6;
      v43.origin.y = a7;
      v43.size.width = a8;
      v43.size.height = a9;
      v22 = CGRectGetMinX(v43);
      v44.origin.x = a6;
      v44.origin.y = a7;
      v44.size.width = a8;
      v44.size.height = a9;
      v19 = CGRectGetMaxX(v44);
      v28[0] = MEMORY[0x24BDAC760];
      v28[1] = 3221225472;
      v28[2] = __PXRectDiff_block_invoke_2;
      v28[3] = &unk_2514D0DA8;
      v30 = a2;
      v31 = a3;
      v32 = a4;
      v33 = a5;
      v29 = v17;
      _PXDiffRanges(v28, MinX, MaxX, v22, v19);
      v20 = v29;
LABEL_11:

      goto LABEL_12;
    }
  }
  (*((void (**)(id, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))v17 + 2))(v17, 1, a2, a3, a4, a5);
  (*((void (**)(id, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))v17 + 2))(v17, -1, a6, a7, a8, a9);
LABEL_12:

}

void _PXDiffRanges(void *a1, double a2, double a3, double a4, double a5)
{
  void (**v9)(id, uint64_t, __n128, __n128);
  __n128 v10;
  __n128 v11;
  BOOL v12;
  __n128 v13;
  __n128 v14;
  void (**v15)(id, uint64_t, __n128, __n128);

  v9 = a1;
  v12 = a4 < a3 && a5 > a2;
  v15 = v9;
  if (!v12)
  {
    ((void (*)(void (**)(id, uint64_t, __n128, __n128), uint64_t, double, double))v9[2])(v9, 1, a2, a3);
    v13.n128_f64[0] = a4;
    v14.n128_f64[0] = a5;
    v15[2](v15, -1, v13, v14);
LABEL_14:
    v9 = v15;
    goto LABEL_15;
  }
  if (a5 > a3)
  {
    ((void (*)(void (**)(id, uint64_t, __n128, __n128), uint64_t, double, double))v9[2])(v9, -1, a3, a5);
    v9 = v15;
  }
  if (a4 < a2)
  {
    ((void (*)(void (**)(id, uint64_t, __n128, __n128), uint64_t, double, double))v9[2])(v15, -1, a4, a2);
    v9 = v15;
  }
  if (a5 < a3)
  {
    ((void (*)(void (**)(id, uint64_t, __n128, __n128), uint64_t, double, double))v9[2])(v15, 1, a5, a3);
    v9 = v15;
  }
  if (a4 > a2)
  {
    v10.n128_f64[0] = a2;
    v11.n128_f64[0] = a4;
    v9[2](v15, 1, v10, v11);
    goto LABEL_14;
  }
LABEL_15:

}

uint64_t PXRectIntersectWithBasicRemainders(CGFloat *a1, _OWORD *a2, _OWORD *a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9, CGFloat a10, CGFloat a11)
{
  double *v22;
  _BOOL4 v23;
  _BOOL4 v24;
  uint64_t *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGSize v30;
  CGSize v31;
  uint64_t v32;
  CGSize *v34;
  CGSize *v35;
  CGSize *v36;
  CGSize *v37;
  double MaxY;
  double MinY;
  double MaxX;
  double MinX;
  CGSize v42;
  CGSize v43;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  _QWORD v48[7];
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  CGSize *v54;
  uint64_t v55;
  void *v56;
  CGSize v57;
  CGSize v58;
  uint64_t v59;
  CGSize *v60;
  uint64_t v61;
  void *v62;
  CGSize v63;
  CGSize size;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;

  v65 = CGRectIntersection(*(CGRect *)&a4, *(CGRect *)&a8);
  y = v65.origin.y;
  x = v65.origin.x;
  height = v65.size.height;
  width = v65.size.width;
  v59 = 0;
  v60 = (CGSize *)&v59;
  v61 = 0x4010000000;
  v62 = &unk_244396D4B;
  v22 = (double *)MEMORY[0x24BDBF070];
  v65.size = *(CGSize *)(MEMORY[0x24BDBF070] + 16);
  v63 = (CGSize)*MEMORY[0x24BDBF070];
  size = v65.size;
  v53 = 0;
  v54 = (CGSize *)&v53;
  v55 = 0x4010000000;
  v56 = &unk_244396D4B;
  v42 = v65.size;
  v43 = v63;
  v57 = v63;
  v58 = v65.size;
  v49 = 0;
  v50 = &v49;
  v51 = 0x2020000000;
  v52 = 0;
  v23 = a6 == a10 && a4 == a8;
  v24 = a7 == a11 && a5 == a9;
  v66.origin.x = a4;
  v66.origin.y = a5;
  v66.size.width = a6;
  v66.size.height = a7;
  if (CGRectIsEmpty(v66)
    || (v67.origin.x = a8, v67.origin.y = a9, v67.size.width = a10, v67.size.height = a11, CGRectIsEmpty(v67)))
  {
    *((_BYTE *)v50 + 24) = 0;
  }
  else
  {
    v68.origin.x = a4;
    v68.origin.y = a5;
    v68.size.width = a6;
    v68.size.height = a7;
    v78.origin.x = a8;
    v78.origin.y = a9;
    v78.size.width = a10;
    v78.size.height = a11;
    if (CGRectEqualToRect(v68, v78))
    {
      *((_BYTE *)v50 + 24) = 1;
      v36 = v60;
      v60[2] = v43;
      v36[3] = v42;
      v37 = v54;
      v54[2] = v43;
      v37[3] = v42;
    }
    else
    {
      if (v23 || v24)
      {
        v69.origin.x = a4;
        v69.origin.y = a5;
        v69.size.width = a6;
        v69.size.height = a7;
        v79.origin.x = a8;
        v79.origin.y = a9;
        v79.size.width = a10;
        v79.size.height = a11;
        if (CGRectIntersectsRect(v69, v79))
          goto LABEL_30;
      }
      if (v23)
      {
        v70.origin.x = a4;
        v70.origin.y = a5;
        v70.size.width = a6;
        v70.size.height = a7;
        MaxY = CGRectGetMaxY(v70);
        v71.origin.x = a8;
        v71.origin.y = a9;
        v71.size.width = a10;
        v71.size.height = a11;
        if (MaxY == CGRectGetMinY(v71))
          goto LABEL_30;
        v72.origin.x = a4;
        v72.origin.y = a5;
        v72.size.width = a6;
        v72.size.height = a7;
        MinY = CGRectGetMinY(v72);
        v73.origin.x = a8;
        v73.origin.y = a9;
        v73.size.width = a10;
        v73.size.height = a11;
        if (MinY == CGRectGetMaxY(v73))
          goto LABEL_30;
      }
      if (v24)
      {
        v74.origin.x = a4;
        v74.origin.y = a5;
        v74.size.width = a6;
        v74.size.height = a7;
        MaxX = CGRectGetMaxX(v74);
        v75.origin.x = a8;
        v75.origin.y = a9;
        v75.size.width = a10;
        v75.size.height = a11;
        if (MaxX == CGRectGetMinX(v75))
          goto LABEL_30;
        v76.origin.x = a4;
        v76.origin.y = a5;
        v76.size.width = a6;
        v76.size.height = a7;
        MinX = CGRectGetMinX(v76);
        v77.origin.x = a8;
        v77.origin.y = a9;
        v77.size.width = a10;
        v77.size.height = a11;
        if (MinX == CGRectGetMaxX(v77))
        {
LABEL_30:
          *((_BYTE *)v50 + 24) = 1;
          v48[0] = MEMORY[0x24BDAC760];
          v48[1] = 3221225472;
          v48[2] = __PXRectIntersectWithBasicRemainders_block_invoke;
          v48[3] = &unk_2514D0DD0;
          v48[4] = &v49;
          v48[5] = &v53;
          v48[6] = &v59;
          PXRectDiff(v48, a4, a5, a6, a7, a8, a9, a10, a11);
        }
      }
    }
  }
  v25 = v50;
  if (*((_BYTE *)v50 + 24))
  {
    v27 = y;
    v26 = x;
    v29 = height;
    v28 = width;
    if (!a1)
      goto LABEL_13;
    goto LABEL_12;
  }
  v26 = *v22;
  v27 = v22[1];
  v28 = v22[2];
  v29 = v22[3];
  v34 = v60;
  v60[2] = v43;
  v34[3] = v42;
  v35 = v54;
  v54[2] = v43;
  v35[3] = v42;
  if (a1)
  {
LABEL_12:
    *a1 = v26;
    a1[1] = v27;
    a1[2] = v28;
    a1[3] = v29;
  }
LABEL_13:
  if (a2)
  {
    v30 = v60[3];
    *a2 = v60[2];
    a2[1] = v30;
  }
  if (a3)
  {
    v31 = v54[3];
    *a3 = v54[2];
    a3[1] = v31;
  }
  v32 = *((unsigned __int8 *)v25 + 24);
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&v59, 8);
  return v32;
}

void sub_244373368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 192), 8);
  _Unwind_Resume(a1);
}

uint64_t PXLargestSalientAspectFilledCropRect()
{
  return PFLargestSalientAspectFilledCropRect();
}

uint64_t PXRectCompareForHorizontalMovementInVerticalLayout(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  double MaxY;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  MinY = CGRectGetMinY(*(CGRect *)&a1);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  if (MinY < CGRectGetMinY(v21))
  {
    v22.origin.x = a1;
    v22.origin.y = a2;
    v22.size.width = a3;
    v22.size.height = a4;
    MaxY = CGRectGetMaxY(v22);
    v23.origin.x = a5;
    v23.origin.y = a6;
    v23.size.width = a7;
    v23.size.height = a8;
    if (MaxY < CGRectGetMaxY(v23))
      return -1;
  }
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  v18 = CGRectGetMinY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  if (v18 > CGRectGetMinY(v25))
  {
    v26.origin.x = a1;
    v26.origin.y = a2;
    v26.size.width = a3;
    v26.size.height = a4;
    v19 = CGRectGetMaxY(v26);
    v27.origin.x = a5;
    v27.origin.y = a6;
    v27.size.width = a7;
    v27.size.height = a8;
    if (v19 > CGRectGetMaxY(v27))
      return 1;
  }
  if (a1 >= a5)
    return a1 > a5;
  return -1;
}

uint64_t PXRectCompareForVerticalMovementInVerticalLayoutWithSourceRect(CGRect r2, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat r2a, CGFloat r2_8, CGFloat r2_16, CGFloat r2_24)
{
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  _BOOL4 v24;
  _BOOL4 v25;
  double MinX;
  double v27;
  double v28;
  uint64_t result;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MidY;
  double v36;
  double v37;
  double v38;
  CGFloat x;
  CGFloat width;
  CGFloat v42;
  CGFloat height;
  CGFloat y;
  double MinY;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  height = r2.size.height;
  y = r2.origin.y;
  x = r2.origin.x;
  width = r2.size.width;
  v21 = r2.origin.y;
  v60.size.height = r2_24;
  v60.origin.y = r2_8;
  v60.origin.x = r2a;
  v46.origin.x = a2;
  v46.origin.y = a3;
  v42 = a3;
  v46.size.width = a4;
  v46.size.height = a5;
  v60.size.width = r2_16;
  v47 = CGRectUnion(v46, v60);
  v22 = v47.origin.x;
  v23 = v47.size.width;
  v47.origin.y = v21;
  v47.size.height = height;
  v61.origin.x = a2;
  v61.origin.y = a3;
  v61.size.width = a4;
  v61.size.height = a5;
  v24 = CGRectIntersectsRect(v47, v61);
  v48.origin.x = v22;
  v48.origin.y = y;
  v48.size.width = v23;
  v48.size.height = height;
  v62.origin.x = r2a;
  v62.origin.y = r2_8;
  v62.size.width = r2_16;
  v62.size.height = r2_24;
  v25 = CGRectIntersectsRect(v48, v62);
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  MinX = CGRectGetMinX(v49);
  v50.origin.x = a2;
  v50.origin.y = a3;
  v50.size.width = a4;
  v50.size.height = a5;
  v38 = CGRectGetMinX(v50) - MinX;
  v51.origin.x = r2a;
  v51.origin.y = r2_8;
  v51.size.width = r2_16;
  v51.size.height = r2_24;
  v37 = CGRectGetMinX(v51);
  v52.origin.x = x;
  v52.size.height = height;
  v52.origin.y = y;
  v52.size.width = width;
  MinY = CGRectGetMinY(v52);
  v53.origin.x = a2;
  v53.origin.y = a3;
  v53.size.width = a4;
  v53.size.height = a5;
  v27 = CGRectGetMinY(v53);
  v54.origin.x = r2a;
  v54.origin.y = r2_8;
  v54.size.width = r2_16;
  v54.size.height = r2_24;
  v28 = CGRectGetMinY(v54);
  if (v24 && !v25)
  {
    if (v38 > 0.0)
      return 1;
    else
      return -1;
  }
  v30 = v37 - MinX;
  if (v24 || !v25)
  {
    if (!v24 || !v25)
    {
      v55.origin.x = v22;
      v55.size.width = v23;
      v55.origin.y = v42;
      v55.size.height = a5;
      v63.origin.x = r2a;
      v63.origin.y = r2_8;
      v63.size.width = r2_16;
      v63.size.height = r2_24;
      if (CGRectIntersectsRect(v55, v63))
      {
        v31 = -v38;
        if (v38 >= 0.0)
          v31 = v38;
        v32 = -v30;
        if (v30 >= 0.0)
          v32 = v37 - MinX;
        if (v31 >= v32)
          return v31 > v32;
      }
      else
      {
        v56.origin.x = a2;
        v56.origin.y = v42;
        v56.size.width = a4;
        v56.size.height = a5;
        MidY = CGRectGetMidY(v56);
        v57.origin.x = r2a;
        v57.origin.y = r2_8;
        v57.size.width = r2_16;
        v57.size.height = r2_24;
        if (MidY >= CGRectGetMidY(v57))
        {
          v58.origin.x = a2;
          v58.origin.y = v42;
          v58.size.width = a4;
          v58.size.height = a5;
          v36 = CGRectGetMidY(v58);
          v59.origin.x = r2a;
          v59.origin.y = r2_8;
          v59.size.width = r2_16;
          v59.size.height = r2_24;
          return v36 > CGRectGetMidY(v59);
        }
      }
      return -1;
    }
    if (v38 > 0.0 && v30 <= 0.0)
      return 1;
    if (v38 <= 0.0 && v30 > 0.0)
      return -1;
    v33 = v27 - MinY;
    v34 = v28 - MinY;
    if (v38 > 0.0 && v30 > 0.0)
    {
      if (v38 <= v30)
      {
        if (v38 < v30)
          return 1;
        if (v33 <= v34)
          return v33 < v34;
      }
      return -1;
    }
    result = 0;
    if (v38 <= 0.0 && v30 <= 0.0)
    {
      if (v38 < v30)
        return -1;
      result = 1;
      if (v38 <= v30 && v33 <= v34)
      {
        if (v33 >= v34)
          return 0;
        return -1;
      }
    }
  }
  else if (v30 <= 0.0)
  {
    return 1;
  }
  else
  {
    return -1;
  }
  return result;
}

double PXRectWithSize()
{
  return 0.0;
}

double PXRectWithAspectRatioFittingRect(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a2 + a4 * 0.5;
  PFSizeWithAspectRatioFittingSize();
  return v4 + v5 * -0.5;
}

double PXRectWithAspectRatioFillingRect(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a2 + a4 * 0.5;
  PFSizeWithAspectRatioFillingSize();
  return v4 + v5 * -0.5;
}

CGFloat PXRectWithAspectRatioInsideRectContainingAsMuchAsPossibleOfRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, double a6, double a7, double a8, double a9, double a10, double a11, double a12)
{
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double Width;
  uint64_t v29;
  double LengthForAxis;
  double MinForAxis;
  double MaxForAxis;
  double v33;
  double v34;
  double v35;
  double v36;
  double v38;
  CGRect rect;
  double v40;
  CGRect v41;
  CGRect v42;

  rect.origin.x = a2;
  v20 = a2 + a4 * 0.5;
  v21 = a3 + a5 * 0.5;
  PFSizeWithAspectRatioFittingSize();
  v23 = v22;
  v25 = v24;
  v26 = v20 + v22 * -0.5;
  v27 = v21 + v24 * -0.5;
  rect.origin.y = v26;
  rect.size.width = v27;
  rect.size.height = v22;
  v40 = v24;
  v41.origin.x = v26;
  v41.origin.y = v27;
  v41.size.width = v23;
  v41.size.height = v25;
  Width = CGRectGetWidth(v41);
  v42.origin.x = rect.origin.x;
  v42.origin.y = a3;
  v42.size.width = a4;
  v42.size.height = a5;
  if (Width == CGRectGetWidth(v42))
    v29 = 1;
  else
    v29 = 2;
  LengthForAxis = PXRectGetLengthForAxis(v29, v26, v27, v23, v25);
  v38 = PXPointValueForAxis(v29, v26, v27);
  MinForAxis = PXRectGetMinForAxis(v29, rect.origin.x, a3, a4, a5);
  MaxForAxis = PXRectGetMaxForAxis(v29, rect.origin.x, a3, a4, a5);
  v33 = PXRectGetMinForAxis(v29, a9, a10, a11, a12);
  v34 = PXRectGetMaxForAxis(v29, a9, a10, a11, a12);
  if (v34 >= MinForAxis)
  {
    if (v33 > MaxForAxis)
    {
      MinForAxis = MaxForAxis - LengthForAxis;
    }
    else
    {
      if (v33 >= MaxForAxis)
        v35 = MaxForAxis;
      else
        v35 = v33;
      if (v35 <= MinForAxis)
        v35 = MinForAxis;
      if (v34 >= MaxForAxis)
        v34 = MaxForAxis;
      if (v34 <= MinForAxis)
        v34 = MinForAxis;
      if (v34 - v35 <= LengthForAxis)
      {
        if (v38 < v35)
          v35 = v38;
        if (v35 <= MinForAxis)
          v35 = MinForAxis;
        v36 = v34 - LengthForAxis;
        if (v35 >= MaxForAxis - LengthForAxis)
          v35 = MaxForAxis - LengthForAxis;
        if (v35 <= v36)
          MinForAxis = v36;
        else
          MinForAxis = v35;
      }
      else
      {
        MinForAxis = (v35 + v34 - LengthForAxis) * 0.5;
      }
    }
  }
  PXPointSetValueForAxis(&rect.origin.y, v29, MinForAxis);
  return rect.origin.y;
}

double PXRectFlippedHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX;
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15.origin.x = a5;
  v15.origin.y = a6;
  v15.size.width = a7;
  v15.size.height = a8;
  MaxX = CGRectGetMaxX(v15);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  v13 = MaxX - CGRectGetMaxX(v16);
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  CGRectGetMinY(v17);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  CGRectGetWidth(v18);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectGetHeight(v19);
  return v13;
}

double PXRectNormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double result;

  result = a1 - a5;
  if (a7 != 0.0)
    return result / a7;
  return result;
}

double PXRectDenormalize(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  return a5 + a1 * a7;
}

double PXRectSafeInset(double a1, double a2, double a3, double a4, CGFloat a5)
{
  double v5;
  double v6;
  double result;

  if (a3 >= a4)
    v5 = a4;
  else
    v5 = a3;
  v6 = v5 * 0.5;
  if (v6 <= a5)
    a5 = v6;
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, a5, a5);
  return result;
}

double PXRectRoundToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return round(a1 * a5) / a5;
}

double PXRectShrinkToPixel(double a1, double a2, double a3, double a4, double a5)
{
  return ceil(a1 * a5) / a5;
}

double PXRectClampPoint(double result, double a2, double a3, double a4, double a5)
{
  double v5;

  v5 = result + a3;
  if (a5 < v5)
    v5 = a5;
  if (result < v5)
    return v5;
  return result;
}

double PXRectEdgeValue(int a1, double result, double a3, double a4, double a5)
{
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = a3;
      break;
    case 2:
      result = result + a4;
      break;
    case 3:
      result = a3 + a5;
      break;
    default:
      result = NAN;
      break;
  }
  return result;
}

uint64_t PXRectEdgeOpposite(unsigned int a1)
{
  if (a1 > 3)
    return 0;
  else
    return dword_24438BC30[a1];
}

uint64_t PXRectEdgeFlippedHorizontally(int a1)
{
  if ((a1 - 1) > 2)
    return 2;
  else
    return dword_24438BB10[a1 - 1];
}

double PXRectArea(double a1, double a2, double a3, double a4)
{
  if (a3 == 0.0 || a4 == 0.0)
    return 0.0;
  if (a4 == *(double *)(MEMORY[0x24BE71BF0] + 8) && a3 == *MEMORY[0x24BE71BF0])
    return 0.0;
  else
    return a3 * a4;
}

uint64_t PXRectIsValid()
{
  if (CGFloatIsValid() && CGFloatIsValid() && CGFloatIsValid())
    return CGFloatIsValid();
  else
    return 0;
}

BOOL PXRectIdenticalToRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  return a1 == a5 && a2 == a6 && a3 == a7 && a4 == a8;
}

double PXRectWithMinimumSize(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double result;

  v6 = (a3 - a5) * 0.5;
  if (v6 > 0.0)
    v6 = 0.0;
  v7 = (a4 - a6) * 0.5;
  if (v7 > 0.0)
    v7 = 0.0;
  *(_QWORD *)&result = (unint64_t)CGRectInset(*(CGRect *)&a1, v6, v7);
  return result;
}

double PXRectByLinearlyInterpolatingRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a9 * (a5 - a1);
}

double PXRectShiftedInsideConstrainingRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7)
{
  double v7;
  double v8;
  double result;

  v7 = a5 + a7;
  if (a1 + a3 >= v7)
    v8 = v7;
  else
    v8 = a1 + a3;
  if (a5 >= v8)
    v8 = a5;
  result = a1 + v8 - (a1 + a3);
  if (result >= v7)
    result = v7;
  if (a5 >= result)
    return a5;
  return result;
}

double PXRectScaleFromCenter(double a1, double a2, double a3, double a4, double a5)
{
  return a1 + a3 * 0.5 + a3 * a5 * -0.5;
}

double PXRectTransposed(double a1, double a2)
{
  return a2;
}

void PXRectRotated(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, float a5)
{
  float MidX;
  float MidY;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;
  CGRect v17;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v16.origin.x = a1;
  v16.origin.y = a2;
  v16.size.width = a3;
  v16.size.height = a4;
  MidY = CGRectGetMidY(v16);
  memset(&v15, 0, sizeof(v15));
  CGAffineTransformMakeTranslation(&v13, MidX, MidY);
  CGAffineTransformRotate(&v14, &v13, a5);
  CGAffineTransformTranslate(&v15, &v14, (float)-MidX, (float)-MidY);
  v12 = v15;
  v17.origin.x = a1;
  v17.origin.y = a2;
  v17.size.width = a3;
  v17.size.height = a4;
  CGRectApplyAffineTransform(v17, &v12);
}

id PXRectDescription(double a1, double a2, double a3, double a4)
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("{{%.2f, %.2f}, {%.2f, %.2f}}"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

BOOL PXRectContainsRectWithTolerance(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9)
{
  CGRect v22;
  CGRect v23;

  v22 = CGRectInset(*(CGRect *)&a1, -a9, -a9);
  v23.origin.x = a5;
  v23.origin.y = a6;
  v23.size.width = a7;
  v23.size.height = a8;
  return CGRectContainsRect(v22, v23);
}

BOOL PXRectStrictlyContainsPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  CGRect v13;
  CGRect v14;
  CGRect v15;

  if (CGRectGetMinX(*(CGRect *)&a1) >= a5)
    return 0;
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  if (CGRectGetMaxX(v13) <= a5)
    return 0;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  if (CGRectGetMinY(v14) >= a6)
    return 0;
  v15.origin.x = a1;
  v15.origin.y = a2;
  v15.size.width = a3;
  v15.size.height = a4;
  return CGRectGetMaxY(v15) > a6;
}

BOOL PXRectStrictlyContainsAnyVertexOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGFloat MinY;
  CGFloat v17;
  CGFloat MaxY;
  CGFloat MaxX;
  CGFloat v20;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat MinX;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v26.size.height = a8;
  MinX = CGRectGetMinX(v26);
  v24 = a5;
  v27.origin.x = a5;
  v27.origin.y = a6;
  v27.size.width = a7;
  v27.size.height = a8;
  MinY = CGRectGetMinY(v27);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, MinX, MinY))
    return 1;
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  v17 = CGRectGetMinX(v28);
  v29.origin.x = v24;
  v29.origin.y = a6;
  v29.size.width = a7;
  v29.size.height = a8;
  MaxY = CGRectGetMaxY(v29);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, v17, MaxY))
    return 1;
  v30.origin.x = v24;
  v30.origin.y = a6;
  v30.size.width = a7;
  v30.size.height = a8;
  MaxX = CGRectGetMaxX(v30);
  v31.origin.x = v24;
  v31.origin.y = a6;
  v31.size.width = a7;
  v31.size.height = a8;
  v20 = CGRectGetMinY(v31);
  if (PXRectStrictlyContainsPoint(a1, a2, a3, a4, MaxX, v20))
    return 1;
  v32.origin.x = v24;
  v32.origin.y = a6;
  v32.size.width = a7;
  v32.size.height = a8;
  v22 = CGRectGetMaxX(v32);
  v33.origin.x = v24;
  v33.origin.y = a6;
  v33.size.width = a7;
  v33.size.height = a8;
  v23 = CGRectGetMaxY(v33);
  return PXRectStrictlyContainsPoint(a1, a2, a3, a4, v22, v23);
}

double PXEdgeInsetsBetweenRects(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  double v16;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  CGRectGetMinX(*(CGRect *)&a1);
  v20.origin.x = a5;
  v20.origin.y = a6;
  v20.size.width = a7;
  v20.size.height = a8;
  CGRectGetMinX(v20);
  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  CGRectGetMaxX(v21);
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  v16 = MinY - CGRectGetMinY(v24);
  v25.origin.x = a5;
  v25.origin.y = a6;
  v25.size.width = a7;
  v25.size.height = a8;
  CGRectGetMaxY(v25);
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  CGRectGetMaxY(v26);
  return v16;
}

double PXEdgeInsetsWithValueForEdges(char a1, double a2)
{
  if ((a1 & 1) != 0)
    return a2;
  else
    return 0.0;
}

double PXInsetRectWithValueForEdges(char a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;

  if ((a1 & 2) != 0)
    v6 = a6;
  else
    v6 = 0.0;
  return a2 + v6;
}

void PXEdgeInsetsForRectsFromEdgeInsetsForRect(uint64_t a1, uint64_t a2, uint64_t a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10, double a11)
{
  uint64_t v11;
  CGFloat *v12;
  double *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  BOOL IsEmpty;
  double v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  if (a3 >= 1)
  {
    v11 = a3;
    v30 = a8 + a5;
    v28 = a10 - (a5 + a7);
    v29 = a9 + a4;
    v27 = a11 - (a4 + a6);
    v12 = (CGFloat *)(a2 + 16);
    v13 = (double *)(a1 + 16);
    do
    {
      v14 = *(v12 - 2);
      v15 = *(v12 - 1);
      v16 = *v12;
      v17 = v12[1];
      v31.origin.x = v14;
      v31.origin.y = v15;
      v31.size.width = *v12;
      v31.size.height = v17;
      v33.origin.y = v29;
      v33.origin.x = v30;
      v33.size.height = v27;
      v33.size.width = v28;
      v32 = CGRectIntersection(v31, v33);
      x = v32.origin.x;
      y = v32.origin.y;
      width = v32.size.width;
      height = v32.size.height;
      IsEmpty = CGRectIsEmpty(v32);
      v23 = 0.0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      if (!IsEmpty)
        v23 = PXEdgeInsetsBetweenRects(x, y, width, height, v14, v15, v16, v17);
      *(v13 - 2) = v23;
      *((_QWORD *)v13 - 1) = v24;
      v12 += 4;
      *(_QWORD *)v13 = v25;
      *((_QWORD *)v13 + 1) = v26;
      v13 += 4;
      --v11;
    }
    while (v11);
  }
}

double PXEdgeInsetsByFlippingVertically(double a1, double a2, double a3)
{
  return a3;
}

BOOL PXEdgeInsetsIsZero(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = a3 == 0.0;
  if (a4 != 0.0)
    v4 = 0;
  if (a1 != 0.0)
    v4 = 0;
  return a2 == 0.0 && v4;
}

BOOL PXEdgeInsetsIsNull(double a1, double a2, double a3, double a4)
{
  return a2 == INFINITY && a1 == INFINITY && a4 == INFINITY && a3 == INFINITY;
}

double PXEdgeInsetsMax(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5)
    return a5;
  return result;
}

double PXEdgeInsetsMaxEachEdge(double result, double a2, double a3, double a4, double a5)
{
  if (result < a5)
    return a5;
  return result;
}

double PXEdgeInsetsAddValueForEdges(double *a1, char a2, double result)
{
  if ((a2 & 1) != 0)
  {
    *a1 = *a1 + result;
    if ((a2 & 2) == 0)
    {
LABEL_3:
      if ((a2 & 4) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((a2 & 2) == 0)
  {
    goto LABEL_3;
  }
  a1[1] = a1[1] + result;
  if ((a2 & 4) == 0)
  {
LABEL_4:
    if ((a2 & 8) == 0)
      return result;
LABEL_9:
    result = a1[3] + result;
    a1[3] = result;
    return result;
  }
LABEL_8:
  a1[2] = a1[2] + result;
  if ((a2 & 8) != 0)
    goto LABEL_9;
  return result;
}

double PXEdgeInsetsScale(double a1, double a2, double a3, double a4, double a5)
{
  return a1 * a5;
}

double PXEdgeInsetsByLinearlyInterpolatingInsets(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a9 * (a5 - a1);
}

uint64_t PXEdgesGetCGRectEdge(uint64_t a1, _DWORD *a2)
{
  uint64_t v2;

  v2 = a1 - 1;
  if ((unint64_t)(a1 - 1) > 7 || ((0x8Bu >> v2) & 1) == 0)
    return 0;
  *a2 = dword_24438BB1C[v2];
  return 1;
}

CGFloat PXAffineTransformMakeFromRects@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>, CGFloat a7@<D5>, CGFloat a8@<D6>, CGFloat a9@<D7>)
{
  CGFloat v17;
  CGFloat MidY;
  double Height;
  CGFloat v20;
  __int128 v21;
  __int128 v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat MidX;
  CGFloat v27;
  __int128 v28;
  __int128 v29;
  CGFloat result;
  double sx;
  double sxa;
  CGFloat v34;
  CGAffineTransform v36;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  v17 = -CGRectGetMidX(*(CGRect *)&a2);
  v40.origin.x = a2;
  v40.origin.y = a3;
  v40.size.width = a4;
  v40.size.height = a5;
  MidY = CGRectGetMidY(v40);
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, v17, -MidY);
  v34 = a6;
  v41.origin.x = a6;
  v41.origin.y = a7;
  v41.size.width = a8;
  v41.size.height = a9;
  sx = CGRectGetWidth(v41);
  v42.origin.x = a2;
  v42.origin.y = a3;
  v42.size.width = a4;
  v42.size.height = a5;
  sxa = sx / CGRectGetWidth(v42);
  v43.origin.x = a6;
  v43.origin.y = a7;
  v43.size.width = a8;
  v43.size.height = a9;
  Height = CGRectGetHeight(v43);
  v44.origin.x = a2;
  v44.origin.y = a3;
  v44.size.width = a4;
  v44.size.height = a5;
  v20 = CGRectGetHeight(v44);
  CGAffineTransformMakeScale(&t2, sxa, Height / v20);
  v21 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v39, &t1, &t2);
  v22 = *(_OWORD *)&v39.c;
  *(_OWORD *)a1 = *(_OWORD *)&v39.a;
  *(_OWORD *)(a1 + 16) = v22;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v39.tx;
  v23 = v34;
  *(CGFloat *)&v22 = a7;
  v24 = a8;
  v25 = a9;
  MidX = CGRectGetMidX(*(CGRect *)((char *)&v22 - 8));
  v45.origin.x = v34;
  v45.origin.y = a7;
  v45.size.width = a8;
  v45.size.height = a9;
  v27 = CGRectGetMidY(v45);
  CGAffineTransformMakeTranslation(&v36, MidX, v27);
  v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v28;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v39, &t1, &v36);
  v29 = *(_OWORD *)&v39.c;
  *(_OWORD *)a1 = *(_OWORD *)&v39.a;
  *(_OWORD *)(a1 + 16) = v29;
  result = v39.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v39.tx;
  return result;
}

CGFloat PXAffineTransformMakeScaleFromPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PXAffineTransformMakeScaleAndRotationAroundPoint(a1, a2, 0.0, a3, a4);
}

CGFloat PXAffineTransformMakeScaleAndRotationAroundPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>)
{
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGFloat result;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v21;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -a4, -a5);
  CGAffineTransformMakeScale(&t2, a2, a2);
  v10 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v10;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &t2);
  v11 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v11;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeRotation(&v18, a3);
  v12 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v12;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &v18);
  v13 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v13;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  CGAffineTransformMakeTranslation(&v17, a4, a5);
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v14;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v21, &t1, &v17);
  v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  result = v21.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  return result;
}

CGFloat PXAffineTransformMakeRotationAroundPoint@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>)
{
  return PXAffineTransformMakeScaleAndRotationAroundPoint(a1, 1.0, a2, a3, a4);
}

CGFloat PXAffineTransformMakeHorizontalFlip@<D0>(uint64_t a1@<X8>, CGFloat a2@<D0>)
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGFloat result;
  CGAffineTransform v9;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v12;

  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a1, -a2, 0.0);
  CGAffineTransformMakeScale(&t2, -1.0, 1.0);
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v4;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v12, &t1, &t2);
  v5 = *(_OWORD *)&v12.c;
  *(_OWORD *)a1 = *(_OWORD *)&v12.a;
  *(_OWORD *)(a1 + 16) = v5;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v12.tx;
  CGAffineTransformMakeTranslation(&v9, a2, 0.0);
  v6 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a1;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformConcat(&v12, &t1, &v9);
  v7 = *(_OWORD *)&v12.c;
  *(_OWORD *)a1 = *(_OWORD *)&v12.a;
  *(_OWORD *)(a1 + 16) = v7;
  result = v12.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v12.tx;
  return result;
}

CGFloat PXAffineTransformOffsetFixpoint@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  CGFloat result;
  CGAffineTransform v14;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v17;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a3, a4);
  v8 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v8;
  *(_OWORD *)&t1.tx = a1[2];
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t2.a = *(_OWORD *)a2;
  *(_OWORD *)&t2.c = v9;
  *(_OWORD *)&t2.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v17, &t1, &t2);
  v10 = *(_OWORD *)&v17.c;
  *(_OWORD *)a2 = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 16) = v10;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v17.tx;
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  v11 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v11;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v17, &v14, &t1);
  v12 = *(_OWORD *)&v17.c;
  *(_OWORD *)a2 = *(_OWORD *)&v17.a;
  *(_OWORD *)(a2 + 16) = v12;
  result = v17.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v17.tx;
  return result;
}

CGFloat PXAffineTransformMakeWithTranslationScaleRotation@<D0>(_OWORD *a1@<X8>, CGFloat a2@<D0>, CGFloat a3@<D1>, CGFloat a4@<D2>, CGFloat a5@<D3>, CGFloat a6@<D4>)
{
  a1[1] = 0u;
  a1[2] = 0u;
  *a1 = 0u;
  return PXAffineTransformMakeWithTranslationScaleRotationTransform(MEMORY[0x24BDBD8B8], (uint64_t)a1, a2, a3, a4, a5, a6);
}

CGFloat PXAffineTransformMakeWithTranslationScaleRotationTransform@<D0>(_OWORD *a1@<X0>, uint64_t a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>, CGFloat a5@<D2>, CGFloat a6@<D3>, CGFloat a7@<D4>)
{
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  CGFloat result;
  CGAffineTransform v24;
  CGAffineTransform t1;
  CGAffineTransform v26;

  v12 = MEMORY[0x24BDBD8B8];
  v13 = *MEMORY[0x24BDBD8B8];
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  *(_OWORD *)a2 = *MEMORY[0x24BDBD8B8];
  *(_OWORD *)(a2 + 16) = v14;
  v15 = *(_OWORD *)(v12 + 32);
  *(_OWORD *)(a2 + 32) = v15;
  *(_OWORD *)&v26.a = v13;
  *(_OWORD *)&v26.c = v14;
  *(_OWORD *)&v26.tx = v15;
  CGAffineTransformTranslate((CGAffineTransform *)a2, &v26, a3, a4);
  v16 = a1[1];
  *(_OWORD *)&t1.a = *a1;
  *(_OWORD *)&t1.c = v16;
  *(_OWORD *)&t1.tx = a1[2];
  v17 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v24.a = *(_OWORD *)a2;
  *(_OWORD *)&v24.c = v17;
  *(_OWORD *)&v24.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v26, &t1, &v24);
  v18 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v18;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  v19 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v19;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate(&v26, &t1, a7);
  v20 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v20;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  v21 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v21;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v26, &t1, a5, a6);
  v22 = *(_OWORD *)&v26.c;
  *(_OWORD *)a2 = *(_OWORD *)&v26.a;
  *(_OWORD *)(a2 + 16) = v22;
  result = v26.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v26.tx;
  return result;
}

void PXAffineTransformDecomposeTranslationScaleRotation(uint64_t a1, _QWORD *a2, double *a3, double *a4, double *a5)
{
  uint64_t v10;
  uint64_t v11;
  long double v12;
  double v13;
  double v14;
  __double2 v15;
  double v16;
  double v17;

  v10 = *(_QWORD *)(a1 + 32);
  v11 = *(_QWORD *)(a1 + 40);
  v13 = *(double *)a1;
  v12 = *(double *)(a1 + 8);
  v14 = atan2(v12, *(long double *)a1);
  v15 = __sincos_stret(v14);
  if (fabs(v15.__cosval) <= fabs(v15.__sinval))
  {
    v16 = v12 / v15.__sinval;
    v17 = -*(double *)(a1 + 16) / v15.__sinval;
    if (!a2)
      goto LABEL_6;
    goto LABEL_5;
  }
  v16 = v13 / v15.__cosval;
  v17 = *(double *)(a1 + 24) / v15.__cosval;
  if (a2)
  {
LABEL_5:
    *a2 = v10;
    a2[1] = v11;
  }
LABEL_6:
  if (a3)
    *a3 = v16;
  if (a4)
    *a4 = v17;
  if (a5)
    *a5 = v14;
}

double PXAffineTransformGetMaxScale(_OWORD *a1)
{
  __int128 v1;
  double result;
  CGAffineTransform v3;
  CGAffineTransformComponents v4;

  v1 = a1[1];
  *(_OWORD *)&v3.a = *a1;
  *(_OWORD *)&v3.c = v1;
  *(_OWORD *)&v3.tx = a1[2];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformDecompose(&v4, &v3);
  result = v4.scale.width;
  if (v4.scale.width < v4.scale.height)
    return v4.scale.height;
  return result;
}

double PXAffineTransformGetMinScale(_OWORD *a1)
{
  __int128 v1;
  double result;
  CGAffineTransform v3;
  CGAffineTransformComponents v4;

  v1 = a1[1];
  *(_OWORD *)&v3.a = *a1;
  *(_OWORD *)&v3.c = v1;
  *(_OWORD *)&v3.tx = a1[2];
  memset(&v4, 0, sizeof(v4));
  CGAffineTransformDecompose(&v4, &v3);
  result = v4.scale.width;
  if (v4.scale.width < v4.scale.height)
    return v4.scale.height;
  return result;
}

double PXAffineTransformGetUniformScale(_OWORD *a1)
{
  __int128 v2;
  double result;
  NSObject *v4;
  __int128 v5;
  void *v6;
  CGAffineTransformComponents v7;
  CGAffineTransform transform;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  memset(&v7, 0, sizeof(v7));
  v2 = a1[1];
  *(_OWORD *)&transform.a = *a1;
  *(_OWORD *)&transform.c = v2;
  *(_OWORD *)&transform.tx = a1[2];
  CGAffineTransformDecompose(&v7, &transform);
  result = v7.scale.width;
  if (vabdd_f64(v7.scale.height, v7.scale.width) > 0.00000999999975)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      v5 = a1[1];
      *(_OWORD *)&transform.a = *a1;
      *(_OWORD *)&transform.c = v5;
      *(_OWORD *)&transform.tx = a1[2];
      NSStringFromCGAffineTransform(&transform);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(transform.a) = 138412290;
      *(_QWORD *)((char *)&transform.a + 4) = v6;
      _os_log_fault_impl(&dword_24430E000, v4, OS_LOG_TYPE_FAULT, "Expected uniform scaling in transform, but found %@", (uint8_t *)&transform, 0xCu);

    }
    return v7.scale.width;
  }
  return result;
}

BOOL PXAffineTransformIsApproximatelyEqualToTransform(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) <= 0.00000999999975
      && vabdd_f64(a1[1], a2[1]) <= 0.00000999999975
      && vabdd_f64(a1[2], a2[2]) <= 0.00000999999975
      && vabdd_f64(a1[3], a2[3]) <= 0.00000999999975
      && vabdd_f64(a1[4], a2[4]) <= 0.00000999999975
      && vabdd_f64(a1[5], a2[5]) <= 0.00000999999975;
}

unint64_t PXPageKeyForPage(uint64_t a1, unsigned __int16 a2)
{
  return ~(a2 | (unint64_t)(a1 << 16));
}

unint64_t PXPageKeyForCGPoint(double a1, double a2)
{
  return ~((unsigned __int16)(uint64_t)(a2 * 0.0009765625) | (unint64_t)((uint64_t)(a1 * 0.0009765625) << 16));
}

double PXPageAlignedRectForCGPoint(double a1)
{
  return floor(a1 * 0.0009765625) * 1024.0;
}

void PXEnumeratePageKeysForRect(void *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void (**v9)(id, unint64_t, _BYTE *);
  int64_t v10;
  int64_t v11;
  double MinY;
  double MaxY;
  int64_t v14;
  int64_t v15;
  int v16;
  int64_t v17;
  unsigned __int8 v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;

  v9 = a1;
  v19.origin.x = a2;
  v19.origin.y = a3;
  v19.size.width = a4;
  v19.size.height = a5;
  if (!CGRectIsEmpty(v19))
  {
    v18 = 0;
    v20.origin.x = a2;
    v20.origin.y = a3;
    v20.size.width = a4;
    v20.size.height = a5;
    v10 = vcvtmd_s64_f64(CGRectGetMinX(v20) * 0.0009765625);
    v21.origin.x = a2;
    v21.origin.y = a3;
    v21.size.width = a4;
    v21.size.height = a5;
    v11 = vcvtmd_s64_f64(CGRectGetMaxX(v21) * 0.0009765625);
    v22.origin.x = a2;
    v22.origin.y = a3;
    v22.size.width = a4;
    v22.size.height = a5;
    MinY = CGRectGetMinY(v22);
    v23.origin.x = a2;
    v23.origin.y = a3;
    v23.size.width = a4;
    v23.size.height = a5;
    MaxY = CGRectGetMaxY(v23);
    if (v10 <= v11)
    {
      v14 = vcvtmd_s64_f64(MinY * 0.0009765625);
      v15 = vcvtmd_s64_f64(MaxY * 0.0009765625);
      do
      {
        if (v14 <= v15)
        {
          v17 = v14;
          do
          {
            v9[2](v9, ~((unsigned __int16)v17 | (unint64_t)(v10 << 16)), &v18);
            v16 = v18;
            if (v17 >= v15)
              break;
            ++v17;
          }
          while (!v18);
        }
        else
        {
          v16 = 0;
        }
        if (v10 >= v11)
          break;
        ++v10;
      }
      while (!v16);
    }
  }

}

float PXMatrixMakePerspectiveProjection(float a1, float a2)
{
  return (float)(1.0 / tanf(a2 * 0.5)) / a1;
}

double PXDerivative(_QWORD *a1, double a2)
{
  double v4;
  double (*v5)(double);
  _QWORD *v6;
  double v7;
  double v8;

  v4 = a2 + 0.03125;
  v5 = (double (*)(double))a1[2];
  v6 = a1;
  v7 = v5(v4);
  v8 = ((double (*)(id, double))a1[2])(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

double PXRectFunctionDerivative(_QWORD *a1, double a2)
{
  double v4;
  double (*v5)(double);
  _QWORD *v6;
  double v7;
  double v8;

  v4 = a2 + 0.03125;
  v5 = (double (*)(double))a1[2];
  v6 = a1;
  v7 = v5(v4);
  v8 = ((double (*)(id, double))a1[2])(v6, a2 + -0.03125);

  return (v7 - v8) * 16.0;
}

double PXRectDerivativeIntegrate(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a1 + a5 * a9;
}

uint64_t PXAxisFromUICollectionViewScrollDirection(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  void *v7;

  if (!a1)
    return 1;
  if (a1 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler", v2, v1, v3, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "PXAxis PXAxisFromUICollectionViewScrollDirection(UICollectionViewScrollDirection)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("PXGeometry.m"), 1083, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  return 2;
}

uint64_t PXEdgesFlippedHorizontally(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 ^ 0xA;
  if ((a1 & 8) == 0)
    v1 = a1;
  if ((a1 & 2) != 0)
    return v1 ^ 0xA;
  else
    return v1;
}

uint64_t PXEdgesFlippedVertically(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 ^ 5;
  if ((a1 & 1) == 0)
    v1 = a1;
  if ((a1 & 4) != 0)
    return v1 ^ 5;
  else
    return v1;
}

double PXRectWithSizeAlignedToRectEdges(char a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  return PXRectWithSizeAlignedToRectEdgesWithPadding(a1, a2, a3, a4, a5, a6, a7, *MEMORY[0x24BDBF148]);
}

double PXRectWithSizeAlignedToRectEdgesWithPadding(char a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, double a8)
{
  double v13;
  CGFloat v15;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGRect v24;

  if ((~a1 & 0xA) != 0)
  {
    if ((a1 & 2) != 0)
    {
      v24.origin.x = a4;
      v24.origin.y = a5;
      v24.size.width = a6;
      v24.size.height = a7;
      v13 = a8 + CGRectGetMinX(v24);
    }
    else
    {
      v15 = a4;
      if ((a1 & 8) != 0)
        v13 = CGRectGetMaxX(*(CGRect *)&v15) - a2 - a8;
      else
        v13 = CGRectGetMidX(*(CGRect *)&v15) + a2 * -0.5;
    }
  }
  else
  {
    v13 = a4 + a8;
  }
  if ((~a1 & 5) != 0)
  {
    v19 = a4;
    v20 = a5;
    v21 = a6;
    v22 = a7;
    if ((a1 & 1) != 0)
    {
      CGRectGetMinY(*(CGRect *)&v19);
    }
    else if ((a1 & 4) != 0)
    {
      CGRectGetMaxY(*(CGRect *)&v19);
    }
    else
    {
      CGRectGetMidY(*(CGRect *)&v19);
    }
  }
  return v13;
}

uint64_t PXIsPhotosMessagesApp()
{
  if (PXIsPhotosMessagesApp_onceToken != -1)
    dispatch_once(&PXIsPhotosMessagesApp_onceToken, &__block_literal_global_7444);
  return PXIsPhotosMessagesApp_isPhotosMessagesApp;
}

uint64_t PXIsPhotoPicker()
{
  if (PXIsPhotoPicker_onceToken != -1)
    dispatch_once(&PXIsPhotoPicker_onceToken, &__block_literal_global_2);
  return PXIsPhotoPicker_isPhotoPicker;
}

void PXEnumerateSubrangesMatchingTestUsingBlock(unint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t (**v7)(id, unint64_t, _BYTE *);
  void (**v8)(id, uint64_t, uint64_t, _BYTE *);
  unint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  char v13;

  v7 = a3;
  v8 = a4;
  if (a2)
  {
    v9 = a1 + a2;
    if (!__CFADD__(a1, a2))
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        v13 = 0;
        if (a1 >= v9)
          goto LABEL_10;
        v11 = v7[2](v7, a1, &v13);
        if (v13)
          break;
        if (v11)
        {
          if (v10 == 0x7FFFFFFFFFFFFFFFLL)
            v12 = a1;
          else
            v12 = v10;
        }
        else
        {
LABEL_10:
          v12 = 0x7FFFFFFFFFFFFFFFLL;
          if (v10 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v8[2](v8, v10, a1 - v10, &v13);
            if (v13)
              break;
            v12 = 0x7FFFFFFFFFFFFFFFLL;
          }
        }
        ++a1;
        v10 = v12;
      }
      while (a1 <= v9);
    }
  }

}

void sub_244375E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2443762A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_244376D3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va2;

  va_start(va2, a9);
  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  va_copy(va2, va1);
  v15 = va_arg(va2, _QWORD);
  v17 = va_arg(va2, _QWORD);
  v18 = va_arg(va2, _QWORD);
  v19 = va_arg(va2, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose(va2, 8);
  _Unwind_Resume(a1);
}

void sub_244376EA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7665(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7666(uint64_t a1)
{

}

void sub_244378308(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  void *v9;
  uint64_t v10;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 80), 8);
  objc_sync_exit(v9);
  _Unwind_Resume(a1);
}

void sub_244378680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_2443787F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void PXIterateAsynchronously(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _PXAsyncIterator *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  id *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a2;
  v6 = a3;
  v15 = 0;
  v16 = (id *)&v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__7820;
  v19 = __Block_byref_object_dispose__7821;
  v20 = 0;
  v7 = -[_PXAsyncIterator initWithCount:handler:]([_PXAsyncIterator alloc], "initWithCount:handler:", a1, v5);
  v9 = MEMORY[0x24BDAC760];
  v10 = 3221225472;
  v11 = __PXIterateAsynchronously_block_invoke;
  v12 = &unk_2514D1158;
  v14 = &v15;
  v8 = v6;
  v13 = v8;
  -[_PXAsyncIterator setCompletion:](v7, "setCompletion:", &v9);
  objc_storeStrong(v16 + 5, v7);
  -[_PXAsyncIterator _executeNextRun](v7, "_executeNextRun", v9, v10, v11, v12);

  _Block_object_dispose(&v15, 8);
}

void sub_2443791BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7820(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7821(uint64_t a1)
{

}

void sub_2443794F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void px_dispatch_on_main_queue_sync(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  v1 = a1;
  if (v1)
  {
    block = v1;
    if (objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
      block[2]();
    else
      dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v1 = block;
  }

}

void __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_2(uint64_t a1)
{
  _QWORD v1[4];
  id v2;
  uint64_t v3;

  v1[0] = MEMORY[0x24BDAC760];
  v1[1] = 3221225472;
  v1[2] = __px_dispatch_on_main_queue_when_idle_after_delay_block_invoke_3;
  v1[3] = &unk_2514D11F0;
  v3 = *(_QWORD *)(a1 + 40);
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v1);

}

dispatch_queue_t px_dispatch_queue_create(const char *a1, NSObject *a2, dispatch_qos_class_t a3)
{
  return px_dispatch_queue_create_with_priority(a1, a2, a3, 0);
}

id px_dispatch_queue_create_serial_with_priority(const char *a1, dispatch_qos_class_t a2, int a3)
{
  NSObject *v6;
  void *v7;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v6 = objc_claimAutoreleasedReturnValue();
  px_dispatch_queue_create_with_priority(a1, v6, a2, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t px_dispatch_qos_from_nsqualityofservice(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;

  if (a1 == 25)
    v1 = 25;
  else
    v1 = 33;
  if (a1 == 17)
    v2 = 17;
  else
    v2 = v1;
  if (a1 == 9)
    v3 = 9;
  else
    v3 = 33;
  if (a1 == -1)
    v3 = 21;
  if (a1 <= 16)
    return v3;
  else
    return v2;
}

char *PXSyncCallbackBegin(void *a1)
{
  NSObject *v1;
  const void *v2;
  char *v3;

  v1 = a1;
  dispatch_assert_queue_V2(v1);
  v2 = (const void *)PXSyncCallbackKey;
  v3 = (char *)dispatch_queue_get_specific(v1, (const void *)PXSyncCallbackKey) + 1;
  dispatch_queue_set_specific(v1, v2, v3, 0);

  return v3;
}

void PXSyncCallbackEnd(void *a1)
{
  const void *v1;
  char *specific;
  NSObject *queue;

  queue = a1;
  dispatch_assert_queue_V2(queue);
  v1 = (const void *)PXSyncCallbackKey;
  specific = (char *)dispatch_queue_get_specific(queue, (const void *)PXSyncCallbackKey);
  dispatch_queue_set_specific(queue, v1, specific - 1, 0);

}

BOOL PXIsSyncCallback(void *a1)
{
  return dispatch_get_specific((const void *)PXSyncCallbackKey) == a1;
}

void PXPerformWithSyncTokenOnQueue(void *a1, NSObject *a2, void (**a3)(_QWORD))
{
  if (dispatch_get_specific((const void *)PXSyncCallbackKey) == a1)
    a3[2](a3);
  else
    dispatch_async(a2, a3);
}

uint64_t sub_24437A274()
{
  return MEMORY[0x24BDCEA40]();
}

uint64_t sub_24437A280()
{
  return MEMORY[0x24BDCEA58]();
}

uint64_t sub_24437A28C()
{
  return MEMORY[0x24BDCF3B0]();
}

uint64_t sub_24437A298()
{
  return MEMORY[0x24BDCF420]();
}

uint64_t sub_24437A2A4()
{
  return MEMORY[0x24BDCF428]();
}

uint64_t sub_24437A2B0()
{
  return MEMORY[0x24BEE5BF8]();
}

uint64_t sub_24437A2BC()
{
  return MEMORY[0x24BEE5C38]();
}

uint64_t sub_24437A2C8()
{
  return MEMORY[0x24BEE5C40]();
}

uint64_t sub_24437A2D4()
{
  return MEMORY[0x24BEE5C48]();
}

uint64_t sub_24437A2E0()
{
  return MEMORY[0x24BEE5C50]();
}

uint64_t sub_24437A2EC()
{
  return MEMORY[0x24BEE5C58]();
}

uint64_t sub_24437A2F8()
{
  return MEMORY[0x24BEE5C60]();
}

uint64_t sub_24437A304()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_24437A310()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_24437A31C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_24437A328()
{
  return MEMORY[0x24BEE78E8]();
}

uint64_t sub_24437A334()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_24437A340()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_24437A34C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_24437A358()
{
  return MEMORY[0x24BEE5570]();
}

uint64_t sub_24437A364()
{
  return MEMORY[0x24BEE5590]();
}

uint64_t sub_24437A370()
{
  return MEMORY[0x24BEE5618]();
}

uint64_t sub_24437A37C()
{
  return MEMORY[0x24BEE5628]();
}

uint64_t sub_24437A388()
{
  return MEMORY[0x24BEE5648]();
}

uint64_t sub_24437A394()
{
  return MEMORY[0x24BEE01B8]();
}

uint64_t sub_24437A3A0()
{
  return MEMORY[0x24BEE01C0]();
}

uint64_t sub_24437A3AC()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_24437A3B8()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_24437A3C4()
{
  return MEMORY[0x24BEE02B0]();
}

uint64_t sub_24437A3D0()
{
  return MEMORY[0x24BEE03D0]();
}

uint64_t sub_24437A3DC()
{
  return MEMORY[0x24BEE0460]();
}

uint64_t sub_24437A3E8()
{
  return MEMORY[0x24BEE04A8]();
}

uint64_t sub_24437A3F4()
{
  return MEMORY[0x24BEE04B0]();
}

uint64_t sub_24437A400()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_24437A40C()
{
  return MEMORY[0x24BEE0620]();
}

uint64_t sub_24437A418()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_24437A424()
{
  return MEMORY[0x24BEE07D8]();
}

uint64_t sub_24437A430()
{
  return MEMORY[0x24BEE07E0]();
}

uint64_t sub_24437A43C()
{
  return MEMORY[0x24BEE08B8]();
}

uint64_t sub_24437A448()
{
  return MEMORY[0x24BEE0930]();
}

uint64_t sub_24437A454()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_24437A460()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_24437A46C()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_24437A478()
{
  return MEMORY[0x24BDCFA78]();
}

uint64_t sub_24437A484()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_24437A490()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_24437A49C()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_24437A4A8()
{
  return MEMORY[0x24BEE0BE8]();
}

uint64_t sub_24437A4B4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_24437A4C0()
{
  return MEMORY[0x24BEE0DE8]();
}

uint64_t sub_24437A4CC()
{
  return MEMORY[0x24BEE0E00]();
}

uint64_t sub_24437A4D8()
{
  return MEMORY[0x24BEE0E40]();
}

uint64_t sub_24437A4E4()
{
  return MEMORY[0x24BEE0E48]();
}

uint64_t sub_24437A4F0()
{
  return MEMORY[0x24BEE0E50]();
}

uint64_t sub_24437A4FC()
{
  return MEMORY[0x24BEE0E70]();
}

uint64_t sub_24437A508()
{
  return MEMORY[0x24BEE0ED0]();
}

uint64_t sub_24437A514()
{
  return MEMORY[0x24BEE0F38]();
}

uint64_t sub_24437A520()
{
  return MEMORY[0x24BEE0FD8]();
}

uint64_t sub_24437A52C()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_24437A538()
{
  return MEMORY[0x24BEE1118]();
}

uint64_t sub_24437A544()
{
  return MEMORY[0x24BEE1138]();
}

uint64_t sub_24437A550()
{
  return MEMORY[0x24BEE1140]();
}

uint64_t sub_24437A55C()
{
  return MEMORY[0x24BEE1170]();
}

uint64_t sub_24437A568()
{
  return MEMORY[0x24BEE1180]();
}

uint64_t sub_24437A574()
{
  return MEMORY[0x24BEE1190]();
}

uint64_t sub_24437A580()
{
  return MEMORY[0x24BEE11A0]();
}

uint64_t sub_24437A58C()
{
  return MEMORY[0x24BEE11C8]();
}

uint64_t sub_24437A598()
{
  return MEMORY[0x24BEE11F8]();
}

uint64_t sub_24437A5A4()
{
  return MEMORY[0x24BEE1200]();
}

uint64_t sub_24437A5B0()
{
  return MEMORY[0x24BEE1208]();
}

uint64_t sub_24437A5BC()
{
  return MEMORY[0x24BEE1220]();
}

uint64_t sub_24437A5C8()
{
  return MEMORY[0x24BEE1228]();
}

uint64_t sub_24437A5D4()
{
  return MEMORY[0x24BEE1230]();
}

uint64_t sub_24437A5E0()
{
  return MEMORY[0x24BEE1250]();
}

uint64_t sub_24437A5EC()
{
  return MEMORY[0x24BEE1278]();
}

uint64_t sub_24437A5F8()
{
  return MEMORY[0x24BEE1288]();
}

uint64_t sub_24437A604()
{
  return MEMORY[0x24BEE1308]();
}

uint64_t sub_24437A610()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_24437A61C()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_24437A628()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_24437A634()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_24437A640()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_24437A64C()
{
  return MEMORY[0x24BEE1648]();
}

uint64_t sub_24437A658()
{
  return MEMORY[0x24BEE1658]();
}

uint64_t sub_24437A664()
{
  return MEMORY[0x24BEE1668]();
}

uint64_t sub_24437A670()
{
  return MEMORY[0x24BEE1690]();
}

uint64_t sub_24437A67C()
{
  return MEMORY[0x24BEE16D0]();
}

uint64_t sub_24437A688()
{
  return MEMORY[0x24BEE16D8]();
}

uint64_t sub_24437A694()
{
  return MEMORY[0x24BEE16F8]();
}

uint64_t sub_24437A6A0()
{
  return MEMORY[0x24BEE17F8]();
}

uint64_t sub_24437A6AC()
{
  return MEMORY[0x24BEE1870]();
}

uint64_t sub_24437A6B8()
{
  return MEMORY[0x24BEE1880]();
}

uint64_t sub_24437A6C4()
{
  return MEMORY[0x24BEE1888]();
}

uint64_t sub_24437A6D0()
{
  return MEMORY[0x24BEE1890]();
}

uint64_t sub_24437A6DC()
{
  return MEMORY[0x24BEE1898]();
}

uint64_t sub_24437A6E8()
{
  return MEMORY[0x24BEE18A0]();
}

uint64_t sub_24437A6F4()
{
  return MEMORY[0x24BEE18D0]();
}

uint64_t sub_24437A700()
{
  return MEMORY[0x24BEE1900]();
}

uint64_t sub_24437A70C()
{
  return MEMORY[0x24BEE1918]();
}

uint64_t sub_24437A718()
{
  return MEMORY[0x24BEE1940]();
}

uint64_t sub_24437A724()
{
  return MEMORY[0x24BEE1950]();
}

uint64_t sub_24437A730()
{
  return MEMORY[0x24BEE1958]();
}

uint64_t sub_24437A73C()
{
  return MEMORY[0x24BEE1960]();
}

uint64_t sub_24437A748()
{
  return MEMORY[0x24BEE1968]();
}

uint64_t sub_24437A754()
{
  return MEMORY[0x24BEE1970]();
}

uint64_t sub_24437A760()
{
  return MEMORY[0x24BEE1978]();
}

uint64_t sub_24437A76C()
{
  return MEMORY[0x24BEE1A00]();
}

uint64_t sub_24437A778()
{
  return MEMORY[0x24BEE1A28]();
}

uint64_t sub_24437A784()
{
  return MEMORY[0x24BEE1A30]();
}

uint64_t sub_24437A790()
{
  return MEMORY[0x24BEE1B28]();
}

uint64_t sub_24437A79C()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_24437A7A8()
{
  return MEMORY[0x24BEE5688]();
}

uint64_t sub_24437A7B4()
{
  return MEMORY[0x24BEE56B8]();
}

uint64_t sub_24437A7C0()
{
  return MEMORY[0x24BEE5760]();
}

uint64_t sub_24437A7CC()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_24437A7D8()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_24437A7E4()
{
  return MEMORY[0x24BEE57A0]();
}

uint64_t sub_24437A7F0()
{
  return MEMORY[0x24BEBCFD8]();
}

uint64_t sub_24437A7FC()
{
  return MEMORY[0x24BEBD030]();
}

uint64_t sub_24437A808()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_24437A814()
{
  return MEMORY[0x24BEE1E70]();
}

uint64_t sub_24437A820()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_24437A82C()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_24437A838()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_24437A844()
{
  return MEMORY[0x24BEE21F8]();
}

uint64_t sub_24437A850()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_24437A85C()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_24437A868()
{
  return MEMORY[0x24BEE2378]();
}

uint64_t sub_24437A874()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_24437A880()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_24437A88C()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_24437A898()
{
  return MEMORY[0x24BEE24D0]();
}

uint64_t sub_24437A8A4()
{
  return MEMORY[0x24BEE24D8]();
}

uint64_t sub_24437A8B0()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_24437A8BC()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_24437A8C8()
{
  return MEMORY[0x24BEE2548]();
}

uint64_t sub_24437A8D4()
{
  return MEMORY[0x24BEE2650]();
}

uint64_t sub_24437A8E0()
{
  return MEMORY[0x24BEE2788]();
}

uint64_t sub_24437A8EC()
{
  return MEMORY[0x24BEE2798]();
}

uint64_t sub_24437A8F8()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_24437A904()
{
  return MEMORY[0x24BEE28C0]();
}

uint64_t sub_24437A910()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_24437A91C()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_24437A928()
{
  return MEMORY[0x24BEE2950]();
}

uint64_t sub_24437A934()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_24437A940()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_24437A94C()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_24437A958()
{
  return MEMORY[0x24BEE29C0]();
}

uint64_t sub_24437A964()
{
  return MEMORY[0x24BEE2A00]();
}

uint64_t sub_24437A970()
{
  return MEMORY[0x24BEE2A08]();
}

uint64_t sub_24437A97C()
{
  return MEMORY[0x24BEE2AB8]();
}

uint64_t sub_24437A988()
{
  return MEMORY[0x24BEE2BD8]();
}

uint64_t sub_24437A994()
{
  return MEMORY[0x24BEE2E58]();
}

uint64_t sub_24437A9A0()
{
  return MEMORY[0x24BEE2E70]();
}

uint64_t sub_24437A9AC()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_24437A9B8()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_24437A9C4()
{
  return MEMORY[0x24BEE2F68]();
}

uint64_t sub_24437A9D0()
{
  return MEMORY[0x24BEE2F70]();
}

uint64_t sub_24437A9DC()
{
  return MEMORY[0x24BEE2F90]();
}

uint64_t sub_24437A9E8()
{
  return MEMORY[0x24BEE2F98]();
}

uint64_t sub_24437A9F4()
{
  return MEMORY[0x24BEE2FA0]();
}

uint64_t sub_24437AA00()
{
  return MEMORY[0x24BEE2FB0]();
}

uint64_t sub_24437AA0C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_24437AA18()
{
  return MEMORY[0x24BEE3290]();
}

uint64_t sub_24437AA24()
{
  return MEMORY[0x24BEE3370]();
}

uint64_t sub_24437AA30()
{
  return MEMORY[0x24BEE34C0]();
}

uint64_t sub_24437AA3C()
{
  return MEMORY[0x24BEE3548]();
}

uint64_t sub_24437AA48()
{
  return MEMORY[0x24BEE3598]();
}

uint64_t sub_24437AA54()
{
  return MEMORY[0x24BEE39E0]();
}

uint64_t sub_24437AA60()
{
  return MEMORY[0x24BEE3A20]();
}

uint64_t sub_24437AA6C()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_24437AA78()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_24437AA84()
{
  return MEMORY[0x24BEE3DD8]();
}

uint64_t sub_24437AA90()
{
  return MEMORY[0x24BEE3DF8]();
}

uint64_t sub_24437AA9C()
{
  return MEMORY[0x24BEE3E08]();
}

uint64_t sub_24437AAA8()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_24437AAB4()
{
  return MEMORY[0x24BEE3EF8]();
}

uint64_t sub_24437AAC0()
{
  return MEMORY[0x24BEE3F00]();
}

uint64_t sub_24437AACC()
{
  return MEMORY[0x24BEE3F08]();
}

uint64_t sub_24437AAD8()
{
  return MEMORY[0x24BEE3F10]();
}

uint64_t sub_24437AAE4()
{
  return MEMORY[0x24BEE41A8]();
}

uint64_t sub_24437AAF0()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_24437AAFC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_24437AB08()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_24437AB14()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t sub_24437AB20()
{
  return MEMORY[0x24BEE4608]();
}

uint64_t sub_24437AB2C()
{
  return MEMORY[0x24BEE4638]();
}

uint64_t sub_24437AB38()
{
  return MEMORY[0x24BEE4828]();
}

uint64_t sub_24437AB44()
{
  return MEMORY[0x24BEE48A0]();
}

uint64_t sub_24437AB50()
{
  return MEMORY[0x24BEE4A08]();
}

uint64_t sub_24437AB5C()
{
  return MEMORY[0x24BEE4A10]();
}

uint64_t sub_24437AB68()
{
  return MEMORY[0x24BEE4A18]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x24BDE5410]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x24BDBB7C0](theArray, otherArray, otherRange.location, otherRange.length);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x24BDBB878](theArray);
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x24BDBB930](arg);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C0](rl, observer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopObserverRef CFRunLoopObserverCreate(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, CFRunLoopObserverCallBack callout, CFRunLoopObserverContext *context)
{
  return (CFRunLoopObserverRef)MEMORY[0x24BDBC320](allocator, activities, repeats, order, callout, context);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC340](rl, observer, mode);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8A0](retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return (CGAffineTransformComponents *)MEMORY[0x24BDBD8A8](retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x24BDBD8B0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8C0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8D8](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E8](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8F8](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD900](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD908](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x24BDBD918](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x24BDBD920](context);
}

uint64_t CGBitmapContextCreateWithCallbacks()
{
  return MEMORY[0x24BDBD928]();
}

uint64_t CGBitmapGetAlignedBytesPerRow()
{
  return MEMORY[0x24BDBD988]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDB88]();
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x24BDBDBB8](name);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x24BDBDC60](space);
}

void CGContextClearRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD20](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDD38](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x24BDBDE28](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextFillEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE60](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x24BDBDF30](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x24BDBDF58](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x24BDBDF70](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x24BDBDF78](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x24BDBDFB0](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBDFD8](c, color);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x24BDBE0D0](c, color);
}

void CGContextStrokeRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBE120](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextStrokeRectWithWidth(CGContextRef c, CGRect rect, CGFloat width)
{
  MEMORY[0x24BDBE128](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, width);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x24BDBE130](c, tx, ty);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x24BDBE298]();
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x24BDBE538](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x24BDBE550](gradient);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x24BDBE778](image);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x24BDD9168](isrc, index, options);
}

void CGPDFContextBeginPage(CGContextRef context, CFDictionaryRef pageInfo)
{
  MEMORY[0x24BDBE8D8](context, pageInfo);
}

CGContextRef CGPDFContextCreate(CGDataConsumerRef consumer, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F0](consumer, mediaBox, auxiliaryInfo);
}

CGContextRef CGPDFContextCreateWithURL(CFURLRef url, const CGRect *mediaBox, CFDictionaryRef auxiliaryInfo)
{
  return (CGContextRef)MEMORY[0x24BDBE8F8](url, mediaBox, auxiliaryInfo);
}

void CGPDFContextEndPage(CGContextRef context)
{
  MEMORY[0x24BDBE900](context);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEDC8](path, m, x, y);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x24BDBEDE8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathCloseSubpath(CGMutablePathRef path)
{
  MEMORY[0x24BDBEE20](path);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x24BDBEE80]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBEF40](path, m, x, y);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBEFB8](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFC8]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x24BDBEFD8](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
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

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x24BDC4750]();
}

CTFontRef CTFontCreateWithFontDescriptor(CTFontDescriptorRef descriptor, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x24BDC47B0](descriptor, matrix, size);
}

uint64_t CTFontDescriptorCreateWithAttributesAndOptions()
{
  return MEMORY[0x24BDC4838]();
}

CGRect CTFontGetBoundingBox(CTFontRef font)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x24BDC48C0](font);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x24BDC48F0](font, characters, glyphs, count);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t NSAllocateScannedUncollectable()
{
  return MEMORY[0x24BDD0B48]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD0E08](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *__cdecl NSStringFromCGAffineTransform(CGAffineTransform *transform)
{
  return (NSString *)MEMORY[0x24BEBD2B0](transform);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x24BEBD2C8]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSString *__cdecl NSStringFromUIEdgeInsets(UIEdgeInsets insets)
{
  return (NSString *)MEMORY[0x24BEBD2D0](*(__n128 *)&insets.top, *(__n128 *)&insets.left, *(__n128 *)&insets.bottom, *(__n128 *)&insets.right);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSZoneFree(NSZone *zone, void *ptr)
{
  MEMORY[0x24BDD1418](zone, ptr);
}

uint64_t PFFloatNan()
{
  return MEMORY[0x24BE71BA8]();
}

uint64_t PFLargestSalientAspectFilledCropRect()
{
  return MEMORY[0x24BE71BB0]();
}

uint64_t PFProcessIsLaunchedToExecuteTests()
{
  return MEMORY[0x24BE71BD0]();
}

uint64_t PFRectByFlippingHorizontallyInRect()
{
  return MEMORY[0x24BE71BD8]();
}

uint64_t PFSizeLargerThanSize()
{
  return MEMORY[0x24BE71BE8]();
}

uint64_t PFSizeWithAspectRatioFillingSize()
{
  return MEMORY[0x24BE71BF8]();
}

uint64_t PFSizeWithAspectRatioFittingSize()
{
  return MEMORY[0x24BE71C00]();
}

uint64_t PFStringWithValidatedFormat()
{
  return MEMORY[0x24BE71C10]();
}

uint64_t PFUIGetLog()
{
  return MEMORY[0x24BE71C20]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BEBDE48]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x24BEBE080](lhs, rhs);
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x24BEBE278]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

void UIGraphicsPopContext(void)
{
  MEMORY[0x24BEBE2B8]();
}

void UIGraphicsPushContext(CGContextRef context)
{
  MEMORY[0x24BEBE2C0](context);
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x24BEBE2D8](image, compressionQuality);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x24BEBE6A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

uint64_t _UIContentSizeCategoryCompareToContentSizeCategory()
{
  return MEMORY[0x24BEBEA60]();
}

uint64_t _UIMediaTimeForMachTime()
{
  return MEMORY[0x24BEBEB50]();
}

uint64_t _UIUpdateCurrentTiming()
{
  return MEMORY[0x24BEBEBD0]();
}

uint64_t _UIUpdateCycleEnabled()
{
  return MEMORY[0x24BEBEBD8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x24BDAC848]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x24BDAD218](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x24BDAD220](__y, __x);
  return result;
}

void *__cdecl bsearch_b(const void *__key, const void *__base, size_t __nel, size_t __width, void *__compar)
{
  return (void *)MEMORY[0x24BDAD318](__key, __base, __nel, __width, __compar);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

long double cos(long double __x)
{
  long double result;

  MEMORY[0x24BDADBE0](__x);
  return result;
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x24BDADEF0](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x24BDAE270](__x);
  return result;
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE3F0](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

uint64_t kdebug_is_enabled()
{
  return MEMORY[0x24BDAE950]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAF688](__x, __y);
  return result;
}

void qsort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  MEMORY[0x24BDAFA20](__base, __nel, __width, __compar);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x24BDAFE18](__x);
  return result;
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x24BEE4B78]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x24BEE4B80]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x24BEE4BE0]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x24BEE71E0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x24BEE71E8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x24BEE71F0]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x24BEE4CD0]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x24BEE4CD8]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x24BEE4CE8]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x24BEE4D08]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x24BEE4D80]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x24BEE4D98]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x24BEE4DF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x24BEE4E28]();
}

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x24BEE4E30]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isClassType()
{
  return MEMORY[0x24BEE4E60]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_modifyAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4EB8]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_readAtKeyPath()
{
  return MEMORY[0x24BEE4ED8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x24BEE4F10]();
}

uint64_t swift_setAtReferenceWritableKeyPath()
{
  return MEMORY[0x24BEE4F20]();
}

uint64_t swift_setAtWritableKeyPath()
{
  return MEMORY[0x24BEE4F28]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x24BEE4F88]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return MEMORY[0x24BEE4FB8]();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return MEMORY[0x24BEE4FC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return MEMORY[0x24BEE4FE0]();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return MEMORY[0x24BEE4FE8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_weakDestroy()
{
  return MEMORY[0x24BEE5028]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x24BEE5030]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x24BEE5038]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

float tanf(float a1)
{
  float result;

  MEMORY[0x24BDB0140](a1);
  return result;
}

long double tanh(long double __x)
{
  long double result;

  MEMORY[0x24BDB0148](__x);
  return result;
}

