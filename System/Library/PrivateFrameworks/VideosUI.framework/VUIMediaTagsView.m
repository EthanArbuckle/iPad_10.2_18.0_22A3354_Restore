@implementation VUIMediaTagsView

uint64_t __39__VUIMediaTagsView_updateWithMetadata___block_invoke(uint64_t a1)
{
  id WeakRetained;
  __CFString **v3;
  void *v4;
  __CFString **v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  v3 = &VUIMediaTagKeyCommonSenseRating;
  if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyCommonSenseRating))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyCommonSenseImage))
      goto LABEL_14;
    v3 = &VUIMediaTagKeyTomatoPercentage;
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyTomatoPercentage))
    {
      v4 = *(void **)(a1 + 40);
      v5 = &VUIMediaTagKeyTomatoFreshnessImage;
      goto LABEL_6;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyTomatoFreshnessImage)
      || (v3 = &VUIMediaTagKeyImmersiveImage,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyImmersiveImage))
      || (v3 = &VUIMediaTagKeyImmersiveText,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyImmersiveText))
      || (v3 = &VUIMediaTagKeyHighMotionImage,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyHighMotionImage))
      || (v3 = &VUIMediaTagKeyHighMotionText,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyHighMotionText))
      || (v3 = &VUIMediaTagKeyLiveTextBadge,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyLiveTextBadge))
      || (v3 = &VUIMediaTagKeyTimeTextBadge,
          objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeyTimeTextBadge)))
    {
LABEL_14:
      v4 = *(void **)(a1 + 40);
      v6 = *v3;
      goto LABEL_15;
    }
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", VUIMediaTagKeySeparator))
    {
      v8 = 1;
      goto LABEL_17;
    }
    v10 = *(_QWORD *)(a1 + 80);
    if (v10)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v10 - 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v12)
        goto LABEL_26;
      objc_msgSend(v12, "lastObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v7)
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v7);
      goto LABEL_27;
    }
LABEL_26:
    v7 = 0;
    if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
    {
      v8 = 0;
      goto LABEL_16;
    }
LABEL_27:
    if (v10 + 1 >= (unint64_t)objc_msgSend(*(id *)(a1 + 48), "count")
      || (objc_msgSend(*(id *)(a1 + 48), "objectAtIndexedSubscript:", v10 + 1),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v13),
          v8 = objc_claimAutoreleasedReturnValue(),
          (id)v8,
          v13,
          v8))
    {
      v8 = objc_msgSend(WeakRetained, "elementsArePlacedOnIndividualLines") ^ 1;
    }
    goto LABEL_16;
  }
  v4 = *(void **)(a1 + 40);
  v5 = &VUIMediaTagKeyCommonSenseImage;
LABEL_6:
  v6 = *v5;
LABEL_15:
  objc_msgSend(v4, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;
LABEL_16:

LABEL_17:
  return v8;
}

- (void)updateWithMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char *j;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  uint64_t v21;
  id v22;
  id v23;
  void *v24;
  char v25;
  char isKindOfClass;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  char v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  id obj;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  char v58;
  id v59;
  id v60;
  id v61;
  void *v62;
  void *v63;
  id v64;
  void *v65;
  void *v66;
  unsigned int (**v67)(void);
  VUIMediaTagsView *val;
  void *v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _QWORD aBlock[4];
  id v75;
  id v76;
  void *v77;
  uint64_t *v78;
  _QWORD *v79;
  id v80[2];
  id location;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  uint64_t v86;
  id *v87;
  uint64_t v88;
  uint64_t (*v89)(uint64_t, uint64_t);
  void (*v90)(uint64_t);
  id v91;
  _QWORD v92[5];
  id v93;
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  val = self;
  v66 = v4;
  if (!objc_msgSend(v4, "count"))
  {
    -[VUIMediaTagsView viewsMap](self, "viewsMap");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allValues");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "makeObjectsPerformSelector:", sel_removeFromSuperview);

    -[VUIMediaTagsView setViewsMap:](self, "setViewsMap:", MEMORY[0x1E0C9AA70]);
    -[VUIMediaTagsView setGroupedSubviews:](self, "setGroupedSubviews:", MEMORY[0x1E0C9AA60]);
    -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "userInterfaceStyle");

    -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", v42);
    goto LABEL_113;
  }
  v63 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  -[VUIMediaTagsView viewsMap](self, "viewsMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v62 = (void *)objc_msgSend(v6, "mutableCopy");

  -[VUIMediaTagsView viewsMap](self, "viewsMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v65 = v8;
  objc_msgSend(v8, "removeObjectForKey:", VUIMediaTagKeySeparator);
  -[VUIMediaTagsView _removeSeparatorsFromGroupsIfNeeded:](self, "_removeSeparatorsFromGroupsIfNeeded:", 1);
  v92[0] = 0;
  v92[1] = v92;
  v92[2] = 0x3032000000;
  v92[3] = __Block_byref_object_copy__16;
  v92[4] = __Block_byref_object_dispose__16;
  v93 = 0;
  v86 = 0;
  v87 = (id *)&v86;
  v88 = 0x3032000000;
  v89 = __Block_byref_object_copy__16;
  v90 = __Block_byref_object_dispose__16;
  v91 = 0;
  v82 = 0u;
  v83 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "groupedKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();

  v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  if (!v56)
  {
    v58 = 0;
    goto LABEL_104;
  }
  v58 = 0;
  v55 = *(_QWORD *)v83;
  do
  {
    for (i = 0; i != v56; ++i)
    {
      if (*(_QWORD *)v83 != v55)
        objc_enumerationMutation(obj);
      v69 = *(void **)(*((_QWORD *)&v82 + 1) + 8 * i);
      v61 = (id)objc_opt_new();
      for (j = 0; (unint64_t)j < objc_msgSend(v69, "count", obj); ++j)
      {
        objc_msgSend(v69, "objectAtIndexedSubscript:", j);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "objectForKeyedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          objc_msgSend(v62, "removeObject:", v11);
          objc_initWeak(&location, val);
          aBlock[0] = MEMORY[0x1E0C809B0];
          aBlock[1] = 3221225472;
          aBlock[2] = __39__VUIMediaTagsView_updateWithMetadata___block_invoke;
          aBlock[3] = &unk_1E9F9F848;
          objc_copyWeak(v80, &location);
          v14 = v11;
          v75 = v14;
          v15 = v66;
          v80[1] = j;
          v64 = v15;
          v76 = v15;
          v77 = v69;
          v78 = &v86;
          v79 = v92;
          v67 = (unsigned int (**)(void))_Block_copy(aBlock);
          if (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeySeparator))
          {
            -[VUIMediaTagsView tagsViewLayout](val, "tagsViewLayout");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "textLayout");
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
            {
              v18 = -[VUIMediaTagsView _newLabelAsSubview:textLayout:](val, "_newLabelAsSubview:textLayout:", 0, v17);
              goto LABEL_33;
            }
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
            {
              v18 = -[VUIMediaTagsView _newLabelAsSubview:withAttributedString:textLayout:](val, "_newLabelAsSubview:withAttributedString:textLayout:", 0, v13, v17);
              goto LABEL_33;
            }
            v20 = v12;
LABEL_34:

            goto LABEL_35;
          }
          if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyTimeTextBadge) & 1) != 0
            || objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyLiveTextBadge))
          {
            if (v67[2]())
            {
              if (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyLiveTextBadge))
              {
                -[VUIMediaTagsView tagsViewLayout](val, "tagsViewLayout");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "liveTextBadgeLayout");
              }
              else
              {
                -[VUIMediaTagsView tagsViewLayout](val, "tagsViewLayout");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v19, "timeTextBadgeLayout");
              }
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v18 = -[VUIMediaTagsView _newTextBadgeViewAsSubview:layout:withString:](val, "_newTextBadgeViewAsSubview:layout:withString:", v12, v17, v13);
LABEL_33:
              v20 = (id)v18;

              goto LABEL_34;
            }
            v20 = v12;
LABEL_35:
            v12 = v20;
            if (v20)
            {
LABEL_36:
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v22 = v12;
                v23 = v13;
                objc_msgSend(v22, "expirationDate");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                v25 = objc_msgSend(v23, "isEqual:", v24);

                if ((v25 & 1) == 0)
                {
                  objc_msgSend(v22, "setExpirationDate:", v23);
                  objc_msgSend(v22, "setHidden:", 0);
                  goto LABEL_39;
                }
                goto LABEL_50;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v60 = v12;
                objc_opt_class();
                isKindOfClass = objc_opt_isKindOfClass();
                v59 = v13;
                if ((isKindOfClass & 1) != 0)
                {
                  objc_msgSend(v60, "vuiAttributedText");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v27, "string");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();

                  -[VUIMediaTagsView _textLayoutForKey:](val, "_textLayoutForKey:", v14);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributedStringWithAttributedString:view:updateTextColor:", v59, val, 0);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v59, "string");
                  v31 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  objc_msgSend(v60, "vuiText");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VUIMediaTagsView _textLayoutForKey:](val, "_textLayoutForKey:", v14);
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "attributedStringWithString:view:", v59, val);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  v31 = v59;
                }
                v23 = v31;

                if ((objc_msgSend(v23, "isEqual:", v28) & 1) == 0)
                {
                  objc_msgSend(v60, "setVuiAttributedText:", v30);
                  v58 = 1;
                }
                objc_msgSend(v60, "setLabelName:", v14);

                goto LABEL_50;
              }
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v32 = v12;
                v23 = v13;
                objc_msgSend(v32, "image");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                v34 = objc_msgSend(v23, "isEqual:", v33);

                if ((v34 & 1) == 0)
                {
                  objc_msgSend(v32, "setImage:", v23);
                  objc_msgSend(v32, "setHidden:", 0);
LABEL_39:
                  v58 = 1;
                }
LABEL_50:

              }
              if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyCommonSenseRating) & 1) == 0
                && !objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyCommonSenseImage))
              {
                if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyTomatoFreshnessImage) & 1) != 0
                  || (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyTomatoPercentage) & 1) != 0)
                {
                  v37 = 102;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyImmersiveImage) & 1) != 0
                       || (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyImmersiveText) & 1) != 0)
                {
                  v37 = 109;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyHighMotionImage) & 1) != 0
                       || (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyHighMotionText) & 1) != 0)
                {
                  v37 = 110;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyComingSoonText) & 1) != 0)
                {
                  v37 = 105;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyContentUnavailabilityText) & 1) != 0)
                {
                  v37 = 107;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyBrandLinkButton) & 1) != 0)
                {
                  v37 = 108;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyAvailabilityText) & 1) != 0
                       || (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyAvailabilityImage) & 1) != 0)
                {
                  v37 = 103;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyEpisodeNumberTitle) & 1) != 0)
                {
                  v37 = 104;
                }
                else if ((objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeySeparator) & 1) != 0)
                {
                  v37 = 100;
                }
                else
                {
                  if (!objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyGroupActivityImage))
                    goto LABEL_59;
                  v37 = 106;
                }
                objc_msgSend(v12, "setTag:", v37);
                goto LABEL_59;
              }
              objc_msgSend(v12, "setTag:", 101);
              if (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyCommonSenseImage))
              {
                objc_msgSend(v64, "objectForKeyedSubscript:", VUIMediaTagKeyCommonSenseImage);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIMediaTagsView setCommonSenseLightImage:](val, "setCommonSenseLightImage:", v35);

                objc_msgSend(v64, "objectForKeyedSubscript:", VUIMediaTagKeyCommonSenseDarkImage);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[VUIMediaTagsView setCommonSenseDarkImage:](val, "setCommonSenseDarkImage:", v36);

              }
