@implementation StocksUtilities

+ (BOOL)shouldStackCellContentsForStocks:(id)a3 withWidth:(double)a4 andBoxWidth:(double)a5
{
  id v7;
  void *v8;
  NSString *v9;
  _BOOL4 IsAccessibilityCategory;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  __CFString *v24;
  void *v25;
  double v26;
  double v27;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  if (objc_msgSend(v7, "count")
    && (objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "preferredContentSizeCategory"),
        v9 = (NSString *)objc_claimAutoreleasedReturnValue(),
        IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v9),
        v9,
        v8,
        IsAccessibilityCategory))
  {
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7850]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "count");
    if (v12 < 1)
    {
      v17 = 0;
    }
    else
    {
      v13 = v12;
      v14 = 0;
      v15 = a4 + -16.0 - a5;
      v16 = *MEMORY[0x24BDF65F8];
      v17 = 1;
      do
      {
        objc_msgSend(v7, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "listName");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v16;
        v32[0] = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "boundingRectWithSize:options:attributes:context:", 0, v20, 0, 1.79769313e308, 0.0);
        v22 = v21;

        objc_msgSend(v18, "price");
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v23)
        {
          objc_msgSend(v18, "formattedPriceDroppingFractionDigitsIfLengthExceeds:", 10);
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v24 = &stru_24D74CF50;
        }
        v29 = v16;
        v30 = v11;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        -[__CFString boundingRectWithSize:options:attributes:context:](v24, "boundingRectWithSize:options:attributes:context:", 0, v25, 0, 1.79769313e308, 0.0);
        v27 = ceil(v26);

        if (ceil(v22) + 8.0 > v15 - v27 + -16.0)
          break;
        v17 = ++v14 < v13;
      }
      while (v13 != v14);
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
