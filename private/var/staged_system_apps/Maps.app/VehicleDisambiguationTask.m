@implementation VehicleDisambiguationTask

- (void)displayDisambiguationPromptIfNeededFromChromeViewController:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  id v20;
  _QWORD *v21;
  _QWORD *v22;
  id v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  id v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD v32[4];
  id v33;
  Block_layout *v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  id v46;
  id v47;
  _QWORD v48[4];
  Block_layout *v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id location;
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  const char *v57;
  __int16 v58;
  int v59;

  v4 = a3;
  v6 = v4;
  if (v4)
  {
    if ((MapsFeature_IsEnabled_EVRouting(v4, v5) & 1) != 0)
    {
      if (!self->_didDisplayVehicleDisambiguation)
      {
        objc_initWeak((id *)buf, self);
        objc_initWeak(&location, v6);
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_100557B54;
        v51[3] = &unk_1011BAF20;
        v16 = (id)objc_claimAutoreleasedReturnValue(+[MapsExternalAccessory sharedInstance](MapsExternalAccessory, "sharedInstance"));
        v52 = v16;
        v17 = objc_retainBlock(v51);
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_100557DF8;
        v48[3] = &unk_1011BB008;
        objc_copyWeak(&v50, (id *)buf);
        v49 = &stru_1011BAF60;
        v18 = objc_retainBlock(v48);
        v43[0] = _NSConcreteStackBlock;
        v43[1] = 3221225472;
        v43[2] = sub_100557EEC;
        v43[3] = &unk_1011BB058;
        objc_copyWeak(&v47, (id *)buf);
        v19 = v17;
        v45 = v19;
        v20 = v16;
        v44 = v20;
        v21 = v18;
        v46 = v21;
        v22 = objc_retainBlock(v43);
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100558330;
        v38[3] = &unk_1011BB138;
        objc_copyWeak(&v42, &location);
        v23 = v20;
        v39 = v23;
        v24 = v21;
        v40 = v24;
        v25 = v19;
        v41 = v25;
        v26 = objc_retainBlock(v38);
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100558BA0;
        v32[3] = &unk_1011BB180;
        v28 = v23;
        v33 = v28;
        v34 = &stru_1011BAF60;
        v29 = v25;
        v35 = v29;
        v30 = v22;
        v36 = v30;
        v31 = v26;
        v37 = v31;
        objc_msgSend(v27, "virtualGarageGetGarageWithReply:", v32);

        objc_destroyWeak(&v42);
        objc_destroyWeak(&v47);

        objc_destroyWeak(&v50);
        objc_destroyWeak(&location);
        objc_destroyWeak((id *)buf);
        goto LABEL_20;
      }
      v7 = sub_10043268C();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Won't present disambiguation because we've already done this during this app launch.", buf, 2u);
      }
    }
    else
    {
      v15 = sub_10043268C();
      v8 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Won't present disambiguation because EV routing is not enabled.", buf, 2u);
      }
    }
  }
  else
  {
    v9 = sub_1004318FC();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v55 = "-[VehicleDisambiguationTask displayDisambiguationPromptIfNeededFromChromeViewController:]";
      v56 = 2080;
      v57 = "VehicleDisambiguationTask.m";
      v58 = 1024;
      v59 = 36;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v11 = sub_1004318FC();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v55 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
    v14 = sub_10043268C();
    v8 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Tried to display disambiguation, but did not have a chrome to display on.", buf, 2u);
    }
  }

LABEL_20:
}

+ (int64_t)creationPreference
{
  return 1;
}

@end
