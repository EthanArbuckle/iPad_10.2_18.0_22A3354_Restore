@implementation GuidesHomeViewController

- (GuidesHomeViewController)initWithGuideLocation:(id)a3 withTraits:(id)a4
{
  id v7;
  id v8;
  GuidesHomeViewController *v9;
  GuidesHomeViewController *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)GuidesHomeViewController;
  v9 = -[GuidesHomeViewController initWithNibName:bundle:](&v16, "initWithNibName:bundle:", 0, 0);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_guideLocation, a3);
    objc_storeStrong((id *)&v10->_traits, a4);
    v10->_contentOffset = CGPointZero;
    v11 = sub_1002A8AA0(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
    v13 = v12;
    if (v11 == 5)
    {
      objc_msgSend(v12, "setAllowResizeInFloatingStyle:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
      objc_msgSend(v14, "setDefaultContaineeLayout:", 3);
    }
    else
    {
      objc_msgSend(v12, "setPresentedModally:", 1);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](v10, "cardPresentationController"));
      objc_msgSend(v14, "setTakesAvailableHeight:", 1);
    }

  }
  return v10;
}

- (void)handleDismissAction:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  -[GuidesHomeViewController dismissGuidesHome](self, "dismissGuidesHome");
  v5.receiver = self;
  v5.super_class = (Class)GuidesHomeViewController;
  -[ContaineeViewController handleDismissAction:](&v5, "handleDismissAction:", v4);

}

- (void)viewDidLoad
{
  GuidesHomeAPIController *v3;
  void *v4;
  void *v5;
  GuidesHomeAPIController *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id location;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GuidesHomeViewController;
  -[ContaineeViewController viewDidLoad](&v12, "viewDidLoad");
  objc_initWeak(&location, self);
  v3 = [GuidesHomeAPIController alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController guideLocation](self, "guideLocation"));
  objc_copyWeak(&v10, &location);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController traits](self, "traits", _NSConcreteStackBlock, 3221225472, sub_100569394, &unk_1011B9C58));
  v6 = -[GuidesHomeAPIController initWithGuideLocation:onStateChangeHandler:traits:](v3, "initWithGuideLocation:onStateChangeHandler:traits:", v4, &v9, v5);
  -[GuidesHomeViewController setApiController:](self, "setApiController:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
  objc_msgSend(v7, "fetchGuidesHomeViewFilteredBy:onCompletion:", 0, &stru_1011BB540);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("GuidesHomeView"));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)setGuideLocation:(id)a3
{
  GEOGuideLocation *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v5 = (GEOGuideLocation *)a3;
  if (self->_guideLocation != v5)
  {
    objc_storeStrong((id *)&self->_guideLocation, a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    objc_msgSend(v6, "refreshWithGuideLocation:", self->_guideLocation);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
    objc_msgSend(v7, "refreshedGuideLocation");

    objc_initWeak(&location, self);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100569568;
    v10[3] = &unk_1011AD260;
    objc_copyWeak(&v11, &location);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1005695E4;
    v8[3] = &unk_1011AD4F0;
    objc_copyWeak(&v9, &location);
    +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", 0x10000, v10, 0, v8, 0.2, 0.0);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

- (void)didChangeLayout:(unint64_t)a3
{
  uint64_t v5;
  void *v6;
  unint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GuidesHomeViewController;
  -[ContaineeViewController didChangeLayout:](&v8, "didChangeLayout:");
  v5 = objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = -[GuidesHomeViewController containeeLayout](self, "containeeLayout");

    if (v7 != a3)
    {
      -[GuidesHomeViewController setContaineeLayout:](self, "setContaineeLayout:", a3);
      -[GuidesHomeViewController resetCollectionViewLayout](self, "resetCollectionViewLayout");
    }
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  uint64_t v5;
  double result;
  objc_super v7;

  v5 = sub_1002A8AA0(self);
  if (a3 != 1 || (result = -1.0, v5 != 5))
  {
    v7.receiver = self;
    v7.super_class = (Class)GuidesHomeViewController;
    -[ContaineeViewController heightForLayout:](&v7, "heightForLayout:", a3);
  }
  return result;
}

- (void)onTransitionFromState:(int64_t)a3 toState:(int64_t)a4
{
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  uint8_t v24[16];
  uint8_t buf[16];

  v7 = sub_1005699DC();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_signpost_id_generate(v8);

  v10 = sub_1005699DC();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "DisplayingGuideHomeView", ", buf, 2u);
  }

  switch(a3)
  {
    case 0:
      if (a4 == 1)
        goto LABEL_14;
      goto LABEL_20;
    case 1:
      if (a4 == 3)
      {
        -[GuidesHomeViewController removeLoadingView](self, "removeLoadingView");
        -[GuidesHomeViewController removeCollectionView](self, "removeCollectionView");
        -[GuidesHomeViewController addErrorView](self, "addErrorView");
      }
      else if (a4 == 2)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
        v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "guideHomeSingleCollectionIdentifier"));

        if (v14)
        {
          -[GuidesHomeViewController routeToSingleCuratedCollection:](self, "routeToSingleCuratedCollection:", v14);
          goto LABEL_23;
        }
        -[GuidesHomeViewController removeLoadingView](self, "removeLoadingView");
        -[GuidesHomeViewController removeDefaultHeaderView](self, "removeDefaultHeaderView");
        -[GuidesHomeViewController setupCitySelectionUI](self, "setupCitySelectionUI");
        -[GuidesHomeViewController addGuidesHomeCollectionsView](self, "addGuidesHomeCollectionsView");
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
        -[GuidesHomeViewController activateConstraintsForViewAligningHeader:](self, "activateConstraintsForViewAligningHeader:", v19);

        -[GuidesHomeViewController setupCitySelectionUIGradientView](self, "setupCitySelectionUIGradientView");
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        objc_msgSend(v20, "bringSubviewToFront:", v21);

      }
LABEL_20:
      v22 = sub_1005699DC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      v14 = v23;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
      {
        *(_WORD *)v24 = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_END, v9, "DisplayingGuideHomeView", ", v24, 2u);
      }
LABEL_23:

      return;
    case 2:
      if (a4 != 1)
        goto LABEL_20;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
      v16 = objc_msgSend(v15, "isFilteredGuidesHome");

      if ((v16 & 1) != 0)
        goto LABEL_20;
      -[GuidesHomeViewController removeCollectionView](self, "removeCollectionView");
      -[GuidesHomeViewController removeCitySelectionUI](self, "removeCitySelectionUI");
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
      objc_msgSend(v17, "addSubview:", v18);

      -[GuidesHomeViewController resetDefaultHeaderConstraints](self, "resetDefaultHeaderConstraints");
LABEL_14:
      -[GuidesHomeViewController addDefaultHeaderView](self, "addDefaultHeaderView");
      -[GuidesHomeViewController activateHeaderConstraints](self, "activateHeaderConstraints");
      goto LABEL_17;
    case 3:
      if (a4 != 1)
        goto LABEL_20;
      -[GuidesHomeViewController removeErrorView](self, "removeErrorView");
LABEL_17:
      -[GuidesHomeViewController addLoadingView](self, "addLoadingView");
      goto LABEL_20;
    default:
      goto LABEL_20;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)GuidesHomeViewController;
  -[GuidesHomeViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController cardPresentationController](self, "cardPresentationController"));
  objc_msgSend(v4, "cardHeight");
  -[GuidesHomeViewController setActualCardHeight:](self, "setActualCardHeight:");

}

