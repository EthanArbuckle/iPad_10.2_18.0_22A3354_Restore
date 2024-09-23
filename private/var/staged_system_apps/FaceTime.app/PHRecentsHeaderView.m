@implementation PHRecentsHeaderView

- (PHRecentsHeaderView)initWithFrame:(CGRect)a3
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Please don't call -[PHRecentsPersonHeaderView initWithFrame:]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]"),
                   a3.origin.x,
                   a3.origin.y,
                   a3.size.width,
                   a3.size.height));
  NSLog(CFSTR("** TUAssertion failure: %@"), v5);

  if (_TUAssertShouldCrashApplication())
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHRecentsHeaderView.m"), 64, CFSTR("Please don't call -[PHRecentsPersonHeaderView initWithFrame:]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]"));

  }
  return 0;
}

- (PHRecentsHeaderView)init
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Please don't call -[PHRecentsPersonHeaderView init]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]")));
  NSLog(CFSTR("** TUAssertion failure: %@"), v4);

  if (_TUAssertShouldCrashApplication())
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHRecentsHeaderView.m"), 69, CFSTR("Please don't call -[PHRecentsPersonHeaderView init]; instead call +[PHRecentsPersonHeaderView headerViewWithFrame:recentCall:]"));

  }
  return 0;
}

- (id)_initWithFrame:(CGRect)a3 recentCall:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  PHRecentsHeaderView *v11;
  PHRecentsHeaderView *v12;
  objc_super v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PHRecentsHeaderView;
  v11 = -[PHRecentsHeaderView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_recentCall, a4);
    -[PHRecentsHeaderView addNotificationObservers](v12, "addNotificationObservers");
    -[PHRecentsHeaderView _buildView](v12, "_buildView");
  }

  return v12;
}

- (void)addNotificationObservers
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  TUAddLocalNSObserver(self, "formattersDidChange:", CFSTR("PHRecentHeaderViewFormattersDidChangeNotification"), 0);
  if (!qword_1000A3998)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "addObserverForName:object:queue:usingBlock:", NSCurrentLocaleDidChangeNotification, 0, v3, &stru_10008A300));
    v5 = (void *)qword_1000A3998;
    qword_1000A3998 = v4;

  }
  if (!qword_1000A39A0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "addObserverForName:object:queue:usingBlock:", NSSystemTimeZoneDidChangeNotification, 0, v6, &stru_10008A300));
    v8 = (void *)qword_1000A39A0;
    qword_1000A39A0 = v7;

  }
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHRecentsHeaderView;
  -[PHRecentsHeaderView dealloc](&v4, "dealloc");
}

+ (id)headerViewWithFrame:(CGRect)a3 recentCall:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  void *v11;
  unsigned int v12;
  __objc2_class **v13;
  void *v14;
  void *v15;
  unsigned int v16;
  unsigned int v17;
  id v18;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v11 = v10;
  if (!v10)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Initializing PHRecentsPersonHeaderView with nil recentCall not allowed")));
    NSLog(CFSTR("** TUAssertion failure: %@"), v14);

    if (_TUAssertShouldCrashApplication())
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHRecentsHeaderView.m"), 105, CFSTR("Initializing PHRecentsPersonHeaderView with nil recentCall not allowed"));

    }
    goto LABEL_10;
  }
  v12 = objc_msgSend(v10, "callType");
  if ((kCHCallTypeTelephony & v12) == 0)
  {
    v16 = objc_msgSend(v11, "callType");
    if (v16 == kCHCallTypeFaceTimeVideo
      || (v17 = objc_msgSend(v11, "callType"), v17 == kCHCallTypeFaceTimeAudio))
    {
      v13 = off_100088D18;
      goto LABEL_9;
    }
LABEL_10:
    v18 = 0;
    goto LABEL_11;
  }
  v13 = &off_100088D28;
LABEL_9:
  v18 = objc_msgSend(objc_alloc(*v13), "_initWithFrame:recentCall:", v11, x, y, width, height);
LABEL_11:

  return v18;
}

