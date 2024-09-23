@implementation _OfflineMapSubscriptionTwoLinesContentViewModel

- (_OfflineMapSubscriptionTwoLinesContentViewModel)initWithTitleText:(id)a3 subtitleText:(id)a4 cancelableImageCreationBlock:(id)a5
{
  _OfflineMapSubscriptionTwoLinesContentViewModel *v5;
  MUCircleProgressObservingView *v6;
  MUCircleProgressObservingView *progressView;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
  v5 = -[_BasicTwoLinesContentViewModel initWithTitleText:subtitleText:cancelableImageCreationBlock:](&v11, "initWithTitleText:subtitleText:cancelableImageCreationBlock:", a3, a4, a5);
  if (v5)
  {
    v6 = (MUCircleProgressObservingView *)objc_alloc_init((Class)MUCircleProgressObservingView);
    progressView = v5->_progressView;
    v5->_progressView = v6;

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 10.0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("stop.fill"), v8));
    -[MUCircleProgressObservingView setImage:](v5->_progressView, "setImage:", v9);

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[_OfflineMapSubscriptionTwoLinesContentViewModel setSubscriptionInfo:](self, "setSubscriptionInfo:", 0);
  -[_OfflineMapSubscriptionTwoLinesContentViewModel setProgressView:](self, "setProgressView:", 0);
  -[_OfflineMapSubscriptionTwoLinesContentViewModel setCancelDownloadBlock:](self, "setCancelDownloadBlock:", 0);
  -[_OfflineMapSubscriptionTwoLinesContentViewModel setResumeDownloadBlock:](self, "setResumeDownloadBlock:", 0);
  v3.receiver = self;
  v3.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
  -[_BasicTwoLinesContentViewModel dealloc](&v3, "dealloc");
}

- (void)setSubscriptionInfo:(id)a3
{
  MapDataSubscriptionInfo *v5;
  MapDataSubscriptionInfo **p_subscriptionInfo;
  MapDataSubscriptionInfo *subscriptionInfo;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v5 = (MapDataSubscriptionInfo *)a3;
  p_subscriptionInfo = &self->_subscriptionInfo;
  subscriptionInfo = self->_subscriptionInfo;
  if (subscriptionInfo != v5 && !-[MapDataSubscriptionInfo isEqual:](subscriptionInfo, "isEqual:", v5))
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    if (qword_1014D3870 != -1)
      dispatch_once(&qword_1014D3870, &stru_1011DAFA8);
    v8 = (id)qword_1014D3878;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v11)
            objc_enumerationMutation(v8);
          -[MapDataSubscriptionInfo removeObserver:forKeyPath:context:](*p_subscriptionInfo, "removeObserver:forKeyPath:context:", self, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), off_1014B6A18);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v10);
    }

    objc_storeStrong((id *)&self->_subscriptionInfo, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo state](*p_subscriptionInfo, "state"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapDataSubscriptionInfo pairedDeviceState](*p_subscriptionInfo, "pairedDeviceState"));
    -[_OfflineMapSubscriptionTwoLinesContentViewModel _updateModelWithSubscriptionState:pairedDeviceState:](self, "_updateModelWithSubscriptionState:pairedDeviceState:", v13, v14);

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    if (qword_1014D3870 != -1)
      dispatch_once(&qword_1014D3870, &stru_1011DAFA8);
    v15 = (id)qword_1014D3878;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          -[MapDataSubscriptionInfo addObserver:forKeyPath:options:context:](*p_subscriptionInfo, "addObserver:forKeyPath:options:context:", self, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j), 0, off_1014B6A18, (_QWORD)v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v17);
    }

  }
}

