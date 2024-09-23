@implementation PXSettingsTimelineInspectorViewController

- (PXSettingsTimelineInspectorViewController)initWithWidgetSizeClass:(unint64_t)a3 timeline:(id)a4 dataSource:(id)a5
{
  id v9;
  id v10;
  PXSettingsTimelineInspectorViewController *v11;
  PXSettingsTimelineInspectorViewController *v12;
  CGSize *p_widgetSize;
  objc_class *v14;
  CGFloat v15;
  uint64_t v16;
  NSArray *filteredContent;
  objc_super v19;

  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PXSettingsTimelineInspectorViewController;
  v11 = -[PXSettingsTimelineInspectorViewController init](&v19, sel_init);
  v12 = v11;
  if (v11)
  {
    p_widgetSize = &v11->_widgetSize;
    +[PXTimelineSize widgetSizeForSizeClass:](PXTimelineSize, "widgetSizeForSizeClass:", a3);
    *(_QWORD *)&p_widgetSize->width = v14;
    v12->_widgetSize.height = v15;
    objc_storeStrong((id *)&v12->_timeline, a4);
    objc_msgSend(v10, "filteredContent");
    v16 = objc_claimAutoreleasedReturnValue();
    filteredContent = v12->_filteredContent;
    v12->_filteredContent = (NSArray *)v16;

  }
  return v12;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  _BOOL8 v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  double v54;
  float v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  objc_super v65;

  v65.receiver = self;
  v65.super_class = (Class)PXSettingsTimelineInspectorViewController;
  -[PXSettingsTimelineInspectorViewController viewDidLoad](&v65, sel_viewDidLoad);
  -[PXSettingsTimelineInspectorViewController navigationController](self, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", self);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController setCurrentTime:](self, "setCurrentTime:", v6);

  v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PXSettingsTimelineInspectorViewController setAssetByAssetLocalIdentifier:](self, "setAssetByAssetLocalIdentifier:", v7);

  v8 = objc_alloc_init(MEMORY[0x1E0DC3890]);
  -[PXSettingsTimelineInspectorViewController setImageView:](self, "setImageView:", v8);

  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setContentMode:", 1);

  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUserInteractionEnabled:", 1);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addSubview:", v12);

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_handleTap_);
  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addGestureRecognizer:", v13);

  v15 = objc_alloc_init(MEMORY[0x1E0DC3E50]);
  -[PXSettingsTimelineInspectorViewController setEntryInfoTextView:](self, "setEntryInfoTextView:", v15);

  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTextAlignment:", 0);

  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEditable:", 0);

  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTextColor:", v20);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "addSubview:", v23);

  v24 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PXSettingsTimelineInspectorViewController setSliderValueLabel:](self, "setSliderValueLabel:", v24);

  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setTextAlignment:", 1);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "addSubview:", v27);

  v28 = objc_alloc_init(MEMORY[0x1E0DC3990]);
  -[PXSettingsTimelineInspectorViewController setShowFilteredContentLabel:](self, "setShowFilteredContentLabel:", v28);

  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTextAlignment:", 1);

  -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count") != 0;
  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "setEnabled:", v31);

  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v33, "isEnabled"))
    v34 = CFSTR("Show Filtered Content");
  else
    v34 = CFSTR("No Filtered Content");
  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setText:", v34);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "addSubview:", v37);

  v38 = objc_alloc_init(MEMORY[0x1E0DC3D18]);
  -[PXSettingsTimelineInspectorViewController setShowFilteredContentSwitch:](self, "setShowFilteredContentSwitch:", v38);

  -[PXSettingsTimelineInspectorViewController showFilteredContentSwitch](self, "showFilteredContentSwitch");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setOn:", 0);

  -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "count") != 0;
  -[PXSettingsTimelineInspectorViewController showFilteredContentSwitch](self, "showFilteredContentSwitch");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setEnabled:", v41);

  -[PXSettingsTimelineInspectorViewController showFilteredContentSwitch](self, "showFilteredContentSwitch");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "addTarget:action:forControlEvents:", self, sel_switchValueChanged_, 4096);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController showFilteredContentSwitch](self, "showFilteredContentSwitch");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addSubview:", v45);

  v46 = objc_alloc_init(MEMORY[0x1E0DC3C80]);
  -[PXSettingsTimelineInspectorViewController setTimeSlider:](self, "setTimeSlider:", v46);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addTarget:action:forControlEvents:", self, sel_sliderValueChanged_, 4096);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v49) = 0;
  objc_msgSend(v48, "setMinimumValue:", v49);

  -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "lastObject");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "endTime");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "timeIntervalSinceDate:", v53);
  v55 = v54 + -1.0;
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v57 = v55;
  objc_msgSend(v56, "setMaximumValue:", v57);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v59) = 0;
  objc_msgSend(v58, "setValue:", v59);

  -[PXSettingsTimelineInspectorViewController view](self, "view");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "addSubview:", v61);

  -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "firstObject");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController displayTimelineEntry:](self, "displayTimelineEntry:", v63);

  -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController displaySliderTime:](self, "displaySliderTime:", v64);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  void *v33;
  double MinY;
  void *v35;
  double v36;
  double v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double MinX;
  void *v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  double MaxX;
  void *v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  CGFloat v68;
  void *v69;
  objc_super v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v70.receiver = self;
  v70.super_class = (Class)PXSettingsTimelineInspectorViewController;
  -[PXSettingsTimelineInspectorViewController viewWillLayoutSubviews](&v70, sel_viewWillLayoutSubviews);
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "statusBarManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBarFrame");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bounds");
  v12 = v11;
  v14 = v13;

  objc_msgSend(v5, "safeAreaInsets");
  v16 = v9 + v15;
  objc_msgSend(v5, "safeAreaInsets");
  v18 = v17;
  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", 0.0, v16, v12, v12);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", 0.0, 0.0, v12 + -60.0, 35.0);

  v21 = v12 * 0.5;
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v14 - v18 - v23;
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setCenter:", v21, v24);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "frame");
  v28 = v27;
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setFrame:", 0.0, 0.0, v28, 30.0);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "center");
  v32 = v31;
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  MinY = CGRectGetMinY(v71);
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = MinY - v36 * 0.5 + -20.0;
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "setCenter:", v32, v37);

  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");
  v40 = CGRectGetMinY(v72);
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "frame");
  v43 = v40 - v42 + -5.0;

  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "frame");
  MinX = CGRectGetMinX(v73);
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "frame");
  v48 = v47 * 3.0 * 0.25;
  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setFrame:", MinX, v43, v48, 30.0);

  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frame");
  MaxX = CGRectGetMaxX(v74);
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "frame");
  v54 = v53 * 0.25;
  -[PXSettingsTimelineInspectorViewController showFilteredContentSwitch](self, "showFilteredContentSwitch");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setFrame:", MaxX, v43, v54, 30.0);

  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "frame");
  v57 = CGRectGetMinY(v75);
  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "frame");
  v59 = v57 - CGRectGetMaxY(v76) + -10.0;

  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "frame");
  v62 = v61;
  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "setFrame:", 0.0, 0.0, v62, v59);

  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "center");
  v66 = v65;
  -[PXSettingsTimelineInspectorViewController showFilteredContentLabel](self, "showFilteredContentLabel");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "frame");
  v68 = CGRectGetMinY(v77) - v59 * 0.5 + -10.0;
  -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setCenter:", v66, v68);

}

