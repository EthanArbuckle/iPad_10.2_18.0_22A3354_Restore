@implementation PHRecentCallDetailsView

- (PHRecentCallDetailsView)initWithFrame:(CGRect)a3
{
  PHRecentCallDetailsView *v3;
  PHRecentCallDetailsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsView;
  v3 = -[PHRecentCallDetailsView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHRecentCallDetailsView addNotificationObservers](v3, "addNotificationObservers");
  return v4;
}

- (PHRecentCallDetailsView)initWithCoder:(id)a3
{
  PHRecentCallDetailsView *v3;
  PHRecentCallDetailsView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHRecentCallDetailsView;
  v3 = -[PHRecentCallDetailsView initWithCoder:](&v6, "initWithCoder:", a3);
  v4 = v3;
  if (v3)
    -[PHRecentCallDetailsView addNotificationObservers](v3, "addNotificationObservers");
  return v4;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PHRecentCallDetailsView;
  -[PHRecentCallDetailsView dealloc](&v4, "dealloc");
}

- (NSCalendar)calendar
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)qword_1000A3948;
  if (!qword_1000A3948)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSCalendar currentCalendar](NSCalendar, "currentCalendar"));
    v4 = (void *)qword_1000A3948;
    qword_1000A3948 = v3;

    v2 = (void *)qword_1000A3948;
  }
  return (NSCalendar *)v2;
}

- (NSDateFormatter)dateFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A3950;
  if (!qword_1000A3950)
  {
    v3 = objc_alloc_init((Class)NSDateFormatter);
    v4 = (void *)qword_1000A3950;
    qword_1000A3950 = (uint64_t)v3;

    objc_msgSend((id)qword_1000A3950, "setDateStyle:", 3);
    objc_msgSend((id)qword_1000A3950, "setDoesRelativeDateFormatting:", 1);
    objc_msgSend((id)qword_1000A3950, "setTimeStyle:", 0);
    v2 = (void *)qword_1000A3950;
  }
  return (NSDateFormatter *)v2;
}

- (NSNumberFormatter)numberFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A3958;
  if (!qword_1000A3958)
  {
    v3 = objc_alloc_init((Class)NSNumberFormatter);
    v4 = (void *)qword_1000A3958;
    qword_1000A3958 = (uint64_t)v3;

    v2 = (void *)qword_1000A3958;
  }
  return (NSNumberFormatter *)v2;
}

- (NSDateFormatter)timeFormatter
{
  void *v2;
  id v3;
  void *v4;

  v2 = (void *)qword_1000A3960;
  if (!qword_1000A3960)
  {
    v3 = objc_alloc_init((Class)NSDateFormatter);
    v4 = (void *)qword_1000A3960;
    qword_1000A3960 = (uint64_t)v3;

    objc_msgSend((id)qword_1000A3960, "setDateStyle:", 0);
    objc_msgSend((id)qword_1000A3960, "setTimeStyle:", 1);
    v2 = (void *)qword_1000A3960;
  }
  return (NSDateFormatter *)v2;
}

- (void)setRecentCall:(id)a3
{
  CHRecentCall *v5;
  CHRecentCall *v6;

  v5 = (CHRecentCall *)a3;
  if (self->_recentCall != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_recentCall, a3);
    -[PHRecentCallDetailsView loadSubviews](self, "loadSubviews");
    v5 = v6;
  }

}

- (void)addNotificationObservers
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "handleFormattersDidChangeNotification:", CFSTR("PHRecentCallDetailsViewFormattersDidChangeNotification"), 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "addObserver:selector:name:object:", self, "contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

  if (!qword_1000A3938)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "addObserverForName:object:queue:usingBlock:", NSCurrentLocaleDidChangeNotification, 0, v6, &stru_10008A140));
    v8 = (void *)qword_1000A3938;
    qword_1000A3938 = v7;

  }
  if (!qword_1000A3940)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", NSSystemTimeZoneDidChangeNotification, 0, v9, &stru_10008A140));
    v11 = (void *)qword_1000A3940;
    qword_1000A3940 = v10;

  }
}

- (void)handleFormattersDidChangeNotification:(id)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView recentCall](self, "recentCall", a3));

  if (v4)
    -[PHRecentCallDetailsView _replaceSubviews](self, "_replaceSubviews");
}