- (void)setupCitySelectionUI
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
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
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
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
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
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
  _QWORD v201[5];
  _QWORD v202[36];
  NSAttributedStringKey v203;
  void *v204;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));

  if (!v3)
  {
    v4 = objc_alloc_init((Class)UIView);
    -[GuidesHomeViewController setCitySelectionView:](self, "setCitySelectionView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v7 = objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend((id)v7, "setBackgroundColor:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v8, "setUserInteractionEnabled:", 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v9, "setAccessibilityIdentifier:", CFSTR("GuidesHomeCitySelectionView"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    LOBYTE(v7) = objc_msgSend(v10, "isCuratedGuidesHome");

    if ((v7 & 1) == 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
      v12 = objc_msgSend(v11, "_maps_addHairlineAtBottomWithLeadingMargin:trailingMargin:", 16.0, 0.0);

    }
    v13 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("TitleLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont system17Bold](UIFont, "system17Bold"));
    objc_msgSend(v13, "setFont:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    if ((objc_msgSend(v15, "isCuratedGuidesHome") & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "colorWithAlphaComponent:", 0.8));
      objc_msgSend(v13, "setTextColor:", v17);

    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v13, "setTextColor:", v16);
    }

    objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v13, "setNumberOfLines:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("[Guide Home View] Guide Home"), CFSTR("localized string not found"), 0));
    objc_msgSend(v13, "setText:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v20, "addSubview:", v13);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIButtonConfiguration plainButtonConfiguration](UIButtonConfiguration, "plainButtonConfiguration"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "background"));
    objc_msgSend(v23, "setBackgroundColor:", v22);

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "background"));
    objc_msgSend(v24, "setCornerRadius:", 0.0);

    objc_msgSend(v21, "setContentInsets:", 0.0, 0.0, 0.0, 0.0);
    v201[0] = _NSConcreteStackBlock;
    v201[1] = 3221225472;
    v201[2] = sub_10056B0E8;
    v201[3] = &unk_1011AFCC0;
    v201[4] = self;
    objc_msgSend(v21, "setTitleTextAttributesTransformer:", v201);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "guideLocationName"));

    if (v26)
      objc_msgSend(v21, "setTitle:", v26);
    v196 = (void *)v26;
    v197 = v21;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithConfiguration:primaryAction:](UIButton, "buttonWithConfiguration:primaryAction:", v21, 0));
    -[GuidesHomeViewController setCitySelectorButton:](self, "setCitySelectorButton:", v27);

    v28 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    objc_msgSend(v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v29 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    objc_msgSend(v29, "setAccessibilityIdentifier:", CFSTR("CitySelectorButton"));

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    v31 = objc_msgSend(v30, "isCuratedGuidesHome");

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v33 = v32;
    v200 = v13;
    if (v31)
      objc_msgSend(v32, "addTarget:action:forControlEvents:", self, "didTapCitySelectorButton:", 64);
    else
      objc_msgSend(v32, "setUserInteractionEnabled:", 0);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    objc_msgSend(v34, "addSubview:", v35);

    v36 = objc_alloc_init((Class)UIView);
    objc_msgSend(v36, "setAccessibilityIdentifier:", CFSTR("ChevronView"));
    objc_msgSend(v36, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    objc_msgSend(v36, "setBackgroundColor:", v37);

    objc_msgSend(v36, "setUserInteractionEnabled:", 1);
    v195 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
    v38 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v195);
    objc_msgSend(v38, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v199 = v38;
    objc_msgSend(v36, "addSubview:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    objc_msgSend(v39, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 15.0));
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.down"), v40));

    v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "imageWithRenderingMode:", 2));
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v39, "setTintColor:", v43);

    v194 = (void *)v42;
    objc_msgSend(v39, "setImage:forState:", v42, 0);
    objc_msgSend(v39, "addTarget:action:forControlEvents:", self, "didTapCitySelectorButton:", 64);
    v198 = v39;
    objc_msgSend(v36, "addSubview:", v39);
    objc_msgSend(v36, "_setContinuousCornerRadius:", 12.0);
    objc_msgSend(v36, "setClipsToBounds:", 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v45 = v36;
    objc_msgSend(v44, "addSubview:", v36);

    v46 = objc_alloc_init((Class)UIView);
    objc_msgSend(v46, "setAccessibilityIdentifier:", CFSTR("CloseButton"));
    objc_msgSend(v46, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v46, "setUserInteractionEnabled:", 1);
    v47 = objc_alloc((Class)UIVisualEffectView);
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
    v49 = objc_msgSend(v47, "initWithEffect:", v48);

    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v46, "addSubview:", v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    LODWORD(v48) = objc_msgSend(v50, "isCuratedGuidesHome");

    if ((_DWORD)v48)
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
    }
    else
    {
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 7));
      objc_msgSend(v49, "setHidden:", 1);
    }
    objc_msgSend(v51, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v52 = v51;
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 7, 15.0));
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("xmark"), v53));

    v193 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "imageWithRenderingMode:", 2));
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v52, "setTintColor:", v55);

    objc_msgSend(v52, "setImage:forState:", v193, 0);
    objc_msgSend(v52, "addTarget:action:forControlEvents:", self, "closeButtonTaped:", 64);
    objc_msgSend(v46, "_setContinuousCornerRadius:", 15.0);
    objc_msgSend(v46, "setClipsToBounds:", 1);
    objc_msgSend(v46, "addSubview:", v52);
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v56, "addSubview:", v46);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v57, "addSubview:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "text"));
    v203 = NSFontAttributeName;
    v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "font"));
    v204 = v60;
    v61 = v46;
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v204, &v203, 1));
    objc_msgSend(v59, "sizeWithAttributes:", v62);
    v64 = v63;

    v192 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "heightAnchor"));
    v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v192, "constraintEqualToConstant:", 24.0));
    v202[0] = v191;
    v190 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "widthAnchor"));
    v189 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v190, "constraintEqualToConstant:", 24.0));
    v202[1] = v189;
    v188 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "topAnchor"));
    v187 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
    v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v188, "constraintEqualToAnchor:", v187));
    v202[2] = v186;
    v185 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "leadingAnchor"));
    v184 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v183 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v185, "constraintEqualToAnchor:", v184));
    v202[3] = v183;
    v182 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "trailingAnchor"));
    v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "trailingAnchor"));
    v180 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v182, "constraintEqualToAnchor:", v181));
    v202[4] = v180;
    v179 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "bottomAnchor"));
    v178 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
    v177 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v179, "constraintEqualToAnchor:", v178));
    v202[5] = v177;
    v176 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "topAnchor"));
    v175 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "topAnchor"));
    v174 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v176, "constraintEqualToAnchor:constant:", v175, 2.0));
    v202[6] = v174;
    v173 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "leadingAnchor"));
    v172 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "leadingAnchor"));
    v171 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v173, "constraintEqualToAnchor:constant:", v172, 0.5));
    v202[7] = v171;
    v170 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "trailingAnchor"));
    v169 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "trailingAnchor"));
    v168 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v170, "constraintEqualToAnchor:", v169));
    v202[8] = v168;
    v166 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v198, "bottomAnchor"));
    v165 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "bottomAnchor"));
    v164 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v166, "constraintEqualToAnchor:", v165));
    v202[9] = v164;
    v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v163 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v163, "topAnchor"));
    v160 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v162, "constraintEqualToAnchor:constant:", v161, 16.0));
    v202[10] = v160;
    v167 = v61;
    v157 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
    v158 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v156 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v158, "trailingAnchor"));
    v155 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v157, "constraintEqualToAnchor:constant:", v156, -16.0));
    v202[11] = v155;
    v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "heightAnchor"));
    v153 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v154, "constraintEqualToConstant:", 30.0));
    v202[12] = v153;
    v152 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
    v151 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v152, "constraintEqualToConstant:", 30.0));
    v202[13] = v151;
    v150 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v149 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "topAnchor"));
    v148 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v150, "constraintEqualToAnchor:", v149));
    v202[14] = v148;
    v147 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
    v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
    v145 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v147, "constraintEqualToAnchor:", v146));
    v202[15] = v145;
    v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
    v143 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "trailingAnchor"));
    v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v144, "constraintEqualToAnchor:", v143));
    v202[16] = v142;
    v141 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
    v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "bottomAnchor"));
    v139 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "constraintEqualToAnchor:", v140));
    v202[17] = v139;
    v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "topAnchor"));
    v137 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "topAnchor"));
    v136 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v137));
    v202[18] = v136;
    v134 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "leadingAnchor"));
    v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "leadingAnchor"));
    v132 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v134, "constraintEqualToAnchor:", v133));
    v202[19] = v132;
    v159 = v52;
    v131 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "trailingAnchor"));
    v130 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "trailingAnchor"));
    v129 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "constraintEqualToAnchor:", v130));
    v202[20] = v129;
    v128 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "bottomAnchor"));
    v127 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
    v126 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v128, "constraintEqualToAnchor:", v127));
    v202[21] = v126;
    v123 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "leadingAnchor"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v122 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "leadingAnchor"));
    v121 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v123, "constraintEqualToAnchor:constant:", v122, 16.0));
    v202[22] = v121;
    v119 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "trailingAnchor"));
    v120 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v120, "trailingAnchor"));
    v117 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "constraintEqualToAnchor:", v118));
    v202[23] = v117;
    v115 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "topAnchor"));
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v116, "topAnchor"));
    v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v115, "constraintEqualToAnchor:constant:", v114, 26.0));
    v202[24] = v113;
    v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "heightAnchor"));
    v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "constraintEqualToConstant:", v64));
    v202[25] = v111;
    v110 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v110, "leadingAnchor"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "leadingAnchor"));
    v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v109, "constraintEqualToAnchor:", v108));
    v202[26] = v107;
    v106 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "trailingAnchor"));
    v105 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "trailingAnchor"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v104, "constraintLessThanOrEqualToAnchor:constant:", v103, -16.0));
    v202[27] = v102;
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "topAnchor"));
    v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v200, "bottomAnchor"));
    v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v100, "constraintEqualToAnchor:", v99));
    v202[28] = v98;
    v135 = v45;
    v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "leadingAnchor"));
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "trailingAnchor"));
    v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "constraintEqualToAnchor:constant:", v95, 8.0));
    v202[29] = v94;
    v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "centerYAnchor"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "centerYAnchor"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "constraintEqualToAnchor:", v91));
    v202[30] = v90;
    v89 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "topAnchor"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "constraintEqualToAnchor:", v86));
    v202[31] = v85;
    v84 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "leadingAnchor"));
    v83 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "leadingAnchor"));
    v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "constraintEqualToAnchor:", v81));
    v202[32] = v80;
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "trailingAnchor"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "trailingAnchor"));
    v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:", v76));
    v202[33] = v75;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "heightAnchor"));
    +[GuideHomeHeaderView minimumRequiredHeight](GuideHomeHeaderView, "minimumRequiredHeight");
    v125 = v49;
    v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintGreaterThanOrEqualToConstant:"));
    v202[34] = v67;
    v68 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "bottomAnchor"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectorButton](self, "citySelectorButton"));
    v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "bottomAnchor"));
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToAnchor:constant:", v71, 15.0));
    v202[35] = v72;
    v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v202, 36));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v73);

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    objc_msgSend(v135, "setHidden:", objc_msgSend(v74, "isCuratedGuidesHome") ^ 1);

  }
}

