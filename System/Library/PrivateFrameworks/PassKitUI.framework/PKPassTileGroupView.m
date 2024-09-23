@implementation PKPassTileGroupView

+ (void)extractSupportedVehicleFunction:(id *)a3 action:(id *)a4 forTile:(id)a5 applicationIdentifier:(id)a6 keyIdentifier:(id)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  const char *v34;
  NSObject *v35;
  id v36;
  id v37;
  NSObject *v38;
  uint32_t v39;
  void *v40;
  id v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  id *v49;
  void *v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = v13;
  v15 = 0;
  if (!v11 || !v12)
  {
    v16 = 0;
    goto LABEL_29;
  }
  v16 = 0;
  if (!v13)
  {
LABEL_29:
    v36 = *a3;
    *a3 = 0;

    v37 = *a4;
    *a4 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v11, "metadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "metadataTypeVehicleFunction");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "vehicleFunctions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v16, "count"))
  {
    PKLogFacilityTypeGetObject();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v12;
      v58 = 2112;
      v59 = v14;
      _os_log_impl(&dword_19D178000, v22, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: no vehicle functions to check for (%@: %@).", buf, 0x16u);
    }
    v15 = 0;
    goto LABEL_28;
  }
  v19 = (void *)MEMORY[0x1E0D671D0];
  objc_msgSend(v11, "state");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "actions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "effectiveActionForActions:", v21);
  v22 = objc_claimAutoreleasedReturnValue();

  -[NSObject vehicleFunctionActions](v22, "vehicleFunctionActions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    PKLogFacilityTypeGetObject();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v57 = v12;
      v58 = 2112;
      v59 = v14;
      _os_log_impl(&dword_19D178000, v35, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: no vehicle function action map for (%@: %@).", buf, 0x16u);
    }

LABEL_28:
    goto LABEL_29;
  }
  v49 = a4;
  v50 = v16;

  v55 = 0;
  objc_msgSend((id)PKGetClassNFDigitalCarKeySession(), "vehicleReports:", &v55);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v55;
  v48 = v23;
  objc_msgSend(v23, "objectForKeyedSubscript:", v14);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v24;
  if (!v25 || v24)
  {
    PKLogFacilityTypeGetObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 138412802;
    v57 = v12;
    v58 = 2112;
    v59 = v14;
    v60 = 2112;
    v61 = v24;
    v34 = "PKPassTileGroupView: failed to fetch vehicle report for (%@: %@) - %@.";
    v38 = v26;
    v39 = 32;
    goto LABEL_38;
  }
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v26 = v50;
  v27 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
  if (!v27)
  {

LABEL_35:
    PKLogFacilityTypeGetObject();
    v26 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      goto LABEL_39;
    *(_DWORD *)buf = 138412546;
    v57 = v12;
    v58 = 2112;
    v59 = v14;
    v34 = "PKPassTileGroupView: failed to identify supported function for (%@: %@).";
    goto LABEL_37;
  }
  v28 = v27;
  v45 = v14;
  v46 = v12;
  v29 = 0;
  v30 = *(_QWORD *)v52;
  while (2)
  {
    for (i = 0; i != v28; ++i)
    {
      if (*(_QWORD *)v52 != v30)
        objc_enumerationMutation(v26);
      v32 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
      if (objc_msgSend(v25, "isRKEFunctionSupported:", v32, v45, v46, v47))
      {
        objc_msgSend(v15, "objectForKeyedSubscript:", v32);
        v33 = objc_claimAutoreleasedReturnValue();
        if (v33)
        {
          v40 = (void *)v33;
          v41 = v32;
          v14 = v45;
          v12 = v46;
          goto LABEL_40;
        }
        v29 = 1;
      }
    }
    v28 = -[NSObject countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v51, v62, 16);
    if (v28)
      continue;
    break;
  }

  v14 = v45;
  v12 = v46;
  if ((v29 & 1) == 0)
    goto LABEL_35;
  PKLogFacilityTypeGetObject();
  v26 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    goto LABEL_39;
  *(_DWORD *)buf = 138412546;
  v57 = v46;
  v58 = 2112;
  v59 = v45;
  v34 = "PKPassTileGroupView: failed to map supported function to action for (%@: %@).";
LABEL_37:
  v38 = v26;
  v39 = 22;
LABEL_38:
  _os_log_impl(&dword_19D178000, v38, OS_LOG_TYPE_DEFAULT, v34, buf, v39);
LABEL_39:
  v41 = 0;
  v40 = 0;
LABEL_40:

  v42 = *a3;
  *a3 = v41;
  v37 = v41;

  v43 = *v49;
  *v49 = v40;
  v44 = v40;

  v16 = v50;
LABEL_30:

}

- (PKPassTileGroupView)initWithCoder:(id)a3
{

  return 0;
}

- (PKPassTileGroupView)init
{
  PKPassTileGroupView *v2;
  NSMutableArray *v3;
  NSMutableArray *itemViewsByRows;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PKPassTileGroupView;
  v2 = -[PKPassTileGroupView initWithFrame:](&v6, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    itemViewsByRows = v2->_itemViewsByRows;
    v2->_itemViewsByRows = v3;

    v2->_maximumRows = 1;
  }
  return v2;
}

- (double)_populateHandleSizeCachesWithWidth:(double)a3 recompute:
{
  void *v3;
  unint64_t v4;
  double v5;
  double v6;
  _QWORD v8[8];
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  if (!a1)
    return 0.0;
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v3 = *(void **)(a1 + 512);
  v13 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke;
  v8[3] = &unk_1E3E67438;
  *(double *)&v8[7] = a3;
  v9 = a2;
  v8[4] = a1;
  v8[5] = &v10;
  v8[6] = &v14;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v8);
  v4 = v11[3];
  v5 = (double)(v4 - 1);
  if (v4 <= 1)
    v5 = 0.0;
  v6 = v15[3] + v5 * 8.0;
  v15[3] = v6;
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);
  return v6;
}

