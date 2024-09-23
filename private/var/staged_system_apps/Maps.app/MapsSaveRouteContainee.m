@implementation MapsSaveRouteContainee

- (MapsSaveRouteContainee)initWithDelegate:(id)a3 isEditing:(BOOL)a4 showInitialKeyboard:(BOOL)a5
{
  id v8;
  MapsSaveRouteContainee *v9;
  MapsSaveRouteContainee *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __CFString *v15;
  __CFString *v16;
  __CFString *v17;
  __CFString *v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)MapsSaveRouteContainee;
  v9 = -[MapsSaveRouteContainee init](&v20, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_delegate, v8);
    v10->_isEditing = a4;
    v10->_showInitialKeyboard = a5;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v11, "setHideGrabber:", 1);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v12, "setPresentedModally:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    objc_msgSend(v13, "setAllowsSwipeToDismiss:", 0);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeData"));
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userProvidedName"));
    if (-[__CFString length](v15, "length"))
      v16 = v15;
    else
      v16 = &stru_1011EB268;
    objc_storeStrong((id *)&v10->_originalName, v16);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "userProvidedNotes"));
    if (-[__CFString length](v17, "length"))
      v18 = v17;
    else
      v18 = &stru_1011EB268;
    objc_storeStrong((id *)&v10->_originalNotes, v18);

  }
  return v10;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  ModalCardHeaderView *v5;
  void *v6;
  ModalCardHeaderView *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  UIView *v21;
  UIView *contentContainer;
  void *v23;
  UIView *v24;
  void *v25;
  UITextField *v26;
  UITextField *nameField;
  void *v28;
  void *v29;
  MapsSaveRouteContaineeDelegate **p_delegate;
  id WeakRetained;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  HairlineView *v38;
  double v39;
  double v40;
  TextViewWithPlaceholderText *v41;
  TextViewWithPlaceholderText *notesField;
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
  id v53;
  void *v54;
  void *v55;
  UIView *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  unsigned __int8 v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  MapDataSubscriptionInfo *v67;
  MapDataSubscriptionInfo *existingOfflineSubscription;
  MapsSaveRouteOfflineDownloadView *v69;
  MapsSaveRouteOfflineDownloadView *offlineDownloadView;
  void *v71;
  void *v72;
  UILabel *v73;
  UILabel *offlineDownloadFooter;
  void *v75;
  void *v76;
  void *v77;
  unsigned __int8 v78;
  void *v79;
  void *v80;
  const __CFString *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  UIView *v89;
  void *v90;
  void *v91;
  MapsSaveRouteOfflineDownloadView *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  UILabel *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  void *v175;
  uint64_t v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  UIView *v185;
  HairlineView *v186;
  ModalCardHeaderView *v187;
  void *v188;
  objc_super v189;
  void *v190;
  _QWORD v191[4];
  _QWORD v192[3];
  _QWORD v193[23];

  v189.receiver = self;
  v189.super_class = (Class)MapsSaveRouteContainee;
  -[ContaineeViewController viewDidLoad](&v189, "viewDidLoad");
  -[MapsSaveRouteContainee _startFetchingAddressIfNeeded](self, "_startFetchingAddressIfNeeded");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteContainee view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("SaveToLibraryView"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = [ModalCardHeaderView alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ModalCardHeaderConfiguration libraryCenteredConfiguration](ModalCardHeaderConfiguration, "libraryCenteredConfiguration"));
  v7 = -[ModalCardHeaderView initWithConfiguration:](v5, "initWithConfiguration:", v6);

  -[ModalCardHeaderView setUseAdaptiveFont:](v7, "setUseAdaptiveFont:", 1);
  -[ModalCardHeaderView setTranslatesAutoresizingMaskIntoConstraints:](v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v5) = self->_isEditing;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = v8;
  if ((_DWORD)v5)
    v10 = CFSTR("[Route Creation] Edit Route Title");
  else
    v10 = CFSTR("[Route Creation] Save Route Title");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", v10, CFSTR("localized string not found"), 0));
  -[ModalCardHeaderView setTitle:](v7, "setTitle:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v7, "leadingButton"));
  v13 = sub_1009A98D8();
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(v12, "setTitle:forState:", v14, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingButton](v7, "leadingButton"));
  objc_msgSend(v15, "addTarget:action:forControlEvents:", self, "_pressedCancel", 64);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v7, "trailingButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Done"), CFSTR("localized string not found"), 0));
  objc_msgSend(v16, "setTitle:forState:", v18, 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](v7, "trailingButton"));
  objc_msgSend(v19, "addTarget:action:forControlEvents:", self, "_pressedSave", 64);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomHairline](v7, "bottomHairline"));
  objc_msgSend(v20, "setHidden:", 1);

  v188 = v4;
  objc_msgSend(v4, "addSubview:", v7);
  v187 = v7;
  objc_storeStrong((id *)&self->_modalHeaderView, v7);
  v21 = objc_opt_new(UIView);
  contentContainer = self->_contentContainer;
  self->_contentContainer = v21;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_contentContainer, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v23, "addSubview:", self->_contentContainer);

  v24 = objc_opt_new(UIView);
  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
  -[UIView setBackgroundColor:](v24, "setBackgroundColor:", v25);

  -[UIView _setContinuousCornerRadius:](v24, "_setContinuousCornerRadius:", 10.0);
  -[UIView addSubview:](self->_contentContainer, "addSubview:", v24);
  v26 = objc_opt_new(UITextField);
  nameField = self->_nameField;
  self->_nameField = v26;

  -[UITextField setTranslatesAutoresizingMaskIntoConstraints:](self->_nameField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UITextField setAccessibilityIdentifier:](self->_nameField, "setAccessibilityIdentifier:", CFSTR("RouteNameTextField"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Route Name"), CFSTR("localized string not found"), 0));
  -[UITextField setPlaceholder:](self->_nameField, "setPlaceholder:", v29);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "routeData"));

  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userProvidedName"));
  v184 = v32;
  if (objc_msgSend(v33, "length"))
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "userProvidedName"));
  else
    v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "routeName"));
  v35 = (void *)v34;
  -[UITextField setText:](self->_nameField, "setText:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17SemiBold](UIFont, "system17SemiBold"));
  -[UITextField setFont:](self->_nameField, "setFont:", v36);

  -[UITextField setClearButtonMode:](self->_nameField, "setClearButtonMode:", 1);
  -[UITextField setAutocapitalizationType:](self->_nameField, "setAutocapitalizationType:", 1);
  -[UIView addSubview:](v24, "addSubview:", self->_nameField);
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v37, "addObserver:selector:name:object:", self, "_textValuesDidChange", UITextFieldTextDidChangeNotification, self->_nameField);

  v38 = objc_opt_new(HairlineView);
  -[HairlineView setTranslatesAutoresizingMaskIntoConstraints:](v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  LODWORD(v39) = 1148846080;
  -[HairlineView setContentHuggingPriority:forAxis:](v38, "setContentHuggingPriority:forAxis:", 1, v39);
  LODWORD(v40) = 1148846080;
  -[HairlineView setContentCompressionResistancePriority:forAxis:](v38, "setContentCompressionResistancePriority:forAxis:", 1, v40);
  v186 = v38;
  -[UIView addSubview:](v24, "addSubview:", v38);
  v41 = objc_opt_new(TextViewWithPlaceholderText);
  notesField = self->_notesField;
  self->_notesField = v41;

  -[TextViewWithPlaceholderText setTranslatesAutoresizingMaskIntoConstraints:](self->_notesField, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[TextViewWithPlaceholderText setAccessibilityIdentifier:](self->_notesField, "setAccessibilityIdentifier:", CFSTR("RouteNotesTextView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[TextViewWithPlaceholderText setBackgroundColor:](self->_notesField, "setBackgroundColor:", v43);

  v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v185 = v24;
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Add notes"), CFSTR("localized string not found"), 0));
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_notesField, "placeholderLabel"));
  objc_msgSend(v46, "setText:", v45);

  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_notesField, "placeholderLabel"));
  objc_msgSend(v48, "setTextColor:", v47);

  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText placeholderLabel](self->_notesField, "placeholderLabel"));
  objc_msgSend(v50, "setFont:", v49);

  v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17](UIFont, "system17"));
  -[TextViewWithPlaceholderText setFont:](self->_notesField, "setFont:", v51);

  -[TextViewWithPlaceholderText setDelegate:](self->_notesField, "setDelegate:", self);
  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  -[TextViewWithPlaceholderText setTextColor:](self->_notesField, "setTextColor:", v52);

  v53 = objc_loadWeakRetained((id *)p_delegate);
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "routeData"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "userProvidedNotes"));
  -[TextViewWithPlaceholderText setText:](self->_notesField, "setText:", v55);

  v56 = v185;
  -[UIView addSubview:](v185, "addSubview:", self->_notesField);
  v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v57, "addObserver:selector:name:object:", self, "_textValuesDidChange", UITextViewTextDidChangeNotification, self->_notesField);

  if (!self->_isEditing)
  {
    if (GEOSupportsOfflineMaps(v58, v59))
    {
      v60 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
      v61 = objc_msgSend(v60, "isUsingOfflineMaps");

      if ((v61 & 1) == 0)
      {
        v62 = objc_loadWeakRetained((id *)p_delegate);
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "routeData"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "boundingMapRegion"));

        v65 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:](GEOMapRegion, "_maps_offlineDownloadRegionForRouteBounds:", v64));
        v180 = objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:](GEOMapRegion, "_maps_offlineCoverageRegionForRouteBounds:", v64));
        v66 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
        v67 = (MapDataSubscriptionInfo *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "subscriptionInfoForRegion:", v180));
        existingOfflineSubscription = self->_existingOfflineSubscription;
        self->_existingOfflineSubscription = v67;

        v69 = -[MapsSaveRouteOfflineDownloadView initWithRegion:existingSubscription:]([MapsSaveRouteOfflineDownloadView alloc], "initWithRegion:existingSubscription:", v65, self->_existingOfflineSubscription);
        offlineDownloadView = self->_offlineDownloadView;
        self->_offlineDownloadView = v69;

        -[MapsSaveRouteOfflineDownloadView setTranslatesAutoresizingMaskIntoConstraints:](self->_offlineDownloadView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
        v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondarySystemGroupedBackgroundColor](UIColor, "secondarySystemGroupedBackgroundColor"));
        -[MapsSaveRouteOfflineDownloadView setBackgroundColor:](self->_offlineDownloadView, "setBackgroundColor:", v71);

        -[MapsSaveRouteOfflineDownloadView _setContinuousCornerRadius:](self->_offlineDownloadView, "_setContinuousCornerRadius:", 10.0);
        -[UIView addSubview:](self->_contentContainer, "addSubview:", self->_offlineDownloadView);
        v72 = (void *)v180;
        if (!self->_existingOfflineSubscription)
        {
          v73 = (UILabel *)objc_alloc_init((Class)UILabel);
          offlineDownloadFooter = self->_offlineDownloadFooter;
          self->_offlineDownloadFooter = v73;

          v75 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:compatibleWithTraitCollection:](UIFont, "preferredFontForTextStyle:compatibleWithTraitCollection:", UIFontTextStyleFootnote, 0));
          -[UILabel setFont:](self->_offlineDownloadFooter, "setFont:", v75);

          v76 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
          -[UILabel setTextColor:](self->_offlineDownloadFooter, "setTextColor:", v76);

          -[UILabel setAccessibilityIdentifier:](self->_offlineDownloadFooter, "setAccessibilityIdentifier:", CFSTR("DownloadMapFooter"));
          -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_offlineDownloadFooter, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
          -[UILabel setNumberOfLines:](self->_offlineDownloadFooter, "setNumberOfLines:", 0);
          if (GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled[0], GeoOfflineConfig_AutomaticUpdatesEnabled[1])&& (v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults")), v78 = objc_msgSend(v77, "BOOLForKey:", CFSTR("OfflineMapsAutoUpdateDisclaimerDisplayed")), v77, (v78 & 1) == 0))
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v80 = v79;
            v81 = CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_FOOTER_AUTO_UPDATES_DISCLAIMER");
          }
          else
          {
            v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v80 = v79;
            v81 = CFSTR("SAVE_ROUTE_DOWNLOAD_MAP_FOOTER");
          }
          v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "localizedStringForKey:value:table:", v81, CFSTR("localized string not found"), CFSTR("Offline")));
          -[UILabel setText:](self->_offlineDownloadFooter, "setText:", v82);

          -[UIView addSubview:](self->_contentContainer, "addSubview:", self->_offlineDownloadFooter);
          v72 = (void *)v180;
        }

        v56 = v185;
      }
    }
  }
  v181 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView leadingAnchor](v7, "leadingAnchor"));
  v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
  v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToAnchor:", v177));
  v193[0] = v175;
  v173 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView topAnchor](v7, "topAnchor"));
  v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
  v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintEqualToAnchor:", v172));
  v193[1] = v171;
  v170 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingAnchor](v7, "trailingAnchor"));
  v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v169));
  v193[2] = v168;
  v167 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView bottomAnchor](v7, "bottomAnchor"));
  v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v167, "constraintEqualToAnchor:", v166));
  v193[3] = v165;
  v163 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentContainer, "leadingAnchor"));
  v164 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v164, "leadingAnchor"));
  v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "constraintEqualToAnchor:", v162));
  v193[4] = v161;
  v159 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentContainer, "trailingAnchor"));
  v160 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v158 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "trailingAnchor"));
  v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:", v158));
  v193[5] = v157;
  v155 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentContainer, "topAnchor"));
  v156 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "bottomAnchor"));
  v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v155, "constraintEqualToAnchor:", v154));
  v193[6] = v153;
  v152 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v56, "leadingAnchor"));
  v151 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentContainer, "leadingAnchor"));
  v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToAnchor:constant:", v151, 16.0));
  v193[7] = v150;
  v149 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v56, "trailingAnchor"));
  v148 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentContainer, "trailingAnchor"));
  v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v149, "constraintEqualToAnchor:constant:", v148, -16.0));
  v193[8] = v147;
  v146 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v56, "topAnchor"));
  v145 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_contentContainer, "topAnchor"));
  v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v146, "constraintEqualToAnchor:", v145));
  v193[9] = v144;
  v143 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField leadingAnchor](self->_nameField, "leadingAnchor"));
  v142 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v56, "leadingAnchor"));
  v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v143, "constraintEqualToAnchor:constant:", v142, 15.0));
  v193[10] = v141;
  v140 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField trailingAnchor](self->_nameField, "trailingAnchor"));
  v139 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v56, "trailingAnchor"));
  v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v140, "constraintEqualToAnchor:constant:", v139, -10.0));
  v193[11] = v138;
  v137 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField topAnchor](self->_nameField, "topAnchor"));
  v136 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v56, "topAnchor"));
  v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "constraintEqualToAnchor:constant:", v136, -1.0));
  v193[12] = v135;
  v134 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField heightAnchor](self->_nameField, "heightAnchor"));
  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToConstant:", 48.0));
  v193[13] = v133;
  v132 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView leadingAnchor](v186, "leadingAnchor"));
  v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v56, "leadingAnchor"));
  v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:constant:", v131, 16.0));
  v193[14] = v130;
  v129 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView trailingAnchor](v186, "trailingAnchor"));
  v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v56, "trailingAnchor"));
  v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v128));
  v193[15] = v127;
  v126 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView topAnchor](v186, "topAnchor"));
  v125 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField bottomAnchor](self->_nameField, "bottomAnchor"));
  v124 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:", v125));
  v193[16] = v124;
  v123 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText leadingAnchor](self->_notesField, "leadingAnchor"));
  v122 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v56, "leadingAnchor"));
  v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 10.0));
  v193[17] = v121;
  v120 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText trailingAnchor](self->_notesField, "trailingAnchor"));
  v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v56, "trailingAnchor"));
  v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "constraintEqualToAnchor:constant:", v119, -16.0));
  v193[18] = v118;
  v117 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText topAnchor](self->_notesField, "topAnchor"));
  v116 = (void *)objc_claimAutoreleasedReturnValue(-[HairlineView bottomAnchor](v186, "bottomAnchor"));
  v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v117, "constraintEqualToAnchor:constant:", v116, 6.0));
  v193[19] = v115;
  v114 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText heightAnchor](self->_notesField, "heightAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v114, "constraintEqualToConstant:", 92.0));
  v193[20] = v83;
  v84 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText bottomAnchor](self->_notesField, "bottomAnchor"));
  v85 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v56, "bottomAnchor"));
  v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "constraintEqualToAnchor:constant:", v85, 6.0));
  v193[21] = v86;
  v87 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentContainer, "bottomAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v56, "bottomAnchor"));
  v89 = v56;
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v88, 1.0));
  v193[22] = v90;
  v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v193, 23));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v91);

  v92 = self->_offlineDownloadView;
  if (v92)
  {
    v182 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView leadingAnchor](v92, "leadingAnchor"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_contentContainer, "leadingAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "constraintEqualToAnchor:constant:", v178, 16.0));
    v192[0] = v93;
    v94 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView trailingAnchor](self->_offlineDownloadView, "trailingAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_contentContainer, "trailingAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v95, -16.0));
    v192[1] = v96;
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView topAnchor](self->_offlineDownloadView, "topAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v89, "bottomAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "constraintEqualToAnchor:constant:", v98, 16.0));
    v192[2] = v99;
    v100 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v192, 3));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v100);

    v101 = self->_offlineDownloadFooter;
    if (v101)
    {
      v183 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v101, "leadingAnchor"));
      v176 = objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView leadingAnchor](self->_offlineDownloadView, "leadingAnchor"));
      v174 = objc_claimAutoreleasedReturnValue(objc_msgSend(v183, "constraintEqualToAnchor:constant:", v176, 16.0));
      v191[0] = v174;
      v102 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](self->_offlineDownloadFooter, "trailingAnchor"));
      v179 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView trailingAnchor](self->_offlineDownloadView, "trailingAnchor"));
      v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "constraintEqualToAnchor:constant:", v179, -16.0));
      v191[1] = v103;
      v104 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](self->_offlineDownloadFooter, "topAnchor"));
      v105 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView bottomAnchor](self->_offlineDownloadView, "bottomAnchor"));
      v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v105, 1.0));
      v191[2] = v106;
      v107 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentContainer, "bottomAnchor"));
      v108 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](self->_offlineDownloadFooter, "bottomAnchor"));
      v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v108, 1.0));
      v191[3] = v109;
      v110 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v191, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v110);

      v111 = (void *)v176;
      v112 = (void *)v174;

      v113 = v183;
    }
    else
    {
      v113 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](self->_contentContainer, "bottomAnchor"));
      v111 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSaveRouteOfflineDownloadView bottomAnchor](self->_offlineDownloadView, "bottomAnchor"));
      v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:", v111, 1.0));
      v190 = v112;
      v102 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v190, 1));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v102);
    }

    v89 = v185;
  }

}