LABEL_59:
              objc_msgSend(v63, "setObject:forKeyedSubscript:", v12, v14);
              objc_msgSend(v61, "addObject:", v12);
            }
LABEL_60:

            objc_destroyWeak(v80);
            objc_destroyWeak(&location);
            goto LABEL_61;
          }
          if (v12)
            goto LABEL_36;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
          {
            -[VUIMediaTagsView _textLayoutForKey:](val, "_textLayoutForKey:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[VUIMediaTagsView _newLabelAsSubview:textLayout:](val, "_newLabelAsSubview:textLayout:", 0, v17);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0 || !v67[2]())
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0 && v67[2]())
              {
                v38 = -[VUIMediaTagsView _newImageViewAsSubview:](val, "_newImageViewAsSubview:", -[VUIMediaTagsView _shouldApplyTintColor:forImage:](val, "_shouldApplyTintColor:forImage:", v14, v13));
              }
              else
              {
                if (!objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyRentalExpiration)
                  || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
                {
                  if (objc_msgSend(v14, "isEqualToString:", VUIMediaTagKeyBrandLinkButton))
                  {
                    v12 = v13;
                    -[VUIMediaTagsView vui_addSubview:oldView:](val, "vui_addSubview:oldView:", v12, 0);
                    goto LABEL_36;
                  }
                  v12 = 0;
                  goto LABEL_60;
                }
                v38 = -[VUIMediaTagsView _newRentalExpirationlabel:exisitingLabel:](val, "_newRentalExpirationlabel:exisitingLabel:", v13, 0);
              }
              v20 = (id)v38;
              goto LABEL_35;
            }
            -[VUIMediaTagsView _textLayoutForKey:](val, "_textLayoutForKey:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = -[VUIMediaTagsView _newLabelAsSubview:withAttributedString:textLayout:](val, "_newLabelAsSubview:withAttributedString:textLayout:", 0, v13, v17);
          }
          v20 = (id)v21;
          goto LABEL_34;
        }
        if (v12)
          objc_msgSend(v12, "removeFromSuperview");
        objc_msgSend(v63, "setObject:forKeyedSubscript:", 0, v11);
LABEL_61:

      }
      if (objc_msgSend(v61, "count"))
      {
        objc_msgSend(v54, "addObject:", v61);
        objc_storeStrong(v87 + 5, v61);
      }

    }
    v56 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v82, v95, 16);
  }
  while (v56);
LABEL_104:

  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v43 = v62;
  v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
  if (v44)
  {
    v45 = *(_QWORD *)v71;
    do
    {
      for (k = 0; k != v44; ++k)
      {
        if (*(_QWORD *)v71 != v45)
          objc_enumerationMutation(v43);
        v47 = *(_QWORD *)(*((_QWORD *)&v70 + 1) + 8 * k);
        -[VUIMediaTagsView viewsMap](val, "viewsMap", obj);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "objectForKeyedSubscript:", v47);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "removeFromSuperview");

      }
      v44 = objc_msgSend(v43, "countByEnumeratingWithState:objects:count:", &v70, v94, 16);
    }
    while (v44);
  }

  v50 = (void *)objc_msgSend(v63, "copy");
  -[VUIMediaTagsView setViewsMap:](val, "setViewsMap:", v50);

  -[VUIMediaTagsView setGroupedSubviews:](val, "setGroupedSubviews:", v54);
  _Block_object_dispose(&v86, 8);

  _Block_object_dispose(v92, 8);
  -[VUIMediaTagsView vuiTraitCollection](val, "vuiTraitCollection");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = objc_msgSend(v51, "userInterfaceStyle");

  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](val, "_updateImageAppearanceWithUserInterfaceStyle:", v52);
  if ((v58 & 1) != 0)
  {
    -[VUIMediaTagsView invalidateIntrinsicContentSize](val, "invalidateIntrinsicContentSize");
    -[VUIMediaTagsView vui_setNeedsLayout](val, "vui_setNeedsLayout");
  }
LABEL_113:

}

double __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke(uint64_t a1, void *a2, char a3, int a4, int a5, double a6, double a7, double a8)
{
  void *v14;
  id v16;
  id WeakRetained;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v27;
  double v28;
  int isKindOfClass;
  int v30;
  double v31;
  double v32;
  id v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double MidY;
  void *v44;
  int v45;
  double v46;
  void *v47;
  int v48;
  uint64_t v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  void *v58;
  _QWORD *v59;
  void *v60;
  id v61;
  int v62;
  double v63;
  void *v64;
  double v65;
  double v66;
  uint64_t v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  id v78;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  void *v85;
  int v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  uint64_t v95;
  int v96;
  char v97;
  uint64_t v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  void *v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  void *v110;
  double v111;
  double v112;
  void *v113;
  double v114;
  double v115;
  double v116;
  void *v117;
  int v118;
  double v119;
  double v120;
  double v121;
  id v122;
  double v123;
  uint64_t v124;
  uint64_t v125;
  double v126;
  double v127;
  double v128;
  void *v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  double v134;
  uint64_t v135;
  double v136;
  void *v137;
  void *v138;
  double v139;
  double v140;
  uint64_t v141;
  double v142;
  uint64_t v143;
  double v144;
  uint64_t v145;
  double v146;
  double *v147;
  void *v148;
  void *v149;
  double MinY;
  uint64_t v151;
  uint64_t v152;
  double v153;
  double *v154;
  id v155;
  uint64_t v156;
  void *v157;
  double v159;
  void *v160;
  void *v161;
  double v162;
  double v163;
  void *v164;
  double v165;
  double v166;
  uint64_t v167;
  double v168;
  uint64_t v169;
  double v170;
  uint64_t v171;
  uint64_t v172;
  id obj;
  double v174;
  double v175;
  double v176;
  double v177;
  int v178;
  double v179;
  double v180;
  double v181;
  double v182;
  CGRect v183;
  CGRect v184;
  CGRect v185;
  CGRect v186;

  v14 = a2;
  v16 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 136));
  v19 = *(double *)(a1 + 144);
  v18 = *(double *)(a1 + 152);
  if (objc_msgSend(v16, "tag") == 110)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "tagsViewLayout");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "badgeMaxHeight");
      v18 = v21;

      v19 = 0.0;
    }
  }
  objc_msgSend(v16, "vui_sizeThatFits:", v19, v18);
  v24 = *MEMORY[0x1E0C9D820];
  v25 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  if (v22 != *MEMORY[0x1E0C9D820] || v23 != v25)
  {
    v27 = v22;
    v28 = v23;
    v178 = a5;
    v181 = a6;
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    v30 = isKindOfClass;
    if (a7 <= 0.0)
      v31 = v28;
    else
      v31 = a7;
    if (a8 > 0.0)
      v27 = v31 * a8;
    if (*(_BYTE *)(a1 + 160))
    {
      if ((isKindOfClass & 1) != 0)
      {
        if ((a3 & 1) == 0
          || !*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40)
          || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v97 = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
          v96 = 1;
          goto LABEL_64;
        }
        v32 = v31;
        v33 = v16;
        objc_msgSend(v33, "baselineHeight");
        v34 = v27;
        v36 = v35;
        VUIRoundValue();
        v38 = v37;
        objc_msgSend(v33, "vuiFont");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "capHeight");
        v41 = v40;

        v42 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        MidY = CGRectGetMidY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32));
        objc_msgSend(WeakRetained, "tagsViewLayout");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = objc_msgSend(v44, "alignBadgeVertically");

        if (objc_msgSend(v33, "requiresMoreThanOneLineForTextWidth:", v34))
        {
          v31 = v32;
          if (CGRectGetHeight(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)) < v32)
          {
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v32 * 0.5
                                                                        + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                                + 8)
                                                                                    + 24)
                                                                        - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                                + 8)
                                                                                    + 56)
                                                                        * 0.5;
            goto LABEL_116;
          }
          *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectGetMidY(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                                                 + 32))
                                                                       + v32 * -0.5;
LABEL_125:
          v27 = v34;
LABEL_131:

          v96 = 0;
          v97 = 1;
