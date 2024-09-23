@implementation SKUIHorizontalLockupLayout

- (SKUIHorizontalLockupLayout)initWithLockup:(id)a3 context:(id)a4
{
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  uint64_t v26;
  __int128 v32;
  NSMapTable *v33;
  uint64_t v34;
  void *v35;
  uint64_t i;
  void *v37;
  _QWORD v39[4];
  id v40;
  id v41;
  NSMapTable *v42;
  _QWORD *v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  uint64_t v47;
  char v48;
  char v49;
  _QWORD v50[4];
  _QWORD v51[3];
  char v52;
  _QWORD v53[3];
  char v54;
  _QWORD v55[4];
  objc_super v56;
  _OWORD v57[3];
  uint64_t v58;
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        -[SKUIHorizontalLockupLayout initWithLockup:context:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v56.receiver = self;
  v56.super_class = (Class)SKUIHorizontalLockupLayout;
  v16 = -[SKUIHorizontalLockupLayout init](&v56, sel_init);
  if (v16)
  {
    v17 = objc_msgSend(v6, "containsElementGroups");
    v57[0] = xmmword_1BBED22C0;
    v57[1] = xmmword_1BBED22D0;
    v57[2] = xmmword_1BBED22E0;
    v58 = 6;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3748]), "initWithKeyOptions:valueOptions:capacity:", 1282, 0, 7);
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x2020000000;
    v55[3] = 0;
    v53[0] = 0;
    v53[1] = v53;
    v53[2] = 0x2020000000;
    v54 = 0;
    v51[0] = 0;
    v51[1] = v51;
    v51[2] = 0x2020000000;
    v52 = 0;
    v50[0] = 0;
    v50[1] = v50;
    v50[2] = 0x2020000000;
    v19 = 3;
    if (v17)
      v19 = 4;
    v50[3] = v19;
    if (objc_msgSend(v6, "lockupViewType") == 6)
      v20 = 0.0;
    else
      v20 = 10.0;
    v49 = 0;
    objc_msgSend(v6, "firstChildForElementType:", 49);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "style");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementMarginForStyle(v22, &v49);
    v24 = v23;

    if (v49)
      v25 = v24;
    else
      v25 = v20;
    *((double *)v16 + 2) = v25;
    if (objc_msgSend(v6, "lockupViewType") == 7)
    {
      *(_OWORD *)(v16 + 24) = xmmword_1BBED22F0;
      *(_OWORD *)(v16 + 40) = xmmword_1BBED2300;
      v26 = 0x4052000000000000;
    }
    else
    {
      if (objc_msgSend(v6, "lockupViewType") == 6)
      {
        __asm { FMOV            V0.2D, #15.0 }
        *(_OWORD *)(v16 + 24) = _Q0;
        *(_OWORD *)(v16 + 40) = _Q0;
      }
      else
      {
        v32 = *(_OWORD *)(MEMORY[0x1E0DC49E8] + 16);
        *(_OWORD *)(v16 + 24) = *MEMORY[0x1E0DC49E8];
        *(_OWORD *)(v16 + 40) = v32;
      }
      v26 = 0;
    }
    *((_QWORD *)v16 + 7) = v26;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __53__SKUIHorizontalLockupLayout_initWithLockup_context___block_invoke;
    v39[3] = &unk_1E73A6B40;
    v43 = v50;
    v48 = v17 ^ 1;
    v40 = v6;
    v44 = v53;
    v45 = v51;
    v41 = v7;
    v46 = v55;
    v47 = 6;
    v33 = v18;
    v42 = v33;
    objc_msgSend(v40, "enumerateChildrenUsingBlock:", v39);
    v34 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[NSMapTable count](v33, "count"));
    v35 = (void *)*((_QWORD *)v16 + 1);
    *((_QWORD *)v16 + 1) = v34;

    for (i = 0; i != 56; i += 8)
    {
      NSMapGet(v33, (const void *)(*(_QWORD *)((char *)v57 + i) + 1));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v37)
        objc_msgSend(*((id *)v16 + 1), "addObject:", v37);

    }
    _Block_object_dispose(v50, 8);
    _Block_object_dispose(v51, 8);
    _Block_object_dispose(v53, 8);
    _Block_object_dispose(v55, 8);

  }
  return (SKUIHorizontalLockupLayout *)v16;
}

