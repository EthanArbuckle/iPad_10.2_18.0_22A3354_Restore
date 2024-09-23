@implementation RouteLibraryCell

- (RouteLibraryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  RouteLibraryCell *v4;
  RouteLibraryCell *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  UIImageView *v10;
  UIImageView *snapshotImageView;
  void *v12;
  id v13;
  id v14;
  void *v15;
  UIImageView *v16;
  UIImageView *placeholderImageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  UIView *v25;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  id v33;
  id v34;
  void *v35;
  UIView *v36;
  UIView *transportTypeContainerView;
  UIImageView *v38;
  UIImageView *transportTypeImageView;
  UIView *v40;
  UIView *textContainerView;
  UILabel *v42;
  UILabel *titleLabel;
  void *v44;
  double v45;
  double v46;
  UILabel *v47;
  UILabel *addressLabel;
  void *v49;
  void *v50;
  double v51;
  double v52;
  MapsThemeMultiPartLabel *v53;
  MapsThemeMultiPartLabel *descriptionLabel;
  void *v55;
  void *v56;
  double v57;
  double v58;
  MapsFadingLabel *v59;
  MapsFadingLabel *notesLabel;
  void *v61;
  void *v62;
  UIButton *v63;
  UIButton *moreButton;
  UIButton *v65;
  void *v66;
  UIButton *v67;
  void *v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  UIButton *v75;
  UIButton *menuButton;
  void *v77;
  void *v78;
  UIButton *v79;
  void *v80;
  double v81;
  double v82;
  RouteLibraryOfflineDownloadStateView *v83;
  RouteLibraryOfflineDownloadStateView *offlineDownloadStateView;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  NSArray *noOfflineDownloadConstraints;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  NSArray *offlineDownloadConstraints;
  void *v95;
  void *v96;
  uint64_t v97;
  NSLayoutConstraint *moreButtonBottomConstraint;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  double v107;
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
  id v124;
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
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  UIView *v234;
  objc_super v235;
  uint64_t v236;
  _QWORD v237[4];
  _QWORD v238[40];
  void *v239;
  void *v240;

  v235.receiver = self;
  v235.super_class = (Class)RouteLibraryCell;
  v4 = -[RouteLibraryCell initWithStyle:reuseIdentifier:](&v235, "initWithStyle:reuseIdentifier:", a3, a4);
  v5 = v4;
  if (v4)
  {
    v6 = (objc_class *)objc_opt_class(v4);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    -[RouteLibraryCell setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", v8);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell contentView](v5, "contentView"));
    v10 = objc_opt_new(UIImageView);
    snapshotImageView = v5->_snapshotImageView;
    v5->_snapshotImageView = v10;

    -[UIImageView setAccessibilityIdentifier:](v5->_snapshotImageView, "setAccessibilityIdentifier:", CFSTR("SnapshotImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_snapshotImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_snapshotImageView, "setContentMode:", 4);
    -[UIImageView _setContinuousCornerRadius:](v5->_snapshotImageView, "_setContinuousCornerRadius:", 8.0);
    -[UIImageView setClipsToBounds:](v5->_snapshotImageView, "setClipsToBounds:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_snapshotImageView, "layer"));
    objc_msgSend(v12, "setBorderWidth:", 0.5);

    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v14 = objc_msgSend(v13, "CGColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_snapshotImageView, "layer"));
    objc_msgSend(v15, "setBorderColor:", v14);

    objc_msgSend(v9, "addSubview:", v5->_snapshotImageView);
    v16 = objc_opt_new(UIImageView);
    placeholderImageView = v5->_placeholderImageView;
    v5->_placeholderImageView = v16;

    -[UIImageView setAccessibilityIdentifier:](v5->_placeholderImageView, "setAccessibilityIdentifier:", CFSTR("PlaceholderImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_placeholderImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_placeholderImageView, "setContentMode:", 4);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("figure.walk")));
    -[UIImageView setImage:](v5->_placeholderImageView, "setImage:", v18);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
    -[UIImageView setBackgroundColor:](v5->_placeholderImageView, "setBackgroundColor:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[UIImageView setTintColor:](v5->_placeholderImageView, "setTintColor:", v20);

    -[UIImageView _setContinuousCornerRadius:](v5->_placeholderImageView, "_setContinuousCornerRadius:", 8.0);
    -[UIImageView setClipsToBounds:](v5->_placeholderImageView, "setClipsToBounds:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_placeholderImageView, "layer"));
    objc_msgSend(v21, "setBorderWidth:", 0.5);

    v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.0799999982)));
    v23 = objc_msgSend(v22, "CGColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](v5->_placeholderImageView, "layer"));
    objc_msgSend(v24, "setBorderColor:", v23);

    objc_msgSend(v9, "addSubview:", v5->_placeholderImageView);
    v25 = objc_opt_new(UIView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v25, "layer"));
    objc_msgSend(v26, "setShadowOffset:", 0.0, 4.0);

    v27 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v28 = objc_msgSend(v27, "CGColor");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v25, "layer"));
    objc_msgSend(v29, "setShadowColor:", v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v25, "layer"));
    objc_msgSend(v30, "setShadowRadius:", 8.0);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v25, "layer"));
    LODWORD(v32) = 1042536202;
    objc_msgSend(v31, "setShadowOpacity:", v32);

    v33 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", 0.0, 0.0, 20.0, 20.0, 10.0)));
    v34 = objc_msgSend(v33, "CGPath");
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](v25, "layer"));
    objc_msgSend(v35, "setShadowPath:", v34);

    v234 = v25;
    objc_msgSend(v9, "addSubview:", v25);
    v36 = objc_opt_new(UIView);
    transportTypeContainerView = v5->_transportTypeContainerView;
    v5->_transportTypeContainerView = v36;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_transportTypeContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIView _setCornerRadius:](v5->_transportTypeContainerView, "_setCornerRadius:", 10.0);
    -[UIView setClipsToBounds:](v5->_transportTypeContainerView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v25, "addSubview:", v5->_transportTypeContainerView);
    v38 = objc_opt_new(UIImageView);
    transportTypeImageView = v5->_transportTypeImageView;
    v5->_transportTypeImageView = v38;

    -[UIImageView setAccessibilityIdentifier:](v5->_transportTypeImageView, "setAccessibilityIdentifier:", CFSTR("TransportTypeImageView"));
    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v5->_transportTypeImageView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UIImageView setContentMode:](v5->_transportTypeImageView, "setContentMode:", 4);
    -[UIImageView setClipsToBounds:](v5->_transportTypeImageView, "setClipsToBounds:", 1);
    -[UIView addSubview:](v5->_transportTypeContainerView, "addSubview:", v5->_transportTypeImageView);
    v40 = objc_opt_new(UIView);
    textContainerView = v5->_textContainerView;
    v5->_textContainerView = v40;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v5->_textContainerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v9, "addSubview:", v5->_textContainerView);
    v42 = objc_opt_new(UILabel);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v42;

    -[UILabel setAccessibilityIdentifier:](v5->_titleLabel, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:weight:](UIFont, "_preferredFontForTextStyle:weight:", UIFontTextStyleBody, UIFontWeightSemibold));
    -[UILabel setFont:](v5->_titleLabel, "setFont:", v44);

    LODWORD(v45) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_titleLabel, "setContentHuggingPriority:forAxis:", 1, v45);
    LODWORD(v46) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_titleLabel, "setContentCompressionResistancePriority:forAxis:", 1, v46);
    -[UIView addSubview:](v5->_textContainerView, "addSubview:", v5->_titleLabel);
    v47 = objc_opt_new(UILabel);
    addressLabel = v5->_addressLabel;
    v5->_addressLabel = v47;

    -[UILabel setAccessibilityIdentifier:](v5->_addressLabel, "setAccessibilityIdentifier:", CFSTR("AddressLabel"));
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_addressLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[UILabel setFont:](v5->_addressLabel, "setFont:", v49);

    v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UILabel setTextColor:](v5->_addressLabel, "setTextColor:", v50);

    LODWORD(v51) = 1148846080;
    -[UILabel setContentHuggingPriority:forAxis:](v5->_addressLabel, "setContentHuggingPriority:forAxis:", 1, v51);
    LODWORD(v52) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v5->_addressLabel, "setContentCompressionResistancePriority:forAxis:", 1, v52);
    -[UIView addSubview:](v5->_textContainerView, "addSubview:", v5->_addressLabel);
    v53 = objc_opt_new(MapsThemeMultiPartLabel);
    descriptionLabel = v5->_descriptionLabel;
    v5->_descriptionLabel = v53;

    -[MapsThemeMultiPartLabel setAccessibilityIdentifier:](v5->_descriptionLabel, "setAccessibilityIdentifier:", CFSTR("DescriptionLabel"));
    -[MapsThemeMultiPartLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[MapsThemeMultiPartLabel setUserInteractionEnabled:](v5->_descriptionLabel, "setUserInteractionEnabled:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[MapsThemeMultiPartLabel setFont:](v5->_descriptionLabel, "setFont:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsThemeMultiPartLabel setTextColor:](v5->_descriptionLabel, "setTextColor:", v56);

    -[MapsThemeMultiPartLabel setNumberOfLines:](v5->_descriptionLabel, "setNumberOfLines:", 1);
    LODWORD(v57) = 1148846080;
    -[MapsThemeMultiPartLabel setContentHuggingPriority:forAxis:](v5->_descriptionLabel, "setContentHuggingPriority:forAxis:", 1, v57);
    LODWORD(v58) = 1148846080;
    -[MapsThemeMultiPartLabel setContentCompressionResistancePriority:forAxis:](v5->_descriptionLabel, "setContentCompressionResistancePriority:forAxis:", 1, v58);
    -[UIView addSubview:](v5->_textContainerView, "addSubview:", v5->_descriptionLabel);
    v59 = -[MapsFadingLabel initWithFrame:]([MapsFadingLabel alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    notesLabel = v5->_notesLabel;
    v5->_notesLabel = v59;

    -[MapsFadingLabel setAccessibilityIdentifier:](v5->_notesLabel, "setAccessibilityIdentifier:", CFSTR("NotesLabel"));
    -[MapsFadingLabel setTranslatesAutoresizingMaskIntoConstraints:](v5->_notesLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
    -[MapsFadingLabel setFont:](v5->_notesLabel, "setFont:", v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[MapsFadingLabel setTextColor:](v5->_notesLabel, "setTextColor:", v62);

    -[MapsFadingLabel setNumberOfLines:](v5->_notesLabel, "setNumberOfLines:", 2);
    -[MapsFadingLabel setDelegate:](v5->_notesLabel, "setDelegate:", v5);
    objc_msgSend(v9, "addSubview:", v5->_notesLabel);
    v63 = objc_opt_new(UIButton);
    moreButton = v5->_moreButton;
    v5->_moreButton = v63;

    -[UIButton setAccessibilityIdentifier:](v5->_moreButton, "setAccessibilityIdentifier:", CFSTR("MoreButton"));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_moreButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v65 = v5->_moreButton;
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setTitleColor:forState:](v65, "setTitleColor:forState:", v66, 0);

    v67 = v5->_moreButton;
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "localizedStringForKey:value:table:", CFSTR("[Route Creation] More Notes"), CFSTR("localized string not found"), 0));
    -[UIButton setTitle:forState:](v67, "setTitle:forState:", v69, 0);

    -[UIButton addTarget:action:forControlEvents:](v5->_moreButton, "addTarget:action:forControlEvents:", v5, "_pressedMore", 64);
    LODWORD(v70) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_moreButton, "setContentHuggingPriority:forAxis:", 0, v70);
    LODWORD(v71) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_moreButton, "setContentHuggingPriority:forAxis:", 1, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel font](v5->_notesLabel, "font"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton titleLabel](v5->_moreButton, "titleLabel"));
    objc_msgSend(v73, "setFont:", v72);

    v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[UIButton setBackgroundColor:](v5->_moreButton, "setBackgroundColor:", v74);

    -[UIButton setHidden:](v5->_moreButton, "setHidden:", 1);
    objc_msgSend(v9, "addSubview:", v5->_moreButton);
    v75 = objc_opt_new(UIButton);
    menuButton = v5->_menuButton;
    v5->_menuButton = v75;

    -[UIButton setAccessibilityIdentifier:](v5->_menuButton, "setAccessibilityIdentifier:", CFSTR("MenuButton"));
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](v5->_menuButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIButton setTintColor:](v5->_menuButton, "setTintColor:", v77);

    -[UIButton setShowsMenuAsPrimaryAction:](v5->_menuButton, "setShowsMenuAsPrimaryAction:", 1);
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightSemibold));
    v230 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v78));

    v79 = v5->_menuButton;
    v80 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("ellipsis"), v230));
    -[UIButton setImage:forState:](v79, "setImage:forState:", v80, 0);

    LODWORD(v81) = 1148846080;
    -[UIButton setContentHuggingPriority:forAxis:](v5->_menuButton, "setContentHuggingPriority:forAxis:", 0, v81);
    LODWORD(v82) = 1148846080;
    -[UIButton setContentCompressionResistancePriority:forAxis:](v5->_menuButton, "setContentCompressionResistancePriority:forAxis:", 0, v82);
    -[UIButton _setTouchInsets:](v5->_menuButton, "_setTouchInsets:", -11.0, -11.0, -11.0, -11.0);
    v233 = v9;
    objc_msgSend(v9, "addSubview:", v5->_menuButton);
    -[RouteLibraryCell _updateMenu](v5, "_updateMenu");
    v83 = objc_opt_new(RouteLibraryOfflineDownloadStateView);
    offlineDownloadStateView = v5->_offlineDownloadStateView;
    v5->_offlineDownloadStateView = v83;

    -[RouteLibraryOfflineDownloadStateView setAccessibilityIdentifier:](v5->_offlineDownloadStateView, "setAccessibilityIdentifier:", CFSTR("OfflineDownloadState"));
    -[RouteLibraryOfflineDownloadStateView setTranslatesAutoresizingMaskIntoConstraints:](v5->_offlineDownloadStateView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[RouteLibraryOfflineDownloadStateView setHidden:](v5->_offlineDownloadStateView, "setHidden:", 1);
    objc_msgSend(v9, "addSubview:", v5->_offlineDownloadStateView);
    v85 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v5->_menuButton, "leadingAnchor"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:constant:", v86, -8.0));
    v240 = v87;
    v88 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v240, 1));
    noOfflineDownloadConstraints = v5->_noOfflineDownloadConstraints;
    v5->_noOfflineDownloadConstraints = (NSArray *)v88;

    v90 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView leadingAnchor](v5->_offlineDownloadStateView, "leadingAnchor"));
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "constraintEqualToAnchor:constant:", v91, -8.0));
    v239 = v92;
    v93 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v239, 1));
    offlineDownloadConstraints = v5->_offlineDownloadConstraints;
    v5->_offlineDownloadConstraints = (NSArray *)v93;

    v95 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton lastBaselineAnchor](v5->_moreButton, "lastBaselineAnchor"));
    v96 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel lastBaselineAnchor](v5->_notesLabel, "lastBaselineAnchor"));
    v97 = objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "constraintEqualToAnchor:", v96));
    moreButtonBottomConstraint = v5->_moreButtonBottomConstraint;
    v5->_moreButtonBottomConstraint = (NSLayoutConstraint *)v97;

    if (sub_1002A8AA0(v5) == 5)
      v99 = 4.0;
    else
      v99 = 8.0;
    if (sub_1002A8AA0(v5) == 5)
      v100 = 8.0;
    else
      v100 = 12.0;
    v226 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_snapshotImageView, "leadingAnchor"));
    v225 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v224 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v226, "constraintEqualToAnchor:constant:", v225, 16.0));
    v238[0] = v224;
    v222 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v5->_snapshotImageView, "topAnchor"));
    v221 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v220 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v222, "constraintEqualToAnchor:constant:", v221, 16.0));
    v238[1] = v220;
    v219 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_snapshotImageView, "widthAnchor"));
    v216 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v219, "constraintEqualToConstant:", 64.0));
    v238[2] = v216;
    v227 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_snapshotImageView, "heightAnchor"));
    v215 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v227, "constraintEqualToConstant:", 64.0));
    v238[3] = v215;
    v214 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_placeholderImageView, "leadingAnchor"));
    v213 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
    v212 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v214, "constraintEqualToAnchor:constant:", v213, 16.0));
    v238[4] = v212;
    v210 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v5->_placeholderImageView, "topAnchor"));
    v209 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v208 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v210, "constraintEqualToAnchor:constant:", v209, 16.0));
    v238[5] = v208;
    v207 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView widthAnchor](v5->_placeholderImageView, "widthAnchor"));
    v206 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v207, "constraintEqualToConstant:", 64.0));
    v238[6] = v206;
    v205 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView heightAnchor](v5->_placeholderImageView, "heightAnchor"));
    v204 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v205, "constraintEqualToConstant:", 64.0));
    v238[7] = v204;
    v203 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v25, "leadingAnchor"));
    v202 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView leadingAnchor](v5->_placeholderImageView, "leadingAnchor"));
    v201 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v203, "constraintEqualToAnchor:constant:", v202, 48.0));
    v238[8] = v201;
    v200 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v25, "topAnchor"));
    v199 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView topAnchor](v5->_placeholderImageView, "topAnchor"));
    v198 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "constraintEqualToAnchor:constant:", v199, 48.0));
    v238[9] = v198;
    v197 = (void *)objc_claimAutoreleasedReturnValue(-[UIView widthAnchor](v25, "widthAnchor"));
    v196 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v197, "constraintEqualToConstant:", 20.0));
    v238[10] = v196;
    v195 = (void *)objc_claimAutoreleasedReturnValue(-[UIView heightAnchor](v25, "heightAnchor"));
    v194 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v195, "constraintEqualToConstant:", 20.0));
    v238[11] = v194;
    v193 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_transportTypeContainerView, "leadingAnchor"));
    v192 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v25, "leadingAnchor"));
    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v193, "constraintEqualToAnchor:", v192));
    v238[12] = v191;
    v190 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_transportTypeContainerView, "trailingAnchor"));
    v189 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v25, "trailingAnchor"));
    v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "constraintEqualToAnchor:", v189));
    v238[13] = v188;
    v187 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_transportTypeContainerView, "topAnchor"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v25, "topAnchor"));
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v187, "constraintEqualToAnchor:", v186));
    v238[14] = v185;
    v184 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_transportTypeContainerView, "bottomAnchor"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v25, "bottomAnchor"));
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v184, "constraintEqualToAnchor:", v183));
    v238[15] = v182;
    v181 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerXAnchor](v5->_transportTypeImageView, "centerXAnchor"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerXAnchor](v5->_transportTypeContainerView, "centerXAnchor"));
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v181, "constraintEqualToAnchor:", v180));
    v238[16] = v179;
    v217 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_transportTypeImageView, "centerYAnchor"));
    v211 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5->_transportTypeContainerView, "centerYAnchor"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v217, "constraintEqualToAnchor:", v211));
    v238[17] = v178;
    v177 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v5->_menuButton, "trailingAnchor"));
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v177, "constraintEqualToAnchor:constant:", v176, -16.0));
    v238[18] = v175;
    v174 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v5->_menuButton, "centerYAnchor"));
    v173 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel centerYAnchor](v5->_titleLabel, "centerYAnchor"));
    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v174, "constraintEqualToAnchor:", v173));
    v238[19] = v172;
    v171 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_textContainerView, "leadingAnchor"));
    v170 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView trailingAnchor](v5->_placeholderImageView, "trailingAnchor"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v171, "constraintEqualToAnchor:constant:", v170, v100));
    v238[20] = v169;
    v168 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_textContainerView, "trailingAnchor"));
    v167 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v168, "constraintEqualToAnchor:constant:", v167, -16.0));
    v238[21] = v166;
    v165 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_textContainerView, "topAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v165, "constraintGreaterThanOrEqualToAnchor:constant:", v164, 16.0));
    v238[22] = v163;
    v162 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_textContainerView, "topAnchor"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    LODWORD(v101) = 1148813312;
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:constant:priority:", v161, 16.0, v101));
    v238[23] = v160;
    v159 = (void *)objc_claimAutoreleasedReturnValue(-[UIView centerYAnchor](v5->_textContainerView, "centerYAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView centerYAnchor](v5->_placeholderImageView, "centerYAnchor"));
    LODWORD(v102) = 1148829696;
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v159, "constraintEqualToAnchor:constant:priority:", v158, 0.0, v102));
    v238[24] = v157;
    v156 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_textContainerView, "leadingAnchor"));
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v156, "constraintEqualToAnchor:", v155));
    v238[25] = v154;
    v153 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_titleLabel, "topAnchor"));
    v152 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](v5->_textContainerView, "topAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "constraintEqualToAnchor:", v152));
    v238[26] = v151;
    v150 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_addressLabel, "leadingAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v149));
    v238[27] = v148;
    v147 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_addressLabel, "trailingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel trailingAnchor](v5->_titleLabel, "trailingAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v146));
    v238[28] = v145;
    v144 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel topAnchor](v5->_addressLabel, "topAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_titleLabel, "bottomAnchor"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:constant:", v143, 1.0));
    v238[29] = v142;
    v141 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel leadingAnchor](v5->_descriptionLabel, "leadingAnchor"));
    v231 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel leadingAnchor](v5->_titleLabel, "leadingAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v231));
    v238[30] = v140;
    v139 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel trailingAnchor](v5->_descriptionLabel, "trailingAnchor"));
    v138 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_textContainerView, "trailingAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "constraintEqualToAnchor:", v138));
    v238[31] = v137;
    v136 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel topAnchor](v5->_descriptionLabel, "topAnchor"));
    v223 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel bottomAnchor](v5->_addressLabel, "bottomAnchor"));
    v135 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v136, "constraintEqualToAnchor:constant:", v223, -6.0));
    v238[32] = v135;
    v218 = (void *)objc_claimAutoreleasedReturnValue(-[MapsThemeMultiPartLabel bottomAnchor](v5->_descriptionLabel, "bottomAnchor"));
    v134 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_textContainerView, "bottomAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v218, "constraintEqualToAnchor:constant:", v134, 8.0));
    v238[33] = v133;
    v132 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel leadingAnchor](v5->_notesLabel, "leadingAnchor"));
    v131 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](v5->_textContainerView, "leadingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v132, "constraintEqualToAnchor:", v131));
    v238[34] = v130;
    v129 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel trailingAnchor](v5->_notesLabel, "trailingAnchor"));
    v128 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](v5->_textContainerView, "trailingAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v129, "constraintEqualToAnchor:", v128));
    v238[35] = v127;
    v126 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel topAnchor](v5->_notesLabel, "topAnchor"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(-[UIView bottomAnchor](v5->_textContainerView, "bottomAnchor"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v126, "constraintEqualToAnchor:constant:", v103, v99));
    v238[36] = v104;
    v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel bottomAnchor](v5->_notesLabel, "bottomAnchor"));
    LODWORD(v107) = 1132068864;
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "constraintEqualToAnchor:constant:priority:", v106, 16.0, v107));
    v238[37] = v108;
    v109 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton trailingAnchor](v5->_moreButton, "trailingAnchor"));
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[MapsFadingLabel trailingAnchor](v5->_notesLabel, "trailingAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v110));
    v238[38] = v111;
    v238[39] = v5->_moreButtonBottomConstraint;
    v112 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v238, 40));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v112);

    -[RouteLibraryCell _updateMoreButton](v5, "_updateMoreButton");
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v5->_noOfflineDownloadConstraints);
    v232 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView centerYAnchor](v5->_offlineDownloadStateView, "centerYAnchor"));
    v229 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton centerYAnchor](v5->_menuButton, "centerYAnchor"));
    v228 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v232, "constraintEqualToAnchor:", v229));
    v237[0] = v228;
    v113 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView widthAnchor](v5->_offlineDownloadStateView, "widthAnchor"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "constraintEqualToConstant:", 16.0));
    v237[1] = v114;
    v115 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView heightAnchor](v5->_offlineDownloadStateView, "heightAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView widthAnchor](v5->_offlineDownloadStateView, "widthAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:", v116));
    v237[2] = v117;
    v118 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryOfflineDownloadStateView trailingAnchor](v5->_offlineDownloadStateView, "trailingAnchor"));
    v119 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton leadingAnchor](v5->_menuButton, "leadingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v118, "constraintEqualToAnchor:constant:", v119, -8.0));
    v237[3] = v120;
    v121 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v237, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v121);

    v122 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v122, "addObserver:selector:name:object:", v5, "_refreshOfflineSubscription", CFSTR("OfflineMapsSubscriptionsDidChangeNotification"), 0);

    v236 = objc_opt_class(UITraitUserInterfaceStyle);
    v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v236, 1));
    v124 = -[RouteLibraryCell registerForTraitChanges:withTarget:action:](v5, "registerForTraitChanges:withTarget:action:", v123, v5, "_userInterfaceStyleDidChange");

    _GEOConfigAddDelegateListenerForKey(MapsConfig_RouteCreationAvailable, off_1014B55A8, &_dispatch_main_q, v5);
  }
  return v5;
}

