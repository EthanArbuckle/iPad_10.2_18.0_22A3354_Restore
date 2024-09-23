@implementation ExtensionsViewComposer

+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appIconImageView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardIcon"));
  objc_msgSend(v7, "setImage:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardTitle"));
  objc_msgSend(v9, "setText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subtitleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardSubtitle"));
  objc_msgSend(v11, "setText:", v12);

  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardFormattedPriceRange"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardFormattedPriceRangeBadge"));

  objc_msgSend(v6, "setTertiaryText:badge:", v14, v13);
}

+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "disclaimerLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "disclaimerMessage"));
  objc_msgSend(v7, "setText:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "informationLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appleDisclaimer"));
  objc_msgSend(v9, "setText:", v10);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardFareLineItems"));
  objc_msgSend(v6, "setDetailEntries:", v11);

}

+ (void)composeOpenAppView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "openInAppCommandTitle"));
  objc_msgSend(v6, "setOpenAppButtonTitle:", v5);

  objc_msgSend(v6, "setActions:", &__NSArray0__struct);
}

+ (void)composePayView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "paymentMethod"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "subtitle"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "icon"));
  objc_msgSend(v5, "configureForTitle:subtitle:image:", v6, v7, v8);

}

+ (void)composeCustomHeaderView:(id)a3 forRideBookingRequestRideStatus:(id)a4
{
  id v5;
  id v6;
  PlaceholderWaypointRequest *v7;
  void *v8;
  PlaceholderWaypointRequest *v9;
  PlaceholderWaypointRequest *v10;
  void *v11;
  PlaceholderWaypointRequest *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  WaypointPlaceholder *v19;
  void *v20;
  WaypointPlaceholder *v21;
  RoutePlanningWaypointRequest *v22;
  void *v23;
  id v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _QWORD v31[2];

  v24 = a3;
  v5 = a4;
  v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v7 = [PlaceholderWaypointRequest alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "origin"));
  v9 = -[PlaceholderWaypointRequest initWithCLPlacemark:](v7, "initWithCLPlacemark:", v8);
  v31[0] = v9;
  v10 = [PlaceholderWaypointRequest alloc];
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "destination"));
  v12 = -[PlaceholderWaypointRequest initWithCLPlacemark:](v10, "initWithCLPlacemark:", v11);
  v31[1] = v12;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v31, 2));

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
        v19 = [WaypointPlaceholder alloc];
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "waypointName"));
        v21 = -[WaypointPlaceholder initWithName:displayableMarker:](v19, "initWithName:displayableMarker:", v20, 0);

        v22 = -[RoutePlanningWaypointRequest initWithWaypointPlaceholder:request:preferredNameSource:]([RoutePlanningWaypointRequest alloc], "initWithWaypointPlaceholder:request:preferredNameSource:", v21, v18, 0);
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v22));
        objc_msgSend(v6, "addObject:", v23);

      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v15);
  }

  objc_msgSend(v24, "setOverrideWaypoints:", v6);
  objc_msgSend(v24, "updateWaypointsList");

}

+ (void)composeBannerView:(id)a3 forRidesharingCurrentRideViewController:(id)a4 rideBookingRideStatus:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  INGetRideStatusIntent *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_remoteViewController"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "getRideStatusIntentResponse"));
  if (!v11)
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "requestRideIntentResponse"));
  v12 = objc_alloc((Class)INInteraction);
  v13 = objc_opt_new(INGetRideStatusIntent);
  v14 = objc_msgSend(v12, "initWithIntent:response:", v13, v11);

  objc_msgSend(v10, "configureWithInteraction:context:completion:", v14, 1, &stru_1011D9A68);
  if (v10)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentViewController"));

    if (!v15)
    {
      objc_msgSend(v10, "beginAppearanceTransition:animated:", 1, 0);
      objc_msgSend(v8, "addChildViewController:", v10);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "view"));
      objc_msgSend(v7, "setRemoteView:", v16);

      objc_msgSend(v10, "didMoveToParentViewController:", v8);
      objc_msgSend(v10, "endAppearanceTransition");
    }
  }
  else
  {
    v28 = v14;
    v29 = v11;
    v30 = v9;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "childViewControllers"));
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v32 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)i);
          v23 = objc_opt_class(INUIRemoteViewController);
          if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
            v24 = v22;
          else
            v24 = 0;
          v25 = v24;
          if (objc_msgSend(v25, "isViewLoaded"))
          {
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "view"));
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "remoteView"));

            if (v26 == v27)
            {
              objc_msgSend(v25, "beginAppearanceTransition:animated:", 0, 0);
              objc_msgSend(v25, "willMoveToParentViewController:", 0);
              objc_msgSend(v7, "setRemoteView:", 0);
              objc_msgSend(v25, "removeFromParentViewController");
              objc_msgSend(v25, "endAppearanceTransition");

              goto LABEL_20;
            }
          }

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v19)
          continue;
        break;
      }
    }
