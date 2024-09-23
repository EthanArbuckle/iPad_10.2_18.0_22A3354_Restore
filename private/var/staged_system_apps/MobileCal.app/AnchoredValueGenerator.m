@implementation AnchoredValueGenerator

- (double)valueForSize:(double)a3
{
  AnchoredValuePair *cachedLastResult;
  double v6;
  double v7;
  double result;
  unsigned int v9;
  double v10;
  void *v12;
  double v13;
  double v14;
  double v15;
  AnchoredValuePair *v16;
  AnchoredValuePair *v17;
  id v18;
  uint64_t v19;
  id v20;
  char v21;
  double v22;

  if (self->_pairs)
  {
    if (self->_needsSorting)
      -[AnchoredValueGenerator _sort](self, "_sort");
    cachedLastResult = self->_cachedLastResult;
    if (cachedLastResult)
    {
      -[AnchoredValuePair size](cachedLastResult, "size");
      v7 = v6 - a3;
      if (v7 < 0.0)
        v7 = -v7;
      if (v7 < 0.00001)
      {
        -[AnchoredValuePair value](self->_cachedLastResult, "value");
        return result;
      }
    }
    v9 = -[AnchoredValueGenerator calculationType](self, "calculationType");
    if (v9 - 1 >= 3)
    {
      if (v9 && v9 != 4)
      {
        v22 = 0.0;
        v21 = 0;
        v19 = 0;
        v20 = 0;
        -[AnchoredValueGenerator _findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:](self, "_findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:", &v20, &v19, &v22, &v21, a3);
        v18 = v20;
        if (v21)
          v14 = v22;
        else
          v14 = 0.0;

        goto LABEL_16;
      }
      -[AnchoredValueGenerator _interpolatedValueForSize:](self, "_interpolatedValueForSize:", a3);
    }
    else
    {
      -[AnchoredValueGenerator _nearestValueForSize:](self, "_nearestValueForSize:", a3);
    }
    v14 = v10;
LABEL_16:
    -[AnchoredValueGenerator _roundValue:](self, "_roundValue:", v14);
    v13 = v15;
    v16 = (AnchoredValuePair *)objc_claimAutoreleasedReturnValue(+[AnchoredValuePair pairWithValue:size:layoutShift:](AnchoredValuePair, "pairWithValue:size:layoutShift:", 0));
    v17 = self->_cachedLastResult;
    self->_cachedLastResult = v16;

    return v13;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler", a3));
  objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AnchoredValueGenerator.m"), 125, CFSTR("Anchored value: attempt to use without adding anchors"));

  return 0.0;
}

- (double)_interpolatedValueForSize:(double)a3
{
  unint64_t v6;
  unint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned int v12;
  unsigned int v13;
  void *v14;
  BOOL v15;
  char v16;
  char v17;
  void *v18;
  id v19;
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
  id v35;
  id v36;
  char v37;
  double v38;

  v38 = 0.0;
  v37 = 0;
  v35 = 0;
  v36 = 0;
  -[AnchoredValueGenerator _findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:](self, "_findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:", &v36, &v35, &v38, &v37);
  v6 = (unint64_t)v36;
  v7 = (unint64_t)v35;
  if (!v37)
  {
    if (-[AnchoredValueGenerator calculationType](self, "calculationType") == 4
      && (objc_msgSend((id)v6, "value"), v10 = v9, objc_msgSend((id)v7, "value"), v10 > v11))
    {
      if ((objc_msgSend((id)v6, "layoutShift") & 1) != 0)
        v12 = 1;
      else
        v12 = objc_msgSend((id)v7, "layoutShift");
    }
    else
    {
      v12 = 0;
    }
    v13 = v7 == 0;
    if (!(v7 | v6))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AnchoredValueGenerator.m"), 259, CFSTR("Anchored value: unable to find interpolated value"));

      v8 = 0.0;
      goto LABEL_31;
    }
    if (v7)
      v15 = v6 == 0;
    else
      v15 = 1;
    v16 = v15;
    if (v15)
      v17 = 1;
    else
      v17 = v12;
    if ((v17 & 1) == 0)
    {
      objc_msgSend((id)v6, "size");
      v21 = a3 - v20;
      objc_msgSend((id)v7, "size");
      v23 = v22;
      objc_msgSend((id)v6, "size");
      v25 = v21 / (v23 - v24);
      objc_msgSend((id)v7, "value");
      v27 = v26;
      objc_msgSend((id)v6, "value");
      v29 = v27 - v28;
      objc_msgSend((id)v6, "value");
      v8 = v30 + v25 * v29;
      goto LABEL_31;
    }
    if ((v16 & 1) == 0)
    {
      if (!v12)
      {
        v19 = 0;
LABEL_30:
        objc_msgSend(v19, "value");
        v32 = v31;
        objc_msgSend(v19, "size");
        v8 = v32 / v33 * a3;

        goto LABEL_31;
      }
      v13 = objc_msgSend((id)v7, "layoutShift");
    }
    if (v13)
      v18 = (void *)v6;
    else
      v18 = (void *)v7;
    v19 = v18;
    goto LABEL_30;
  }
  v8 = v38;
LABEL_31:

  return v8;
}