- (void)_updateMoreButton
{
  -[UIButton intrinsicContentSize](self->_moreButton, "intrinsicContentSize");
  -[MapsFadingLabel setTrailingPadding:](self->_notesLabel, "setTrailingPadding:");
}

- (void)_updateMenu
{
  int BOOL;
  MapDataSubscriptionInfo *offlineSubscription;
  void *v5;
  char *v6;
  void *v7;
  void *v8;
  uint64_t v9;
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
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  NSMutableArray *v27;
  NSMutableArray *v28;
  void *v29;
  RouteLibraryCell *v30;
  uint64_t v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[4];
  id v36;
  _QWORD v37[4];
  id v38;
  _QWORD v39[4];
  id v40;
  id location[2];

  objc_initWeak(location, self);
  BOOL = GEOConfigGetBOOL(MapsConfig_RouteCreationAvailable, off_1014B55A8);
  v30 = self;
  if ((-[GEOComposedGeometryRoutePersistentData isAvailableForCurrentCountry](self->_routeData, "isAvailableForCurrentCountry") & BOOL) == 1)
  {
    if (GEOSupportsOfflineMaps())
    {
      offlineSubscription = self->_offlineSubscription;
      if (offlineSubscription
        && (v5 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](offlineSubscription, "state")),
            v6 = (char *)objc_msgSend(v5, "loadState"),
            v5,
            (unint64_t)(v6 - 1) < 2))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Offline Data Downloaded"), CFSTR("localized string not found"), 0));

        v9 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("checkmark.circle")));
      }
      else
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", self));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Download Offline Data"), CFSTR("localized string not found"), 0));

        v9 = objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.down.circle")));
      }
      v12 = (void *)v9;
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_1004E4628;
      v39[3] = &unk_1011AF8A0;
      objc_copyWeak(&v40, location);
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v8, v12, 0, v39));
      objc_destroyWeak(&v40);

    }
    else
    {
      v32 = 0;
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v30));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Directions on Route"), CFSTR("localized string not found"), 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("arrow.triangle.turn.up.right.circle")));
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_1004E4654;
    v37[3] = &unk_1011AF8A0;
    objc_copyWeak(&v38, location);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v14, v15, 0, v37));

    objc_destroyWeak(&v38);
  }
  else
  {
    v32 = 0;
    v10 = 0;
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle", v30));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Edit Route"), CFSTR("localized string not found"), 0));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("pencil")));
  v35[0] = _NSConcreteStackBlock;
  v35[1] = 3221225472;
  v35[2] = sub_1004E4680;
  v35[3] = &unk_1011AF8A0;
  objc_copyWeak(&v36, location);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v17, v18, 0, v35));

  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Delete Route"), CFSTR("localized string not found"), 0));
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("trash")));
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1004E46AC;
  v33[3] = &unk_1011AF8A0;
  objc_copyWeak(&v34, location);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v21, v22, 0, v33));

  objc_msgSend(v23, "setAttributes:", 2);
  v24 = objc_opt_new(NSMutableArray);
  v25 = v24;
  if (v10)
    -[NSMutableArray addObject:](v24, "addObject:", v10);
  if (v32)
    -[NSMutableArray addObject:](v25, "addObject:", v32);
  if (-[NSMutableArray count](v25, "count"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 1, v25));
    if ((unint64_t)-[NSMutableArray count](v25, "count") >= 2)
      objc_msgSend(v26, "setPreferredElementSize:", 1);
  }
  else
  {
    v26 = 0;
  }
  v27 = objc_opt_new(NSMutableArray);
  v28 = v27;
  if (v26)
    -[NSMutableArray addObject:](v27, "addObject:", v26);
  -[NSMutableArray addObject:](v28, "addObject:", v19);
  -[NSMutableArray addObject:](v28, "addObject:", v23);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIMenu menuWithTitle:image:identifier:options:children:](UIMenu, "menuWithTitle:image:identifier:options:children:", &stru_1011EB268, 0, 0, 0, v28));
  objc_msgSend(*(id *)(v31 + 96), "setMenu:", v29);

  objc_destroyWeak(&v34);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
}

