@implementation PHPickerViewController

- (id)crl_loadFileRepresentationsForResults:(id)a3 supportedTypeIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;

  v8 = a5;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "crl_arrayByMappingObjectsUsingBlock:", &stru_10122D5C8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPickerViewController crl_loadFileRepresentationsForResultItemProviders:supportedTypeIdentifiers:completionHandler:](self, "crl_loadFileRepresentationsForResultItemProviders:supportedTypeIdentifiers:completionHandler:", v10, v9, v8));

  return v11;
}

- (id)crl_loadFileRepresentationsForResultItemProviders:(id)a3 supportedTypeIdentifiers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  CRLUUIDLogContext *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  dispatch_time_t v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void **v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  id v29;
  CRLUUIDLogContext *v30;
  id v31;
  _QWORD *v32;
  _QWORD *v33;
  _BYTE *v34;
  id v35;
  _QWORD v36[6];
  _QWORD v37[5];
  id v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  _BYTE *v42;
  id v43;
  _QWORD v44[3];
  char v45;
  _QWORD v46[3];
  char v47;
  _QWORD v48[4];
  int v49;
  id location;
  _BYTE buf[24];
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_opt_new(CRLUUIDLogContext);
  if (qword_10147E340 != -1)
    dispatch_once(&qword_10147E340, &stru_10122D5E8);
  v12 = off_1013D7A80;
  if (os_log_type_enabled((os_log_t)off_1013D7A80, OS_LOG_TYPE_DEFAULT))
  {
    v13 = v12;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUUIDLogContext publicString](v11, "publicString"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUUIDLogContext privateString](v11, "privateString"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ %@ Loading assets", buf, 0x16u);

  }
  objc_initWeak(&location, self);
  v48[0] = 0;
  v48[1] = v48;
  v48[2] = 0x2810000000;
  v48[3] = &unk_1010E66AB;
  v49 = 0;
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x2020000000;
  v47 = 0;
  v44[0] = 0;
  v44[1] = v44;
  v44[2] = 0x2020000000;
  v45 = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v52 = sub_100023DE4;
  v53 = sub_100023DF4;
  v54 = 0;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSProgress progressWithTotalUnitCount:](NSProgress, "progressWithTotalUnitCount:", 100));
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_100023DFC;
  v37[3] = &unk_10122D700;
  v40 = v46;
  v41 = v44;
  v39 = v48;
  v37[4] = v11;
  objc_copyWeak(&v43, &location);
  v17 = v10;
  v38 = v17;
  v42 = buf;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[PHPickerResult crl_loadFileRepresentationsForResultItemProviders:supportedTypeIdentifiers:completionHandler:](PHPickerResult, "crl_loadFileRepresentationsForResultItemProviders:supportedTypeIdentifiers:completionHandler:", v8, v9, v37));
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1000245E4;
  v36[3] = &unk_10122D728;
  v36[4] = v48;
  v36[5] = v44;
  objc_msgSend(v18, "setCancellationHandler:", v36);
  v19 = dispatch_time(0, 1000000000);
  v25 = _NSConcreteStackBlock;
  v26 = 3221225472;
  v27 = sub_10002462C;
  v28 = &unk_10122D7B8;
  objc_copyWeak(&v35, &location);
  v32 = v48;
  v33 = v46;
  v20 = v18;
  v34 = buf;
  v29 = v20;
  v30 = v11;
  v21 = v16;
  v31 = v21;
  dispatch_after(v19, (dispatch_queue_t)&_dispatch_main_q, &v25);
  objc_msgSend(v21, "addChild:withPendingUnitCount:", v20, 100, v25, v26, v27, v28);
  v22 = v31;
  v23 = v21;

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v43);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v44, 8);
  _Block_object_dispose(v46, 8);
  _Block_object_dispose(v48, 8);
  objc_destroyWeak(&location);

  return v23;
}

- (void)cancelAnimated:(BOOL)a3 completionQueue:(id)a4 completionHandler:(id)a5
{
  NSObject *v7;
  void (**v8)(_QWORD);
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD block[4];
  void (**v21)(_QWORD);

  v7 = a4;
  v8 = (void (**)(_QWORD))a5;
  v10 = objc_opt_class(UIAlertController, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHPickerViewController presentedViewController](self, "presentedViewController"));
  v12 = sub_100221D0C(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  if (v13)
  {
    v15 = (objc_class *)objc_opt_class(_TtC8Freeform31CRLSimpleProgressViewController, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crl_contentViewController"));
    v17 = sub_1002223BC(v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "progress"));

    objc_msgSend(v19, "cancel");
  }
  if (v8)
  {
    if (v7)
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100024BFC;
      block[3] = &unk_10122D7E0;
      v21 = v8;
      dispatch_async(v7, block);

    }
    else
    {
      v8[2](v8);
    }
  }

}

@end
