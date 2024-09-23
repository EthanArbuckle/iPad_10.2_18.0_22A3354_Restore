@implementation _UIPageIndicatorStore

- (CGSize)resolvedIndicatorLayoutSizeForPage:(int64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  -[_UIPageIndicatorStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (CGSize)_indicatorSizeForObject:(id)a3
{
  void *v3;
  _UIPageIndicatorStoreObject *v5;
  _UIPageIndicatorStoreObject *v6;
  _UIPageIndicatorStoreObject *v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGSize result;

  v5 = (_UIPageIndicatorStoreObject *)a3;
  v6 = v5;
  if (!v5 || !-[_UIPageIndicatorStoreObject hasImage](v5, "hasImage"))
  {
    v7 = self->_defaultObject;

    v6 = v7;
  }
  -[_UIPageIndicatorStoreObject indicatorSize](v6, "indicatorSize");
  if (v9 == -1.0 && v8 == -1.0)
  {
    -[_UIPageIndicatorStore delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPageIndicatorStoreObject customImage](v6, "customImage");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v12;
    if (!v12)
    {
      -[_UIPageIndicatorStore indicatorImage](self, "indicatorImage");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v11, "indicatorSizeForImage:", v3);
    -[_UIPageIndicatorStoreObject setIndicatorSize:](v6, "setIndicatorSize:");
    if (!v12)

  }
  -[_UIPageIndicatorStoreObject activeIndicatorSize](v6, "activeIndicatorSize");
  if (v14 == -1.0 && v13 == -1.0)
  {
    -[_UIPageIndicatorStore delegate](self, "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPageIndicatorStoreObject activeImage](v6, "activeImage");
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v16;
    if (v16)
    {
      v18 = 0;
      v19 = (void *)v16;
    }
    else
    {
      -[_UIPageIndicatorStore preferredActiveImage](self, "preferredActiveImage");
      v20 = objc_claimAutoreleasedReturnValue();
      v3 = (void *)v20;
      if (v20)
      {
        v18 = 0;
        v19 = (void *)v20;
      }
      else
      {
        -[_UIPageIndicatorStore indicatorImage](self, "indicatorImage");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 1;
      }
    }
    objc_msgSend(v15, "indicatorSizeForImage:", v19);
    -[_UIPageIndicatorStoreObject setActiveIndicatorSize:](v6, "setActiveIndicatorSize:");
    if (v18)

    if (!v17)
  }
  -[_UIPageIndicatorStoreObject resolvedSize](v6, "resolvedSize");
  v22 = v21;
  v24 = v23;

  v25 = v22;
  v26 = v24;
  result.height = v26;
  result.width = v25;
  return result;
}

- (int64_t)objectIndexForPage:(int64_t)a3
{
  void *v6;
  int64_t v7;
  void *v9;

  if (a3 < 0 || -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages") <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageIndicatorStore.m"), 693, CFSTR("[UIPageControl] Page out-of-bounds. Requested %ld but the page control only has %ld pages."), a3, -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages"));

  }
  -[_UIPageIndicatorStore store](self, "store");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[_UIPageIndicatorStore _objectIndexForPage:lower:upper:](self, "_objectIndexForPage:lower:upper:", a3, 0, objc_msgSend(v6, "count"));

  return v7;
}

- (int64_t)numberOfPages
{
  void *v2;
  void *v3;
  int64_t v4;

  -[_UIPageIndicatorStore store](self, "store");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "endIndex");

  return v4;
}

- (NSMutableArray)store
{
  return self->_store;
}

- (int64_t)_objectIndexForPage:(int64_t)a3 lower:(int64_t)a4 upper:(int64_t)a5
{
  int64_t v10;
  uint64_t v11;
  int64_t v12;
  void *v13;
  void *v14;
  int64_t v15;
  _UIPageIndicatorStore *v16;
  int64_t v17;
  int64_t v18;
  void *v19;
  void *v21;

  v10 = a5 - a4;
  if (a5 < a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageIndicatorStore.m"), 699, CFSTR("[UIPageControl] Failed to find page index. Tried to look for %ld."), a3);

  }
  if (v10 >= 0)
    v11 = v10;
  else
    v11 = v10 + 1;
  v12 = a4 + (v11 >> 1);
  -[_UIPageIndicatorStore store](self, "store");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectAtIndex:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v14, "validPageWithinBound:", a3) & 1) == 0)
  {
    if (objc_msgSend(v14, "startIndex") > a3)
    {
      v15 = v12 - 1;
      v16 = self;
      v17 = a3;
      v18 = a4;
LABEL_12:
      v12 = -[_UIPageIndicatorStore _objectIndexForPage:lower:upper:](v16, "_objectIndexForPage:lower:upper:", v17, v18, v15);
      goto LABEL_13;
    }
    if (objc_msgSend(v14, "endIndex") <= a3)
    {
      v18 = v12 + 1;
      v16 = self;
      v17 = a3;
      v15 = a5;
      goto LABEL_12;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPageIndicatorStore.m"), 709, CFSTR("Uhm, this shouldn't be possible?"));

    v12 = -1;
  }
LABEL_13:

  return v12;
}

