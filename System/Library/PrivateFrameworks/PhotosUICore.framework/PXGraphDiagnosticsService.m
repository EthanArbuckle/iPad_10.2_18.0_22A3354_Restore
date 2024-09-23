@implementation PXGraphDiagnosticsService

+ (id)viewControllerForDetailsOfAsset:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a3;
  objc_msgSend(v3, "px_curationDebugString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3450], "alertControllerWithTitle:message:preferredStyle:", CFSTR("Asset Details"), 0, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setAttributedMessage:", v4);
  v6 = MEMORY[0x1E0C809B0];
  v7 = (void *)MEMORY[0x1E0DC3448];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke;
  v20[3] = &unk_1E5144530;
  v21 = v4;
  v8 = v4;
  objc_msgSend(v7, "actionWithTitle:style:handler:", CFSTR("Copy Text"), 0, v20);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v9);

  v10 = (void *)MEMORY[0x1E0DC3448];
  v15 = v6;
  v16 = 3221225472;
  v17 = __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2;
  v18 = &unk_1E5144530;
  v19 = v3;
  v11 = v3;
  objc_msgSend(v10, "actionWithTitle:style:handler:", CFSTR("Copy UUID"), 0, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v12, v15, v16, v17, v18);

  objc_msgSend(MEMORY[0x1E0DC3448], "actionWithTitle:style:handler:", CFSTR("OK"), 1, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAction:", v13);

  return v5;
}

void __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjects:", v4);

}

void __61__PXGraphDiagnosticsService_viewControllerForDetailsOfAsset___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObjects:", v4);

}