- (void)_startFetchingAddressIfNeeded
{
  OS_dispatch_group *v3;
  OS_dispatch_group *fetchAddressDispatchGroup;
  OS_dispatch_group *v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  OS_dispatch_group *v21;
  id v22;
  id v23;
  id location;

  if (!self->_isEditing)
  {
    v3 = (OS_dispatch_group *)dispatch_group_create();
    fetchAddressDispatchGroup = self->_fetchAddressDispatchGroup;
    self->_fetchAddressDispatchGroup = v3;

    v5 = self->_fetchAddressDispatchGroup;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "routeData"));

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "address"));
    if (!v8
      || (v9 = (void *)v8,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "iso3166CountryCode")),
          v11 = objc_msgSend(v10, "length"),
          v10,
          v9,
          (unint64_t)v11 <= 1))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "boundingMapRegion"));
      v13 = v12;
      if (v12)
      {
        objc_msgSend(v12, "centerLat");
        v15 = v14;
        objc_msgSend(v13, "centerLng");
        v17 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "ticketForReverseGeocodeCoordinate:shiftLocationsIfNeeded:traits:", 0, 0, v15, v17));

        dispatch_group_enter((dispatch_group_t)v5);
        objc_initWeak(&location, self);
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_100B92DB8;
        v20[3] = &unk_1011B0D68;
        objc_copyWeak(&v23, &location);
        v21 = v5;
        v22 = v7;
        objc_msgSend(v19, "submitWithHandler:networkActivity:", v20, 0);

        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);

      }
    }

  }
}

