@implementation CHPChartDirection

- (BOOL)isObjectSupported:(id)a3
{
  id v3;
  void *v4;
  int v5;
  BOOL v6;

  v3 = a3;
  v6 = 0;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "chart");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "direction");

      if (!v5)
        v6 = 1;
    }
  }

  return v6;
}

- (void)applyProcessorToObject:(id)a3 sheet:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  id v24;

  v24 = a3;
  objc_msgSend(v24, "seriesCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "chart");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "valueData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v14 = 0;
LABEL_31:
      objc_msgSend(v5, "setDirection:", v14);

      goto LABEL_32;
    }
    objc_msgSend(v7, "formula");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "references");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10 || !objc_msgSend(v10, "count"))
    {
      v14 = 0;
LABEL_30:

      goto LABEL_31;
    }
    objc_msgSend(v10, "objectAtIndex:", 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "firstRow");
    if (v12 < (int)objc_msgSend(v11, "lastRow")
      && (v13 = objc_msgSend(v11, "firstColumn"), v13 == objc_msgSend(v11, "lastColumn")))
    {
      v14 = 2;
    }
    else
    {
      v15 = objc_msgSend(v11, "firstRow");
      if (v15 == objc_msgSend(v11, "lastRow"))
      {
        v16 = objc_msgSend(v11, "firstColumn");
        if (v16 == objc_msgSend(v11, "lastColumn"))
        {
          if ((unint64_t)objc_msgSend(v10, "count") < 2)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v14 = 0;
                goto LABEL_29;
              }
            }
            objc_msgSend(v6, "categoryData");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "formula");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "references");
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 && objc_msgSend(v20, "count"))
            {
              objc_msgSend(v20, "objectAtIndex:", 0);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v22 = objc_msgSend(v11, "firstRow");
              if (v22 == objc_msgSend(v21, "firstRow"))
              {
                v14 = 2;
              }
              else
              {
                v23 = objc_msgSend(v11, "firstColumn");
                v14 = v23 == objc_msgSend(v21, "firstColumn");
              }

            }
            else
            {
              v14 = 0;
            }

          }
          else
          {
            objc_msgSend(v10, "objectAtIndex:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "firstRow");
            if (v18 >= (int)objc_msgSend(v11, "lastRow"))
              v14 = 1;
            else
              v14 = 2;
          }

          goto LABEL_29;
        }
      }
      v14 = 1;
    }
LABEL_29:

    goto LABEL_30;
  }
LABEL_32:

}

@end