void __53__SKUIHorizontalLockupLayout_initWithLockup_context___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  SKUIHorizontalLockupColumn *v22;
  id v23;
  _OWORD v24[3];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  v23 = v3;
  v5 = v23;
  if (objc_msgSend(v23, "elementType") == 90)
  {
    objc_msgSend(v23, "flattenedChildren");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = v23;
    if (v7)
    {
      v5 = v7;

    }
  }
  v8 = objc_msgSend(v5, "elementType");
  if (v8 <= 76)
  {
    if (v8 > 31)
    {
      switch(v8)
      {
        case '0':
          goto LABEL_52;
        case '1':
        case '3':
          goto LABEL_36;
        case '2':
          if (!*(_BYTE *)(a1 + 96))
            goto LABEL_52;
          objc_msgSend(v5, "style");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "columnType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqualToString:", CFSTR("buttons"));

          if (!v11)
            goto LABEL_52;
          goto LABEL_29;
        default:
          if (v8 == 32 || v8 == 62)
            goto LABEL_52;
          break;
      }
      goto LABEL_55;
    }
    if (v8 <= 11)
    {
      if (v8 == 7)
      {
        objc_msgSend(v23, "firstChildForElementType:", 49);
        v20 = objc_claimAutoreleasedReturnValue();
        if (!v20)
          goto LABEL_55;
        v21 = (void *)v20;

        v4 = 5;
        v5 = v21;
      }
      else if (v8 != 8)
      {
        goto LABEL_55;
      }
      goto LABEL_52;
    }
    if ((unint64_t)(v8 - 12) >= 2)
    {
      if (v8 != 29)
        goto LABEL_55;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_52;
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v4 = 2;
      goto LABEL_30;
    }
LABEL_28:
    if (!*(_BYTE *)(a1 + 96))
    {
LABEL_52:
      NSMapGet(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1));
      v22 = (SKUIHorizontalLockupColumn *)objc_claimAutoreleasedReturnValue();
      if (!v22)
      {
        v22 = objc_alloc_init(SKUIHorizontalLockupColumn);
        -[SKUIHorizontalLockupColumn setIdentifier:](v22, "setIdentifier:", v4);
        NSMapInsert(*(NSMapTable **)(a1 + 48), (const void *)(v4 + 1), v22);
      }
      -[SKUIHorizontalLockupColumn _addChildViewElement:](v22, "_addChildViewElement:", v5);

      goto LABEL_55;
    }
LABEL_29:
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = 1;
LABEL_30:
    *(_QWORD *)(v15 + 24) = v4;
    goto LABEL_52;
  }
  if (v8 > 134)
  {
    switch(v8)
    {
      case 135:
      case 144:
        goto LABEL_52;
      case 136:
      case 137:
      case 139:
      case 140:
      case 142:
      case 143:
        goto LABEL_55;
      case 138:
        if (objc_msgSend(*(id *)(a1 + 32), "lockupViewType") != 7)
          goto LABEL_52;
        objc_msgSend(v5, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "string");
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        v14 = objc_msgSend(v13, "length");
        if (v14)
          goto LABEL_52;
        goto LABEL_55;
      case 141:
        goto LABEL_28;
      default:
        if (v8 != 152 && v8 != 154)
          goto LABEL_55;
LABEL_36:
        if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) && *(_BYTE *)(a1 + 96))
        {
          if (objc_msgSend(*(id *)(a1 + 32), "lockupViewType") == 7)
            v4 = 6;
          else
            v4 = 0;
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
        }
        break;
    }
    goto LABEL_52;
  }
  if (v8 <= 89)
  {
    if (v8 != 77)
    {
      if (v8 != 80)
        goto LABEL_55;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
        goto LABEL_55;
      if (!*(_BYTE *)(a1 + 96))
        goto LABEL_55;
      objc_msgSend(*(id *)(a1 + 40), "aggregateValueForKey:", 0x1E73B4C10);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "BOOLValue");

      if (!v17)
        goto LABEL_55;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
      v4 = 4;
      goto LABEL_52;
    }
    goto LABEL_28;
  }
  if (v8 == 90)
  {
    v4 = 0;
    goto LABEL_52;
  }
  if (v8 == 127)
  {
    v18 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
    v19 = *(_QWORD *)(v18 + 24);
    if (v19 < *(_QWORD *)(a1 + 88) - 1)
    {
      v24[0] = xmmword_1BBED22C0;
      v24[1] = xmmword_1BBED22D0;
      v24[2] = xmmword_1BBED22E0;
      v25 = 6;
      *(_QWORD *)(v18 + 24) = v19 + 1;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *((_QWORD *)v24
                                                                    + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                + 24));
    }
  }