- (UIImage)indicatorImage
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_UIPageIndicatorStore preferredImage](self, "preferredImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[_UIPageIndicatorStore _defaultIndicatorImage](self, "_defaultIndicatorImage");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)preferredImage
{
  return self->_preferredImage;
}

- (CGSize)minimumContentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  double *v7;
  BOOL v8;
  double v9;
  double v10;
  CGSize result;

  length = a3.length;
  location = a3.location;
  v6 = 104;
  if (a4)
    v6 = 240;
  v7 = (double *)((char *)self + v6);
  if ((*((_BYTE *)&self->super.isa + v6) & 1) == 0
    && (*((_QWORD *)v7 + 1) == a3.location ? (v8 = *((_QWORD *)v7 + 2) == a3.length) : (v8 = 0), v8))
  {
    v9 = v7[3];
    v10 = v7[4];
  }
  else
  {
    -[_UIPageIndicatorStore _contentSizeForIndicatorsInRange:hasExpandedActiveIndicator:](self, "_contentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", a3.location, a3.length);
    *(_BYTE *)v7 &= ~1u;
    *((_QWORD *)v7 + 1) = location;
    *((_QWORD *)v7 + 2) = length;
    v7[3] = v9;
    v7[4] = v10;
  }
  result.height = v10;
  result.width = v9;
  return result;
}

- (id)_defaultIndicatorImage
{
  UIImage *defaultImage;
  UIImage *v4;
  UIImage *v5;

  defaultImage = self->_defaultImage;
  if (!defaultImage)
  {
    +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("circlebadge.fill"));
    v4 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v5 = self->_defaultImage;
    self->_defaultImage = v4;

    defaultImage = self->_defaultImage;
  }
  return defaultImage;
}

- (id)activeIndicatorImageForPage:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIPageIndicatorStore customActiveIndicatorImageForPage:](self, "customActiveIndicatorImageForPage:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[_UIPageIndicatorStore customIndicatorImageForPage:](self, "customIndicatorImageForPage:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      -[_UIPageIndicatorStore preferredActiveImage](self, "preferredActiveImage");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6)
      {
        v8 = v6;
      }
      else
      {
        -[_UIPageIndicatorStore indicatorImage](self, "indicatorImage");
        v8 = (id)objc_claimAutoreleasedReturnValue();
      }
      v5 = v8;

    }
  }
  return v5;
}

- (CGSize)defaultIndicatorSize
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  _BOOL4 v21;
  double v22;
  double v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;
  CGSize result;

  v29 = *MEMORY[0x1E0C80C00];
  -[_UIPageIndicatorStore store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  v5 = -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages");

  if (v4 >= v5)
  {
    v7 = *MEMORY[0x1E0C9D820];
    v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    -[_UIPageIndicatorStore store](self, "store", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      while (2)
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v15);
          v17 = v16;
          v19 = v18;
          objc_msgSend(v15, "customImage");
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v20)
          {
            v9 = v19;
            v7 = v17;
            goto LABEL_18;
          }
          if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction") <= 1)
            v21 = v17 <= v7;
          else
            v21 = v19 <= v9;
          if (!v21)
          {
            v9 = v19;
            v7 = v17;
          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        if (v12)
          continue;
        break;
      }
    }
