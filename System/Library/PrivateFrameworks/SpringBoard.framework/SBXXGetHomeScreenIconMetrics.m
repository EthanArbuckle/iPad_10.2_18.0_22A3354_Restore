@implementation SBXXGetHomeScreenIconMetrics

void ___SBXXGetHomeScreenIconMetrics_block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  _DWORD *v21;
  id v22;
  CGRect v23;
  CGRect v24;

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_referenceBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v23.origin.x = v4;
  v23.origin.y = v6;
  v23.size.width = v8;
  v23.size.height = v10;
  **(CGFloat **)(a1 + 32) = CGRectGetWidth(v23);
  v24.origin.x = v4;
  v24.origin.y = v6;
  v24.size.width = v8;
  v24.size.height = v10;
  **(CGFloat **)(a1 + 40) = CGRectGetHeight(v24);
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "listLayoutProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutForIconLocation:", *MEMORY[0x1E0DAA9E8]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconImageInfo");
  v14 = *(_QWORD **)(a1 + 56);
  **(_QWORD **)(a1 + 48) = v15;
  *v14 = v16;
  objc_msgSend(v22, "model");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)(a1 + 64) = objc_msgSend(v17, "maxRowCountForListInRootFolderWithInterfaceOrientation:", 1);
  **(_DWORD **)(a1 + 72) = objc_msgSend(v17, "maxColumnCountForListInRootFolderWithInterfaceOrientation:", 1);
  **(_DWORD **)(a1 + 80) = objc_msgSend(v17, "maxIconCountForDock");
  v18 = objc_msgSend(v17, "maxListCountForFolders");
  **(_DWORD **)(a1 + 88) = v18;
  objc_msgSend(v12, "layoutForIconLocation:", *MEMORY[0x1E0DAA9A0]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  **(_DWORD **)(a1 + 96) = objc_msgSend(v19, "numberOfRowsForOrientation:", 1);
  v20 = objc_msgSend(v19, "numberOfColumnsForOrientation:", 1);
  v21 = *(_DWORD **)(a1 + 112);
  **(_DWORD **)(a1 + 104) = v20;
  *v21 = v18;

}

@end