- (void)dealloc
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  objc_super v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  if (self->_offlineSubscription)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    v3 = objc_msgSend(&off_101273770, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v9;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v9 != v5)
            objc_enumerationMutation(&off_101273770);
          -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](self->_offlineSubscription, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), off_1014ABAB0);
          v6 = (char *)v6 + 1;
        }
        while (v4 != v6);
        v4 = objc_msgSend(&off_101273770, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v4);
    }
  }
  GEOConfigRemoveDelegateListenerForAllKeys(self, a2);
  v7.receiver = self;
  v7.super_class = (Class)RouteLibraryCell;
  -[RouteLibraryCell dealloc](&v7, "dealloc");
}

- (void)setOfflineSubscription:(id)a3
{
  MapDataSubscriptionInfo *v5;
  MapDataSubscriptionInfo **p_offlineSubscription;
  MapDataSubscriptionInfo *offlineSubscription;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  MapDataSubscriptionInfo *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *j;
  int *v17;
  int *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];

  v5 = (MapDataSubscriptionInfo *)a3;
  p_offlineSubscription = &self->_offlineSubscription;
  offlineSubscription = self->_offlineSubscription;
  if (offlineSubscription != v5)
  {
    if (offlineSubscription)
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      v8 = objc_msgSend(&off_101273788, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v24 != v10)
              objc_enumerationMutation(&off_101273788);
            -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](*p_offlineSubscription, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), off_1014ABAB0);
          }
          v9 = objc_msgSend(&off_101273788, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        }
        while (v9);
      }
    }
    objc_storeStrong((id *)&self->_offlineSubscription, a3);
    -[RouteLibraryOfflineDownloadStateView setSubscriptionInfo:](self->_offlineDownloadStateView, "setSubscriptionInfo:", v5);
    v12 = *p_offlineSubscription;
    if (*p_offlineSubscription)
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v13 = objc_msgSend(&off_1012737A0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v20;
        do
        {
          for (j = 0; j != v14; j = (char *)j + 1)
          {
            if (*(_QWORD *)v20 != v15)
              objc_enumerationMutation(&off_1012737A0);
            -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](*p_offlineSubscription, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)j), 0, off_1014ABAB0);
          }
          v14 = objc_msgSend(&off_1012737A0, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
        }
        while (v14);
      }
      if (offlineSubscription)
        goto LABEL_23;
      v17 = &OBJC_IVAR___RouteLibraryCell__noOfflineDownloadConstraints;
      v18 = &OBJC_IVAR___RouteLibraryCell__offlineDownloadConstraints;
    }
    else
    {
      if (!offlineSubscription)
      {
LABEL_23:
        -[RouteLibraryCell _updateMenu](self, "_updateMenu");
        goto LABEL_24;
      }
      v18 = &OBJC_IVAR___RouteLibraryCell__noOfflineDownloadConstraints;
      v17 = &OBJC_IVAR___RouteLibraryCell__offlineDownloadConstraints;
    }
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v17));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", *(Class *)((char *)&self->super.super.super.super.isa + *v18));
    -[RouteLibraryOfflineDownloadStateView setHidden:](self->_offlineDownloadStateView, "setHidden:", v12 == 0);
    goto LABEL_23;
  }