void __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v12[5];
  _QWORD v13[7];
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 488))
    {
      objc_msgSend(v3, "firstObject");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (void *)v4;
      if (v4)
        v6 = *(void **)(v4 + 16);
      else
        v6 = 0;
      v7 = v6;

      objc_msgSend(v7, "content");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "metadata");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "preferredStyle");

    }
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    PKFloatRoundToPixel();
    v10 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_2;
    v13[3] = &unk_1E3E673E8;
    v14 = *(_BYTE *)(a1 + 64);
    v13[6] = v11;
    v13[4] = &v19;
    v13[5] = &v15;
    objc_msgSend(v3, "enumerateObjectsUsingBlock:", v13);
    if (*((_BYTE *)v16 + 24))
    {
      v12[0] = v10;
      v12[1] = 3221225472;
      v12[2] = __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_3;
      v12[3] = &unk_1E3E67410;
      v12[4] = &v19;
      objc_msgSend(v3, "enumerateObjectsUsingBlock:", v12);
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v20[3]
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
    _Block_object_dispose(&v15, 8);
    _Block_object_dispose(&v19, 8);
  }

}

void __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_2(uint64_t a1, void *a2)
{
  _QWORD *v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double *v14;

  v3 = a2;
  v14 = (double *)v3;
  if (v3)
    v4 = (void *)v3[2];
  else
    v4 = 0;
  v5 = v4;
  v6 = v5;
  if (*(_BYTE *)(a1 + 56))
  {
    objc_msgSend(v5, "sizeThatFits:", *(double *)(a1 + 48), 1.79769313e308);
  }
  else
  {
    objc_msgSend(v5, "frame");
    v7 = v9;
    v8 = v10;
  }
  if (v14)
  {
    *((_QWORD *)v14 + 3) = v7;
    v14[4] = v8;
  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v12 = *(double *)(v11 + 24);
  if (v12 != 0.0 && v12 != v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v12 = *(double *)(v11 + 24);
  }
  *(double *)(v11 + 24) = fmax(v12, v8);

}

double __68__PKPassTileGroupView__populateHandleSizeCachesWithWidth_recompute___block_invoke_3(uint64_t a1, uint64_t a2)
{
  double result;

  if (a2)
  {
    result = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    *(double *)(a2 + 32) = result;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width;
  double v5;
  double v6;
  CGSize result;

  width = a3.width;
  if (-[NSArray count](self->_content, "count", a3.width, a3.height))
  {
    v5 = -[PKPassTileGroupView _populateHandleSizeCachesWithWidth:recompute:]((uint64_t)self, 1, width - (self->_contentInset.left + self->_contentInset.right));
  }
  else
  {
    width = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  v6 = width;
  result.height = v5;
  result.width = v6;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double left;
  double right;
  double v6;
  double v7;
  double v8;
  char v9;
  unsigned int v10;
  CGRectEdge v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  uint64_t v16;
  double v17;
  void *v18;
  uint64_t v19;
  unint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  double v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BOOL4 v35;
  void *v36;
  double v37;
  double v38;
  id v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  CGFloat v53;
  _BOOL8 v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  double v58;
  CGRect slice;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  CGRect v64;
  CGRect remainder;
  objc_super v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v66.receiver = self;
  v66.super_class = (Class)PKPassTileGroupView;
  -[PKPassTileGroupView layoutSubviews](&v66, sel_layoutSubviews);
  -[PKPassTileGroupView bounds](self, "bounds");
  left = self->_contentInset.left;
  right = self->_contentInset.right;
  v6 = v3 - (left + right);
  v8 = v7 - (self->_contentInset.top + self->_contentInset.bottom);
  v9 = self->_boundsSize.height != v8 || self->_boundsSize.width != v6;
  self->_boundsSize.width = v6;
  self->_boundsSize.height = v8;
  -[PKPassTileGroupView _populateHandleSizeCachesWithWidth:recompute:]((uint64_t)self, v9, v3 - (left + right));
  v10 = -[PKPassTileGroupView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v10)
    v11 = CGRectMaxXEdge;
  else
    v11 = CGRectMinXEdge;
  PKSizeAlignedInRect();
  memset(&v64, 0, sizeof(v64));
  remainder.origin.x = v12;
  remainder.origin.y = v13;
  remainder.size.width = v14;
  remainder.size.height = v15;
  v55 = -[NSMutableArray count](self->_itemViewsByRows, "count");
  if (v55)
  {
    v16 = 0;
    v58 = (double)v10;
    v17 = (double)(v10 ^ 1);
    do
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_itemViewsByRows, "objectAtIndexedSubscript:", v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "count");
      if (v19)
      {
        v20 = v19;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v56 = v18;
        v21 = v18;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
        v57 = v16;
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v61;
          v25 = 0.0;
          do
          {
            v26 = 0;
            do
            {
              if (*(_QWORD *)v61 != v24)
                objc_enumerationMutation(v21);
              v27 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v26);
              if (v27)
                v28 = *(double *)(v27 + 32);
              else
                v28 = 0.0;
              v25 = fmax(v28, v25);
              ++v26;
            }
            while (v23 != v26);
            v29 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v60, v67, 16);
            v23 = v29;
          }
          while (v29);
        }
        else
        {
          v25 = 0.0;
        }

        memset(&slice, 0, sizeof(slice));
        CGRectDivide(remainder, &slice, &remainder, v25, CGRectMinYEdge);
        CGRectDivide(remainder, &v64, &remainder, 8.0, CGRectMinYEdge);
        v30 = 0;
        v31 = v20 - 1;
        if (v20 <= 1)
          v32 = 1;
        else
          v32 = v20;
        do
        {
          objc_msgSend(v21, "objectAtIndexedSubscript:", v30);
          v33 = objc_claimAutoreleasedReturnValue();
          v34 = v33;
          if (v33)
          {
            v35 = *(_BYTE *)(v33 + 8) != 0;
            v36 = *(void **)(v33 + 16);
          }
          else
          {
            v35 = 0;
            v36 = 0;
          }
          v37 = 0.5;
          if (v31 == v30)
            v37 = v17;
          if (v30)
            v38 = v37;
          else
            v38 = v58;
          v39 = v36;
          objc_msgSend(v39, "layer");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "anchorPoint");
          v43 = v42;
          v44 = v41;
          if (v38 != v42 || v41 != 0.0)
          {
            objc_msgSend(v40, "bounds");
            v46 = v45;
            v48 = v47;
            objc_msgSend(v40, "position");
            v50 = v49;
            v52 = v51;
            objc_msgSend(v40, "setAnchorPoint:", v38, 0.0);
            if (!v35)
              objc_msgSend(v40, "setPosition:", v50 - v43 * v46 + v38 * v46, v52 - v44 * v48 + v48 * 0.0);
          }

          if (v34)
            v53 = *(double *)(v34 + 24);
          else
            v53 = 0.0;
          CGRectDivide(slice, &v64, &slice, v53, v11);
          PKSizeAlignedInRect();
          v54 = self->_animated && !v35;
          objc_msgSend(v39, "pkui_setFrame:animated:", v54);
          objc_msgSend(v39, "layoutIfNeededAnimated:", v54);

          if (v34)
            *(_BYTE *)(v34 + 8) = 0;
          CGRectDivide(slice, &v64, &slice, 8.0, v11);

          ++v30;
        }
        while (v32 != v30);
        v18 = v56;
        v16 = v57;
      }

      ++v16;
    }
    while (v16 != v55);
  }
}