+ (BOOL)wantsDefaultHeaderContentViews
{
  return 1;
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3;
  double height;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v3 = -1.0;
  if (a3 - 3 <= 2)
  {
    height = UILayoutFittingCompressedSize.height;
    -[ModalCardHeaderView systemLayoutSizeFittingSize:](self->_modalHeaderView, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    v7 = v6;
    -[UIView systemLayoutSizeFittingSize:](self->_contentContainer, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, height);
    v9 = v7 + v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
    objc_msgSend(v10, "bottomSafeOffset");
    v3 = v9 + v11;

  }
  return v3;
}

- (BOOL)shouldCollapseOnMapGesture
{
  return 0;
}

- (void)_pressedCancel
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  uint8_t v6[16];

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed cancel", v6, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "popContainee");

}

- (void)_pressedSave
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  dispatch_group_t v13;
  MapsSaveRouteOfflineDownloadView *offlineDownloadView;
  int64_t v15;
  void *v16;
  void *v17;
  id v18;
  NSObject *v19;
  NSObject *fetchAddressDispatchGroup;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  unsigned __int8 v28;
  void *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  _QWORD *v33;
  void *v34;
  void *v35;
  id v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  _QWORD *v40;
  id v41;
  int64_t v42;
  _QWORD *v43;
  _QWORD v44[4];
  id v45;
  id v46;
  _QWORD block[4];
  NSObject *v48;
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  NSObject *v53;
  _QWORD v54[4];
  id v55;
  id v56;
  NSObject *v57;
  id v58;
  _QWORD v59[4];
  NSObject *v60;
  MapsSaveRouteContainee *v61;
  id v62;
  int64_t v63;
  _QWORD v64[4];
  NSObject *v65;
  id v66;
  uint8_t buf[4];
  int64_t v68;
  __int16 v69;
  id v70;

  v3 = sub_1004320DC();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "pressed save", buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "routeData"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_nameField, "text"));
  if (objc_msgSend(v7, "length"))
    v8 = objc_claimAutoreleasedReturnValue(-[UITextField text](self->_nameField, "text"));
  else
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeName"));
  v9 = (void *)v8;

  objc_msgSend(v6, "setUserProvidedName:", v9);
  v10 = objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_notesField, "text"));
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = &stru_1011EB268;
  objc_msgSend(v6, "setUserProvidedNotes:", v12);

  v13 = dispatch_group_create();
  if (self->_isEditing)
    goto LABEL_10;
  offlineDownloadView = self->_offlineDownloadView;
  if (!offlineDownloadView
    || !-[MapsSaveRouteOfflineDownloadView shouldDownload](offlineDownloadView, "shouldDownload"))
  {
    goto LABEL_10;
  }
  v15 = -[MapsSaveRouteOfflineDownloadView estimatedRegionSizeInBytes](self->_offlineDownloadView, "estimatedRegionSizeInBytes");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "alertControllerForInsufficientDiskSpaceForDownloadSize:", v15));

  if (!v17)
  {
    v42 = v15;
    v21 = objc_loadWeakRetained((id *)&self->_delegate);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "routeData"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "boundingMapRegion"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineDownloadRegionForRouteBounds:](GEOMapRegion, "_maps_offlineDownloadRegionForRouteBounds:", v23));

    v25 = sub_1004320DC();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138477827;
      v68 = (int64_t)v24;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Adding offline region: %{private}@", buf, 0xCu);
    }

    if (GEOConfigGetBOOL(GeoOfflineConfig_AutomaticUpdatesEnabled[0], GeoOfflineConfig_AutomaticUpdatesEnabled[1]))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
      v28 = objc_msgSend(v27, "BOOLForKey:", CFSTR("OfflineMapsAutoUpdateDisclaimerDisplayed"));

      if ((v28 & 1) == 0)
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
        objc_msgSend(v29, "setBool:forKey:", 1, CFSTR("OfflineMapsAutoUpdateDisclaimerDisplayed"));

      }
    }
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_100B938C8;
    v64[3] = &unk_1011E75D0;
    v30 = v13;
    v65 = v30;
    v31 = v24;
    v66 = v31;
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_100B93B38;
    v59[3] = &unk_1011E7620;
    v63 = v42;
    v43 = objc_retainBlock(v64);
    v62 = v43;
    v32 = v30;
    v60 = v32;
    v61 = self;
    v33 = objc_retainBlock(v59);
    dispatch_group_enter(v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "ticketForOfflineRegionNameSuggestionWithRegion:traits:", v31, 0));

    v36 = sub_1004320DC();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v68 = (int64_t)v35;
      v69 = 2112;
      v70 = v31;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Looking up name with ticket %@, region %@", buf, 0x16u);
    }

    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_100B93D48;
    v54[3] = &unk_1011E7648;
    v55 = v31;
    v56 = v9;
    v58 = v33;
    v57 = v32;
    v38 = MapsConfig_OfflineMapsRegionNameLookupTimeout;
    v39 = off_1014B4EF8;
    v40 = v33;
    v41 = v31;
    objc_msgSend(v35, "submitWithHandler:timeout:networkActivity:queue:", v54, (uint64_t)GEOConfigGetDouble(v38, v39), 0, &_dispatch_main_q);