- (void)displayTimelineEntry:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  PXSettingsTimelineInspectorViewController *v26;
  void *v27;
  uint64_t v28;
  uint8_t buf[4];
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXSettingsTimelineInspectorViewController entryInDisplay](self, "entryInDisplay");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    -[PXSettingsTimelineInspectorViewController setEntryInDisplay:](self, "setEntryInDisplay:", v4);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsTimelineInspectorViewController entryInfoTextView](self, "entryInfoTextView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setText:", v6);

    objc_msgSend(v4, "assetLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v8, "length"))
    {
      PLMemoriesGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v30 = v4;
        _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_ERROR, "[TimelineInspector] TimelineEntry has nil assetLocalIdentifier: %@", buf, 0xCu);
      }
      goto LABEL_10;
    }
    -[PXSettingsTimelineInspectorViewController assetByAssetLocalIdentifier](self, "assetByAssetLocalIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v8);
    v10 = objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "librarySpecificFetchOptions");
      v10 = objc_claimAutoreleasedReturnValue();

      v28 = *MEMORY[0x1E0CD19F0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setFetchPropertySets:](v10, "setFetchPropertySets:", v12);

      v13 = (void *)MEMORY[0x1E0CD1390];
      v27 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "fetchAssetsWithLocalIdentifiers:options:", v14, v10);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        PLMemoriesGetLog();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = v4;
          _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "[TimelineInspector] key asset is nil for entry: %@", buf, 0xCu);
        }
        goto LABEL_7;
      }
      -[PXSettingsTimelineInspectorViewController assetByAssetLocalIdentifier](self, "assetByAssetLocalIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, v8);

      v10 = v16;
    }
    -[PXSettingsTimelineInspectorViewController widgetSize](self, "widgetSize");
    v19 = v18 + v18;
    -[PXSettingsTimelineInspectorViewController widgetSize](self, "widgetSize");
    v21 = v20 + v20;
    v22 = objc_alloc_init(MEMORY[0x1E0CD15A8]);
    -[NSObject setDeliveryMode:](v22, "setDeliveryMode:", 1);
    -[NSObject setResizeMode:](v22, "setResizeMode:", 1);
    objc_msgSend(MEMORY[0x1E0CD15A0], "defaultManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __66__PXSettingsTimelineInspectorViewController_displayTimelineEntry___block_invoke;
    v24[3] = &unk_1E513F120;
    v25 = v4;
    v26 = self;
    objc_msgSend(v23, "requestImageForAsset:targetSize:contentMode:options:resultHandler:", v10, 0, v22, v24, v19, v21);

LABEL_7:
LABEL_10:

  }
}