- (void)setupCitySelectionUIGradientView
{
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
  id v31;
  id v32;
  _QWORD v33[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));

  if (v3)
  {
    v31 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    if ((objc_msgSend(v31, "isCuratedGuidesHome") & 1) != 0)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));

      if (!v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController backgroundViewForCitySelector](self, "backgroundViewForCitySelector"));
        -[GuidesHomeViewController setCitySelectionBackgroundView:](self, "setCitySelectionBackgroundView:", v5);

        v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        objc_msgSend(v6, "setAlpha:", 0.0);

        v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        objc_msgSend(v7, "addSubview:", v8);

        v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        objc_msgSend(v9, "sendSubviewToBack:", v10);

        v32 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "topAnchor"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v28));
        v33[0] = v27;
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "leadingAnchor"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "leadingAnchor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v23));
        v33[1] = v22;
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "trailingAnchor"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "trailingAnchor"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
        v33[2] = v14;
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "bottomAnchor"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "bottomAnchor"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v18));
        v33[3] = v19;
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 4));
        +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v20);

      }
    }
    else
    {

    }
  }
}

- (id)backgroundViewForCitySelector
{
  GradientView *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = -[GradientView initWithFrame:]([GradientView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[GradientView setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "featuredGuideViewModel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "backgroundColor"));
  -[GradientView setBackgroundColor:](v3, "setBackgroundColor:", v6);

  -[GradientView setAlpha:](v3, "setAlpha:", 0.0);
  return v3;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  objc_super v26;
  objc_super v27;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
  v6 = objc_msgSend(v5, "isCuratedGuidesHome");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
    if (objc_msgSend(v7, "currentState") == (id)1)
    {
LABEL_13:

      goto LABEL_14;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController layout](self, "layout"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionViewLayout"));

    if (v8 == v10)
    {
      objc_msgSend(v4, "contentOffset");
      -[GuidesHomeViewController setContentOffset:](self, "setContentOffset:");
      objc_msgSend(v4, "contentOffset");
      v12 = v11;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "featuredGuideViewModel"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionLongTitle"));
      v15 = v14;
      if (!v14)
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionTitle"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
      objc_msgSend(v16, "frame");
      +[GuideHomeHeaderView maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:](GuideHomeHeaderView, "maximumRequiredHeightWithFeaturedGuideTitle:maxWidth:", v15, v17);
      v19 = v18;
      +[GuideHomeHeaderView minimumRequiredHeight](GuideHomeHeaderView, "minimumRequiredHeight");
      v21 = v20;

      if (!v14)
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionBackgroundView](self, "citySelectionBackgroundView"));
      v23 = v22;
      if (v12 >= 420.0)
        v24 = fmin(fmax(v12 / (v19 - v21), 0.0), 1.0);
      else
        v24 = 0.0;
      objc_msgSend(v22, "setAlpha:", v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
      objc_msgSend(v25, "didChangeContentYOffset:", v12);

      v26.receiver = self;
      v26.super_class = (Class)GuidesHomeViewController;
      -[ContaineeViewController scrollViewDidScroll:](&v26, "scrollViewDidScroll:", v4);
      goto LABEL_13;
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)GuidesHomeViewController;
    -[ContaineeViewController scrollViewDidScroll:](&v27, "scrollViewDidScroll:", v4);
  }
LABEL_14:

}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  void *v7;
  objc_super v8;

  y = a4.y;
  v8.receiver = self;
  v8.super_class = (Class)GuidesHomeViewController;
  -[ContaineeViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v8, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", a3, a5, a4.x);
  if (y >= 0.0)
  {
    if (y <= 0.0)
      return;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
    objc_msgSend(v7, "guidesHomeScrolledDown");
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
    objc_msgSend(v7, "guidesHomeScrolledUp");
  }

}

- (void)initializeDataSource
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GuidesHomeAnalyticsManager *v8;
  GuidesHomeAnalyticsManager *v9;
  GuidesHomeDataSource *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GuidesHomeDataSource *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController guideLocation](self, "guideLocation"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "guideLocationIdentifier"));
      v8 = (GuidesHomeAnalyticsManager *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
      objc_msgSend(v5, "updateAnalyticsManagerWithGuideLocationId:isCuratedGuidesHome:", v7, -[GuidesHomeAnalyticsManager isCuratedGuidesHome](v8, "isCuratedGuidesHome"));
    }
    else
    {
      v9 = [GuidesHomeAnalyticsManager alloc];
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController guideLocation](self, "guideLocation"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "guideLocationIdentifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
      v8 = -[GuidesHomeAnalyticsManager initWithGuideLocationId:isCuratedGuidesHome:](v9, "initWithGuideLocationId:isCuratedGuidesHome:", v6, objc_msgSend(v7, "isCuratedGuidesHome"));
      -[GuidesHomeViewController setAnalyticsManager:](self, "setAnalyticsManager:", v8);
    }

    v10 = [GuidesHomeDataSource alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "guideHomeViewResult"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
    v16 = -[GuidesHomeDataSource initWithCollectionView:result:routingDelegate:apiController:analyticsManager:](v10, "initWithCollectionView:result:routingDelegate:apiController:analyticsManager:", v11, v13, self, v14, v15);
    -[GuidesHomeViewController setDataSource:](self, "setDataSource:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
    objc_msgSend(v17, "setDelegate:", self);

    v18 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
    objc_msgSend(v18, "guidesHomeRevealed");

  }
}