LABEL_64:
          objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v14);
          if ((v97 & 1) != 0)
          {
LABEL_91:
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v14);
            v145 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
            v46 = *(double *)(v145 + 24);
            v146 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
            *(double *)(v145 + 24) = v27 + v181 + v46;
            v147 = *(double **)(*(_QWORD *)(a1 + 48) + 8);
            v147[4] = v46;
            v147[5] = v146;
            v147[6] = v27;
            v147[7] = v31;
            if ((v30 & 1) == 0)
            {
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "addObject:", v16);
              v148 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40);
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v46, v146, v27, v31);
              v149 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v148, "addObject:", v149);

            }
            v186.origin.x = v46;
            v186.origin.y = v146;
            v186.size.width = v27;
            v186.size.height = v31;
            MinY = CGRectGetMinY(v186);
            v151 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
            if (v96)
            {
              *(double *)(v151 + 24) = MinY;
              v152 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              v153 = v31;
            }
            else
            {
              if (MinY >= *(double *)(v151 + 24))
                MinY = *(double *)(v151 + 24);
              *(double *)(v151 + 24) = MinY;
              v152 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
              v153 = *(double *)(v152 + 24);
              if (v153 < v31)
                v153 = v31;
            }
            *(double *)(v152 + 24) = v153;
            if (*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) == v16)
            {
              v154 = *(double **)(*(_QWORD *)(a1 + 112) + 8);
              v154[4] = v46;
              v154[5] = v146;
              v154[6] = v27;
              v154[7] = v31;
              if (!v96)
              {
LABEL_105:
                objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "addObject:", v16, v172);
                goto LABEL_106;
              }
            }
            else if (!v96)
            {
              goto LABEL_105;
            }
            if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40), "count", v172))
            {
              v155 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v156 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
              v157 = *(void **)(v156 + 40);
              *(_QWORD *)(v156 + 40) = v155;

              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 40), "addObject:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 40));
            }
            goto LABEL_105;
          }
          goto LABEL_68;
        }
        if (v45)
        {
          v140 = v41 * 0.5 + v36 - v41 + v42;
          if (v140 > MidY)
          {
            v141 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            v142 = v140 - MidY + *(double *)(v141 + 40);
LABEL_115:
            *(double *)(v141 + 40) = v142;
            v31 = v32;
LABEL_116:
            v27 = v34;
            if (!*(_BYTE *)(a1 + 161))
            {
              if (a5)
                VUIRectWithFlippedOriginRelativeToBoundingRect();
              objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:");
            }
            goto LABEL_131;
          }
          v167 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v168 = MidY - v140 + *(double *)(v167 + 24);
        }
        else
        {
          if (v36 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56))
          {
            objc_msgSend(v33, "frame");
            v142 = fabs(v38) + v166;
            v141 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
            goto LABEL_115;
          }
          v168 = fabs(v38);
          v167 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        }
        *(double *)(v167 + 24) = v168;
        v31 = v32;
        goto LABEL_125;
      }
      if (objc_msgSend(v16, "tag") == 108)
      {
        v59 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
LABEL_30:
        *v59 = 0;
LABEL_68:
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                + 24);
        objc_msgSend(WeakRetained, "tagsViewLayout");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v99, "badgeMargin");
        v101 = v100;

        objc_msgSend(WeakRetained, "tagsViewLayout");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "textLayout");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "margin");
        v104 = v27;
        v106 = v105;

        if (v101 >= v106)
          v107 = v101;
        else
          v107 = v106;
        v108 = fmax(v107, 2.0);
        objc_msgSend(WeakRetained, "tagsViewLayout");
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v109, "textLayout");
        v110 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v110, "margin");
        v112 = v111;

        objc_msgSend(WeakRetained, "tagsViewLayout");
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v113, "badgeMargin");
        v115 = v114;

        if (v112 >= v115)
          v116 = v112;
        else
          v116 = v115;
        v27 = v104;
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v108
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                + 24)
                                                                    + fmax(v116, 2.0)
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                + 24);
LABEL_75:
        v96 = 1;
        goto LABEL_91;
      }
      v98 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (a4)
      {
        if (v98)
          goto LABEL_68;
      }
      else if (v98)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v121 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          v122 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
          objc_msgSend(v122, "baselineHeight");
          VUIRoundValue();
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v121 + fabs(v123);

        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                              + 8)
                                                                                  + 40);
          v143 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
          v144 = *(double *)(v143 + 24);
          v59 = (_QWORD *)(v143 + 24);
          if (v27 + v144 > *(double *)(a1 + 144))
            goto LABEL_30;
        }
      }
LABEL_90:
      v96 = 0;
      goto LABEL_91;
    }
    objc_msgSend(WeakRetained, "tagsViewLayout");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isWrappingAllowed");

    if (v48 && v27 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) > *(double *)(a1 + 144))
    {
      v49 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      v50 = *(void **)(v49 + 40);
      *(_QWORD *)(v49 + 40) = 0;

      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "removeAllObjects");
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "removeAllObjects");
      if ((v30 & 1) == 0)
      {
        if (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tag") == 103)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "vui_sizeThatFits:", *(double *)(a1 + 144), *(double *)(a1 + 152));
          v125 = v124;
          v127 = v126;
          v128 = fmax(v126, v31);
          objc_msgSend(WeakRetained, "tagsViewLayout");
          v129 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v129, "textLayout");
          v130 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v130, "margin");
          v132 = v128 + v131;
          objc_msgSend(WeakRetained, "tagsViewLayout");
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "badgeMargin");
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v132
                                                                      + v134
                                                                      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 24);

          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = 0;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 24);
          v135 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
          *(_QWORD *)(v135 + 48) = v125;
          *(double *)(v135 + 56) = v127;
          v136 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32)
               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48);
          objc_msgSend(WeakRetained, "tagsViewLayout");
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v137, "textLayout");
          v138 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v138, "margin");
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v136 + v139;

          if (!*(_BYTE *)(a1 + 161))
          {
            if (v178)
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setFrame:");
          }
          v169 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
          v170 = *(double *)(v169 + 40);
          v171 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          if (v170 < v127 + *(double *)(v171 + 24))
            v170 = v127 + *(double *)(v171 + 24);
          *(double *)(v169 + 40) = v170;
        }
        else
        {
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
          v159 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56);
          objc_msgSend(WeakRetained, "tagsViewLayout");
          v160 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v160, "textLayout");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "margin");
          v163 = v159 + v162;
          objc_msgSend(WeakRetained, "tagsViewLayout");
          v164 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v164, "badgeMargin");
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v163
                                                                      + v165
                                                                      + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56)
                                                                                              + 8)
                                                                                  + 24);

        }
        goto LABEL_75;
      }
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
      v51 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      objc_msgSend(WeakRetained, "tagsViewLayout");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "textLayout");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "margin");
      v55 = v51 + v54;
      objc_msgSend(WeakRetained, "tagsViewLayout");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v56, "badgeMargin");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v55
                                                                  + v57
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                              + 24);

      HIDWORD(v172) = v30;
      if (objc_msgSend(v16, "tag") == 100)
      {
        v179 = 0.0;
        v58 = WeakRetained;
        if (!*(_BYTE *)(a1 + 161))
          objc_msgSend(v16, "removeFromSuperview");
        LODWORD(v172) = 1;
        v27 = 0.0;
      }
      else
      {
        v179 = v31;
        v58 = WeakRetained;
        if (!*(_BYTE *)(a1 + 161)
          && objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tag") == 100)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "removeFromSuperview");
        }
        LODWORD(v172) = 1;
      }
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                              + 24);
      if ((v30 & 1) == 0)
      {
        objc_msgSend(WeakRetained, "tagsViewLayout");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        v118 = objc_msgSend(v117, "alignBadgeVertically");

        if (v118 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
        {
          v119 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 40);
          VUIRoundValue();
          v96 = 0;
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v119 + v120 * 0.5;
          goto LABEL_91;
        }
        goto LABEL_90;
      }
      v179 = v31;
      HIDWORD(v172) = v30;
      if (*(_BYTE *)(a1 + 161)
        || objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "tag") != 100
        || (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "superview"),
            v60 = (void *)objc_claimAutoreleasedReturnValue(),
            v60,
            v60))
      {
        v58 = WeakRetained;
      }
      else
      {
        v58 = WeakRetained;
        objc_msgSend(WeakRetained, "addSubview:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
      }
      LODWORD(v172) = 0;
    }
    v61 = v16;
    obj = v14;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v14);
    v174 = v27;
    v62 = objc_msgSend(v61, "requiresMoreThanOneLineForTextWidth:", v27);
    objc_msgSend(v61, "baselineHeight");
    v182 = v63;
    objc_msgSend(v61, "vuiFont");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "capHeight");
    v66 = v65;

    if (!objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
    {
LABEL_62:

      WeakRetained = v58;
      v31 = v179;
      v27 = v174;
      v14 = obj;
      v96 = v172;
      LOBYTE(v30) = BYTE4(v172);
      goto LABEL_91;
    }
    v67 = 0;
    v175 = v66 * 0.5;
    v176 = v182 - v66;
    v177 = v179 * 0.5;
    v180 = v25;
    while (1)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "objectAtIndexedSubscript:", v67, v172);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 40), "objectAtIndexedSubscript:", v67);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "CGRectValue");
      v71 = v70;
      v73 = v72;
      v75 = v74;
      v77 = v76;

      v78 = v61;
      if (v75 == v24 && v77 == v25)
        goto LABEL_61;
      v80 = v24;
      v81 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      VUIRoundValue();
      v83 = v82;
      v183.origin.x = v71;
      v183.origin.y = v73;
      v183.size.width = v75;
      v183.size.height = v77;
      v84 = CGRectGetMidY(v183);
      objc_msgSend(v58, "tagsViewLayout");
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      v86 = objc_msgSend(v85, "alignBadgeVertically");

      if (v62)
      {
        v184.origin.x = v71;
        v184.origin.y = v73;
        v184.size.width = v75;
        v184.size.height = v77;
        if (CGRectGetHeight(v184) < v179)
        {
          v87 = v177 + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v88 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 56) * -0.5;
          goto LABEL_52;
        }
        v185.origin.x = v71;
        v185.origin.y = v73;
        v185.size.width = v75;
        v185.size.height = v77;
        v91 = CGRectGetMidY(v185) - v177;
      }
      else
      {
        if (v86)
        {
          v89 = v175 + v176 + v81;
          if (v89 > v84)
          {
            v90 = v73 + v89 - v84;
            goto LABEL_53;
          }
          v95 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
          v91 = v84 - v89 + *(double *)(v95 + 24);
          goto LABEL_60;
        }
        if (v182 > v77)
        {
          objc_msgSend(v78, "frame", v182);
          v87 = fabs(v83);
LABEL_52:
          v90 = v87 + v88;
LABEL_53:
          v24 = v80;
          v25 = v180;
          if (!*(_BYTE *)(a1 + 161))
          {
            if (v178)
            {
              VUIRectWithFlippedOriginRelativeToBoundingRect();
              v71 = v92;
              v75 = v93;
              v77 = v94;
            }
            objc_msgSend(v68, "setFrame:", v71, v90, v75, v77);
          }
          goto LABEL_61;
        }
        v91 = fabs(v83);
      }
      v95 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
LABEL_60:
      *(double *)(v95 + 24) = v91;
      v24 = v80;
      v25 = v180;
LABEL_61:

      if (++v67 >= (unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 40), "count"))
        goto LABEL_62;
    }
  }
  v46 = *MEMORY[0x1E0C9D648];
LABEL_106:
  VUIRoundValue();
  VUICeilValue();

  return v46;
}

void __38__VUIMediaTagsView__firstLabelSubview__block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }

}

- (CGSize)vui_layoutSubviews:(CGSize)a3 computationOnly:(BOOL)a4
{
  _BOOL8 v4;
  double height;
  double width;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGSize result;

  v4 = a4;
  height = a3.height;
  width = a3.width;
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "maxWidth");
  v10 = v9;

  if (v10 > 0.0)
  {
    -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "maxWidth");
    v13 = v12;

    if (width >= v13)
      width = v13;
  }
  v16.receiver = self;
  v16.super_class = (Class)VUIMediaTagsView;
  -[VUIMediaTagsView vui_layoutSubviews:computationOnly:](&v16, sel_vui_layoutSubviews_computationOnly_, v4, width, height);
  -[VUIMediaTagsView _layoutSubviewsForSize:computationOnly:](self, "_layoutSubviewsForSize:computationOnly:", v4, width, height);
  result.height = v15;
  result.width = v14;
  return result;
}

- (double)vui_baselineOffsetFromBottom
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VUIMediaTagsView _firstLabelSubview](self, "_firstLabelSubview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "vui_baselineOffsetFromBottom");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (NSDictionary)viewsMap
{
  return self->_viewsMap;
}

- (VUIMediaTagsViewLayout)tagsViewLayout
{
  return self->_tagsViewLayout;
}

- (void)setViewsMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 440);
}