- (void)performBatchUpdates:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void (**v6)(void);
  void (**v7)(void);

  v4 = a4;
  v6 = (void (**)(void))a3;
  if (v6)
  {
    v7 = v6;
    if (self->_deferringUpdate)
    {
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("PKPassTileGroupView recursive batch updates are not supported."));
      v6 = v7;
    }
    self->_deferringUpdate = 1;
    v6[2]();
    self->_deferringUpdate = 0;
    if (self->_deferredSubviewUpdate)
    {
      self->_deferredSubviewUpdate = 0;
      -[PKPassTileGroupView _updateSubviewsAnimated:](self, v4);
    }
    else
    {
      -[PKPassTileGroupView layoutIfNeededAnimated:](self, "layoutIfNeededAnimated:", v4);
    }
    v6 = v7;
  }

}

- (_BYTE)_updateSubviewsAnimated:(_BYTE *)result
{
  _BYTE *v2;
  unint64_t v4;
  unint64_t v5;
  unint64_t i;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (result)
  {
    v2 = result;
    if (result[529])
    {
      result[530] = 1;
    }
    else
    {
      objc_msgSend(result, "layoutIfNeeded");
      *((_OWORD *)v2 + 27) = *MEMORY[0x1E0C9D820];
      v4 = objc_msgSend(*((id *)v2 + 62), "count");
      v5 = objc_msgSend(*((id *)v2 + 64), "count");
      if (v4)
      {
        for (i = 0; i != v4; ++i)
        {
          if (i >= v5
            || (objc_msgSend(*((id *)v2 + 64), "objectAtIndexedSubscript:", i),
                (v7 = (id)objc_claimAutoreleasedReturnValue()) == 0))
          {
            v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(*((id *)v2 + 64), "addObject:", v7);
          }
          objc_msgSend(*((id *)v2 + 62), "objectAtIndexedSubscript:", i);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassTileGroupView _updateRowItemViews:withRowItems:isLastRow:animated:]((id *)v2, v7, v8, v4 - 1 == i, a2);

        }
      }
      if (v4 < v5)
      {
        v9 = (void *)MEMORY[0x1E0C9AA60];
        do
        {
          objc_msgSend(*((id *)v2 + 64), "objectAtIndexedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[PKPassTileGroupView _updateRowItemViews:withRowItems:isLastRow:animated:]((id *)v2, v10, v9, 0, a2);

          ++v4;
        }
        while (v5 != v4);
      }
      objc_msgSend(v2, "setNeedsLayout");
      return (_BYTE *)objc_msgSend(v2, "layoutIfNeededAnimated:", a2);
    }
  }
  return result;
}

- (void)layoutIfNeededAnimated:(BOOL)a3
{
  self->_animated = a3;
  -[PKPassTileGroupView layoutIfNeeded](self, "layoutIfNeeded");
  self->_animated = 0;
}

- (void)prepareForReuse
{
  _QWORD v2[3];

  memset(v2, 0, sizeof(v2));
  -[PKPassTileGroupView setPass:passView:groupTile:context:animated:](self, "setPass:passView:groupTile:context:animated:", 0, 0, 0, v2, 0);
}