- (void)_updateModelWithSubscriptionState:(id)a3 pairedDeviceState:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  int IsEnabled_StandaloneWatchOffline;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  _QWORD v62[4];
  id v63;
  _QWORD v64[4];
  id v65;
  id location;
  id v67;
  _QWORD v68[2];
  id v69;
  id v70;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (qword_1014D3868 != -1)
      dispatch_once(&qword_1014D3868, &stru_1011DAF38);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadProgress"));

    if (v8)
    {
      if (!objc_msgSend(v6, "loadState")
        || (objc_msgSend(v6, "loadState") == (id)1 || objc_msgSend(v6, "loadState") == (id)3)
        && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadProgress")),
            v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo")),
            v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", GEOMapDataSubscriptionDownloadReasonKey)),
            v10,
            v9,
            v11)
        && (v12 = objc_msgSend(v11, "isEqualToString:", GEOMapDataSubscriptionProgressDownloadReasonForcedUpdate), v11, v12))
      {
        objc_initWeak(&location, self);
        v13 = objc_msgSend(v6, "downloadState");
        if (v13 == (id)1)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Waiting [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));

          v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemFillColor](UIColor, "systemFillColor"));
        }
        else
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadProgress"));
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedAdditionalDescription"));

          v16 = 0;
        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapSubscriptionTwoLinesContentViewModel progressView](self, "progressView"));
        objc_msgSend(v43, "setTintColor:", v16);

        if (v13 == (id)1)
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "downloadProgress"));
        v45 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapSubscriptionTwoLinesContentViewModel progressView](self, "progressView"));
        objc_msgSend(v45, "setProgress:", v44);

        v64[0] = _NSConcreteStackBlock;
        v64[1] = 3221225472;
        v64[2] = sub_1008CD074;
        v64[3] = &unk_1011AD260;
        objc_copyWeak(&v65, &location);
        v46 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapSubscriptionTwoLinesContentViewModel progressView](self, "progressView"));
        objc_msgSend(v46, "setPrimaryAction:", v64);

        v47 = objc_alloc((Class)UICellAccessoryCustomView);
        v48 = (void *)objc_claimAutoreleasedReturnValue(-[_OfflineMapSubscriptionTwoLinesContentViewModel progressView](self, "progressView"));
        v49 = objc_msgSend(v47, "initWithCustomView:placement:", v48, 1);

        v70 = v49;
        v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v70, 1));
        -[_BasicTwoLinesContentViewModel setCellAccessories:](self, "setCellAccessories:", v50);

        objc_destroyWeak(&v65);
        objc_destroyWeak(&location);
        goto LABEL_44;
      }
    }
    if (!objc_msgSend(v6, "loadState") || objc_msgSend(v6, "loadState") == (id)3)
    {
      objc_initWeak(&location, self);
      if (objc_msgSend(v6, "loadState") == (id)3)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Update required [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
      }
      else
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("Download offline map [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
      }
      v19 = (void *)v18;

      v20 = objc_msgSend(v6, "downloadState");
      if (v20 == (id)5)
      {
        if (MGGetBoolAnswer(CFSTR("wapi")))
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Waiting for WLAN [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Waiting for Wi-Fi [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
        }
      }
      else if (v20 == (id)4)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Failed [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
      }
      else
      {
        if (v20 != (id)3)
        {
          v15 = v19;
LABEL_43:
          v62[0] = _NSConcreteStackBlock;
          v62[1] = 3221225472;
          v62[2] = sub_1008CD0DC;
          v62[3] = &unk_1011AF8A0;
          objc_copyWeak(&v63, &location);
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithHandler:](UIAction, "actionWithHandler:", v62));
          v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0, v53));

          v55 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 30.0));
          v56 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.circle"), v55));
          objc_msgSend(v54, "setImage:forState:", v56, 0);

          v57 = objc_msgSend(objc_alloc((Class)UICellAccessoryCustomView), "initWithCustomView:placement:", v54, 1);
          v69 = v57;
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v69, 1));
          -[_BasicTwoLinesContentViewModel setCellAccessories:](self, "setCellAccessories:", v58);

          objc_destroyWeak(&v63);
          objc_destroyWeak(&location);
