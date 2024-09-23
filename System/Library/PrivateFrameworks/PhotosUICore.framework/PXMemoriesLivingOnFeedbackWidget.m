@implementation PXMemoriesLivingOnFeedbackWidget

- (void)setContext:(id)a3
{
  PXPhotosDetailsContext *v5;
  PXPhotosDetailsContext **p_context;
  PXPhotosDetailsContext *context;
  PXPhotosDetailsContext *v8;

  v5 = (PXPhotosDetailsContext *)a3;
  context = self->_context;
  p_context = &self->_context;
  if (context != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_context, a3);
    v5 = v8;
  }

}

- (void)setWidgetDelegate:(id)a3
{
  PXWidgetDelegate **p_widgetDelegate;
  id WeakRetained;
  void *v6;
  id obj;

  obj = a3;
  p_widgetDelegate = &self->_widgetDelegate;
  WeakRetained = objc_loadWeakRetained((id *)p_widgetDelegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_widgetDelegate, obj);
    v6 = obj;
  }

}

- (BOOL)hasContentForCurrentInput
{
  void *v3;
  uint64_t v4;

  -[PXMemoriesLivingOnFeedbackWidget loadContentData](self, "loadContentData");
  -[PXMemoriesLivingOnFeedbackWidget features](self, "features");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4 != 0;
}

- (void)loadContentData
{
  if (!self->_hasLoadedContentData)
    -[PXMemoriesLivingOnFeedbackWidget _loadContentData](self, "_loadContentData");
}

- (void)_loadContentData
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  -[PXMemoriesLivingOnFeedbackWidget context](self, "context");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "assetCollectionType") == 4)
    {
      v5 = v4;
      -[PXMemoriesLivingOnFeedbackWidget setMemory:](self, "setMemory:", v5);
      objc_msgSend(v5, "photosGraphProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      -[PXMemoriesLivingOnFeedbackWidget _loadFeaturesFromPhotosGraphProperties:](self, "_loadFeaturesFromPhotosGraphProperties:", v6);
    }

  }
  self->_hasLoadedContentData = 1;

}

- (void)unloadContentData
{
  -[PXMemoriesLivingOnFeedbackWidget setFeatures:](self, "setFeatures:", 0);
  self->_hasLoadedContentData = 0;
}

- (BOOL)hasLoadedContentData
{
  return self->_hasLoadedContentData;
}

- (double)preferredContentHeightForWidth:(double)a3
{
  double v3;

  -[PXMemoriesLivingOnFeedbackWidget _layoutTokenViewsWithWidth:](self, "_layoutTokenViewsWithWidth:", a3);
  return v3;
}

- (PXAnonymousView)contentView
{
  PXAnonymousView *contentView;
  PXAnonymousView *v4;
  PXAnonymousView *v5;

  contentView = self->_contentView;
  if (!contentView)
  {
    -[PXMemoriesLivingOnFeedbackWidget _loadContentView](self, "_loadContentView");
    v4 = (PXAnonymousView *)objc_claimAutoreleasedReturnValue();
    v5 = self->_contentView;
    self->_contentView = v4;

    contentView = self->_contentView;
  }
  return contentView;
}

- (id)_loadContentView
{
  id v2;

  v2 = objc_alloc(MEMORY[0x1E0DC3F10]);
  return (id)objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
}