LABEL_18:

  }
  else
  {
    -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", 0);
    v7 = v6;
    v9 = v8;
  }
  v22 = v7;
  v23 = v9;
  result.height = v23;
  result.width = v22;
  return result;
}

- (id)customIndicatorImageForPage:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
  -[_UIPageIndicatorStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "customImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (CGSize)_sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  uint64_t v8;
  int64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  double v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t i;
  double v29;
  double v30;
  double v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  uint64_t v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  unint64_t v44;
  double v45;
  double v46;
  void *v47;
  unint64_t v48;
  double v49;
  double v50;
  uint64_t v51;
  double v52;
  CGSize result;

  v4 = a4;
  -[_UIPageIndicatorStore delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxVisibleIndicators");

  v9 = -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages");
  -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
  v11 = -v10;
  v12 = *MEMORY[0x1E0C9D820];
  v13 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v14 = -[_UIPageIndicatorStore direction](self, "direction");
  if (v14 >= 2)
    v15 = v12;
  else
    v15 = v11;
  if (v14 >= 2)
    v16 = v11;
  else
    v16 = v13;
  -[_UIPageIndicatorStore store](self, "store");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    v19 = 0;
    v20 = 0;
    v21 = 0;
    while (1)
    {
      -[_UIPageIndicatorStore store](self, "store");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = v19;
      objc_msgSend(v22, "objectAtIndex:", v19);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v23);
      v25 = v24;
      v27 = v26;
      for (i = objc_msgSend(v23, "startIndex"); i < objc_msgSend(v23, "endIndex") && v20 < v9; ++i)
      {
        -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
        v30 = -v29;
        v31 = 0.0;
        v52 = v15;
        if (i >= v9 || v8 < 1)
        {
          v20 = i;
          v41 = v30;
          v33 = 0.0;
          if (!v4)
            goto LABEL_34;
        }
        else
        {
          v32 = 0;
          v33 = 0.0;
          while (1)
          {
            if ((objc_msgSend(v23, "validPageWithinBound:", i + v32, v31) & 1) != 0)
            {
              v34 = v25;
              v35 = v27;
            }
            else
            {
              if ((objc_msgSend(v21, "validPageWithinBound:", i + v32) & 1) == 0)
              {
                -[_UIPageIndicatorStore store](self, "store");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "objectAtIndex:", -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", i + v32));
                v37 = objc_claimAutoreleasedReturnValue();

                v21 = (void *)v37;
              }
              -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v21);
              v34 = v38;
              v35 = v39;
            }
            if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction") >= 2)
              v34 = v35;
            -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
            v31 = v40 + v34;
            v33 = fmax(v33, v31);
            v41 = v30 + v31;
            if (v30 + v31 > a3)
              break;
            if (++v32 + i < v9)
            {
              v30 = v30 + v31;
              if (v32 < v8)
                continue;
            }
            v20 = i + v32;
            if (v4)
              goto LABEL_30;
            goto LABEL_34;
          }
          v20 = i + v32;
          v41 = v30;
          if (!v4)
            goto LABEL_34;
        }
LABEL_30:
        v41 = v41 + v33;
        if (v41 > a3)
        {
          v15 = v52;
          do
            v41 = v41 - v31;
          while (v41 > a3);
          goto LABEL_35;
        }
LABEL_34:
        v15 = v52;
LABEL_35:
        if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction") >= 2)
          v42 = v16;
        else
          v42 = v15;
        if (v41 <= a3 && v42 < v41)
        {
          if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction", v42) >= 2)
            v16 = v41;
          else
            v15 = v41;
        }
        if (v20 < objc_msgSend(v23, "endIndex", v42))
          i = i - v20 + objc_msgSend(v23, "endIndex");
      }
      v44 = -[_UIPageIndicatorStore direction](self, "direction");
      v45 = fmax(v16, v27);
      v46 = fmax(v15, v25);
      if (v44 < 2)
        v16 = v45;
      else
        v15 = v46;

      v19 = v51 + 1;
      -[_UIPageIndicatorStore store](self, "store");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = objc_msgSend(v47, "count");

      if (v51 + 1 >= v48)
      {

        break;
      }
    }
  }
  v49 = v15;
  v50 = v16;
  result.height = v50;
  result.width = v49;
  return result;
}

