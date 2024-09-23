@implementation SBHDefaultIconListLayoutProvider

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cachedListLayouts;

  v4 = a3;
  -[NSMutableDictionary objectForKey:](self->_cachedListLayouts, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!self->_cachedListLayouts)
    {
      v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      cachedListLayouts = self->_cachedListLayouts;
      self->_cachedListLayouts = v6;

    }
    -[SBHDefaultIconListLayoutProvider makeLayoutForIconLocation:](self, "makeLayoutForIconLocation:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_cachedListLayouts, "setObject:forKey:", v5, v4);
  }

  return v5;
}

+ (SBHDefaultIconListLayoutProvider)frameworkFallbackInstance
{
  if (frameworkFallbackInstance_onceToken != -1)
    dispatch_once(&frameworkFallbackInstance_onceToken, &__block_literal_global_70);
  return (SBHDefaultIconListLayoutProvider *)(id)frameworkFallbackInstance_instance;
}

void __61__SBHDefaultIconListLayoutProvider_frameworkFallbackInstance__block_invoke()
{
  SBHDefaultIconListLayoutProvider *v0;
  void *v1;

  v0 = objc_alloc_init(SBHDefaultIconListLayoutProvider);
  v1 = (void *)frameworkFallbackInstance_instance;
  frameworkFallbackInstance_instance = (uint64_t)v0;

}

- (SBHDefaultIconListLayoutProvider)init
{
  uint64_t v3;

  v3 = objc_msgSend((id)objc_opt_class(), "currentDeviceScreenType");
  return -[SBHDefaultIconListLayoutProvider initWithScreenType:layoutOptions:](self, "initWithScreenType:layoutOptions:", v3, objc_msgSend((id)objc_opt_class(), "defaultLayoutOptions"));
}

- (void)configureRootFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  char v5;
  id v8;
  void *v9;
  double v10;
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
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  uint64_t v34;
  double v35;
  double v36;
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
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  uint64_t v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;

  v5 = a5;
  v8 = a3;
  v9 = v8;
  if (a4 <= 0x2F)
    objc_msgSend(v8, "setIdleTextVerticalOffset:", dbl_1D0194F80[a4]);
  v10 = 12.0;
  v11 = 10.0;
  v12 = 25.0;
  v13 = 26.0;
  v14 = 20.0;
  v15 = 22.0;
  v16 = 30.0;
  v17 = 66.0;
  v18 = 18.0;
  v19 = 60.0;
  v20 = 14.0;
  *(double *)&v21 = 52.0;
  v22 = 24.0;
  v23 = 3.0;
  v24 = 58.0;
  v25 = 2.0;
  v26 = 50.0;
  v27 = 10.0;
  v28 = 10.0;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
      goto LABEL_5;
    case 2uLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 5.0, 6.0, 10.0, 12.0, 25.0, 18.0, 2.0, 30.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 50.0, 24.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
      objc_msgSend(v9, "setPageControlVerticalOffset:", 5.66666667);
LABEL_48:
      objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v37 = 7.0;
      v38 = 7.0;
      goto LABEL_56;
    case 3uLL:
    case 6uLL:
    case 8uLL:
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      v22 = 26.0;
      v25 = 16.0;
      v26 = 60.0;
      v23 = 16.0;
      goto LABEL_5;
    case 4uLL:
      goto LABEL_19;
    case 5uLL:
    case 7uLL:
      v22 = 26.0;
      v23 = 16.0;
      v25 = 28.0;
      v26 = 60.0;
LABEL_5:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v25, v23, 10.0, 12.0, 25.0, 18.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v26, v22);
      goto LABEL_6;
    case 9uLL:
      goto LABEL_13;
    case 0xAuLL:
      goto LABEL_16;
    case 0xBuLL:
      goto LABEL_26;
    case 0xCuLL:
      v27 = 16.0;
      v11 = 13.0;
      goto LABEL_19;
    case 0xDuLL:
      goto LABEL_30;
    case 0xEuLL:
      goto LABEL_23;
    case 0xFuLL:
      v20 = 25.0;
      v24 = 64.0;
LABEL_13:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v20, 19.0, 10.0, 12.0, 25.0, 18.0, 2.0, 30.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v24, 26.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_14:
      v30 = 11.3333333;
      goto LABEL_42;
    case 0x10uLL:
      v28 = 18.0;
      v11 = 16.0;
      *(double *)&v21 = 60.0;
LABEL_16:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v11, v28);
      v31 = v9;
      v32 = *(double *)&v21;
      v33 = 26.0;
      goto LABEL_35;
    case 0x11uLL:
      v14 = 30.0;
      v19 = 66.0;
      goto LABEL_26;
    case 0x12uLL:
      v27 = 16.0;
      v11 = 18.0;
LABEL_19:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v11, v27);
      objc_msgSend(v9, "setEditModeButtonSize:", 60.0, 26.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_20:
      v30 = 9.0;
      goto LABEL_42;
    case 0x13uLL:
      v14 = 23.0;
      v17 = 68.0;
      *(double *)&v34 = 42.0;
      goto LABEL_29;
    case 0x14uLL:
      v15 = 28.0;
      v17 = 68.0;
      v13 = 28.0;
LABEL_23:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v15, 20.0, 10.0, 12.0, 25.0, 18.0, 2.0, 30.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v17, v13);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_24:
      v30 = 14.0;
      goto LABEL_42;
    case 0x15uLL:
      v13 = 28.0;
      v18 = 16.0;
      v19 = 66.0;
      v14 = 37.0;
LABEL_26:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v14, v18, 10.0, 12.0, 25.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v19, v13);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_27:
      v30 = 5.66666667;
      goto LABEL_42;
    case 0x16uLL:
      goto LABEL_34;
    case 0x17uLL:
      v14 = 16.0;
      v17 = 68.0;
      *(double *)&v34 = 50.0;
LABEL_29:
      v16 = *(double *)&v34;
LABEL_30:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", v16, v14, 10.0, 12.0, 25.0, 18.0, 2.0);
      objc_msgSend(v9, "setEditModeButtonSize:", v17, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_31:
      v30 = 13.0;
      goto LABEL_42;
    case 0x18uLL:
      goto LABEL_40;
    case 0x19uLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 39.0, 19.0, 10.0, 12.0, 25.0, 18.0, 2.0, 30.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 66.0, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
      v29 = 7.66666667;
      goto LABEL_53;
    case 0x1AuLL:
      v11 = 12.0;
LABEL_34:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 25.0, v11);
      v32 = 66.0;
      v33 = 28.0;
      v31 = v9;
LABEL_35:
      objc_msgSend(v31, "setEditModeButtonSize:", v32, v33);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_36:
      v30 = 7.66666667;
      goto LABEL_42;
    case 0x1BuLL:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 50.0, 19.0, 10.0, 12.0, 25.0, 18.0, 2.0, 30.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 68.0, 28.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_38:
      v29 = 15.6666667;
LABEL_53:
      objc_msgSend(v9, "setPageControlVerticalOffset:", v29);
LABEL_54:
      v35 = 0.0;
      v36 = -13.5;
LABEL_55:
      objc_msgSend(v9, "setPageControlFrameInset:", v35, v36);
      v37 = 15.0;
      v38 = 15.0;
LABEL_56:
      objc_msgSend(v9, "setPageControlCustomPadding:", v37, v38);
