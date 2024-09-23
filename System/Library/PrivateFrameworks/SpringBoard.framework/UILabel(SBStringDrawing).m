@implementation UILabel(SBStringDrawing)

- (SBStringMetrics)stringMetricsForFirstLineWidth:()SBStringDrawing
{
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  unint64_t v13;
  double Height;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  uint64_t v25;
  double Width;
  double v27;
  double v28;
  void *v29;
  unint64_t v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  double v37;
  void *v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  void *v42;
  unint64_t v44;
  uint64_t v45;
  void *v46;
  double v47;
  void *v48;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  SBStringMetrics *v54;
  void *v55;
  CGRect v56;
  CGRect v57;

  v54 = objc_alloc_init(SBStringMetrics);
  objc_msgSend(a1, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = objc_msgSend(v4, "length");
  v56.origin.x = v6;
  v56.origin.y = v8;
  v56.size.width = v10;
  v56.size.height = v12;
  Height = CGRectGetHeight(v56);
  objc_msgSend(a1, "font");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "lineHeight");
  v17 = Height / v16;

  v18 = objc_msgSend(a1, "numberOfLines");
  if (v17 >= (double)v18)
    v17 = (double)v18;
  objc_msgSend(a1, "_defaultAttributes");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (!stringMetricsForFirstLineWidth____NonWhitespace)
  {
    objc_msgSend(v55, "invertedSet");
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = (void *)stringMetricsForFirstLineWidth____NonWhitespace;
    stringMetricsForFirstLineWidth____NonWhitespace = v20;

  }
  if (v13)
  {
    v22 = (unint64_t)v17;
    if ((unint64_t)v17)
    {
      v23 = 0;
      v24 = 0;
      v52 = v22 - 1;
      v53 = (unint64_t)v17;
      do
      {
        v25 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", stringMetricsForFirstLineWidth____NonWhitespace, 0, v23, v13 - v23);
        if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          break;
        v23 = v25;
        v57.origin.x = v6;
        v57.origin.y = v8;
        v57.size.width = v10;
        v57.size.height = v12;
        Width = CGRectGetWidth(v57);
        v27 = fmin(a2, Width);
        v28 = v24 ? Width : v27;
        if (v28 <= 0.0)
        {
          ++v24;
          +[SBLineFragment fragmentWithIndex:length:lineWidth:](SBLineFragment, "fragmentWithIndex:length:lineWidth:", v23, 0, v28);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBStringMetrics addFragment:](v54, "addFragment:", v38);

        }
        else
        {
          v29 = (void *)MEMORY[0x1D17E5334]();
          if (v23 >= v13)
          {
            v35 = v23;
          }
          else
          {
            v30 = v23;
            v31 = v28;
            while (1)
            {
              if (v31 == v28)
              {
                v33 = v30;
              }
              else
              {
                v32 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", stringMetricsForFirstLineWidth____NonWhitespace, 0, v30, v13 - v30);
                if (v32 == 0x7FFFFFFFFFFFFFFFLL)
                {
                  v35 = v13 + 1;
                  goto LABEL_47;
                }
                v33 = v32;
              }
              v34 = objc_msgSend(v4, "rangeOfCharacterFromSet:options:range:", v55, 0, v33, v13 - v33);
              v35 = v34 == 0x7FFFFFFFFFFFFFFFLL ? v13 : v34;
              objc_msgSend(v4, "substringWithRange:", v30, v35 - v30);
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "sizeWithAttributes:", v19);
              if (v37 > v31)
                break;
              v31 = v31 - v37;

              v30 = v35;
              if (v35 >= v13)
                goto LABEL_47;
            }
            if (v31 == v28 && v24 < v52)
            {
              v39 = v31 * (double)(uint64_t)(v35 - v30) / v37;
              v40 = (uint64_t)v39;
              if ((uint64_t)v39)
              {
                v41 = v30 + v40;
                if (v30 + v40 <= v30)
                {
                  v44 = v30 + v40;
                }
                else
                {
                  v50 = v30 + v40;
                  v51 = (uint64_t)v39;
                  do
                  {
                    v42 = v36;
                    objc_msgSend(v4, "substringWithRange:", v30, v40);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(v36, "sizeWithAttributes:", v19);
                    --v40;
                  }
                  while (v37 > v31 && v40 + v30 > v30);
                  v44 = v30 + v40;
                  v41 = v50;
                  v40 = v51;
                }
                if (v44 + 1 == v41)
                {
                  if (v37 >= v31)
                  {
                    v30 = v44;
                  }
                  else
                  {
                    v45 = v40 - 1;
                    do
                    {
                      v46 = v36;
                      objc_msgSend(v4, "substringWithRange:", v30, v45 + 2);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v36, "sizeWithAttributes:", v19);
                      ++v45;
                    }
                    while (v47 < v31);
                    v30 += v45;
                  }
                }
                else
                {
                  v30 = v44 + 1;
                }
              }
            }
            ++v24;

            v35 = v30;
          }
LABEL_47:
          +[SBLineFragment fragmentWithIndex:length:lineWidth:](SBLineFragment, "fragmentWithIndex:length:lineWidth:", v23, v35 - v23, v28);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBStringMetrics addFragment:](v54, "addFragment:", v48);

          objc_autoreleasePoolPop(v29);
          v23 = v35;
          v22 = v53;
        }
      }
      while (v23 < v13 && v24 < v22);
    }
  }

  return v54;
}

- (void)drawWithMetrics:()SBStringDrawing inContext:
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  double v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  uint64_t v41;
  CGRect v42;

  v41 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(a1, "text");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "lineHeight");
  v16 = v15;

  v42.origin.x = v6;
  v42.origin.y = v8;
  v42.size.width = v10;
  v42.size.height = v12;
  v17 = CGRectGetHeight(v42) / v16;
  v18 = objc_msgSend(a1, "numberOfLines");
  if (v17 >= (double)v18)
    v17 = (double)v18;
  objc_msgSend(a1, "_defaultAttributes");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "textColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "set");

  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v20 = v4;
  v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  if (v32)
  {
    v35 = 0;
    v30 = 1 - (unint64_t)v17;
    v31 = *(_QWORD *)v37;
LABEL_5:
    v21 = 0;
    v33 = v30 + v35;
    while (1)
    {
      if (*(_QWORD *)v37 != v31)
        objc_enumerationMutation(v20);
      v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v21);
      v23 = objc_msgSend(v22, "index", v30);
      v24 = objc_msgSend(v22, "range");
      v26 = v25;
      v27 = v33 + v21;
      if (v35 + v21 + 1 == objc_msgSend(v20, "fragmentCount") || !v27)
        v26 = objc_msgSend(v13, "length") - v23;
      else
        v23 = v24;
      objc_msgSend(v13, "substringWithRange:", v23, v26);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "lineWidth");
      objc_msgSend(v28, "drawInRect:withAttributes:", v34, 0.0, v16 * (double)(unint64_t)(v35 + v21), v29, 1.79769313e308);

      if (!v27)
        break;
      if (v32 == ++v21)
      {
        v35 += v21;
        v32 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v32)
          goto LABEL_5;
        break;
      }
    }
  }

}

@end
