@implementation RouteOverviewCellComposer

+ (void)configureCell:(id)a3 forRoute:(id)a4 isMac:(BOOL)a5 automaticSharingContacts:(id)a6 dataCoordinator:(id)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t (**v14)(void);
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t (**v23)(void);
  uint64_t v24;
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
  id v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  id v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  double v73;
  double v74;
  void *v75;
  double v76;
  double v77;
  void *v78;
  id v79;
  void *v80;
  void *v81;
  id v82;
  void *v83;
  id v84;
  void *v85;
  id v86;
  void *v87;
  void *v88;
  _QWORD v89[4];
  id v90;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = a7;
  v14 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(+[RouteOverviewCell primaryLabelFontProvider](RouteOverviewCell, "primaryLabelFontProvider"));
  v15 = v14[2]();
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[RouteOverviewStringProvider primaryTextForRoute:font:](RouteOverviewStringProvider, "primaryTextForRoute:font:", v11, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryLabel"));
  objc_msgSend(v18, "setAttributedText:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "attributedText"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "string"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryLabel"));
  objc_msgSend(v22, "setAccessibilityIdentifier:", v21);

  v23 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue(+[RouteOverviewCell secondaryLabelFontProvider](RouteOverviewCell, "secondaryLabelFontProvider"));
  v24 = v23[2]();
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[RouteOverviewStringProvider secondaryMultiPartTextForRoute:font:](RouteOverviewStringProvider, "secondaryMultiPartTextForRoute:font:", v11, v25));

  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryLabel"));
  objc_msgSend(v27, "setMultiPartString:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributedString"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "string"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryLabel"));
  objc_msgSend(v30, "setAccessibilityLabel:", v29);

  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "attributedString"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "string"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "secondaryLabel"));
  objc_msgSend(v33, "setAccessibilityIdentifier:", v32);

  objc_msgSend(v10, "setTertiaryLabelVisible:", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[RouteOverviewStringProvider artworkDataForRoute:](RouteOverviewStringProvider, "artworkDataForRoute:", v11));
  v35 = objc_msgSend(v34, "count");
  if (v35)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "artworkList"));
    objc_msgSend(v36, "setArtworkData:", v34);

  }
  objc_msgSend(v10, "setArtworkListVisible:", v35 != 0);
  v37 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "elevationProfile"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "elevationGraphView"));
  objc_msgSend(v11, "distance");
  objc_msgSend(v38, "setElevationProfile:routeLength:", v37);

  v87 = (void *)v37;
  objc_msgSend(v10, "setElevationGraphViewVisible:", v37 != 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "advisories"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAdvisoryViewModel viewModelsForAdvisories:](RouteAdvisoryViewModel, "viewModelsForAdvisories:", v39));

  v41 = objc_msgSend(v12, "count");
  v88 = v34;
  if (v41 && MSPSharedTripSharingAvailable(v41, v42))
  {
    v83 = v26;
    v86 = objc_msgSend(v40, "mutableCopy");
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[GEOFeatureStyleAttributes shareETAAdvisoryStyleAttributes](GEOFeatureStyleAttributes, "shareETAAdvisoryStyleAttributes"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "traitCollection"));
    objc_msgSend(v44, "displayScale");
    v45 = objc_claimAutoreleasedReturnValue(+[MKIconManager imageForStyle:size:forScale:format:](MKIconManager, "imageForStyle:size:forScale:format:", v43, 0, 0));

    v82 = v12;
    v84 = v13;
    v85 = (void *)v45;
    if (objc_msgSend(v12, "count") == (id)1)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "firstObject"));
      v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "contact"));

      v48 = (void *)v47;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[CNContactFormatter stringFromContact:style:](CNContactFormatter, "stringFromContact:style:", v47, 1000));
      if (!v49)
      {
        v79 = objc_alloc((Class)NSAttributedString);
        v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Automatic Sharing Unknown Indication"), CFSTR("localized string not found"), 0));
        v56 = objc_msgSend(v79, "initWithString:", v81);

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "string"));
        v60 = objc_msgSend(v51, "length");
        v58 = 0;
        goto LABEL_10;
      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Automatic Sharing Singular Indication"), CFSTR("localized string not found"), 0));

      v52 = objc_alloc((Class)NSAttributedString);
    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Automatic Sharing Plural Indication, Button Portion"), CFSTR("localized string not found"), 0));

      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v48, objc_msgSend(v12, "count")));
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("[Share ETA] Automatic Sharing Plural Indication, Advisory"), CFSTR("localized string not found"), 0));

      v52 = objc_alloc((Class)NSAttributedString);
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v51, v49));
    v56 = objc_msgSend(v52, "initWithString:", v55);

    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "string"));
    v58 = objc_msgSend(v57, "rangeOfString:", v49);
    v60 = v59;