LABEL_57:
      objc_msgSend(v9, "setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:", -1.0, v29);
      if (a4 <= 0x2F)
      {
        if (((1 << a4) & 0x1FFFFFF8) != 0)
        {
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
          v90 = 0u;
          v91 = 0u;
          v88 = 0u;
          v89 = 0u;
          v87 = 0u;
          getRootMetrics(a4, v5, (uint64_t)&v87);
          v39 = *(double *)&v88;
          SBHDefaultIconImageSize(a4, v5);
          if ((v5 & 8) != 0)
            SBHDefaultIconImageSize(a4, 0);
          v41 = v40;
          v44 = _SBHDefaultDockPlatterMetrics(a4, v5);
          v45 = v42;
          v46 = v39 - v44;
          if (v43 <= -100.0)
            v47 = v39 - v44;
          else
            v47 = v43;
          v48 = v47 + v41 + v42 + v47;
          v49 = SBHDisplayCornerRadiusForScreenType(a4) - v44;
          v50 = SBHDefaultIconImageContinuousCornerRadius(v41) + v46;
          if (v49 >= v50)
            v51 = v49;
          else
            v51 = v50;
          v52 = _SBHDefaultDockCornerRadiusAdjustment(a4, v5) + v51;
          objc_msgSend(v9, "setDockViewHeight:", v48);
          objc_msgSend(v9, "setDockBackgroundViewCornerRadius:", v52);
          objc_msgSend(v9, "setDockBackgroundViewInsets:", 0.0, v44, v45, v44);
          v53 = 0.0;
          v54 = 0.0;
          v55 = 0.0;
          v56 = v9;
          v57 = v45;
        }
        else if (((1 << a4) & 0xFFFFE0000000) != 0)
        {
          objc_msgSend(v9, "setDockViewHeight:", 0.0);
          objc_msgSend(v9, "setDockBackgroundViewCornerRadius:", 0.0);
          v58 = *MEMORY[0x1E0DC49E8];
          v59 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
          v60 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
          v61 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
          objc_msgSend(v9, "setDockBackgroundViewInsets:", *MEMORY[0x1E0DC49E8], v59, v60, v61);
          v56 = v9;
          v53 = v58;
          v54 = v59;
          v57 = v60;
          v55 = v61;
        }
        else
        {
LABEL_88:
          objc_msgSend(v9, "setDockViewHeight:", 96.0);
          objc_msgSend(v9, "setDockBackgroundViewCornerRadius:", 0.0);
          objc_msgSend(v9, "setDockBackgroundViewInsets:", 4.0, 0.0, 0.0, 0.0);
          v53 = 4.0;
          v54 = 0.0;
          v57 = 0.0;
          v55 = 0.0;
          v56 = v9;
        }
        objc_msgSend(v56, "setDockListViewInsets:", v53, v54, v57, v55);
      }
      objc_msgSend(v9, "setPageManagementPageCheckboxVerticalMargin:", 12.0);
      v62 = 36.0;
      objc_msgSend(v9, "setPageManagementPageCheckboxDiameter:", 36.0);
      objc_msgSend(v9, "setPageManagementFocusModeOptionsButtonSize:", 132.0, 42.0);
      if (a4 - 29 >= 0x13)
      {
        v70 = SBHDefaultScreenSizeBucket(a4);
        v66 = 0.45;
        if (v70)
        {
          if (v70 == 2)
          {
            v84 = 26.0;
            v86 = 28.0;
            v85 = 0.21;
            v82 = 52.0;
            v83 = 216.0;
            v68 = 36.0;
            v64 = 0.32;
            v69 = 108.0;
            v65 = 42.0;
            v63 = 42.0;
            v67 = 42.0;
          }
          else
          {
            if (v70 != 1)
              goto LABEL_81;
            v84 = 20.0;
            v86 = 26.0;
            v85 = 0.21;
            v82 = 40.0;
            v83 = 160.0;
            v68 = 32.0;
            v64 = 0.32;
            v69 = 96.0;
            v67 = 38.0;
            v65 = 36.0;
            v63 = 36.0;
          }
          v62 = v68;
        }
        else
        {
          v84 = 16.0;
          v86 = 21.0;
          v68 = 24.0;
          v85 = 0.21;
          v65 = 32.0;
          v83 = 120.0;
          v64 = 0.32;
          v69 = 48.0;
          v67 = 38.0;
          v63 = 32.0;
          v62 = 24.0;
          v82 = 32.0;
        }
      }
      else
      {
        v85 = 0.22;
        v63 = 40.0;
        v86 = 64.0;
        v64 = 0.35;
        v65 = 56.0;
        v66 = 0.48;
        v67 = 56.0;
        v68 = 40.0;
        v69 = 40.0;
        v83 = 40.0;
        v84 = 36.0;
        v82 = 40.0;
      }
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 0, 0.0, 0.0, 0.0, v66);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 1, v65, v63, 0.0, v64);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 2, v67, v68, v69, v64);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 3, v86, v62, v83, v85);
      objc_msgSend(v9, "setPageManagementLayoutMetrics:forLayoutConfiguration:", 4, v86, v84, v82, v85);
LABEL_81:
      v71 = 14.0;
      if (a4 < 0x1D)
        goto LABEL_84;
      if (a4 - 29 <= 0x12)
      {
        v71 = -10000.0;
LABEL_84:
        objc_msgSend(v9, "setEditingEntryAreaHorizontalInset:", v71);
      }
      if ((-[SBHDefaultIconListLayoutProvider layoutOptions](self, "layoutOptions") & 8) != 0)
      {
        objc_msgSend(v9, "dockBackgroundViewInsets");
        UIEdgeInsetsAdd();
        v73 = v72;
        v75 = v74;
        v77 = v76;
        v79 = v78;
        objc_msgSend(v9, "dockBackgroundViewCornerRadius");
        v81 = v80;
        objc_msgSend(v9, "setDockBackgroundViewInsets:", v73, v75, v77, v79);
        objc_msgSend(v9, "setDockBackgroundViewCornerRadius:", v81 + 0.0);
      }

      return;
    case 0x1CuLL:
      v10 = 14.0;
LABEL_40:
      objc_msgSend(v9, "setEditModeButtonLayoutOffset:", 40.0, v10, 10.0);
      objc_msgSend(v9, "setEditModeButtonSize:", 68.0, 27.0);
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0);
LABEL_41:
      v30 = 12.6666667;
LABEL_42:
      objc_msgSend(v9, "setPageControlVerticalOffset:", v30, v29);
LABEL_43:
      switch(a4)
      {
        case 0uLL:
          goto LABEL_48;
        case 1uLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          objc_msgSend(v9, "setPageControlCustomPadding:", 4.5, 4.5);
          objc_msgSend(v9, "setScrollAccessoryVerticalOffsetAdjustmentForAuxiliaryView:", -1.0);
          goto LABEL_88;
        case 3uLL:
        case 6uLL:
        case 8uLL:
        case 9uLL:
        case 0xEuLL:
        case 0xFuLL:
        case 0x14uLL:
        case 0x18uLL:
        case 0x1CuLL:
          goto LABEL_51;
        case 4uLL:
        case 0xAuLL:
        case 0xCuLL:
        case 0x10uLL:
        case 0x12uLL:
        case 0x16uLL:
        case 0x1AuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", 0.0, -2.5);
          v37 = *MEMORY[0x1E0C9D820];
          v38 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          goto LABEL_56;
        case 5uLL:
        case 7uLL:
        case 0xBuLL:
        case 0xDuLL:
        case 0x11uLL:
        case 0x13uLL:
        case 0x15uLL:
        case 0x17uLL:
        case 0x19uLL:
        case 0x1BuLL:
          goto LABEL_54;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x29uLL:
        case 0x2EuLL:
          v35 = *MEMORY[0x1E0C9D820];
          v36 = *(double *)(MEMORY[0x1E0C9D820] + 8);
          goto LABEL_55;
        case 0x21uLL:
        case 0x28uLL:
        case 0x2AuLL:
        case 0x2DuLL:
        case 0x2FuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v38 = 13.0;
          v37 = 19.0;
          goto LABEL_56;
        case 0x26uLL:
        case 0x27uLL:
        case 0x2BuLL:
        case 0x2CuLL:
          objc_msgSend(v9, "setPageControlFrameInset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
          v38 = 13.0;
          v37 = 18.0;
          goto LABEL_56;
        default:
          goto LABEL_57;
      }
    default:
LABEL_6:
      objc_msgSend(v9, "setEditModeButtonContentEdgeInsets:", 16.0, 16.0, 16.0, 16.0, v12, v18, v25, v16);
      v29 = 7.66666667;
      v30 = 0.666666667;
      switch(a4)
      {
        case 0uLL:
        case 1uLL:
          goto LABEL_42;
        case 3uLL:
        case 6uLL:
          v30 = 13.3333333;
          goto LABEL_42;
        case 4uLL:
        case 0xCuLL:
        case 0x12uLL:
          goto LABEL_20;
        case 5uLL:
        case 0x19uLL:
          goto LABEL_53;
        case 7uLL:
          v29 = 6.5;
          goto LABEL_53;
        case 8uLL:
          objc_msgSend(v9, "setPageControlVerticalOffset:", 13.0, 7.66666667);
LABEL_51:
          v35 = 0.0;
          v36 = -2.5;
          goto LABEL_55;
        case 9uLL:
        case 0xFuLL:
          goto LABEL_14;
        case 0xAuLL:
        case 0x10uLL:
        case 0x16uLL:
        case 0x1AuLL:
          goto LABEL_36;
        case 0xBuLL:
        case 0x11uLL:
        case 0x15uLL:
          goto LABEL_27;
        case 0xDuLL:
        case 0x13uLL:
        case 0x17uLL:
          goto LABEL_31;
        case 0xEuLL:
        case 0x14uLL:
          goto LABEL_24;
        case 0x18uLL:
        case 0x1CuLL:
          goto LABEL_41;
        case 0x1BuLL:
          goto LABEL_38;
        case 0x1DuLL:
        case 0x1EuLL:
        case 0x1FuLL:
        case 0x20uLL:
        case 0x21uLL:
        case 0x22uLL:
        case 0x23uLL:
        case 0x24uLL:
        case 0x25uLL:
        case 0x26uLL:
        case 0x27uLL:
        case 0x28uLL:
        case 0x29uLL:
        case 0x2AuLL:
        case 0x2BuLL:
        case 0x2CuLL:
        case 0x2DuLL:
        case 0x2EuLL:
        case 0x2FuLL:
          v30 = 0.0;
          goto LABEL_42;
        default:
          goto LABEL_43;
      }
  }
}