LABEL_55:

}

+ (id)fontForButtonViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        +[SKUIHorizontalLockupLayout fontForButtonViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "buttonTitleStyle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    SKUIViewElementFontWithStyle(v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v5, "style");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementFontWithStyle(v18);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (!v17)
  {
    if (objc_msgSend(v6, "containerViewElementType") == 118)
      v19 = 8;
    else
      v19 = 7;
    SKUIFontLimitedPreferredFontForTextStyle(v19, 5);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

+ (id)fontForLabelViewElement:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;

  v5 = a3;
  v6 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        +[SKUIHorizontalLockupLayout fontForLabelViewElement:context:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  objc_msgSend(v5, "style");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    v17 = objc_msgSend(v5, "labelViewStyle");
    if (v17 > 5)
    {
      v16 = 0;
    }
    else
    {
      if (((1 << v17) & 0x1B) != 0)
      {
        if (objc_msgSend(v6, "containerViewElementType") == 118)
          v18 = 8;
        else
          v18 = 7;
      }
      else if (objc_msgSend(v6, "containerViewElementType") == 118)
      {
        v18 = 6;
      }
      else
      {
        v18 = 19;
      }
      SKUIFontLimitedPreferredFontForTextStyle(v18, 5);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v16;
}

+ (id)fontForOrdinalViewElement:(id)a3 context:(id)a4
{
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        +[SKUIHorizontalLockupLayout fontForOrdinalViewElement:context:].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v14)
  {
    SKUIFontForTextStyle(25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v15, "pointSize");
    objc_msgSend(v16, "_lightSystemFontOfSize:");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v14;
}

- (double)bottomPaddingForViewElement:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "elementType");
  v6 = 0.0;
  if (v5 <= 76)
  {
    if (v5 == 8)
    {
      if (objc_msgSend(v4, "badgeType") == 1)
        v6 = 2.0;
      else
        v6 = 0.0;
      goto LABEL_13;
    }
    if (v5 != 13)
      goto LABEL_13;
LABEL_9:
    v6 = 5.0;
    goto LABEL_13;
  }
  if (v5 == 77)
    goto LABEL_9;
  if ((v5 == 135 || v5 == 138) && self->_tallestNonMetadataColumnHeight > 60.0)
    v6 = 2.0;
LABEL_13:

  return v6;
}

- (double)columnSpacingForColumnIdentifier:(int64_t)a3
{
  double result;

  result = 0.0;
  if ((unint64_t)(a3 - 4) >= 3)
  {
    if (a3)
      return 15.0;
    else
      return self->_imageMarginRight;
  }
  return result;
}

- (void)sizeColumnsToFitWidth:(double)a3 context:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableArray *columns;
  id v9;
  uint64_t v10;
  double *v11;
  double v12;
  double metadataColumnMinHeight;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  void *v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  v6 = a4;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__65;
  v35 = __Block_byref_object_dispose__65;
  v36 = 0;
  v25 = 0;
  v26 = (double *)&v25;
  v27 = 0x3010000000;
  v28 = &unk_1BBF15257;
  v29 = a3;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  self->_tallestNonMetadataColumnHeight = 0.0;
  v7 = -[NSMutableArray count](self->_columns, "count");
  columns = self->_columns;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __60__SKUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke;
  v14[3] = &unk_1E73A6B68;
  v19 = v7;
  v14[4] = self;
  v20 = a3;
  v9 = v6;
  v15 = v9;
  v16 = &v25;
  v17 = &v21;
  v18 = &v31;
  -[NSMutableArray enumerateObjectsUsingBlock:](columns, "enumerateObjectsUsingBlock:", v14);
  v10 = v32[5];
  if (v10)
  {
    -[SKUIHorizontalLockupLayout _heightForMetadataColumn:width:context:](self, "_heightForMetadataColumn:width:context:", v10, v9, v26[4]);
    v11 = v26;
    metadataColumnMinHeight = v12 + self->_metadataColumnEdgeInsets.top + self->_metadataColumnEdgeInsets.bottom;
    v26[5] = metadataColumnMinHeight;
    v11[4] = v11[4] - self->_metadataColumnEdgeInsets.left - self->_metadataColumnEdgeInsets.right;
    if (metadataColumnMinHeight < self->_metadataColumnMinHeight)
      metadataColumnMinHeight = self->_metadataColumnMinHeight;
    v11[5] = metadataColumnMinHeight;
    objc_msgSend((id)v32[5], "setSize:");
  }
  *(_QWORD *)&self->_tallestNonMetadataColumnHeight = v22[3];

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

}

