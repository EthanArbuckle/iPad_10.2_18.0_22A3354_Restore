@implementation GEORPProblemStatusResponse

- (void)getDefaultAlertTitle:(id *)a3 alertMessage:(id *)a4
{
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  CFAbsoluteTime v22;
  CFDateRef v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id v42;
  id v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  NSString *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  const __CFString *v54;
  id *v55;
  void *v56;
  void *v57;
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[128];

  if (a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Your Reported Issues [push]"), CFSTR("localized string not found"), 0));

    v9 = objc_retainAutorelease(v8);
    *a3 = v9;

  }
  if (a4)
  {
    v55 = a4;
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v62 = 0u;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatus](self, "problemStatus"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v60;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v60 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * (_QWORD)i);
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "details"));
          v18 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "mapItemsForPlacesInDetails:", v17));

          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "firstObject"));
          if (v19)
          {
            objc_msgSend(v58, "addObject:", v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));

            if (v20)
            {
              v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "name"));
              objc_msgSend(v57, "addObject:", v21);

            }
          }
          if (objc_msgSend(v15, "hasCreationDate"))
          {
            objc_msgSend(v15, "creationDate");
            v23 = CFDateCreate(kCFAllocatorDefault, v22);
            v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDateFormatter localizedStringFromDate:dateStyle:timeStyle:](NSDateFormatter, "localizedStringFromDate:dateStyle:timeStyle:", v23, 2, 0));
            CFRelease(v23);
            if (v24)
              objc_msgSend(v56, "addObject:", v24);

          }
          if (a3)
          {
            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "details"));
            v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedTitle"));

            if (v26)
            {
              v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "notification"));
              *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedTitle"));

            }
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "notification"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedText"));

            if (v29)
            {
              v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "notification"));
              *v55 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedText"));

              v30 = v56;
              v36 = v10;
              goto LABEL_45;
            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v59, v63, 16);
        if (v12)
          continue;
        break;
      }
    }

    v30 = v56;
    if (objc_msgSend(v56, "count"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", 0));
      if ((char *)objc_msgSend(v56, "count") - 3 > (char *)0xFFFFFFFFFFFFFFFDLL)
      {
        v36 = v31;
      }
      else
      {
        v32 = 1;
        do
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR(", <date>"), CFSTR("localized string not found"), 0));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "objectAtIndexedSubscript:", v32));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "stringByAppendingFormat:", v34, v35));

          ++v32;
          v31 = v36;
        }
        while ((char *)v32 < (char *)objc_msgSend(v56, "count") - 1);
      }
      if ((unint64_t)objc_msgSend(v56, "count") > 1)
      {
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "localizedStringForKey:value:table:", CFSTR(" and <date>"), CFSTR("localized string not found"), 0));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "lastObject"));
        v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "stringByAppendingFormat:", v39, v40));

        v36 = (void *)v41;
      }
    }
    else
    {
      v36 = 0;
    }
    switch((unint64_t)objc_msgSend(v57, "count"))
    {
      case 0uLL:
        v42 = objc_msgSend(v56, "count");
        v43 = objc_msgSend(v58, "count");
        if (v42)
        {
          v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v45 = v44;
          if ((unint64_t)v43 < 2)
            v46 = CFSTR("The issue reported on <date> has been addressed. [push]");
          else
            v46 = CFSTR("The issues reported on <date> have been addressed. [push]");
          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", v46, CFSTR("localized string not found"), 0));
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v36));
          goto LABEL_43;
        }
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v45 = v53;
        if ((unint64_t)v43 < 2)
          v54 = CFSTR("The issue reported has been addressed. [push]");
        else
          v54 = CFSTR("The issues reported have been addressed. [push]");
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "localizedStringForKey:value:table:", v54, CFSTR("localized string not found"), 0));
        goto LABEL_44;
      case 1uLL:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("The issue report related to <place> has been addressed. [push]"), CFSTR("localized string not found"), 0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 0));
        v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48));
        goto LABEL_42;
      case 2uLL:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("The issue reports related to <place1> and <place2> have been addressed. [push]"), CFSTR("localized string not found"), 0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 1));
        v52 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v47, v48, v49));
        goto LABEL_41;
      case 3uLL:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("The issue reports related to <place1>, <place2> and <count> other location have been addressed. [push]"), CFSTR("localized string not found"), 0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 1));
        v50 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v47, v48, v49, 1);
        goto LABEL_40;
      default:
        v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "localizedStringForKey:value:table:", CFSTR("The issue reports related to <place1>, <place2> and <count> other locations have been addressed. [push]"), CFSTR("localized string not found"), 0));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 0));
        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "objectAtIndexedSubscript:", 1));
        v50 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v47, v48, v49, (char *)objc_msgSend(v57, "count") - 2);
LABEL_40:
        v52 = objc_claimAutoreleasedReturnValue(v50);
LABEL_41:
        v51 = (void *)v52;

LABEL_42:
LABEL_43:

LABEL_44:
        v18 = objc_retainAutorelease(v51);
        *v55 = v18;
        break;
    }
LABEL_45:

  }
}