+ (unint64_t)defaultLayoutOptions
{
  return 0;
}

- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3 layoutOptions:(unint64_t)a4
{
  SBHDefaultIconListLayoutProvider *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHDefaultIconListLayoutProvider;
  result = -[SBHDefaultIconListLayoutProvider init](&v7, sel_init);
  if (result)
  {
    result->_screenType = a3;
    result->_layoutOptions = a4;
  }
  return result;
}

- (id)makeLayoutForIconLocation:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  SBIconListGridLayoutConfiguration *v9;
  uint64_t v10;
  id v11;
  SBIconListGridLayoutConfiguration *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  _BOOL4 v34;
  uint64_t v35;
  double v36;
  double v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
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
  double v53;
  double v54;
  double v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  double *v60;
  double v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _BOOL4 IsPhone;
  double v76;
  __CFString *v77;
  uint64_t v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  double v83;
  double v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  double v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  unint64_t v107;
  void *v108;
  double v109;
  double v110;
  unint64_t v111;
  double v112;
  double v113;
  unint64_t v114;
  double v115;
  _BOOL4 IsPad;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  double v126;
  double v127;
  double v128;
  double v129;
  _BOOL4 v130;
  uint64_t v131;
  void *v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  void *v144;
  void *v145;
  void *v146;
  double v147;
  double v148;
  double v149;
  void *v150;
  uint64_t v151;
  double v152;
  double v153;
  double v154;
  double v155;
  double v156;
  void *v157;
  __CFString *v158;
  SBHDefaultIconListLayoutProvider *v159;
  double v160[5];
  _QWORD v161[5];
  _QWORD v162[5];
  _QWORD v163[4];
  SBIconListGridLayoutConfiguration *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _QWORD v169[5];
  double v170[5];
  _QWORD v171[5];
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  _QWORD v181[4];
  id v182;
  SBIconListGridLayoutConfiguration *v183;

  v4 = a3;
  v5 = -[SBHDefaultIconListLayoutProvider screenType](self, "screenType");
  v6 = -[SBHDefaultIconListLayoutProvider layoutOptionsForIconLocation:](self, "layoutOptionsForIconLocation:", v4);
  _SBHDefaultIconGridSizeClassIconImageInfos(v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _SBHDefaultIconGridSizeClassEditingAnimationStrengths(v4, v5);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc_init(SBIconListGridLayoutConfiguration);
  -[SBIconListGridLayoutConfiguration setEditingAnimationStrengths:](v9, "setEditingAnimationStrengths:", v8);
  v10 = MEMORY[0x1E0C809B0];
  v181[0] = MEMORY[0x1E0C809B0];
  v181[1] = 3221225472;
  v181[2] = __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke;
  v181[3] = &unk_1E8D8B540;
  v11 = v7;
  v182 = v11;
  v12 = v9;
  v183 = v12;
  SBHEnumerateIconGridSizeClasses(v181);
  -[SBIconListGridLayoutConfiguration setWidgetContentMargins:](v12, "setWidgetContentMargins:", SBHDefaultWidgetContentMargins(v5));
  -[SBIconListGridLayoutConfiguration sidebarVisualConfiguration](v12, "sidebarVisualConfiguration");
  v159 = self;
  v150 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDefaultIconListLayoutProvider configureSidebarConfiguration:forScreenType:iconLocation:layoutOptions:](self, "configureSidebarConfiguration:forScreenType:iconLocation:layoutOptions:");
  v13 = _SBHDefaultNumberOfRowsAndColumnsInFolders(v5);
  v14 = *MEMORY[0x1E0DC49E8];
  v15 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
  v17 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
  v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  v18 = *MEMORY[0x1E0C9D820];
  v19 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  v158 = CFSTR("SBHIconGridSizeClassDefault");
  v155 = v14;
  v156 = v16;
  v144 = (void *)v8;
  v145 = v4;
  v146 = v11;
  v151 = v13;
  v154 = v17;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationFloatingDock")))
  {
    if ((v6 & 4) != 0)
      v20 = objc_msgSend((id)objc_opt_class(), "extendedFloatingDockCapacityIconCount");
    else
      v20 = 0;
    v147 = v19;
    v148 = v18;
    switch(v5)
    {
      case 0uLL:
      case 1uLL:
      case 2uLL:
      case 3uLL:
      case 4uLL:
      case 5uLL:
      case 6uLL:
      case 7uLL:
      case 8uLL:
      case 9uLL:
      case 0xAuLL:
      case 0xBuLL:
      case 0xCuLL:
      case 0xDuLL:
      case 0xEuLL:
      case 0xFuLL:
      case 0x10uLL:
      case 0x11uLL:
      case 0x12uLL:
      case 0x13uLL:
      case 0x14uLL:
      case 0x15uLL:
      case 0x16uLL:
      case 0x17uLL:
      case 0x18uLL:
      case 0x19uLL:
      case 0x1AuLL:
      case 0x1BuLL:
      case 0x1CuLL:
        v33 = 0;
        v34 = 0;
        v23 = 0;
        v35 = 0;
        v39 = 4;
        break;
      case 0x1DuLL:
      case 0x1FuLL:
      case 0x20uLL:
      case 0x23uLL:
      case 0x24uLL:
      case 0x25uLL:
      case 0x26uLL:
      case 0x27uLL:
      case 0x29uLL:
      case 0x2BuLL:
      case 0x2CuLL:
      case 0x2EuLL:
        v33 = 0;
        v34 = 0;
        v23 = 0;
        v35 = 0;
        v39 = v20 + 14;
        break;
      case 0x1EuLL:
      case 0x22uLL:
        v33 = 0;
        v34 = 0;
        v23 = 0;
        v35 = 0;
        v39 = v20 + 12;
        break;
      case 0x21uLL:
      case 0x28uLL:
      case 0x2AuLL:
      case 0x2DuLL:
      case 0x2FuLL:
        v33 = 0;
        v34 = 0;
        v23 = 0;
        v35 = 0;
        v39 = v20 + 17;
        break;
      default:
        v33 = 0;
        v34 = 0;
        v23 = 0;
        v35 = 0;
        v39 = 0;
        break;
    }
    v38 = 1;
    v142 = v17;
    v143 = v16;
    v140 = v14;
    v141 = v15;
    v28 = v16;
    v37 = v17;
    v152 = v15;
    v36 = v14;
    v32 = v16;
    v30 = v17;
    v27 = v15;
    goto LABEL_51;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationDock")))
  {
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v172 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v172);
    SBHGetScreenSpecification(v5, (uint64_t)v171);
    v147 = *(double *)&v171[1];
    v148 = *(double *)v171;
    UIEdgeInsetsAdd();
    v21 = v15;
    v22 = v14;
    v23 = 1;
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    _SBHDefaultDockAdditionalIconInset(v5, v6);
    UIEdgeInsetsAdd();
    v14 = v24;
    v25 = v17;
    v27 = v26;
    v28 = v16;
    v30 = v29;
    v32 = v31;
    v33 = 0;
    v34 = 0;
    v35 = 4;
    v142 = v25;
    v143 = v28;
    v140 = v22;
    v141 = v21;
    v152 = v21;
    v36 = v22;
    v15 = v21;
    v37 = v25;
    v38 = 1;
    v39 = 4;
    goto LABEL_51;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationFolder")))
  {
    v147 = v19;
    v148 = v18;
    v153 = v15;
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v172 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v172);
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v47 = v46;
    objc_msgSend(v11, "iconImageInfoForGridSizeClass:", v158);
    v49 = v48;
    v51 = v50;
    SBHGetScreenSpecification(v5, (uint64_t)v170);
    v52 = SBHCalculateIconSpacing(v172, v170[0], v170[1], v41, v43, v45, v47, v49);
    v53 = v52;
    v55 = v54;
    if (v5 > 0x2F)
    {
      v37 = 0.0;
      v36 = 0.0;
      v15 = v153;
    }
    else
    {
      v15 = v153;
      if (((1 << v5) & 0x1FFFFFFF) != 0)
      {
        v37 = 52.0;
        v36 = v52;
      }
      else
      {
        if (((1 << v5) & 0x5AFDE0000000) != 0)
        {
          v36 = 43.0;
          *(double *)&v62 = 64.0;
        }
        else
        {
          v36 = 63.0;
          *(double *)&v62 = 80.0;
        }
        v37 = *(double *)&v62;
      }
    }
    -[SBIconListGridLayoutConfiguration floatyFolderVisualConfiguration](v12, "floatyFolderVisualConfiguration");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v79, "setContentBackgroundSize:", v53 * (double)(unint64_t)(v13 + 1) + v49 * (double)(unint64_t)v13, v53 + v51 * (double)(unint64_t)v13 + v55 * (double)(unint64_t)(v13 - 1) + 16.0 + 36.0);
    objc_msgSend(v79, "setPageControlAreaHeight:", 36.0);
    -[SBHDefaultIconListLayoutProvider configureFloatyFolderConfiguration:forScreenType:layoutOptions:](self, "configureFloatyFolderConfiguration:forScreenType:layoutOptions:", v79, v5, v6);

    v33 = 0;
    v34 = 0;
    v23 = 0;
    v35 = 0;
    v142 = v17;
    v143 = v156;
    v140 = v155;
    v141 = v15;
    v152 = v36;
    v32 = v36;
    v30 = v37;
    v27 = v36;
    v28 = v36;
    v14 = v36;
    v38 = v13;
    v39 = v13;
    goto LABEL_51;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationRoot")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationRootWithWidgets")))
  {
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v172 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v172);
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationRoot")))
    {
      v56 = v172;
      v57 = BYTE1(v172);
      v58 = BYTE2(v172);
      v59 = BYTE3(v172);
      v36 = *((double *)&v174 + 1);
      v152 = *(double *)&v175;
      v60 = (double *)&v176;
      v61 = *((double *)&v175 + 1);
    }
    else
    {
      v56 = BYTE8(v176);
      v57 = BYTE9(v176);
      v58 = BYTE10(v176);
      v59 = BYTE11(v176);
      v152 = *((double *)&v179 + 1);
      v36 = *(double *)&v179;
      v60 = (double *)&v180 + 1;
      v61 = *(double *)&v180;
    }
    v149 = v61;
    v28 = *v60;
    v39 = v56;
    v38 = v57;
    v35 = v58;
    v23 = v59;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    v140 = v63;
    v141 = v64;
    v142 = v65;
    v143 = v66;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    v154 = v68;
    v155 = v67;
    v15 = v69;
    v156 = v70;
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    v14 = v71;
    v27 = v72;
    v30 = v73;
    v32 = v74;
    IsPhone = SBHScreenTypeIsPhone(v5);
    v76 = 0.0;
    if ((v6 & 0x18) != 0)
    {
      v33 = IsPhone;
    }
    else
    {
      v76 = v30;
      v33 = 0;
    }
    v34 = (v6 & 0x18) == 0 && IsPhone;
    if (IsPhone)
      v30 = v76;
    if (SBHScreenTypeIsPad(v5))
    {
      v77 = CFSTR("SBHIconGridSizeClassLarge");

      v158 = v77;
    }
    v37 = v149;
    SBHGetScreenSpecification(v5, (uint64_t)v169);
    v147 = *(double *)&v169[1];
    v148 = *(double *)v169;
    goto LABEL_51;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibrary")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryOverlay")))
  {
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v172 = 0u;
    v78 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    getRootMetrics(v78, v6, (uint64_t)&v172);
    v152 = *(double *)&v173;
    v32 = *(double *)&v174;
    if (SBHScreenTypeIsPhone(v5))
    {
      v35 = v172;
      v139 = 8.0;
      v37 = 20.0;
    }
    else
    {
      _SBHDefaultIconGridSizeClassIconImageInfos(v78, v6);
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v80, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
      v82 = v81;
      v83 = v15;
      v84 = v14;
      v86 = v85;
      v88 = v87;
      objc_msgSend(v11, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
      v90 = v89;
      v163[0] = v10;
      v163[1] = 3221225472;
      v163[2] = __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke_2;
      v163[3] = &unk_1E8D88FF8;
      v164 = v12;
      v165 = v82;
      v166 = v86;
      v14 = v84;
      v15 = v83;
      v16 = v156;
      v167 = v90;
      v168 = v88;
      SBHEnumerateIconGridSizeClasses(v163);

      v32 = 0.0;
      v35 = 4;
      v37 = 130.0;
      v152 = 0.0;
      v139 = 0.0;
    }
    if (SBHScreenTypeHasHomeButton(v5) && SBHScreenTypeIsPhone(v5))
    {
      v91 = SBHDefaultScreenSizeBucket(v5);
      v92 = 35.0;
      if (!v91)
        v92 = 24.0;
      v37 = v37 + v92;
    }
    SBHGetScreenSpecification(v78, (uint64_t)v162);
    v147 = *(double *)&v162[1];
    v148 = *(double *)v162;
    -[SBIconListGridLayoutConfiguration appLibraryVisualConfiguration](v12, "appLibraryVisualConfiguration");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHDefaultIconListLayoutProvider configureAppLibraryConfiguration:forScreenType:iconLocation:layoutOptions:](self, "configureAppLibraryConfiguration:forScreenType:iconLocation:layoutOptions:", v93, v5, v4, v6);

    v33 = 0;
    v34 = 0;
    v23 = 0x7FFFFFFFFFFFFFFFLL;
    v142 = v17;
    v143 = v16;
    v140 = v14;
    v141 = v15;
    v28 = v32;
    v30 = v37;
    v27 = v152;
    v36 = v139;
    v14 = v139;
    v38 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_48:
    v39 = v35;
    goto LABEL_51;
  }
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPod")) & 1) != 0
    || (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodSuggestions")) & 1) != 0
    || objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodRecents")))
  {
    v32 = _SBHDefaultCategoryPodIconInset(v5);
    v107 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    _SBHDefaultIconGridSizeClassIconImageInfos(v107, v6);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v108, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    v147 = v110;
    v148 = v109;

    v33 = 0;
    v34 = 0;
    v23 = 2;
    v142 = v17;
    v143 = v16;
    v140 = v14;
    v141 = v15;
    v14 = v32;
    v37 = v32;
    v152 = v32;
    v36 = v32;
    v30 = v32;
    v27 = v32;
    v28 = v32;
    v35 = 2;
    v38 = 2;
    v39 = 2;
    goto LABEL_51;
  }
  v147 = v19;
  v148 = v18;
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodAdditionalItems")) & 1) != 0)
  {
    v33 = 0;
    v34 = 0;
    v23 = 0;
    v35 = 0;
    v28 = 0.0;
    v37 = 0.0;
    v151 = 2;
    v142 = v17;
    v143 = v16;
    v152 = 0.0;
    v140 = v14;
    v141 = v15;
    v36 = 0.0;
    v32 = 0.0;
    v30 = 0.0;
    v27 = 0.0;
    v14 = 0.0;
    v38 = 2;
    v39 = 2;
    goto LABEL_51;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodExpanded")))
  {
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch")))
    {
      objc_msgSend(v11, "iconImageInfoForGridSizeClass:", v158);
      -[SBIconListGridLayoutConfiguration setIconImageInfo:forGridSizeClass:](v12, "setIconImageInfo:forGridSizeClass:", v158, 48.0, 48.0, v112, SBHDefaultIconImageContinuousCornerRadius(48.0));
      v33 = 0;
      v34 = 0;
      v23 = 0;
      v35 = 0;
      v38 = 1;
      v142 = v17;
      v143 = v16;
      v140 = v14;
      v141 = v15;
      v28 = v16;
      v113 = v17;
      v152 = v15;
      v36 = v14;
      v32 = v16;
      v30 = v17;
      v27 = v15;
      v37 = v113;
      v39 = 1;
      goto LABEL_51;
    }
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationTodayView")) & 1) == 0
      && !objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationTodayViewOverlay")))
    {
      v33 = 0;
      v34 = 0;
      v23 = 0;
      v35 = 0;
      v38 = 3;
      v142 = v17;
      v143 = v16;
      v140 = v14;
      v141 = v15;
      v28 = v16;
      v37 = v17;
      v152 = v15;
      v36 = v14;
      v32 = v16;
      v30 = v17;
      v27 = v15;
      v39 = 3;
      goto LABEL_51;
    }
    v179 = 0u;
    v180 = 0u;
    v177 = 0u;
    v178 = 0u;
    v175 = 0u;
    v176 = 0u;
    v173 = 0u;
    v174 = 0u;
    v172 = 0u;
    getRootMetrics(v5, v6, (uint64_t)&v172);
    IsPad = SBHScreenTypeIsPad(v5);
    if (IsPad)
      v35 = 2;
    else
      v35 = 4;
    objc_msgSend(v150, "searchBarTopOffset");
    SBHDefaultAdditionalLayoutInsetsForOrientation();
    UIEdgeInsetsAdd();
    v139 = v117;
    v152 = v118;
    v120 = v119;
    v32 = v121;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    v140 = v122;
    v141 = v123;
    v142 = v124;
    v143 = v125;
    SBHDefaultAdditionalWidgetLayoutInsetsForOrientation();
    v154 = v127;
    v155 = v126;
    v15 = v128;
    v156 = v129;
    v130 = SBHScreenTypeIsPhone(v5);
    v34 = (v6 & 0x18) == 0 && v130;
    v131 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
    SBHGetScreenSpecification(v131, (uint64_t)v161);
    v148 = *(double *)v161;
    v147 = *(double *)&v161[1];
    if (IsPad)
    {
      _SBHDefaultIconGridSizeClassIconImageInfos(v5, v6);
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v132, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
      v134 = v133;
      v136 = v135;
      objc_msgSend(v11, "iconImageInfoForGridSizeClass:", v158);
      -[SBIconListGridLayoutConfiguration setIconImageInfo:forGridSizeClass:](v12, "setIconImageInfo:forGridSizeClass:", v158, v134, v136);

      v33 = 0;
      v32 = 0.0;
      v152 = 0.0;
    }
    else if ((v6 & 0x18) != 0)
    {
      v33 = 1;
      v120 = 0.0;
    }
    else
    {
      -[SBIconListGridLayoutConfiguration iconImageInfoForGridSizeClass:](v12, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
      v138 = v137;
      SBHGetScreenSpecification(v5, (uint64_t)v160);
      v33 = 0;
      v32 = (v160[0] - v138) * 0.5;
      v152 = v32;
    }
    v23 = -1;
    v28 = v32;
    v37 = v120;
    v30 = v120;
    v27 = v152;
    v36 = v139;
    v14 = v139;
    v38 = -1;
    goto LABEL_48;
  }
  v111 = _SBHEquivalentPhoneScreenTypeForScreenType(v5);
  v179 = 0u;
  v180 = 0u;
  v177 = 0u;
  v178 = 0u;
  v175 = 0u;
  v176 = 0u;
  v173 = 0u;
  v174 = 0u;
  v172 = 0u;
  getRootMetrics(v111, v6, (uint64_t)&v172);
  if (SBHScreenTypeIsPhone(v5))
  {
    v39 = v172;
    if (BYTE2(v172))
      v35 = BYTE2(v172);
    else
      v35 = v172;
    v27 = *(double *)&v173;
    v36 = *((double *)&v174 + 1);
    v32 = *(double *)&v174;
    v37 = *((double *)&v175 + 1);
    v152 = *(double *)&v175;
    v28 = *(double *)&v176;
    v30 = *(double *)&v173;
  }
  else
  {
    v114 = SBHLibraryScreenSizeBucket(v5);
    v37 = 0.0;
    v32 = 0.0;
    v115 = 0.0;
    if (v114 <= 2)
    {
      v32 = dbl_1D01941E0[v114];
      v115 = dbl_1D01941F8[v114];
      v37 = 56.0;
    }
    v35 = 6;
    if (v5 == 34)
      v115 = 164.5;
    v28 = v115;
    v152 = v115;
    v36 = v37;
    v27 = v32;
    v30 = v37;
    v39 = 6;
  }
  v33 = 0;
  v34 = 0;
  v23 = -1;
  v142 = v154;
  v143 = v156;
  v140 = v14;
  v141 = v15;
  v14 = v30;
  v38 = -1;
LABEL_51:
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitRows:](v12, "setNumberOfPortraitRows:", v38, *(_QWORD *)&v139);
  -[SBIconListGridLayoutConfiguration setNumberOfPortraitColumns:](v12, "setNumberOfPortraitColumns:", v39);
  if (v23 && v35)
  {
    -[SBIconListGridLayoutConfiguration setNumberOfLandscapeRows:](v12, "setNumberOfLandscapeRows:", v23);
    -[SBIconListGridLayoutConfiguration setNumberOfLandscapeColumns:](v12, "setNumberOfLandscapeColumns:", v35);
  }
  -[SBIconListGridLayoutConfiguration setPortraitLayoutInsets:](v12, "setPortraitLayoutInsets:", v14, v27, v30, v32);
  -[SBIconListGridLayoutConfiguration setLandscapeLayoutInsets:](v12, "setLandscapeLayoutInsets:", v36, v152, v37, v28);
  -[SBIconListGridLayoutConfiguration setPortraitAdditionalWidgetLayoutInsets:](v12, "setPortraitAdditionalWidgetLayoutInsets:", v140, v141, v142, v143);
  -[SBIconListGridLayoutConfiguration setLandscapeAdditionalWidgetLayoutInsets:](v12, "setLandscapeAdditionalWidgetLayoutInsets:", v155, v15, v154, v156);
  -[SBIconListGridLayoutConfiguration setLayoutInsetsEnforcementAxis:](v12, "setLayoutInsetsEnforcementAxis:", v34);
  -[SBIconListGridLayoutConfiguration setRotatedLayoutClusterGridSizeClass:](v12, "setRotatedLayoutClusterGridSizeClass:", v158);
  -[SBIconListGridLayoutConfiguration setListSizeForIconSpacingCalculation:](v12, "setListSizeForIconSpacingCalculation:", v148, v147);
  -[SBIconListGridLayoutConfiguration setIconSpacingAxisMatchingBehavior:](v12, "setIconSpacingAxisMatchingBehavior:", v33);
  -[SBHDefaultIconListLayoutProvider gridSizeClassSizesForScreenType:numberOfColumns:iconLocation:layoutOptions:](v159, "gridSizeClassSizesForScreenType:numberOfColumns:iconLocation:layoutOptions:", v5, v39, v145, v6);
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListGridLayoutConfiguration setIconGridSizeClassSizes:](v12, "setIconGridSizeClassSizes:");
  -[SBHDefaultIconListLayoutProvider supportedIconGridSizeClassesForScreenType:iconLocation:layoutOptions:](v159, "supportedIconGridSizeClassesForScreenType:iconLocation:layoutOptions:", v5, v145, v6);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListGridLayoutConfiguration setSupportedIconGridSizeClasses:](v12, "setSupportedIconGridSizeClasses:", v94);
  -[SBHDefaultIconListLayoutProvider configureLabelConfigurations:forScreenType:iconLocation:layoutOptions:](v159, "configureLabelConfigurations:forScreenType:iconLocation:layoutOptions:", v12, v5, v145, v6);
  if ((objc_msgSend(v145, "isEqualToString:", CFSTR("SBIconLocationAppLibrary")) & 1) != 0
    || objc_msgSend(v145, "isEqualToString:", CFSTR("SBIconLocationAppLibraryOverlay")))
  {
    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](v12, "iconLabelVisualConfigurationForContentSizeCategory:", *MEMORY[0x1E0DC4918]);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v95, "setExtraWidth:", 0.0);

    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](v12, "iconLabelVisualConfigurationForContentSizeCategory:", *MEMORY[0x1E0DC4900]);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v96, "setExtraWidth:", 0.0);

    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](v12, "iconLabelVisualConfigurationForContentSizeCategory:", *MEMORY[0x1E0DC48F8]);
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v97, "setExtraWidth:", 0.0);

    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](v12, "iconLabelVisualConfigurationForContentSizeCategory:", *MEMORY[0x1E0DC48F0]);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v98, "setExtraWidth:", 0.0);

    -[SBIconListGridLayoutConfiguration iconLabelVisualConfigurationForContentSizeCategory:](v12, "iconLabelVisualConfigurationForContentSizeCategory:", *MEMORY[0x1E0DC48D8]);
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setExtraWidth:", 0.0);

  }
  -[SBIconListGridLayoutConfiguration iconAccessoryVisualConfiguration](v12, "iconAccessoryVisualConfiguration");
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDefaultIconListLayoutProvider configureIconAccessoryConfiguration:forScreenType:layoutOptions:](v159, "configureIconAccessoryConfiguration:forScreenType:layoutOptions:", v100, v5, v6);
  -[SBIconListGridLayoutConfiguration folderIconVisualConfiguration](v12, "folderIconVisualConfiguration");
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDefaultIconListLayoutProvider configureFolderIconConfiguration:forScreenType:numberOfRows:layoutOptions:](v159, "configureFolderIconConfiguration:forScreenType:numberOfRows:layoutOptions:", v101, v5, v151, v6);
  -[SBIconListGridLayoutConfiguration rootFolderVisualConfiguration](v12, "rootFolderVisualConfiguration");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDefaultIconListLayoutProvider configureRootFolderConfiguration:forScreenType:layoutOptions:](v159, "configureRootFolderConfiguration:forScreenType:layoutOptions:", v102, v5, v6);
  -[SBIconListGridLayoutConfiguration floatingDockVisualConfiguration](v12, "floatingDockVisualConfiguration");
  v103 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHDefaultIconListLayoutProvider configureFloatingDockConfiguration:forScreenType:layoutOptions:](v159, "configureFloatingDockConfiguration:forScreenType:layoutOptions:", v103, v5, v6);
  objc_opt_self();
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)objc_msgSend(objc_alloc((Class)v104), "initWithLayoutConfiguration:", v12);
  return v105;
}