- (CGSize)_contentSizeForIndicatorsInRange:(_NSRange)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  unint64_t v30;
  double v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  unint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;
  CGSize result;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = *MEMORY[0x1E0C9D820];
  v9 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v10 = -[_UIPageIndicatorStore direction](self, "direction");
  -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
  v12 = v11 * (double)(length - 1);
  if (v10 < 2)
    v8 = v12;
  v48 = 0u;
  v49 = 0u;
  if (v10 >= 2)
    v9 = v12;
  v13 = location + length;
  v50 = 0uLL;
  v51 = 0uLL;
  -[_UIPageIndicatorStore store](self, "store", (_QWORD)v48);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v49;
    v18 = 0.0;
LABEL_7:
    v19 = 0;
    while (1)
    {
      if (*(_QWORD *)v49 != v17)
        objc_enumerationMutation(v14);
      v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v19);
      if (objc_msgSend(v20, "startIndex") >= v13)
        break;
      if (objc_msgSend(v20, "endIndex") >= location)
      {
        -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v20);
        v22 = v21;
        v24 = v23;
        v25 = objc_msgSend(v20, "startIndex");
        if (location <= v25)
          v26 = v25;
        else
          v26 = location;
        v27 = objc_msgSend(v20, "endIndex");
        if (v13 >= v27)
          v28 = v27;
        else
          v28 = v13;
        if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction") >= 2)
          v29 = v24;
        else
          v29 = v22;
        v30 = -[_UIPageIndicatorStore direction](self, "direction");
        if (v30 >= 2)
          v31 = v9;
        else
          v31 = v8;
        if (v30 >= 2)
          v9 = v31 + v29 * (double)(uint64_t)(v28 - v26);
        else
          v8 = v31 + v29 * (double)(uint64_t)(v28 - v26);
        v18 = fmax(v18, v29);
        if ((unint64_t)-[_UIPageIndicatorStore direction](self, "direction") > 1)
          v8 = fmax(v8, v22);
        else
          v9 = fmax(v9, v24);
      }
      if (v16 == ++v19)
      {
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
        if (v16)
          goto LABEL_7;
        break;
      }
    }
  }
  else
  {
    v18 = 0.0;
  }

  v32 = v13 - -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages");
  if (v32 >= 1)
  {
    v33 = -[_UIPageIndicatorStore direction](self, "direction");
    v34 = (double)v32;
    v35 = -[_UIPageIndicatorStore direction](self, "direction");
    -[_UIPageIndicatorStore defaultIndicatorSize](self, "defaultIndicatorSize");
    if (v35 >= 2)
      v36 = v37;
    v38 = v36 * v34;
    if (v33 >= 2)
      v39 = v9;
    else
      v39 = v8;
    v40 = v39 + v38;
    if (v33 >= 2)
      v9 = v40;
    else
      v8 = v40;
  }
  if (v4)
  {
    v41 = -[_UIPageIndicatorStore direction](self, "direction");
    -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
    v43 = v18 + v42;
    if (v41 >= 2)
      v44 = v9;
    else
      v44 = v8;
    v45 = v44 + v43;
    if (v41 >= 2)
      v9 = v45;
    else
      v8 = v45;
  }
  v46 = v8;
  v47 = v9;
  result.height = v47;
  result.width = v46;
  return result;
}