- (void)_buildView
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double v21;
  void *v22;
  void *i;
  void *v24;
  void *v25;
  void *v26;
  unsigned int v27;
  BOOL v28;
  void *v29;
  unsigned int v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _UNKNOWN **v38;
  id v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  double v72;
  void *v73;
  void *v74;
  double v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  void *v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  void *v98;
  id v99;
  double v100;
  double v101;
  double v102;
  double v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
  void *v108;
  double v109;
  void *v110;
  void *v111;
  double v112;
  void *v113;
  void *v114;
  id v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  void *v123;
  id obj;
  void *v125;
  id v126;
  void *v127;
  int v128;
  id v129;
  void *v130;
  void *v131;
  void *v132;
  unsigned int v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[2];
  _QWORD v139[2];
  const __CFString *v140;
  id v141;
  _BYTE v142[128];
  uint64_t v143;
  uint64_t v144;

  v114 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontDescriptorTextStyleSubheadline));
  v130 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontDescriptorTextStyleCaption1));
  v3 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v132 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(UIApp, "userInterfaceStyle") == 1)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v125 = (void *)v4;
  v122 = (void *)v3;
  v5 = kCHCallOccurrenceDateKey;
  v6 = objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kCHCallOccurrenceDateKey, 0));
  v7 = objc_msgSend(UIApp, "headerViewShowsAllRecentCalls");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView recentCall](self, "recentCall"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "callOccurrences"));
  v10 = v9;
  if (v7)
  {
    v144 = v6;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v144, 1, v6));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sortedArrayUsingDescriptors:", v11));

  }
  else
  {
    v13 = objc_msgSend(v9, "count", v6);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView recentCall](self, "recentCall"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "callOccurrences"));
    v143 = v6;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v143, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "sortedArrayUsingDescriptors:", v16));

    v17 = objc_msgSend(UIApp, "headerViewNumberOfCallsToShow");
    if ((uint64_t)v13 >= (uint64_t)v17)
      v18 = v17;
    else
      v18 = v13;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "subarrayWithRange:", 0, v18));
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  obj = v12;
  v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
  if (v129)
  {
    v123 = 0;
    v19 = *(_QWORD *)v135;
    v20 = kCHCallOccurrenceCallTypeKey;
    v128 = kCHCallTypeUnknown;
    v118 = kCHCallOccurrenceCallStatusKey;
    v117 = kCHCallOccurrenceDurationKey;
    v21 = 0.0;
    v116 = kCHCallOccurrenceDataUsageKey;
    v22 = v122;
    v120 = *(_QWORD *)v135;
    v121 = v5;
    v119 = kCHCallOccurrenceCallTypeKey;
    do
    {
      for (i = 0; i != v129; i = (char *)i + 1)
      {
        if (*(_QWORD *)v135 != v19)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * (_QWORD)i);
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v5));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v20));
        v27 = objc_msgSend(v26, "intValue");

        v133 = v27;
        if (v25)
          v28 = v27 == v128;
        else
          v28 = 1;
        if (!v28)
        {
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v118));
          v30 = objc_msgSend(v29, "intValue");

          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v117));
          objc_msgSend(v31, "doubleValue");
          v33 = v32;

          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", v116));
          v35 = objc_msgSend(v34, "integerValue");

          v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView calendar](self, "calendar"));
          v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "components:fromDate:", 28, v25));

          v131 = v25;
          v127 = v37;
          v126 = v35;
          if (!v37 || v123 && (objc_msgSend(v37, "isEqual:", v123) & 1) != 0)
          {
            v38 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
          }
          else
          {
            v115 = v37;

            v39 = objc_alloc_init((Class)UILabel);
            objc_msgSend(v39, "setFont:", v114);
            objc_msgSend(v39, "setTextColor:", v125);
            v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView dateFormatter](self, "dateFormatter"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "stringFromDate:", v25));
            objc_msgSend(v39, "setText:", v41);

            objc_msgSend(v39, "setTextAlignment:", 4);
            objc_msgSend(v39, "intrinsicContentSize");
            v43 = v42;
            -[PHRecentsHeaderView addSubview:](self, "addSubview:", v39);
            objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
            LODWORD(v44) = 1148846080;
            objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 0, v44);
            LODWORD(v45) = 1148846080;
            objc_msgSend(v39, "setContentCompressionResistancePriority:forAxis:", 1, v45);
            LODWORD(v46) = 1148846080;
            objc_msgSend(v39, "setContentHuggingPriority:forAxis:", 0, v46);
            LODWORD(v47) = 1148846080;
            objc_msgSend(v39, "setContentHuggingPriority:forAxis:", 1, v47);
            v140 = CFSTR("Header");
            v141 = v39;
            v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v141, &v140, 1));
            v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0@1000-[Header]-0@1000-|"), 0, 0, v48));
            -[PHRecentsHeaderView addConstraints:](self, "addConstraints:", v49);

            if (objc_msgSend(v22, "count"))
            {
              v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
              objc_msgSend(v130, "_bodyLeading");
              LODWORD(v52) = 1148846080;
              v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v39, 3, 0, v50, 11, 1.0, v51 * 0.75, v52));
              -[PHRecentsHeaderView addConstraint:](self, "addConstraint:", v53);

              objc_msgSend(v130, "_bodyLeading");
              v55 = v54;
              objc_msgSend(v39, "_baselineOffsetFromBottom");
              v57 = -(v56 - v55 * 0.75);
            }
            else
            {
              objc_msgSend(v114, "ascender");
              v59 = v58;
              objc_msgSend(v114, "capHeight");
              LODWORD(v61) = 1148846080;
              v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v39, 3, 0, self, 3, 1.0, v60 - v59 + 16.0, v61));
              -[PHRecentsHeaderView addConstraint:](self, "addConstraint:", v62);

              objc_msgSend(v114, "ascender");
              v64 = v63;
              objc_msgSend(v114, "capHeight");
              v57 = v65 - v64 + 16.0;
            }
            v21 = v21 + v43 + v57;
            objc_msgSend(v22, "addObject:", v39);
            v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
            objc_msgSend(v132, "addObject:", v66);

            v123 = v115;
            v38 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
            v25 = v131;
          }
          v67 = objc_alloc_init((Class)UILabel);
          objc_msgSend(v67, "setFont:", v130);
          objc_msgSend(v67, "setTextColor:", v125);
          v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView timeFormatter](self, "timeFormatter"));
          v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "stringFromDate:", v25));
          objc_msgSend(v67, "setText:", v69);

          -[PHRecentsHeaderView addSubview:](self, "addSubview:", v67);
          objc_msgSend(v67, "setTextAlignment:", 4);
          objc_msgSend(v67, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          LODWORD(v70) = 1144750080;
          objc_msgSend(v67, "setContentCompressionResistancePriority:forAxis:", 0, v70);
          LODWORD(v71) = 1148846080;
          objc_msgSend(v67, "setContentCompressionResistancePriority:forAxis:", 1, v71);
          LODWORD(v72) = 1148846080;
          objc_msgSend(v67, "setContentHuggingPriority:forAxis:", 1, v72);
          v73 = v38[388];
          v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "objectAtIndexedSubscript:", (char *)objc_msgSend(v22, "count") - 1));
          objc_msgSend(v130, "_bodyLeading");
          v76 = v75 * 0.75;
          v77 = v22;
          v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
          v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
          if (v78 == v79)
            *(float *)&v80 = 1000.0;
          else
            *(float *)&v80 = 750.0;
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v67, 3, 0, v74, 11, 1.0, v76, v80));
          -[PHRecentsHeaderView addConstraint:](self, "addConstraint:", v81);

          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
          v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));

          if (v82 == v83)
          {
            objc_msgSend(v130, "_bodyLeading");
            v96 = v95;
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "objectAtIndexedSubscript:", (char *)objc_msgSend(v77, "count") - 1));
            objc_msgSend(v91, "_baselineOffsetFromBottom");
            v94 = -(v97 - v96 * 0.75);
          }
          else
          {
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
            v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "bottommostLabel"));
            objc_msgSend(v130, "_bodyLeading");
            LODWORD(v87) = 1148846080;
            v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v67, 3, 0, v85, 11, 1.0, v86 * 0.75, v87));
            -[PHRecentsHeaderView addConstraint:](self, "addConstraint:", v88);

            objc_msgSend(v130, "_bodyLeading");
            v90 = v89;
            v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
            v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "bottommostLabel"));
            objc_msgSend(v92, "_baselineOffsetFromBottom");
            v94 = -(v93 - v90 * 0.75);

          }
          v5 = v121;

          v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView recentCall](self, "recentCall"));
          v25 = v131;
          v99 = -[PHRecentsHeaderView newSummaryViewForRecentCall:occurrenceDate:status:duration:type:dataUsage:](self, "newSummaryViewForRecentCall:occurrenceDate:status:duration:type:dataUsage:", v98, v131, v30, v133, v126, v33);

          -[PHRecentsHeaderView addSubview:](self, "addSubview:", v99);
          objc_msgSend(v99, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          LODWORD(v100) = 1144750080;
          objc_msgSend(v99, "setContentCompressionResistancePriority:forAxis:", 0, v100);
          LODWORD(v101) = 1148846080;
          objc_msgSend(v99, "setContentCompressionResistancePriority:forAxis:", 1, v101);
          LODWORD(v102) = 1148846080;
          objc_msgSend(v99, "setContentHuggingPriority:forAxis:", 0, v102);
          LODWORD(v103) = 1148846080;
          objc_msgSend(v99, "setContentHuggingPriority:forAxis:", 1, v103);
          v138[0] = CFSTR("Time");
          v138[1] = CFSTR("Summary");
          v139[0] = v67;
          v139[1] = v99;
          v104 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v139, v138, 2));
          v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-0@1000-[Time(==90@1000)]-3@1000-[Summary]-15@1000-|"), 0, 0, v104));
          -[PHRecentsHeaderView addConstraints:](self, "addConstraints:", v105);

          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "topmostLabel"));
          LODWORD(v107) = 1148846080;
          v108 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v106, 11, 0, v67, 11, 1.0, 0.0, v107));
          -[PHRecentsHeaderView addConstraint:](self, "addConstraint:", v108);

          objc_msgSend(v99, "intrinsicContentSize");
          v21 = v21 + v94 + v109;
          objc_msgSend(v132, "addObject:", v99);

          v22 = v122;
          v20 = v119;
          v19 = v120;
        }

      }
      v129 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v134, v142, 16);
    }
    while (v129);
  }
  else
  {
    v123 = 0;
    v21 = 0.0;
    v22 = v122;
  }

  if (objc_msgSend(v132, "count"))
  {
    v110 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "objectAtIndexedSubscript:", (char *)objc_msgSend(v132, "count") - 1));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "bottommostLabel"));
    objc_msgSend(v111, "_baselineOffsetFromBottom");
    v21 = v21 + 16.0 - v112;

  }
  -[PHRecentsHeaderView setIntrinsicContentHeight:](self, "setIntrinsicContentHeight:", v21);
  -[PHRecentsHeaderView setDateLabels:](self, "setDateLabels:", v22);
  -[PHRecentsHeaderView setSummaries:](self, "setSummaries:", v132);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  double v4;
  CGSize result;

  -[PHRecentsHeaderView intrinsicContentHeight](self, "intrinsicContentHeight");
  v3 = v2;
  v4 = 285.0;
  result.height = v3;
  result.width = v4;
  return result;
}