void __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", v4);
  objc_msgSend(*(id *)(a1 + 40), "setIconImageInfo:forGridSizeClass:", v4);

}

- (unint64_t)screenType
{
  return self->_screenType;
}

- (unint64_t)layoutOptionsForIconLocation:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  v5 = -[SBHDefaultIconListLayoutProvider layoutOptions](self, "layoutOptions");
  if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupAppLibrary"), v4)
    && !objc_msgSend(v4, "isEqualToString:", CFSTR("SBIconLocationAppLibraryCategoryPodExpanded")))
  {
    v5 &= 0xFFFFFFFFFFFFFFE7;
  }

  return v5;
}

- (unint64_t)layoutOptions
{
  return self->_layoutOptions;
}

- (void)configureIconAccessoryConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  char v5;
  uint64_t v7;
  double v8;
  double v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v7 = SBHDefaultIconSizeBucket(a4, v5);
  v8 = 11.0;
  v9 = 26.0;
  if (v7 > 1679)
  {
    if (v7 == 1680 || v7 == 1800 || v7 == 1920)
    {
LABEL_4:
      objc_msgSend(v10, "setFontSize:");
      objc_msgSend(v10, "setSize:", v9, v9);
      objc_msgSend(v10, "setOffset:", v8, v8);
    }
  }
  else if ((unint64_t)(v7 - 112) <= 0x37)
  {
    if (((1 << (v7 - 112)) & 0x10001010101) == 0)
    {
      if (v7 != 167)
        goto LABEL_5;
      v8 = 12.0;
      v9 = 27.0;
    }
    goto LABEL_4;
  }