- (uint64_t)strokeRectFromCropRect:originalImageRect:targetImageRect:
{
  PXRectNormalize();
  return PXRectDenormalize();
}

- (void)displaySliderTime:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = (objc_class *)MEMORY[0x1E0CB3578];
  v5 = a3;
  v10 = objc_alloc_init(v4);
  objc_msgSend(v10, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "stringFromDate:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (Local Time)"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

}

- (void)displayFilteredContentIndex:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3 + 1;
  -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%lu of %lu"), v5, objc_msgSend(v8, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController sliderValueLabel](self, "sliderValueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setText:", v6);

}

- (void)sliderValueChanged:(id)a3
{
  id v4;
  float v5;
  unint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[PXSettingsTimelineInspectorViewController showFilteredContent](self, "showFilteredContent"))
  {
    objc_msgSend(v4, "value");
    v6 = (unint64_t)v5;
    -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsTimelineInspectorViewController displayTimelineEntry:](self, "displayTimelineEntry:", v8);

    -[PXSettingsTimelineInspectorViewController displayFilteredContentIndex:](self, "displayFilteredContentIndex:", v6);
  }
  else
  {
    -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v4;
    objc_msgSend(v4, "value");
    objc_msgSend(v9, "dateByAddingTimeInterval:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[PXSettingsTimelineInspectorViewController displaySliderTime:](self, "displaySliderTime:", v11);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v23 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v17, "startTime");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "endTime");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v11, "px_isBetweenDate:andDate:", v18, v19);

          if (v20)
          {
            -[PXSettingsTimelineInspectorViewController displayTimelineEntry:](self, "displayTimelineEntry:", v17);
            goto LABEL_13;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_13:

    v4 = v21;
  }

}

- (void)switchValueChanged:(id)a3
{
  void *v4;
  double v5;
  void *v6;
  double v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  float v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;
  id v23;

  -[PXSettingsTimelineInspectorViewController setShowFilteredContent:](self, "setShowFilteredContent:", objc_msgSend(a3, "isOn"));
  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = 0;
  objc_msgSend(v4, "setMinimumValue:", v5);

  -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = 0;
  objc_msgSend(v6, "setValue:", v7);

  if (-[PXSettingsTimelineInspectorViewController showFilteredContent](self, "showFilteredContent"))
  {
    -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count") - 1;

    -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v11 = (float)(unint64_t)v9;
    objc_msgSend(v10, "setMaximumValue:", v11);

    -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    -[PXSettingsTimelineInspectorViewController displayFilteredContentIndex:](self, "displayFilteredContentIndex:", 0);
  }
  else
  {
    -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "lastObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "endTime");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "timeIntervalSinceDate:", v16);
    v18 = v17 + -1.0;
    -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(float *)&v20 = v18;
    objc_msgSend(v19, "setMaximumValue:", v20);

    -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "firstObject");
    v23 = (id)objc_claimAutoreleasedReturnValue();

    -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsTimelineInspectorViewController displaySliderTime:](self, "displaySliderTime:", v22);

  }
  -[PXSettingsTimelineInspectorViewController displayTimelineEntry:](self, "displayTimelineEntry:", v23);

}

