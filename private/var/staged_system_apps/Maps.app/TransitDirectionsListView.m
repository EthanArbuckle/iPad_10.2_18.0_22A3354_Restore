@implementation TransitDirectionsListView

- (TransitDirectionsListView)initWithFrame:(CGRect)a3
{
  TransitDirectionsListView *v3;
  TransitDirectionsListView *v4;
  NSMutableSet *v5;
  NSMutableSet *visibleAdvisories;
  id v7;
  double y;
  double width;
  double height;
  UIView *v11;
  UIView *activeItemBackgroundView;
  void *v13;
  UIView *v14;
  UIView *highlightBackgroundView;
  void *v16;
  id v17;
  UIStackView *v18;
  UIStackView *stackView;
  double v20;
  double v21;
  id v22;
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
  double v39;
  void *v40;
  uint64_t v41;
  NSLayoutConstraint *stackViewToBottomConstraint;
  void *v43;
  objc_super v45;

  v45.receiver = self;
  v45.super_class = (Class)TransitDirectionsListView;
  v3 = -[TransitDirectionsListView initWithFrame:](&v45, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[TransitDirectionsListView setAccessibilityIdentifier:](v3, "setAccessibilityIdentifier:", CFSTR("TransitDirectionsListView"));
    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    visibleAdvisories = v4->_visibleAdvisories;
    v4->_visibleAdvisories = v5;

    v4->_stepBackgroundAlpha = 1.0;
    v7 = objc_alloc((Class)UIView);
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
    v11 = (UIView *)objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    activeItemBackgroundView = v4->_activeItemBackgroundView;
    v4->_activeItemBackgroundView = v11;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_activeItemBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    -[UIView setBackgroundColor:](v4->_activeItemBackgroundView, "setBackgroundColor:", v13);

    -[UIView setHidden:](v4->_activeItemBackgroundView, "setHidden:", 1);
    -[TransitDirectionsListView addSubview:](v4, "addSubview:", v4->_activeItemBackgroundView);
    v14 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, y, width, height);
    highlightBackgroundView = v4->_highlightBackgroundView;
    v4->_highlightBackgroundView = v14;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_highlightBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor quaternarySystemFillColor](UIColor, "quaternarySystemFillColor"));
    -[UIView setBackgroundColor:](v4->_highlightBackgroundView, "setBackgroundColor:", v16);

    -[UIView setHidden:](v4->_highlightBackgroundView, "setHidden:", 1);
    -[TransitDirectionsListView addSubview:](v4, "addSubview:", v4->_highlightBackgroundView);
    v17 = objc_alloc((Class)UIStackView);
    -[TransitDirectionsListView bounds](v4, "bounds");
    v18 = (UIStackView *)objc_msgSend(v17, "initWithFrame:");
    stackView = v4->_stackView;
    v4->_stackView = v18;

    -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](v4->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIStackView setDistribution:](v4->_stackView, "setDistribution:", 0);
    -[UIStackView setAlignment:](v4->_stackView, "setAlignment:", 0);
    -[UIStackView setAxis:](v4->_stackView, "setAxis:", 1);
    -[UIStackView setSpacing:](v4->_stackView, "setSpacing:", 0.0);
    LODWORD(v20) = 1148846080;
    -[UIStackView setContentHuggingPriority:forAxis:](v4->_stackView, "setContentHuggingPriority:forAxis:", 1, v20);
    LODWORD(v21) = 1148846080;
    -[UIStackView setContentCompressionResistancePriority:forAxis:](v4->_stackView, "setContentCompressionResistancePriority:forAxis:", 1, v21);
    -[TransitDirectionsListView addSubview:](v4, "addSubview:", v4->_stackView);
    v22 = objc_alloc_init((Class)NSMutableArray);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView widthAnchor](v4->_stackView, "widthAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView frameLayoutGuide](v4, "frameLayoutGuide"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    objc_msgSend(v22, "addObject:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_highlightBackgroundView, "leadingAnchor"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView leadingAnchor](v4, "leadingAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v28));
    objc_msgSend(v22, "addObject:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_highlightBackgroundView, "trailingAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView trailingAnchor](v4, "trailingAnchor"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
    objc_msgSend(v22, "addObject:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v4->_activeItemBackgroundView, "leadingAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView leadingAnchor](v4, "leadingAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:", v34));
    objc_msgSend(v22, "addObject:", v35);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v4->_activeItemBackgroundView, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView trailingAnchor](v4, "trailingAnchor"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintEqualToAnchor:", v37));
    objc_msgSend(v22, "addObject:", v38);

    LODWORD(v39) = 1148846080;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView _maps_constraintsEqualToEdgesOfView:priority:](v4->_stackView, "_maps_constraintsEqualToEdgesOfView:priority:", v4, v39));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "bottomConstraint"));
    stackViewToBottomConstraint = v4->_stackViewToBottomConstraint;
    v4->_stackViewToBottomConstraint = (NSLayoutConstraint *)v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "allConstraints"));
    objc_msgSend(v22, "addObjectsFromArray:", v43);

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);
    -[TransitDirectionsListView _addScrollViewScrollObserver:](v4, "_addScrollViewScrollObserver:", v4);

  }
  return v4;
}

- (id)viewForFirstBaselineLayout
{
  return -[UIStackView viewForFirstBaselineLayout](self->_stackView, "viewForFirstBaselineLayout");
}

- (id)viewForLastBaselineLayout
{
  return -[UIStackView viewForLastBaselineLayout](self->_stackView, "viewForLastBaselineLayout");
}

- (id)dequeueStepViewForItem:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  NSObject *v9;
  TransitDirectionsListView *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  objc_class *v18;
  NSString *v19;
  id v20;
  unint64_t v21;
  __CFString *v22;
  objc_class *v23;
  objc_class *v24;
  id v25;
  NSObject *v26;
  TransitDirectionsListView *v27;
  objc_class *v28;
  NSString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  id v34;
  objc_class *v35;
  NSString *v36;
  id v37;
  unint64_t v38;
  __CFString *v39;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  id v44;
  __int16 v45;
  void *v46;
  __int16 v47;
  __CFString *v48;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsStepView reuseIdentifierForItem:](TransitDirectionsStepView, "reuseIdentifierForItem:", v4));
  v6 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", v5));
  if (!v6)
  {
    v23 = +[TransitDirectionsCell collectionCellClassForListItem:](TransitDirectionsCell, "collectionCellClassForListItem:", v4);
    if ((objc_opt_respondsToSelector(v23, "stepViewClass") & 1) != 0)
      v24 = (objc_class *)-[objc_class stepViewClass](v23, "stepViewClass");
    else
      v24 = (objc_class *)TransitDirectionsStepView;
    v7 = objc_msgSend([v24 alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v25 = sub_1005111D0();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (!os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    v27 = self;
    v28 = (objc_class *)objc_opt_class(v27);
    v29 = NSStringFromClass(v28);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    if ((objc_opt_respondsToSelector(v27, "accessibilityIdentifier") & 1) != 0)
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v27, "performSelector:", "accessibilityIdentifier"));
      v32 = v31;
      if (v31 && !objc_msgSend(v31, "isEqualToString:", v30))
      {
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v30, v27, v32));

        goto LABEL_19;
      }

    }
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v30, v27));
LABEL_19:

    v34 = v33;
    v35 = (objc_class *)objc_opt_class(v7);
    v36 = NSStringFromClass(v35);
    v37 = (id)objc_claimAutoreleasedReturnValue(v36);
    v38 = (unint64_t)objc_msgSend(v4, "type");
    if (v38 >= 0x12)
      v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), v38));
    else
      v39 = off_1011B9EA8[v38];
    *(_DWORD *)buf = 138544130;
    v42 = v34;
    v43 = 2114;
    v44 = v37;
    v45 = 2114;
    v46 = v5;
    v47 = 2114;
    v48 = v39;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "[%{public}@] Created new %{public}@ for %{public}@ of type %{public}@", buf, 0x2Au);