- (void)addDefaultHeaderView
{
  void *v3;
  ContainerHeaderView *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  id v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));

  if (!v3)
  {
    v4 = -[ContainerHeaderView initWithCardButtonType:cardButtonBlurred:]([ContainerHeaderView alloc], "initWithCardButtonType:cardButtonBlurred:", 0, 0);
    -[GuidesHomeViewController setTitleHeaderView:](self, "setTitleHeaderView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    v6 = sub_1002A8AA0(v5);

    if (v6 == 5)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle3, 1024));
      objc_msgSend(v7, "setCustomTitleFont:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_headerTapGesture"));
    objc_msgSend(v10, "setCancelsTouchesInView:", 0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setContentCompressionResistancePriority:forAxis:", 1, v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v14, "setDelegate:", self);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v15, "setHairLineAlpha:", 0.0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v17, "setBackgroundColor:", v16);

    v18 = sub_1002A8AA0(self) != 5;
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v19, "setHeaderSize:", v18);

    v21 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
    objc_msgSend(v21, "addSubview:", v20);

  }
}

- (void)removeDefaultHeaderView
{
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
  _QWORD v25[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  objc_msgSend(v3, "removeFromSuperview");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v25[0] = v20;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v16));
  v25[1] = v15;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "trailingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAnchor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));
  v25[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bottomAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bottomAnchor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:", v11));
  v25[3] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)activateHeaderConstraints
{
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
  _QWORD v24[4];

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "topAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
  v24[0] = v19;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "leadingAnchor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "constraintEqualToAnchor:", v15));
  v24[1] = v14;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "trailingAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v24[2] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController titleHeaderView](self, "titleHeaderView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "bottomAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
  v24[3] = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v12);

}