- (void)handleTap:(id)a3
{
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  float v17;
  void *v18;
  double v19;
  void *v20;
  void *v21;
  double v22;
  float v23;
  void *v24;
  double v25;
  id v26;

  v26 = a3;
  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "locationInView:", v4);
  v6 = v5;

  -[PXSettingsTimelineInspectorViewController imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frame");
  v9 = v8;

  if (-[PXSettingsTimelineInspectorViewController showFilteredContent](self, "showFilteredContent"))
    -[PXSettingsTimelineInspectorViewController filteredContent](self, "filteredContent");
  else
    -[PXSettingsTimelineInspectorViewController timeline](self, "timeline");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    v12 = 0;
    do
    {
      -[PXSettingsTimelineInspectorViewController entryInDisplay](self, "entryInDisplay");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectAtIndex:", v11);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13 == v14)
        v12 = v11;
      ++v11;
    }
    while (v11 < objc_msgSend(v10, "count"));
  }
  else
  {
    v12 = 0;
  }
  if (v6 > v9 * 0.5)
    v15 = v12 + 1;
  else
    v15 = v12 - 1;
  if (v15 < objc_msgSend(v10, "count"))
  {
    objc_msgSend(v10, "objectAtIndex:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXSettingsTimelineInspectorViewController displayTimelineEntry:](self, "displayTimelineEntry:", v16);
    if (-[PXSettingsTimelineInspectorViewController showFilteredContent](self, "showFilteredContent"))
    {
      -[PXSettingsTimelineInspectorViewController displayFilteredContentIndex:](self, "displayFilteredContentIndex:", v15);
      v17 = (float)v15;
      -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v19 = v17;
      objc_msgSend(v18, "setValue:", v19);
    }
    else
    {
      objc_msgSend(v16, "startTime");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSettingsTimelineInspectorViewController displaySliderTime:](self, "displaySliderTime:", v20);

      objc_msgSend(v16, "startTime");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSettingsTimelineInspectorViewController currentTime](self, "currentTime");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceDate:", v21);
      v23 = v22;
      -[PXSettingsTimelineInspectorViewController timeSlider](self, "timeSlider");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(float *)&v25 = v23;
      objc_msgSend(v24, "setValue:", v25);

    }
  }

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  return 2;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXDiagnosticsItemProvider *v11;
  id v12;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXSettingsTimelineInspectorViewController;
  -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v16, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  -[PXSettingsTimelineInspectorViewController assetByAssetLocalIdentifier](self, "assetByAssetLocalIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSettingsTimelineInspectorViewController entryInDisplay](self, "entryInDisplay");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetLocalIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_alloc_init(PXDiagnosticsItemProvider);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __99__PXSettingsTimelineInspectorViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v14[3] = &unk_1E5148158;
  v15 = v10;
  v12 = v10;
  -[PXDiagnosticsItemProvider registerItemForIdentifier:loadHandler:](v11, "registerItemForIdentifier:loadHandler:", CFSTR("PXDiagnosticsItemIdentifierAsset"), v14);
  objc_msgSend(v6, "addObject:", v11);

  return v6;
}

- (NSDate)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(id)a3
{
  objc_storeStrong((id *)&self->_currentTime, a3);
}

- (NSArray)timeline
{
  return self->_timeline;
}

- (void)setTimeline:(id)a3
{
  objc_storeStrong((id *)&self->_timeline, a3);
}

- (NSArray)filteredContent
{
  return self->_filteredContent;
}

- (void)setFilteredContent:(id)a3
{
  objc_storeStrong((id *)&self->_filteredContent, a3);
}

- (PXTimelineEntry)entryInDisplay
{
  return self->_entryInDisplay;
}