LABEL_26:
    objc_msgSend(v7, "setSelectionDelegate:", self);
    goto LABEL_27;
  }
  v7 = (id)v6;
  v8 = sub_1005111D0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

    v17 = v16;
    v18 = (objc_class *)objc_opt_class(v7);
    v19 = NSStringFromClass(v18);
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    v21 = (unint64_t)objc_msgSend(v4, "type");
    if (v21 >= 0x12)
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), v21));
    else
      v22 = off_1011B9EA8[v21];
    *(_DWORD *)buf = 138544130;
    v42 = v17;
    v43 = 2114;
    v44 = v20;
    v45 = 2114;
    v46 = v5;
    v47 = 2114;
    v48 = v22;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] Dequeued existing %{public}@ for %{public}@ of type %{public}@", buf, 0x2Au);

  }
LABEL_27:

  return v7;
}

- (id)stepViewForIndexPath:(id)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIndexPath, "objectForKey:", a3));
  v4 = objc_opt_class(TransitDirectionsStepView);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (id)stepViewForItem:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsStepView reuseIdentifierForItem:](TransitDirectionsStepView, "reuseIdentifierForItem:", a3));
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", v4));
    v6 = objc_opt_class(TransitDirectionsStepView);
    if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
      v7 = v5;
    else
      v7 = 0;
    v8 = v7;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)allStepViews
{
  return -[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews");
}

- (id)indexPathForStepView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_indexPathsByView, "objectForKey:", a3);
}

- (void)reloadData
{
  TransitDirectionsListView *v2;
  void *v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  TransitDirectionsListView *v12;
  TransitDirectionsListView *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  __CFString *v19;
  TransitDirectionsListView *v20;
  TransitDirectionsListView *v21;
  objc_class *v22;
  NSString *v23;
  void *v24;
  void *v25;
  void *v26;
  __CFString *v27;
  id v28;
  void *v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  void *v33;
  id v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  TransitDirectionsListView *v44;
  TransitDirectionsListView *v45;
  objc_class *v46;
  NSString *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  id v52;
  TransitDirectionsListView *v53;
  TransitDirectionsListView *v54;
  objc_class *v55;
  NSString *v56;
  void *v57;
  void *v58;
  void *v59;
  __CFString *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  TransitDirectionsListView *v68;
  TransitDirectionsListView *v69;
  objc_class *v70;
  NSString *v71;
  void *v72;
  void *v73;
  void *v74;
  __CFString *v75;
  void *v76;
  NSString *v77;
  __CFString *v78;
  NSString *v79;
  void *v80;
  objc_class *v81;
  NSString *v82;
  void *v83;
  id v84;
  id v85;
  NSObject *v86;
  TransitDirectionsListView *v87;
  objc_class *v88;
  NSString *v89;
  void *v90;
  void *v91;
  void *v92;
  __CFString *v93;
  NSString *v94;
  void *v95;
  id v96;
  NSObject *v97;
  _BOOL4 v98;
  TransitDirectionsListView *v99;
  objc_class *v100;
  NSString *v101;
  void *v102;
  void *v103;
  void *v104;
  __CFString *v105;
  NSString *activeItemIdentifier;
  id v107;
  NSObject *v108;
  TransitDirectionsListView *v109;
  objc_class *v110;
  NSString *v111;
  void *v112;
  void *v113;
  void *v114;
  __CFString *v115;
  TransitDirectionsListView *v116;
  objc_class *v117;
  NSString *v118;
  void *v119;
  void *v120;
  void *v121;
  __CFString *v122;
  void *v123;
  void *v124;
  id v125;
  NSObject *v126;
  TransitDirectionsListView *v127;
  objc_class *v128;
  NSString *v129;
  void *v130;
  void *v131;
  void *v132;
  __CFString *v133;
  NSObject *v134;
  NSObject *v135;
  NSMapTable *viewsByIndexPath;
  NSMapTable *viewsByIdentifier;
  NSMapTable *indexPathsByView;
  os_signpost_id_t spid;
  NSObject *v140;
  unint64_t v141;
  id v142;
  id v143;
  id v144;
  TransitDirectionsListView *v145;
  void *v146;
  id obj;
  _QWORD v148[5];
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  uint8_t buf[4];
  __CFString *v154;
  __int16 v155;
  NSString *v156;
  __int16 v157;
  void *v158;
  __int16 v159;
  void *v160;
  _BYTE v161[128];

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](self, "dataSource"));

  v4 = sub_1005111D0();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  if (!v3)
  {
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
LABEL_117:

      viewsByIndexPath = v2->_viewsByIndexPath;
      v2->_viewsByIndexPath = 0;

      viewsByIdentifier = v2->_viewsByIdentifier;
      v2->_viewsByIdentifier = 0;

      indexPathsByView = v2->_indexPathsByView;
      v2->_indexPathsByView = 0;

      -[TransitDirectionsListView clearActiveTransitListItem](v2, "clearActiveTransitListItem");
      -[UIStackView _mapkit_setArrangedSubviews:](v2->_stackView, "_mapkit_setArrangedSubviews:", &__NSArray0__struct);
      -[TransitDirectionsListView invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");
      return;
    }
    v20 = v2;
    v21 = v20;
    if (!v20)
    {
      v27 = CFSTR("<nil>");
      goto LABEL_116;
    }
    v22 = (objc_class *)objc_opt_class(v20);
    v23 = NSStringFromClass(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if ((objc_opt_respondsToSelector(v21, "accessibilityIdentifier") & 1) != 0)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v21, "performSelector:", "accessibilityIdentifier"));
      v26 = v25;
      if (v25 && !objc_msgSend(v25, "isEqualToString:", v24))
      {
        v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v24, v21, v26));

        goto LABEL_20;
      }

    }
    v27 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v24, v21));
LABEL_20:

LABEL_116:
    *(_DWORD *)buf = 138543362;
    v154 = v27;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Clearing everything, no data source", buf, 0xCu);

    goto LABEL_117;
  }
  v7 = os_signpost_id_generate(v5);
  v8 = v6;
  v9 = v8;
  v141 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "reloadData", ", buf, 2u);
  }
  v140 = v9;

  v10 = sub_1005111D0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    v12 = v2;
    v13 = v12;
    if (!v12)
    {
      v19 = CFSTR("<nil>");
      goto LABEL_22;
    }
    v14 = (objc_class *)objc_opt_class(v12);
    v15 = NSStringFromClass(v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
      v18 = v17;
      if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
      {
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

        goto LABEL_12;
      }

    }
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_12:

LABEL_22:
    *(_DWORD *)buf = 138543362;
    v154 = v19;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadData start", buf, 0xCu);

  }
  spid = v7;

  v28 = objc_alloc_init((Class)NSMutableArray);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](v2, "dataSource"));
  v30 = (uint64_t)objc_msgSend(v29, "numberOfSectionsInTransitDirectionsListView:", v2);

  if (v30 >= 1)
  {
    for (i = 0; i != v30; ++i)
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _requestStepViewsForSectionAtIndex:](v2, "_requestStepViewsForSectionAtIndex:", i));
      objc_msgSend(v28, "addObjectsFromArray:", v32);

    }
  }
  v143 = (id)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToWeakObjectsMapTable](NSMapTable, "strongToWeakObjectsMapTable"));
  v142 = (id)objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
  v144 = objc_alloc_init((Class)NSMutableArray);
  v149 = 0u;
  v150 = 0u;
  v151 = 0u;
  v152 = 0u;
  obj = v28;
  v34 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
  v146 = v33;
  if (v34)
  {
    v35 = v34;
    v36 = *(_QWORD *)v150;
    v145 = v2;
    do
    {
      v37 = 0;
      do
      {
        if (*(_QWORD *)v150 != v36)
          objc_enumerationMutation(obj);
        v38 = *(void **)(*((_QWORD *)&v149 + 1) + 8 * (_QWORD)v37);
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "reuseIdentifier"));

        if (!v40)
        {
          v52 = sub_1005111D0();
          v43 = objc_claimAutoreleasedReturnValue(v52);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
            goto LABEL_64;
          v53 = v2;
          v54 = v53;
          if (v2)
          {
            v55 = (objc_class *)objc_opt_class(v53);
            v56 = NSStringFromClass(v55);
            v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
            if ((objc_opt_respondsToSelector(v54, "accessibilityIdentifier") & 1) == 0)
              goto LABEL_47;
            v58 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v54, "performSelector:", "accessibilityIdentifier"));
            v59 = v58;
            if (v58 && !objc_msgSend(v58, "isEqualToString:", v57))
            {
              v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v57, v54, v59));

            }
            else
            {

LABEL_47:
              v60 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v57, v54));
            }

            v33 = v146;
          }
          else
          {
            v60 = CFSTR("<nil>");
          }

          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
          v77 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "transitListItem"));
          *(_DWORD *)buf = 138543618;
          v154 = v60;
          v155 = 2112;
          v156 = v77;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "[%{public}@] - skipping info, no identifier for item: %@", buf, 0x16u);

          v2 = v145;
          goto LABEL_64;
        }
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:", v40));

        if (!v41)
        {
          v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
          objc_msgSend(v144, "addObject:", v61);

          v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
          objc_msgSend(v33, "setObject:forKey:", v62, v40);

          v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
          v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "indexPath"));
          objc_msgSend(v143, "setObject:forKey:", v63, v64);

          v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "indexPath"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));
          objc_msgSend(v142, "setObject:forKey:", v65, v66);

          v67 = sub_1005111D0();
          v43 = objc_claimAutoreleasedReturnValue(v67);
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
            goto LABEL_64;
          v68 = v2;
          v69 = v68;
          if (v2)
          {
            v70 = (objc_class *)objc_opt_class(v68);
            v71 = NSStringFromClass(v70);
            v72 = (void *)objc_claimAutoreleasedReturnValue(v71);
            if ((objc_opt_respondsToSelector(v69, "accessibilityIdentifier") & 1) == 0)
              goto LABEL_55;
            v73 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v69, "performSelector:", "accessibilityIdentifier"));
            v74 = v73;
            if (v73 && !objc_msgSend(v73, "isEqualToString:", v72))
            {
              v75 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v72, v69, v74));

            }
            else
            {

LABEL_55:
              v75 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v72, v69));
            }

          }
          else
          {
            v75 = CFSTR("<nil>");
          }

          v78 = v75;
          v79 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "indexPath"));
          v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "stepView"));

          v81 = (objc_class *)objc_opt_class(v80);
          v82 = NSStringFromClass(v81);
          v83 = (void *)objc_claimAutoreleasedReturnValue(v82);
          *(_DWORD *)buf = 138544130;
          v154 = v75;
          v155 = 2114;
          v156 = v79;
          v157 = 2112;
          v158 = v83;
          v159 = 2114;
          v160 = v40;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEBUG, "[%{public}@] - added %{public}@: %@ : %{public}@", buf, 0x2Au);

          v2 = v145;
          goto LABEL_63;
        }
        v42 = sub_1005111D0();
        v43 = objc_claimAutoreleasedReturnValue(v42);
        if (!os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          goto LABEL_64;
        v44 = v2;
        v45 = v44;
        if (!v2)
        {
          v51 = CFSTR("<nil>");
          goto LABEL_58;
        }
        v46 = (objc_class *)objc_opt_class(v44);
        v47 = NSStringFromClass(v46);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        if ((objc_opt_respondsToSelector(v45, "accessibilityIdentifier") & 1) != 0)
        {
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v45, "performSelector:", "accessibilityIdentifier"));
          v50 = v49;
          if (v49 && !objc_msgSend(v49, "isEqualToString:", v48))
          {
            v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v48, v45, v50, spid, v140));

            goto LABEL_40;
          }

        }
        v51 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v48, v45));
LABEL_40:

LABEL_58:
        *(_DWORD *)buf = 138543618;
        v154 = v51;
        v155 = 2112;
        v156 = (NSString *)v40;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_FAULT, "[%{public}@] - skipping info, duplicate item identifier encountered: %@", buf, 0x16u);

LABEL_63:
        v33 = v146;
LABEL_64:

        v37 = (char *)v37 + 1;
      }
      while (v35 != v37);
      v84 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v149, v161, 16);
      v35 = v84;
    }
    while (v84);
  }

  objc_storeStrong((id *)&v2->_viewsByIndexPath, v143);
  objc_storeStrong((id *)&v2->_viewsByIdentifier, v33);
  objc_storeStrong((id *)&v2->_indexPathsByView, v142);
  v85 = sub_1005111D0();
  v86 = objc_claimAutoreleasedReturnValue(v85);
  if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
  {
    v87 = v2;
    v88 = (objc_class *)objc_opt_class(v87);
    v89 = NSStringFromClass(v88);
    v90 = (void *)objc_claimAutoreleasedReturnValue(v89);
    if ((objc_opt_respondsToSelector(v87, "accessibilityIdentifier") & 1) != 0)
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v87, "performSelector:", "accessibilityIdentifier"));
      v92 = v91;
      if (v91 && !objc_msgSend(v91, "isEqualToString:", v90))
      {
        v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v90, v87, v92, spid, v140));

        v33 = v146;
        goto LABEL_76;
      }

      v33 = v146;
    }
    v93 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v90, v87));
LABEL_76:

    v94 = (NSString *)objc_msgSend(v144, "count");
    *(_DWORD *)buf = 138543618;
    v154 = v93;
    v155 = 2048;
    v156 = v94;
    _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEBUG, "[%{public}@] - setting %lu views", buf, 0x16u);

  }
  -[UIStackView _maps_setArrangedSubviews:](v2->_stackView, "_maps_setArrangedSubviews:", v144);
  if (!v2->_activeItemIdentifier)
  {
    v107 = sub_1005111D0();
    v108 = objc_claimAutoreleasedReturnValue(v107);
    if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEBUG))
    {
LABEL_94:

      -[TransitDirectionsListView clearActiveTransitListItem](v2, "clearActiveTransitListItem");
      goto LABEL_104;
    }
    v109 = v2;
    v110 = (objc_class *)objc_opt_class(v109);
    v111 = NSStringFromClass(v110);
    v112 = (void *)objc_claimAutoreleasedReturnValue(v111);
    if ((objc_opt_respondsToSelector(v109, "accessibilityIdentifier") & 1) != 0)
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v109, "performSelector:", "accessibilityIdentifier"));
      v114 = v113;
      if (v113 && !objc_msgSend(v113, "isEqualToString:", v112))
      {
        v115 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v112, v109, v114));

        v33 = v146;
        goto LABEL_93;
      }

      v33 = v146;
    }
    v115 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v112, v109));