void __60__SKUIHorizontalLockupLayout_sizeColumnsToFitWidth_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  uint64_t v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  uint64_t v26;
  double v27;
  id v28;

  v28 = a2;
  v6 = objc_msgSend(v28, "identifier");
  v7 = 0.0;
  if (*(_QWORD *)(a1 + 72) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "columnSpacingForColumnIdentifier:", v6);
    v7 = v8;
  }
  switch(v6)
  {
    case 0:
      objc_msgSend(v28, "childViewElements");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v15, (uint64_t)*(double *)(a1 + 80), *(_QWORD *)(a1 + 40));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v17);
      goto LABEL_10;
    case 1:
    case 2:
      objc_msgSend(*(id *)(a1 + 32), "_sizeForRightAlignedColumn:width:context:", v28, *(_QWORD *)(a1 + 40), *(double *)(a1 + 80));
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + v9);
      v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v12 = *(double *)(v11 + 24);
      if (v12 < v10)
        v12 = v10;
      *(double *)(v11 + 24) = v12;
      v13 = v28;
      goto LABEL_14;
    case 3:
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), a2);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - v7;
      break;
    case 4:
      objc_msgSend(v28, "childViewElements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "fontForOrdinalViewElement:context:", v22, *(_QWORD *)(a1 + 40));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lineHeight");
      *(float *)&v24 = v24;
      v25 = ceilf(*(float *)&v24);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 32)
                                                                  - (v7
                                                                   + 43.0
                                                                   - v7);
      v26 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v27 = *(double *)(v26 + 24);
      if (v27 < v25)
        v27 = v25;
      *(double *)(v26 + 24) = v27;
      objc_msgSend(v28, "setSize:", 43.0 - v7);

      break;
    case 5:
      objc_msgSend(v28, "childViewElements");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "firstObject");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v15, (uint64_t)*(double *)(a1 + 80), *(_QWORD *)(a1 + 40));
LABEL_10:
      v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v20 = *(double *)(v19 + 24);
      if (v20 < v16)
        v20 = v16;
      *(double *)(v19 + 24) = v20;
      objc_msgSend(v28, "setSize:");

      break;
    case 6:
      v9 = *(double *)(a1 + 80);
      v13 = v28;
      v10 = v9;
LABEL_14:
      objc_msgSend(v13, "setSize:", v9, v10);
      break;
    default:
      break;
  }

}

- (double)topPaddingForViewElement:(id)a3
{
  id v3;
  double v4;

  v3 = a3;
  if (objc_msgSend(v3, "elementType") != 8 || (v4 = 3.0, objc_msgSend(v3, "badgeType") != 1))
    v4 = 0.0;

  return v4;
}

- (double)_heightForMetadataColumn:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  double v12;
  _QWORD v14[5];
  id v15;
  uint64_t *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  v9 = a5;
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(v8, "childViewElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 1)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __69__SKUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke;
    v14[3] = &unk_1E73A5278;
    v14[4] = self;
    v17 = a4;
    v15 = v9;
    v16 = &v19;
    v18 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v14);

  }
  v12 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v12;
}