- (id)callOccurrences
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", kCHCallOccurrenceDateKey, 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView recentCall](self, "recentCall"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "callOccurrences"));
  v9 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sortedArrayUsingDescriptors:", v6));

  return v7;
}

- (void)loadSubviews
{
  void *v3;
  void *v4;
  void *v5;
  NSString *v6;
  id v7;
  _UNKNOWN **v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  _UNKNOWN **v12;
  double y;
  double width;
  double height;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  _UNKNOWN **v20;
  void *v21;
  uint64_t v22;
  char isKindOfClass;
  unsigned int v24;
  void *v25;
  uint64_t v26;
  double v27;
  double v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
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
  double v47;
  void *v48;
  id v49;
  uint64_t v50;
  PHRecentCallDetailsView *v51;
  void *v52;
  const __CFString *v53;
  void *v54;
  unsigned int v55;
  void *v56;
  uint64_t v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  PHRecentCallDetailsItemView *v63;
  void *v64;
  void *v65;
  PHRecentCallDetailsItemView *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  double v78;
  double v79;
  void *v80;
  void *v81;
  const __CFString *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  id v87;
  uint64_t v88;
  void *v89;
  id v90;
  _UNKNOWN **v91;
  void *v92;
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
  void *v106;
  void *v107;
  void *v108;
  uint64_t v109;
  int v110;
  int v111;
  int v112;
  int v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  unsigned int v120;
  uint64_t v121;
  uint64_t v122;
  _BOOL4 IsAccessibilityCategory;
  id v124;
  void *v125;
  id obj;
  void *v127;
  uint64_t v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  char v133;
  id v134;
  void *v135;
  uint64_t v136;
  void *v137;
  unsigned int v138;
  void *v139;
  PHRecentCallDetailsView *v140;
  id v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  _BYTE v146[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView callOccurrences](self, "callOccurrences"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "preferredContentSizeCategory"));
  IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  obj = v4;
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
  v8 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  if (!v7)
  {
    v133 = 0;
    goto LABEL_60;
  }
  v9 = v7;
  v133 = 0;
  v10 = *(_QWORD *)v143;
  v11 = kCHCallOccurrenceDateKey;
  v120 = kCHCallStatusUnknown;
  v119 = kCHCallOccurrenceCallStatusKey;
  v117 = kCHCallOccurrenceDataUsageKey;
  v118 = kCHCallOccurrenceDurationKey;
  v116 = kCHCallOccurrenceVerificationStatusKey;
  v115 = kCHCallStatusAnsweredElsewhere;
  v113 = kCHCallStatusCancelled;
  v112 = kCHCallStatusMissed;
  v12 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
  v111 = kCHCallStatusConnected;
  v110 = kCHCallStatusConnectedIncoming;
  v114 = kCHCallOccurrenceUniqueIdKey;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v140 = self;
  v121 = kCHCallOccurrenceDateKey;
  v122 = *(_QWORD *)v143;
  v125 = v3;
  do
  {
    v16 = 0;
    v124 = v9;
    do
    {
      if (*(_QWORD *)v143 != v10)
        objc_enumerationMutation(obj);
      v17 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * (_QWORD)v16);
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v11));
      v19 = objc_opt_class(v12[380]);
      if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0 || (v141 = v18) == 0)
      {
        v31 = 0;
        goto LABEL_46;
      }
      v20 = v8;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v119));
      v22 = objc_opt_class(NSNumber);
      isKindOfClass = objc_opt_isKindOfClass(v21, v22);
      v24 = v120;
      if ((isKindOfClass & 1) != 0)
        v24 = objc_msgSend(v21, "unsignedIntValue");
      v138 = v24;
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v118));
      v26 = objc_opt_class(NSNumber);
      v27 = 0.0;
      if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
      {
        objc_msgSend(v25, "doubleValue");
        v27 = v28;
      }
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v117));
      v30 = objc_opt_class(NSNumber);
      v130 = v29;
      if ((objc_opt_isKindOfClass(v29, v30) & 1) != 0)
        v134 = v29;
      else
        v134 = 0;
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v116));
      v33 = objc_opt_class(NSNumber);
      v131 = v25;
      v132 = v21;
      v129 = v32;
      if ((objc_opt_isKindOfClass(v32, v33) & 1) != 0)
        v128 = objc_msgSend(v32, "unsignedIntValue");
      else
        v128 = 0;
      v34 = objc_alloc_init((Class)UILabel);
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[458], "preferredSubheadline1Font"));
      objc_msgSend(v34, "setFont:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView dateFormatter](self, "dateFormatter"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringFromDate:", v141));
      objc_msgSend(v34, "setText:", v37);

      objc_msgSend(v34, "setTextAlignment:", 4);
      objc_msgSend(v34, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      objc_msgSend(v34, "setAdjustsFontForContentSizeCategory:", 1);
      objc_msgSend(v34, "setNumberOfLines:", 0);
      -[PHRecentCallDetailsView addSubview:](self, "addSubview:", v34);
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "leadingAnchor"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView leadingAnchor](self, "leadingAnchor"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
      objc_msgSend(v40, "setActive:", 1);

      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "trailingAnchor"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView trailingAnchor](self, "trailingAnchor"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));
      objc_msgSend(v43, "setActive:", 1);

      if (IsAccessibilityCategory)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView topAnchor](self, "topAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, 14.0));
        objc_msgSend(v46, "setActive:", 1);
      }
      else
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView topAnchor](self, "topAnchor"));
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20[458], "preferredSubheadline1Font"));
        objc_msgSend(v46, "_scaledValueForValue:", 40.0);
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v45, ceil(v47)));
        objc_msgSend(v48, "setActive:", 1);

      }
      if (v138 == v115)
      {
        v49 = (id)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CALL_STATUS_ANSWERED_ELSEWHERE"), &stru_10008B240, CFSTR("PHCallHistory")));
        v139 = 0;
        v51 = v140;
        goto LABEL_29;
      }
      v51 = v140;
      if (v138 == v113)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v49 = v52;
        v53 = CFSTR("CALL_STATUS_CANCELLED");