LABEL_93:

    *(_DWORD *)buf = 138543362;
    v154 = v115;
    _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_DEBUG, "[%{public}@] - clearing active item", buf, 0xCu);

    goto LABEL_94;
  }
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "objectForKey:"));
  v96 = sub_1005111D0();
  v97 = objc_claimAutoreleasedReturnValue(v96);
  v98 = os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG);
  if (!v95)
  {
    if (!v98)
    {
LABEL_102:

      v123 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](v2, "dataSource"));
      v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "activeItemForTransitDirectionsListView:", v2));

      -[TransitDirectionsListView setActiveTransitDirectionsListItem:](v2, "setActiveTransitDirectionsListItem:", v124);
      goto LABEL_103;
    }
    v116 = v2;
    v117 = (objc_class *)objc_opt_class(v116);
    v118 = NSStringFromClass(v117);
    v119 = (void *)objc_claimAutoreleasedReturnValue(v118);
    if ((objc_opt_respondsToSelector(v116, "accessibilityIdentifier") & 1) != 0)
    {
      v120 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v116, "performSelector:", "accessibilityIdentifier"));
      v121 = v120;
      if (v120 && !objc_msgSend(v120, "isEqualToString:", v119))
      {
        v122 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v119, v116, v121));

        goto LABEL_101;
      }

    }
    v122 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v119, v116));
LABEL_101:

    *(_DWORD *)buf = 138543362;
    v154 = v122;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "[%{public}@] - re-fetching identifier for active item", buf, 0xCu);

    v33 = v146;
    goto LABEL_102;
  }
  if (v98)
  {
    v99 = v2;
    v100 = (objc_class *)objc_opt_class(v99);
    v101 = NSStringFromClass(v100);
    v102 = (void *)objc_claimAutoreleasedReturnValue(v101);
    if ((objc_opt_respondsToSelector(v99, "accessibilityIdentifier") & 1) != 0)
    {
      v103 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v99, "performSelector:", "accessibilityIdentifier"));
      v104 = v103;
      if (v103 && !objc_msgSend(v103, "isEqualToString:", v102))
      {
        v105 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v102, v99, v104));

        goto LABEL_85;
      }

    }
    v105 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v102, v99));
LABEL_85:

    activeItemIdentifier = v2->_activeItemIdentifier;
    *(_DWORD *)buf = 138543618;
    v154 = v105;
    v155 = 2114;
    v156 = activeItemIdentifier;
    _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEBUG, "[%{public}@] - marking existing step view as active: %{public}@", buf, 0x16u);

    v33 = v146;
  }

  -[TransitDirectionsListView _setActiveStepView:withIdentifier:](v2, "_setActiveStepView:withIdentifier:", v95, v2->_activeItemIdentifier);
LABEL_103:

LABEL_104:
  v148[0] = _NSConcreteStackBlock;
  v148[1] = 3221225472;
  v148[2] = sub_1005123AC;
  v148[3] = &unk_1011AC860;
  v148[4] = v2;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v148);
  -[TransitDirectionsListView invalidateIntrinsicContentSize](v2, "invalidateIntrinsicContentSize");
  v125 = sub_1005111D0();
  v126 = objc_claimAutoreleasedReturnValue(v125);
  if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
  {
    v127 = v2;
    v128 = (objc_class *)objc_opt_class(v127);
    v129 = NSStringFromClass(v128);
    v130 = (void *)objc_claimAutoreleasedReturnValue(v129);
    if ((objc_opt_respondsToSelector(v127, "accessibilityIdentifier") & 1) != 0)
    {
      v131 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v127, "performSelector:", "accessibilityIdentifier"));
      v132 = v131;
      if (v131 && !objc_msgSend(v131, "isEqualToString:", v130))
      {
        v133 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v130, v127, v132));

        goto LABEL_110;
      }

    }
    v133 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v130, v127));
LABEL_110:

    *(_DWORD *)buf = 138543362;
    v154 = v133;
    _os_log_impl((void *)&_mh_execute_header, v126, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadData end", buf, 0xCu);

  }
  v134 = v140;
  v135 = v134;
  if (v141 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v134))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v135, OS_SIGNPOST_INTERVAL_END, spid, "reloadData", ", buf, 2u);
  }

}

- (void)reloadSeparators
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView allStepViews](self, "allStepViews"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100512454;
  v5[3] = &unk_1011B9D70;
  v5[4] = self;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v5);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", self->_activeItemIdentifier));
  -[TransitDirectionsListView _refreshSeparatorsAroundActiveStepView:](self, "_refreshSeparatorsAroundActiveStepView:", v4);

}

- (id)_requestStepViewsForSectionAtIndex:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t i;
  void *v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](self, "dataSource"));
  v6 = (uint64_t)objc_msgSend(v5, "transitDirectionsListView:numberOfItemsInSection:", self, a3);

  v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v6);
  if (v6 >= 1)
  {
    for (i = 0; i != v6; ++i)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", i, a3));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _requestStepViewForIndexPath:](self, "_requestStepViewForIndexPath:", v9));
      objc_msgSend(v7, "addObject:", v10);

    }
  }
  return v7;
}

- (id)_requestStepViewForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](self, "dataSource"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "transitDirectionsListView:stepViewForItemAtIndexPath:", self, v4));

  -[TransitDirectionsListView _requestSeparatorForStepView:atIndexPath:](self, "_requestSeparatorForStepView:atIndexPath:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[_TransitDirectionsListViewInfo infoWithStepView:atIndexPath:](_TransitDirectionsListViewInfo, "infoWithStepView:atIndexPath:", v6, v4));

  return v7;
}

