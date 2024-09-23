@implementation PLSearchIndexCategoriesForAssetPropertySet

void __PLSearchIndexCategoriesForAssetPropertySet_block_invoke()
{
  id v0;
  id v1;
  uint64_t i;
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v1 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  for (i = 0; i != 2801; ++i)
  {
    if (i <= 1499)
    {
      if (i <= 1099)
      {
        v3 = v0;
        if ((unint64_t)(i - 1) < 0xE)
          goto LABEL_43;
        v3 = v0;
        if ((unint64_t)(i - 1000) < 7)
          goto LABEL_43;
        continue;
      }
      if (i > 1202)
      {
        if ((unint64_t)(i - 1300) <= 0x1F)
        {
          v3 = v0;
          if (((1 << (i - 20)) & 0xC0300403) != 0)
            goto LABEL_43;
        }
        if ((unint64_t)(i - 1203) < 3)
        {
          v3 = v1;
          goto LABEL_43;
        }
        v4 = i - 1400;
        goto LABEL_42;
      }
      v3 = v0;
      if ((unint64_t)(i - 1100) < 6)
        goto LABEL_43;
      v3 = v0;
      if ((unint64_t)(i - 1200) < 3)
        goto LABEL_43;
    }
    else
    {
      if (i <= 1899)
      {
        if (i <= 1599)
        {
          if ((unint64_t)(i - 1500) <= 0x29)
          {
            v3 = v0;
            if (((1 << (i + 36)) & 0x300C0300C03) != 0)
              goto LABEL_43;
          }
          continue;
        }
        if ((unint64_t)(i - 1600) <= 0xB)
        {
          v3 = v0;
          if (((1 << (i - 64)) & 0xC03) != 0)
            goto LABEL_43;
        }
        v3 = v0;
        if ((unint64_t)(i - 1800) < 4)
          goto LABEL_43;
        v4 = i - 1700;
LABEL_42:
        v3 = v0;
        if (v4 >= 2)
          continue;
        goto LABEL_43;
      }
      if (i <= 2199)
      {
        v3 = v0;
        if ((unint64_t)(i - 1900) < 0x14)
          goto LABEL_43;
        v3 = v0;
        if (i == 2000)
          goto LABEL_43;
        v3 = v0;
        if (i == 2100)
          goto LABEL_43;
        continue;
      }
      if (i <= 2499)
      {
        v3 = v0;
        if ((unint64_t)(i - 2400) < 2)
          goto LABEL_43;
        v3 = v0;
        if (i == 2200)
          goto LABEL_43;
        v3 = v0;
        if (i == 2300)
          goto LABEL_43;
      }
      else
      {
        if (i <= 2699)
        {
          v3 = v0;
          if ((unint64_t)(i - 2500) >= 2)
          {
            v4 = i - 2600;
            goto LABEL_42;
          }
LABEL_43:
          objc_msgSend(v3, "addIndex:", i);
          continue;
        }
        v3 = v0;
        if (i == 2700)
          goto LABEL_43;
        v3 = v0;
        if (i == 2800)
          goto LABEL_43;
      }
    }
  }
  v5 = (void *)PLSearchIndexCategoriesForAssetPropertySet_coreCategories;
  PLSearchIndexCategoriesForAssetPropertySet_coreCategories = (uint64_t)v0;
  v7 = v0;

  v6 = (void *)PLSearchIndexCategoriesForAssetPropertySet_ocrCategories;
  PLSearchIndexCategoriesForAssetPropertySet_ocrCategories = (uint64_t)v1;

}

@end