- (int64_t)direction
{
  return self->_direction;
}

- (double)indicatorPositionForContinuousPage:(double)a3 expandedIndicatorPage:(int64_t)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v12;
  double v13;
  uint64_t v14;
  void *v15;
  double v16;
  unint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  double v28;
  double v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[_UIPageIndicatorStore store](self, "store", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v32;
    v12 = a4 >= 0 && (uint64_t)a3 > a4;
    v13 = 0.0;
LABEL_9:
    v14 = 0;
    while (1)
    {
      if (*(_QWORD *)v32 != v10)
        objc_enumerationMutation(v7);
      v15 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * v14);
      v16 = (double)objc_msgSend(v15, "startIndex");
      if (v16 >= a3)
        break;
      v17 = -[_UIPageIndicatorStore direction](self, "direction", v16);
      -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v15);
      if (v17 >= 2)
        v20 = v19;
      else
        v20 = v18;
      v21 = fmin(a3, (double)objc_msgSend(v15, "endIndex"));
      v22 = v21 - (double)objc_msgSend(v15, "startIndex");
      -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
      v13 = v13 + (v20 + v23) * v22;
      if (v12 && objc_msgSend(v15, "validPageWithinBound:", a4))
      {
        if ((objc_msgSend(v15, "validPageWithinBound:", a4 + 1) & 1) != 0
          || a4 + 1 == -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages"))
        {
          -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
          v25 = v24;
        }
        else
        {
          v26 = -[_UIPageIndicatorStore direction](self, "direction");
          -[_UIPageIndicatorStore indicatorSizeForPage:](self, "indicatorSizeForPage:", a4 + 1);
          if (v26 >= 2)
            v25 = v28;
          else
            v25 = v27;
          -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
          v20 = v29;
        }
        v13 = v13 + v25 + v20;
      }
      if (v9 == ++v14)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v9)
          goto LABEL_9;
        break;
      }
    }
  }
  else
  {
    v13 = 0.0;
  }

  return v13;
}