- (void)_requestSeparatorForStepView:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  __int128 v8;
  NSSet *identifiersForOverriddenSeparatorViews;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double v19;
  void *v20;
  double v21;
  __int128 v22;
  __int128 v23;

  v6 = a3;
  v7 = a4;
  v8 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  v22 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  v23 = v8;
  identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reuseIdentifier", (_QWORD)v22));
  LOBYTE(identifiersForOverriddenSeparatorViews) = -[NSSet containsObject:](identifiersForOverriddenSeparatorViews, "containsObject:", v10);

  if ((identifiersForOverriddenSeparatorViews & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
    objc_msgSend(v11, "setHidden:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
    objc_msgSend(v12, "setAlpha:", 1.0);
LABEL_5:

    goto LABEL_6;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView dataSource](self, "dataSource"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "transitListItem"));
  v15 = objc_msgSend(v13, "transitDirectionsListView:shouldShowSeparatorForItem:atIndexPath:insets:", self, v14, v7, &v22);

  v16 = v15 ^ 1;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
  objc_msgSend(v17, "setHidden:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
  objc_msgSend(v18, "setAlpha:", 1.0);

  if ((v16 & 1) == 0)
  {
    v19 = *((double *)&v22 + 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
    objc_msgSend(v20, "setLeadingMargin:", v19);

    v21 = *((double *)&v23 + 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "separatorView"));
    objc_msgSend(v12, "setTrailingMargin:", v21);
    goto LABEL_5;
  }
LABEL_6:

}

- (void)reloadSectionAtIndex:(int64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, _QWORD);
  id v9;
  NSObject *v10;
  TransitDirectionsListView *v11;
  TransitDirectionsListView *v12;
  objc_class *v13;
  NSString *v14;
  void *v15;
  int64_t v16;
  void (**v17)(id, _QWORD);
  void *v18;
  void *v19;
  __CFString *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int64_t v31;
  void *v32;
  void *v33;
  NSMapTable *viewsByIdentifier;
  void *v35;
  NSUInteger v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  NSObject *v41;
  TransitDirectionsListView *v42;
  objc_class *v43;
  NSString *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString *v48;
  NSString *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  TransitDirectionsListView *v54;
  TransitDirectionsListView *v55;
  void (**v56)(id, _QWORD);
  objc_class *v57;
  NSString *v58;
  void *v59;
  void *v60;
  void *v61;
  __CFString *v62;
  void *v63;
  id v64;
  NSObject *v65;
  TransitDirectionsListView *v66;
  objc_class *v67;
  NSString *v68;
  void *v69;
  void *v70;
  void *v71;
  __CFString *v72;
  id v73;
  _BOOL4 v74;
  void (**v75)(id, _QWORD);
  void *v76;
  void *v77;
  uint64_t v78;
  id v79;
  id v80;
  char *v81;
  _QWORD v82[5];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  uint8_t buf[4];
  __CFString *v88;
  __int16 v89;
  int64_t v90;
  __int16 v91;
  id v92;
  _BYTE v93[128];
  NSRange v94;

  v5 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  v9 = sub_1005111D0();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v11 = self;
    v12 = v11;
    if (!v11)
    {
      v20 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v13 = (objc_class *)objc_opt_class(v11);
    v14 = NSStringFromClass(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    if ((objc_opt_respondsToSelector(v12, "accessibilityIdentifier") & 1) != 0)
    {
      v16 = a3;
      v17 = v8;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v12, "performSelector:", "accessibilityIdentifier"));
      v19 = v18;
      if (v18 && !objc_msgSend(v18, "isEqualToString:", v15))
      {
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v15, v12, v19));

        v8 = v17;
        a3 = v16;
        goto LABEL_8;
      }

      v8 = v17;
      a3 = v16;
    }
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v15, v12));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543618;
    v88 = v20;
    v89 = 2048;
    v90 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "[%{public}@] reloadSectionAtIndex: %lu", buf, 0x16u);

  }
  v76 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _requestStepViewsForSectionAtIndex:](self, "_requestStepViewsForSectionAtIndex:", a3));
  v21 = sub_10039DCD4(v76, &stru_1011B9DB0);
  v77 = (void *)objc_claimAutoreleasedReturnValue(v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_viewsByIndexPath, "keyEnumerator"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "allObjects"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sortedArrayUsingSelector:", "compare:"));

  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v25 = v24;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  if (!v26)
  {

    goto LABEL_33;
  }
  v27 = v26;
  v74 = v5;
  v75 = v8;
  v81 = 0;
  v28 = *(_QWORD *)v84;
  v78 = 0x7FFFFFFFFFFFFFFFLL;
  v79 = v25;
  do
  {
    v29 = 0;
    v80 = v27;
    do
    {
      if (*(_QWORD *)v84 != v28)
        objc_enumerationMutation(v25);
      v30 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * (_QWORD)v29);
      if (objc_msgSend(v30, "section") == (id)a3)
      {
        v31 = a3;
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIndexPath, "objectForKey:", v30));
        if (!objc_msgSend(v30, "item"))
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
          v78 = (uint64_t)objc_msgSend(v33, "indexOfObject:", v32);

        }
        ++v81;
        -[NSMapTable removeObjectForKey:](self->_viewsByIndexPath, "removeObjectForKey:", v30);
        viewsByIdentifier = self->_viewsByIdentifier;
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "reuseIdentifier"));
        -[NSMapTable removeObjectForKey:](viewsByIdentifier, "removeObjectForKey:", v35);

        -[NSMapTable removeObjectForKey:](self->_indexPathsByView, "removeObjectForKey:", v30);
        v25 = v79;
        v27 = v80;
        a3 = v31;
      }
      v29 = (char *)v29 + 1;
    }
    while (v27 != v29);
    v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v83, v93, 16);
  }
  while (v27);

  v36 = v78;
  v8 = v75;
  if (v78 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_33:
    v52 = sub_1005111D0();
    v53 = objc_claimAutoreleasedReturnValue(v52);
    v39 = v76;
    if (!os_log_type_enabled(v53, OS_LOG_TYPE_FAULT))
    {
LABEL_54:

      v8[2](v8, 0);
      v51 = v77;
      goto LABEL_55;
    }
    v54 = self;
    v55 = v54;
    if (!v54)
    {
      v62 = CFSTR("<nil>");
      goto LABEL_53;
    }
    v56 = v8;
    v57 = (objc_class *)objc_opt_class(v54);
    v58 = NSStringFromClass(v57);
    v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
    if ((objc_opt_respondsToSelector(v55, "accessibilityIdentifier") & 1) != 0)
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v55, "performSelector:", "accessibilityIdentifier"));
      v61 = v60;
      if (v60 && !objc_msgSend(v60, "isEqualToString:", v59))
      {
        v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v59, v55, v61));

        goto LABEL_40;
      }

    }
    v62 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v59, v55));
LABEL_40:

    v8 = v56;
LABEL_53:

    *(_DWORD *)buf = 138543362;
    v88 = v62;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_FAULT, "[%{public}@] - index of first item not found, bailing", buf, 0xCu);

    goto LABEL_54;
  }
  v37 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
  v38 = objc_msgSend(v37, "mutableCopy");

  v39 = v76;
  if (&v81[v78] <= objc_msgSend(v38, "count"))
  {
    objc_msgSend(v38, "removeObjectsInRange:", v78, v81);
    v51 = v77;
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v78, objc_msgSend(v77, "count")));
    objc_msgSend(v38, "insertObjects:atIndexes:", v77, v63);

    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10051301C;
    v82[3] = &unk_1011B9DD8;
    v82[4] = self;
    objc_msgSend(v76, "enumerateObjectsUsingBlock:", v82);
    if (v81 == objc_msgSend(v77, "count"))
    {
LABEL_50:
      -[UIStackView _maps_setArrangedSubviews:animated:completion:](self->_stackView, "_maps_setArrangedSubviews:animated:completion:", v38, v74, v75);
      -[TransitDirectionsListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
      v25 = v79;
      goto LABEL_51;
    }
    v64 = sub_1005111D0();
    v65 = objc_claimAutoreleasedReturnValue(v64);
    if (!os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
    {
LABEL_49:

      goto LABEL_50;
    }
    v66 = self;
    v67 = (objc_class *)objc_opt_class(v66);
    v68 = NSStringFromClass(v67);
    v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
    if ((objc_opt_respondsToSelector(v66, "accessibilityIdentifier") & 1) != 0)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v66, "performSelector:", "accessibilityIdentifier"));
      v71 = v70;
      if (v70 && !objc_msgSend(v70, "isEqualToString:", v69))
      {
        v72 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v69, v66, v71));

        v51 = v77;
        goto LABEL_48;
      }

      v51 = v77;
    }
    v72 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v69, v66));
LABEL_48:

    v73 = objc_msgSend(v51, "count");
    *(_DWORD *)buf = 138543874;
    v88 = v72;
    v89 = 2048;
    v90 = (int64_t)v81;
    v91 = 2048;
    v92 = v73;
    _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEBUG, "[%{public}@] - section went from %lu to %lu views", buf, 0x20u);

    goto LABEL_49;
  }
  v40 = sub_1005111D0();
  v41 = objc_claimAutoreleasedReturnValue(v40);
  v25 = v79;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
  {
    v42 = self;
    v43 = (objc_class *)objc_opt_class(v42);
    v44 = NSStringFromClass(v43);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    if ((objc_opt_respondsToSelector(v42, "accessibilityIdentifier") & 1) != 0)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v42, "performSelector:", "accessibilityIdentifier"));
      v47 = v46;
      if (v46 && !objc_msgSend(v46, "isEqualToString:", v45))
      {
        v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v45, v42, v47));

        v36 = v78;
        goto LABEL_30;
      }

      v36 = v78;
    }
    v48 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v45, v42));