- (void)setGroupedSubviews:(id)a3
{
  objc_storeStrong((id *)&self->_groupedSubviews, a3);
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (VUIMediaTagsView)initWithFrame:(CGRect)a3 layout:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  VUIMediaTagsView *v11;
  VUIMediaTagsView *v12;
  id *p_tagsViewLayout;
  NSDictionary *viewsMap;
  NSArray *groupedSubviews;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id location;
  objc_super v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[2];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v36.receiver = self;
  v36.super_class = (Class)VUIMediaTagsView;
  v11 = -[VUIMediaTagsView initWithFrame:](&v36, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    p_tagsViewLayout = (id *)&v11->_tagsViewLayout;
    objc_storeStrong((id *)&v11->_tagsViewLayout, a4);
    viewsMap = v12->_viewsMap;
    v12->_viewsMap = (NSDictionary *)MEMORY[0x1E0C9AA70];

    groupedSubviews = v12->_groupedSubviews;
    v12->_groupedSubviews = (NSArray *)MEMORY[0x1E0C9AA60];

    v12->_isSelected = 0;
    -[VUIMediaTagsView setVuiClipsToBounds:](v12, "setVuiClipsToBounds:", 1);
    objc_msgSend(*p_tagsViewLayout, "compositingFilter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      objc_msgSend(*p_tagsViewLayout, "compositingFilter");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIMediaTagsView layer](v12, "layer");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCompositingFilter:", v17);

    }
    -[VUIMediaTagsView setAccessibilityTraits:](v12, "setAccessibilityTraits:", *MEMORY[0x1E0DC46C0] | *MEMORY[0x1E0DC4678]);
    objc_initWeak(&location, v12);
    v39[0] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke;
    v33[3] = &unk_1E9F99F98;
    objc_copyWeak(&v34, &location);
    -[VUIMediaTagsView vui_registerForTraitChanges:withHandler:](v12, "vui_registerForTraitChanges:withHandler:", v19, v33);

    v38 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v38, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v20;
    v31[1] = 3221225472;
    v31[2] = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_2;
    v31[3] = &unk_1E9F99F98;
    objc_copyWeak(&v32, &location);
    -[VUIMediaTagsView vui_registerForTraitChanges:withHandler:](v12, "vui_registerForTraitChanges:withHandler:", v21, v31);

    v37 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v37, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v20;
    v27 = 3221225472;
    v28 = __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_3;
    v29 = &unk_1E9F99F98;
    objc_copyWeak(&v30, &location);
    -[VUIMediaTagsView vui_registerForTraitChanges:withHandler:](v12, "vui_registerForTraitChanges:withHandler:", v22, &v26);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter", v26, v27, v28, v29);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "addObserver:selector:name:object:", v12, sel_contrastSettingsDidChange, *MEMORY[0x1E0DC4508], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addObserver:selector:name:object:", v12, sel_transparencySettingsDidChange, *MEMORY[0x1E0DC45B8], 0);

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (NSArray)groupedSubviews
{
  return self->_groupedSubviews;
}

- (double)firstBaselineOffsetFromTop
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[VUIMediaTagsView _firstLabelSubview](self, "_firstLabelSubview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "vuiBaselineHeight");
    v5 = v4;
  }
  else
  {
    v5 = 0.0;
  }

  return v5;
}

- (void)_updateImageAppearanceWithUserInterfaceStyle:(unint64_t)a3
{
  VUIMediaTagsView *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  VUIMediaTagsView *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v4 = self;
  v32 = *MEMORY[0x1E0C80C00];
  -[VUIMediaTagsViewLayout badgeTintColor](self->_tagsViewLayout, "badgeTintColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (UIAccessibilityDarkerSystemColorsEnabled())
  {
    -[VUIMediaTagsViewLayout highContrastBadgeTintColor](v4->_tagsViewLayout, "highContrastBadgeTintColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      -[VUIMediaTagsView _accessibilityHigherContrastTintColorForColor:](v4, "_accessibilityHigherContrastTintColorForColor:", v5);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v8;

    v5 = v9;
  }
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    objc_msgSend(v5, "colorByRemovingTransparency");
    v10 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v10;
  }
  if (v4->_isSelected)
  {
    -[VUIMediaTagsViewLayout highlightColor](v4->_tagsViewLayout, "highlightColor");
    v11 = objc_claimAutoreleasedReturnValue();

    v24 = (void *)v11;
  }
  else
  {
    v24 = v5;
  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[VUIMediaTagsView subviews](v4, "subviews");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    v25 = v4;
    v26 = a3;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v18 = v17;
          if (objc_msgSend(v18, "tag") == 101)
          {
            if (a3 == 2)
              -[VUIMediaTagsView commonSenseLightImage](v4, "commonSenseLightImage");
            else
              -[VUIMediaTagsView commonSenseDarkImage](v4, "commonSenseDarkImage");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "setImage:", v20);
            goto LABEL_28;
          }
          if (objc_msgSend(v18, "tag") != 102)
          {
            -[VUIMediaTagsView viewsMap](v4, "viewsMap");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "allKeysForObject:", v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            if (v20 && objc_msgSend(v20, "count"))
            {
              objc_msgSend(v20, "firstObject");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "image");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = -[VUIMediaTagsView _shouldApplyTintColor:forImage:](v4, "_shouldApplyTintColor:forImage:", v21, v22);

              if (v23)
                objc_msgSend(v18, "_setTintColor:", v24);

              v4 = v25;
              a3 = v26;
            }
LABEL_28:

          }
          continue;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

}

- (BOOL)_shouldApplyTintColor:(id)a3 forImage:(id)a4
{
  id v5;
  id v6;
  int v7;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", VUIMediaTagKeyRatingImage))
  {
    LOBYTE(v7) = objc_msgSend(v6, "renderingMode") == 2;
  }
  else if ((objc_msgSend(v5, "isEqualToString:", VUIMediaTagKeyCommonSenseImage) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", VUIMediaTagKeyCommonSenseDarkImage) & 1) != 0
         || (objc_msgSend(v5, "isEqualToString:", VUIMediaTagKeyTomatoFreshnessImage) & 1) != 0)
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    v7 = objc_msgSend(v5, "isEqualToString:", VUIMediaTagKeyItunesExtras) ^ 1;
  }

  return v7;
}

- (void)_removeSeparatorsFromGroupsIfNeeded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  unint64_t v28;
  void *v29;
  void *v30;
  id v31;

  v3 = a3;
  if (-[VUIMediaTagsView elementsArePlacedOnIndividualLines](self, "elementsArePlacedOnIndividualLines") || v3)
  {
    -[VUIMediaTagsView viewsMap](self, "viewsMap");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (id)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v31, "objectForKeyedSubscript:", VUIMediaTagKeySeparator);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "removeFromSuperview");
    objc_msgSend(v31, "setObject:forKeyedSubscript:", 0, VUIMediaTagKeySeparator);
    v6 = (void *)objc_msgSend(v31, "copy");
    -[VUIMediaTagsView setViewsMap:](self, "setViewsMap:", v6);

    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v7, "mutableCopy");

    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = 0;
      do
      {
        -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectAtIndexedSubscript:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        v15 = (void *)objc_opt_new();
        -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "objectAtIndexedSubscript:", v11);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "count");

        if (v18)
        {
          v19 = 0;
          do
          {
            -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectAtIndexedSubscript:", v11);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v19);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v22, "tag") == 100)
            {
              objc_msgSend(v22, "removeFromSuperview");
              objc_msgSend(v15, "addIndex:", v19);
            }

            ++v19;
            -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectAtIndexedSubscript:", v11);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "count");

          }
          while (v19 < v25);
        }
        v26 = objc_msgSend(v15, "count");
        if (v26 <= objc_msgSend(v14, "count"))
          objc_msgSend(v14, "removeObjectsAtIndexes:", v15);
        objc_msgSend(v8, "setObject:atIndexedSubscript:", v14, v11);

        ++v11;
        -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "count");

      }
      while (v11 < v28);
    }
    v29 = (void *)objc_msgSend(v8, "copy");
    -[VUIMediaTagsView setGroupedSubviews:](self, "setGroupedSubviews:", v29);

    -[VUIMediaTagsView vui_setNeedsLayout](self, "vui_setNeedsLayout");
  }
}

- (id)_newImageViewAsSubview:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  v5 = (void *)objc_opt_new();
  if (v3)
  {
    -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "badgeTintColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setTintColor:", v7);

  }
  objc_msgSend(v5, "setVuiContentMode:", 1);
  -[VUIMediaTagsView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, 0);
  return v5;
}