- (_UIPageIndicatorStoreDelegate)delegate
{
  return (_UIPageIndicatorStoreDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (CGSize)contentSizeForNumberOfPages:(int64_t)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  uint64_t v4;
  double *v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v4 = 72;
  if (a4)
    v4 = 208;
  v5 = (double *)((char *)self + v4);
  if ((*((_BYTE *)&self->super.isa + v4) & 1) != 0)
  {
    v6 = (double)a3;
    goto LABEL_7;
  }
  v6 = (double)a3;
  if (v5[1] != (double)a3)
  {
LABEL_7:
    -[_UIPageIndicatorStore _contentSizeForIndicatorsInRange:hasExpandedActiveIndicator:](self, "_contentSizeForIndicatorsInRange:hasExpandedActiveIndicator:", 0, a3);
    *(_BYTE *)v5 &= ~1u;
    v5[1] = v6;
    v5[2] = v7;
    v5[3] = v8;
    goto LABEL_8;
  }
  v7 = v5[2];
  v8 = v5[3];
LABEL_8:
  result.height = v8;
  result.width = v7;
  return result;
}

- (int64_t)numberOfVisibleIndicatorsForStartIndex:(int64_t)a3 fittingLength:(double)a4 hasExpandedActiveIndicator:(BOOL)a5
{
  _BOOL4 v5;
  uint64_t v9;
  char *v10;
  int64_t v11;
  double v12;
  double v13;
  double v14;
  int64_t v15;
  double *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  unint64_t v22;
  int64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v29;
  double v30;

  v5 = a5;
  v9 = 40;
  if (a5)
    v9 = 176;
  v10 = (char *)self + v9;
  if ((*((_BYTE *)&self->super.isa + v9) & 1) == 0 && *((double *)v10 + 1) == a4 && *((_QWORD *)v10 + 2) == a3)
    return *((_QWORD *)v10 + 3);
  -[_UIPageIndicatorStore indicatorSpacing](self, "indicatorSpacing");
  v13 = v12;
  v14 = v12 + a4;
  v30 = v12 + a4;
  v15 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
  v29 = 0x10000000000000;
  if (v5)
    v16 = (double *)&v29;
  else
    v16 = 0;
  -[_UIPageIndicatorStore store](self, "store", v29);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  v11 = 0;
  if (v15 < v18)
  {
    v11 = 0;
    v19 = v15;
    do
    {
      v20 = _calculateVisibleIndicators(self, v19, v16, &v30, v13);
      v11 += v20;
      ++v19;
      -[_UIPageIndicatorStore store](self, "store");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v19 < v22 && v20);
    v14 = v30;
  }
  if (v14 > 0.0 && v15 >= 1)
  {
    v24 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", v15 - 1);
    if ((v24 & 0x8000000000000000) == 0)
    {
      v25 = v24;
      do
      {
        v26 = _calculateVisibleIndicators(self, v25, v16, &v30, v13);
        v11 += v26;
        v27 = v25-- != 0;
      }
      while (v27 && v26);
    }
  }
  *v10 &= ~1u;
  *((double *)v10 + 1) = a4;
  *((_QWORD *)v10 + 2) = a3;
  *((_QWORD *)v10 + 3) = v11;
  return v11;
}

- (double)indicatorSpacing
{
  return self->_indicatorSpacing;
}

- (CGSize)sizeForMaximumContentSizeFittingLength:(double)a3 hasExpandedActiveIndicator:(BOOL)a4
{
  uint64_t v5;
  double *v6;
  double v7;
  double v8;
  CGSize result;

  v5 = 8;
  if (a4)
    v5 = 144;
  v6 = (double *)((char *)self + v5);
  if ((*((_BYTE *)&self->super.isa + v5) & 1) != 0 || v6[1] != a3)
  {
    -[_UIPageIndicatorStore _sizeForMaximumContentSizeFittingLength:hasExpandedActiveIndicator:](self, "_sizeForMaximumContentSizeFittingLength:hasExpandedActiveIndicator:", a3);
    *(_BYTE *)v6 &= ~1u;
    v6[1] = a3;
    v6[2] = v7;
    v6[3] = v8;
  }
  else
  {
    v7 = v6[2];
    v8 = v6[3];
  }
  result.height = v8;
  result.width = v7;
  return result;
}

- (UIImage)preferredActiveImage
{
  return self->_preferredActiveImage;
}

- (id)customActiveIndicatorImageForPage:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
  -[_UIPageIndicatorStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "activeImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)indicatorImageForPage:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[_UIPageIndicatorStore customIndicatorImageForPage:](self, "customIndicatorImageForPage:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[_UIPageIndicatorStore indicatorImage](self, "indicatorImage");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (void)setIndicatorSpacing:(double)a3
{
  if (self->_indicatorSpacing != a3)
  {
    self->_indicatorSpacing = a3;
    -[_UIPageIndicatorStore invalidateLayoutCache](self, "invalidateLayoutCache");
  }
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (_UIPageIndicatorStore)init
{
  _UIPageIndicatorStore *v2;
  _UIPageIndicatorStoreObject *v3;
  _UIPageIndicatorStoreObject *defaultObject;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPageIndicatorStore;
  v2 = -[_UIPageIndicatorStore init](&v6, sel_init);
  if (v2)
  {
    v3 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", 0, 0);
    defaultObject = v2->_defaultObject;
    v2->_defaultObject = v3;

    -[_UIPageIndicatorStore _resetStore](v2, "_resetStore");
    -[_UIPageIndicatorStore invalidateLayoutCache](v2, "invalidateLayoutCache");
  }
  return v2;
}

- (void)invalidateLayoutCache
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)&self->_cache.fittingSize |= 1u;
  *(_BYTE *)&self->_cache.indicatorCount |= 1u;
  *(_BYTE *)&self->_cache.contentSize |= 1u;
  *(_BYTE *)&self->_cache.contentSizeInRange |= 1u;
  *(_BYTE *)&self->_expandedCache.fittingSize |= 1u;
  *(_BYTE *)&self->_expandedCache.indicatorCount |= 1u;
  *(_BYTE *)&self->_expandedCache.contentSize |= 1u;
  *(_BYTE *)&self->_expandedCache.contentSizeInRange |= 1u;
  -[_UIPageIndicatorStoreObject invalidateLayoutInfo](self->_defaultObject, "invalidateLayoutInfo");
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[_UIPageIndicatorStore store](self, "store", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "invalidateLayoutInfo");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)_resetStore
{
  void *v3;
  void *v4;
  void *v5;
  _UIPageIndicatorStoreObject *v6;

  -[_UIPageIndicatorStore store](self, "store");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIPageIndicatorStore store](self, "store");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeAllObjects");
  }
  else
  {
    v4 = (void *)objc_opt_new();
    -[_UIPageIndicatorStore setStore:](self, "setStore:", v4);
  }

  -[_UIPageIndicatorStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", 0, -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages"));
  objc_msgSend(v5, "addObject:", v6);

  -[_UIPageIndicatorStore invalidateLayoutCache](self, "invalidateLayoutCache");
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (void)updateStoreForNumberOfPages:(int64_t)a3
{
  int64_t v5;
  int64_t v6;
  void *v7;
  void *v8;
  void *v9;
  _UIPageIndicatorStoreObject *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;

  v5 = -[_UIPageIndicatorStore numberOfPages](self, "numberOfPages");
  if (v5 != a3)
  {
    v6 = v5;
    -[_UIPageIndicatorStore store](self, "store");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v22 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 >= a3)
    {
      if (v6 > a3)
      {
        v11 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
        -[_UIPageIndicatorStore store](self, "store");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndex:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v13, "setEndIndex:", a3);
        -[_UIPageIndicatorStore store](self, "store");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "count") - 1;

        if (v11 < v15)
        {
          -[_UIPageIndicatorStore store](self, "store");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIPageIndicatorStore store](self, "store");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectsInRange:", v11 + 1, objc_msgSend(v17, "count") + ~v11);

        }
        v18 = objc_msgSend(v13, "startIndex");
        if (v18 >= objc_msgSend(v13, "endIndex"))
        {
          -[_UIPageIndicatorStore store](self, "store");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObject:", v13);

        }
      }
    }
    else
    {
      objc_msgSend(v22, "customImage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        -[_UIPageIndicatorStore store](self, "store");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[_UIPageIndicatorStoreObject initWithStartIndex:endIndex:]([_UIPageIndicatorStoreObject alloc], "initWithStartIndex:endIndex:", v6, a3);
        objc_msgSend(v9, "addObject:", v10);

      }
      else
      {
        objc_msgSend(v22, "setEndIndex:", a3);
      }
    }
    -[_UIPageIndicatorStore store](self, "store");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (!v21)
      -[_UIPageIndicatorStore _resetStore](self, "_resetStore");
    -[_UIPageIndicatorStore invalidateLayoutCache](self, "invalidateLayoutCache");

  }
}