LABEL_30:

    v94.location = v36;
    v94.length = (NSUInteger)v81;
    v49 = NSStringFromRange(v94);
    v50 = (void *)objc_claimAutoreleasedReturnValue(v49);
    *(_DWORD *)buf = 138543618;
    v88 = v48;
    v89 = 2114;
    v90 = (int64_t)v50;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_FAULT, "[%{public}@] invalid replacementRange (%{public}@), bailing", buf, 0x16u);

  }
  v75[2](v75, 0);
  v51 = v77;
LABEL_51:

LABEL_55:
}

- (void)setFooterView:(id)a3
{
  id v5;
  UIView *footerView;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  _BOOL4 v13;
  TransitDirectionsListView *v14;
  objc_class *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
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
  void *v36;
  void *v37;
  NSLayoutConstraint *v38;
  NSLayoutConstraint *footerViewToBottomConstraint;
  void *v40;
  TransitDirectionsListView *v41;
  objc_class *v42;
  NSString *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  uint8_t buf[4];
  id v50;
  __int16 v51;
  void *v52;

  v5 = a3;
  footerView = self->_footerView;
  v7 = (unint64_t)v5;
  v8 = footerView;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      -[UIView removeFromSuperview](self->_footerView, "removeFromSuperview");
      objc_storeStrong((id *)&self->_footerView, a3);
      v11 = sub_1005111D0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
      if (v7)
      {
        if (!v13)
        {
LABEL_16:

          objc_msgSend((id)v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[TransitDirectionsListView addSubview:](self, "addSubview:", v7);
          -[NSLayoutConstraint setActive:](self->_stackViewToBottomConstraint, "setActive:", 0);
          LODWORD(v29) = 1148846080;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "_maps_constraintsEqualToEdgesOfView:priority:", self, v29));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "topAnchor"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView bottomAnchor](self->_stackView, "bottomAnchor"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "constraintEqualToAnchor:", v32));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "leadingConstraint"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomConstraint"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "trailingConstraint"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(+[MapsEdgeConstraints edgeConstraintsWithTop:leading:bottom:trailing:](MapsEdgeConstraints, "edgeConstraintsWithTop:leading:bottom:trailing:", v33, v34, v35, v36));

          v38 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomConstraint"));
          footerViewToBottomConstraint = self->_footerViewToBottomConstraint;
          self->_footerViewToBottomConstraint = v38;

          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "allConstraints"));
          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v40);

LABEL_25:
          -[TransitDirectionsListView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
          goto LABEL_26;
        }
        v14 = self;
        v15 = (objc_class *)objc_opt_class(v14);
        v16 = NSStringFromClass(v15);
        v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
        if ((objc_opt_respondsToSelector(v14, "accessibilityIdentifier") & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v14, "performSelector:", "accessibilityIdentifier"));
          v19 = v18;
          if (v18 && !objc_msgSend(v18, "isEqualToString:", v17))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v17, v14, v19));

LABEL_10:
            v21 = v20;
            v22 = (id)v7;
            v23 = (objc_class *)objc_opt_class(v22);
            v24 = NSStringFromClass(v23);
            v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
            if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
            {
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "performSelector:", "accessibilityIdentifier"));
              v27 = v26;
              if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
              {
                v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

                goto LABEL_15;
              }

            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_15:

            *(_DWORD *)buf = 138543618;
            v50 = v21;
            v51 = 2114;
            v52 = v28;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] Adding footer view: %{public}@", buf, 0x16u);

            goto LABEL_16;
          }

        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v17, v14));
        goto LABEL_10;
      }
      if (!v13)
      {
LABEL_24:

        v48 = self->_footerViewToBottomConstraint;
        self->_footerViewToBottomConstraint = 0;

        -[NSLayoutConstraint setActive:](self->_stackViewToBottomConstraint, "setActive:", 1);
        goto LABEL_25;
      }
      v41 = self;
      v42 = (objc_class *)objc_opt_class(v41);
      v43 = NSStringFromClass(v42);
      v44 = (void *)objc_claimAutoreleasedReturnValue(v43);
      if ((objc_opt_respondsToSelector(v41, "accessibilityIdentifier") & 1) != 0)
      {
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v41, "performSelector:", "accessibilityIdentifier"));
        v46 = v45;
        if (v45 && !objc_msgSend(v45, "isEqualToString:", v44))
        {
          v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v44, v41, v46));

          goto LABEL_23;
        }

      }
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v44, v41));
LABEL_23:

      *(_DWORD *)buf = 138543362;
      v50 = v47;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] Clearing footer view", buf, 0xCu);

      goto LABEL_24;
    }
  }
LABEL_26:

}

- (void)setStepBackgroundAlpha:(double)a3
{
  NSSet *v5;
  id v6;
  id v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  self->_stepBackgroundAlpha = a3;
  -[UIView setAlpha:](self->_activeItemBackgroundView, "setAlpha:");
  -[UIView setAlpha:](self->_highlightBackgroundView, "setAlpha:", a3);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = self->_identifiersForOverriddenSeparatorViews;
  v6 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    v9 = 1.0 - a3;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v10), (_QWORD)v13));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "separatorView"));
        objc_msgSend(v12, "setAlpha:", v9);

        v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      v7 = -[NSSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

}

- (BOOL)isActiveTransitDirectionsListItem:(id)a3
{
  void *v4;
  BOOL v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsStepView reuseIdentifierForItem:](TransitDirectionsStepView, "reuseIdentifierForItem:", a3));
  v5 = v4 && -[NSString isEqualToString:](self->_activeItemIdentifier, "isEqualToString:", v4);

  return v5;
}

- (void)setActiveTransitDirectionsListItem:(id)a3
{
  void *v4;
  void *v5;
  NSString *activeItemIdentifier;
  unint64_t v7;
  id v8;
  void *v9;
  unsigned __int8 v10;
  id v11;
  NSObject *v12;
  TransitDirectionsListView *v13;
  objc_class *v14;
  NSString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  unint64_t v25;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsStepView reuseIdentifierForItem:](TransitDirectionsStepView, "reuseIdentifierForItem:", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:", v4));
  activeItemIdentifier = self->_activeItemIdentifier;
  v7 = v4;
  v8 = activeItemIdentifier;
  if (v7 | (unint64_t)v8)
  {
    v9 = v8;
    v10 = objc_msgSend((id)v7, "isEqual:", v8);

    if ((v10 & 1) == 0)
    {
      v11 = sub_1005111D0();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
LABEL_10:

        -[TransitDirectionsListView _setActiveStepView:withIdentifier:](self, "_setActiveStepView:withIdentifier:", v5, v7);
        goto LABEL_11;
      }
      v13 = self;
      v14 = (objc_class *)objc_opt_class(v13);
      v15 = NSStringFromClass(v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      if ((objc_opt_respondsToSelector(v13, "accessibilityIdentifier") & 1) != 0)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v13, "performSelector:", "accessibilityIdentifier"));
        v18 = v17;
        if (v17 && !objc_msgSend(v17, "isEqualToString:", v16))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v16, v13, v18));

          goto LABEL_9;
        }

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v16, v13));
LABEL_9:

      *(_DWORD *)buf = 138543874;
      v21 = v19;
      v22 = 2114;
      v23 = v5;
      v24 = 2114;
      v25 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "[%{public}@] Set active step view: %{public}@ / %{public}@", buf, 0x20u);

      goto LABEL_10;
    }
  }
LABEL_11:

}

