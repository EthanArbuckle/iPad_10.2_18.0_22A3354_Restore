@implementation PKBridgeAppearanceGetAppearanceSpecifier

void __PKBridgeAppearanceGetAppearanceSpecifier_block_invoke()
{
  PKAppearanceSpecifier *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v0 = objc_alloc_init(PKAppearanceSpecifier);
  v1 = (void *)_MergedGlobals_667;
  _MergedGlobals_667 = (uint64_t)v0;

  if (_MergedGlobals_667)
  {
    objc_msgSend((id)_MergedGlobals_667, "setHasDarkAppearance:", 1);
    v2 = (void *)_MergedGlobals_667;
    PKBridgeBackgroundColor();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setBackgroundColor:", v3);

    v4 = (void *)_MergedGlobals_667;
    PKBridgeForegroundColor();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForegroundColor:", v5);

    v6 = (void *)_MergedGlobals_667;
    BPSBridgeTintColor();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTintColor:", v7);

    v8 = (void *)_MergedGlobals_667;
    PKBridgeSeparatorColor();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTableViewSeparatorColor:", v9);

    v10 = (void *)_MergedGlobals_667;
    PKBridgeCellHighlightColor();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTableViewCellHighlightColor:", v11);

    v12 = (void *)_MergedGlobals_667;
    PKBridgeTableViewCellAccessoryColor();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setTableViewCellAccessoryColor:", v13);

    v14 = (void *)_MergedGlobals_667;
    PKBridgeTableViewCellAccessoryHighlightColor();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTableViewCellAccessoryHighlightColor:", v15);

    v16 = (void *)_MergedGlobals_667;
    PKBridgeTextColor();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTextColor:", v17);

    v18 = (void *)_MergedGlobals_667;
    PKBridgeAltTextColor();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAltTextColor:", v19);

    v20 = (void *)_MergedGlobals_667;
    PKBridgeButtonTextColor();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setButtonTextColor:", v21);

    v22 = (void *)_MergedGlobals_667;
    BPSSetupTintDisabledColor();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setButtonDisabledTextColor:", v23);

    v24 = (void *)_MergedGlobals_667;
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setButtonBackgroundColor:", v25);

    v26 = (void *)_MergedGlobals_667;
    BPSPillSelectedColor();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setContinueButtonTintColor:", v27);

    v28 = (void *)_MergedGlobals_667;
    PKBridgeEditableTextColor();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEditableTextColor:", v29);

    v30 = (void *)_MergedGlobals_667;
    PKBridgeEditablePlaceholderTextColor();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setEditablePlaceholderTextColor:", v31);

    v32 = (void *)_MergedGlobals_667;
    PKBridgeEditableInsertionPointColor();
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setEditableInsertionPointColor:", v33);

    v34 = (void *)_MergedGlobals_667;
    PKBridgeEditableSelectionBarColor();
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setEditableSelectionBarColor:", v35);

    v36 = (void *)_MergedGlobals_667;
    PKBridgeEditableSelectionHighlightColor();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setEditableSelectionHighlightColor:", v37);

    v38 = (void *)_MergedGlobals_667;
    PKBridgeFooterHyperlinkColor();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFooterHyperlinkColor:", v39);

    v40 = (void *)_MergedGlobals_667;
    BPSProgressBarTintColor();
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setProgressBarTintColor:", v41);

    v42 = (void *)_MergedGlobals_667;
    BPSProgressBarTrackTintColor();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setProgressBarTrackTintColor:", v43);

    v44 = (void *)_MergedGlobals_667;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.188235294, 1.0);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "setSearchBarTintcolor:", v45);

    v46 = (void *)_MergedGlobals_667;
    PKBridgeBackgroundColor();
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "colorWithAlphaComponent:", 0.400000006);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setCameraCaptureMaskColor:", v48);

    v49 = (void *)_MergedGlobals_667;
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.996078431, 0.796078431, 0.184313725, 1.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setCameraCaptureMaskOutlineColor:", v50);

    v51 = (void *)_MergedGlobals_667;
    PKBridgeBackgroundColor();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    PKPointImageWithColor(v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "setNavBarPointImage:", v53);

    v54 = (void *)_MergedGlobals_667;
    PKBridgeSeparatorColor();
    v56 = (id)objc_claimAutoreleasedReturnValue();
    PKPointImageWithColor(v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setNavBarShadowPointImage:", v55);

  }
}

@end
