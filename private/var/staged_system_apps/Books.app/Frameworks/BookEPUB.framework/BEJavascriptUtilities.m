@implementation BEJavascriptUtilities

+ (CGSize)_sizeFromArray:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  objc_msgSend(a1, "floatFromJSON:", v5);
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
  objc_msgSend(a1, "floatFromJSON:", v8);
  v10 = v9;

  v11 = v7;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

+ (double)floatFromJSON:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  v5 = BUDynamicCast(v4, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "doubleValue");
    v9 = v8;
  }
  else
  {
    v10 = objc_opt_class(NSString);
    v11 = BUDynamicCast(v10, v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "doubleValue");
      v9 = v14;
    }
    else
    {
      v9 = 0.0;
    }

  }
  return v9;
}

+ (CGSize)sizeFromJSON:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  double v8;
  CGFloat width;
  double v10;
  CGFloat height;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGSize result;

  v4 = a3;
  v5 = objc_opt_class(NSArray);
  v6 = BUDynamicCast(v5, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  if (v7)
  {
    objc_msgSend(a1, "_sizeFromArray:", v7);
    width = v8;
    height = v10;
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
    v12 = objc_opt_class(NSString);
    v13 = BUDynamicCast(v12, v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    if (v14)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dataUsingEncoding:", 4));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSJSONSerialization JSONObjectWithData:options:error:](NSJSONSerialization, "JSONObjectWithData:options:error:", v16, 0, 0));

      v18 = objc_opt_class(NSArray);
      v19 = BUDynamicCast(v18, v17);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      if (v20)
      {
        objc_msgSend(a1, "_sizeFromArray:", 0);
        width = v21;
        height = v22;
      }

    }
  }

  v23 = width;
  v24 = height;
  result.height = v24;
  result.width = v23;
  return result;
}

+ (CGRect)rectFromRectDictionary:(id)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v7 = a3;
  v8 = objc_opt_class(NSNumber);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("left")));
  v10 = BUDynamicCast(v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  v12 = objc_opt_class(NSNumber);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("top")));
  v14 = BUDynamicCast(v12, v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

  v16 = objc_opt_class(NSNumber);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("width")));
  v18 = BUDynamicCast(v16, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

  v20 = objc_opt_class(NSNumber);
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("height")));

  v22 = BUDynamicCast(v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue(v22);

  if (v11 && v15 && v19 && v23)
  {
    objc_msgSend(v11, "doubleValue");
    x = v24;
    objc_msgSend(v15, "doubleValue");
    y = v25;
    objc_msgSend(v19, "doubleValue");
    width = v26;
    objc_msgSend(v23, "doubleValue");
    height = v27;
  }

  v28 = x;
  v29 = y;
  v30 = width;
  v31 = height;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

+ (id)keyedRectFromKeyedDOMRect:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v16));
        v13 = sub_64B0((uint64_t)v12, (uint64_t)v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (v14)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)keyedRectsFromKeyedDOMRects:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allKeys"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v4, "count")));

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v11, (_QWORD)v16));
        v13 = sub_669C((uint64_t)v12, v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

        if (v14)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v5;
}

