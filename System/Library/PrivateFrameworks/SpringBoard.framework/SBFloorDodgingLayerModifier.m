@implementation SBFloorDodgingLayerModifier

- (id)model
{
  SBDodgingModel *overridingModel;
  objc_super v4;

  overridingModel = self->_overridingModel;
  if (overridingModel)
    return overridingModel;
  v4.receiver = self;
  v4.super_class = (Class)SBFloorDodgingLayerModifier;
  -[SBFloorDodgingLayerModifier model](&v4, sel_model);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)modelForInvalidatedModel:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  SBFloorDodgingLayerModifier *v16;

  v4 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __56__SBFloorDodgingLayerModifier_modelForInvalidatedModel___block_invoke;
  v14 = &unk_1E8EB0908;
  v15 = v4;
  v16 = self;
  v5 = v4;
  objc_msgSend(v5, "modelByModifyingModelWithBlock:", &v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloorDodgingLayerModifier _modelByPerformingDodgingInModel:](self, "_modelByPerformingDodgingInModel:", v6, v11, v12, v13, v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = v5;
  v9 = v7;

  return v9;
}

void __56__SBFloorDodgingLayerModifier_modelForInvalidatedModel___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "identifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "preferenceForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "preferredSize");
        v12 = v11;
        v14 = v13;
        objc_msgSend(v10, "minimumSize");
        if (v15 >= v12)
          v12 = v15;
        if (v16 >= v14)
          v14 = v16;
        objc_msgSend(v10, "preferredCenter");
        v18 = v17;
        v20 = v19;
        objc_msgSend(v3, "setSize:forIdentifier:", v9, v12, v14);
        objc_msgSend(v3, "setCenter:forIdentifier:", v9, v18, v20);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v6);
  }

}

- (id)framesForIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBFloorDodgingLayerModifier model](self, "model");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v2, "sizeForIdentifier:", v10, (_QWORD)v14);
        objc_msgSend(v2, "centerForIdentifier:", v10);
        SBRectWithSize();
        UIRectCenteredAboutPoint();
        v18 = v10;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v11;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addEntriesFromDictionary:", v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)zOrderedIdentifiers
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E40];
  -[SBFloorDodgingLayerModifier model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bs_reverse");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "orderedSetWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)animationBehaviorModeForIdentifier:(id)a3
{
  return 2;
}

- (id)layoutSettingsForIdentifier:(id)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E08]), "initWithDefaultValues");
}

- (id)_modelByPerformingDodgingInModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  uint64_t j;
  uint64_t v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  long double v47;
  id v48;
  id v49;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  SBFloorDodgingLayerModifier *v55;
  id v56;
  uint64_t v57;
  id obj;
  uint64_t v59;
  uint64_t v60;
  double v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[2];
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[5];
  _BYTE v76[128];
  _BYTE v77[128];
  _BYTE v78[128];
  uint64_t v79;

  v79 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFloorDodgingLayerModifier _modelByClampingOverhangingIdentifiers:](self, "_modelByClampingOverhangingIdentifiers:", v4);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v52, "mutableCopy");
  -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v5, 15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __64__SBFloorDodgingLayerModifier__modelByPerformingDodgingInModel___block_invoke;
  v75[3] = &unk_1E8EB0930;
  v75[4] = self;
  objc_msgSend(v6, "bs_map:", v75);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  v74 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v72;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v72 != v12)
          objc_enumerationMutation(v9);
        -[SBFloorDodgingLayerModifier _modelsByResizingOverlappingIdentifiers:](self, "_modelsByResizingOverlappingIdentifiers:", *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObjectsFromArray:", v14);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v71, v78, 16);
    }
    while (v11);
  }
  v51 = v9;

  v53 = v4;
  -[SBFloorDodgingLayerModifier _framesForIdentifiersInModel:](self, "_framesForIdentifiersInModel:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v69 = 0u;
  v70 = 0u;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
  if (v16)
  {
    v17 = v16;
    v55 = self;
    v56 = 0;
    v18 = *(_QWORD *)v68;
    v54 = *(_QWORD *)v68;
    do
    {
      v19 = 0;
      v57 = v17;
      do
      {
        if (*(_QWORD *)v68 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * v19);
        -[SBFloorDodgingLayerModifier _framesForIdentifiersInModel:](self, "_framesForIdentifiersInModel:", v20, v51);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFloorDodgingLayerModifier _identifierIfAnyIllegallyOutsideContentViewBounds:model:](self, "_identifierIfAnyIllegallyOutsideContentViewBounds:model:", v21, v20);
        v22 = objc_claimAutoreleasedReturnValue();
        v66[0] = 0;
        v66[1] = 0;
        -[SBFloorDodgingLayerModifier _identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:](self, "_identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:", v21, v20, v66, 0);
        v23 = objc_claimAutoreleasedReturnValue();
        if (!(v22 | v23))
        {
          v59 = v23;
          v60 = v22;
          v64 = 0u;
          v65 = 0u;
          v62 = 0u;
          v63 = 0u;
          objc_msgSend(v20, "identifiers");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
          if (v25)
          {
            v26 = v25;
            v27 = *(_QWORD *)v63;
            v28 = 0.0;
            do
            {
              for (j = 0; j != v26; ++j)
              {
                v61 = v28;
                if (*(_QWORD *)v63 != v27)
                  objc_enumerationMutation(v24);
                v30 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * j);
                objc_msgSend(v15, "objectForKey:", v30);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "CGRectValue");
                v33 = v32;
                v35 = v34;

                objc_msgSend(v21, "objectForKey:", v30);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "CGRectValue");
                v38 = v37;
                v40 = v39;

                UIRectGetCenter();
                v42 = v41;
                v44 = v43;
                UIRectGetCenter();
                v47 = v61 + hypot(v45 - v42, v46 - v44);
                v28 = v47 + hypot(v38 - v33, v40 - v35);
              }
              v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v62, v76, 16);
            }
            while (v26);
          }

          if (BSFloatLessThanFloat())
          {
            v48 = v20;

            v56 = v48;
          }
          v18 = v54;
          self = v55;
          v17 = v57;
          v23 = v59;
          v22 = v60;
        }

        ++v19;
      }
      while (v19 != v17);
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v77, 16);
    }
    while (v17);
  }
  else
  {
    v56 = 0;
  }

  v49 = v56;
  return v49;
}

uint64_t __64__SBFloorDodgingLayerModifier__modelByPerformingDodgingInModel___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_modelByClampingOverhangingIdentifiers:", a2);
}