- (id)calendar
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1000A39A8;
  if (!qword_1000A39A8)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v4 = (void *)qword_1000A39A8;
    qword_1000A39A8 = v3;

    v2 = (void *)qword_1000A39A8;
  }
  return v2;
}

- (id)dateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A39B0;
  if (!qword_1000A39B0)
  {
    v3 = objc_alloc_init((Class)NSDateFormatter);
    v4 = (void *)qword_1000A39B0;
    qword_1000A39B0 = (uint64_t)v3;

    objc_msgSend((id)qword_1000A39B0, "setDateStyle:", 3);
    objc_msgSend((id)qword_1000A39B0, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend((id)qword_1000A39B0, "setTimeStyle:", 0);
    v2 = (void *)qword_1000A39B0;
  }
  return v2;
}

- (id)timeFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A39B8;
  if (!qword_1000A39B8)
  {
    v3 = objc_alloc_init((Class)NSDateFormatter);
    v4 = (void *)qword_1000A39B8;
    qword_1000A39B8 = (uint64_t)v3;

    objc_msgSend((id)qword_1000A39B8, "setDateStyle:", 0);
    objc_msgSend((id)qword_1000A39B8, "setTimeStyle:", 1);
    v2 = (void *)qword_1000A39B8;
  }
  return v2;
}

