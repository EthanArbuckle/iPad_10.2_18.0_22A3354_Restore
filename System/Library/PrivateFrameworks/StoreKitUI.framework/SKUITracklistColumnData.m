@implementation SKUITracklistColumnData

- (id)_initSKUITracklistColumnData
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id result;
  objc_super v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v3)
        -[SKUITracklistColumnData _initSKUITracklistColumnData].cold.1(v3, v4, v5, v6, v7, v8, v9, v10);
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUITracklistColumnData;
  result = -[SKUITracklistColumnData init](&v12, sel_init);
  if (result)
  {
    *((_QWORD *)result + 4) = 0x402E000000000000;
    *((_OWORD *)result + 1) = xmmword_1BBED12B0;
  }
  return result;
}

- (SKUITracklistColumnData)initWithRepresentativeTrack:(id)a3
{
  id v4;
  SKUITracklistColumnData *v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  NSArray *columns;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v5 = -[SKUITracklistColumnData _initSKUITracklistColumnData](self, "_initSKUITracklistColumnData");
  if (v5)
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v18 = 0;
    v19 = &v18;
    v20 = 0x3032000000;
    v21 = __Block_byref_object_copy__19;
    v22 = __Block_byref_object_dispose__19;
    v23 = 0;
    objc_msgSend(v4, "flattenedChildren");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = MEMORY[0x1E0C809B0];
    v13 = 3221225472;
    v14 = __55__SKUITracklistColumnData_initWithRepresentativeTrack___block_invoke;
    v15 = &unk_1E73A3048;
    v17 = &v18;
    v8 = v6;
    v16 = v8;
    objc_msgSend(v7, "enumerateObjectsUsingBlock:", &v12);
    if (v19[5])
      objc_msgSend(v8, "addObject:", v12, v13, v14, v15);
    v9 = objc_msgSend(v8, "copy", v12, v13, v14, v15);
    columns = v5->_columns;
    v5->_columns = (NSArray *)v9;

    _Block_object_dispose(&v18, 8);
  }

  return v5;
}

void __55__SKUITracklistColumnData_initWithRepresentativeTrack___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  SKUITracklistColumn *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;

  v17 = a2;
  v3 = SKUITrackListColumnIdentifierForViewElement(v17);
  v4 = v3;
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v5 + 8);
  v7 = *(_QWORD *)(v6 + 40);
  if (v7)
  {
    if (v3 != 2)
    {
      v8 = objc_msgSend(*(id *)(v6 + 40), "columnIdentifier");
      v5 = *(_QWORD *)(a1 + 40);
      if (v8 == v4)
        goto LABEL_6;
      v7 = *(_QWORD *)(*(_QWORD *)(v5 + 8) + 40);
    }
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;

    v5 = *(_QWORD *)(a1 + 40);
  }
LABEL_6:
  if (!*(_QWORD *)(*(_QWORD *)(v5 + 8) + 40))
  {
    v11 = objc_alloc_init(SKUITracklistColumn);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setColumnIdentifier:", v4);
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setShowsPreviewControl:", objc_msgSend(v17, "elementType") == 90);
    v15 = v4;
    v14 = 1;
    v16 = 1;
    switch(v15)
    {
      case 0:
      case 5:
        goto LABEL_11;
      case 1:
        v16 = 0;
        v14 = 2;
        goto LABEL_11;
      case 2:
      case 3:
        v14 = 2;
        v16 = 2;
        goto LABEL_11;
      case 4:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setSizesToFit:", 1);
        v14 = 0;
        v16 = 0;
LABEL_11:
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setContentAlignment:", v14);
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHeaderAlignment:", v16);
        break;
      default:
        break;
    }
  }

}

- (void)adjustColumnsToFitWidth:(double)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  uint64_t i;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  float v17;
  double leftEdgeInset;
  double rightEdgeInset;
  NSUInteger v20;
  double interColumnSpacing;
  uint64_t v22;
  uint64_t v23;
  float v24;
  double v25;
  uint64_t v26;
  uint64_t j;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_columns;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (!v6)
  {
LABEL_25:

    return;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v34;
  v10 = 0.0;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v34 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
      if (objc_msgSend(v12, "sizesToFit"))
      {
        ++v8;
      }
      else
      {
        objc_msgSend(v12, "preferredWidth");
        v14 = v13;
        objc_msgSend(v12, "maximumWidthFraction");
        if (v15 > 0.00000011920929)
        {
          v16 = v15 * a3;
          if (v14 < v16)
            v16 = v14;
          v17 = v16;
          v14 = floorf(v17);
        }
        objc_msgSend(v12, "setWidth:", v14);
        v10 = v10 + v14;
      }
    }
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  }
  while (v7);

  if (v8 >= 1)
  {
    leftEdgeInset = self->_leftEdgeInset;
    rightEdgeInset = self->_rightEdgeInset;
    v20 = -[NSArray count](self->_columns, "count");
    interColumnSpacing = self->_interColumnSpacing;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v5 = self->_columns;
    v22 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
    if (v22)
    {
      v23 = v22;
      v24 = (a3 - leftEdgeInset - rightEdgeInset - (double)(v20 - 1) * interColumnSpacing - v10) / (double)v8;
      v25 = floorf(v24);
      v26 = *(_QWORD *)v30;
      do
      {
        for (j = 0; j != v23; ++j)
        {
          if (*(_QWORD *)v30 != v26)
            objc_enumerationMutation(v5);
          v28 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * j);
          if (objc_msgSend(v28, "sizesToFit", (_QWORD)v29))
            objc_msgSend(v28, "setWidth:", v25);
        }
        v23 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
      }
      while (v23);
    }
    goto LABEL_25;
  }
}