- (id)_modelsByTranslatingOverlappingIdentifiers:(id)a3 allowedEdges:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  double width;
  double height;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  id v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  _QWORD v48[4];
  id v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  _QWORD v54[4];
  id v55;
  double v56;
  CGFloat v57;
  double v58;
  double v59;
  _QWORD v60[4];
  id v61;
  double v62;
  CGFloat v63;
  double v64;
  double v65;
  _QWORD v66[2];
  __int128 v67;
  double v68[3];
  id v69;
  _QWORD v70[2];
  CGRect v71;
  CGRect v72;

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[SBFloorDodgingLayerModifier _framesForIdentifiersInModel:](self, "_framesForIdentifiersInModel:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  *(_OWORD *)v68 = 0u;
  v66[0] = 0;
  v66[1] = 0;
  -[SBFloorDodgingLayerModifier _identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:](self, "_identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:", v7, v6, v66, &v67);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[SBFloorDodgingLayerModifier spaceBetweenIdentifiers](self, "spaceBetweenIdentifiers");
    v10 = v9;
    -[SBFloorDodgingLayerModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "dodgingAxisMask");

    objc_msgSend(v7, "objectForKey:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "CGRectValue");
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    v71.origin.x = v15;
    v71.origin.y = v17;
    v71.size.width = v19;
    v71.size.height = v21;
    v72 = CGRectInset(v71, -(v10 * 0.5), -(v10 * 0.5));
    x = v72.origin.x;
    y = v72.origin.y;
    width = v72.size.width;
    height = v72.size.height;
    v26 = (void *)objc_opt_new();
    if ((a4 & 2) != 0 && SBDodgingAxisMaskContainsAxis(v12, 0))
    {
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke;
      v60[3] = &unk_1E8EB0958;
      v62 = *(double *)&v67 - width;
      v63 = y;
      v64 = width;
      v65 = height;
      v61 = v8;
      objc_msgSend(v6, "modelByModifyingModelWithBlock:", v60);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v27, a4 & 0xFFFFFFFFFFFFFFF7);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v28);

    }
    v29 = v10 * 0.5;
    if ((a4 & 8) != 0 && SBDodgingAxisMaskContainsAxis(v12, 0))
    {
      v54[0] = MEMORY[0x1E0C809B0];
      v54[1] = 3221225472;
      v54[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_2;
      v54[3] = &unk_1E8EB0958;
      v56 = v29 + *(double *)&v67 + v68[0];
      v57 = y;
      v58 = width;
      v59 = height;
      v55 = v8;
      objc_msgSend(v6, "modelByModifyingModelWithBlock:", v54);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v30, a4 & 0xFFFFFFFFFFFFFFFDLL);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v31);

    }
    if ((a4 & 1) != 0 && SBDodgingAxisMaskContainsAxis(v12, 1))
    {
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_3;
      v48[3] = &unk_1E8EB0958;
      v50 = x;
      v51 = *((double *)&v67 + 1) - height;
      v52 = width;
      v53 = height;
      v49 = v8;
      objc_msgSend(v6, "modelByModifyingModelWithBlock:", v48);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v32, a4 & 0xFFFFFFFFFFFFFFFBLL);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v33);

    }
    if ((a4 & 4) != 0 && SBDodgingAxisMaskContainsAxis(v12, 1))
    {
      v39 = MEMORY[0x1E0C809B0];
      v40 = 3221225472;
      v41 = __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_4;
      v42 = &unk_1E8EB0958;
      v44 = x;
      v45 = v29 + *((double *)&v67 + 1) + v68[1];
      v46 = width;
      v47 = height;
      v43 = v8;
      objc_msgSend(v6, "modelByModifyingModelWithBlock:", &v39);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloorDodgingLayerModifier _modelsByTranslatingOverlappingIdentifiers:allowedEdges:](self, "_modelsByTranslatingOverlappingIdentifiers:allowedEdges:", v34, a4 & 0xFFFFFFFFFFFFFFFELL, v39, v40, v41, v42);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "addObjectsFromArray:", v35);

    }
    if (objc_msgSend(v26, "count"))
    {
      v36 = v26;
    }
    else
    {
      v70[0] = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
      v36 = (id)objc_claimAutoreleasedReturnValue();
    }
    v37 = v36;

  }
  else
  {
    v69 = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v69, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v37;
}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(_QWORD *)(a1 + 32));

}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(_QWORD *)(a1 + 32));

}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(_QWORD *)(a1 + 32));

}

void __87__SBFloorDodgingLayerModifier__modelsByTranslatingOverlappingIdentifiers_allowedEdges___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  UIRectGetCenter();
  objc_msgSend(v3, "setCenter:forIdentifier:", *(_QWORD *)(a1 + 32));

}

- (id)_modelByClampingOverhangingIdentifiers:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD v16[10];

  v4 = a3;
  -[SBFloorDodgingLayerModifier contentViewBounds](self, "contentViewBounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBFloorDodgingLayerModifier spaceBetweenIdentifiers](self, "spaceBetweenIdentifiers");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __70__SBFloorDodgingLayerModifier__modelByClampingOverhangingIdentifiers___block_invoke;
  v16[3] = &unk_1E8E9DE60;
  v16[4] = self;
  v16[5] = v6;
  v16[6] = v8;
  v16[7] = v10;
  v16[8] = v12;
  v16[9] = v13;
  objc_msgSend(v4, "modelByModifyingModelWithBlock:", v16);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __70__SBFloorDodgingLayerModifier__modelByClampingOverhangingIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  char v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v3, "identifiers", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "preferenceForIdentifier:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "canBePositionedOutsideContainerBounds");

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v3, "sizeForIdentifier:", v9);
          SBRectWithSize();
          objc_msgSend(v3, "centerForIdentifier:", v9);
          UIRectCenteredAboutPoint();
          UIRectGetCenter();
          objc_msgSend(v3, "setCenter:forIdentifier:", v9);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

}