- (void)_setActiveStepView:(id)a3 withIdentifier:(id)a4
{
  id v6;
  NSArray *activeItemBackgroundConstraints;
  NSSet *identifiersForOverriddenSeparatorViews;
  id v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[TransitDirectionsListView clearActiveTransitListItem](self, "clearActiveTransitListItem");
  objc_storeStrong((id *)&self->_activeItemIdentifier, a4);
  if (self->_activeItemBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    activeItemBackgroundConstraints = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = 0;

    identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
    self->_identifiersForOverriddenSeparatorViews = 0;

  }
  v9 = v13;
  if (v13)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _allStepViewsInSectionForStepView:](self, "_allStepViewsInSectionForStepView:", v13));
    -[TransitDirectionsListView _refreshSeparatorsAroundActiveStepView:](self, "_refreshSeparatorsAroundActiveStepView:", v13);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _constraintsForBackgroundView:foregroundViews:](self, "_constraintsForBackgroundView:foregroundViews:", self->_activeItemBackgroundView, v10));
    v12 = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = v11;

    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_activeItemBackgroundConstraints);
    -[TransitDirectionsListView layoutIfNeeded](self, "layoutIfNeeded");

    v9 = v13;
  }
  -[UIView setHidden:](self->_activeItemBackgroundView, "setHidden:", v9 == 0);

}

- (void)clearActiveTransitListItem
{
  uint64_t v3;
  void *v4;
  NSSet *identifiersForOverriddenSeparatorViews;
  void *v6;
  void *v7;
  void *v8;
  char *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSArray *activeItemBackgroundConstraints;
  NSString *activeItemIdentifier;

  if (self->_activeItemIdentifier)
  {
    v3 = objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIdentifier, "objectForKey:"));
    if (v3)
    {
      v4 = (void *)v3;
      identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
      self->_identifiersForOverriddenSeparatorViews = 0;

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _allStepViewsInSectionForStepView:](self, "_allStepViewsInSectionForStepView:", v4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
      v9 = (char *)objc_msgSend(v8, "indexOfObject:", v7);

      if (v9)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9 - 1));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _indexPathForStepView:](self, "_indexPathForStepView:", v11));
        -[TransitDirectionsListView _requestSeparatorForStepView:atIndexPath:](self, "_requestSeparatorForStepView:atIndexPath:", v11, v12);

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _indexPathForStepView:](self, "_indexPathForStepView:", v13));
      -[TransitDirectionsListView _requestSeparatorForStepView:atIndexPath:](self, "_requestSeparatorForStepView:atIndexPath:", v13, v14);

    }
  }
  if (self->_activeItemBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    activeItemBackgroundConstraints = self->_activeItemBackgroundConstraints;
    self->_activeItemBackgroundConstraints = 0;

  }
  activeItemIdentifier = self->_activeItemIdentifier;
  self->_activeItemIdentifier = 0;

  -[UIView setHidden:](self->_activeItemBackgroundView, "setHidden:", 1);
}

- (void)_refreshSeparatorsAroundActiveStepView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  NSSet *v23;
  NSSet *identifiersForOverriddenSeparatorViews;
  id v25;

  if (a3)
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _allStepViewsInSectionForStepView:](self, "_allStepViewsInSectionForStepView:"));
    v4 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithCapacity:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "firstObject"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v7 = (char *)objc_msgSend(v6, "indexOfObject:", v5);

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7 - 1));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "separatorView"));
      objc_msgSend(v10, "setHidden:", 1);

      -[UIView alpha](self->_activeItemBackgroundView, "alpha");
      v12 = 1.0 - v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "separatorView"));
      objc_msgSend(v13, "setAlpha:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "reuseIdentifier"));
      objc_msgSend(v4, "addObject:", v14);

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "lastObject"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "lastObject"));

    if (v15 != v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "separatorView"));
      objc_msgSend(v18, "setHidden:", 0);

      -[UIView alpha](self->_activeItemBackgroundView, "alpha");
      v20 = 1.0 - v19;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "separatorView"));
      objc_msgSend(v21, "setAlpha:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "reuseIdentifier"));
      objc_msgSend(v4, "addObject:", v22);

    }
    v23 = (NSSet *)objc_msgSend(v4, "copy");
    identifiersForOverriddenSeparatorViews = self->_identifiersForOverriddenSeparatorViews;
    self->_identifiersForOverriddenSeparatorViews = v23;

  }
}

- (void)stepViewSelected:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  TransitDirectionsListView *v10;
  TransitDirectionsListView *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  __CFString *v22;
  __int16 v23;
  void *v24;

  v4 = a3;
  -[TransitDirectionsListView _clearHighlightForStepView:](self, "_clearHighlightForStepView:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView listDelegate](self, "listDelegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
  v7 = objc_msgSend(v5, "transitDirectionsListView:canSelectItem:", self, v6);

  if (v7)
  {
    v8 = sub_1005111D0();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_12:

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView listDelegate](self, "listDelegate"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
      objc_msgSend(v19, "transitDirectionsListView:didSelectItem:", self, v20);

      goto LABEL_13;
    }
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_11:
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "transitListItem"));
    *(_DWORD *)buf = 138543619;
    v22 = v17;
    v23 = 2113;
    v24 = v18;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] didSelectItem: %{private}@", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:

}

- (void)stepViewHighlighted:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView listDelegate](self, "listDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "transitListItem"));
  v6 = objc_msgSend(v4, "transitDirectionsListView:canSelectItem:", self, v5);

  if (v6)
    -[TransitDirectionsListView _addHighlightForStepView:](self, "_addHighlightForStepView:", v7);

}

- (void)_addHighlightForStepView:(id)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  unsigned __int8 v7;
  NSArray *highlightBackgroundConstraints;
  id v9;
  UIView *highlightBackgroundView;
  void *v11;
  NSArray *v12;
  NSArray *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "reuseIdentifier"));
  v5 = self->_highlightedIdentifier;
  v6 = v4;
  if (v6 | v5)
  {
    v7 = objc_msgSend((id)v5, "isEqual:", v6);

    if (v6)
    {
      if ((v7 & 1) == 0)
      {
        objc_storeStrong((id *)&self->_highlightedIdentifier, v4);
        if (self->_highlightBackgroundConstraints)
        {
          +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
          highlightBackgroundConstraints = self->_highlightBackgroundConstraints;
          self->_highlightBackgroundConstraints = 0;

        }
        v9 = v14;
        if (v14)
        {
          highlightBackgroundView = self->_highlightBackgroundView;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _allStepViewsInSectionForStepView:](self, "_allStepViewsInSectionForStepView:", v14));
          v12 = (NSArray *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _constraintsForBackgroundView:foregroundViews:](self, "_constraintsForBackgroundView:foregroundViews:", highlightBackgroundView, v11));
          v13 = self->_highlightBackgroundConstraints;
          self->_highlightBackgroundConstraints = v12;

          +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", self->_highlightBackgroundConstraints);
          -[TransitDirectionsListView layoutIfNeeded](self, "layoutIfNeeded");
          v9 = v14;
        }
        -[UIView setHidden:](self->_highlightBackgroundView, "setHidden:", v9 == 0);
      }
    }
  }

}

- (void)_clearHighlightForStepView:(id)a3
{
  id v4;

  if ((unint64_t)a3 | (unint64_t)self->_highlightedIdentifier)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "reuseIdentifier"));
    if (-[NSString isEqualToString:](self->_highlightedIdentifier, "isEqualToString:"))
      -[TransitDirectionsListView _clearHighlight](self, "_clearHighlight");

  }
}

- (void)_clearHighlight
{
  NSArray *highlightBackgroundConstraints;
  NSString *highlightedIdentifier;

  if (self->_highlightBackgroundConstraints)
  {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
    highlightBackgroundConstraints = self->_highlightBackgroundConstraints;
    self->_highlightBackgroundConstraints = 0;

  }
  highlightedIdentifier = self->_highlightedIdentifier;
  self->_highlightedIdentifier = 0;

  -[UIView setHidden:](self->_highlightBackgroundView, "setHidden:", 1);
}