LABEL_5:

}

- (void)configureFolderIconConfiguration:(id)a3 forScreenType:(unint64_t)a4 numberOfRows:(unint64_t)a5 layoutOptions:(unint64_t)a6
{
  char v6;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  _BYTE v18[16];

  v6 = a6;
  v9 = a3;
  if (a5 <= 2)
  {
    v10 = SBHDefaultScreenSizeBucket(a4);
    v11 = round(SBHDefaultIconImageSize(a4, v6) * 0.4);
    if (v10 == 2)
    {
      v12 = 7.0;
    }
    else if (v10 == 1)
    {
      v12 = 6.0;
    }
    else
    {
      v12 = 0.0;
      if (!v10)
        v12 = 5.0;
    }
    goto LABEL_36;
  }
  if (a5 == 3)
  {
    v11 = 13.0;
    v12 = 3.0;
    goto LABEL_36;
  }
  v13 = SBHDefaultIconSizeBucket(a4, v6);
  v12 = 0.0;
  if (v13 <= 151)
  {
    if (v13 <= 127)
    {
      if (v13 != 112)
      {
        v11 = 0.0;
        if (v13 != 120)
          goto LABEL_36;
      }
      goto LABEL_19;
    }
    if (v13 == 128)
      goto LABEL_35;
    if (v13 == 136)
      v11 = 11.0;
    else
      v11 = 0.0;
    if (v13 == 136)
      v12 = 3.0;
  }
  else
  {
    if (v13 > 1679)
    {
      if (v13 != 1680)
      {
        if (v13 != 1920)
        {
          v11 = 0.0;
          if (v13 != 1800)
            goto LABEL_36;
          goto LABEL_19;
        }
LABEL_35:
        v12 = 2.75;
        v11 = 10.25;
        goto LABEL_36;
      }
LABEL_19:
      v11 = 9.5;
      v12 = 2.5;
      goto LABEL_36;
    }
    v14 = 12.0;
    v15 = 3.5;
    if (v13 != 167)
    {
      v15 = 0.0;
      v14 = 0.0;
    }
    if (v13 == 152)
      v12 = 3.0;
    else
      v12 = v15;
    if (v13 == 152)
      v11 = 11.0;
    else
      v11 = v14;
  }
LABEL_36:
  if ((v6 & 8) != 0 && SBHScreenTypeIsPhone(a4))
  {
    SBHDefaultIconImageSize(a4, v6);
    SBHDefaultIconImageSize(a4, v6 & 0xE7);
    SBHGetScreenSpecification(a4, (uint64_t)v18);
    UIRoundToScale();
    v11 = v16;
    UIRoundToScale();
    v12 = v17;
  }
  objc_msgSend(v9, "setGridCellSize:", v11, v11);
  objc_msgSend(v9, "setGridCellSpacing:", v12, v12);

}

