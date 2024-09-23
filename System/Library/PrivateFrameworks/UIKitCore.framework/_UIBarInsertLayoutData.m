@implementation _UIBarInsertLayoutData

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (double)transitionProgress
{
  double v1;
  double v2;
  double v3;
  double result;
  double v5;

  if (!a1)
    return 0.0;
  v1 = *(double *)(a1 + 64);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 40) - v2;
  result = 1.0;
  if (v1 < v3)
  {
    result = 0.0;
    v5 = 0.0;
    if ((*(_BYTE *)(a1 + 8) & 1) == 0)
      v5 = *(double *)(a1 + 32);
    if (v1 > v5)
      return (v1 - v2) / v3;
  }
  return result;
}

+ (void)assignVerticalOriginsToItemsInLayouts:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    v7 = 0.0;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8);
        *(double *)(v9 + 16) = v7;
        *(_BYTE *)(v9 + 8) |= 0x10u;
        v7 = v7 + *(double *)(v9 + 64);
        ++v8;
      }
      while (v5 != v8);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

+ (void)updateLayoutParameters:(void *)a3 overflowLayout:(void *)a4 forAvailableHeight:
{
  id v6;
  double *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t i;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t m;
  uint64_t v21;
  double v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t n;
  uint64_t v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  _QWORD *v35;
  uint64_t v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_self();
  v64 = 0u;
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v65;
    v12 = 0.0;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v65 != v11)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
        if ((*(_BYTE *)(v15 + 8) & 1) == 0)
          v13 = v13 + *(double *)(v15 + 32);
        v12 = v12 + *(double *)(v15 + 40);
        *(_BYTE *)(v15 + 8) &= ~0x10u;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
    }
    while (v10);
  }
  else
  {
    v12 = 0.0;
    v13 = 0.0;
  }

  if (v12 <= a1)
  {
    v62 = 0uLL;
    v63 = 0uLL;
    v60 = 0uLL;
    v61 = 0uLL;
    v30 = v8;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v61;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v61 != v33)
            objc_enumerationMutation(v30);
          v35 = *(_QWORD **)(*((_QWORD *)&v60 + 1) + 8 * j);
          v36 = v35[5];
          v35[7] = v36;
          v35[8] = v36;
        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v60, v71, 16);
      }
      while (v32);
    }

    if (v7)
    {
      v37 = a1 - v12 + v7[5];
      v7[7] = v37;
      v7[8] = v37;
    }
    goto LABEL_63;
  }
  if (v13 <= a1)
  {
    v58 = 0uLL;
    v59 = 0uLL;
    v56 = 0uLL;
    v57 = 0uLL;
    v23 = v8;
    v38 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
    if (!v38)
      goto LABEL_62;
    v39 = v38;
    v40 = a1 - v13;
    v41 = *(_QWORD *)v57;
    while (1)
    {
      for (k = 0; k != v39; ++k)
      {
        if (*(_QWORD *)v57 != v41)
          objc_enumerationMutation(v23);
        v43 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * k);
        if (v40 <= 0.0)
        {
          v46 = *(double *)(v43 + 32);
          if ((*(_BYTE *)(v43 + 8) & 1) == 0)
            goto LABEL_55;
          *(double *)(v43 + 56) = v46;
          *(_QWORD *)(v43 + 64) = 0;
        }
        else
        {
          if ((*(_BYTE *)(v43 + 8) & 1) == 0)
          {
            v44 = *(double *)(v43 + 32);
            v45 = *(double *)(v43 + 40) - v44;
            if (v45 >= v40)
              v45 = v40;
            v40 = v40 - v45;
            v46 = v44 + v45;
LABEL_55:
            *(double *)(v43 + 56) = v46;
            *(double *)(v43 + 64) = v46;
            continue;
          }
          v47 = *(double *)(v43 + 40);
          if (v47 >= v40)
            v47 = v40;
          v40 = v40 - v47;
          *(_QWORD *)(v43 + 56) = *(_QWORD *)(v43 + 32);
          *(double *)(v43 + 64) = v47;
        }
      }
      v39 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v56, v70, 16);
      if (!v39)
        goto LABEL_62;
    }
  }
  v54 = 0uLL;
  v55 = 0uLL;
  v52 = 0uLL;
  v53 = 0uLL;
  v16 = v8;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v53;
    do
    {
      for (m = 0; m != v18; ++m)
      {
        if (*(_QWORD *)v53 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * m);
        if ((*(_BYTE *)(v21 + 8) & 1) == 0)
        {
          v22 = *(double *)(v21 + 32);
          *(double *)(v21 + 56) = v22;
          *(double *)(v21 + 64) = v22;
          a1 = a1 - v22;
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v52, v69, 16);
    }
    while (v18);
  }

  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v23 = v16;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v49;
    do
    {
      for (n = 0; n != v25; ++n)
      {
        if (*(_QWORD *)v49 != v26)
          objc_enumerationMutation(v23);
        v28 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * n);
        if ((*(_BYTE *)(v28 + 8) & 1) != 0)
        {
          v29 = *(double *)(v28 + 32);
          *(double *)(v28 + 56) = v29;
          if (a1 >= v29)
          {
            *(double *)(v28 + 64) = v29;
            a1 = a1 - v29;
          }
          else
          {
            *(double *)(v28 + 64) = a1;
            a1 = 0.0;
          }
        }
      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v48, v68, 16);
    }
    while (v25);
  }