- (id)_modelsByResizingOverlappingIdentifiers:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  int v16;
  uint64_t v17;
  int v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  void *v33;
  void *v35;
  double v36;
  double v37;
  _QWORD v38[4];
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  _QWORD v44[4];
  id v45;
  double v46;
  double v47;
  double v48;
  double v49;
  _QWORD v50[4];
  id v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  id v58;
  _QWORD v59[3];

  v59[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBFloorDodgingLayerModifier _framesForIdentifiersInModel:](self, "_framesForIdentifiersInModel:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0.0;
  v57 = 0.0;
  -[SBFloorDodgingLayerModifier _identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:](self, "_identifierIfAnyIllegallyClippingOtherIdentifiers:model:intersectionSize:intersectingFrame:", v5, v4, &v56, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v35 = v5;
    objc_msgSend(v5, "objectForKey:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "CGRectValue");
    v36 = v9;
    v37 = v8;
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_opt_new();
    -[SBFloorDodgingLayerModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "minimumSize");

    v16 = 0;
    v17 = MEMORY[0x1E0C809B0];
    do
    {
      v18 = v16 & 0x7FFFFFFD;
      v19 = v56;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        if (v18 == 1)
          v20 = v19;
        else
          v20 = 0.0;
        v50[0] = v17;
        v50[1] = 3221225472;
        v50[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke;
        v50[3] = &unk_1E8EB0958;
        v52 = v37 + v20;
        v53 = v36;
        v54 = v11 - v19;
        v55 = v13;
        v51 = v6;
        objc_msgSend(v4, "modelByModifyingModelWithBlock:", v50);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v21);

      }
      v22 = v16 & 0x7FFFFFFE;
      v23 = v57;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        if (v22 == 2)
          v24 = v23;
        else
          v24 = 0.0;
        v44[0] = v17;
        v44[1] = 3221225472;
        v44[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_2;
        v44[3] = &unk_1E8EB0958;
        v46 = v37;
        v47 = v36 + v24;
        v48 = v11;
        v49 = v13 - v23;
        v45 = v6;
        objc_msgSend(v4, "modelByModifyingModelWithBlock:", v44);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v25);

      }
      v26 = v56;
      if (v18 == 1)
        v27 = v56;
      else
        v27 = 0.0;
      if (v22 == 2)
        v28 = v57;
      else
        v28 = 0.0;
      v29 = v13 - v57;
      if (BSFloatGreaterThanOrEqualToFloat())
      {
        v30 = v11 - v26;
        if (BSFloatGreaterThanOrEqualToFloat())
        {
          v38[0] = v17;
          v38[1] = 3221225472;
          v38[2] = __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_3;
          v38[3] = &unk_1E8EB0958;
          v40 = v37 + v27;
          v41 = v36 + v28;
          v42 = v30;
          v43 = v29;
          v39 = v6;
          objc_msgSend(v4, "modelByModifyingModelWithBlock:", v38);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v31);

        }
      }
      ++v16;
    }
    while (v16 != 4);
    if (objc_msgSend(v14, "count"))
    {
      v32 = v14;
    }
    else
    {
      v59[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 1);
      v32 = (id)objc_claimAutoreleasedReturnValue();
    }
    v33 = v32;

    v5 = v35;
  }
  else
  {
    v58 = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v58, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v33;
}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke(double *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *((_QWORD *)a1 + 4);
  v4 = a1[7];
  v5 = a1[8];
  v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((_QWORD *)a1 + 4));

}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_2(double *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *((_QWORD *)a1 + 4);
  v4 = a1[7];
  v5 = a1[8];
  v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((_QWORD *)a1 + 4));

}