- (void)_updateRowItemViews:(void *)a3 withRowItems:(char)a4 isLastRow:(int)a5 animated:
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  PKPassTileView *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  PKPassTileGroupView_ViewHandle *v23;
  PKPassTileView *v24;
  PKPassTileGroupView_ViewHandle *v25;
  FBSSceneIdentityToken *layeringSceneIdentity;
  FBSSceneIdentityToken *v27;
  char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  PKPassTileGroupView_ViewHandle *v34;
  void *v35;
  void *v36;
  float v37;
  double v38;
  id v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  uint64_t v46;
  _BYTE *v47;
  void *v48;
  id v49;
  id v50;
  _BOOL4 v51;
  _BOOL8 v52;
  id v53;
  void *v54;
  uint64_t v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  void *v62;
  _QWORD v63[4];
  id v64;
  id *v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  uint64_t (*v80)(uint64_t);
  void *v81;
  PKPassTileGroupView_ViewHandle *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v56 = objc_msgSend(v8, "count");
  v62 = v7;
  v57 = v8;
  v54 = (void *)objc_msgSend(v7, "pk_createArrayByApplyingBlock:", &__block_literal_global_52);
  objc_msgSend(v8, "differenceFromArray:withOptions:usingEquivalenceTest:");
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v76;
    v58 = *(_QWORD *)v76;
    do
    {
      v12 = 0;
      v13 = sel__tileViewTapped_;
      v59 = v10;
      do
      {
        if (*(_QWORD *)v76 != v11)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v12);
        v15 = objc_msgSend(v14, "index");
        v16 = objc_msgSend(v14, "changeType");
        if (v16 == 1)
        {
          objc_msgSend(v14, "object");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectAtIndexedSubscript:", v15);
          v24 = (PKPassTileView *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "removeObjectAtIndex:", v15);
          if (v24)
            layeringSceneIdentity = v24->super.super.super.super.__layeringSceneIdentity;
          else
            layeringSceneIdentity = 0;
          v27 = layeringSceneIdentity;
          objc_msgSend(a1, "sendSubviewToBack:", v27);
          v28 = v13;
          -[FBSSceneIdentityToken removeTarget:action:forControlEvents:](v27, "removeTarget:action:forControlEvents:", a1, v13, 64);
          v74 = 0u;
          v72 = 0u;
          v73 = 0u;
          v71 = 0u;
          -[FBSSceneIdentityToken gestureRecognizers](v27, "gestureRecognizers");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
          if (v30)
          {
            v31 = v30;
            v32 = *(_QWORD *)v72;
            do
            {
              for (i = 0; i != v31; ++i)
              {
                if (*(_QWORD *)v72 != v32)
                  objc_enumerationMutation(v29);
                -[FBSSceneIdentityToken removeGestureRecognizer:](v27, "removeGestureRecognizer:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
              }
              v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v71, v83, 16);
            }
            while (v31);
          }

          v34 = v27;
          v23 = v34;
          if (a5)
          {
            -[PKPassTileGroupView_ViewHandle layer](v34, "layer");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "opacity");
            objc_msgSend(v36, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", v37, 0.0);
            v79.receiver = (id)MEMORY[0x1E0C809B0];
            v79.super_class = (Class)3221225472;
            v80 = __RemoveViewFromSuperview_block_invoke;
            v81 = &unk_1E3E62288;
            v82 = v23;
            objc_msgSend(v36, "pkui_setCompletionHandler:", &v79);
            LODWORD(v38) = 0;
            objc_msgSend(v35, "setOpacity:", v38);
            v39 = (id)objc_msgSend(v35, "pkui_addAdditiveAnimation:", v36);
            objc_msgSend(v36, "duration");

          }
          else
          {
            -[PKPassTileGroupView_ViewHandle removeFromSuperview](v34, "removeFromSuperview");
          }
          v11 = v58;

          v13 = v28;
          v10 = v59;
        }
        else
        {
          if (v16)
            goto LABEL_28;
          objc_msgSend(v14, "object");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_alloc_init(PKPassTileView);
          -[PKPassTileView addTarget:action:forControlEvents:](v18, "addTarget:action:forControlEvents:", a1, v13, 64);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", a1, sel__tileViewPinched_);
          -[PKPassTileView addGestureRecognizer:](v18, "addGestureRecognizer:", v19);

          objc_msgSend(a1, "insertSubview:atIndex:", v18, 0);
          if (a5)
          {
            objc_msgSend(MEMORY[0x1E0D676D0], "springAnimationWithKeyPath:", CFSTR("opacity"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "pkui_updateForAdditiveAnimationFromScalar:toScalar:", 0.0, 1.0);
            -[PKPassTileView layer](v18, "layer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = (id)objc_msgSend(v21, "pkui_addAdditiveAnimation:", v20);

          }
          v23 = [PKPassTileGroupView_ViewHandle alloc];
          v24 = v18;
          if (v23)
          {
            v79.receiver = v23;
            v79.super_class = (Class)PKPassTileGroupView_ViewHandle;
            v25 = (PKPassTileGroupView_ViewHandle *)objc_msgSendSuper2(&v79, sel_init);
            v23 = v25;
            if (v25)
            {
              v25->_initialLayout = 1;
              objc_storeStrong((id *)&v25->_view, v18);
            }
          }

          objc_msgSend(v62, "insertObject:atIndex:", v23, v15);
        }

LABEL_28:
        ++v12;
      }
      while (v12 != v10);
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v75, v84, 16);
      v10 = v40;
    }
    while (v40);
  }
  objc_msgSend(a1[58], "metadata");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "metadataTypeHorizontalFlowGroup");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_msgSend(v42, "groupStyle");

  v44 = v56;
  if (v56)
  {
    for (j = 0; j != v56; ++j)
    {
      objc_msgSend(v62, "objectAtIndexedSubscript:", j);
      v46 = objc_claimAutoreleasedReturnValue();
      v47 = (_BYTE *)v46;
      if (v46)
        v48 = *(void **)(v46 + 16);
      else
        v48 = 0;
      v49 = v48;
      v63[0] = MEMORY[0x1E0C809B0];
      v63[1] = 3221225472;
      v63[2] = __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_3;
      v63[3] = &unk_1E3E674E0;
      v50 = v57;
      v70 = a4;
      v64 = v50;
      v65 = a1;
      v66 = v49;
      v67 = j;
      v68 = v44;
      v69 = v43;
      if (a5)
      {
        if (v47)
          v51 = v47[8] != 0;
        else
          v51 = 0;
        v52 = !v51;
      }
      else
      {
        v52 = 0;
      }
      v53 = v49;
      objc_msgSend(v53, "performBatchUpdates:animated:", v63, v52);

      v44 = v56;
    }
  }

}

uint64_t __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;

  if (a2)
    v2 = *(void **)(a2 + 16);
  else
    v2 = 0;
  return objc_msgSend(v2, "content");
}

uint64_t __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;

  v4 = a3;
  objc_msgSend(a2, "metadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "metadata");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v6;
  v10 = v8;
  v11 = v10;
  if (v9 == v10)
  {
    v12 = 1;
  }
  else
  {
    v12 = 0;
    if (v9 && v10)
      v12 = objc_msgSend(v9, "isEqualToString:", v10);
  }

  return v12;
}