- (CGSize)_layoutSubviewsForSize:(CGSize)a3 computationOnly:(BOOL)a4
{
  CGFloat height;
  void *v6;
  void *v7;
  CGFloat *v8;
  __int128 v9;
  void *v10;
  char v11;
  double v12;
  unint64_t v13;
  double v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  double v43;
  void *v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  int v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double MaxX;
  void *v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  double v73;
  void *v74;
  double v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  void *v99;
  void *v100;
  int v101;
  double v102;
  double v103;
  double v104;
  double v105;
  void *v106;
  int v107;
  int v108;
  double v109;
  double *v110;
  double v111;
  double v112;
  double v113;
  double v114;
  uint64_t v115;
  void *v116;
  double v117;
  double v118;
  double (**v119)(void *, id);
  void *v120;
  int v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t j;
  double (**v125)(void *, id);
  void *v126;
  id v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t k;
  void *v131;
  double v132;
  double v133;
  void *v134;
  void *v135;
  BOOL v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  uint64_t i;
  void *v142;
  double v143;
  double v144;
  double v145;
  id v146;
  void *v147;
  _BOOL4 v148;
  int v149;
  CGFloat v150;
  void *v151;
  CGFloat v152;
  double v153;
  CGFloat v154;
  double v155;
  double v156;
  CGFloat v157;
  double v158;
  double v159;
  double v160;
  void *v161;
  double v162;
  double v163;
  double v164;
  CGFloat v165;
  double v166;
  double v167;
  CGFloat v168;
  double v169;
  CGFloat v170;
  BOOL v171;
  void *v173;
  void *v174;
  double v175;
  double v176;
  void *v177;
  double v178;
  double v179;
  double v180;
  double v181;
  void *v182;
  double v183;
  double v184;
  void *v185;
  double v186;
  double v187;
  double v188;
  double v189;
  double v190;
  double v191;
  double MaxY;
  double v193;
  double v194;
  double v195;
  double v196;
  double *v197;
  CGFloat v198;
  CGFloat v199;
  CGFloat v200;
  double v201;
  CGFloat v202;
  CGFloat v203;
  CGFloat rect1;
  CGFloat v205;
  CGFloat v206;
  _BOOL4 rect;
  CGFloat recta;
  unint64_t rect_8;
  void *rect_8a;
  int rect_16;
  void *rect_16a;
  void *rect_24;
  double (**v214)(void *, void *, _QWORD, BOOL, uint64_t, double, double, double, double, double, double, double);
  _BOOL4 v215;
  CGFloat v216;
  CGFloat v217;
  CGFloat v218;
  __int128 v219;
  CGFloat v220;
  double width;
  id obj[2];
  uint64_t obja;
  id objb;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _QWORD v233[5];
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  _QWORD aBlock[17];
  id v239[3];
  BOOL v240;
  BOOL v241;
  id location;
  uint64_t v243;
  uint64_t *v244;
  uint64_t v245;
  uint64_t (*v246)(uint64_t, uint64_t);
  void (*v247)(uint64_t);
  id v248;
  uint64_t v249;
  uint64_t *v250;
  uint64_t v251;
  uint64_t (*v252)(uint64_t, uint64_t);
  void (*v253)(uint64_t);
  id v254;
  uint64_t v255;
  uint64_t *v256;
  uint64_t v257;
  uint64_t (*v258)(uint64_t, uint64_t);
  void (*v259)(uint64_t);
  id v260;
  uint64_t v261;
  double *v262;
  uint64_t v263;
  void *v264;
  __int128 v265;
  _QWORD v266[4];
  __int128 v267;
  __int128 v268;
  _QWORD v269[5];
  id v270;
  _QWORD v271[4];
  _QWORD v272[4];
  _QWORD v273[4];
  __int128 v274;
  __int128 v275;
  _QWORD v276[5];
  id v277;
  _QWORD v278[5];
  id v279;
  _QWORD v280[5];
  id v281;
  uint64_t v282;
  double *v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  double *v287;
  uint64_t v288;
  uint64_t v289;
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  uint64_t v293;
  CGSize result;
  CGRect v295;
  CGRect v296;
  CGRect v297;
  CGRect v298;
  CGRect v299;
  CGRect v300;
  CGRect v301;
  CGRect v302;
  CGRect v303;
  CGRect v304;
  CGRect v305;
  CGRect v306;
  CGRect v307;

  v215 = a4;
  height = a3.height;
  width = a3.width;
  v293 = *MEMORY[0x1E0C80C00];
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textLayout");
  rect_24 = (void *)objc_claimAutoreleasedReturnValue();

  rect = -[VUIMediaTagsView elementsArePlacedOnIndividualLines](self, "elementsArePlacedOnIndividualLines");
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  rect_16 = objc_msgSend(v7, "orphanAvoidance");

  v286 = 0;
  v287 = (double *)&v286;
  v288 = 0x2020000000;
  v289 = 0;
  v282 = 0;
  v283 = (double *)&v282;
  v284 = 0x2020000000;
  v285 = 0;
  v280[0] = 0;
  v280[1] = v280;
  v280[2] = 0x3032000000;
  v280[3] = __Block_byref_object_copy__16;
  v280[4] = __Block_byref_object_dispose__16;
  v281 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v278[0] = 0;
  v278[1] = v278;
  v278[2] = 0x3032000000;
  v278[3] = __Block_byref_object_copy__16;
  v278[4] = __Block_byref_object_dispose__16;
  v279 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v276[0] = 0;
  v276[1] = v276;
  v276[2] = 0x3032000000;
  v276[3] = __Block_byref_object_copy__16;
  v276[4] = __Block_byref_object_dispose__16;
  v277 = 0;
  v273[0] = 0;
  v273[1] = v273;
  v273[2] = 0x4010000000;
  v273[3] = &unk_1DA394075;
  v8 = (CGFloat *)MEMORY[0x1E0C9D648];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  *(_OWORD *)obj = *MEMORY[0x1E0C9D648];
  v274 = *MEMORY[0x1E0C9D648];
  v275 = v9;
  v219 = v9;
  v272[0] = 0;
  v272[1] = v272;
  v272[2] = 0x2020000000;
  v272[3] = 0;
  v271[0] = 0;
  v271[1] = v271;
  v271[2] = 0x2020000000;
  v271[3] = 0;
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isWrappingAllowed");

  if ((v11 & 1) == 0)
  {
    -[VUIMediaTagsView totalSubviewsWidth](self, "totalSubviewsWidth");
    if (v12 <= width)
      -[VUIMediaTagsView _addGenreLabelAndSeparator](self, "_addGenreLabelAndSeparator");
    else
      -[VUIMediaTagsView _removeGenreLabelAndSeparator](self, "_removeGenreLabelAndSeparator");
  }
  v269[0] = 0;
  v269[1] = v269;
  v269[2] = 0x3032000000;
  v269[3] = __Block_byref_object_copy__16;
  v269[4] = __Block_byref_object_dispose__16;
  v270 = 0;
  v266[0] = 0;
  v266[1] = v266;
  v266[2] = 0x4010000000;
  v266[3] = &unk_1DA394075;
  v267 = *(_OWORD *)obj;
  v268 = v219;
  v261 = 0;
  v262 = (double *)&v261;
  v263 = 0x3010000000;
  v264 = &unk_1DA394075;
  v265 = *MEMORY[0x1E0C9D820];
  v255 = 0;
  v256 = &v255;
  v257 = 0x3032000000;
  v258 = __Block_byref_object_copy__16;
  v259 = __Block_byref_object_dispose__16;
  v260 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v249 = 0;
  v250 = &v249;
  v251 = 0x3032000000;
  v252 = __Block_byref_object_copy__16;
  v253 = __Block_byref_object_dispose__16;
  v254 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend((id)v256[5], "addObject:", v250[5]);
  v243 = 0;
  v244 = &v243;
  v245 = 0x3032000000;
  v246 = __Block_byref_object_copy__16;
  v247 = __Block_byref_object_dispose__16;
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v248 = (id)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke;
  aBlock[3] = &unk_1E9F9F7F8;
  objc_copyWeak(v239, &location);
  v239[1] = *(id *)&width;
  v239[2] = *(id *)&height;
  v240 = rect;
  aBlock[4] = &v286;
  aBlock[5] = v276;
  aBlock[6] = v273;
  aBlock[7] = &v282;
  v241 = v215;
  aBlock[8] = v269;
  aBlock[9] = v271;
  aBlock[10] = v272;
  aBlock[11] = v280;
  aBlock[12] = v278;
  aBlock[13] = &v261;
  aBlock[14] = v266;
  aBlock[15] = &v249;
  aBlock[16] = &v255;
  v214 = (double (**)(void *, void *, _QWORD, BOOL, uint64_t, double, double, double, double, double, double, double))_Block_copy(aBlock);
  v13 = 0;
  v218 = v8[1];
  v220 = *v8;
  v216 = v8[2];
  v217 = v8[3];
  v14 = 0.0;
  while (1)
  {
    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    rect_8 = v13;
    v16 = v13 < objc_msgSend(v15, "count");

    if (!v16)
      break;
    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectAtIndexedSubscript:", rect_8);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v236 = 0u;
    v237 = 0u;
    v234 = 0u;
    v235 = 0u;
    v19 = v18;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v234, v292, 16);
    if (v20)
    {
      v21 = 0;
      obja = *(_QWORD *)v235;
      do
      {
        v22 = 0;
        do
        {
          if (*(_QWORD *)v235 != obja)
            objc_enumerationMutation(v19);
          v23 = *(void **)(*((_QWORD *)&v234 + 1) + 8 * v22);
          objc_msgSend(v19, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = 0.0;
          if ((objc_msgSend(v23, "isHidden") & 1) != 0)
          {
LABEL_13:
            v26 = v216;
            v27 = v217;
            v29 = v218;
            v28 = v220;
            goto LABEL_49;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(rect_24, "margin");
            v25 = v30;
            v31 = objc_msgSend(v23, "tag");
            if ((unint64_t)(v31 - 101) < 0xA)
              v21 |= 0x327u >> (v31 - 101);
            -[VUIMediaTagsView bounds](self, "bounds");
            v36 = v214[2](v214, v23, v21 & 1, v24 == v23, -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"), v25, 0.0, 0.0, v32, v33, v34, v35);
            v28 = v36;
            v29 = v37;
            v26 = v38;
            v27 = v39;
            if (v215)
            {
              if (!rect_16)
                goto LABEL_49;
              v40 = (void *)v244[5];
              objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v36, v37, v38, v39);
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "setObject:forKey:", v41, v23);
              goto LABEL_48;
            }
            MaxX = CGRectGetMaxX(*(CGRect *)&v36);
            -[VUIMediaTagsView bounds](self, "bounds");
            v26 = v26 - fmax(MaxX - CGRectGetMaxX(v295), 0.0);
            if (-[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"))
            {
LABEL_33:
              -[VUIMediaTagsView bounds](self, "bounds");
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            }
            else
            {
              v59 = v28;
              v58 = v29;
              v56 = v27;
              v57 = v26;
            }
            goto LABEL_68;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v42, "badgeMargin");
            v25 = v43;

            switch(objc_msgSend(v23, "tag"))
            {
              case 'e':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v44 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "commonSenseMargin");
                v25 = v45;

                goto LABEL_38;
              case 'f':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v72 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v72, "tomatoMeterMargin");
                v25 = v73;

                goto LABEL_38;
              case 'g':
                goto LABEL_38;
              case 'm':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v74 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v74, "immersiveMargin");
                v25 = v75;

                goto LABEL_38;
              case 'n':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v76 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v76, "highMotionMargin");
                v25 = v77;

LABEL_38:
                v21 = 1;
                break;
              default:
                break;
            }
            v78 = (void *)MEMORY[0x1E0DC69B0];
            -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "badgeMaxHeight");
            v81 = v80;
            -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "scaleContentSizeValue:forTraitCollection:", v82, v81);
            v84 = v83;

            objc_msgSend(v23, "image");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "size");
            v85 = 0.0;
            if (v86 > 0.0)
            {
              objc_msgSend(v41, "size");
              if (v87 > 0.0)
              {
                objc_msgSend(v41, "size");
                v89 = v88;
                objc_msgSend(v41, "size");
                v85 = v89 / v90;
              }
            }
            -[VUIMediaTagsView bounds](self, "bounds");
            v95 = v214[2](v214, v23, v21 & 1, v24 == v23, -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"), v25, v84, v85, v91, v92, v93, v94);
            v28 = v95;
            v29 = v96;
            v26 = v97;
            v27 = v98;
            if (v215)
            {
              if (rect_16)
              {
                v99 = (void *)v244[5];
                objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGRect:", v95, v96, v97, v98);
                v100 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v99, "setObject:forKey:", v100, v23);

              }
            }
            else
            {
              v101 = -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL");
              v102 = v27;
              v103 = v26;
              v104 = v29;
              v105 = v28;
              if (v101)
              {
                -[VUIMediaTagsView bounds](self, "bounds", v28, v29, v26, v27);
                VUIRectWithFlippedOriginRelativeToBoundingRect();
              }
              objc_msgSend(v23, "setFrame:", v105, v104, v103, v102);
            }