- (void)setEntryInDisplay:(id)a3
{
  objc_storeStrong((id *)&self->_entryInDisplay, a3);
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
  objc_storeStrong((id *)&self->_imageView, a3);
}

- (UITextView)entryInfoTextView
{
  return self->_entryInfoTextView;
}

- (void)setEntryInfoTextView:(id)a3
{
  objc_storeStrong((id *)&self->_entryInfoTextView, a3);
}

- (UILabel)sliderValueLabel
{
  return self->_sliderValueLabel;
}

- (void)setSliderValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_sliderValueLabel, a3);
}

- (UISlider)timeSlider
{
  return self->_timeSlider;
}

- (void)setTimeSlider:(id)a3
{
  objc_storeStrong((id *)&self->_timeSlider, a3);
}

- (UILabel)showFilteredContentLabel
{
  return self->_showFilteredContentLabel;
}

- (void)setShowFilteredContentLabel:(id)a3
{
  objc_storeStrong((id *)&self->_showFilteredContentLabel, a3);
}

- (UISwitch)showFilteredContentSwitch
{
  return self->_showFilteredContentSwitch;
}

- (void)setShowFilteredContentSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_showFilteredContentSwitch, a3);
}

- (BOOL)showFilteredContent
{
  return self->_showFilteredContent;
}

- (void)setShowFilteredContent:(BOOL)a3
{
  self->_showFilteredContent = a3;
}

- (CGSize)widgetSize
{
  double width;
  double height;
  CGSize result;

  width = self->_widgetSize.width;
  height = self->_widgetSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setWidgetSize:(CGSize)a3
{
  self->_widgetSize = a3;
}

- (NSMutableDictionary)assetByAssetLocalIdentifier
{
  return self->_assetByAssetLocalIdentifier;
}

- (void)setAssetByAssetLocalIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_assetByAssetLocalIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetByAssetLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_showFilteredContentSwitch, 0);
  objc_storeStrong((id *)&self->_showFilteredContentLabel, 0);
  objc_storeStrong((id *)&self->_timeSlider, 0);
  objc_storeStrong((id *)&self->_sliderValueLabel, 0);
  objc_storeStrong((id *)&self->_entryInfoTextView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_entryInDisplay, 0);
  objc_storeStrong((id *)&self->_filteredContent, 0);
  objc_storeStrong((id *)&self->_timeline, 0);
  objc_storeStrong((id *)&self->_currentTime, 0);
}

id __99__PXSettingsTimelineInspectorViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __66__PXSettingsTimelineInspectorViewController_displayTimelineEntry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
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
  double v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  id v43;
  CGSize v44;

  v43 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "entryInDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 == v4)
  {
    objc_msgSend(*(id *)(a1 + 40), "assetByAssetLocalIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "entryInDisplay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetLocalIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (double)(unint64_t)objc_msgSend(v9, "pixelWidth");
    v11 = (double)(unint64_t)objc_msgSend(v9, "pixelHeight");
    objc_msgSend(v43, "size");
    v13 = v12;
    objc_msgSend(v43, "size");
    v15 = v14;
    objc_msgSend(*(id *)(a1 + 32), "suggestedCrop");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v16)
    {
      objc_msgSend(*(id *)(a1 + 40), "widgetSize");
      +[PXTimelineCrop cropForAsset:withTargetSize:](PXTimelineCrop, "cropForAsset:withTargetSize:", v9);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setSuggestedCrop:", v17);

    }
    objc_msgSend(*(id *)(a1 + 32), "suggestedCrop");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "cropRect");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;

    objc_msgSend(*(id *)(a1 + 40), "strokeRectFromCropRect:originalImageRect:targetImageRect:", v20, v22, v24, v26, 0.0, 0.0, v10, v11, 0, 0, v13, v15);
    v28 = v27;
    v30 = v29;
    v32 = v31;
    v34 = v33;
    v35 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(*(id *)(a1 + 40), "widgetSize");
    NSStringFromCGSize(v44);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "suggestedCrop");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "cropScore");
    objc_msgSend(v35, "stringWithFormat:", CFSTR("%@ %.4f"), v36, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "px_debugImageWithStrokeRect:color:text:", v40, v39, v28, v30, v32, v34);
    v41 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "imageView");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setImage:", v41);

    v5 = (void *)v41;
  }
  else
  {
    v5 = v43;
  }

}

@end