void __71__SBFloorDodgingLayerModifier__modelsByResizingOverlappingIdentifiers___block_invoke_3(double *a1, void *a2)
{
  uint64_t v3;
  double v4;
  double v5;
  id v6;

  v3 = *((_QWORD *)a1 + 4);
  v4 = a1[7];
  v5 = a1[8];
  v6 = a2;
  objc_msgSend(v6, "setSize:forIdentifier:", v3, v4, v5);
  UIRectGetCenter();
  objc_msgSend(v6, "setCenter:forIdentifier:", *((_QWORD *)a1 + 4));

}

- (id)_framesForIdentifiersInModel:(id)a3
{
  SBDodgingModel *v4;
  SBDodgingModel *v5;
  SBDodgingModel *overridingModel;
  SBDodgingModel *v7;
  void *v8;
  SBDodgingModel *v9;

  v4 = (SBDodgingModel *)a3;
  v5 = self->_overridingModel;
  overridingModel = self->_overridingModel;
  self->_overridingModel = v4;
  v7 = v4;

  -[SBFloorDodgingLayerModifier framesForIdentifiers](self, "framesForIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = self->_overridingModel;
  self->_overridingModel = v5;

  return v8;
}

- (id)_identifierIfAnyIllegallyOutsideContentViewBounds:(id)a3 model:(id)a4
{
  id v5;
  uint64_t v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  uint64_t i;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  id v33;
  _QWORD rect1[5];
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[SBFloorDodgingLayerModifier contentViewBounds](self, "contentViewBounds");
  rect1[0] = v6;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBFloorDodgingLayerModifier spaceBetweenIdentifiers](self, "spaceBetweenIdentifiers");
  v14 = v13;
  memset(&rect1[1], 0, 32);
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v5, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &rect1[1], v38, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)rect1[3];
    v19 = -v14;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)rect1[3] != v18)
          objc_enumerationMutation(v15);
        v21 = *(void **)(rect1[2] + 8 * i);
        -[SBFloorDodgingLayerModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "canBePositionedOutsideContainerBounds");

        if ((v23 & 1) == 0)
        {
          objc_msgSend(v5, "objectForKey:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "CGRectValue");
          v26 = v25;
          v28 = v27;
          v30 = v29;
          v32 = v31;

          v40.origin.x = v26;
          v40.origin.y = v28;
          v40.size.width = v30;
          v40.size.height = v32;
          v42 = CGRectInset(v40, v19, v19);
          *(_QWORD *)&v41.origin.x = rect1[0];
          v41.origin.y = v8;
          v41.size.width = v10;
          v41.size.height = v12;
          if (!CGRectContainsRect(v41, v42))
          {
            v33 = v21;
            goto LABEL_12;
          }
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &rect1[1], v38, 16);
      if (v17)
        continue;
      break;
    }
  }
  v33 = 0;
LABEL_12:

  return v33;
}