+ (id)collapsedLineRectsFromArrayOfRectDictionaries:(id)a3 isVerticalDocument:(BOOL)a4
{
  return +[BEJavascriptUtilities collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:needsFiltering:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRectDictionaries:isVerticalDocument:needsFiltering:", a3, a4, 0);
}

+ (id)collapsedLineRectsFromArrayOfRectDictionaries:(id)a3 isVerticalDocument:(BOOL)a4 needsFiltering:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v18;
  void *v19;
  _BOOL4 v21;
  _QWORD v22[4];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  CGRect v28;

  v21 = a5;
  v5 = a4;
  v7 = a3;
  v8 = objc_alloc_init((Class)NSMutableArray);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(a1, "rectFromRectDictionary:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v13));
        x = v28.origin.x;
        y = v28.origin.y;
        width = v28.size.width;
        height = v28.size.height;
        if (!CGRectIsNull(v28))
        {
          *(CGFloat *)v22 = x;
          *(CGFloat *)&v22[1] = y;
          *(CGFloat *)&v22[2] = width;
          *(CGFloat *)&v22[3] = height;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v22, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
          objc_msgSend(v8, "addObject:", v18);

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities collapsedLineRectsFromArrayOfRects:isVerticalDocument:needsFiltering:wordSpacingMultiplier:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRects:isVerticalDocument:needsFiltering:wordSpacingMultiplier:", v8, v5, v21, 0.0));
  return v19;
}

+ (id)_filteredRectsFromArrayOfRects:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  id v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  CGRect v45;
  CGRect v46;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v40;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v10), "CGRectValue");
        v12 = v11;
        v14 = v13;
        v16 = v15;
        v18 = v17;
        v35 = 0u;
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v19 = v5;
        v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v20)
        {
          v21 = v20;
          v22 = *(_QWORD *)v36;
          do
          {
            v23 = 0;
            do
            {
              if (*(_QWORD *)v36 != v22)
                objc_enumerationMutation(v19);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v23), "CGRectValue");
              v46.origin.x = v24;
              v46.origin.y = v25;
              v46.size.width = v26;
              v28 = v27;
              v45.origin.x = v12;
              v45.origin.y = v14;
              v45.size.width = v16;
              v45.size.height = v18;
              v46.size.height = v28;
              v29 = CGRectIntersectsRect(v45, v46);
              v30 = v28 * 1.5;
              if (v29 && v18 > v28 && v18 > v30)
                objc_msgSend(v4, "addIndex:", v8, v30);
              v23 = (char *)v23 + 1;
            }
            while (v21 != v23);
            v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v21);
        }

        ++v8;
        v10 = (char *)v10 + 1;
      }
      while (v10 != v7);
      v7 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v7);
  }

  v33 = objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v33, "removeObjectsAtIndexes:", v4);

  return v33;
}

+ (id)collapsedLineRectsFromArrayOfRects:(id)a3 isVerticalDocument:(BOOL)a4 needsFiltering:(BOOL)a5 wordSpacingMultiplier:(double)a6
{
  _BOOL4 v7;
  _BOOL8 v8;
  id v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = v9;
  if (a6 == 0.0)
    v11 = 200.0;
  else
    v11 = a6 * 200.0;
  if (v11 <= (double)(unint64_t)objc_msgSend(v9, "count"))
  {
    v13 = &__NSArray0__struct;
  }
  else
  {
    if (v7)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities _filteredRectsFromArrayOfRects:](BEJavascriptUtilities, "_filteredRectsFromArrayOfRects:", v10));
    else
      v12 = 0;
    if (v12)
      v14 = v12;
    else
      v14 = v10;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities _reduceRectArrayToContainedRects:isVerticalDocument:](BEJavascriptUtilities, "_reduceRectArrayToContainedRects:isVerticalDocument:", v14, v8));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[BEJavascriptUtilities _combinedRectsOnSameLineWhichAreNearby:isVerticalDocument:](BEJavascriptUtilities, "_combinedRectsOnSameLineWhichAreNearby:isVerticalDocument:", v15, v8));

  }
  return v13;
}

+ (id)collapsedLineRectsFromArrayOfRects:(id)a3 isVerticalDocument:(BOOL)a4
{
  return +[BEJavascriptUtilities collapsedLineRectsFromArrayOfRects:isVerticalDocument:needsFiltering:wordSpacingMultiplier:](BEJavascriptUtilities, "collapsedLineRectsFromArrayOfRects:isVerticalDocument:needsFiltering:wordSpacingMultiplier:", a3, a4, 0, 0.0);
}