- (void)_loadFeaturesFromPhotosGraphProperties:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  __CFString *v28;
  int v29;
  PXMemoriesDebugFeature *v30;
  const __CFString *v31;
  uint64_t v32;
  PXMemoriesDebugFeature *v33;
  PXMemoriesDebugFeature *v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  PXMemoriesDebugFeature *v40;
  PXMemoriesDebugFeature *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t m;
  PXMemoriesDebugFeature *v47;
  NSArray *featureViews;
  void *v49;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id obj;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  _BYTE v81[128];
  _BYTE v82[5];
  uint8_t v83[128];
  uint8_t buf[4];
  void *v85;
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("info"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("meaningLabels"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("moodKeywords"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("suggestedMood"));
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v4;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("notificationQuality"));
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("backingMoments"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = 0u;
  v78 = 0u;
  v79 = 0u;
  v80 = 0u;
  obj = v5;
  v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
  if (v58)
  {
    v57 = *(_QWORD *)v78;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v78 != v57)
          objc_enumerationMutation(obj);
        v59 = v6;
        objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * v6), "objectForKeyedSubscript:", CFSTR("keywords"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Place"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v9 = v8;
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v74;
          do
          {
            for (i = 0; i != v11; ++i)
            {
              if (*(_QWORD *)v74 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
              v15 = objc_msgSend(v14, "rangeOfString:", CFSTR("]"));
              if (v15 < 2 || v15 == 0x7FFFFFFFFFFFFFFFLL)
              {
                PLUIGetLog();
                v17 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  v85 = v14;
                  _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_DEFAULT, "Cannot parse place \"%@\" in places. Unknown format.", buf, 0xCu);
                }
              }
              else
              {
                objc_msgSend(v14, "substringWithRange:", 1, v15 - 1);
                v17 = objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "addObject:", v17);
              }

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v86, 16);
          }
          while (v11);
        }

        v6 = v59 + 1;
      }
      while (v59 + 1 != v58);
      v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v77, v87, 16);
    }
    while (v58);
  }

  v18 = objc_msgSend(v49, "count");
  v19 = objc_msgSend(v53, "count");
  v20 = objc_msgSend(v60, "count");
  v21 = v55 != 0;
  if (v54)
    ++v21;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v21 + v18 + v19 + v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v23 = v49;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v70;
    do
    {
      for (j = 0; j != v25; ++j)
      {
        if (*(_QWORD *)v70 != v26)
          objc_enumerationMutation(v23);
        v28 = *(__CFString **)(*((_QWORD *)&v69 + 1) + 8 * j);
        v29 = -[__CFString isEqualToString:](v28, "isEqualToString:", CFSTR("HolidayEvent"));
        v30 = [PXMemoriesDebugFeature alloc];
        if (v29)
        {
          v31 = &stru_1E5149688;
          v32 = 1;
        }
        else
        {
          v31 = v28;
          v32 = 0;
        }
        v33 = -[PXMemoriesDebugFeature initWithLocalizedTitle:type:](v30, "initWithLocalizedTitle:type:", v31, v32);
        objc_msgSend(v22, "addObject:", v33);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
    }
    while (v25);
  }

  if (v54)
  {
    v34 = -[PXMemoriesDebugFeature initWithLocalizedTitle:type:]([PXMemoriesDebugFeature alloc], "initWithLocalizedTitle:type:", v54, 3);
    objc_msgSend(v22, "addObject:", v34);

  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v35 = v53;
  v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
  if (v36)
  {
    v37 = v36;
    v38 = *(_QWORD *)v66;
    do
    {
      for (k = 0; k != v37; ++k)
      {
        if (*(_QWORD *)v66 != v38)
          objc_enumerationMutation(v35);
        v40 = -[PXMemoriesDebugFeature initWithLocalizedTitle:type:]([PXMemoriesDebugFeature alloc], "initWithLocalizedTitle:type:", *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * k), 4);
        objc_msgSend(v22, "addObject:", v40);

      }
      v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v65, v82, 16);
    }
    while (v37);
  }

  if (v55 && (objc_msgSend(v55, "isEqualToString:", CFSTR("None")) & 1) == 0)
  {
    v41 = -[PXMemoriesDebugFeature initWithLocalizedTitle:type:]([PXMemoriesDebugFeature alloc], "initWithLocalizedTitle:type:", v55, 5);
    objc_msgSend(v22, "addObject:", v41);

  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v42 = v60;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
  if (v43)
  {
    v44 = v43;
    v45 = *(_QWORD *)v62;
    do
    {
      for (m = 0; m != v44; ++m)
      {
        if (*(_QWORD *)v62 != v45)
          objc_enumerationMutation(v42);
        v47 = -[PXMemoriesDebugFeature initWithLocalizedTitle:type:]([PXMemoriesDebugFeature alloc], "initWithLocalizedTitle:type:", *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * m), 2);
        objc_msgSend(v22, "addObject:", v47);

      }
      v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    }
    while (v44);
  }

  -[PXMemoriesLivingOnFeedbackWidget setFeatures:](self, "setFeatures:", v22);
  featureViews = self->_featureViews;
  self->_featureViews = 0;

}

- (id)_tokenViewsWithSuperview:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  PXProtoTextualFeatureView *v13;
  id obj;
  _QWORD v16[5];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[PXMemoriesLivingOnFeedbackWidget features](self, "features");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v11);
        v13 = objc_alloc_init(PXProtoTextualFeatureView);
        v16[0] = v10;
        v16[1] = 3221225472;
        v16[2] = __61__PXMemoriesLivingOnFeedbackWidget__tokenViewsWithSuperview___block_invoke;
        v16[3] = &unk_1E5148528;
        v16[4] = v12;
        -[PXProtoFeatureView performChanges:](v13, "performChanges:", v16);
        objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(v6, "addSubview:", v13);

        ++v11;
      }
      while (v8 != v11);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