- (id)_identifierIfAnyIllegallyClippingOtherIdentifiers:(id)a3 model:(id)a4 intersectionSize:(CGSize *)a5 intersectingFrame:(CGRect *)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  void *v14;
  char *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  double v36;
  double v37;
  uint64_t v38;
  CGFloat *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  CGFloat *v44;
  id v45;
  float v46;
  float v47;
  CGSize *v49;
  CGRect *v50;
  CGFloat *v51;
  char *v52;
  id v53;
  double dx;
  id obj;
  uint64_t v56;
  uint64_t v57;
  double v58;
  double v59;
  double v60;
  double v61;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  v71 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  -[SBFloorDodgingLayerModifier spaceBetweenIdentifiers](self, "spaceBetweenIdentifiers");
  v13 = v12;
  objc_msgSend(v11, "identifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (char *)malloc_type_malloc(32 * objc_msgSend(v14, "count"), 0x1000040E0EAB150uLL);

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  objc_msgSend(v11, "identifiers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
  if (v57)
  {
    v49 = a5;
    v50 = a6;
    v16 = 0;
    v56 = *(_QWORD *)v67;
    v60 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v61 = *MEMORY[0x1E0C9D628];
    v58 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v59 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    dx = v13 * -0.5;
    v51 = (CGFloat *)(v15 + 16);
    v52 = v15;
    v53 = v10;
    while (2)
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v67 != v56)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * i);
        objc_msgSend(v10, "allKeys");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "containsObject:", v18);

        if (v20)
        {
          objc_msgSend(v10, "objectForKey:", v18);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "CGRectValue");
          v23 = v22;
          v25 = v24;
          v27 = v26;
          v29 = v28;

          v72.origin.x = v23;
          v72.origin.y = v25;
          v72.size.width = v27;
          v72.size.height = v29;
          v73 = CGRectInset(v72, dx, dx);
          y = v73.origin.y;
          x = v73.origin.x;
          height = v73.size.height;
          width = v73.size.width;
          v30 = v60;
          v31 = v61;
          v32 = v61;
          v33 = v60;
          v34 = v58;
          v35 = v59;
          v36 = v59;
          v37 = v58;
          if (v16)
          {
            v38 = 0;
            v39 = v51;
            v37 = v58;
            v36 = v59;
            v33 = v60;
            v32 = v61;
            while (1)
            {
              v31 = *(v39 - 2);
              v30 = *(v39 - 1);
              v35 = *v39;
              v34 = v39[1];
              objc_msgSend(v11, "identifiers");
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "objectAtIndex:", v38);
              v41 = (void *)objc_claimAutoreleasedReturnValue();

              -[SBFloorDodgingLayerModifier preferenceForIdentifier:](self, "preferenceForIdentifier:", v18);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "excludedDodgingIdentifiers");
              v43 = (void *)objc_claimAutoreleasedReturnValue();

              if ((objc_msgSend(v43, "containsObject:", v41) & 1) == 0)
              {
                v74.origin.y = y;
                v74.origin.x = x;
                v74.size.height = height;
                v74.size.width = width;
                v78.origin.x = v31;
                v78.origin.y = v30;
                v78.size.width = v35;
                v78.size.height = v34;
                v75 = CGRectIntersection(v74, v78);
                v32 = v75.origin.x;
                v33 = v75.origin.y;
                v36 = v75.size.width;
                v37 = v75.size.height;
                if ((BSFloatLessThanFloat() & 1) != 0 || BSFloatLessThanFloat())
                {
                  v33 = v60;
                  v32 = v61;
                  v37 = v58;
                  v36 = v59;
                }
                v76.origin.x = v32;
                v76.origin.y = v33;
                v76.size.width = v36;
                v76.size.height = v37;
                if (!CGRectIsNull(v76))
                  break;
              }

              ++v38;
              v39 += 4;
              if (v16 == v38)
              {
                v34 = v58;
                v35 = v59;
                v30 = v60;
                v31 = v61;
                goto LABEL_17;
              }
            }

LABEL_17:
            v15 = v52;
            v10 = v53;
          }
          v77.origin.x = v32;
          v77.origin.y = v33;
          v77.size.width = v36;
          v77.size.height = v37;
          if (!CGRectIsNull(v77))
          {
            v45 = v18;
            if (v49)
            {
              v46 = v36;
              v47 = v37;
              v49->width = ceilf(v46);
              v49->height = ceilf(v47);
            }
            if (v50)
            {
              v50->origin.x = v31;
              v50->origin.y = v30;
              v50->size.width = v35;
              v50->size.height = v34;
            }
            goto LABEL_27;
          }
          v44 = (CGFloat *)&v15[32 * v16];
          *v44 = x;
          v44[1] = y;
          ++v16;
          v44[2] = width;
          v44[3] = height;
        }
      }
      v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v70, 16);
      if (v57)
        continue;
      break;
    }
  }
  v45 = 0;
LABEL_27:

  free(v15);
  return v45;
}

- (SBDodgingModel)overridingModel
{
  return self->_overridingModel;
}

- (void)setOverridingModel:(id)a3
{
  objc_storeStrong((id *)&self->_overridingModel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridingModel, 0);
}

@end