- (BOOL)getSingleServerSideAlertTitle:(id *)a3 message:(id *)a4 messageIsSameAsNotificationTitle:(BOOL *)a5
{
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;

  if (-[GEORPProblemStatusResponse problemStatusCount](self, "problemStatusCount") == (id)1)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatusAtIndex:](self, "problemStatusAtIndex:", 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedText"));

    v12 = objc_msgSend(v11, "length");
    v13 = v12 != 0;
    if (v12)
    {
      if (a3)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
        *a3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedTitle"));

      }
      if (a4)
        *a4 = objc_retainAutorelease(v11);
      if (a5)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "notification"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedText"));
        *a5 = objc_msgSend(v11, "isEqual:", v16);

      }
    }

  }
  else
  {
    if (a5)
      *a5 = 0;
    if (a3)
      *a3 = 0;
    v13 = 0;
    if (a4)
      *a4 = 0;
  }
  return v13;
}

- (BOOL)canDisplayAdditionalUI
{
  return -[GEORPProblemStatusResponse problemStatusCount](self, "problemStatusCount") == (id)1;
}

- (void)displayAdditionalUIOnViewController:(id)a3
{
  id v4;

  v4 = a3;
  if (-[GEORPProblemStatusResponse canDisplayAdditionalUI](self, "canDisplayAdditionalUI")
    && -[GEORPProblemStatusResponse problemStatusCount](self, "problemStatusCount") == (id)1)
  {
    -[GEORPProblemStatusResponse _displayDedicatedFixedProblemViewController:](self, "_displayDedicatedFixedProblemViewController:", v4);
  }

}

- (void)_displayDedicatedFixedProblemViewController:(id)a3
{
  id v4;
  _TtC4Maps31RAPNotificationDetailsViewModel *v5;
  void *v6;
  void *v7;
  _TtC4Maps31RAPNotificationDetailsViewModel *v8;
  RAPNotificationDetailsViewController *v9;
  id v10;
  void **v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  if (MapsFeature_IsEnabled_RAPSydney())
  {
    v5 = [_TtC4Maps31RAPNotificationDetailsViewModel alloc];
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse problemStatus](self, "problemStatus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
    v8 = -[RAPNotificationDetailsViewModel initWithProblemStatus:](v5, "initWithProblemStatus:", v7);

    v9 = -[RAPNotificationDetailsViewController initWithViewModel:report:question:]([RAPNotificationDetailsViewController alloc], "initWithViewModel:report:question:", v8, 0, 0);
    v10 = objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v9);
    objc_msgSend(v10, "setModalPresentationStyle:", 2);
    objc_msgSend(v4, "_maps_topMostPresentViewController:animated:completion:", v10, 1, 0);

  }
  else
  {
    v8 = (_TtC4Maps31RAPNotificationDetailsViewModel *)objc_claimAutoreleasedReturnValue(+[RAPFixedProblemNavigationController fixedProblemNavigationControllerWithProblemStatusResponse:](RAPFixedProblemNavigationController, "fixedProblemNavigationControllerWithProblemStatusResponse:", self));
    -[RAPNotificationDetailsViewModel setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
    objc_initWeak(&location, v8);
    v11 = _NSConcreteStackBlock;
    v12 = 3221225472;
    v13 = sub_10047E13C;
    v14 = &unk_1011AD260;
    objc_copyWeak(&v15, &location);
    -[RAPNotificationDetailsViewModel setDoneHandler:](v8, "setDoneHandler:", &v11);
    objc_msgSend(v4, "_maps_topMostPresentViewController:animated:completion:", v8, 1, 0, v11, v12, v13, v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

}

- (BOOL)writeToDisk:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v6 = a3;
  if (+[RAPNotification isValidNotificationID:](RAPNotification, "isValidNotificationID:", v6))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification filenameForNotificationID:](RAPNotification, "filenameForNotificationID:", v6));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification notificationCachePath](RAPNotification, "notificationCachePath"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v7));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[GEORPProblemStatusResponse data](self, "data"));
      v11 = objc_msgSend(v10, "writeToFile:options:error:", v9, 1, a4);
    }
    else
    {
      if (!a4)
      {
        v11 = 0;
        goto LABEL_9;
      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification errorDomain](RAPNotification, "errorDomain"));
      v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v10, -1, 0));
    }

LABEL_9:
    goto LABEL_10;
  }
  if (!a4)
  {
    v11 = 0;
    goto LABEL_11;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification errorDomain](RAPNotification, "errorDomain"));
  v11 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v7, -2, 0));
LABEL_10:

LABEL_11:
  return v11;
}

+ (GEORPProblemStatusResponse)problemStatusResponseWithNotificationID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = a3;
  if (+[RAPNotification isValidNotificationID:](RAPNotification, "isValidNotificationID:", v3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification filenameForNotificationID:](RAPNotification, "filenameForNotificationID:", v3));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RAPNotification notificationCachePath](RAPNotification, "notificationCachePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", v4));

    if (v6)
    {
      v7 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfFile:", v6);
      if (v7)
        v8 = objc_msgSend(objc_alloc((Class)GEORPProblemStatusResponse), "initWithData:", v7);
      else
        v8 = 0;

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return (GEORPProblemStatusResponse *)v8;
}

@end