LABEL_24:

}

- (void)_refreshOfflineSubscription
{
  GEOComposedGeometryRoutePersistentData *routeData;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  routeData = self->_routeData;
  if (routeData)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedGeometryRoutePersistentData boundingMapRegion](routeData, "boundingMapRegion"));
    v7 = (id)objc_claimAutoreleasedReturnValue(+[GEOMapRegion _maps_offlineCoverageRegionForRouteBounds:](GEOMapRegion, "_maps_offlineCoverageRegionForRouteBounds:", v4));

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subscriptionInfoForRegion:", v7));
    -[RouteLibraryCell setOfflineSubscription:](self, "setOfflineSubscription:", v6);

  }
  else
  {
    -[RouteLibraryCell setOfflineSubscription:](self, "setOfflineSubscription:", 0);
  }
}

- (void)prepareForReuse
{
  MURouteSnapshotKey *cacheKey;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)RouteLibraryCell;
  -[RouteLibraryCell prepareForReuse](&v4, "prepareForReuse");
  cacheKey = self->_cacheKey;
  self->_cacheKey = 0;

  -[UIImageView setImage:](self->_snapshotImageView, "setImage:", 0);
  -[UIImageView setAlpha:](self->_snapshotImageView, "setAlpha:", 0.0);
  -[UIImageView setAlpha:](self->_placeholderImageView, "setAlpha:", 1.0);
}