- (void)resetDefaultHeaderConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
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
  _QWORD v28[5];

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v24));
  v28[0] = v23;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "leadingAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v19));
  v28[1] = v18;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "trailingAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v14));
  v28[2] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController view](self, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintLessThanOrEqualToAnchor:", v7));
  v28[3] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController headerView](self, "headerView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  LODWORD(v11) = 1148846080;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:priority:", 60.0, v11));
  v28[4] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 5));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v13);

}

- (void)addGuidesHomeCollectionsView
{
  void *v3;
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id location;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));

  if (!v3)
  {
    v4 = objc_alloc((Class)UICollectionView);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v5, "frame");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = objc_alloc_init((Class)UICollectionViewLayout);
    v15 = objc_msgSend(v4, "initWithFrame:collectionViewLayout:", v14, v7, v9, v11, v13);
    -[GuidesHomeViewController setCollectionView:](self, "setCollectionView:", v15);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    objc_msgSend(v18, "setBackgroundColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    objc_msgSend(v19, "addSubview:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    objc_msgSend(v22, "frame");
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v23));
    objc_msgSend(v21, "setCollectionViewLayout:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    objc_msgSend(v25, "setAlpha:", 0.0);

  }
  -[GuidesHomeViewController initializeDataSource](self, "initializeDataSource");
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController dataSource](self, "dataSource"));
  objc_msgSend(v26, "displayGuidesHomeByReloadingData");

  objc_initWeak(&location, self);
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10056C728;
  v27[3] = &unk_1011AD260;
  objc_copyWeak(&v28, &location);
  +[UIView _animateWithDuration:delay:options:animations:start:completion:](UIView, "_animateWithDuration:delay:options:animations:start:completion:", 0x10000, v27, 0, 0, 0.2, 0.0);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&location);
}