void __69__SKUIHorizontalLockupLayout__heightForMetadataColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  char isKindOfClass;
  void *v6;
  double v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  v6 = v10;
  if ((isKindOfClass & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v10, (uint64_t)*(double *)(a1 + 56), *(_QWORD *)(a1 + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v7
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    if (*(_QWORD *)(a1 + 64) - 1 > a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "bottomPaddingForViewElement:", v10);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
    }
    v6 = v10;
    if (a3)
    {
      objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", v10);
      v6 = v10;
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
    }
  }

}

- (CGSize)_sizeForRightAlignedColumn:(id)a3 width:(double)a4 context:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _QWORD v28[5];
  id v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGSize result;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x3010000000;
  v36 = &unk_1BBF15257;
  v37 = *MEMORY[0x1E0C9D820];
  objc_msgSend(v8, "childViewElements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  if (v11 >= 1)
  {
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __71__SKUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke;
    v28[3] = &unk_1E73A5278;
    v28[4] = self;
    v31 = a4;
    v12 = v9;
    v29 = v12;
    v30 = &v33;
    v32 = v11;
    objc_msgSend(v10, "enumerateObjectsUsingBlock:", v28);
    v23 = v9;
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v13 = v10;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v25 != v15)
            objc_enumerationMutation(v13);
          v17 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          if (objc_msgSend(v17, "elementType") == 138)
          {
            -[SKUIHorizontalLockupLayout _sizeForViewElement:width:context:](self, "_sizeForViewElement:width:context:", v17, (uint64_t)a4, v12);
            v34[5] = v18 + v34[5];
          }
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v38, 16);
      }
      while (v14);
    }

    v9 = v23;
  }
  v19 = v34[4];
  v20 = v34[5];

  _Block_object_dispose(&v33, 8);
  v21 = v19;
  v22 = v20;
  result.height = v22;
  result.width = v21;
  return result;
}

void __71__SKUIHorizontalLockupLayout__sizeForRightAlignedColumn_width_context___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  double v5;
  double v6;
  uint64_t v7;
  double v8;
  void *v9;
  double v10;
  id v11;

  v11 = a2;
  if (objc_msgSend(v11, "elementType") != 138)
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizeForViewElement:width:context:", v11, (uint64_t)*(double *)(a1 + 56), *(_QWORD *)(a1 + 40));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v6
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (*(double *)(v7 + 32) >= v5)
      v5 = *(double *)(v7 + 32);
    *(double *)(v7 + 32) = v5;
  }
  if (*(_QWORD *)(a1 + 64) - 1 > a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "bottomPaddingForViewElement:", v11);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v8
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
  }
  v9 = v11;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 32), "topPaddingForViewElement:", v11);
    v9 = v11;
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 40);
  }

}

- (CGSize)_sizeForViewElement:(id)a3 width:(int64_t)a4 context:(id)a5
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGSize result;

  v7 = a5;
  v8 = a3;
  if (objc_msgSend(v8, "elementType") == 90
    && (objc_msgSend(v8, "flattenedChildren"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        objc_msgSend(v9, "firstObject"),
        v8 = (id)objc_claimAutoreleasedReturnValue(),
        v9,
        !v8))
  {
    v11 = 29.0;
    v13 = 29.0;
  }
  else
  {
    objc_msgSend(v7, "sizeForViewElement:width:", v8, (double)a4);
    v11 = v10;
    v13 = v12;
  }

  v14 = v11;
  v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (NSArray)columns
{
  return &self->_columns->super;
}

- (UIEdgeInsets)metadataColumnEdgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_metadataColumnEdgeInsets.top;
  left = self->_metadataColumnEdgeInsets.left;
  bottom = self->_metadataColumnEdgeInsets.bottom;
  right = self->_metadataColumnEdgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_columns, 0);
}

- (void)initWithLockup:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)fontForButtonViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)fontForLabelViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

+ (void)fontForOrdinalViewElement:(uint64_t)a3 context:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

@end