- (void)setRouteData:(id)a3 delegate:(id)a4 userInterfaceStyle:(int64_t)a5 inWidth:(double)a6
{
  id v10;
  id v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[2];
  _QWORD v37[2];

  v10 = a3;
  objc_storeStrong((id *)&self->_routeData, a3);
  v11 = a4;
  objc_storeWeak((id *)&self->_delegate, v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userProvidedName"));
  -[UILabel setText:](self->_titleLabel, "setText:", v12);

  v13 = objc_msgSend(v10, "isAvailableForCurrentCountry");
  if (objc_msgSend(v10, "transportType") == 2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 8, 2, 12.0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("figure.walk"), v14));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "imageWithRenderingMode:", 2));

  }
  else
  {
    v16 = 0;
  }
  -[UIImageView setImage:](self->_transportTypeImageView, "setImage:", v16);

  if (v13)
  {
    if (a5 == 2)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      -[UIImageView setTintColor:](self->_transportTypeImageView, "setTintColor:", v17);

LABEL_8:
      v19 = objc_claimAutoreleasedReturnValue(+[UIColor tertiarySystemBackgroundColor](UIColor, "tertiarySystemBackgroundColor"));
      goto LABEL_11;
    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    -[UIImageView setTintColor:](self->_transportTypeImageView, "setTintColor:", v20);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
    -[UIImageView setTintColor:](self->_transportTypeImageView, "setTintColor:", v18);

    if (a5 == 2)
      goto LABEL_8;
  }
  v19 = objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
