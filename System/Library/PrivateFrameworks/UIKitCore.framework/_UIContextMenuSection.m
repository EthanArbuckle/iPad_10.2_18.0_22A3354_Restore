@implementation _UIContextMenuSection

+ (id)sectionWithMenu:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t (**v13)(_QWORD, _QWORD);
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  int64x2_t v17;
  void *v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  BOOL v27;
  void *v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t i;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v47;
  BOOL v48;
  int64x2_t v49;
  uint64_t v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(v4 + 8);
  *(_QWORD *)(v4 + 8) = v5;

  if (objc_msgSend(v3, "_omitsInlineTitle"))
  {
    v7 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = &stru_1E16EDF20;
  }
  else
  {
    objc_msgSend(v3, "title");
    v8 = objc_claimAutoreleasedReturnValue();
    v7 = *(void **)(v4 + 24);
    *(_QWORD *)(v4 + 24) = v8;
  }

  +[UIDevice currentDevice](UIDevice, "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  _UIContextMenuGetPlatformMetrics(objc_msgSend(v9, "userInterfaceIdiom"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v3, "_resolvedElementSize");
  v51 = v10;
  if ((objc_msgSend(v3, "options") & 0x80) != 0)
  {
    v50 = v4;
    if (objc_msgSend(v10, "supportsLargePaletteMenus"))
      v32 = v11;
    else
      v32 = 0;
    v47 = _UIContextMenuCellSizeForElementSize(v32);
    objc_msgSend(v10, "gradientMaskingConfiguration");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = v33 != 0;

    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    objc_msgSend(v3, "children");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    if (v35)
    {
      v36 = v35;
      v37 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v36; ++i)
        {
          if (*(_QWORD *)v53 != v37)
            objc_enumerationMutation(v34);
          v39 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          objc_msgSend(v39, "image");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v40, "_isSymbolImage") & 1) != 0)
          {
            objc_msgSend(v39, "image");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "symbolConfiguration");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "_colors");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v44 = objc_msgSend(v43, "count");

            if (v44)
            {
              *(_BYTE *)(v50 + 19) = 1;
              goto LABEL_38;
            }
          }
          else
          {

          }
        }
        v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
      }
      while (v36);
    }
LABEL_38:

    v27 = 0;
    v17 = vdupq_n_s64(1uLL);
    v17.i64[0] = v47;
    v4 = v50;
    v31 = v48;
  }
  else
  {
    objc_msgSend(v10, "overrideElementSize");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v10, "overrideElementSize");
      v13 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      v11 = v13[2](v13, v11);

    }
    v14 = _UIContextMenuCellSizeForElementSize(v11);
    v15 = 3;
    if (v14 != 1)
      v15 = 0;
    if (v14)
      v16 = v15;
    else
      v16 = 4;
    v17 = (int64x2_t)(unint64_t)v14;
    if (v16)
    {
      v49 = (int64x2_t)(unint64_t)v14;
      objc_msgSend(v3, "children");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");

      if (v16 >= v19)
        v20 = v19;
      else
        v20 = v16;
      if (v20)
      {
        v21 = v4;
        v22 = 0;
        do
        {
          objc_msgSend(v3, "children");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "objectAtIndexedSubscript:", v22);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v24, "title");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "length");
          v27 = v26 != 0;

          if (v26)
            break;
          ++v22;
          objc_msgSend(v3, "children");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = objc_msgSend(v28, "count");

          v30 = v16 >= v29 ? v29 : v16;
        }
        while (v30 > v22);
        v31 = 1;
        v4 = v21;
      }
      else
      {
        v27 = 0;
        v31 = 1;
      }
      v17 = v49;
    }
    else
    {
      v27 = 0;
      v31 = 1;
    }
  }
  *(int64x2_t *)(v4 + 32) = v17;
  *(_BYTE *)(v4 + 18) = v31;
  *(_BYTE *)(v4 + 16) = v27;
  objc_msgSend(v3, "displayPreferences");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)(v4 + 48) = objc_msgSend(v45, "maximumNumberOfTitleLines");

  return (id)v4;
}

- (int64_t)cellSizeGivenTraits:(id)a3
{
  id v4;
  int64_t v5;
  int64_t v6;
  void *v8;
  const char *v9;
  int IsAccessibilityContentSizeCategory;

  v4 = a3;
  v5 = -[_UIContextMenuSection preferredCellSize](self, "preferredCellSize");
  v6 = v5;
  if (self->_overridesCellSizeForLargeText && v5 == 1)
  {
    objc_msgSend(v4, "preferredContentSizeCategory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IsAccessibilityContentSizeCategory = _UIContentSizeCategoryIsAccessibilityContentSizeCategory(v8, v9);

    if (IsAccessibilityContentSizeCategory)
      v6 = 2;
    else
      v6 = 1;
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  char v5;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = -[NSUUID isEqual:](self->_identifier, "isEqual:", v4[1]);
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return -[NSUUID hash](self->_identifier, "hash");
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (BOOL)wantsSectionSeparator
{
  return self->_wantsSectionSeparator;
}

- (void)setWantsSectionSeparator:(BOOL)a3
{
  self->_wantsSectionSeparator = a3;
}

- (NSString)title
{
  return self->_title;
}

- (int64_t)preferredCellSize
{
  return self->_preferredCellSize;
}

- (int64_t)layout
{
  return self->_layout;
}

- (unint64_t)actionLineLimit
{
  return self->_actionLineLimit;
}

- (BOOL)isMultiColorPalette
{
  return self->_isMultiColorPalette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