- (id)columnForIdentifier:(int64_t)a3
{
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_columns;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "columnIdentifier", (_QWORD)v12) == a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)enumerateColumnsForHeader:(id)a3 usingBlock:(id)a4
{
  id v6;
  NSArray *columns;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;

  v6 = a4;
  columns = self->_columns;
  v8 = a3;
  v9 = -[NSArray count](columns, "count");
  objc_msgSend(v8, "titleLabels");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __64__SKUITracklistColumnData_enumerateColumnsForHeader_usingBlock___block_invoke;
  v12[3] = &unk_1E73A3070;
  v13 = v6;
  v14 = v9;
  v12[4] = self;
  v10 = v6;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v12);

}

void __64__SKUITracklistColumnData_enumerateColumnsForHeader_usingBlock___block_invoke(_QWORD *a1, void *a2, unint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v5 = a2;
  if (a1[6] > a3)
  {
    v10 = v5;
    objc_msgSend(v5, "text");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "string");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    v5 = v10;
    if (v8)
    {
      objc_msgSend(*(id *)(a1[4] + 8), "objectAtIndex:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      (*(void (**)(void))(a1[5] + 16))();

      v5 = v10;
    }
  }

}

- (void)enumerateColumnsForTrack:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSArray *columns;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  uint64_t v17;
  _QWORD v18[4];

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "flattenedChildren");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v18[3] = 0;
  v9 = objc_msgSend(v8, "count");
  columns = self->_columns;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __63__SKUITracklistColumnData_enumerateColumnsForTrack_usingBlock___block_invoke;
  v13[3] = &unk_1E73A3098;
  v16 = v18;
  v17 = v9;
  v11 = v8;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  -[NSArray enumerateObjectsUsingBlock:](columns, "enumerateObjectsUsingBlock:", v13);

  _Block_object_dispose(v18, 8);
}

void __63__SKUITracklistColumnData_enumerateColumnsForTrack_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a2;
  v3 = (void *)MEMORY[0x1BCCE6C7C]();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  if (v5 < *(_QWORD *)(a1 + 56))
  {
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "elementType") == 90)
      {
        objc_msgSend(v6, "flattenedChildren");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "firstObject");
        v8 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v8;
      }
      v9 = SKUITrackListColumnIdentifierForViewElement(v6);
      if (v9 != objc_msgSend(v10, "columnIdentifier"))
        break;
      objc_msgSend(v4, "addObject:", v6);

      if (v9 != 2 && ++v5 < *(_QWORD *)(a1 + 56))
        continue;
      goto LABEL_9;
    }

  }
LABEL_9:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v4, "count");

  objc_autoreleasePoolPop(v3);
}

- (id)viewElementsForTrack:(id)a3 columnIndex:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v6 = a3;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__19;
  v14 = __Block_byref_object_dispose__19;
  v15 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60__SKUITracklistColumnData_viewElementsForTrack_columnIndex___block_invoke;
  v9[3] = &unk_1E73A30C0;
  v9[4] = &v10;
  v9[5] = a4;
  -[SKUITracklistColumnData enumerateColumnsForTrack:usingBlock:](self, "enumerateColumnsForTrack:usingBlock:", v6, v9);
  v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

void __60__SKUITracklistColumnData_viewElementsForTrack_columnIndex___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v7;
  uint64_t v8;
  void *v9;

  if (*(_QWORD *)(a1 + 40) == a4)
  {
    v7 = objc_msgSend(a3, "copy");
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    *a5 = 1;
  }
}

- (NSArray)columns
{
  return self->_columns;
}

- (void)setColumns:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (double)interColumnSpacing
{
  return self->_interColumnSpacing;
}

- (void)setInterColumnSpacing:(double)a3
{
  self->_interColumnSpacing = a3;
}

- (double)leftEdgeInset
{
  return self->_leftEdgeInset;
}

- (void)setLeftEdgeInset:(double)a3
{
  self->_leftEdgeInset = a3;
}

- (double)rightEdgeInset
{
  return self->_rightEdgeInset;
}

- (void)setRightEdgeInset:(double)a3
{
  self->_rightEdgeInset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)_initSKUITracklistColumnData
{
  OUTLINED_FUNCTION_1();
}

@end
