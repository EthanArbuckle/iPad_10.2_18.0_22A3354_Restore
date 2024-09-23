@implementation NavTrafficIncidentViewComposer

+ (void)configureHeaderView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  id v36;
  id v37;
  NSObject *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  id v49;
  NSObject *v50;
  void *v51;
  double v52;
  id v53;
  int v54;
  id v55;
  __int16 v56;
  id v57;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertTitles"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primaryLabel"));
  objc_msgSend(v10, "setText:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertDescriptions"));
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "alertDescriptions"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryLabel"));
    objc_msgSend(v15, "setText:", v14);

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "secondaryLabel"));
    objc_msgSend(v13, "setText:", 0);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artwork"));
  if (v16)
  {
    v17 = sub_1005808F8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artwork"));
      v54 = 134349314;
      v55 = a1;
      v56 = 2112;
      v57 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using artwork %@", (uint8_t *)&v54, 0x16u);

    }
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "artwork"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "traitCollection"));
    v22 = ImageForArtwork(v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    objc_msgSend(v6, "setImageSource:", v23);

    goto LABEL_28;
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incident"));

  if (!v24)
  {
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "originalRoute"));
    if (objc_msgSend(v35, "isEVRoute"))
    {
      v36 = objc_msgSend(v7, "alertType");

      if (v36 != (id)6)
      {
        v37 = sub_1005808F8();
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          v54 = 134349056;
          v55 = a1;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using VKTrafficIncidentTypeBatteryReroute", (uint8_t *)&v54, 0xCu);
        }

        v39 = v6;
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "screen"));
        if (v41)
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "window"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "screen"));
          objc_msgSend(v43, "nativeScale");
          v45 = v44;

        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
          objc_msgSend(v42, "nativeScale");
          v45 = v52;
        }

        v53 = sub_1005E10BC(v7, 0xCuLL, 4, v45);
        v20 = (void *)objc_claimAutoreleasedReturnValue(v53);
        v51 = v39;
LABEL_27:
        objc_msgSend(v51, "setImageSource:", v20);
        goto LABEL_28;
      }
    }
    else
    {

    }
    v49 = sub_1005808F8();
    v50 = objc_claimAutoreleasedReturnValue(v49);
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v54 = 134349312;
      v55 = a1;
      v56 = 2048;
      v57 = v7;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_INFO, "[%{public}p] No GEORouteIncident to configure header for MNTrafficIncidentAlert %p", (uint8_t *)&v54, 0x16u);
    }

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("alert-big")));
    v51 = v6;
    goto LABEL_27;
  }
  v25 = sub_1005808F8();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incident"));
    v54 = 134349314;
    v55 = a1;
    v56 = 2112;
    v57 = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "[%{public}p] Initializing using incident type %@", (uint8_t *)&v54, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "incident"));
  v28 = v6;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "window"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "screen"));
  if (v30)
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "window"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "screen"));
    objc_msgSend(v32, "nativeScale");
    v34 = v33;

  }
  else
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v31, "nativeScale");
    v34 = v46;
  }

  v47 = sub_1005E0FCC(v20, 4, v34);
  v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
  objc_msgSend(v28, "setImageSource:", v48);

LABEL_28:
}

+ (void)configureHeaderView:(id)a3 withTrafficIncidentFeature:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  id v28;
  id v29;

  v29 = a3;
  v5 = a4;
  if (objc_msgSend(v5, "isRestrictionIncident"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "restrictionTitle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primaryLabel"));
    objc_msgSend(v7, "setText:", v6);

    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "restrictionCombinedDetails"));
LABEL_5:
    v13 = (void *)v8;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "secondaryLabel"));
    objc_msgSend(v14, "setText:", v13);

    goto LABEL_6;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "title"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "primaryLabel"));
  objc_msgSend(v10, "setText:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));
  v12 = objc_msgSend(v11, "length");

  if (v12)
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "subtitle"));
    goto LABEL_5;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "secondaryLabel"));
  objc_msgSend(v13, "setText:", 0);
LABEL_6:

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artwork"));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "artwork"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "traitCollection"));
    v18 = ImageForArtwork(v16, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    objc_msgSend(v29, "setImageSource:", v19);

  }
  else
  {
    v20 = v29;
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "screen"));
    if (v22)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "window"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "screen"));
      objc_msgSend(v24, "nativeScale");
      v26 = v25;

    }
    else
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v23, "nativeScale");
      v26 = v27;
    }

    v28 = sub_1005E0E80(v5, 4, v26);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v28);
    objc_msgSend(v20, "setImageSource:", v16);
  }

}

+ (void)configureDetailsView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bannerDescription"));
  v8 = objc_msgSend(v7, "length");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bannerDescription"));
    objc_msgSend(v11, "setPrimaryLabelText:", v9);
LABEL_5:

    goto LABEL_6;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incident"));

  if (v10)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "incident"));
    objc_msgSend(a1, "configureDetailsView:withGEORouteIncident:", v11, v9);
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)configureDetailsView:(id)a3 withTrafficIncidentFeature:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
  objc_msgSend(v11, "setPrimaryLabelText:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastUpdatedDate"));
  if (v7)
  {
    if (qword_1014D2990 != -1)
      dispatch_once(&qword_1014D2990, &stru_1011BBB90);
    v8 = (void *)qword_1014D2988;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastUpdatedDate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "lastUpdatedUIStringForDate:", v9));
    objc_msgSend(v11, "setSecondaryLabelText:", v10);

  }
  else
  {
    objc_msgSend(v11, "setSecondaryLabelText:", 0);
  }

}

+ (void)configureDetailsView:(id)a3 withGEORouteIncident:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = a4;
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "info"));
    objc_msgSend(v10, "setPrimaryLabelText:", v7);

    if (qword_1014D29A0 != -1)
      dispatch_once(&qword_1014D29A0, &stru_1011BBBB0);
    v8 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)(uint64_t)objc_msgSend(v6, "updateTime") / 1000.0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D2998, "lastUpdatedUIStringForDate:", v8));
    objc_msgSend(v10, "setSecondaryLabelText:", v9);

  }
  else
  {
    objc_msgSend(v10, "setPrimaryLabelText:", 0);
    objc_msgSend(v10, "setSecondaryLabelText:", 0);
  }

}

+ (void)configureRerouteView:(id)a3 withTrafficIncidentAlert:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertTitles"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "primaryLabel"));
  objc_msgSend(v8, "setText:", v7);

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertDescriptions"));
  v10 = objc_msgSend(v9, "count");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "alertDescriptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "secondaryLabel"));
    objc_msgSend(v13, "setText:", v12);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "secondaryLabel"));
    objc_msgSend(v11, "setText:", 0);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dismissButtonTitle"));
  objc_msgSend(v16, "setCancelButtonTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "acceptButtonTitle"));
  objc_msgSend(v16, "setConfirmButtonTitle:", v15);

}

@end