- (void)formattersDidChange:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentsHeaderView subviews](self, "subviews", a3));
  objc_msgSend(v4, "makeObjectsPerformSelector:", "removeFromSuperview");

  -[PHRecentsHeaderView _buildView](self, "_buildView");
}

- (CHRecentCall)recentCall
{
  return (CHRecentCall *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)dateLabels
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDateLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSArray)summaries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSummaries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (double)intrinsicContentHeight
{
  return self->_intrinsicContentHeight;
}

- (void)setIntrinsicContentHeight:(double)a3
{
  self->_intrinsicContentHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_storeStrong((id *)&self->_dateLabels, 0);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

- (id)newSummaryViewForRecentCall:(id)a3 occurrenceDate:(id)a4 status:(unsigned int)a5 duration:(double)a6 type:(unsigned int)a7 dataUsage:(int64_t)a8
{
  void *v10;
  void *v11;

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Subclasses of PHRecentsPersonHeaderView must implement _createSummaryViewAtIndex:size:"), a4, *(_QWORD *)&a5, *(_QWORD *)&a7, a8, a6));
  NSLog(CFSTR("** TUAssertion failure: %@"), v10);

  if (_TUAssertShouldCrashApplication())
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHRecentsHeaderView.m"), 340, CFSTR("Subclasses of PHRecentsPersonHeaderView must implement _createSummaryViewAtIndex:size:"));

  }
  return 0;
}

@end
