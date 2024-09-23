@implementation RPPhotosUtility

+ (void)exportVideoToPhotosLibrary:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  Float64 Seconds;
  dispatch_queue_global_t global_queue;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _BYTE *v17;
  CMTime time;
  _BYTE buf[24];
  uint64_t v20;

  v5 = a3;
  v6 = a4;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = "+[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:]";
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = 31;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v20 = 0;
  v7 = objc_msgSend(objc_alloc((Class)AVURLAsset), "initWithURL:options:", v5, 0);
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "duration");
    Seconds = CMTimeGetSeconds(&time);
    *(Float64 *)(*(_QWORD *)&buf[8] + 24) = Seconds;
  }
  global_queue = dispatch_get_global_queue(25, 0);
  v11 = objc_claimAutoreleasedReturnValue(global_queue);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10004269C;
  v14[3] = &unk_100082080;
  v16 = v6;
  v17 = buf;
  v15 = v5;
  v12 = v6;
  v13 = v5;
  dispatch_async(v11, v14);

  _Block_object_dispose(buf, 8);
}

+ (void)exportVideoToPhotosAsynchronously:(id)a3 mixAudioTracks:(BOOL)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v7 = a3;
  v8 = a5;
  if (a4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100042BD4;
    v9[3] = &unk_1000813B8;
    v10 = v7;
    v11 = v8;
    +[RPAudioMixUtility mixAudioForMovie:withCompletionHandler:](RPAudioMixUtility, "mixAudioForMovie:withCompletionHandler:", v10, v9);

  }
  else
  {
    +[RPPhotosUtility exportVideoToPhotosLibrary:completionHandler:](RPPhotosUtility, "exportVideoToPhotosLibrary:completionHandler:", v7, v8);
  }

}

+ (BOOL)showAlertFailedSaveToPhotosWithError:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  __CFUserNotification *v10;
  __CFUserNotification *v11;
  CFOptionFlags responseFlags;
  _QWORD v14[3];
  _QWORD v15[3];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  int v19;

  v3 = a3;
  if (dword_100095B40 <= 1 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446466;
    v17 = "+[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]";
    v18 = 1024;
    v19 = 115;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d ", buf, 0x12u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_FAILED_TO_SAVE_ALERT_MESSAGE_FORMAT")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v4, v5));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("RECORDING_STATUSBAR_TAPPED_ALERT_TITLE")));
  v8 = v6;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle _rpLocalizedStringFromFrameworkBundleWithKey:](NSBundle, "_rpLocalizedStringFromFrameworkBundleWithKey:", CFSTR("BROADCAST_FAILED_ALERT_OK_BUTTON")));
  v14[0] = kCFUserNotificationAlertHeaderKey;
  v14[1] = kCFUserNotificationAlertMessageKey;
  v15[0] = v7;
  v15[1] = v8;
  v14[2] = kCFUserNotificationDefaultButtonTitleKey;
  v15[2] = v9;
  v10 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 0, 0, (CFDictionaryRef)+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 3));
  if (v10)
  {
    v11 = v10;
    responseFlags = 0;
    CFUserNotificationReceiveResponse(v10, 0.0, &responseFlags);
    if (!responseFlags
      && dword_100095B40 <= 1
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446466;
      v17 = "+[RPPhotosUtility showAlertFailedSaveToPhotosWithError:]";
      v18 = 1024;
      v19 = 145;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, " [INFO] %{public}s:%d user has hit okay, alert will be dismissed", buf, 0x12u);
    }
    CFRelease(v11);
  }
  else if (dword_100095B40 <= 2 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100051CC4();
  }

  return 0;
}

+ (id)fetchLastSavedVideoAssetInPhotos
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v2 = objc_alloc_init((Class)PHFetchOptions);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSSortDescriptor sortDescriptorWithKey:ascending:](NSSortDescriptor, "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 1));
  v8 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));
  objc_msgSend(v2, "setSortDescriptors:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[PHAsset fetchAssetsWithMediaType:options:](PHAsset, "fetchAssetsWithMediaType:options:", 2, v2));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "lastObject"));

  return v6;
}

@end