- (void)setDirection:(int64_t)a3
{
  if (self->_direction != a3)
  {
    self->_direction = a3;
    -[_UIPageIndicatorStore invalidateLayoutCache](self, "invalidateLayoutCache");
  }
}

- (void)updateImage:(id)a3 forPage:(int64_t)a4
{
  -[_UIPageIndicatorStore _updateImage:forPage:active:](self, "_updateImage:forPage:active:", a3, a4, 0);
}

- (void)_updateImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5
{
  if (a3)
    -[_UIPageIndicatorStore _insertImage:forPage:active:](self, "_insertImage:forPage:active:", a3, a4, a5);
  else
    -[_UIPageIndicatorStore _removeImageForPage:active:](self, "_removeImageForPage:active:", a4, a5);
  -[_UIPageIndicatorStore validateDataStore](self, "validateDataStore");
  -[_UIPageIndicatorStore invalidateLayoutCache](self, "invalidateLayoutCache");
}

- (void)_insertImage:(id)a3 forPage:(int64_t)a4 active:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = a5;
  v8 = a3;
  v9 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a4);
  -[_UIPageIndicatorStore store](self, "store");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndex:", v9);
  v13 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIPageIndicatorStore store](self, "store");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "splitAtIndex:withImage:active:", a4, v8, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "replaceObjectsInRange:withObjectsFromArray:", v9, 1, v12);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_preferredActiveImage, 0);
  objc_storeStrong((id *)&self->_preferredImage, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaultObject, 0);
  objc_storeStrong((id *)&self->_defaultImage, 0);
}