+ (id)_combinedRectsOnSameLineWhichAreNearby:(id)a3 isVerticalDocument:(BOOL)a4
{
  id v5;
  NSMutableArray *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat height;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  void *v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double MinX;
  double MaxY;
  CGRect *v29;
  double MinY;
  double MaxX;
  double v32;
  void *v33;
  CGFloat rect;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
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
  CGRect v50;
  CGRect v51;

  v5 = a3;
  v6 = objc_opt_new(NSMutableArray);
  if (objc_msgSend(v5, "count"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v7, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    height = v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v16, 0);

    if ((unint64_t)objc_msgSend(v5, "count") >= 2)
    {
      v17 = 1;
      v18 = 1;
      do
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", v18));
        objc_msgSend(v19, "CGRectValue");
        x = v20;
        y = v21;
        width = v22;
        rect = v23;
        if (a4)
        {
          MinX = CGRectGetMinX(*(CGRect *)&v20);
          v38.origin.x = v9;
          v38.origin.y = v11;
          v38.size.width = v13;
          v38.size.height = height;
          if (MinX != CGRectGetMinX(v38))
            goto LABEL_13;
          v39.origin.x = v9;
          v39.origin.y = v11;
          v39.size.width = v13;
          v39.size.height = height;
          MaxY = CGRectGetMaxY(v39);
          v40.origin.x = x;
          v40.origin.y = y;
          v40.size.width = width;
          v40.size.height = rect;
          if (vabdd_f64(MaxY, CGRectGetMinY(v40)) >= 15.0)
            goto LABEL_13;
          v41.origin.x = v9;
          v41.origin.y = v11;
          v41.size.width = v13;
          v41.size.height = height;
          v50.origin.x = x;
          v50.origin.y = y;
          v50.size.width = width;
          v50.size.height = rect;
          v42 = CGRectUnion(v41, v50);
          x = v42.origin.x;
          y = v42.origin.y;
          width = v42.size.width;
          height = v42.size.height;
          v36 = v42;
          v29 = &v36;
        }
        else
        {
          MinY = CGRectGetMinY(*(CGRect *)&v20);
          v43.origin.x = v9;
          v43.origin.y = v11;
          v43.size.width = v13;
          v43.size.height = height;
          if (MinY != CGRectGetMinY(v43))
            goto LABEL_13;
          v44.origin.x = v9;
          v44.origin.y = v11;
          v44.size.width = v13;
          v44.size.height = height;
          MaxX = CGRectGetMaxX(v44);
          v45.origin.x = x;
          v45.origin.y = y;
          v45.size.width = width;
          v45.size.height = rect;
          if (vabdd_f64(MaxX, CGRectGetMinX(v45)) >= 15.0)
          {
            v46.origin.x = v9;
            v46.origin.y = v11;
            v46.size.width = v13;
            v46.size.height = height;
            v32 = CGRectGetMinX(v46);
            v47.origin.x = x;
            v47.origin.y = y;
            v47.size.width = width;
            v47.size.height = rect;
            if (vabdd_f64(v32, CGRectGetMaxX(v47)) >= 15.0)
            {
LABEL_13:
              -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v19, v17++);
              height = rect;
              goto LABEL_14;
            }
          }
          v48.origin.x = v9;
          v48.origin.y = v11;
          v48.size.width = v13;
          v48.size.height = height;
          v51.origin.x = x;
          v51.origin.y = y;
          v51.size.width = width;
          v51.size.height = rect;
          v49 = CGRectUnion(v48, v51);
          x = v49.origin.x;
          y = v49.origin.y;
          width = v49.size.width;
          height = v49.size.height;
          v37 = v49;
          v29 = &v37;
        }
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithBytes:objCType:](NSValue, "valueWithBytes:objCType:", v29, "{CGRect={CGPoint=dd}{CGSize=dd}}"));
        -[NSMutableArray setObject:atIndexedSubscript:](v6, "setObject:atIndexedSubscript:", v33, v17 - 1);

LABEL_14:
        ++v18;
        v9 = x;
        v11 = y;
        v13 = width;
      }
      while (v18 < (unint64_t)objc_msgSend(v5, "count"));
    }
  }

  return v6;
}