LABEL_62:

LABEL_63:
}

+ (double)calculateLayoutHeights:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  double v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v17;
    v7 = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v6)
          objc_enumerationMutation(v3);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10);
        if (v11)
        {
          v12 = *(_BYTE *)(v11 + 8);
          v13 = 0.0;
          if ((v12 & 1) == 0)
            v13 = *(double *)(v11 + 32);
        }
        else
        {
          v12 = MEMORY[8];
          v13 = 0.0;
        }
        v9 = v9 + v13;
        if ((v12 & 2) != 0)
          v13 = *(double *)(v11 + 40);
        v8 = v8 + v13;
        v7 = v7 + *(double *)(v11 + 40);
        ++v10;
      }
      while (v5 != v10);
      v14 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v5 = v14;
    }
    while (v14);
  }
  else
  {
    v9 = 0.0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  $B130A0C233D57C7B44158004461CDAA8 *v4;
  uint64_t v5;
  void *v6;
  $B130A0C233D57C7B44158004461CDAA8 flags;

  v4 = ($B130A0C233D57C7B44158004461CDAA8 *)objc_alloc_init((Class)objc_opt_class());
  v5 = -[NSString copy](self->_identifier, "copy");
  v6 = *(void **)&v4[6];
  *(_QWORD *)&v4[6] = v5;

  *(double *)&v4[8] = self->_minimumHeight;
  *(double *)&v4[10] = self->_preferredHeight;
  *(double *)&v4[14] = self->_assignedHeight;
  *(double *)&v4[16] = self->_collapsingHeight;
  *(_QWORD *)&v4[4] = 0;
  *(_QWORD *)&v4[18] = self->_priority;
  *(_QWORD *)&v4[20] = self->_order;
  flags = self->_flags;
  v4[2] = flags;
  *(_BYTE *)&v4[2] = *(_BYTE *)&flags & 0xE7;
  return v4;
}

- (_UIBarInsertLayoutData)init
{
  _UIBarInsertLayoutData *v2;
  _UIBarInsertLayoutData *v3;
  NSString *identifier;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIBarInsertLayoutData;
  v2 = -[_UIBarInsertLayoutData init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)&stru_1E16EDF20;

  }
  return v3;
}

- (double)verticalOrigin
{
  unint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0.0;
  if ((*(_BYTE *)(a1 + 8) & 0x10) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      __UIFaultDebugAssertLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        v6 = 138412290;
        v7 = a1;
        _os_log_fault_impl(&dword_185066000, v5, OS_LOG_TYPE_FAULT, "Accessing invalid yOrigin on %@", (uint8_t *)&v6, 0xCu);
      }

    }
    else
    {
      v3 = verticalOrigin___s_category;
      if (!verticalOrigin___s_category)
      {
        v3 = __UILogCategoryGetNode("Assert", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
        atomic_store(v3, (unint64_t *)&verticalOrigin___s_category);
      }
      v4 = *(NSObject **)(v3 + 8);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v6 = 138412290;
        v7 = a1;
        _os_log_impl(&dword_185066000, v4, OS_LOG_TYPE_ERROR, "Accessing invalid yOrigin on %@", (uint8_t *)&v6, 0xCu);
      }
    }
  }
  return *(double *)(a1 + 16);
}