- (void)_findBoundsForSize:(double)a3 outLowerBound:(id *)a4 outUpperBound:(id *)a5 outExactMatchValue:(double *)a6 outFoundExactMatch:(BOOL *)a7
{
  NSMutableArray *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  uint64_t v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v11 = self->_pairs;
  v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v16)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v18, "size");
        v20 = v19 - a3;
        if (v20 < 0.0)
          v20 = -v20;
        if (v20 < 0.00001)
        {
          if (a5)
            *a5 = 0;
          if (a4)
            *a4 = 0;
          if (a6)
          {
            objc_msgSend(v18, "value");
            *(_QWORD *)a6 = v31;
          }
          if (a7)
            *a7 = 1;

          goto LABEL_40;
        }
        objc_msgSend(v18, "size");
        if (v21 >= a3)
        {
          objc_msgSend(v18, "size");
          if (v26 > a3)
          {
            if (v14)
            {
              objc_msgSend(v14, "size");
              v28 = v27;
              objc_msgSend(v18, "size");
              if (v28 > v29)
              {
                v30 = v18;

                v14 = v30;
              }
            }
            else
            {
              v14 = v18;
            }
          }
        }
        else if (v15)
        {
          objc_msgSend(v15, "size");
          v23 = v22;
          objc_msgSend(v18, "size");
          if (v23 < v24)
          {
            v25 = v18;

            v15 = v25;
          }
        }
        else
        {
          v15 = v18;
        }
      }
      v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      if (v13)
        continue;
      break;
    }
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v14);
  if (a4)
    *a4 = objc_retainAutorelease(v15);
  if (a6)
    *a6 = 0.0;
  if (a7)
    *a7 = 0;
LABEL_40:

}

- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4 layoutShift:(BOOL)a5
{
  _BOOL8 v5;
  double v8;

  v5 = a5;
  v8 = EKUIWidthForWindowSizeParadigm(a4, a2);
  -[AnchoredValueGenerator addAnchoredValue:forSize:layoutShift:](self, "addAnchoredValue:forSize:layoutShift:", v5, a3, v8);
}

- (void)addAnchoredValue:(double)a3 forWindowSizeWidth:(unint64_t)a4
{
  -[AnchoredValueGenerator addAnchoredValue:forWindowSizeWidth:layoutShift:](self, "addAnchoredValue:forWindowSizeWidth:layoutShift:", a4, 0, a3);
}

- (void)addAnchoredValue:(double)a3 forSize:(double)a4 layoutShift:(BOOL)a5
{
  _BOOL8 v5;
  AnchoredValuePair *cachedLastResult;
  NSMutableArray *pairs;
  NSMutableArray *v11;
  NSMutableArray *v12;
  id v13;

  v5 = a5;
  self->_needsSorting = 1;
  cachedLastResult = self->_cachedLastResult;
  self->_cachedLastResult = 0;

  pairs = self->_pairs;
  if (!pairs)
  {
    v11 = objc_opt_new(NSMutableArray);
    v12 = self->_pairs;
    self->_pairs = v11;

    pairs = self->_pairs;
  }
  v13 = (id)objc_claimAutoreleasedReturnValue(+[AnchoredValuePair pairWithValue:size:layoutShift:](AnchoredValuePair, "pairWithValue:size:layoutShift:", v5, a3, a4));
  -[NSMutableArray addObject:](pairs, "addObject:", v13);

}

- (void)setCalculationType:(int)a3
{
  self->_calculationType = a3;
}

- (int)roundingType
{
  return self->_roundingType;
}

- (AnchoredValueGenerator)init
{
  AnchoredValueGenerator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AnchoredValueGenerator;
  result = -[AnchoredValueGenerator init](&v3, "init");
  if (result)
    *(_QWORD *)&result->_calculationType = 0;
  return result;
}