- (void)removeCollectionView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[GuidesHomeViewController setCollectionView:](self, "setCollectionView:", 0);
    -[GuidesHomeViewController setDataSource:](self, "setDataSource:", 0);
  }
}

- (void)removeCitySelectionUI
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[GuidesHomeViewController setCitySelectionView:](self, "setCitySelectionView:", 0);
    -[GuidesHomeViewController setCitySelectionBackgroundView:](self, "setCitySelectionBackgroundView:", 0);
    -[GuidesHomeViewController setCitySelectorButton:](self, "setCitySelectorButton:", 0);
  }
}

- (id)createLayoutUsingWidth:(double)a3
{
  GuideHomeCompositionalLayout *v5;
  void *v6;
  GuideHomeCompositionalLayout *v7;
  uint64_t v9;
  id v10[2];
  id location;

  objc_initWeak(&location, self);
  v5 = [GuideHomeCompositionalLayout alloc];
  objc_copyWeak(v10, &location);
  v10[1] = *(id *)&a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController", _NSConcreteStackBlock, 3221225472, sub_10056C958, &unk_1011BB588, self));
  v7 = -[GuideHomeCompositionalLayout initWithSectionProvider:dataProvider:](v5, "initWithSectionProvider:dataProvider:", &v9, v6);

  -[GuidesHomeViewController setLayout:](self, "setLayout:", v7);
  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
  return v7;
}