- (CGSize)indicatorSizeForPage:(int64_t)a3
{
  int64_t v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  v4 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
  -[_UIPageIndicatorStore store](self, "store");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPageIndicatorStore _indicatorSizeForObject:](self, "_indicatorSizeForObject:", v6);
  v8 = v7;
  v10 = v9;

  v11 = v8;
  v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)updateActiveImage:(id)a3 forPage:(int64_t)a4
{
  -[_UIPageIndicatorStore _updateImage:forPage:active:](self, "_updateImage:forPage:active:", a3, a4, 1);
}

- (void)_removeImageForPage:(int64_t)a3 active:(BOOL)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  id v18;

  v6 = -[_UIPageIndicatorStore objectIndexForPage:](self, "objectIndexForPage:", a3);
  -[_UIPageIndicatorStore store](self, "store");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", v6);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  if (a4)
    objc_msgSend(v18, "setActiveImage:", 0);
  else
    objc_msgSend(v18, "setCustomImage:", 0);
  if ((objc_msgSend(v18, "hasImage") & 1) == 0)
  {
    -[_UIPageIndicatorStore store](self, "store");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6 >= (unint64_t)(objc_msgSend(v8, "count") - 1))
    {

      v10 = 0;
      v11 = 0;
      if (v6 < 1)
        goto LABEL_25;
    }
    else
    {
      -[_UIPageIndicatorStore store](self, "store");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectAtIndex:", v6 + 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6 <= 0)
      {
        if (!v10)
        {
          v11 = 0;
          goto LABEL_25;
        }
        v11 = 0;
        if ((objc_msgSend(v10, "hasImage") & 1) != 0)
          goto LABEL_25;
        goto LABEL_21;
      }
    }
    -[_UIPageIndicatorStore store](self, "store");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndex:", v6 - 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v13 = objc_msgSend(v10, "hasImage");
      v14 = v13;
      if (v11)
      {
        v15 = objc_msgSend(v11, "hasImage");
        if (((v14 | v15) & 1) == 0)
        {
          objc_msgSend(v11, "setEndIndex:", objc_msgSend(v10, "endIndex"));
          -[_UIPageIndicatorStore store](self, "store");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "removeObjectAtIndex:", v6 + 1);

          goto LABEL_24;
        }
        if ((v14 & 1) != 0)
        {
          if ((v15 & 1) != 0)
            goto LABEL_25;
          goto LABEL_23;
        }
LABEL_21:
        objc_msgSend(v10, "setStartIndex:", objc_msgSend(v18, "startIndex"));
LABEL_24:
        -[_UIPageIndicatorStore store](self, "store");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeObjectAtIndex:", v6);

        goto LABEL_25;
      }
      if ((v13 & 1) == 0)
        goto LABEL_21;
    }
    else
    {
      if (v11 && (objc_msgSend(v11, "hasImage") & 1) == 0)
      {
LABEL_23:
        objc_msgSend(v11, "setEndIndex:", objc_msgSend(v18, "endIndex"));
        goto LABEL_24;
      }
      v10 = 0;
    }
LABEL_25:

  }
}

- (void)setPreferredImage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredImage, a3);
}

- (void)setPreferredActiveImage:(id)a3
{
  objc_storeStrong((id *)&self->_preferredActiveImage, a3);
}

@end