+ (id)calculateRestingHeightsForLayouts:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  double v8;
  uint64_t i;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  double v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  objc_opt_self();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = v2;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (!v4)
  {
    v6 = 0;
    v8 = 0.0;
    goto LABEL_15;
  }
  v5 = v4;
  v6 = 0;
  v7 = *(_QWORD *)v29;
  v8 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v29 != v7)
        objc_enumerationMutation(v3);
      v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
      if ((*(_BYTE *)(v10 + 8) & 1) != 0)
        goto LABEL_9;
      v11 = *(double *)(v10 + 32);
      v12 = *(double *)(v10 + 40);
      if (v11 < v12)
      {
        v8 = v8 + v11;
LABEL_9:
        v6 = 1;
        continue;
      }
      v8 = v8 + v12;
    }
    v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  }
  while (v5);
LABEL_15:

  v13 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObject:", v14);

  if ((v6 & 1) != 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = v3;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j);
          v21 = *(double *)(v20 + 40);
          if ((*(_BYTE *)(v20 + 8) & 1) == 0)
            v21 = v21 - *(double *)(v20 + 32);
          if (v21 > 0.0)
          {
            v8 = v8 + v21;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8, (_QWORD)v24);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "addObject:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

  }
  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  char flags;
  const __CFString *v6;
  const __CFString *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_UIBarInsertLayoutData;
  -[_UIBarInsertLayoutData description](&v9, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  if (-[NSString length](self->_identifier, "length"))
    objc_msgSend(v4, "appendFormat:", CFSTR(" '%@'"), self->_identifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(" minimumHeight=%f preferredHeight=%f assignedHeight=%f"), *(_QWORD *)&self->_minimumHeight, *(_QWORD *)&self->_preferredHeight, *(_QWORD *)&self->_assignedHeight);
  if ((*(_BYTE *)&self->_flags & 1) != 0)
  {
    if (self->_collapsingHeight >= self->_assignedHeight)
      objc_msgSend(v4, "appendString:", CFSTR(" collapsible"));
    else
      objc_msgSend(v4, "appendFormat:", CFSTR(" collapsingHeight=%f"), *(_QWORD *)&self->_collapsingHeight);
  }
  flags = (char)self->_flags;
  if ((flags & 2) != 0 && ((*(_BYTE *)&self->_flags & 1) != 0 || self->_minimumHeight < self->_preferredHeight))
  {
    objc_msgSend(v4, "appendString:", CFSTR(" prefersExpanded"));
    flags = (char)self->_flags;
  }
  if ((flags & 0x10) != 0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" verticalOrigin=%f"), *(_QWORD *)&self->_verticalOrigin);
  if (self->_bottomInsetForTransitionProgress > 0.0)
    objc_msgSend(v4, "appendFormat:", CFSTR(" bottomInsetForTransitionProgress=%f"), *(_QWORD *)&self->_bottomInsetForTransitionProgress);
  v6 = CFSTR(" ignoredForCollapsingBehaviors");
  if ((*(_BYTE *)&self->_flags & 4) == 0)
    v6 = &stru_1E16EDF20;
  if ((*(_BYTE *)&self->_flags & 8) != 0)
    v7 = &stru_1E16EDF20;
  else
    v7 = CFSTR(" inactive");
  objc_msgSend(v4, "appendFormat:", CFSTR(" priority=%li order=%li%@%@"), self->_priority, self->_order, v6, v7);
  return v4;
}

+ (id)layoutPriorToItemWithOrder:(void *)a3 inLayouts:
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_self();
  if (!objc_msgSend(v4, "count"))
    goto LABEL_15;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (!v6)
  {

LABEL_15:
    v15 = 0;
    goto LABEL_16;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v18;
  v10 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_4:
  v11 = 0;
  v12 = v8;
  v13 = v10;
  v8 += v7;
  v10 = v8 - 1;
  while (1)
  {
    if (*(_QWORD *)v18 != v9)
      objc_enumerationMutation(v5);
    v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
    if (v14)
      v14 = *(_QWORD *)(v14 + 80);
    if (v14 <= a2)
      break;
    v13 = v12++;
    if (v7 == ++v11)
    {
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v13 = v8 - 1;
      if (v7)
        goto LABEL_4;
      break;
    }
  }

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_15;
  objc_msgSend(v5, "objectAtIndexedSubscript:", v13, (_QWORD)v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v15;
}

@end