LABEL_10:
    dispatch_group_enter(v13);
    if (self->_isEditing)
    {
      v51[0] = _NSConcreteStackBlock;
      v51[1] = 3221225472;
      v51[2] = sub_100B93F3C;
      v51[3] = &unk_1011B1820;
      v52 = v6;
      v53 = v13;
      +[MapsSavedRoutesManager saveRouteData:completion:](MapsSavedRoutesManager, "saveRouteData:completion:", v52, v51);

    }
    else
    {
      objc_initWeak((id *)buf, self);
      fetchAddressDispatchGroup = self->_fetchAddressDispatchGroup;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100B9403C;
      block[3] = &unk_1011AFF10;
      objc_copyWeak(&v50, (id *)buf);
      v48 = v13;
      v49 = v6;
      dispatch_group_notify(fetchAddressDispatchGroup, (dispatch_queue_t)&_dispatch_main_q, block);

      objc_destroyWeak(&v50);
      objc_destroyWeak((id *)buf);
    }
    objc_initWeak((id *)buf, self);
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_100B941F8;
    v44[3] = &unk_1011AD1E8;
    objc_copyWeak(&v46, (id *)buf);
    v45 = v6;
    dispatch_group_notify(v13, (dispatch_queue_t)&_dispatch_main_q, v44);

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
    goto LABEL_20;
  }
  v18 = sub_100431D5C();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    v68 = v15;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Displaying insufficient disk space alert for attempted download of %{bytes}llu", buf, 0xCu);
  }

  -[MapsSaveRouteContainee _maps_topMostPresentViewController:animated:completion:](self, "_maps_topMostPresentViewController:animated:completion:", v17, 1, 0);