LABEL_28:
        v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "localizedStringForKey:value:table:", v53, &stru_10008B240, CFSTR("PHCallHistory")));
        v139 = 0;
        goto LABEL_29;
      }
      if (v138 == v112)
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v49 = v52;
        v53 = CFSTR("CALL_STATUS_MISSED");
        goto LABEL_28;
      }
      if ((v111 & v138) == 0)
      {
        v50 = 0;
        v139 = 0;
        goto LABEL_30;
      }
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v81 = v80;
      if (v138 == v110)
        v82 = CFSTR("CALL_STATUS_CONNECTED_INCOMING");
      else
        v82 = CFSTR("CALL_STATUS_CONNECTED_OUTGOING");
      v136 = objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", v82, &stru_10008B240, CFSTR("PHCallHistory")));

      v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView stringForTimeInterval:](v140, "stringForTimeInterval:", v27));
      v49 = v83;
      if (v134)
      {
        v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView stringForDataUsage:](v140, "stringForDataUsage:"));
        v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("DURATION_DATA_FORMAT_%@_(%@)"), &stru_10008B240, CFSTR("PHCallHistory")));

        v139 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v86, v49, v84));
      }
      else
      {
        v49 = v83;
        v139 = v49;
      }
      v50 = v136;
LABEL_29:

LABEL_30:
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView recentCall](v51, "recentCall"));
      v55 = objc_msgSend(v54, "wasEmergencyCall");

      if (v55)
        v137 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView emergencyItemLabelText:](v51, "emergencyItemLabelText:", v17));
      else
        v137 = 0;
      v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", v114));
      v57 = objc_opt_class(NSString);
      v127 = v56;
      if ((objc_opt_isKindOfClass(v56, v57) & 1) != 0)
        v58 = v56;
      else
        v58 = 0;
      if (objc_msgSend(v58, "length")
        && (v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView delegate](v51, "delegate")),
            v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "rttConversationForUUID:", v58)),
            v60,
            v59,
            v60))
      {
        v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView delegate](v51, "delegate"));
        v62 = objc_msgSend(v61, "recentCallTTYType");

      }
      else
      {
        v62 = 0;
      }
      v63 = [PHRecentCallDetailsItemView alloc];
      v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView timeFormatter](v51, "timeFormatter"));
      v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "stringFromDate:", v141));
      LOBYTE(v109) = v128 == 1;
      v135 = (void *)v50;
      v66 = -[PHRecentCallDetailsItemView initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:](v63, "initWithFrame:callUUID:ttyType:timeLabel:statusLabel:durationAndDataText:emergencyItemsText:verified:", v58, v62, v65, v50, v139, v137, CGRectZero.origin.x, y, width, height, v109);

      if (v62)
        -[PHRecentCallDetailsItemView setDelegate:](v66, "setDelegate:", v140);
      -[PHRecentCallDetailsItemView setTranslatesAutoresizingMaskIntoConstraints:](v66, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHRecentCallDetailsView addSubview:](v140, "addSubview:", v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView leadingAnchor](v66, "leadingAnchor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView leadingAnchor](v140, "leadingAnchor"));
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "constraintEqualToAnchor:", v68));
      objc_msgSend(v69, "setActive:", 1);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView trailingAnchor](v66, "trailingAnchor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView trailingAnchor](v140, "trailingAnchor"));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
      objc_msgSend(v72, "setActive:", 1);

      v3 = v125;
      if (objc_msgSend(v125, "count"))
      {
        v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v125, "lastObject"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView topAnchor](v66, "topAnchor"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "bottomAnchor"));
        v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:constant:", v75, 16.0));
        objc_msgSend(v76, "setActive:", 1);

        v3 = v125;
      }
      else
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredSubheadline1Font](UIFont, "preferredSubheadline1Font"));
        objc_msgSend(v77, "_scaledValueForValue:", 10.0);
        v79 = v78;

        v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsItemView topAnchor](v66, "topAnchor"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "bottomAnchor"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:constant:", v74, ceil(v79)));
        objc_msgSend(v75, "setActive:", 1);
      }
      v133 |= v128 == 1;

      objc_msgSend(v3, "addObject:", v66);
      self = v140;
      v31 = v141;
      v8 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
      v9 = v124;
      v11 = v121;
      v10 = v122;
      v12 = &_s10Foundation12NotificationV36_unconditionallyBridgeFromObjectiveCyACSo14NSNotificationCSgFZ_ptr;
LABEL_46:

      v16 = (char *)v16 + 1;
    }
    while (v9 != v16);
    v87 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v142, v146, 16);
    v9 = v87;
  }
  while (v87);
LABEL_60:

  v88 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
  v89 = (void *)v88;
  if ((v133 & 1) != 0)
  {
    v90 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v91 = v8;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[458], "preferredCaption1Font"));
    objc_msgSend(v90, "setFont:", v92);

    objc_msgSend(v90, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "localizedStringForKey:value:table:", CFSTR("VERIFIED_EXPLANATION"), &stru_10008B240, CFSTR("PHRecents")));
    objc_msgSend(v90, "setText:", v94);

    v95 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor dynamicSecondaryLabelColor](UIColor, "dynamicSecondaryLabelColor"));
    objc_msgSend(v90, "setTextColor:", v95);

    objc_msgSend(v90, "setAdjustsFontForContentSizeCategory:", 1);
    objc_msgSend(v90, "setNumberOfLines:", 0);
    -[PHRecentCallDetailsView addSubview:](self, "addSubview:", v90);
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView leadingAnchor](self, "leadingAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:", v97));
    objc_msgSend(v98, "setActive:", 1);

    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "trailingAnchor"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView trailingAnchor](self, "trailingAnchor"));
    v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "constraintEqualToAnchor:", v100));
    objc_msgSend(v101, "setActive:", 1);

    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "lastBaselineAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v103, 18.5));
    objc_msgSend(v104, "setActive:", 1);

    v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView bottomAnchor](self, "bottomAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "bottomAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91[458], "preferredSubheadline1Font"));
    objc_msgSend(v107, "_scaledValueForValue:", 14.0);
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:", v106));
    objc_msgSend(v108, "setActive:", 1);

    goto LABEL_64;
  }
  if (v88)
  {
    v90 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView bottomAnchor](self, "bottomAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "bottomAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[458], "preferredSubheadline1Font"));
    objc_msgSend(v106, "_scaledValueForValue:", 14.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v105));
    objc_msgSend(v107, "setActive:", 1);
LABEL_64:

  }
  -[PHRecentCallDetailsView setSummaries:](self, "setSummaries:", v3);

}

- (void)reloadCallOccurences
{
  -[PHRecentCallDetailsView _replaceSubviews](self, "_replaceSubviews");
}