void __75__PKPassTileGroupView__updateRowItemViews_withRowItems_isLastRow_animated___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL4 v7;
  BOOL v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  id v42;
  id *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  id v50;
  id obj;
  id v52;
  uint64_t v53;
  uint64_t v54;
  id *val;
  void *v56;
  _QWORD v57[6];
  id v58;
  id location;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 56));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = a1;
  if (*(_BYTE *)(a1 + 80))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 64);
    v6 = *(_QWORD *)(a1 + 56) + 1;
    v7 = v6 == v5;
    v8 = *(_QWORD *)(v4 + 536) == 1 && v6 == v5;
    v48 = a1 + 40;
    if (!v8)
      goto LABEL_36;
    objc_msgSend(*(id *)(v4 + 504), "insertObject:atIndex:", v1, 0);
    if (*(_QWORD *)(a1 + 40))
    {
      v9 = (void *)objc_msgSend(MEMORY[0x1E0D66F70], "_createMetadataForType:identifier:context:", 0, CFSTR("PKPassTileContextMenuTileIdentifier"), 0);
      objc_msgSend(v9, "setPreferredStyle:", 1);
      v10 = (void *)objc_msgSend(MEMORY[0x1E0D66F78], "createResolvedStateWithType:", 1);
      objc_msgSend(v10, "setPreferredStyle:", 5);
      v11 = (void *)MEMORY[0x1E0D66F98];
      PKLocalizedTicketingString(CFSTR("TILE_CONTEXT_MENU_TITLE"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "createWithContent:", v12);
      objc_msgSend(v10, "setBody:", v13);

      v14 = (void *)objc_msgSend(MEMORY[0x1E0D66F68], "createWithSymbolName:tintColor:", CFSTR("ellipsis"), 14);
      objc_msgSend(v10, "setIcon:", v14);

      v50 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D66F50]), "_initWithMetadata:childTiles:stateIdentifier:state:inProgress:", v9, 0, CFSTR("PKPassTileContextMenuTileIdentifier"), v10, 0);
      objc_msgSend(v50, "setAxID:", *MEMORY[0x1E0D67D70]);

    }
    else
    {
      v50 = 0;
    }

    v15 = *(id **)(a1 + 40);
    v47 = *(void **)(a1 + 48);
    if (!v15)
    {
LABEL_34:
      objc_msgSend(v47, "setMenu:", v15);

      v3 = a1;
      v7 = 1;
      objc_msgSend(*(id *)(a1 + 48), "setShowsMenuAsPrimaryAction:", 1);
      goto LABEL_37;
    }
    v52 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    val = v15;
    obj = v15[63];
    v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
    if (!v54)
      goto LABEL_33;
    v53 = *(_QWORD *)v61;
LABEL_12:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v61 != v53)
        objc_enumerationMutation(obj);
      objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * v16), "state");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)MEMORY[0x1E0D671D0];
      objc_msgSend(v17, "actions");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "effectiveActionForActions:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v20)
        goto LABEL_31;
      objc_msgSend(v17, "icon");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v17, "type");
      if (v22 == 1)
        break;
      if (!v22)
      {
        objc_msgSend(v17, "stateTypeDefault");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "body");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_20;
      }
      v56 = 0;
      if (v21)
      {
LABEL_21:
        objc_msgSend(v21, "image");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0DC3658], "tintColor");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          objc_msgSend(MEMORY[0x1E0DC3870], "imageWithPKImage:", v26);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "imageWithTintColor:", v27);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend(v21, "contextMenuSymbolName");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v31 = v30;
          if (v30)
          {
            v32 = v30;
          }
          else
          {
            objc_msgSend(v21, "symbolName");
            v32 = (id)objc_claimAutoreleasedReturnValue();
          }
          v28 = v32;

          v33 = (void *)MEMORY[0x1E0DC3870];
          v34 = (void *)MEMORY[0x1E0DC3888];
          v64 = v27;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v64, 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "configurationWithPaletteColors:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "_systemImageNamed:withConfiguration:", v28, v36);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

        }
        goto LABEL_30;
      }
LABEL_24:
      v29 = 0;
LABEL_30:
      objc_initWeak(&location, val);
      v37 = (void *)MEMORY[0x1E0DC3428];
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __35__PKPassTileGroupView__contextMenu__block_invoke;
      v57[3] = &unk_1E3E675A8;
      objc_copyWeak(&v58, &location);
      v57[4] = v20;
      v57[5] = val;
      objc_msgSend(v37, "actionWithTitle:image:identifier:handler:", v56, v29, 0, v57);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addObject:", v38);

      objc_destroyWeak(&v58);
      objc_destroyWeak(&location);

LABEL_31:
      if (v54 == ++v16)
      {
        v54 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v65, 16);
        if (!v54)
        {
LABEL_33:

          objc_msgSend(MEMORY[0x1E0DC39D0], "menuWithChildren:", v52);
          v15 = (id *)objc_claimAutoreleasedReturnValue();

          goto LABEL_34;
        }
        goto LABEL_12;
      }
    }
    objc_msgSend(v17, "stateTypeDefaultV2");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "body");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "valueTypeText");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "content");
    v56 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
    if (v21)
      goto LABEL_21;
    goto LABEL_24;
  }
  v7 = 0;
  v48 = a1 + 40;
LABEL_36:
  v50 = (id)v1;
LABEL_37:
  v40 = *(void **)(v3 + 48);
  v39 = v3 + 48;
  objc_msgSend(v40, "setCompact:", *(_QWORD *)(v39 + 16) > 1uLL);
  objc_msgSend(*(id *)v39, "setGroupStyle:", *(_QWORD *)(v39 + 24));
  v41 = *(_QWORD *)(v39 - 8);
  v42 = *(id *)v39;
  v43 = (id *)v39;
  v44 = *(_QWORD *)(v41 + 416);
  objc_msgSend(*(id *)(v41 + 544), "uniqueID");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setPassView:passUniqueID:", v44, v45);

  objc_msgSend(*v43, "setContent:", v50);
  if (v7)
    v46 = *(_QWORD *)(*(_QWORD *)v48 + 536);
  else
    v46 = 0;
  objc_msgSend(*v43, "setOverflowType:", v46);

}

- (void)_performOpenExternalURLAction:(void *)a1
{
  void *v3;
  void *v4;

  if (a1)
  {
    objc_msgSend(a2, "externalURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      -[PKPassTileGroupView _openURL:](a1, v3);
      v3 = v4;
    }

  }
}

- (void)_openURL:(void *)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_alloc_init(MEMORY[0x1E0CA5938]);
  objc_msgSend(v4, "setSensitive:", 0);
  v8 = *MEMORY[0x1E0D22D88];
  v9[0] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFrontBoardOptions:", v5);

  if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
  {
    objc_msgSend(a1, "window");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      PKPostOpenApplicationNotification(v6, v3, v4);

  }
  else
  {
    PKOpenApplication(v3, v4);
  }

}