LABEL_20:

    v9 = v30;
    v14 = v28;
    v11 = v29;
  }

}

+ (void)composeBlankTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "setAppIcon:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primaryLabel"));
  objc_msgSend(v5, "setText:", &stru_1011EB268);

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "secondaryLabel"));
  objc_msgSend(v6, "setText:", &stru_1011EB268);

}

+ (void)composeTemplatedBannerView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templatedViewAppIcon"));
  objc_msgSend(v6, "setAppIcon:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templatedViewTitle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryLabel"));
  objc_msgSend(v9, "setText:", v8);

  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templatedViewSubtitle"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryLabel"));

  objc_msgSend(v10, "setText:", v11);
}

+ (void)composeBannerAttributionView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "attributionLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "bannerAttributionTitle"));

  objc_msgSend(v7, "setText:", v6);
}

+ (void)composeFeedbackView:(id)a3 forRideBookingRideStatus:(id)a4 tippingViewDelegate:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;

  v19 = a3;
  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "tippingOptions"));
  objc_msgSend(v19, "setTippingOptions:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "driverImage"));
  objc_msgSend(v19, "configureHeaderImage:", v10);

  objc_msgSend(v19, "setShowRatingOptions:", objc_msgSend(v7, "shouldShowRatingOptions"));
  objc_msgSend(v19, "configureTippingViewWithDelegate:", v8);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("Ridesharing submit default"), CFSTR("localized string not found"), 0));

  if (objc_msgSend(v7, "shouldShowRatingOptions"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Ridesharing submit rating"), CFSTR("localized string not found"), 0));

    v12 = (void *)v14;
  }
  if (objc_msgSend(v7, "shouldShowTippingOptions"))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("Ridesharing submit tip"), CFSTR("localized string not found"), 0));

    v12 = (void *)v16;
  }
  if (objc_msgSend(v7, "shouldShowRatingOptions")
    && objc_msgSend(v7, "shouldShowTippingOptions"))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Ridesharing submit rating and tip"), CFSTR("localized string not found"), 0));

    v12 = (void *)v18;
  }
  objc_msgSend(v19, "configureSubmitButtonTitle:", v12);

}

+ (void)composePrimaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4 withActionButtons:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v7 = a5;
  v8 = a4;
  v17 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "appIconImageView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardIcon"));
  objc_msgSend(v9, "setImage:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardTitle"));
  objc_msgSend(v11, "setText:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "subtitleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardSubtitle"));
  objc_msgSend(v13, "setText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardTertiaryTitle"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "cardFormattedPriceRangeBadge"));

  objc_msgSend(v17, "setTertiaryText:badge:", v15, v16);
  objc_msgSend(v17, "configureWithActionButtons:", v7);

}

+ (void)composeSecondaryDetailsView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "informationLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardDisclaimer"));
  objc_msgSend(v7, "setText:", v8);

  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardFareLineItems"));
  objc_msgSend(v6, "setDetailEntries:", v9);

}

+ (void)composeOpenAppView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "openInAppCommandTitle"));
  objc_msgSend(v6, "setOpenAppButtonTitle:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cardActions"));
  objc_msgSend(v6, "setActions:", v8);

}

+ (void)composeCustomHeaderView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v5 = a4;
  v6 = a3;
  v14 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "pickupLocation"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v8));

  objc_msgSend(v14, "addObject:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dropoffLocation"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_geoMapItem"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v11));

  objc_msgSend(v14, "addObject:", v12);
  v13 = objc_msgSend(v14, "copy");
  objc_msgSend(v6, "setOverrideWaypoints:", v13);

  objc_msgSend(v6, "updateWaypointsList");
}

+ (void)composeCustomFeedbackHeaderView:(id)a3 forRideBookingRideStatus:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templatedViewTitle"));
  objc_msgSend(v6, "setTitle:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "templatedViewSubtitle"));
  objc_msgSend(v6, "setSubtitle:", v8);

}

@end