LABEL_48:

            goto LABEL_49;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "textBadgeMargin");
            v25 = v47;

            -[VUIMediaTagsView bounds](self, "bounds");
            v28 = v214[2](v214, v23, v21 & 1, v24 == v23, -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"), v25, 0.0, 0.0, v48, v49, v50, v51);
            v29 = v52;
            v26 = v53;
            v27 = v54;
            if (v215)
              goto LABEL_49;
            v55 = -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL");
            v56 = v27;
            v57 = v26;
            v58 = v29;
            v59 = v28;
            if (v55)
            {
              -[VUIMediaTagsView bounds](self, "bounds", v28, v29, v26, v27);
              VUIRectWithFlippedOriginRelativeToBoundingRect();
            }
            goto LABEL_68;
          }
          if (objc_msgSend(v23, "tag") != 108)
            goto LABEL_13;
          -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "badgeMargin");
          v25 = v62;

          -[VUIMediaTagsView bounds](self, "bounds");
          v67 = v214[2](v214, v23, v21 & 1, v24 == v23, -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"), v25, 0.0, 0.0, v63, v64, v65, v66);
          v28 = v67;
          v29 = v68;
          v26 = v69;
          v27 = v70;
          if (!v215)
          {
            v71 = CGRectGetMaxX(*(CGRect *)&v67);
            -[VUIMediaTagsView bounds](self, "bounds");
            v26 = v26 - fmax(v71 - CGRectGetMaxX(v296), 0.0);
            if (-[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL"))
              goto LABEL_33;
            v59 = v28;
            v58 = v29;
            v56 = v27;
            v57 = v26;
LABEL_68:
            objc_msgSend(v23, "setFrame:", v59, v58, v57, v56);
          }
LABEL_49:
          -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
          v106 = (void *)objc_claimAutoreleasedReturnValue();
          v107 = objc_msgSend(v106, "alignBadgeVertically");
          if (v29 < 0.0)
            v108 = v107;
          else
            v108 = 0;

          if (v14 >= v29)
            v109 = v29;
          else
            v109 = v14;
          if (v108)
            v14 = v109;
          v110 = v262;
          v111 = v25 + v26 + v28;
          if (v262[4] >= v111)
            v111 = v262[4];
          if (width < v111)
            v111 = width;
          v112 = ceil(v111);
          v113 = 0.0;
          if (v29 >= 0.0)
            v113 = v29;
          v114 = v27 + v113;
          if (v262[5] >= v114)
            v114 = v262[5];
          v262[4] = v112;
          v110[5] = v114;
          ++v22;
        }
        while (v20 != v22);
        v115 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v234, v292, 16);
        v20 = v115;
      }
      while (v115);
    }

    -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "groupMargin");
    if (rect)
    {
      v283[3] = v117 + v283[3];

      v287[3] = 0.0;
    }
    else
    {
      v287[3] = v118 + v287[3];

    }
    v13 = rect_8 + 1;
  }
  v233[0] = MEMORY[0x1E0C809B0];
  v233[1] = 3221225472;
  v233[2] = __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke_2;
  v233[3] = &unk_1E9F9F820;
  v233[4] = &v243;
  v119 = (double (**)(void *, id))_Block_copy(v233);
  if ((rect_16 & 1) == 0
    || (unint64_t)objc_msgSend((id)v256[5], "count") < 2
    || -[VUIMediaTagsView elementsArePlacedOnIndividualLines](self, "elementsArePlacedOnIndividualLines")
    || !v215)
  {
    goto LABEL_77;
  }
  objc_msgSend((id)v256[5], "lastObject");
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v137, "count") > 1 || !objc_msgSend(v137, "count"))
  {
    *(_OWORD *)obj = *((_OWORD *)v262 + 2);

    goto LABEL_113;
  }
  objc_msgSend(v137, "firstObject");
  rect_16a = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v256[5], "objectAtIndexedSubscript:", objc_msgSend((id)v256[5], "count") - 2);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  v139 = (void *)objc_msgSend(v138, "mutableCopy");
  rect_8a = (void *)objc_msgSend(v137, "mutableCopy");
  v140 = 0;
  for (i = objc_msgSend(v138, "count") - 1; ; --i)
  {
    objc_msgSend(v138, "objectAtIndexedSubscript:", i);
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v142, "tag") != 100)
      break;
    objc_msgSend(v139, "removeLastObject");

    v140 = v142;
  }
  v146 = v142;
  objc_msgSend(v139, "removeLastObject");
  objc_msgSend(v138, "objectAtIndexedSubscript:", i);
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  v148 = objc_msgSend(v147, "tag") == 100;

  if (v148)
    objc_msgSend(v139, "removeLastObject");

  if ((unint64_t)objc_msgSend(v139, "count") <= 1)
    goto LABEL_118;
  v150 = v119[2](v119, v146);
  obj[0] = v151;
  v152 = v150;
  v154 = v153;
  v156 = v155;
  v157 = v119[2](v119, v140);
  v201 = v158;
  v199 = v159;
  v200 = v157;
  v198 = v160;
  objc_msgSend(v139, "lastObject");
  v161 = (void *)objc_claimAutoreleasedReturnValue();
  recta = v119[2](v119, v161);
  v205 = v163;
  v206 = v162;
  rect1 = v164;

  v165 = v119[2](v119, rect_16a);
  v202 = v167;
  v203 = v166;
  v168 = v165;
  v170 = v169;
  v297.origin.x = v152;
  v297.origin.y = v154;
  v297.size.width = v156;
  *(id *)&v297.size.height = obj[0];
  v305.origin.y = v218;
  v305.origin.x = v220;
  v305.size.width = v216;
  v305.size.height = v217;
  if (!CGRectEqualToRect(v297, v305))
  {
    v298.origin.x = recta;
    v298.size.width = v205;
    v298.origin.y = v206;
    v298.size.height = rect1;
    v306.origin.y = v218;
    v306.origin.x = v220;
    v306.size.width = v216;
    v306.size.height = v217;
    if (!CGRectEqualToRect(v298, v306))
    {
      v299.origin.x = v168;
      v299.origin.y = v170;
      v299.size.height = v202;
      v299.size.width = v203;
      v307.origin.y = v218;
      v307.origin.x = v220;
      v307.size.width = v216;
      v307.size.height = v217;
      v171 = CGRectEqualToRect(v299, v307);
      if (v146 && !v171)
      {
        -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
        v173 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v173, "textLayout");
        v174 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v174, "margin");
        v176 = v175;
        -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "badgeMargin");
        v179 = v178;

        objc_msgSend(rect_8a, "insertObject:atIndex:", v146, 0);
        objc_opt_class();
        v180 = v156 + 0.0;
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(rect_24, "margin");
          v180 = v180 + v181;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
            v182 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v182, "badgeMargin");
            v184 = v183;

            switch(objc_msgSend(v146, "tag"))
            {
              case 'e':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "commonSenseMargin");
                goto LABEL_133;
              case 'f':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "tomatoMeterMargin");
                goto LABEL_133;
              case 'm':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "immersiveMargin");
                goto LABEL_133;
              case 'n':
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v185 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v185, "highMotionMargin");
LABEL_133:
                v184 = v186;

                break;
              default:
                break;
            }
            v180 = v180 + v184;
          }
        }
        v187 = *(double *)obj + v176 + v179 + 0.0;
        if (v140)
        {
          objc_msgSend(rect_24, "margin");
          v189 = v188;
          objc_msgSend(rect_8a, "insertObject:atIndex:", v146, 1);
          v199 = v187;
          v200 = v180;
          v180 = v180 + v201 + v189;
        }
        v300.origin.x = v180;
        v300.origin.y = v187;
        v300.size.height = v202;
        v300.size.width = v203;
        v190 = CGRectGetMaxX(v300);
        v301.origin.x = recta;
        v301.size.width = v205;
        v301.origin.y = v206;
        v301.size.height = rect1;
        v191 = CGRectGetMaxX(v301);
        if (v190 > v191)
        {
LABEL_118:
          v149 = 0;
          *(_OWORD *)obj = *((_OWORD *)v262 + 2);
          goto LABEL_147;
        }
        v302.origin.x = 0.0;
        v302.origin.y = v187;
        v302.size.width = v156;
        *(id *)&v302.size.height = obj[0];
        MaxY = CGRectGetMaxY(v302);
        v303.origin.y = v199;
        v303.origin.x = v200;
        v303.size.width = v201;
        v303.size.height = v198;
        v193 = CGRectGetMaxY(v303);
        v304.origin.x = v180;
        v304.origin.y = v187;
        v304.size.height = v202;
        v304.size.width = v203;
        v194 = CGRectGetMaxY(v304);
        if (MaxY >= v193)
          v195 = MaxY;
        else
          v195 = v193;
        if (v195 >= v194)
          v194 = v195;
        v196 = width;
        v197 = v262;
        if (width >= v191)
          v196 = v191;
        v262[4] = v196;
        v197[5] = v194;
      }
    }
  }
  v149 = 1;
LABEL_147:

  if (!v149)
    goto LABEL_113;
LABEL_77:
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = objc_msgSend(v120, "alignBadgeVertically");

  if (v121 && !v215 && v14 < 0.0)
  {
    v231 = 0u;
    v232 = 0u;
    v229 = 0u;
    v230 = 0u;
    objb = (id)v256[5];
    v122 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v229, v291, 16);
    if (v122)
    {
      v123 = *(_QWORD *)v230;
      do
      {
        for (j = 0; j != v122; ++j)
        {
          if (*(_QWORD *)v230 != v123)
            objc_enumerationMutation(objb);
          v125 = v119;
          v126 = *(void **)(*((_QWORD *)&v229 + 1) + 8 * j);
          v225 = 0u;
          v226 = 0u;
          v227 = 0u;
          v228 = 0u;
          v127 = v126;
          v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v225, v290, 16);
          if (v128)
          {
            v129 = *(_QWORD *)v226;
            do
            {
              for (k = 0; k != v128; ++k)
              {
                if (*(_QWORD *)v226 != v129)
                  objc_enumerationMutation(v127);
                v131 = *(void **)(*((_QWORD *)&v225 + 1) + 8 * k);
                objc_msgSend(v131, "frame");
                objc_msgSend(v131, "setFrame:");
              }
              v128 = objc_msgSend(v127, "countByEnumeratingWithState:objects:count:", &v225, v290, 16);
            }
            while (v128);
          }

          v119 = v125;
        }
        v122 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v229, v291, 16);
      }
      while (v122);
    }

  }
  -[VUIMediaTagsViewLayout padding](self->_tagsViewLayout, "padding");
  v133 = v132;
  if (!v215)
  {
    -[VUIMediaTagsView _adjustViewsPositionFor:preferredSize:](self, "_adjustViewsPositionFor:preferredSize:", v256[5], v262[4], v262[5]);
    if (objc_msgSend((id)v256[5], "count"))
    {
      objc_msgSend((id)v256[5], "lastObject");
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      if ((unint64_t)objc_msgSend(v134, "count") < 2)
      {

      }
      else
      {
        objc_msgSend(v134, "lastObject");
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        v136 = objc_msgSend(v135, "tag") == 108;

        if (v136)
          -[VUIMediaTagsView _adjustViewsPositionVerticallyCenteredFor:preferredSize:](self, "_adjustViewsPositionVerticallyCenteredFor:preferredSize:", v256[5], v262[4], v262[5]);
      }
    }
    if (v133 <= 0.0)
      goto LABEL_112;
    -[VUIMediaTagsView _adjustViewsPositionFor:topPadding:](self, "_adjustViewsPositionFor:topPadding:", v256[5], v133);
    goto LABEL_110;
  }
  if (v132 > 0.0)
  {
LABEL_110:
    v143 = v262[5];
    if (v143 > 0.0)
      v262[5] = v133 + v143;
  }