- (void)_performDisplayAuxiliaryPassInformationItemAction:(_QWORD *)a1
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  PKDashboardAuxiliaryPassInformationViewController *v25;
  id v26;
  _QWORD v27[5];
  _QWORD v28[5];

  v26 = a2;
  if (a1)
  {
    v3 = (void *)a1[68];
    if (v3)
    {
      objc_msgSend(v3, "uniqueID");
      v4 = objc_claimAutoreleasedReturnValue();
      if (v4)
      {
        v5 = (void *)v4;
        objc_msgSend(v26, "auxiliaryPassInformationIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "auxiliaryPassInformationItemIdentifier");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v7)
        {
LABEL_13:

          goto LABEL_14;
        }
        if ((PKRunningInViewService() & 1) != 0 || PKRunningInLockScreenPlugin())
        {
          v8 = objc_alloc_init(MEMORY[0x1E0CB3998]);
          objc_msgSend(v8, "setScheme:", *MEMORY[0x1E0D6BCA8]);
          objc_msgSend(v8, "setHost:", *MEMORY[0x1E0D6BC10]);
          v9 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(v26, "type");
          PKPaymentPassActionTypeToString();
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "stringWithFormat:", CFSTR("/%@/%@"), v5, v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setPath:", v11);

          v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          if (v6)
          {
            objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", *MEMORY[0x1E0D6BBD0], v6);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "addObject:", v13);

          }
          objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", *MEMORY[0x1E0D6BBD8], v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v14);

          v15 = (void *)objc_msgSend(v12, "copy");
          objc_msgSend(v8, "setQueryItems:", v15);

          objc_msgSend(v8, "URL");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v16)
            goto LABEL_12;
          v17 = v16;
          -[PKPassTileGroupView _openURL:](a1, v16);
        }
        else
        {
          v18 = (void *)a1[68];
          if (!v18)
            goto LABEL_13;
          objc_msgSend(v18, "secureElementPass");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v19)
            goto LABEL_13;
          v8 = v19;
          objc_msgSend(v19, "auxiliaryPassInformation");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v20;
          if (!v20 || !objc_msgSend(v20, "count"))
            goto LABEL_12;
          v21 = MEMORY[0x1E0C809B0];
          if (v6)
          {
            v28[0] = MEMORY[0x1E0C809B0];
            v28[1] = 3221225472;
            v28[2] = __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke;
            v28[3] = &unk_1E3E67508;
            v28[4] = v6;
            objc_msgSend(v12, "pk_firstObjectPassingTest:", v28);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            objc_msgSend(v12, "firstObject");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
          }
          v17 = v22;
          if (v22)
          {
            objc_msgSend(v22, "items");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v27[0] = v21;
            v27[1] = 3221225472;
            v27[2] = __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke_2;
            v27[3] = &unk_1E3E67530;
            v27[4] = v7;
            objc_msgSend(v23, "pk_firstObjectPassingTest:", v27);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (v24)
            {
              v25 = -[PKDashboardAuxiliaryPassInformationViewController initWithItem:forPass:]([PKDashboardAuxiliaryPassInformationViewController alloc], "initWithItem:forPass:", v24, v8);
              -[PKPassTileGroupView _displayViewController:](a1, v25);

            }
          }
        }

LABEL_12:
        goto LABEL_13;
      }
    }
  }
LABEL_14:

}

uint64_t __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

uint64_t __73__PKPassTileGroupView__performDisplayAuxiliaryPassInformationItemAction___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 32);
  v5 = v3;
  v6 = v4;
  v7 = v6;
  if (v5 == v6)
  {
    v8 = 1;
  }
  else
  {
    v8 = 0;
    if (v5 && v6)
      v8 = objc_msgSend(v5, "isEqualToString:", v6);
  }

  return v8;
}

- (void)_displayViewController:(void *)a1
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  PKNavigationController *v7;
  id v8;

  v8 = a2;
  objc_msgSend(a1, "pkui_viewControllerFromResponderChain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "navigationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "pushViewController:animated:", v8, 1);
    }
    else
    {
      v7 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v8);
      objc_msgSend(v4, "presentViewController:animated:completion:", v7, 1, 0);

    }
  }

}

- (void)_performDisplayTileContextAction:(_QWORD *)a1
{
  PKDashboardTileContextViewController *v3;

  if (a1)
  {
    v3 = -[PKDashboardTileContextViewController initWithTileContext:forPass:groupID:passView:overridesMaximumRows:]([PKDashboardTileContextViewController alloc], "initWithTileContext:forPass:groupID:passView:overridesMaximumRows:", objc_msgSend(a2, "context"), a1[68], 0, a1[52], 0);
    -[PKPassTileGroupView _displayViewController:](a1, v3);

  }
}

- (void)_performViewImageAction:(void *)a3 sourceImageView:
{
  id v5;
  void *v6;
  id v7;

  if (a1)
  {
    v5 = a3;
    objc_msgSend(a2, "title");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pkui_viewControllerFromResponderChain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKTileImagePreviewViewController presentWithImageView:title:presenting:](PKTileImagePreviewViewController, "presentWithImageView:title:presenting:", v5, v7, v6);

  }
}