- (id)title
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    v6 = CFSTR("Graph Diagnostics");
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset")) & 1) != 0)
        {
          v6 = CFSTR("Asset Details");
          goto LABEL_19;
        }
        if ((objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierMemory")) & 1) != 0)
        {
          v6 = CFSTR("Memory Details");
          goto LABEL_19;
        }
        if ((objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierHighlight")) & 1) != 0)
        {
          v6 = CFSTR("Highlight Details");
          goto LABEL_19;
        }
        if ((objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedCollection")) & 1) != 0
          || (objc_msgSend(v8, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedReferenceObject")) & 1) != 0)
        {
          v6 = CFSTR("Related Details");
          goto LABEL_19;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v4)
        continue;
      break;
    }
  }
  else
  {
    v6 = CFSTR("Graph Diagnostics");
  }
LABEL_19:

  return (id)v6;
}

- (BOOL)canProvideConsoleDescription
{
  return 0;
}

- (BOOL)canProvideContextualViewController
{
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[PXDiagnosticsSettings sharedInstance](PXDiagnosticsSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "enableGraphService");

  if (!v4)
    return 0;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if ((objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierAsset"), (_QWORD)v13) & 1) != 0
          || (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierMemory")) & 1) != 0
          || (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierHighlight")) & 1) != 0
          || (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedCollection")) & 1) != 0
          || (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedReferenceObject")) & 1) != 0)
        {
          v11 = 1;
          goto LABEL_18;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v7)
        continue;
      break;
    }
  }
  else
  {
    v11 = 0;
  }
LABEL_18:

  return v11;
}

- (id)saliencyStringForAsset:(id)a3
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v45[3];
  CGRect v46;
  CGRect v47;

  v45[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "preferredCropRect");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = objc_msgSend(v3, "pixelWidth");
  v13 = objc_msgSend(v3, "pixelHeight");
  v14 = v5 * (double)v12;
  v15 = v7 * (double)v13;
  v16 = round(v9 * (double)v12);
  v17 = round(v11 * (double)v13);
  v18 = round(v14);
  v19 = round(v15);
  objc_msgSend(v3, "acceptableCropRect");
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v28 = objc_msgSend(v3, "pixelWidth");
  v29 = objc_msgSend(v3, "pixelHeight");

  v30 = v21 * (double)v28;
  v31 = v23 * (double)v29;
  v32 = round(v25 * (double)v28);
  v33 = round(v27 * (double)v29);
  v34 = round(v30);
  v35 = round(v31);
  v36 = (void *)MEMORY[0x1E0CB3940];
  v46.origin.x = v18;
  v46.origin.y = v19;
  v46.size.width = v16;
  v46.size.height = v17;
  NSStringFromCGRect(v46);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "stringWithFormat:", CFSTR("Preferred crop rect: %@"), v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v39 = (void *)MEMORY[0x1E0CB3940];
  v47.origin.x = v34;
  v47.origin.y = v35;
  v47.size.width = v32;
  v47.size.height = v33;
  NSStringFromCGRect(v47);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "stringWithFormat:", CFSTR("Acceptable crop rect: %@"), v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v45[0] = v38;
  v45[1] = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "componentsJoinedByString:", CFSTR("\n"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)contextualViewController
{
  void *v2;
  void *v3;
  void *v4;
  PXDebugRelatedViewController *v5;
  uint64_t v6;
  const __CFString *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  PXDebugRelatedViewController *v20;
  PXDebugRelatedViewController *v21;
  char isKindOfClass;
  PXDebugRelatedViewController *v23;
  PXDebugRelatedViewController *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  PXDebugRelatedViewController *v28;
  id v29;
  PXDebugRelatedViewController *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  void *v44;
  void *v45;
  PXDebugRelatedViewController *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  _BOOL4 v55;
  void *v56;
  void *v57;
  PXDebugRelatedViewController *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  void *v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v69 = 0u;
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  -[PXDiagnosticsService itemProviders](self, "itemProviders");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  if (!v3)
  {

    v30 = 0;
    v5 = 0;
    v31 = 0;
    v4 = 0;
    v65 = 0;
    v66 = 0;
    goto LABEL_31;
  }
  v65 = 0;
  v66 = 0;
  v4 = 0;
  v63 = 0;
  v64 = 0;
  v5 = 0;
  v59 = 0;
  v62 = 0;
  v6 = *(_QWORD *)v70;
  v7 = CFSTR("PXDiagnosticsItemIdentifierAsset");
  v8 = CFSTR("PXDiagnosticsItemIdentifierMemory");
  do
  {
    v9 = 0;
    v60 = v3;
    do
    {
      if (*(_QWORD *)v70 != v6)
        objc_enumerationMutation(v2);
      v10 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)v9);
      if (objc_msgSend(v10, "hasItemForIdentifier:", v7))
      {
        objc_msgSend(v10, "itemForIdentifier:", v7);
        v11 = objc_claimAutoreleasedReturnValue();

        v62 = (void *)v11;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", v8))
      {
        objc_msgSend(v10, "itemForIdentifier:", v8);
        v12 = objc_claimAutoreleasedReturnValue();

        v64 = (void *)v12;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierHighlight")))
      {
        objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierHighlight"));
        v13 = objc_claimAutoreleasedReturnValue();

        v4 = (void *)v13;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedCollection")))
      {
        objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedCollection"));
        v14 = objc_claimAutoreleasedReturnValue();

        v63 = (void *)v14;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedReferenceObject")))
      {
        v15 = v8;
        v16 = v6;
        v17 = v7;
        v18 = v2;
        v19 = v4;
        objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierRelatedReferenceObject"));
        v20 = (PXDebugRelatedViewController *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = v59;
          v59 = v20;
          goto LABEL_18;
        }
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        v23 = v5;
        v21 = v5;
        v5 = v20;
        if ((isKindOfClass & 1) != 0)
        {
LABEL_18:
          v24 = v20;

          v23 = v5;
        }
        v5 = v23;

        v4 = v19;
        v2 = v18;
        v7 = v17;
        v6 = v16;
        v8 = v15;
        v3 = v60;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierViewDescription")))
      {
        objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierViewDescription"));
        v25 = objc_claimAutoreleasedReturnValue();

        v66 = (void *)v25;
      }
      if (objc_msgSend(v10, "hasItemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierLayoutDescription")))
      {
        objc_msgSend(v10, "itemForIdentifier:", CFSTR("PXDiagnosticsItemIdentifierLayoutDescription"));
        v26 = objc_claimAutoreleasedReturnValue();

        v65 = (void *)v26;
      }
      v9 = (char *)v9 + 1;
    }
    while (v3 != v9);
    v3 = (void *)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v69, v75, 16);
  }
  while (v3);

  v27 = v62;
  if (!v62)
  {
    v30 = v59;
    v31 = v63;
    v3 = v64;
LABEL_31:
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "highlightLocalIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    v61 = v4;
    if (v33)
    {
      objc_msgSend(v31, "highlightLocalIdentifier");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v31, "momentLocalIdentifiers");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "count");

      if (v36 != 1)
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v31, 0, 0);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v42, CFSTR("PHPhotosGraphOptionRelatedOptions"));

        v38 = 0;
        v34 = 0;
        v28 = v5;
        v4 = v61;
        goto LABEL_39;
      }
      objc_msgSend(v31, "momentLocalIdentifiers");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "firstObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v61;
    }
    v38 = v34 != 0;
    v28 = v5;
    if (v30 && v34)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXDebugRelatedViewController localIdentifier](v30, "localIdentifier");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = 0;
      objc_msgSend(v39, "relatedDebugInformationBetweenAssetForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:error:", v40, v34, v32, 63, &v68);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v68;

      v28 = -[PXDebugRelatedViewController initWithDictionary:]([PXDebugRelatedViewController alloc], "initWithDictionary:", v41);
      goto LABEL_44;
    }
LABEL_39:
    if (v3)
    {
      v28 = -[PXDebugMemoriesViewController initWithMemory:memoryInfo:]([PXDebugMemoriesViewController alloc], "initWithMemory:memoryInfo:", v3, 0);
LABEL_43:
      v29 = 0;
      goto LABEL_44;
    }
    if (v4)
    {
      v28 = -[PXHighlightDiagnosticsViewController initWithHighlight:]([PXHighlightDiagnosticsViewController alloc], "initWithHighlight:", v4);
      -[PXDebugRelatedViewController setHostViewDiagnosticDescription:](v28, "setHostViewDiagnosticDescription:", v66);
      -[PXDebugRelatedViewController setHostLayoutDiagnosticDescription:](v28, "setHostLayoutDiagnosticDescription:", v65);
      -[PXDebugRelatedViewController setCurrentCurationType:](v28, "setCurrentCurationType:", 3);
      goto LABEL_43;
    }
    if (!v28)
      goto LABEL_43;
    if (-[PXDebugRelatedViewController assetCollectionType](v28, "assetCollectionType") == 5)
    {
      v47 = v28;
      -[PXDebugRelatedViewController highlightLocalIdentifier](v47, "highlightLocalIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        -[PXDebugRelatedViewController highlightLocalIdentifier](v47, "highlightLocalIdentifier");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[PXDebugRelatedViewController momentLocalIdentifiers](v47, "momentLocalIdentifiers");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");

        if (v52 == 1)
        {
          -[PXDebugRelatedViewController momentLocalIdentifiers](v47, "momentLocalIdentifiers");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "firstObject");
          v49 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CD13B8], "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v47, 0, 0);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setObject:forKeyedSubscript:", v54, CFSTR("PHPhotosGraphOptionReferenceOptions"));

          v49 = 0;
        }
      }

    }
    else
    {
      if (-[PXDebugRelatedViewController assetCollectionType](v28, "assetCollectionType") == 1
        && -[PXDebugRelatedViewController assetCollectionSubtype](v28, "assetCollectionSubtype") == 2
        || -[PXDebugRelatedViewController assetCollectionType](v28, "assetCollectionType") == 2
        && -[PXDebugRelatedViewController assetCollectionSubtype](v28, "assetCollectionSubtype") == 200)
      {
        objc_msgSend(MEMORY[0x1E0CD13B8], "graphOptionsForTransientAssetCollection:needsCompleteMomentsInfo:options:", v28, 0, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setObject:forKeyedSubscript:", v50, CFSTR("PHPhotosGraphOptionReferenceOptions"));

        v49 = 0;
        goto LABEL_68;
      }
      -[PXDebugRelatedViewController localIdentifier](v28, "localIdentifier");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (v49)
      v55 = v38;
    else
      v55 = 0;
    if (v55)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0;
      objc_msgSend(v56, "relatedDebugInformationBetweenReferenceAssetCollectionForLocalIdentifier:andRelatedAssetCollectionForLocalIdentifier:options:relatedType:error:", v49, v34, v32, 63, &v67);
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = v67;

      v28 = -[PXDebugRelatedViewController initWithDictionary:]([PXDebugRelatedViewController alloc], "initWithDictionary:", v57);
LABEL_69:

LABEL_44:
      v27 = 0;
      if (!v28)
        goto LABEL_45;
      goto LABEL_48;
    }
LABEL_68:
    v28 = 0;
    v29 = 0;
    v57 = 0;
    goto LABEL_69;
  }
  v61 = v4;
  objc_msgSend((id)objc_opt_class(), "viewControllerForDetailsOfAsset:", v62);
  v28 = (PXDebugRelatedViewController *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = v59;
  v31 = v63;
  v3 = v64;
  if (!v28)
  {
LABEL_45:
    PLUIGetLog();
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      -[PXDiagnosticsService itemProviders](self, "itemProviders");
      v44 = v27;
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v45;
      _os_log_impl(&dword_1A6789000, v43, OS_LOG_TYPE_DEFAULT, "Memories & Related Diagnosis Error: No item providers can be used (%@)", buf, 0xCu);

      v27 = v44;
    }

  }
LABEL_48:

  return v28;
}

- (BOOL)canProvideSettingsViewController
{
  return 0;
}

- (id)settingsViewController
{
  return 0;
}

@end
