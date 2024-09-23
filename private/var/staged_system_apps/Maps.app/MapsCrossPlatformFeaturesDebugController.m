@implementation MapsCrossPlatformFeaturesDebugController

+ (id)navigationDestinationTitle
{
  return CFSTR("Cross-Platform Features");
}

- (void)_requestTerminationForRestart
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)UIAlertController);
  objc_msgSend(v5, "setTitle:", CFSTR("Applying this change requires Maps to restart."));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Later"), 1, 0));
  objc_msgSend(v5, "addAction:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Quit Maps"), 2, &stru_1011AFCE0));
  objc_msgSend(v5, "addAction:", v4);

  -[MapsCrossPlatformFeaturesDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (id)_mapsAppStateCreateActivity:(unint64_t)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCrossPlatformFeaturesDebugController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsActivityWithFidelity:", a3));

  return v5;
}

- (void)_mapsAppStateRestoreActivity:(id)a3 withAssumedSourceFidelity:(unint64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[MapsCrossPlatformFeaturesDebugController _maps_mapsSceneDelegate](self, "_maps_mapsSceneDelegate"));
  objc_msgSend(v7, "setMapsActivity:assumedSourceFidelity:source:", v6, a4, 1);

}

- (void)prepareContent
{
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;
  id location;

  objc_initWeak(&location, self);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1002BDDFC;
  v15[3] = &unk_1011AEAC8;
  objc_copyWeak(&v16, &location);
  v3 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Placecard"), v15);
  v4 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("URLs"), &stru_1011AFDA0);
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1002BE0A0;
  v13[3] = &unk_1011AEAC8;
  objc_copyWeak(&v14, &location);
  v5 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Handoff"), v13);
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_1002BE3F8;
  v11 = &unk_1011AEAC8;
  objc_copyWeak(&v12, &location);
  v6 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Full State"), &v8);
  v7 = -[MapsDebugValuesViewController addSectionWithTitle:content:](self, "addSectionWithTitle:content:", CFSTR("Default Transportation Mode"), &stru_1011AFDE0, v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)_copyStateWithFidelity:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCrossPlatformFeaturesDebugController _mapsAppStateCreateActivity:](self, "_mapsAppStateCreateActivity:", a3));
  if (v3)
  {
    v10 = v3;
    NSLog(CFSTR("About to copy the current state of the app: %@"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "base64EncodedStringWithOptions:", 0));
    NSLog(CFSTR("The size of the payload is %lu"), objc_msgSend(v4, "length"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "bzip2CompressedData"));
    v7 = v6;
    if (v6)
      NSLog(CFSTR("The size of the Bzip2-compressed payload is %lu"), objc_msgSend(v6, "length"));
    else
      NSLog(CFSTR("The compressed data could not be created"), v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
    objc_msgSend(v8, "setString:", v5);

    v3 = v10;
  }

}

- (void)_pasteStateWithAssumedSourceFidelity:(unint64_t)a3
{
  void *v5;
  id v6;
  MapsActivity *v7;
  MapsActivity *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "string"));

  if (v10)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSData), "initWithBase64EncodedString:options:", v10, 1);
    if (v6)
    {
      v7 = -[MapsActivity initWithData:]([MapsActivity alloc], "initWithData:", v6);
      v8 = v7;
      if (v7)
      {
        NSLog(CFSTR("About to restore the state of the app from activity: %@"), v7);
        -[MapsCrossPlatformFeaturesDebugController _mapsAppStateRestoreActivity:withAssumedSourceFidelity:](self, "_mapsAppStateRestoreActivity:withAssumedSourceFidelity:", v8, a3);
      }

    }
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCrossPlatformFeaturesDebugController presentingViewController](self, "presentingViewController"));
  objc_msgSend(v9, "dismissViewControllerAnimated:completion:", 0, 0);

}

- (BOOL)recordsContinuously
{
  id WeakRetained;
  BOOL v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingTimer);
  v3 = WeakRetained != 0;

  return v3;
}

- (void)setRecordsContinuously:(BOOL)a3
{
  _BOOL4 v3;
  NSTimer **p_recordingTimer;
  id WeakRetained;
  id v7;
  id v8;

  v3 = a3;
  p_recordingTimer = &self->_recordingTimer;
  WeakRetained = objc_loadWeakRetained((id *)&self->_recordingTimer);

  if (v3)
  {
    if (!WeakRetained)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:](NSTimer, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, "_record", 0, 1, 0.5));
      objc_storeWeak((id *)p_recordingTimer, v8);

    }
  }
  else if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_recordingTimer);
    objc_msgSend(v7, "invalidate");

    objc_storeWeak((id *)p_recordingTimer, 0);
    self->_recordingCounter = 0;
  }
}

- (void)_record
{
  unint64_t recordingCounter;
  NSString *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v29;
  NSData *v30;
  void *v31;
  void *v32;
  id v33;
  CGSize v34;

  recordingCounter = self->_recordingCounter;
  v4 = NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("com.apple.Maps.StateRecording")));
  v7 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), self->_recordingCounter));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v33 = 0;
  LOBYTE(v7) = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v33);
  v10 = v33;

  if ((v7 & 1) != 0)
  {
    if (recordingCounter + 1 <= 0xF0)
      v11 = recordingCounter + 1;
    else
      v11 = 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MapsCrossPlatformFeaturesDebugController _mapsAppStateCreateActivity:](self, "_mapsAppStateCreateActivity:", 0xFFFFFFFLL));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Activity Description.txt")));
    objc_msgSend(v13, "writeToFile:atomically:encoding:error:", v14, 1, 4, 0);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "data"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "base64EncodedStringWithOptions:", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Base64 Activity Data.txt")));
    objc_msgSend(v16, "writeToFile:atomically:encoding:error:", v17, 1, 4, 0);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication _maps_keyMapsWindow](UIApplication, "_maps_keyMapsWindow"));
    objc_msgSend(v18, "bounds");
    v20 = v19;
    v22 = v21;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
    if (v23)
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "screen"));
    else
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    v25 = v24;
    objc_msgSend(v24, "scale");
    v27 = v26;
    v34.width = v20;
    v34.height = v22;
    UIGraphicsBeginImageContextWithOptions(v34, 0, v27);

    objc_msgSend(v18, "bounds");
    objc_msgSend(v18, "drawViewHierarchyInRect:afterScreenUpdates:", 1);
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v29 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v30 = UIImagePNGRepresentation(v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue(v30);

    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Screenshot.png")));
    objc_msgSend(v31, "writeToFile:atomically:", v32, 1);

    NSLog(CFSTR("Saved app state snapshot at %@"), v8);
    self->_recordingCounter = v11;

  }
  else
  {
    NSLog(CFSTR("Could not create snapshot directory at %@"), v8);
  }

}

- (void)_promptForRestart
{
  void *v3;
  void *v4;
  id v5;

  v5 = objc_alloc_init((Class)UIAlertController);
  objc_msgSend(v5, "setTitle:", CFSTR("This change will be effective once Maps restarts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Later"), 1, 0));
  objc_msgSend(v5, "addAction:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", CFSTR("Quit Maps"), 2, &stru_1011AFE00));
  objc_msgSend(v5, "addAction:", v4);

  -[MapsCrossPlatformFeaturesDebugController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_recordingTimer);
}

@end