- (void)didMoveToWindow
{
  NSMutableSet *v3;
  NSMutableSet *visibleAdvisories;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TransitDirectionsListView;
  -[TransitDirectionsListView didMoveToWindow](&v5, "didMoveToWindow");
  v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  visibleAdvisories = self->_visibleAdvisories;
  self->_visibleAdvisories = v3;

  -[TransitDirectionsListView _updateVisibleAdvisories](self, "_updateVisibleAdvisories");
}

- (void)_updateVisibleAdvisories
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  TransitDirectionsStepView *v11;
  GEOComposedRouteAdvisory *v12;
  void *v13;
  id v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  _BOOL4 v27;
  NSMutableSet *visibleAdvisories;
  void *v29;
  id v30;
  NSObject *v31;
  TransitDirectionsListView *v32;
  id *p_isa;
  objc_class *v34;
  NSString *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  Block_layout *v46;
  uint8_t buf[4];
  __CFString *v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  CGRect v52;
  CGRect v53;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView allStepViews](self, "allStepViews"));
  v45[0] = _NSConcreteStackBlock;
  v45[1] = 3221225472;
  v45[2] = sub_100514864;
  v45[3] = &unk_1011B9E40;
  v46 = &stru_1011B9E18;
  v4 = sub_10039E080(v3, v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);

  if (objc_msgSend(v5, "count"))
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v42;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v42 != v9)
            objc_enumerationMutation(v6);
          v11 = *(TransitDirectionsStepView **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)v10);
          v12 = sub_1005147D4(v7, v11);
          v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
          if (v13)
          {
            v14 = -[NSMutableSet count](self->_visibleAdvisories, "count");
            -[TransitDirectionsListView bounds](self, "bounds");
            v16 = v15;
            v18 = v17;
            v20 = v19;
            v22 = v21;
            -[TransitDirectionsStepView frame](v11, "frame");
            v53.origin.x = v23;
            v53.origin.y = v24;
            v53.size.width = v25;
            v53.size.height = v26;
            v52.origin.x = v16;
            v52.origin.y = v18;
            v52.size.width = v20;
            v52.size.height = v22;
            v27 = CGRectIntersectsRect(v52, v53);
            visibleAdvisories = self->_visibleAdvisories;
            if (v27)
            {
              -[NSMutableSet addObject:](visibleAdvisories, "addObject:", v13);
              if (v14 != -[NSMutableSet count](self->_visibleAdvisories, "count"))
              {
                v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView listDelegate](self, "listDelegate"));
                objc_msgSend(v29, "transitDirectionsListView:didDisplayAdvisory:", self, v13);

              }
            }
            else
            {
              -[NSMutableSet removeObject:](visibleAdvisories, "removeObject:", v13);
            }
          }

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
        v8 = v7;
      }
      while (v7);
    }

    v30 = sub_1005111D0();
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      goto LABEL_24;
    v32 = self;
    p_isa = (id *)&v32->super.super.super.super.isa;
    if (!v32)
    {
      v39 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v34 = (objc_class *)objc_opt_class(v32);
    v35 = NSStringFromClass(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
    if ((objc_opt_respondsToSelector(p_isa, "accessibilityIdentifier") & 1) != 0)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(p_isa, "performSelector:", "accessibilityIdentifier"));
      v38 = v37;
      if (v37 && !objc_msgSend(v37, "isEqualToString:", v36))
      {
        v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v36, p_isa, v38));

        goto LABEL_21;
      }

    }
    v39 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v36, p_isa));
LABEL_21:

LABEL_23:
    v40 = objc_msgSend(p_isa[14], "count");
    *(_DWORD *)buf = 138543618;
    v48 = v39;
    v49 = 2048;
    v50 = v40;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "[%{public}@] Updated visible advisories: %lu", buf, 0x16u);

LABEL_24:
  }

}

- (id)_indexPathForStepView:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  if (v4)
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_viewsByIndexPath, "keyEnumerator", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          v11 = (id)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIndexPath, "objectForKey:", v10));

          if (v11 == v4)
          {
            v12 = v10;
            goto LABEL_12;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v7)
          continue;
        break;
      }
    }
    v12 = 0;
LABEL_12:

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)_allStepViewsInSectionForStepView:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _indexPathForStepView:](self, "_indexPathForStepView:", a3));
  v5 = v4;
  if (v4)
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListView _allStepViewsForSection:](self, "_allStepViewsForSection:", objc_msgSend(v4, "section")));
  else
    v6 = &__NSArray0__struct;

  return v6;
}

- (id)_allStepViewsForSection:(int64_t)a3
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return &__NSArray0__struct;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable keyEnumerator](self->_viewsByIndexPath, "keyEnumerator"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v12, "section") == (id)a3)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[NSMapTable objectForKey:](self->_viewsByIndexPath, "objectForKey:", v12));
          objc_msgSend(v6, "addObject:", v13);

        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v9);
  }

  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100514BF8;
  v15[3] = &unk_1011B9E68;
  v15[4] = self;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sortedArrayUsingComparator:", v15));

  return v14;
}

- (id)_constraintsForBackgroundView:(id)a3 foregroundViews:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char *v11;
  char *v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  char *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  id v26;
  double v27;
  void *v29;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "lastObject"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v11 = (char *)objc_msgSend(v10, "indexOfObject:", v9);

    v12 = v11 + 1;
    v13 = objc_alloc_init((Class)NSMutableArray);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "topAnchor"));
    v29 = v8;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
    LODWORD(v16) = 1148846080;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:priority:", v15, 0.0, v16));
    objc_msgSend(v13, "addObject:", v17);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
    v19 = (char *)objc_msgSend(v18, "count");

    if (v12 >= v19)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
      LODWORD(v27) = 1148846080;
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:priority:", v22, 0.0, v27));
      objc_msgSend(v13, "addObject:", v23);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[UIStackView arrangedSubviews](self->_stackView, "arrangedSubviews"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "objectAtIndexedSubscript:", v12));

      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
      LODWORD(v24) = 1148846080;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:constant:priority:", v23, 0.0, v24));
      objc_msgSend(v13, "addObject:", v25);

    }
    v26 = objc_msgSend(v13, "copy");

  }
  else
  {
    v26 = &__NSArray0__struct;
  }

  return v26;
}

- (TransitDirectionsListViewDelegate)listDelegate
{
  return (TransitDirectionsListViewDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (TransitDirectionsListViewDataSource)dataSource
{
  return (TransitDirectionsListViewDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (double)stepBackgroundAlpha
{
  return self->_stepBackgroundAlpha;
}

- (UIView)footerView
{
  return self->_footerView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_visibleAdvisories, 0);
  objc_storeStrong((id *)&self->_footerViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundConstraints, 0);
  objc_storeStrong((id *)&self->_highlightBackgroundView, 0);
  objc_storeStrong((id *)&self->_highlightedIdentifier, 0);
  objc_storeStrong((id *)&self->_identifiersForOverriddenSeparatorViews, 0);
  objc_storeStrong((id *)&self->_activeItemBackgroundConstraints, 0);
  objc_storeStrong((id *)&self->_activeItemBackgroundView, 0);
  objc_storeStrong((id *)&self->_activeItemIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPathsByView, 0);
  objc_storeStrong((id *)&self->_viewsByIdentifier, 0);
  objc_storeStrong((id *)&self->_viewsByIndexPath, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
}

@end