LABEL_10:
    objc_initWeak(&location, v10);
    v89[0] = _NSConcreteStackBlock;
    v89[1] = 3221225472;
    v89[2] = sub_1005206E4;
    v89[3] = &unk_1011AD260;
    objc_copyWeak(&v90, &location);
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[RouteAdvisoryViewModel viewModelWithText:buttonRange:image:handler:](RouteAdvisoryViewModel, "viewModelWithText:buttonRange:image:handler:", v56, v58, v60, v85, v89));
    objc_msgSend(v86, "addObject:", v61);

    v26 = v83;
    v13 = v84;
    v62 = objc_msgSend(v86, "copy");

    objc_destroyWeak(&v90);
    objc_destroyWeak(&location);

    v40 = v62;
    v12 = v82;
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "advisoriesView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_mapsSceneDelegate"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "appCoordinator"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "baseActionCoordinator"));
  objc_msgSend(v63, "setAdvisories:coordinator:", v40, v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "advisoriesView"));
  objc_msgSend(v10, "setAdvisoriesViewVisible:", objc_msgSend(v67, "isVisible"));

  objc_msgSend(v10, "setPrimaryLabelCompanionImage:", 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "origin"));
  if (objc_msgSend(v68, "isCurrentLocation"))
  {
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration"));
    if ((objc_msgSend(v69, "currentCountrySupportsNavigation") & 1) != 0)
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "timing"));
      if (objc_msgSend(v70, "isDepartNow"))
        v71 = 1;
      else
        v71 = 3;
      objc_msgSend(v10, "setButtonVisibility:", v71);

    }
    else
    {
      objc_msgSend(v10, "setButtonVisibility:", 3);
    }
    v72 = v88;

  }
  else
  {
    objc_msgSend(v10, "setButtonVisibility:", 3);
    v72 = v88;
  }

  +[RouteOverviewCell minimumHeight](RouteOverviewCell, "minimumHeight");
  v74 = v73;
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minimumHeightConstraint"));
  objc_msgSend(v75, "constant");
  v77 = v76;

  if (v77 != v74)
  {
    v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "minimumHeightConstraint"));
    objc_msgSend(v78, "setConstant:", v74);

  }
  objc_msgSend(v10, "setGoButtonProgressVisible:", 0);
  objc_msgSend(v10, "setGoButtonProgress:", 0.0);
  objc_msgSend(v10, "layoutIfNeeded");

}

+ (void)configureCell:(id)a3 forRideBookingRideOption:(id)a4
{
  id v5;
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
  id v22;
  void *v23;
  id v24;
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
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  id v47;

  v47 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "primaryLabel"));
  objc_msgSend(v7, "setText:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "primaryLabel"));
  objc_msgSend(v9, "setAccessibilityLabel:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "name"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "primaryLabel"));
  objc_msgSend(v11, "setAccessibilityIdentifier:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailedDescription"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryLabel"));
  objc_msgSend(v13, "setText:", v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailedDescription"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryLabel"));
  objc_msgSend(v15, "setAccessibilityLabel:", v14);

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "detailedDescription"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "secondaryLabel"));
  objc_msgSend(v17, "setAccessibilityIdentifier:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[RouteOverviewCell tertiaryLabelBoldFont](RouteOverviewCell, "tertiaryLabelBoldFont"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  objc_msgSend(v20, "setTextColor:", v19);

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  objc_msgSend(v21, "setFont:", v18);

  v22 = objc_alloc((Class)NSAttributedString);
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "priceRange"));
  v24 = objc_msgSend(v22, "initWithString:", v23);

  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "specialPricingBadge"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "_maps_attributedStringByAppendingRidesharingSpecialPricingBadge:representativeContentFont:", v25, v18));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  objc_msgSend(v27, "setAttributedText:", v26);

  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "attributedText"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "string"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  objc_msgSend(v31, "setAccessibilityLabel:", v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "attributedText"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "string"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "tertiaryLabel"));
  objc_msgSend(v35, "setAccessibilityIdentifier:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iconImage"));
  objc_msgSend(v47, "setPrimaryLabelCompanionImage:", v36);

  objc_msgSend(v47, "setButtonVisibility:", 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "selectionCommandTitle"));

  objc_msgSend(v47, "setBookButtonTitle:", v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "elevationGraphView"));
  objc_msgSend(v38, "setElevationProfile:routeLength:", 0, 0.0);

  objc_msgSend(v47, "setTertiaryLabelVisible:", 1);
  objc_msgSend(v47, "setArtworkListVisible:", 0);
  objc_msgSend(v47, "setDetailsButtonVisible:", 0);
  objc_msgSend(v47, "setElevationGraphViewVisible:", 0);
  objc_msgSend(v47, "setAdvisoriesViewVisible:", 0);
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "minimumHeightConstraint"));
  objc_msgSend(v39, "constant");
  v41 = v40;
  +[RouteOverviewCell minimumRidesharingHeight](RouteOverviewCell, "minimumRidesharingHeight");
  v43 = vabdd_f64(v41, v42);

  if (v43 > 2.22044605e-16)
  {
    +[RouteOverviewCell minimumRidesharingHeight](RouteOverviewCell, "minimumRidesharingHeight");
    v45 = v44;
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "minimumHeightConstraint"));
    objc_msgSend(v46, "setConstant:", v45);

  }
  objc_msgSend(v47, "setGoButtonProgressVisible:", 0);
  objc_msgSend(v47, "setGoButtonProgress:", 0.0);

}

@end