LABEL_20:

}

- (void)willBecomeCurrent:(BOOL)a3
{
  _BOOL8 v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MapsSaveRouteContainee;
  -[ContaineeViewController willBecomeCurrent:](&v6, "willBecomeCurrent:", a3);
  v4 = -[MapsSaveRouteContainee _doneEnabled](self, "_doneEnabled");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v5, "setEnabled:", v4);

}

- (void)didBecomeCurrent
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MapsSaveRouteContainee;
  -[ContaineeViewController didBecomeCurrent](&v3, "didBecomeCurrent");
  if (self->_showInitialKeyboard)
    -[UITextField becomeFirstResponder](self->_nameField, "becomeFirstResponder");
}

- (void)_textValuesDidChange
{
  _BOOL8 v3;
  id v4;

  v3 = -[MapsSaveRouteContainee _doneEnabled](self, "_doneEnabled");
  v4 = (id)objc_claimAutoreleasedReturnValue(-[ModalCardHeaderView trailingButton](self->_modalHeaderView, "trailingButton"));
  objc_msgSend(v4, "setEnabled:", v3);

}

- (BOOL)_doneEnabled
{
  void *v3;
  __CFString *v4;
  void *v5;
  __CFString *v6;
  _BOOL4 isEditing;
  id v8;
  unsigned int v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_nameField, "text"));
  if (objc_msgSend(v3, "length"))
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue(-[UITextField text](self->_nameField, "text"));
  else
    v4 = &stru_1011EB268;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_notesField, "text"));
  if (objc_msgSend(v5, "length"))
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[TextViewWithPlaceholderText text](self->_notesField, "text"));
  else
    v6 = &stru_1011EB268;

  isEditing = self->_isEditing;
  v8 = -[__CFString length](v4, "length");
  if (isEditing)
  {
    if (v8)
    {
      if (-[NSString isEqualToString:](self->_originalName, "isEqualToString:", v4))
        v9 = !-[NSString isEqualToString:](self->_originalNotes, "isEqualToString:", v6);
      else
        LOBYTE(v9) = 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = v8 != 0;
  }

  return v9;
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  void *v10;

  length = a4.length;
  location = a4.location;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "text"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByReplacingCharactersInRange:withString:", location, length, v8));

  LOBYTE(location) = (unint64_t)objc_msgSend(v10, "length") < 0x2711;
  return location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineDownloadFooter, 0);
  objc_storeStrong((id *)&self->_offlineDownloadView, 0);
  objc_storeStrong((id *)&self->_existingOfflineSubscription, 0);
  objc_storeStrong((id *)&self->_fetchAddressDispatchGroup, 0);
  objc_storeStrong((id *)&self->_originalNotes, 0);
  objc_storeStrong((id *)&self->_originalName, 0);
  objc_storeStrong((id *)&self->_notesField, 0);
  objc_storeStrong((id *)&self->_nameField, 0);
  objc_storeStrong((id *)&self->_contentContainer, 0);
  objc_storeStrong((id *)&self->_modalHeaderView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