- (void)activateConstraintsForViewPinnedBelowHeader:(id)a3 headerView:(id)a4
{
  id v6;
  id v7;
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
  _QWORD v24[4];

  v6 = a4;
  v7 = a3;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
  v24[0] = v20;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v8));
  v24[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bottomAnchor"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v11));
  v24[2] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bottomAnchor"));

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));
  v24[3] = v16;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v24, 4));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)activateConstraintsForViewAligningHeader:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
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
  id v23;
  id v24;
  _QWORD v25[4];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
  v6 = objc_msgSend(v5, "isCuratedGuidesHome");

  if (v6)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leadingAnchor"));
    v23 = (id)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "leadingAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "constraintEqualToAnchor:", v21));
    v25[0] = v20;
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "trailingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v17));
    v25[1] = v7;
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topAnchor"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));
    v25[2] = v11;
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bottomAnchor"));

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "bottomAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:", v14));
    v25[3] = v15;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v25, 4));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);

  }
  else
  {
    v24 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController citySelectionView](self, "citySelectionView"));
    -[GuidesHomeViewController activateConstraintsForViewPinnedBelowHeader:headerView:](self, "activateConstraintsForViewPinnedBelowHeader:headerView:", v4);

  }
}

- (void)resetCollectionViewLayout
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "collectionViewLayout"));
  objc_msgSend(v4, "invalidateLayout");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ContaineeViewController contentView](self, "contentView"));
  objc_msgSend(v6, "frame");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController createLayoutUsingWidth:](self, "createLayoutUsingWidth:", v7));
  objc_msgSend(v5, "setCollectionViewLayout:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController collectionView](self, "collectionView"));
  -[GuidesHomeViewController contentOffset](self, "contentOffset");
  objc_msgSend(v9, "setContentOffset:");

}

- (void)addLoadingView
{
  dispatch_time_t v3;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = dispatch_time(0, 200000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10056D268;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)removeLoadingView
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController loadingView](self, "loadingView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController loadingView](self, "loadingView"));
    objc_msgSend(v4, "removeFromSuperview");

    -[GuidesHomeViewController setLoadingView:](self, "setLoadingView:", 0);
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  _QWORD v8[5];
  _QWORD v9[5];
  objc_super v10;

  height = a3.height;
  width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)GuidesHomeViewController;
  v7 = a4;
  -[ContaineeViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8[4] = self;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10056D500;
  v9[3] = &unk_1011AEDC8;
  v9[4] = self;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10056D508;
  v8[3] = &unk_1011AEDC8;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v9, v8);

}