LABEL_11:
  v21 = (void *)v19;
  -[UIView setBackgroundColor:](self->_transportTypeContainerView, "setBackgroundColor:", v19);

  if ((v13 & 1) != 0)
    v22 = objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  else
    v22 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  v23 = (void *)v22;
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v22);

  v36[0] = NSFontAttributeName;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleSubheadline));
  v37[0] = v24;
  v36[1] = NSForegroundColorAttributeName;
  if (v13)
    v25 = objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  else
    v25 = objc_claimAutoreleasedReturnValue(+[UIColor tertiaryLabelColor](UIColor, "tertiaryLabelColor"));
  v26 = (void *)v25;
  v37[1] = v25;
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v37, v36, 2));

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addressStringWithAttributes:", v27));
  -[UILabel setAttributedText:](self->_addressLabel, "setAttributedText:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "distanceAndElevationDescriptionStringWithAttributes:", v27));
  -[MapsThemeMultiPartLabel setMultiPartString:](self->_descriptionLabel, "setMultiPartString:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userProvidedNotes"));
  v31 = objc_msgSend(v30, "length");

  if (v31)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("[Route Creation] Notes Quotes"), CFSTR("localized string not found"), 0));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "userProvidedNotes"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v33, v34));
    -[MapsFadingLabel setText:](self->_notesLabel, "setText:", v35);

  }
  else
  {
    -[MapsFadingLabel setText:](self->_notesLabel, "setText:", 0);
  }
  -[RouteLibraryCell _updateMenu](self, "_updateMenu");

}

