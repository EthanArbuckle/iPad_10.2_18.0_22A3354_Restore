@implementation PHSearchSuggestion(PhotosUICore)

- (const)px_symbolName
{
  uint64_t v1;

  v1 = objc_msgSend(a1, "categoriesType");
  if ((unint64_t)(v1 - 1) > 0x28)
    return &stru_1E5149688;
  else
    return off_1E512F778[v1 - 1];
}

- (id)px_formattedCount
{
  unint64_t v2;
  int v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v2 = objc_msgSend(a1, "count");
  v3 = objc_msgSend(a1, "hasApproximateCount");
  if (v2 > 0x186A0)
    v4 = 1;
  else
    v4 = v3;
  v5 = v2;
  if (v4 != 1)
    goto LABEL_16;
  if (v2 < 5)
  {
    v5 = 1;
    goto LABEL_16;
  }
  if (v2 < 0xA)
  {
    v5 = 5;
    goto LABEL_16;
  }
  if (v2 <= 0x1F3)
  {
    v5 = 10 * vcvtmd_u64_f64((double)v2 / 10.0);
    goto LABEL_16;
  }
  if (v2 >> 3 > 0x270)
  {
    v5 = 100000;
    if (v2 >> 4 > 0xC34)
      goto LABEL_16;
    v6 = vcvtmd_u64_f64((double)v2 / 1000.0);
    v7 = 1000;
  }
  else
  {
    v6 = vcvtmd_u64_f64((double)v2 / 100.0);
    v7 = 100;
  }
  v5 = v6 * v7;
LABEL_16:
  v8 = (void *)MEMORY[0x1E0CB37F0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PXLocalizedStringFromTable(CFSTR("SEARCH_RESULT_COUNT_FOR_SUGGESTION"), CFSTR("PhotosUICore"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PXLocalizedStringWithValidatedFormat(v11, CFSTR("%@"));
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = v10;
  }

  return v12;
}

@end