- (void)setPass:(id)a3 passView:(id)a4 groupTile:(id)a5 context:(id *)a6 animated:(BOOL)a7
{
  _BOOL4 v7;
  id v12;
  void *v13;
  void *v14;
  PKPass *v15;
  NSArray *content;
  void *v17;
  int v18;
  void *v19;
  NSArray **p_content;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t var2;
  unint64_t var1;
  NSArray *v27;
  void *v28;
  NSArray **p_contentByRows;
  void *v30;
  void *v31;
  unint64_t v32;
  unint64_t maximumRows;
  unint64_t v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  NSArray *v40;
  unint64_t v41;
  NSArray *v42;
  NSArray *effectiveContentByRows;
  void *v44;
  id v45;
  id v46;
  NSMutableArray *v47;
  NSMutableArray *effectiveDroppedContent;
  void *v49;
  id v50;
  PKPass *obj;
  PKPass *obja;
  _QWORD v53[4];
  id v54;
  PKPassTileGroupView *v55;
  _QWORD v56[4];
  id v57;

  v7 = a7;
  obj = (PKPass *)a3;
  v50 = a4;
  v12 = a5;
  v13 = v12;
  if (a6->var0)
    objc_msgSend(v12, "prearmTiles");
  else
    objc_msgSend(v12, "tiles");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = obj;
  if (!v14)
  {
    v14 = obj;
LABEL_8:

    v15 = 0;
    v14 = 0;
    goto LABEL_9;
  }
  if (!obj)
    goto LABEL_8;
LABEL_9:
  obja = v15;
  if (self->_pass != v15)
    goto LABEL_12;
  if (!PKEqualObjects())
    goto LABEL_12;
  content = self->_content;
  v53[0] = MEMORY[0x1E0C809B0];
  v53[1] = 3221225472;
  v53[2] = __67__PKPassTileGroupView_setPass_passView_groupTile_context_animated___block_invoke;
  v53[3] = &unk_1E3E67558;
  v54 = v50;
  v55 = self;
  objc_msgSend(v14, "differenceFromArray:withOptions:usingEquivalenceTest:", content, 0, v53);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hasChanges");

  if (v18)
  {
LABEL_12:
    objc_storeStrong((id *)&self->_pass, obja);
    objc_storeStrong((id *)&self->_passView, a4);
    -[PKPassView passState](self->_passView, "passState");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    self->_lastPassStateHash = objc_msgSend(v19, "hash");

    objc_storeStrong((id *)&self->_groupTile, a5);
    p_content = &self->_content;
    objc_storeStrong((id *)&self->_content, v14);
    objc_msgSend(v13, "metadata");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "metadataTypeHorizontalFlowGroup");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self->_columns = objc_msgSend(v22, "columns");

    objc_msgSend(v13, "maximumRows");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "unsignedIntegerValue");

    var2 = a6->var2;
    if (!var2)
    {
      var2 = a6->var1;
      if (v24)
      {
        if (v24 >= var2)
          var1 = a6->var1;
        else
          var1 = v24;
        if (var2)
          var2 = var1;
        else
          var2 = v24;
      }
      else if (!var2)
      {
        var2 = -1;
      }
    }
    self->_maximumRows = var2;
    v27 = *p_content;
    if (*p_content)
      v28 = (void *)objc_msgSend(MEMORY[0x1E0D66F50], "createTileRowsForTiles:forceCompact:maximumColumns:", *p_content, 0, self->_columns);
    else
      v28 = 0;
    p_contentByRows = &self->_contentByRows;
    objc_storeStrong((id *)&self->_contentByRows, v28);
    if (v27)

    if (*p_content)
    {
      -[NSArray firstObject](*p_content, "firstObject");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "metadata");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      self->_selectable = objc_msgSend(v31, "isSelectable");

    }
    else
    {
      self->_selectable = 0;
    }
    v32 = -[NSArray count](*p_contentByRows, "count");
    maximumRows = self->_maximumRows;
    if (v32 >= maximumRows)
      v34 = self->_maximumRows;
    else
      v34 = v32;
    if (v32 > maximumRows)
    {
      v35 = v32;
      -[PKPassTile metadata](self->_groupTile, "metadata");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "metadataTypeHorizontalFlowGroup");
      v49 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v49, "groupStyle");
      v38 = 1;
      if (v37 != 1)
        v38 = 2;
      self->_overflowType = v38;
      if ((unint64_t)objc_msgSend(v49, "columns") >= 2 && objc_msgSend(v49, "widthClass") == 1 && *p_content)
      {
        v39 = objc_msgSend(MEMORY[0x1E0D66F50], "createTileRowsForTiles:forceCompact:maximumColumns:", *p_content, 1, self->_columns);
        v40 = *p_contentByRows;
        *p_contentByRows = (NSArray *)v39;

        v41 = -[NSArray count](*p_contentByRows, "count");
        v35 = v41;
        if (v41 >= self->_maximumRows)
          v34 = self->_maximumRows;
        else
          v34 = v41;
      }
      -[NSArray subarrayWithRange:](*p_contentByRows, "subarrayWithRange:", 0, v34);
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue();
      effectiveContentByRows = self->_effectiveContentByRows;
      self->_effectiveContentByRows = v42;

      if (v35 != v34)
      {
        -[NSArray subarrayWithRange:](*p_contentByRows, "subarrayWithRange:", v34, v35 - v34);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v56[0] = MEMORY[0x1E0C809B0];
        v56[1] = 3221225472;
        v56[2] = __FlattenContentRows_block_invoke;
        v56[3] = &unk_1E3E675F8;
        v57 = v45;
        v46 = v45;
        objc_msgSend(v44, "enumerateObjectsUsingBlock:", v56);

        v47 = (NSMutableArray *)objc_msgSend(v46, "mutableCopy");
        effectiveDroppedContent = self->_effectiveDroppedContent;
        self->_effectiveDroppedContent = v47;

      }
    }
    else
    {
      self->_overflowType = 0;
      objc_storeStrong((id *)&self->_effectiveContentByRows, *p_contentByRows);
      v49 = self->_effectiveDroppedContent;
      self->_effectiveDroppedContent = 0;
    }

    self->_effectiveSelectable = self->_selectable;
    -[PKPassTileGroupView _updateSubviewsAnimated:](self, v7);
  }

}