- (void)configureFloatingDockConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  double v6;
  double v7;

  if ((a5 & 0x18) != 0)
  {
    v6 = SBHDefaultIconImageSize(a4, a5 & 0xE7);
  }
  else
  {
    v6 = *MEMORY[0x1E0C9D820];
    v7 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(a3, "setMaximumEditingIconSize:", v6, v7);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedListLayouts, 0);
}

- (SBHDefaultIconListLayoutProvider)initWithScreenType:(unint64_t)a3
{
  return -[SBHDefaultIconListLayoutProvider initWithScreenType:layoutOptions:](self, "initWithScreenType:layoutOptions:", a3, objc_msgSend((id)objc_opt_class(), "defaultLayoutOptions"));
}

- (SBHDefaultIconListLayoutProvider)initWithLayoutOptions:(unint64_t)a3
{
  return -[SBHDefaultIconListLayoutProvider initWithScreenType:layoutOptions:](self, "initWithScreenType:layoutOptions:", objc_msgSend((id)objc_opt_class(), "currentDeviceScreenType"), a3);
}

uint64_t __62__SBHDefaultIconListLayoutProvider_makeLayoutForIconLocation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageInfo:forGridSizeClass:", a2, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)gridSizeClassSizesForScreenType:(unint64_t)a3 numberOfColumns:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  return SBHDefaultGridSizeClassSizes(a3, a5);
}

- (id)supportedIconGridSizeClassesForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5
{
  id v6;
  SBHMutableIconGridSizeClassSet *v7;
  __CFString **v8;

  v6 = a4;
  v7 = -[SBHIconGridSizeClassSet initWithGridSizeClass:]([SBHMutableIconGridSizeClassSet alloc], "initWithGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
  if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupRoot"), v6))
  {
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge"));
    if (SBHScreenTypeIsPad(a3))
    {
      v8 = SBHIconGridSizeClassExtraLarge;
LABEL_6:
      -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", *v8);
    }
  }
  else if (SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupTodayView"), v6))
  {
    -[SBHMutableIconGridSizeClassSet removeGridSizeClass:](v7, "removeGridSizeClass:", CFSTR("SBHIconGridSizeClassDefault"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
    -[SBHMutableIconGridSizeClassSet addGridSizeClass:](v7, "addGridSizeClass:", CFSTR("SBHIconGridSizeClassLarge"));
    v8 = SBHIconGridSizeClassNewsLargeTall;
    goto LABEL_6;
  }

  return v7;
}

- (void)configureLabelConfigurations:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  char v6;
  id v9;
  id v10;
  SBHIconLabelVisualConfiguration *v11;
  SBHIconLabelVisualConfiguration *v12;
  SBHIconLabelVisualConfiguration *v13;
  SBHIconLabelVisualConfiguration *v14;
  SBHIconLabelVisualConfiguration *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  int v23;
  __CFString *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  const __CFString *v29;
  uint8_t buf[4];
  SBHDefaultIconListLayoutProvider *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  __CFString *v38;
  uint64_t v39;

  v6 = a6;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  v12 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  v13 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  v14 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  v15 = objc_alloc_init(SBHIconLabelVisualConfiguration);
  if (a4 <= 0x2F)
  {
    v16 = dbl_1D0194210[a4];
    v17 = dbl_1D0194390[a4];
    -[SBHIconLabelVisualConfiguration setFontSize:](v11, "setFontSize:", 12.0);
    -[SBHIconLabelVisualConfiguration setFontSize:](v12, "setFontSize:", 13.0);
    -[SBHIconLabelVisualConfiguration setFontSize:](v13, "setFontSize:", 14.0);
    -[SBHIconLabelVisualConfiguration setFontSize:](v14, "setFontSize:", v16);
    -[SBHIconLabelVisualConfiguration setFontSize:](v15, "setFontSize:", v17);
    v18 = dbl_1D0194510[a4];
    v19 = dbl_1D0194690[a4];
    -[SBHIconLabelVisualConfiguration setBaselineOffsetFromImage:](v11, "setBaselineOffsetFromImage:", 16.0);
    -[SBHIconLabelVisualConfiguration setBaselineOffsetFromImage:](v12, "setBaselineOffsetFromImage:", v18);
    -[SBHIconLabelVisualConfiguration setBaselineOffsetFromImage:](v13, "setBaselineOffsetFromImage:", v19);
    -[SBHIconLabelVisualConfiguration setBaselineOffsetFromImage:](v14, "setBaselineOffsetFromImage:", v19);
    -[SBHIconLabelVisualConfiguration setBaselineOffsetFromImage:](v15, "setBaselineOffsetFromImage:", v19);
    v20 = dbl_1D0194810[a4];
    -[SBHIconLabelVisualConfiguration setHeight:](v11, "setHeight:", v20);
    -[SBHIconLabelVisualConfiguration setHeight:](v12, "setHeight:", v20);
    -[SBHIconLabelVisualConfiguration setHeight:](v13, "setHeight:", v20);
    -[SBHIconLabelVisualConfiguration setHeight:](v14, "setHeight:", v20);
    -[SBHIconLabelVisualConfiguration setHeight:](v15, "setHeight:", v20);
    v21 = dbl_1D0194990[a4];
    v22 = dbl_1D0194B10[a4];
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v11, "setExtraWidth:", v21);
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v12, "setExtraWidth:", v21);
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v13, "setExtraWidth:", v21);
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v14, "setExtraWidth:", v21);
    -[SBHIconLabelVisualConfiguration setExtraWidth:](v15, "setExtraWidth:", v22);
  }
  objc_msgSend(v9, "setIconLabelVisualConfiguration:forContentSizeCategory:", v11, *MEMORY[0x1E0DC4918]);
  objc_msgSend(v9, "setIconLabelVisualConfiguration:forContentSizeCategory:", v12, *MEMORY[0x1E0DC4900]);
  objc_msgSend(v9, "setIconLabelVisualConfiguration:forContentSizeCategory:", v13, *MEMORY[0x1E0DC48F8]);
  objc_msgSend(v9, "setIconLabelVisualConfiguration:forContentSizeCategory:", v14, *MEMORY[0x1E0DC48F0]);
  objc_msgSend(v9, "setIconLabelVisualConfiguration:forContentSizeCategory:", v15, *MEMORY[0x1E0DC48D8]);
  v23 = SBIconLocationGroupContainsLocation(CFSTR("SBIconLocationGroupDock"), v10);
  if (v23)
    v24 = CFSTR("dock");
  else
    v24 = CFSTR("default");
  v25 = v23 ^ 1u;
  if ((v6 & 0x10) != 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("SBIconLocationAppLibrary")) & 1) == 0
    && (objc_msgSend(v10, "isEqualToString:", CFSTR("SBIconLocationAppLibraryOverlay")) & 1) == 0)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    SBHStringForDefaultListLayoutProviderLayoutOptions(v6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("layout provider options: %@"), v27);
    v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
  }
  SBLogIcon();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = CFSTR("hide");
    *(_DWORD *)buf = 138413058;
    v32 = self;
    v33 = 2112;
    if ((_DWORD)v25)
      v29 = CFSTR("show");
    v34 = v9;
    v35 = 2112;
    v36 = v29;
    v37 = 2112;
    v38 = v24;
    _os_log_impl(&dword_1CFEF3000, v28, OS_LOG_TYPE_DEFAULT, "<%@> layoutConfiguration <%@> should %@ labels. reason: %@", buf, 0x2Au);
  }

  objc_msgSend(v9, "setShowsLabels:", v25);
}

