@implementation PresentRAPActionHandler

+ (void)performAction:(id)a3 inContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  SearchResult *v11;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  unsigned __int8 v24;
  unsigned __int8 v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned __int8 v30;
  char v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  SearchResult *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  SearchResult *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  _QWORD v54[4];
  SearchResult *v55;
  id v56;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  char v62;
  unsigned __int8 v63;
  id v64;
  id v65;
  id v66;
  id v67;
  char v68;
  _QWORD v69[4];
  SearchResult *v70;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_class(PresentRAPAction);
  if ((objc_opt_isKindOfClass(v5, v7) & 1) != 0)
  {
    v8 = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));

    if (v9)
    {
      if (!_MKRAPIsAvailable(v10) || sub_1003DDB84())
      {
        v11 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v13 = v12;
        v14 = CFSTR("This feature isn’t available to you [Report a Problem]");
LABEL_6:
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", v14, CFSTR("localized string not found"), 0));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", 0, v15, 1));

        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("OK [Report a Problem push]"), CFSTR("localized string not found"), 0));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v18, 1, 0));
        objc_msgSend(v16, "addAction:", v19);

        -[SearchResult _maps_topMostPresentViewController:animated:completion:](v11, "_maps_topMostPresentViewController:animated:completion:", v16, 1, 0);
LABEL_27:

        goto LABEL_28;
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      if (objc_msgSend(v37, "_isMapItemTypeBrand"))
      {

      }
      else
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
        objc_msgSend(v43, "_coordinate");
        v45 = v44;
        v47 = v46;

        if (v47 < -180.0 || v47 > 180.0 || v45 < -90.0 || v45 > 90.0)
        {
          v11 = (SearchResult *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v13 = v12;
          v14 = CFSTR("Location Details Not Available [Report a Problem]");
          goto LABEL_6;
        }
      }
      v48 = [SearchResult alloc];
      v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapItem"));
      v11 = -[SearchResult initWithMapItem:](v48, "initWithMapItem:", v49);

      if (!_MKRAPIsAvailable(v50) || (sub_1003DDB84() & 1) != 0 || !v11)
        goto LABEL_27;
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "_maps_mapsSceneDelegate"));
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "rapPresenter"));
      v69[0] = _NSConcreteStackBlock;
      v69[1] = 3221225472;
      v69[2] = sub_1003BCF10;
      v69[3] = &unk_1011B4160;
      v70 = v11;
      objc_msgSend(v53, "presentReportAProblemFromPlaceCardViewController:editingContext:overriddenUserInterfaceStyle:sourceView:entryPoint:completion:", 0, v69, 0, 0, 201, 0);

      v42 = v70;
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));

      if (v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedMapsDelegate](UIApplication, "sharedMapsDelegate"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "poiSearchManager"));
        objc_msgSend(v22, "didReceiveRAPNotification");

        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "response"));
        v68 = 0;
        v24 = objc_msgSend(v23, "canDisplayAdditionalUI");
        v66 = 0;
        v67 = 0;
        v25 = objc_msgSend(v23, "getSingleServerSideAlertTitle:message:messageIsSameAsNotificationTitle:", &v67, &v66, &v68);
        v26 = v67;
        v27 = v66;
        if ((v25 & 1) == 0)
        {
          v64 = 0;
          v65 = 0;
          objc_msgSend(v23, "getDefaultAlertTitle:alertMessage:", &v65, &v64);
          v28 = v65;

          v29 = v64;
          v26 = v28;
          v27 = v29;
        }
        if (v68)
          v30 = 0;
        else
          v30 = v25;
        v31 = v30 | v24 ^ 1;
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appCoordinator"));
        v57[0] = _NSConcreteStackBlock;
        v57[1] = 3221225472;
        v57[2] = sub_1003BCF1C;
        v57[3] = &unk_1011B4188;
        v62 = v31;
        v58 = v26;
        v59 = v27;
        v63 = v24;
        v60 = v23;
        v61 = v32;
        v34 = v32;
        v11 = v23;
        v35 = v27;
        v36 = v26;
        objc_msgSend(v33, "displayOrScheduleDisplayOfEnqueuedFixedProblem:", v57);

        goto LABEL_27;
      }
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rapInfo"));

      if (!v38)
      {
LABEL_28:

        goto LABEL_29;
      }
      v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chrome"));
      v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rapInfo"));
      v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "rapId"));
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1003BD0F8;
      v54[3] = &unk_1011B41D0;
      v55 = (SearchResult *)v6;
      v56 = v39;
      v11 = v39;
      +[RAPRecordManager fetchRAPRecordsMatchingProblemId:completion:](RAPRecordManager, "fetchRAPRecordsMatchingProblemId:completion:", v41, v54);

      v42 = v55;
    }

    goto LABEL_27;
  }
LABEL_29:

}

@end