uint64_t __67__PKPassTileGroupView_setPass_passView_groupTile_context_animated___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _BOOL4 v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v24;
  void *v25;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 424);
  v6 = a2;
  v7 = a3;
  v8 = v4;
  if (PKEqualObjects())
  {
    objc_msgSend(v6, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v9;
    if (v11 == v10)
    {
      objc_msgSend(v8, "passState");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v13, "hash") == v5)
      {
        v12 = 1;
      }
      else
      {
        objc_msgSend(v11, "stateTypeDefaultV2");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "title");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "valueTypeForeignReference");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "foreignReferenceType");

        if (v17)
        {
          v18 = 1;
        }
        else
        {
          objc_msgSend(v14, "body");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "valueTypeForeignReference");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v19, "foreignReferenceType");

          if (v20)
          {
            v18 = 1;
          }
          else
          {
            objc_msgSend(v14, "footer");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "valueTypeForeignReference");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v22, "foreignReferenceType");

            v18 = v24 != 0;
          }

        }
        v12 = !v18;
      }

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
  if (self->_contentInset.left != a3.left
    || self->_contentInset.top != a3.top
    || self->_contentInset.right != a3.right
    || self->_contentInset.bottom != a3.bottom)
  {
    self->_contentInset = a3;
    -[PKPassTileGroupView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_tileViewTapped:(id)a3
{
  id v4;
  void *v5;
  PKDashboardTileContextViewController *v6;
  PKPass *pass;
  void *v8;
  void *v9;
  PKDashboardTileContextViewController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  id WeakRetained;
  PKPass *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  id v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint8_t v36[8];
  _QWORD v37[4];
  id v38;
  _QWORD aBlock[4];
  id v40;
  _BYTE *v41;
  _BYTE buf[24];
  char v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "content");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v4, "overflowType") == 2)
    {
      if (self)
      {
        v6 = [PKDashboardTileContextViewController alloc];
        pass = self->_pass;
        -[PKPassTile metadata](self->_groupTile, "metadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[PKDashboardTileContextViewController initWithTileContext:forPass:groupID:passView:overridesMaximumRows:](v6, "initWithTileContext:forPass:groupID:passView:overridesMaximumRows:", 1, pass, v9, self->_passView, 1);

        -[PKPassTile state](self->_groupTile, "state");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stateTypeGroup");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "header");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKDashboardTileContextViewController setTitle:](v10, "setTitle:", v13);

        -[PKPassTileGroupView _displayViewController:](self, v10);
      }
    }
    else
    {
      objc_msgSend(v5, "state");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D671D0];
      objc_msgSend(v14, "actions");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "effectiveActionForActions:", v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v5, "metadata");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v5, "supportsPaymentPassAction:", v17) & 1) != 0)
        {
          switch(objc_msgSend(v17, "type"))
          {
            case 3:
              -[PKPassTileGroupView _performOpenExternalURLAction:](self, v17);
              break;
            case 4:
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              if (-[PKPass passType](self->_pass, "passType") == PKPassTypeSecureElement)
              {
                v23 = self->_pass;
                if (v23 && WeakRetained)
                {
                  *(_QWORD *)buf = 0;
                  *(_QWORD *)&buf[8] = buf;
                  *(_QWORD *)&buf[16] = 0x2020000000;
                  v43 = 0;
                  aBlock[0] = MEMORY[0x1E0C809B0];
                  aBlock[1] = 3221225472;
                  aBlock[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke;
                  aBlock[3] = &unk_1E3E67580;
                  v41 = buf;
                  v31 = v4;
                  v40 = v31;
                  v24 = _Block_copy(aBlock);
                  v25 = objc_alloc(MEMORY[0x1E0D66CA8]);
                  v37[0] = MEMORY[0x1E0C809B0];
                  v37[1] = 3221225472;
                  v37[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_2;
                  v37[3] = &unk_1E3E61590;
                  v32 = v24;
                  v38 = v32;
                  v26 = (void *)objc_msgSend(v25, "initWithBlock:", v37);
                  PKLogFacilityTypeGetObject();
                  v27 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_WORD *)v36 = 0;
                    _os_log_impl(&dword_19D178000, v27, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: requesting SE action for PKPaymentPassActionTypeVehicleFunction.", v36, 2u);
                  }

                  v33[0] = MEMORY[0x1E0C809B0];
                  v33[1] = 3221225472;
                  v33[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_87;
                  v33[3] = &unk_1E3E669E0;
                  v28 = v26;
                  v34 = v28;
                  v29 = v32;
                  v35 = v29;
                  objc_msgSend(WeakRetained, "passTileGroupView:executeSEActionForPass:tile:withCompletion:", self, v23, v5, v33);
                  if (!*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
                    objc_msgSend(v31, "setInActionState:animated:", 1, 1);

                  _Block_object_dispose(buf, 8);
                }
              }
              else
              {
                v23 = 0;
              }

              break;
            case 7:
              -[PKPassTileGroupView _performDisplayAuxiliaryPassInformationItemAction:](self, v17);
              break;
            case 8:
              -[PKPassTileGroupView _performDisplayTileContextAction:](self, v17);
              break;
            case 9:
              objc_msgSend(v4, "viewImageActionView");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[PKPassTileGroupView _performViewImageAction:sourceImageView:](self, v17, v30);

              break;
            default:
              break;
          }
        }
        else
        {
          PKLogFacilityTypeGetObject();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v18, "identifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "stateIdentifier");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v20;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v21;
            _os_log_impl(&dword_19D178000, v19, OS_LOG_TYPE_DEFAULT, "PKPassTileGroupView: ignoring tap on tile (%@: %@) due to unsupported action.", buf, 0x16u);

          }
        }

      }
    }
  }

}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "setInActionState:animated:", 0, 1);
}

void __39__PKPassTileGroupView__tileViewTapped___block_invoke_2(uint64_t a1)
{
  _QWORD block[4];
  id v2;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__PKPassTileGroupView__tileViewTapped___block_invoke_3;
  block[3] = &unk_1E3E61590;
  v2 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __39__PKPassTileGroupView__tileViewTapped___block_invoke_87(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "invalidate");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_tileViewPinched:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  objc_msgSend(v12, "scale");
  v4 = v12;
  if (v5 > 0.0)
  {
    objc_msgSend(v12, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "content");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "state");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x1E0D671D0];
    objc_msgSend(v8, "actions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "effectiveActionForActions:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v11, "type") == 9)
      -[PKPassTileGroupView _tileViewTapped:](self, "_tileViewTapped:", v6);

    v4 = v12;
  }

}

void __35__PKPassTileGroupView__contextMenu__block_invoke(id *a1)
{
  id WeakRetained;
  uint64_t v3;
  BOOL v4;
  id v5;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    v3 = objc_msgSend(a1[4], "type");
    if (v3 == 8)
    {
      -[PKPassTileGroupView _performDisplayTileContextAction:](a1[5], a1[4]);
    }
    else if (v3 == 7)
    {
      -[PKPassTileGroupView _performDisplayAuxiliaryPassInformationItemAction:](a1[5], a1[4]);
    }
    else
    {
      v4 = v3 == 3;
      WeakRetained = v5;
      if (!v4)
        goto LABEL_10;
      -[PKPassTileGroupView _performOpenExternalURLAction:](a1[5], a1[4]);
    }
    WeakRetained = v5;
  }
LABEL_10:

}

- (PKPass)pass
{
  return self->_pass;
}

- (UIEdgeInsets)contentInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_contentInset.top;
  left = self->_contentInset.left;
  bottom = self->_contentInset.bottom;
  right = self->_contentInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (PKPassTileGroupViewDelegate)delegate
{
  return (PKPassTileGroupViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pass, 0);
  objc_storeStrong((id *)&self->_itemViewsByRows, 0);
  objc_storeStrong((id *)&self->_effectiveDroppedContent, 0);
  objc_storeStrong((id *)&self->_effectiveContentByRows, 0);
  objc_storeStrong((id *)&self->_contentByRows, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_groupTile, 0);
  objc_storeStrong((id *)&self->_passView, 0);
}

@end