- (NSArray)featureViews
{
  NSArray *featureViews;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  featureViews = self->_featureViews;
  if (!featureViews)
  {
    -[PXMemoriesLivingOnFeedbackWidget contentView](self, "contentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXMemoriesLivingOnFeedbackWidget _tokenViewsWithSuperview:](self, "_tokenViewsWithSuperview:", v4);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_featureViews;
    self->_featureViews = v5;

    featureViews = self->_featureViews;
  }
  return featureViews;
}

- (CGSize)_layoutTokenViewsWithWidth:(double)a3
{
  CGFloat *v4;
  double height;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  CGFloat x;
  CGFloat y;
  uint64_t v11;
  double v12;
  double v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat MaxX;
  BOOL v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat r1;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;
  CGSize result;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = (CGFloat *)MEMORY[0x1E0C9D648];
  height = *(double *)(MEMORY[0x1E0C9D648] + 24);
  r1 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[PXMemoriesLivingOnFeedbackWidget featureViews](self, "featureViews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v7)
  {
    v8 = v7;
    x = *v4;
    y = v4[1];
    v11 = *(_QWORD *)v28;
    v25 = a3 + -20.0;
    v12 = 20.0;
    v13 = 20.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v6);
        v15 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v15, "intrinsicContentSize", *(_QWORD *)&v25);
        v17 = v16;
        v19 = v18;
        v34.origin.x = v13;
        v34.origin.y = v12;
        v34.size.width = v17;
        v34.size.height = v19;
        MaxX = CGRectGetMaxX(v34);
        v21 = MaxX <= v25;
        if (MaxX > v25)
          v13 = 20.0;
        v22 = -0.0;
        if (!v21)
          v22 = v19 + 4.0;
        v12 = v12 + v22;
        objc_msgSend(v15, "setFrame:", v13, v12, v17, v19);
        v35.origin.x = x;
        v35.origin.y = y;
        v35.size.width = r1;
        v35.size.height = height;
        v37.origin.x = v13;
        v37.origin.y = v12;
        v37.size.width = v17;
        v37.size.height = v19;
        v36 = CGRectUnion(v35, v37);
        x = v36.origin.x;
        y = v36.origin.y;
        r1 = v36.size.width;
        height = v36.size.height;
        v36.origin.x = v13;
        v36.origin.y = v12;
        v36.size.width = v17;
        v36.size.height = v19;
        v13 = CGRectGetMaxX(v36) + 4.0;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v8);
  }

  v23 = height + 15.0;
  v24 = r1;
  result.height = v23;
  result.width = v24;
  return result;
}

- (int64_t)contentViewAnchoringType
{
  return 0;
}

- (int64_t)contentLayoutStyle
{
  return 0;
}

- (BOOL)isUserInteractionEnabled
{
  return 0;
}

- (NSString)localizedTitle
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("Rate this Memory"), CFSTR("PhotosUICore"));
}

- (NSString)localizedDisclosureTitle
{
  return (NSString *)PXLocalizedStringFromTable(CFSTR("Provide Feedback"), CFSTR("PhotosUICore"));
}

- (BOOL)allowUserInteractionWithSubtitle
{
  return 0;
}

- (void)_showReportFeedback
{
  PXMemoryDiagnosticsViewController *v3;
  void *v4;
  void *v5;
  PXMemoryDiagnosticsViewController *v6;

  v3 = [PXMemoryDiagnosticsViewController alloc];
  -[PXMemoriesLivingOnFeedbackWidget memory](self, "memory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXMemoryDiagnosticsViewController initWithMemory:](v3, "initWithMemory:", v4);

  -[PXCuratedAssetCollectionDiagnosticsViewController setShouldPresentTapToRadar:](v6, "setShouldPresentTapToRadar:", 1);
  -[PXMemoriesLivingOnFeedbackWidget widgetDelegate](self, "widgetDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "widget:transitionToViewController:withTransitionType:", self, v6, 2);

}

- (PXPhotosDetailsContext)context
{
  return self->_context;
}

- (PXWidgetDelegate)widgetDelegate
{
  return (PXWidgetDelegate *)objc_loadWeakRetained((id *)&self->_widgetDelegate);
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
  objc_storeStrong((id *)&self->_features, a3);
}

- (void)setFeatureViews:(id)a3
{
  objc_storeStrong((id *)&self->_featureViews, a3);
}

- (PHMemory)memory
{
  return self->_memory;
}

- (void)setMemory:(id)a3
{
  objc_storeStrong((id *)&self->_memory, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memory, 0);
  objc_storeStrong((id *)&self->_featureViews, 0);
  objc_storeStrong((id *)&self->_features, 0);
  objc_destroyWeak((id *)&self->_widgetDelegate);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_context, 0);
}

uint64_t __61__PXMemoriesLivingOnFeedbackWidget__tokenViewsWithSuperview___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setFeature:", *(_QWORD *)(a1 + 32));
}

@end