- (void)setSnapshotWithRouteData:(id)a3 scale:(double)a4 userInterfaceStyle:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t, void *);
  void *v20;
  RouteLibraryCell *v21;
  id v22;

  v8 = a3;
  v9 = objc_alloc((Class)MURouteSnapshotKey);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "storageID"));
  v11 = objc_msgSend(v9, "initWithIdentifier:width:height:scale:padding:darkMode:", v10, a5 == 2, 64.0, 64.0, a4, 10.0, 10.0, 10.0, 10.0);

  if ((-[MURouteSnapshotKey isEqual:](self->_cacheKey, "isEqual:", v11) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_cacheKey, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MURouteSnapshotManager sharedInstance](MURouteSnapshotManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "checkCacheForKey:", v11));

    -[RouteLibraryCell _setImageForSnapshot:](self, "_setImageForSnapshot:", v13);
    if (!v13)
    {
      v14 = objc_msgSend(objc_alloc((Class)GEORouteBuilder_PersistentData), "initWithPersistentData:", v8);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "buildRoute"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[MURouteSnapshotManager sharedInstance](MURouteSnapshotManager, "sharedInstance"));
      v17 = _NSConcreteStackBlock;
      v18 = 3221225472;
      v19 = sub_1004E517C;
      v20 = &unk_1011B90B8;
      v21 = self;
      v22 = v11;
      objc_msgSend(v16, "getSnapshotForKey:route:completion:", v22, v15, &v17);

    }
  }
  -[RouteLibraryCell _refreshOfflineSubscription](self, "_refreshOfflineSubscription", v17, v18, v19, v20, v21);

}