- (int)calculationType
{
  return self->_calculationType;
}

- (void)_sort
{
  -[NSMutableArray sortUsingComparator:](self->_pairs, "sortUsingComparator:", &stru_1001B2DE0);
}

- (double)_roundValue:(double)a3
{
  uint64_t v4;
  uint64_t v5;
  __n128 v6;
  double result;

  v4 = -[AnchoredValueGenerator roundingType](self, "roundingType");
  switch((int)v4)
  {
    case 1:
      v6.n128_f64[0] = a3;
      CalFloorToScreenScale(v6);
      break;
    case 2:
      result = CalCeilToScreenScale(v4, a3);
      break;
    case 3:
      result = round(a3);
      break;
    case 4:
      result = floor(a3);
      break;
    case 5:
      result = ceil(a3);
      break;
    default:
      result = CalRoundToScreenScale(v4, v5, a3);
      break;
  }
  return result;
}

- (id)description
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\t Pairs: %@>"), objc_opt_class(self), self, self->_pairs);
}

- (void)addAnchoredValue:(double)a3 forSize:(double)a4
{
  -[AnchoredValueGenerator addAnchoredValue:forSize:layoutShift:](self, "addAnchoredValue:forSize:layoutShift:", 0, a3, a4);
}

- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4
{
  -[AnchoredValueGenerator addAnchoredValue:forWindowSizeHeight:layoutShift:](self, "addAnchoredValue:forWindowSizeHeight:layoutShift:", a4, 0, a3);
}

- (void)addAnchoredValue:(double)a3 forWindowSizeHeight:(unint64_t)a4 layoutShift:(BOOL)a5
{
  _BOOL8 v5;
  double v8;

  v5 = a5;
  v8 = EKUIHeightForWindowSizeParadigm(a4, a2);
  -[AnchoredValueGenerator addAnchoredValue:forSize:layoutShift:](self, "addAnchoredValue:forSize:layoutShift:", v5, a3, v8);
}

- (double)valueForWindowSizeWidth:(unint64_t)a3
{
  double result;

  -[AnchoredValueGenerator valueForSize:](self, "valueForSize:", EKUIWidthForWindowSizeParadigm(a3, a2));
  return result;
}

- (double)valueForWindowSizeHeight:(unint64_t)a3
{
  double result;

  -[AnchoredValueGenerator valueForSize:](self, "valueForSize:", EKUIHeightForWindowSizeParadigm(a3, a2));
  return result;
}

- (double)_nearestValueForSize:(double)a3
{
  unint64_t v6;
  unint64_t v7;
  double v8;
  void *v9;
  double v10;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  id v19;
  char v20;
  double v21;

  v21 = 0.0;
  v20 = 0;
  v18 = 0;
  v19 = 0;
  -[AnchoredValueGenerator _findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:](self, "_findBoundsForSize:outLowerBound:outUpperBound:outExactMatchValue:outFoundExactMatch:", &v19, &v18, &v21, &v20);
  v6 = (unint64_t)v19;
  v7 = (unint64_t)v18;
  if (!v20)
  {
    if (-[AnchoredValueGenerator calculationType](self, "calculationType") == 3 && v7)
      goto LABEL_5;
    if (-[AnchoredValueGenerator calculationType](self, "calculationType") != 2 || !v6)
    {
      if (!(v7 | v6))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
        objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("AnchoredValueGenerator.m"), 313, CFSTR("Anchored value: unable to find nearest value."));

        v8 = 0.0;
        goto LABEL_10;
      }
      if (v7 && v6)
      {
        objc_msgSend((id)v7, "size");
        v13 = v12 - a3;
        if (v13 >= 0.0)
          v14 = v13;
        else
          v14 = -v13;
        objc_msgSend((id)v6, "size");
        v16 = v15 - a3;
        if (v16 < 0.0)
          v16 = -v16;
        if (v14 < v16)
          goto LABEL_5;
      }
      else if (v7)
      {
LABEL_5:
        v9 = (void *)v7;
LABEL_9:
        objc_msgSend(v9, "value");
        v8 = v10;
        goto LABEL_10;
      }
    }
    v9 = (void *)v6;
    goto LABEL_9;
  }
  v8 = v21;
LABEL_10:

  return v8;
}

- (void)setRoundingType:(int)a3
{
  self->_roundingType = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedLastResult, 0);
  objc_storeStrong((id *)&self->_pairs, 0);
}

@end