- (void)configureAppLibraryConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  id v10;
  id v11;
  unint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
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
  _QWORD v53[5];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v10 = a3;
  v11 = a5;
  v12 = SBHLibraryScreenSizeBucket(a4);
  if (SBHScreenTypeIsPhone(a4))
  {
    v61 = 0u;
    v62 = 0u;
    v60 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    getRootMetrics(a4, a6, (uint64_t)&v54);
    v13 = *((double *)&v54 + 1);
    v15 = *((double *)&v55 + 1);
    v14 = *(double *)&v55;
    v16 = *(double *)&v56;
    SBHGetScreenSpecification(a4, (uint64_t)v53);
    v17 = *(double *)v53;
    v18 = *(double *)&v53[1];
    v19 = SBHDefaultIconImageSize(a4, a6);
    v20 = SBHCalculateIconSpacing(v54, v17, v18, v13, v14, v15, v16, v19);
    v21 = v20;
    v23 = v22;
    v24 = v22;
    v25 = v20;
  }
  else if (v12 == 2)
  {
    v21 = -123.0;
    v20 = 36.0;
    v25 = 42.0;
    v24 = 56.0;
    v23 = 83.0;
  }
  else if (v12 == 1)
  {
    v21 = -123.0;
    v20 = 26.0;
    v25 = 36.0;
    v24 = 46.0;
    v23 = 55.0;
  }
  else
  {
    v23 = 0.0;
    v21 = 0.0;
    v24 = 0.0;
    v25 = 0.0;
    v20 = 0.0;
    if (!v12)
    {
      v21 = -123.0;
      v20 = 20.0;
      v25 = 36.0;
      v24 = 46.0;
      v23 = 54.0;
    }
  }
  objc_msgSend(v10, "setPortraitCategoryPodIconSpacing:", v20, v24);
  objc_msgSend(v10, "setLandscapeCategoryPodIconSpacing:", v25, v24);
  objc_msgSend(v10, "setExpandedCategoryPodIconSpacing:", v21, v23);
  objc_msgSend(v10, "setUsesInsetPlatterSearchAppearance:", SBHScreenTypeIsPad(a4));
  objc_msgSend(v10, "setSearchContinuousCornerRadius:", 16.0);
  if (SBHScreenTypeIsPhone(a4))
  {
    -[SBHDefaultIconListLayoutProvider homeScreenSearchOverlayInsetsForScreenType:iconLocation:layoutOptions:forAppLibrary:](self, "homeScreenSearchOverlayInsetsForScreenType:iconLocation:layoutOptions:forAppLibrary:", a4, v11, a6, 1);
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    objc_msgSend(v10, "standardSearchVisualConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTextFieldWidth:", 0.0);
    objc_msgSend(v34, "setTextFieldPortraitLayoutInsets:", v27, v29, v31, v33);
    objc_msgSend(v34, "setTextFieldLandscapeLayoutInsets:", v27, v29, v31, v33);
    objc_msgSend(v10, "setActiveSearchVisualConfiguration:", v34);
    objc_msgSend(v10, "setCompactSearchVisualConfiguration:", v34);
    objc_msgSend(v10, "setExtendedSearchVisualConfiguration:", v34);
    objc_msgSend(v10, "standardSearchVisualConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeSearchVisualConfiguration");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if ((v37 & 1) == 0)
      NSLog(CFSTR("Phones should use a single search visual configuration in app library"));
  }
  else
  {
    objc_msgSend(v10, "extendedSearchVisualConfiguration");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "standardSearchVisualConfiguration");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "compactSearchVisualConfiguration");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeSearchVisualConfiguration");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setTextFieldWidth:", 334.0);
    objc_msgSend(v38, "setTextFieldWidth:", 334.0);
    objc_msgSend(v39, "setTextFieldWidth:", 334.0);
    objc_msgSend(v40, "setTextFieldWidth:", 556.0);
    v41 = 0.0;
    v42 = 0.0;
    v43 = 0.0;
    v44 = 0.0;
    v45 = 0.0;
    v46 = 0.0;
    v47 = 0.0;
    v48 = 0.0;
    v49 = 0.0;
    v50 = 0.0;
    if (v12 <= 2)
    {
      v42 = dbl_1D0194C90[v12];
      v43 = dbl_1D0194CA8[v12];
      v44 = dbl_1D0194CC0[v12];
      v45 = dbl_1D0194CD8[v12];
      v46 = dbl_1D0194CF0[v12];
      v47 = dbl_1D0194D08[v12];
      v48 = dbl_1D0194D20[v12];
      v49 = dbl_1D0194D38[v12];
      v41 = 24.0;
      v50 = dbl_1D0194D50[v12];
    }
    v52 = v42;
    if (a4 == 34)
    {
      v49 = 260.0;
      v46 = 164.0;
      v51 = 66.0;
      v44 = 72.0;
      v50 = 72.0;
    }
    else if (a4 == 31)
    {
      v49 = 240.0;
      v46 = 144.0;
      v51 = 66.0;
      v44 = 68.0;
    }
    else
    {
      v51 = v42;
    }
    objc_msgSend(v34, "setTextFieldLandscapeLayoutInsets:", v50, 0.0, v48, 0.0);
    objc_msgSend(v34, "setTextFieldPortraitLayoutInsets:", v49, 0.0, v48, 0.0);
    objc_msgSend(v38, "setTextFieldLandscapeLayoutInsets:", v43, 0.0, v47, 0.0);
    objc_msgSend(v38, "setTextFieldPortraitLayoutInsets:", v46, 0.0, v45, 0.0);
    objc_msgSend(v39, "setTextFieldLandscapeLayoutInsets:", v43, 0.0, v47, 0.0);
    objc_msgSend(v39, "setTextFieldPortraitLayoutInsets:", v51, 0.0, v44, 0.0);
    objc_msgSend(v40, "setTextFieldLandscapeLayoutInsets:", v43, 0.0, v41, 0.0);
    objc_msgSend(v40, "setTextFieldPortraitLayoutInsets:", v52, 0.0, v41, 0.0);

  }
}