LABEL_112:
  *(_OWORD *)obj = *((_OWORD *)v262 + 2);
LABEL_113:

  objc_destroyWeak(v239);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v243, 8);

  _Block_object_dispose(&v249, 8);
  _Block_object_dispose(&v255, 8);

  _Block_object_dispose(&v261, 8);
  _Block_object_dispose(v266, 8);
  _Block_object_dispose(v269, 8);

  _Block_object_dispose(v271, 8);
  _Block_object_dispose(v272, 8);
  _Block_object_dispose(v273, 8);
  _Block_object_dispose(v276, 8);

  _Block_object_dispose(v278, 8);
  _Block_object_dispose(v280, 8);

  _Block_object_dispose(&v282, 8);
  _Block_object_dispose(&v286, 8);

  v145 = *(double *)&obj[1];
  v144 = *(double *)obj;
  result.height = v145;
  result.width = v144;
  return result;
}

- (id)_firstLabelSubview
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__16;
  v10 = __Block_byref_object_dispose__16;
  v11 = 0;
  -[VUIMediaTagsView subviews](self, "subviews");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__VUIMediaTagsView__firstLabelSubview__block_invoke;
  v5[3] = &unk_1E9F9E748;
  v5[4] = &v6;
  objc_msgSend(v2, "enumerateObjectsUsingBlock:", v5);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_adjustViewsPositionFor:(id)a3 preferredSize:(CGSize)a4
{
  double width;
  id v6;
  void *v7;
  uint64_t v8;
  int v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  uint64_t v31;
  double v32;
  double v33;
  uint64_t j;
  void *v35;
  double v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  width = a4.width;
  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "centerAlign"))
  {
    v8 = objc_msgSend(v6, "count");

    if (v8)
    {
      v9 = -[VUIMediaTagsView vuiIsRTL](self, "vuiIsRTL");
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v37 = v6;
      v10 = v6;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v43;
        v14 = *MEMORY[0x1E0C9D648];
        v15 = *(double *)(MEMORY[0x1E0C9D648] + 16);
        do
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v43 != v13)
              objc_enumerationMutation(v10);
            v17 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v18 = v15;
            v19 = v14;
            if (objc_msgSend(v17, "count"))
            {
              v20 = objc_msgSend(v17, "count");
              v18 = v15;
              v19 = v14;
              if (v20 - 1 >= 0)
              {
                v21 = v20;
                while (1)
                {
                  objc_msgSend(v17, "objectAtIndexedSubscript:", --v21);
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((objc_msgSend(v22, "isHidden") & 1) == 0)
                  {
                    objc_msgSend(v22, "superview");
                    v23 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v23)
                      break;
                  }

                  if (v21 <= 0)
                  {
                    v18 = v15;
                    v19 = v14;
                    goto LABEL_16;
                  }
                }
                objc_msgSend(v22, "frame");
                v19 = v24;
                v18 = v25;

              }
            }
LABEL_16:
            v40 = 0u;
            v41 = 0u;
            v38 = 0u;
            v39 = 0u;
            v26 = v17;
            v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
            if (v27)
            {
              v28 = v27;
              v29 = width - (v18 + v19);
              if (v9)
                v29 = v19;
              v30 = v29 * 0.5;
              v31 = *(_QWORD *)v39;
              v32 = -(v29 * 0.5);
              if (v9)
                v33 = v32;
              else
                v33 = v30;
              do
              {
                for (j = 0; j != v28; ++j)
                {
                  if (*(_QWORD *)v39 != v31)
                    objc_enumerationMutation(v26);
                  v35 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
                  objc_msgSend(v35, "frame");
                  objc_msgSend(v35, "setFrame:", v33 + v36);
                }
                v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
              }
              while (v28);
            }

          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
        }
        while (v12);
      }

      v6 = v37;
    }
  }
  else
  {

  }
}

+ (id)tagsViewWithMetadata:(id)a3 layout:(id)a4 existingView:(id)a5
{
  id v7;
  id v8;
  id v9;
  VUIMediaTagsView *v10;
  VUIMediaTagsView *v11;
  VUIMediaTagsView *v12;
  VUIMediaTagsViewHelper *v13;
  void *v14;

  v7 = a4;
  v8 = a5;
  v9 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v10 = (VUIMediaTagsView *)v8;
  }
  else
  {
    v11 = [VUIMediaTagsView alloc];
    v10 = -[VUIMediaTagsView initWithFrame:layout:](v11, "initWithFrame:layout:", v7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  }
  v12 = v10;
  v13 = -[VUIMediaTagsViewHelper initWithContentMetadata:additionalMetadata:]([VUIMediaTagsViewHelper alloc], "initWithContentMetadata:additionalMetadata:", v9, 0);

  -[VUIMediaTagsViewHelper tagsViewDictionary](v13, "tagsViewDictionary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView updateWithMetadata:](v12, "updateWithMetadata:", v14);

  return v12;
}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vuiTraitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "vuiUserInterfaceStyle");

  objc_msgSend(WeakRetained, "_updateAppearanceWithUserInterfaceStyle:", v2);
}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vuiTraitCollection");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "vuiUserInterfaceStyle");

  objc_msgSend(WeakRetained, "_updateAppearanceWithUserInterfaceStyle:", v2);
  objc_msgSend(WeakRetained, "tagsViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateHighMotionFontSize");

  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

}

void __41__VUIMediaTagsView_initWithFrame_layout___block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "vui_setNeedsLayout");
  objc_msgSend(WeakRetained, "invalidateIntrinsicContentSize");

}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC4508], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  v5.receiver = self;
  v5.super_class = (Class)VUIMediaTagsView;
  -[VUIMediaTagsView dealloc](&v5, sel_dealloc);
}

double __59__VUIMediaTagsView__layoutSubviewsForSize_computationOnly___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v3 = a2;
  if (v3
    && (objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "objectForKey:", v3),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v5 = v4;
    objc_msgSend(v4, "CGRectValue");
    v7 = v6;

  }
  else
  {
    v7 = *MEMORY[0x1E0C9D648];
  }

  return v7;
}

- (void)_adjustViewsPositionVerticallyCenteredFor:(id)a3 preferredSize:(CGSize)a4
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v22 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v17 = 0u;
          v18 = 0u;
          v19 = 0u;
          v20 = 0u;
          v11 = v10;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v18;
            do
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v18 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
                objc_msgSend(v16, "frame");
                objc_msgSend(v16, "setFrame:");
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
            }
            while (v13);
          }

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v7);
    }

  }
}

- (void)_adjustViewsPositionFor:(id)a3 topPadding:(double)a4
{
  id v5;
  uint64_t v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(v5, "count");
  if (a4 > 0.0 && v6 != 0)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = 0u;
          v21 = 0u;
          v22 = 0u;
          v23 = 0u;
          v14 = v13;
          v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
          if (v15)
          {
            v16 = v15;
            v17 = *(_QWORD *)v21;
            do
            {
              for (j = 0; j != v16; ++j)
              {
                if (*(_QWORD *)v21 != v17)
                  objc_enumerationMutation(v14);
                v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * j);
                objc_msgSend(v19, "frame");
                objc_msgSend(v19, "setFrame:");
              }
              v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
            }
            while (v16);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

  }
}

- (double)topMarginWithBaselineMargin:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VUIMediaTagsView subviews](self, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v31;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v31 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v10, "topMarginWithBaselineMargin:", a3);
          goto LABEL_19;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      if (v7)
        continue;
      break;
    }
  }

  v28 = 0u;
  v29 = 0u;
  v27 = 0u;
  -[VUIMediaTagsView subviews](self, "subviews", 0, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v27;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v27 != v13)
          objc_enumerationMutation(v5);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "badgeMaxHeight");
          v20 = v19;

          v21 = (void *)MEMORY[0x1E0DC69B0];
          -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "scaleContentSizeValue:forTraitCollection:", v22, v20);
          v24 = v23;

          v17 = a3 - v24;
          goto LABEL_21;
        }
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v12)
        continue;
      break;
    }
  }

  v15 = (void *)MEMORY[0x1E0DC69B0];
  -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scaleContentSizeValue:forTraitCollection:", v5, a3);
LABEL_19:
  v17 = v16;
LABEL_21:

  return v17;
}

- (double)topMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[VUIMediaTagsView _firstLabelSubview](self, "_firstLabelSubview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "topMarginToLabel:withBaselineMargin:", v6, a4);
    v10 = v9;
  }
  else
  {
    v30 = 0u;
    v31 = 0u;
    v29 = 0u;
    -[VUIMediaTagsView subviews](self, "subviews", 0, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "badgeMaxHeight");
            v21 = v20;

            v22 = (void *)MEMORY[0x1E0DC69B0];
            -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "scaleContentSizeValue:forTraitCollection:", v23, v21);
            v25 = v24;

            objc_msgSend(v6, "bottomMarginWithBaselineMargin:", a4);
            v10 = v26 - v25;

            goto LABEL_13;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v13)
          continue;
        break;
      }
    }

    v16 = (void *)MEMORY[0x1E0DC69B0];
    -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "scaleContentSizeValue:forTraitCollection:", v17, a4);
    v10 = v18;

  }
LABEL_13:

  return v10;
}

- (double)bottomMarginToLabel:(id)a3 withBaselineMargin:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;

  v6 = a3;
  -[VUIMediaTagsView _firstLabelSubview](self, "_firstLabelSubview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topMarginToLabel:withBaselineMargin:", v7, a4);
  v9 = v8;

  return v9;
}