- (void)_setImageForSnapshot:(id)a3
{
  void *v5;
  double v6;
  double v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell _greyScaleImageIfNeeded:](self, "_greyScaleImageIfNeeded:"));
  -[UIImageView setImage:](self->_snapshotImageView, "setImage:", v5);

  if (a3)
    v6 = 1.0;
  else
    v6 = 0.0;
  if (a3)
    v7 = 0.0;
  else
    v7 = 1.0;
  -[UIImageView setAlpha:](self->_snapshotImageView, "setAlpha:", v6);
  -[UIImageView setAlpha:](self->_placeholderImageView, "setAlpha:", v7);
}

- (id)_greyScaleImageIfNeeded:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  if (-[GEOComposedGeometryRoutePersistentData isAvailableForCurrentCountry](self->_routeData, "isAvailableForCurrentCountry"))
  {
    v5 = v4;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor grayColor](UIColor, "grayColor"));
    v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_maps_colorMonochromeImageWithColor:", v6));

  }
  return v5;
}

- (void)_pressedDelete
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell delegate](self, "delegate"));
  objc_msgSend(v3, "cell:didSelectDeleteRouteData:", self, self->_routeData);

}

- (void)_pressedEdit
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell delegate](self, "delegate"));
  objc_msgSend(v3, "cell:didSelectEditRouteData:", self, self->_routeData);

}

- (void)_pressedDirections
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell delegate](self, "delegate"));
  objc_msgSend(v3, "cell:didSelectDirectionsRouteData:", self, self->_routeData);

}

- (void)_pressedMore
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell delegate](self, "delegate"));
  objc_msgSend(v3, "cell:didSelectViewMoreNotesForRouteData:", self, self->_routeData);

}

- (void)_pressedDownload
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RouteLibraryCell delegate](self, "delegate"));
  objc_msgSend(v3, "cell:didSelectDownloadRouteData:", self, self->_routeData);

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v6;

  if (off_1014ABAB0 == a6)
  {
    -[RouteLibraryCell _updateMenu](self, "_updateMenu", a3, a4, a5);
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)RouteLibraryCell;
    -[RouteLibraryCell observeValueForKeyPath:ofObject:change:context:](&v6, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (void)fadingLabelTruncationChanged:(id)a3
{
  -[UIButton setHidden:](self->_moreButton, "setHidden:", objc_msgSend(a3, "isTruncated") ^ 1);
}

- (void)valueChangedForGEOConfigKey:(id)a3
{
  if (a3.var0 == (_DWORD)MapsConfig_RouteCreationAvailable && a3.var1 == off_1014B55A8)
    -[RouteLibraryCell _updateMenu](self, "_updateMenu");
}

- (GEOComposedGeometryRoutePersistentData)routeData
{
  return self->_routeData;
}

- (RouteLibraryCellDelegate)delegate
{
  return (RouteLibraryCellDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (MapDataSubscriptionInfo)offlineSubscription
{
  return self->_offlineSubscription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offlineSubscription, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_routeData, 0);
  objc_storeStrong((id *)&self->_offlineDownloadConstraints, 0);
  objc_storeStrong((id *)&self->_noOfflineDownloadConstraints, 0);
  objc_storeStrong((id *)&self->_offlineDownloadStateView, 0);
  objc_storeStrong((id *)&self->_downloadAction, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong((id *)&self->_cacheKey, 0);
  objc_storeStrong((id *)&self->_menuButton, 0);
  objc_storeStrong((id *)&self->_moreButtonBottomConstraint, 0);
  objc_storeStrong((id *)&self->_moreButton, 0);
  objc_storeStrong((id *)&self->_notesLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_addressLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_transportTypeContainerView, 0);
  objc_storeStrong((id *)&self->_textContainerView, 0);
  objc_storeStrong((id *)&self->_transportTypeImageView, 0);
  objc_storeStrong((id *)&self->_placeholderImageView, 0);
  objc_storeStrong((id *)&self->_snapshotImageView, 0);
}

@end