- (void)configureFloatyFolderConfiguration:(id)a3 forScreenType:(unint64_t)a4 layoutOptions:(unint64_t)a5
{
  double v6;
  double v7;
  _BOOL4 IsPad;
  double v9;
  double v10;
  id v11;

  v11 = a3;
  if (a4 <= 0x2F)
  {
    if (((1 << a4) & 0x1FFFFFFF) != 0)
    {
      v6 = 38.0;
    }
    else
    {
      if (((1 << a4) & 0x5AFDE0000000) != 0)
      {
        v7 = 487.0;
        v6 = 55.0;
      }
      else
      {
        v7 = 617.0;
        v6 = 79.0;
      }
      objc_msgSend(v11, "setContentBackgroundSize:", v7, v7);
    }
    objc_msgSend(v11, "setContinuousCornerRadius:", v6);
  }
  IsPad = SBHScreenTypeIsPad(a4);
  v9 = 7.0;
  if (IsPad)
  {
    v9 = 15.0;
    v10 = 44.0;
  }
  else
  {
    v10 = 36.0;
  }
  objc_msgSend(v11, "setTitleHorizontalInset:", v9);
  objc_msgSend(v11, "setTitleFontSize:", v10);
  objc_msgSend(v11, "setPageControlCustomPadding:", 0.0, 8.0);
  if (a4 <= 0x2F)
    objc_msgSend(v11, "setRubberBandIntervalForOverscroll:", dbl_1D0194D68[a4]);

}

- (void)configureSidebarConfiguration:(id)a3 forScreenType:(unint64_t)a4 iconLocation:(id)a5 layoutOptions:(unint64_t)a6
{
  id v10;
  id v11;
  double v12;
  double v13;
  double v14;
  double v15[5];

  v10 = a3;
  v11 = a5;
  switch(a4)
  {
    case 0uLL:
    case 1uLL:
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x10uLL:
    case 0x11uLL:
    case 0x12uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x16uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1AuLL:
    case 0x1BuLL:
    case 0x1CuLL:
      SBHGetScreenSpecification(a4, (uint64_t)v15);
      objc_msgSend(v10, "setContentWidth:", v15[0]);
      objc_msgSend(v10, "setContentFullscreen:", 1);
      break;
    case 0x1DuLL:
    case 0x29uLL:
    case 0x2EuLL:
      v13 = 145.0;
      goto LABEL_7;
    case 0x1EuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 156.0, 64.0);
      objc_msgSend(v10, "setContentWidth:", 329.0);
      v14 = 29.0;
      goto LABEL_11;
    case 0x1FuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 160.0, 64.0);
      objc_msgSend(v10, "setContentWidth:", 329.0);
      v14 = 37.0;
      goto LABEL_11;
    case 0x20uLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 166.0, 64.0);
      objc_msgSend(v10, "setContentWidth:", 329.0);
      v14 = 44.0;
      goto LABEL_11;
    case 0x21uLL:
    case 0x28uLL:
    case 0x2AuLL:
    case 0x2DuLL:
    case 0x2FuLL:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, 193.0, 64.0);
      v12 = 364.0;
      goto LABEL_8;
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
      v13 = 175.0;
      goto LABEL_7;
    case 0x26uLL:
    case 0x27uLL:
    case 0x2BuLL:
    case 0x2CuLL:
      v13 = 166.0;
LABEL_7:
      objc_msgSend(v10, "setInsets:", 0.0, 64.0, v13, 64.0);
      v12 = 329.0;
LABEL_8:
      objc_msgSend(v10, "setContentWidth:", v12);
      break;
    default:
      break;
  }
  if (a4 - 29 <= 0x12)
  {
    v14 = dbl_1D0194EE8[a4 - 29];
LABEL_11:
    objc_msgSend(v10, "setFirstWidgetTopOffset:", v14);
  }
  -[SBHDefaultIconListLayoutProvider homeScreenSearchOverlayInsetsForScreenType:iconLocation:layoutOptions:forAppLibrary:](self, "homeScreenSearchOverlayInsetsForScreenType:iconLocation:layoutOptions:forAppLibrary:", a4, v11, a6, 0);
  objc_msgSend(v10, "setSearchBarTopOffset:");

}

+ (unint64_t)extendedFloatingDockCapacityIconCount
{
  return 3;
}

- (UIEdgeInsets)homeScreenSearchOverlayInsetsForScreenType:(unint64_t)a3 iconLocation:(id)a4 layoutOptions:(unint64_t)a5 forAppLibrary:(BOOL)a6
{
  _BOOL4 v6;
  char v7;
  id v9;
  double v10;
  int v11;
  double v12;
  BOOL v13;
  double v14;
  BOOL v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  _OWORD v21[9];
  UIEdgeInsets result;

  v6 = a6;
  v7 = a5;
  v9 = a4;
  memset(v21, 0, sizeof(v21));
  getRootMetrics(a3, v7, (uint64_t)v21);
  v10 = *((double *)v21 + 1);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("SBIconLocationTodayViewOverlay")) & 1) != 0)
    v11 = 1;
  else
    v11 = objc_msgSend(v9, "isEqualToString:", CFSTR("SBIconLocationAppLibraryOverlay"));
  switch(a3)
  {
    case 0uLL:
    case 1uLL:
      v16 = *((double *)v21 + 1) + -20.0 + -4.0;
      v15 = v11 == 0;
      goto LABEL_15;
    case 2uLL:
      v14 = *((double *)v21 + 1) + -20.0 + -6.0;
      v13 = v11 == 0;
      goto LABEL_10;
    case 3uLL:
    case 5uLL:
    case 7uLL:
    case 9uLL:
    case 0xBuLL:
    case 0xDuLL:
    case 0xEuLL:
    case 0xFuLL:
    case 0x11uLL:
    case 0x13uLL:
    case 0x14uLL:
    case 0x15uLL:
    case 0x17uLL:
    case 0x18uLL:
    case 0x19uLL:
    case 0x1BuLL:
    case 0x1CuLL:
      v13 = v11 == 0;
      v14 = 12.0;
LABEL_10:
      if (!v13)
        v10 = v14;
      v12 = 24.0;
      if (!v11)
        goto LABEL_20;
      goto LABEL_18;
    case 4uLL:
    case 6uLL:
    case 8uLL:
    case 0xAuLL:
    case 0xCuLL:
    case 0x10uLL:
    case 0x12uLL:
    case 0x16uLL:
    case 0x1AuLL:
      v15 = v11 == 0;
      v16 = 6.0;
LABEL_15:
      if (!v15)
        v10 = v16;
      v12 = 12.0;
      if (v11)
        goto LABEL_18;
      goto LABEL_20;
    case 0x1DuLL:
    case 0x1EuLL:
    case 0x1FuLL:
    case 0x20uLL:
    case 0x21uLL:
    case 0x22uLL:
    case 0x23uLL:
    case 0x24uLL:
    case 0x25uLL:
    case 0x26uLL:
    case 0x27uLL:
    case 0x28uLL:
    case 0x29uLL:
    case 0x2AuLL:
    case 0x2BuLL:
    case 0x2CuLL:
    case 0x2DuLL:
    case 0x2EuLL:
    case 0x2FuLL:
      if (v6)
        NSLog(CFSTR("App Library on iPad has eight search insets layouts per device; look in -configureAppLibraryConfiguration:."));
      v12 = 0.0;
      if (!v11)
        goto LABEL_20;
      v10 = 0.0;
LABEL_18:
      if (SBHScreenTypeIsPhone(a3))
        v10 = v10 + 4.0;
LABEL_20:

      v17 = 0.0;
      v18 = 0.0;
      v19 = v10;
      v20 = v12;
      result.right = v18;
      result.bottom = v20;
      result.left = v17;
      result.top = v19;
      return result;
    default:
      v12 = 0.0;
      if (!v11)
        goto LABEL_20;
      goto LABEL_18;
  }
}

- (BOOL)isLayoutCompatibleWithDefaultListLayoutProvider:(id)a3 forIconLocation:(id)a4
{
  return SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(self, a3, a4, 1);
}

- (NSString)description
{
  return (NSString *)-[SBHDefaultIconListLayoutProvider descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHDefaultIconListLayoutProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBHDefaultIconListLayoutProvider descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[SBHDefaultIconListLayoutProvider succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBHStringForScreenType(-[SBHDefaultIconListLayoutProvider screenType](self, "screenType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:withName:", v5, CFSTR("screenType"));

  SBHStringForDefaultListLayoutProviderLayoutOptions(-[SBHDefaultIconListLayoutProvider layoutOptions](self, "layoutOptions"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
    objc_msgSend(v4, "appendString:withName:", v6, CFSTR("layoutOptions"));

  return v4;
}

@end