LABEL_44:
          v25 = 0;
          goto LABEL_45;
        }
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("Paused [subscription cell subtitle]"), CFSTR("localized string not found"), CFSTR("Offline")));
      }
      v15 = (void *)v22;

      goto LABEL_43;
    }
    v23 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1014D3860, "stringFromByteCount:", objc_msgSend(v6, "downloadedDataSize")));
    IsEnabled_StandaloneWatchOffline = MapsFeature_IsEnabled_StandaloneWatchOffline(v23);
    v25 = 0;
    if (v7)
    {
      v15 = v23;
      if (!IsEnabled_StandaloneWatchOffline)
      {
LABEL_40:
        v51 = objc_alloc_init((Class)UICellAccessoryDisclosureIndicator);
        v67 = v51;
        v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v67, 1));
        -[_BasicTwoLinesContentViewModel setCellAccessories:](self, "setCellAccessories:", v52);

LABEL_45:
        -[_BasicTwoLinesContentViewModel setSubtitleText:](self, "setSubtitleText:", v15);
        -[_BasicTwoLinesContentViewModel setAttributedSubtitleText:](self, "setAttributedSubtitleText:", v25);

        goto LABEL_46;
      }
      v26 = objc_msgSend(v7, "loadState");
      if (v26 == (id)3 || !v26)
      {
        v27 = objc_msgSend(v7, "downloadState");
        if ((unint64_t)v27 <= 5)
        {
          if (v27 == (id)2)
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OFFLINE_REGION_CELL_SUBTITLE_PAIRED_DEVICE_STATUS_LOADING"), CFSTR("localized string not found"), CFSTR("Offline")));
          }
          else
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "localizedStringForKey:value:table:", CFSTR("OFFLINE_REGION_CELL_SUBTITLE_PAIRED_DEVICE_STATUS_WAITING"), CFSTR("localized string not found"), CFSTR("Offline")));
          }

          if (v61)
          {
            v29 = objc_alloc((Class)NSAttributedString);
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("OFFLINE_REGION_CELL_SUBTITLE_SEPARATOR"), CFSTR("localized string not found"), CFSTR("Offline")));
            v59 = objc_msgSend(v29, "initWithString:", v31);

            v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithScale:](UIImageSymbolConfiguration, "configurationWithScale:", 1));
            v32 = objc_alloc_init((Class)NSTextAttachment);
            v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("arrow.down.applewatch"), v60));
            v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "imageWithRenderingMode:", 2));
            objc_msgSend(v32, "setImage:", v34);

            v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v32));
            v36 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithAttributedString:", v35);
            v37 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
            objc_msgSend(v36, "appendAttributedString:", v37);

            v38 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v61);
            objc_msgSend(v36, "appendAttributedString:", v38);

            v39 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v23);
            v68[0] = v39;
            v68[1] = v36;
            v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v68, 2));
            v41 = (void *)objc_claimAutoreleasedReturnValue(+[MKMultiPartAttributedString multiPartAttributedStringWithComponents:repeatedSeparator:](MKMultiPartAttributedString, "multiPartAttributedStringWithComponents:repeatedSeparator:", v40, v59));

            v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "attributedString"));
            v15 = 0;
            goto LABEL_40;
          }
        }
      }
      v25 = 0;
    }
    v15 = v23;
    goto LABEL_40;
  }
LABEL_46:

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  objc_super v7;
  _QWORD block[5];
  id v9;
  id location;

  if (off_1014B6A18 == a6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1008CD208;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v9, &location);
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_OfflineMapSubscriptionTwoLinesContentViewModel;
    -[_OfflineMapSubscriptionTwoLinesContentViewModel observeValueForKeyPath:ofObject:change:context:](&v7, "observeValueForKeyPath:ofObject:change:context:", a3, a4, a5);
  }
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (MUCircleProgressObservingView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (id)cancelDownloadBlock
{
  return self->_cancelDownloadBlock;
}

- (void)setCancelDownloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (id)resumeDownloadBlock
{
  return self->_resumeDownloadBlock;
}

- (void)setResumeDownloadBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resumeDownloadBlock, 0);
  objc_storeStrong(&self->_cancelDownloadBlock, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
}

@end