- (double)bottomMarginWithBaselineMargin:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;

  -[VUIMediaTagsView _firstLabelSubview](self, "_firstLabelSubview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "bottomMarginWithBaselineMargin:", a3);
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0DC69B0];
    -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scaleContentSizeValue:forTraitCollection:", v10, a3);
    v8 = v11;

  }
  return v8;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  CGSize result;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "vui_main");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_bounds");
  v5 = v4;

  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "maxWidth");
  v8 = v7;

  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isWrappingAllowed") && v8 > 0.0)
  {

    if (v5 > v8)
      v5 = v8;
  }
  else
  {

  }
  -[UIView vui_sizeThatFits:](self, "vui_sizeThatFits:", v5, 0.0);
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)_textLayoutForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = a3;
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "textLayout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", VUIMediaTagKeyImmersiveText))
  {
    objc_msgSend(v5, "immersiveTextLayout");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v8 = (void *)v7;

    v6 = v8;
    goto LABEL_6;
  }
  if (objc_msgSend(v4, "isEqualToString:", VUIMediaTagKeyHighMotionText))
  {
    objc_msgSend(v5, "highMotionTextLayout");
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

  return v6;
}

- (id)_newLabelAsSubview:(id)a3 textLayout:(id)a4
{
  void *v5;

  +[VUILabel labelWithString:textLayout:existingLabel:](VUILabel, "labelWithString:textLayout:existingLabel:", &stru_1E9FF3598, a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v5, 0);
  return v5;
}

- (id)_newLabelAsSubview:(id)a3 withAttributedString:(id)a4 textLayout:(id)a5
{
  void *v6;

  +[VUILabel labelWithAttributedString:textLayout:existingLabel:](VUILabel, "labelWithAttributedString:textLayout:existingLabel:", a4, a5, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v6, 0);
  return v6;
}

- (void)vui_setSelected:(BOOL)a3 animated:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  id v6;

  self->_isSelected = a3;
  -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", objc_msgSend(v6, "vuiUserInterfaceStyle"));

}

- (id)_newTextBadgeViewAsSubview:(id)a3 layout:(id)a4 withString:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v9 = a5;
  +[VUITextBadgeView badgeWithLayout:existing:](VUITextBadgeView, "badgeWithLayout:existing:", v8, a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "textLayout");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v8, "textLayout");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "attributedStringWithString:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setAttributedTitle:", v13);
  }
  -[VUIMediaTagsView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v10, 0);

  return v10;
}

- (id)_newRentalExpirationlabel:(id)a3 exisitingLabel:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7 && objc_msgSend(v7, "conformsToProtocol:", &unk_1F02AD0B0))
    objc_msgSend(v8, "setDelegate:", 0);
  if (v6)
  {
    -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "rentalExpirationTextLayout");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[VUIRentalExpirationLabel labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:](VUIRentalExpirationLabel, "labelWithExpirationDate:textLayout:existingLabel:locStringPrefix:", v6, v10, v8, CFSTR("EXPIRATION_IN"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "setDelegate:", self);
    -[VUIMediaTagsView vui_addSubview:oldView:](self, "vui_addSubview:oldView:", v11, 0);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)elementsArePlacedOnIndividualLines
{
  void *v2;
  char v3;

  -[VUIMediaTagsView traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAXEnabled");

  return v3;
}

- (void)_updateAppearanceWithUserInterfaceStyle:(unint64_t)a3
{
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", a3);
  -[VUIMediaTagsView _removeSeparatorsFromGroupsIfNeeded:](self, "_removeSeparatorsFromGroupsIfNeeded:", 0);
}

- (double)_totalSubviewsWidth
{
  void *v3;
  double (**v4)(void *, void *, double, double);
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  CGFloat v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double MaxX;
  void *v55;
  double v56;
  unint64_t v58;
  double v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _QWORD aBlock[6];
  uint64_t v66;
  double *v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[128];
  uint64_t v71;
  CGRect v72;

  v71 = *MEMORY[0x1E0C80C00];
  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "textLayout");
  v60 = (void *)objc_claimAutoreleasedReturnValue();

  v66 = 0;
  v67 = (double *)&v66;
  v68 = 0x2020000000;
  v69 = 0;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __39__VUIMediaTagsView__totalSubviewsWidth__block_invoke;
  aBlock[3] = &unk_1E9F9F870;
  aBlock[4] = self;
  aBlock[5] = &v66;
  v4 = (double (**)(void *, void *, double, double))_Block_copy(aBlock);
  v5 = 0;
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v59 = *MEMORY[0x1E0C9D648];
  v8 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v9 = 0.0;
  while (1)
  {
    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = v5;
    v11 = v5 < objc_msgSend(v10, "count");

    if (!v11)
      break;
    -[VUIMediaTagsView groupedSubviews](self, "groupedSubviews");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectAtIndexedSubscript:", v58);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v14 = v13;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v62 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v60, "margin");
            v20 = v19;
            v21 = v4[2](v4, v18, 0.0, 0.0);
            v23 = v22;
            v25 = v24;
            v27 = v26;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "badgeMargin");
              v20 = v29;

              switch(objc_msgSend(v18, "tag"))
              {
                case 'e':
                  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "commonSenseMargin");
                  goto LABEL_18;
                case 'f':
                  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "tomatoMeterMargin");
                  goto LABEL_18;
                case 'm':
                  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "immersiveMargin");
                  goto LABEL_18;
                case 'n':
                  -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                  v30 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v30, "highMotionMargin");
LABEL_18:
                  v20 = v31;

                  break;
                default:
                  break;
              }
              v37 = (void *)MEMORY[0x1E0DC69B0];
              -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "badgeMaxHeight");
              v40 = v39;
              -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "scaleContentSizeValue:forTraitCollection:", v41, v40);
              v43 = v42;

              objc_msgSend(v18, "image");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "size");
              v45 = 0.0;
              if (v46 > 0.0)
              {
                objc_msgSend(v44, "size");
                if (v47 > 0.0)
                {
                  objc_msgSend(v44, "size");
                  v49 = v48;
                  objc_msgSend(v44, "size");
                  v45 = v49 / v50;
                }
              }
              v21 = v4[2](v4, v18, v43, v45);
              v23 = v51;
              v25 = v52;
              v27 = v53;

            }
            else
            {
              objc_opt_class();
              v20 = 0.0;
              v27 = v7;
              v25 = v8;
              v23 = v6;
              v21 = v59;
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v21 = v4[2](v4, v18, 0.0, 0.0);
                v23 = v32;
                v25 = v33;
                v27 = v34;
                -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
                v35 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "textBadgeMargin");
                v20 = v36;

              }
            }
          }
          v72.origin.x = v21;
          v72.origin.y = v23;
          v72.size.width = v25;
          v72.size.height = v27;
          MaxX = CGRectGetMaxX(v72);
          v67[3] = v20 + v25 + v67[3];
        }
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      }
      while (v15);
      v9 = v20 + MaxX;
    }

    -[VUIMediaTagsView tagsViewLayout](self, "tagsViewLayout");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "groupMargin");
    v67[3] = v56 + v67[3];

    v5 = v58 + 1;
  }

  _Block_object_dispose(&v66, 8);
  return v9;
}

double __39__VUIMediaTagsView__totalSubviewsWidth__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double *v13;
  double v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  v5 = v4;
  v7 = v6;
  if (objc_msgSend(v3, "tag") == 110)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "tagsViewLayout");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "badgeMaxHeight");
      v7 = v9;
      v5 = 0.0;

    }
  }
  objc_msgSend(v3, "vui_sizeThatFits:", v5, v7);
  if (v11 == *MEMORY[0x1E0C9D820] && v10 == *(double *)(MEMORY[0x1E0C9D820] + 8))
    v13 = (double *)MEMORY[0x1E0C9D648];
  else
    v13 = (double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  v14 = *v13;

  return v14;
}

- (void)_removeGenreLabelAndSeparator
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  id v15;

  -[VUIMediaTagsView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[VUIMediaTagsView subviews](self, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v15 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v15, "labelName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", VUIMediaTagKeyGenre);

        if (v8)
          break;
      }

      if (v4 == ++v5)
        return;
    }
    -[VUIMediaTagsView totalSubviewsWidth](self, "totalSubviewsWidth");
    v10 = v9;
    -[VUIMediaTagsView bounds](self, "bounds");
    objc_msgSend(v15, "vui_sizeThatFits:", v11, v12);
    v14 = v10 - v13;
    objc_msgSend(v15, "setHidden:", 1);
    -[VUIMediaTagsView setTotalSubviewsWidth:](self, "setTotalSubviewsWidth:", v14);

  }
}

- (void)_addGenreLabelAndSeparator
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;

  -[VUIMediaTagsView subviews](self, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    v5 = 0;
    while (1)
    {
      -[VUIMediaTagsView subviews](self, "subviews");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectAtIndexedSubscript:", v5);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "labelName");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "isEqualToString:", VUIMediaTagKeyGenre);

        if (v8)
          break;
      }

      if (v4 == ++v5)
        return;
    }
    objc_msgSend(v9, "setHidden:", 0);
    -[VUIMediaTagsView _totalSubviewsWidth](self, "_totalSubviewsWidth");
    -[VUIMediaTagsView setTotalSubviewsWidth:](self, "setTotalSubviewsWidth:");

  }
}

- (void)contrastSettingsDidChange
{
  id v3;

  -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", objc_msgSend(v3, "vuiUserInterfaceStyle"));

}

- (void)transparencySettingsDidChange
{
  id v3;

  -[VUIMediaTagsView vuiTraitCollection](self, "vuiTraitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[VUIMediaTagsView _updateImageAppearanceWithUserInterfaceStyle:](self, "_updateImageAppearanceWithUserInterfaceStyle:", objc_msgSend(v3, "vuiUserInterfaceStyle"));

}

- (double)vuiBaselineHeight
{
  return self->vuiBaselineHeight;
}

- (double)totalSubviewsWidth
{
  return self->_totalSubviewsWidth;
}

- (void)setTotalSubviewsWidth:(double)a3
{
  self->_totalSubviewsWidth = a3;
}

- (void)setIsSelected:(BOOL)a3
{
  self->_isSelected = a3;
}

- (UIImage)commonSenseLightImage
{
  return self->_commonSenseLightImage;
}

- (void)setCommonSenseLightImage:(id)a3
{
  objc_storeStrong((id *)&self->_commonSenseLightImage, a3);
}

- (UIImage)commonSenseDarkImage
{
  return self->_commonSenseDarkImage;
}

- (void)setCommonSenseDarkImage:(id)a3
{
  objc_storeStrong((id *)&self->_commonSenseDarkImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_commonSenseDarkImage, 0);
  objc_storeStrong((id *)&self->_commonSenseLightImage, 0);
  objc_storeStrong((id *)&self->_groupedSubviews, 0);
  objc_storeStrong((id *)&self->_viewsMap, 0);
  objc_storeStrong((id *)&self->_tagsViewLayout, 0);
}

@end