- (void)routeToSingleCuratedCollection:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "containerViewController"));
  objc_msgSend(v6, "removeControllerFromStack:", self);

  v7 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v7, "viewController:showCuratedCollectionIdentifier:", self, v4);

}

- (void)dismissGuidesHome
{
  void *v3;
  id v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController apiController](self, "apiController"));
  objc_msgSend(v3, "cancelFetchingGuideHome");

  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
  objc_msgSend(v4, "guidesHomeClosed");

}

- (void)routeToCuratedCollection:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

}

- (void)routeToGuideLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showGuidesHome:", self, v4);

}

- (void)routeToPublisher:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewControllerShowPublisher:", v4);

}

- (void)routeToCitySelector
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController guideLocation](self, "guideLocation"));
  objc_msgSend(v4, "viewControllerShowCitySelectorFromGuideLocation:", v3);

}

- (void)didTapCitySelectorButton:(id)a3
{
  id v4;

  -[GuidesHomeViewController routeToCitySelector](self, "routeToCitySelector", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
  objc_msgSend(v4, "guidesHomeCitySelectorTapped");

}

- (void)didSelectGuide:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ControlContaineeViewController delegate](self, "delegate"));
  objc_msgSend(v5, "viewController:showCuratedCollection:", self, v4);

  v11 = (id)objc_claimAutoreleasedReturnValue(-[GuidesHomeViewController analyticsManager](self, "analyticsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "publisher"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[CuratedCollectionSyncManager sharedManager](CuratedCollectionSyncManager, "sharedManager"));
  v10 = objc_msgSend(v9, "collectionIsSaved:", v4);

  objc_msgSend(v11, "guidesHomeTappedFeaturedGuide:publisherId:isCurrentlySaved:", v6, v8, v10);
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (void)setTraits:(id)a3
{
  objc_storeStrong((id *)&self->_traits, a3);
}

- (GEOGuideLocation)guideLocation
{
  return self->_guideLocation;
}

- (double)actualCardHeight
{
  return self->_actualCardHeight;
}

- (void)setActualCardHeight:(double)a3
{
  self->_actualCardHeight = a3;
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (GuidesHomeDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (GuidesHomeAPIController)apiController
{
  return self->_apiController;
}

- (void)setApiController:(id)a3
{
  objc_storeStrong((id *)&self->_apiController, a3);
}

- (ContainerHeaderView)titleHeaderView
{
  return self->_titleHeaderView;
}

- (void)setTitleHeaderView:(id)a3
{
  objc_storeStrong((id *)&self->_titleHeaderView, a3);
}

- (GuideHomeCompositionalLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  objc_storeStrong((id *)&self->_layout, a3);
}

- (LoadingModeView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (ErrorModeView)errorView
{
  return self->_errorView;
}

- (void)setErrorView:(id)a3
{
  objc_storeStrong((id *)&self->_errorView, a3);
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (void)setContaineeLayout:(unint64_t)a3
{
  self->_containeeLayout = a3;
}

- (GuidesHomeAnalyticsManager)analyticsManager
{
  return self->_analyticsManager;
}

- (void)setAnalyticsManager:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsManager, a3);
}

- (CGPoint)contentOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentOffset.x;
  y = self->_contentOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (UIView)citySelectionView
{
  return self->_citySelectionView;
}

- (void)setCitySelectionView:(id)a3
{
  objc_storeStrong((id *)&self->_citySelectionView, a3);
}

- (UIButton)citySelectorButton
{
  return self->_citySelectorButton;
}

- (void)setCitySelectorButton:(id)a3
{
  objc_storeStrong((id *)&self->_citySelectorButton, a3);
}

- (GradientView)citySelectionBackgroundView
{
  return self->_citySelectionBackgroundView;
}

- (void)setCitySelectionBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_citySelectionBackgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_citySelectionBackgroundView, 0);
  objc_storeStrong((id *)&self->_citySelectorButton, 0);
  objc_storeStrong((id *)&self->_citySelectionView, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_errorView, 0);
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_layout, 0);
  objc_storeStrong((id *)&self->_titleHeaderView, 0);
  objc_storeStrong((id *)&self->_apiController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_guideLocation, 0);
  objc_storeStrong((id *)&self->_traits, 0);
}

@end
