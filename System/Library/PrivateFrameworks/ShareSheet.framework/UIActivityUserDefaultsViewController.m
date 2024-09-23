@implementation UIActivityUserDefaultsViewController

_UIActivityUserDefaultsActivityCell *__52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke(id *a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  _UIActivityUserDefaultsActivityCell *v8;
  void *v9;
  void *v10;
  void *v11;
  id WeakRetained;
  void *v13;
  void *v14;
  int v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
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
  double v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  _UIActivityUserDefaultsActivityCell *v50;
  id v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  _QWORD v59[4];
  _UIActivityUserDefaultsActivityCell *v60;
  id v61;
  int v62;
  int v63;
  _QWORD v64[4];
  _UIActivityUserDefaultsActivityCell *v65;
  id v66;

  v7 = a4;
  objc_msgSend(a2, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("userDefaultsCell"), a3);
  v8 = (_UIActivityUserDefaultsActivityCell *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    v8 = -[_UIActivityUserDefaultsActivityCell initWithStyle:reuseIdentifier:]([_UIActivityUserDefaultsActivityCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("userDefaultsCell"));
  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsActivityCell contentView](v8, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIActivityUserDefaultsActivityCell setBackgroundColor:](v8, "setBackgroundColor:", v11);

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(WeakRetained, "currentSnapshot");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sectionIdentifierForSectionContainingItemIdentifier:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("SHARE_SHEET_EDIT_SECTION_TITLE_FAVORITES"));
  v16 = a1[4];
  if (v15)
    objc_msgSend(v16, "favoritesByUUID");
  else
    objc_msgSend(v16, "suggestionsByUUID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "objectForKeyedSubscript:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIActivityUserDefaultsActivityCell setDisabled:](v8, "setDisabled:", objc_msgSend(v18, "isDisabled"));
  -[_UIActivityUserDefaultsActivityCell setActivityProxy:](v8, "setActivityProxy:", v18);
  objc_msgSend(a1[4], "activitiesByUUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKeyedSubscript:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(v21, "_activitySettingsImage");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityUserDefaultsActivityCell activityImageView](v8, "activityImageView");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setImage:", v36);

      -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setAlpha:", 1.0);

      objc_msgSend(v21, "activityTitle");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      _convertToSingleLine(v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "setText:", v40);

      -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "setNumberOfLines:", 0);

      -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v43) = 0.5;
      objc_msgSend(v33, "_setHyphenationFactor:", v43);
      goto LABEL_11;
    }
  }
  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAlpha:", 1.0);

  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setNumberOfLines:", 0);

  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = 0.5;
  objc_msgSend(v24, "_setHyphenationFactor:", v25);

  objc_msgSend(v18, "applicationBundleIdentifier");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v18, "activityTitle");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "text");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _convertToSingleLine(v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setText:", v29);

    objc_msgSend(a1[4], "view");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "traitCollection");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "preferredContentSizeCategory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[4], "activityImageProvider");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "applicationBundleIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v64[0] = MEMORY[0x1E0C809B0];
    v64[1] = 3221225472;
    v64[2] = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_2;
    v64[3] = &unk_1E4001480;
    v65 = v8;
    v66 = v7;
    objc_msgSend(v34, "requestImageForBundleIdentifier:activityCategory:contentSizeCategory:iconFormat:synchronous:resultHandler:", v35, 1, v33, 0, 0, v64);

LABEL_11:
    goto LABEL_13;
  }
  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setAlpha:", 0.0);

  -[_UIActivityUserDefaultsActivityCell activityTitleLabel](v8, "activityTitleLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setText:", 0);

  -[_UIActivityUserDefaultsActivityCell activityImageView](v8, "activityImageView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setImage:", 0);

  LODWORD(v46) = objc_msgSend(v18, "iconImageSlotID");
  objc_msgSend(v18, "activityTitle");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "slotIdentifier");

  v49 = (void *)*MEMORY[0x1E0DC4730];
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_3;
  v59[3] = &unk_1E40014A8;
  v62 = (int)v46;
  v50 = v8;
  v60 = v50;
  v63 = v48;
  v61 = a1[5];
  objc_msgSend(v49, "_performBlockAfterCATransactionCommits:", v59);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v51 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v52 = objc_msgSend(v51, "CGColor");
  -[_UIActivityUserDefaultsActivityCell activityTitleView](v50, "activityTitleView");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "layer");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "setContentsMultiplyColor:", v52);

LABEL_13:
  objc_msgSend(a1[4], "configureSwitchForCell:activityProxy:", v8, v18);
  if (!objc_msgSend(a1[4], "activityCategory"))
  {
    -[_UIActivityUserDefaultsActivityCell imageViewWidthConstraint](v8, "imageViewWidthConstraint");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setConstant:", 0.0);

    -[_UIActivityUserDefaultsActivityCell imageViewLeadingConstraint](v8, "imageViewLeadingConstraint");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setConstant:", 0.0);

    -[_UIActivityUserDefaultsActivityCell labelLeadingConstraint](v8, "labelLeadingConstraint");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setConstant:", 0.0);

  }
  return v8;
}

void __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  int v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(*(id *)(a1 + 32), "activityProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqual:", *(_QWORD *)(a1 + 40));

  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "activityImageView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setImage:", v7);

  }
}

void __52___UIActivityUserDefaultsViewController_viewDidLoad__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 48));
  v19 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *MEMORY[0x1E0CD2F88];
  objc_msgSend(*(id *)(a1 + 32), "activityImageSlotView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentsGravity:", v2);

  objc_msgSend(*(id *)(a1 + 32), "activityImageSlotView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setContents:", v19);

  objc_msgSend(MEMORY[0x1E0CD2720], "objectForSlot:", *(unsigned int *)(a1 + 52));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = _ShareSheetDeviceScreenScale();
  objc_msgSend(*(id *)(a1 + 32), "activityTitleView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setContentsScale:", v8);

  v11 = _ShareSheetDeviceScreenScale();
  objc_msgSend(*(id *)(a1 + 32), "activityTitleView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRasterizationScale:", v11);

  v14 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "activityTitleView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setContentsGravity:", v14);

  objc_msgSend(*(id *)(a1 + 32), "activityTitleView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setContents:", v7);

}

@end