+ (id)_reduceRectArrayToContainedRects:(id)a3 isVerticalDocument:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  double MinX;
  double MaxX;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  void *v49;
  CGFloat v50;
  CGFloat v51;
  CGFloat v52;
  CGFloat v53;
  double MaxY;
  double MinY;
  CGFloat rect1;
  CGFloat v57;
  CGFloat v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  _BYTE v68[128];
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
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v4 = a4;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v5, "count")));
  v63 = 0u;
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v64;
    v49 = v6;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v12, "CGRectValue", v49);
        x = v69.origin.x;
        y = v69.origin.y;
        width = v69.size.width;
        height = v69.size.height;
        if (CGRectGetWidth(v69) > 1.0)
        {
          v70.origin.x = x;
          v70.origin.y = y;
          v70.size.width = width;
          v70.size.height = height;
          if (CGRectGetHeight(v70) > 1.0)
          {
            v57 = y;
            v58 = x;
            rect1 = width;
            v17 = x;
            v18 = y;
            v19 = width;
            v20 = height;
            if (v4)
            {
              MinY = CGRectGetMinY(*(CGRect *)&v17);
              v71.origin.x = x;
              v71.origin.y = y;
              v71.size.width = width;
              v71.size.height = height;
              MaxY = CGRectGetMaxY(v71);
              v21 = 5.0;
              v22 = 0.0;
            }
            else
            {
              MinY = CGRectGetMinX(*(CGRect *)&v17);
              v72.origin.x = x;
              v72.origin.y = y;
              v72.size.width = width;
              v72.size.height = height;
              MaxY = CGRectGetMaxX(v72);
              v21 = 0.0;
              v22 = 5.0;
            }
            v73.origin.x = x;
            v73.origin.y = y;
            v73.size.width = width;
            v23 = height;
            v73.size.height = height;
            v74 = CGRectInset(v73, v21, v22);
            v52 = v74.origin.y;
            v53 = v74.origin.x;
            v50 = v74.size.height;
            v51 = v74.size.width;
            v61 = 0u;
            v62 = 0u;
            v59 = 0u;
            v60 = 0u;
            v24 = v7;
            v25 = v7;
            v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
            if (v26)
            {
              v27 = v26;
              v28 = *(_QWORD *)v60;
              do
              {
                for (j = 0; j != v27; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v60 != v28)
                    objc_enumerationMutation(v25);
                  objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)j), "CGRectValue");
                  v30 = v75.origin.x;
                  v31 = v75.origin.y;
                  v32 = v75.size.width;
                  v33 = v75.size.height;
                  if (CGRectGetWidth(v75) > 1.0)
                  {
                    v76.origin.x = v30;
                    v76.origin.y = v31;
                    v76.size.width = v32;
                    v76.size.height = v33;
                    if (CGRectGetHeight(v76) > 1.0)
                    {
                      v77.origin.y = v57;
                      v77.origin.x = v58;
                      v77.size.width = rect1;
                      v77.size.height = v23;
                      v83.origin.x = v30;
                      v83.origin.y = v31;
                      v83.size.width = v32;
                      v83.size.height = v33;
                      if (!CGRectEqualToRect(v77, v83))
                      {
                        v34 = v30;
                        v35 = v31;
                        v36 = v32;
                        v37 = v33;
                        if (v4)
                        {
                          MinX = CGRectGetMinY(*(CGRect *)&v34);
                          v78.origin.x = v30;
                          v78.origin.y = v31;
                          v78.size.width = v32;
                          v78.size.height = v33;
                          MaxX = CGRectGetMaxY(v78);
                          v40 = 5.0;
                          v41 = 0.0;
                        }
                        else
                        {
                          MinX = CGRectGetMinX(*(CGRect *)&v34);
                          v79.origin.x = v30;
                          v79.origin.y = v31;
                          v79.size.width = v32;
                          v79.size.height = v33;
                          MaxX = CGRectGetMaxX(v79);
                          v40 = 0.0;
                          v41 = 5.0;
                        }
                        v80.origin.x = v30;
                        v80.origin.y = v31;
                        v80.size.width = v32;
                        v80.size.height = v33;
                        v81 = CGRectInset(v80, v40, v41);
                        v42 = v81.origin.x;
                        v43 = v81.origin.y;
                        v44 = v81.size.width;
                        v45 = v81.size.height;
                        if (MinY <= MinX && MaxY >= MaxX)
                        {
                          v82.origin.y = v52;
                          v82.origin.x = v53;
                          v82.size.height = v50;
                          v82.size.width = v51;
                          if (CGRectIntersectsRect(v82, *(CGRect *)&v42) && (MinY != MinX || MaxY != MaxX))
                          {

                            v7 = v24;
                            v6 = v49;
                            goto LABEL_36;
                          }
                        }
                      }
                    }
                  }
                }
                v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v59, v67, 16);
              }
              while (v27);
            }

            v7 = v24;
            v6 = v49;
          }
        }
        objc_msgSend(v6, "addObject:", v12);
LABEL_36:
        ;
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v63, v68, 16);
    }
    while (v9);
  }

  return v6;
}

@end