- (void)_replaceSubviews
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView subviews](self, "subviews"));
  objc_msgSend(v3, "makeObjectsPerformSelector:", "removeFromSuperview");

  -[PHRecentCallDetailsView loadSubviews](self, "loadSubviews");
}

- (id)stringForTimeInterval:(double)a3
{
  unint64_t v3;
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  void *v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v3 = (unint64_t)a3;
  if ((unint64_t)a3)
  {
    if (v3 <= 0x3B)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v5;
      if (v3 == 1)
        v7 = CFSTR("%@_SECOND");
      else
        v7 = CFSTR("%@_SECONDS");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_10008B240, CFSTR("PHCallHistory")));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView numberFormatter](self, "numberFormatter"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromNumber:", v10));
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v11));

LABEL_21:
      v8 = (void *)v12;
      return v8;
    }
    if (v3 <= 0xE0F)
    {
      v13 = (unsigned __int16)(unint64_t)a3 / 0x3Cu;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = v14;
      if (v3 <= 0x77)
        v15 = CFSTR("%@_MINUTE");
      else
        v15 = CFSTR("%@_MINUTES");
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", v15, &stru_10008B240, CFSTR("PHCallHistory")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView numberFormatter](self, "numberFormatter"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "stringFromNumber:", v17));
      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v8, v18));

      goto LABEL_21;
    }
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v20 = v19;
    if (v3 - 7200 >= 0xFFFFFFFFFFFFF1F0)
      v21 = CFSTR("%@_HOUR");
    else
      v21 = CFSTR("%@_HOURS");
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_10008B240, CFSTR("PHCallHistory")));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView numberFormatter](self, "numberFormatter"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v3 / 0xE10));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stringFromNumber:", v24));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v25));

    if (v3 % 0xE10 >= 0x3C)
    {
      v26 = v3 % 0xE10 / 0x3C;
      v27 = v3 % 0xE10 - 120;
      v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = v28;
      if (v27 >= 0xFFFFFFFFFFFFFFC4)
        v30 = CFSTR("%@_MINUTE");
      else
        v30 = CFSTR("%@_MINUTES");
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", v30, &stru_10008B240, CFSTR("PHCallHistory")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView numberFormatter](self, "numberFormatter"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v26));
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "stringFromNumber:", v33));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v31, v34));

      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v8, v6));
      goto LABEL_21;
    }
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)stringForDataUsage:(id)a3
{
  return +[NSByteCountFormatter stringFromByteCount:countStyle:](NSByteCountFormatter, "stringFromByteCount:countStyle:", objc_msgSend(a3, "longLongValue"), 0);
}

- (id)emergencyItemLabelText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  void *v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCHCallOccurrenceEmergencyVideosCountKey));
  v6 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
    v7 = objc_msgSend(v5, "integerValue");
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kCHCallOccurrenceEmergencyImagesCountKey));
  v9 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_msgSend(v8, "integerValue");
    if (!v7)
      goto LABEL_10;
  }
  else
  {
    v10 = 0;
    if (!v7)
      goto LABEL_10;
  }
  if (!v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Shared %lu videos"), &stru_10008B240, 0));
LABEL_16:
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v7, v19);
    goto LABEL_17;
  }
LABEL_10:
  if (!v7 && v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Shared %lu photos"), &stru_10008B240, 0));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v10, v19);
LABEL_17:
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    goto LABEL_18;
  }
  v14 = 0;
  if (v7 && v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Shared %lu videos and %lu photos"), &stru_10008B240, 0));
    v19 = v10;
    goto LABEL_16;
  }
LABEL_18:
  v15 = sub_10000E6C4();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v21 = (id)objc_opt_class(self);
    v22 = 2112;
    v23 = v14;
    v17 = v21;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ stringForEmergencyItemLabelText detailsItemViewEmergencyItemLabelText:%@", buf, 0x16u);

  }
  return v14;
}

- (void)presentConversationForUUID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHRecentCallDetailsView delegate](self, "delegate"));
  objc_msgSend(v5, "presentConversationForUUID:", v4);

}

- (CHRecentCall)recentCall
{
  return self->_recentCall;
}

- (PHRecentCallDetailsViewDelegate)delegate
{
  return (PHRecentCallDetailsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)summaries
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSummaries:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaries, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_recentCall, 0);
}

@end
