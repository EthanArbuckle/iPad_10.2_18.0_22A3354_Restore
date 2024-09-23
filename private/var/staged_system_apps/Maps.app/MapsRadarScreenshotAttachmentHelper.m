@implementation MapsRadarScreenshotAttachmentHelper

+ (void)generateScreenshotAttachmentsFromWindow:(id)a3 withName:(id)a4 radarDraft:(id)a5 completion:(id)a6
{
  objc_msgSend(a1, "generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:", 7, a3, a4, a5, a6);
}

+ (void)generateScreenshotAttachments:(unint64_t)a3 fromWindow:(id)a4 withName:(id)a5 radarDraft:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  NSObject *v20;
  char *v21;
  id v22;
  NSObject *v23;
  void *v24;
  id v25;
  NSObject *v26;
  id v27;
  NSObject *v28;
  void *v29;
  id v30;
  char *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  void (**v36)(_QWORD);
  unint64_t v37;
  id v38;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = (void (**)(_QWORD))a7;
  if (v15)
  {
    if (v12)
    {
      if (v13)
      {
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100911550;
        v32[3] = &unk_1011DBB18;
        v33 = v12;
        v37 = a3;
        v38 = a1;
        v34 = v13;
        v35 = v14;
        v36 = v15;
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, v32);

        goto LABEL_23;
      }
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("name is necessary for screenshot generation")));
        *(_DWORD *)buf = 136315906;
        v40 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
        v41 = 2080;
        v42 = "MapsRadarScreenshotAttachmentHelper.m";
        v43 = 1024;
        v44 = 43;
        v45 = 2112;
        v46 = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (!sub_100A70734())
      {
LABEL_22:
        v15[2](v15);
        goto LABEL_23;
      }
      v30 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v30);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
LABEL_21:

        goto LABEL_22;
      }
    }
    else
    {
      v22 = sub_1004318FC();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("window is necessary for screenshot generation")));
        *(_DWORD *)buf = 136315906;
        v40 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
        v41 = 2080;
        v42 = "MapsRadarScreenshotAttachmentHelper.m";
        v43 = 1024;
        v44 = 37;
        v45 = 2112;
        v46 = v24;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

      }
      if (!sub_100A70734())
        goto LABEL_22;
      v25 = sub_1004318FC();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (!os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        goto LABEL_21;
    }
    v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    *(_DWORD *)buf = 138412290;
    v40 = v31;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    goto LABEL_21;
  }
  v16 = sub_1004318FC();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("completion block is necessary for screenshot generation")));
    *(_DWORD *)buf = 136315906;
    v40 = "+[MapsRadarScreenshotAttachmentHelper generateScreenshotAttachments:fromWindow:withName:radarDraft:completion:]";
    v41 = 2080;
    v42 = "MapsRadarScreenshotAttachmentHelper.m";
    v43 = 1024;
    v44 = 32;
    v45 = 2112;
    v46 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly! '%@'", buf, 0x26u);

  }
  if (sub_100A70734())
  {
    v19 = sub_1004318FC();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
      *(_DWORD *)buf = 138412290;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

    }
  }
LABEL_23:

}

@end
