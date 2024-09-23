@implementation DMDAirPlayManager

+ (DMDAirPlayManager)shared
{
  if (qword_1000EB6E0 != -1)
    dispatch_once(&qword_1000EB6E0, &stru_1000B9C30);
  return (DMDAirPlayManager *)(id)qword_1000EB6D8;
}

- (id)initPrivate
{
  DMDAirPlayManager *v2;
  DMDAirPlayManager *v3;
  NSString *currentlyPickedDestinationName;
  NSString *currentlyPickedDestinationDeviceID;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)DMDAirPlayManager;
  v2 = -[DMDAirPlayManager init](&v7, "init");
  v3 = v2;
  if (v2)
  {
    currentlyPickedDestinationName = v2->_currentlyPickedDestinationName;
    v2->_currentlyPickedDestinationName = 0;

    currentlyPickedDestinationDeviceID = v3->_currentlyPickedDestinationDeviceID;
    v3->_currentlyPickedDestinationDeviceID = 0;

  }
  return v3;
}

- (BOOL)startAirPlaySessionWithDestinationName:(id)a3 destinationDeviceID:(id)a4 password:(id)a5 scanWaitTime:(double)a6 sessionType:(unint64_t)a7 force:(BOOL)a8 error:(id *)a9
{
  _BOOL4 v10;
  unint64_t v17;
  unint64_t v18;
  id v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  unsigned __int8 v27;
  void *v28;
  id v29;
  id *v30;
  void *v31;
  unsigned __int8 v32;
  BOOL v33;
  uint64_t v34;
  uint64_t *v35;
  id *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  uint64_t *v47;
  unint64_t v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;

  v10 = a8;
  v17 = (unint64_t)a3;
  v18 = (unint64_t)a4;
  v19 = a5;
  if (!(v17 | v18))
  {
    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DMDAirPlayManager.m"), 72, CFSTR("must provide a destination name or deviceID"));

  }
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = sub_100011724;
  v55 = sub_100011734;
  v56 = 0;
  v20 = 10.0;
  if (a6 >= 10.0)
  {
    v20 = a6;
    if (a6 > 500.0)
      v20 = 500.0;
  }
  if (-[DMDAirPlayManager _outputContextForSessionType:](self, "_outputContextForSessionType:", a7))
  {
    v21 = (void *)MRAVOutputContextCopyOutputDevices();
    if (objc_msgSend(v21, "count"))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v23 = (void *)MRAVOutputDeviceCopyName();
      -[DMDAirPlayManager setCurrentlyPickedDestinationName:](self, "setCurrentlyPickedDestinationName:", v23);

      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "firstObject"));
      v25 = (void *)MRAVOutputDeviceCopyUniqueIdentifier();
      -[DMDAirPlayManager setCurrentlyPickedDestinationDeviceID:](self, "setCurrentlyPickedDestinationDeviceID:", v25);

    }
    else
    {
      -[DMDAirPlayManager setCurrentlyPickedDestinationDeviceID:](self, "setCurrentlyPickedDestinationDeviceID:", 0);
      -[DMDAirPlayManager setCurrentlyPickedDestinationName:](self, "setCurrentlyPickedDestinationName:", 0);
    }

  }
  self->mDeviceIDIsMAC = 0;
  if (v18)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager currentlyPickedDestinationDeviceID](self, "currentlyPickedDestinationDeviceID"));
    v27 = objc_msgSend(v26, "isEqualToString:", v18);

    if ((v27 & 1) != 0)
    {
      v28 = 0;
LABEL_20:
      v33 = 1;
      goto LABEL_26;
    }
    if (objc_msgSend((id)v18, "containsString:", CFSTR(":")))
    {
      self->mDeviceIDIsMAC = 1;
      v29 = (id)v18;

      v28 = 0;
      v17 = (unint64_t)v29;
    }
    else
    {
      v30 = (id *)(v52 + 5);
      obj = (id)v52[5];
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager _discoverDeviceWithDestinationDeviceID:scanWaitTime:error:](self, "_discoverDeviceWithDestinationDeviceID:scanWaitTime:error:", v18, &obj, v20));
      objc_storeStrong(v30, obj);
      if (!v17)
        goto LABEL_22;
    }
  }
  else
  {
    v28 = 0;
    if (!v17)
      goto LABEL_22;
  }
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager currentlyPickedDestinationName](self, "currentlyPickedDestinationName"));
  v32 = objc_msgSend(v31, "isEqualToString:", v17);

  if ((v32 & 1) != 0)
    goto LABEL_20;
  v34 = objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager _discoverDeviceWithDestinationName:scanWaitTime:sessionType:](self, "_discoverDeviceWithDestinationName:scanWaitTime:sessionType:", v17, a7, v20));

  v28 = (void *)v34;
LABEL_22:
  if (!v52[5])
  {
    if (objc_msgSend(v28, "count"))
    {
      if (v10)
      {
        v37 = (id *)(v52 + 5);
        v49 = (id)v52[5];
        -[DMDAirPlayManager _setOutputDevices:forSessionType:password:error:](self, "_setOutputDevices:forSessionType:password:error:", v28, a7, v19, &v49);
        objc_storeStrong(v37, v49);
      }
      else
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectAtIndexedSubscript:", 0));
        v42 = (void *)MRAVOutputDeviceCopyName();
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10001173C;
        v44[3] = &unk_1000B9C58;
        v44[4] = self;
        v45 = v28;
        v48 = a7;
        v46 = v19;
        v47 = &v51;
        -[DMDAirPlayManager _promptUserToMirrorOnDisplayNamed:withCompletion:](self, "_promptUserToMirrorOnDisplayNamed:withCompletion:", v42, v44);

      }
    }
    else
    {
      v38 = DMFErrorWithCodeAndUserInfo(1301, 0);
      v39 = objc_claimAutoreleasedReturnValue(v38);
      v40 = (void *)v52[5];
      v52[5] = v39;

    }
  }
  v35 = v52;
  if (a9)
  {
    *a9 = objc_retainAutorelease((id)v52[5]);
    v35 = v52;
  }
  v33 = v35[5] == 0;
LABEL_26:

  _Block_object_dispose(&v51, 8);
  return v33;
}

- (BOOL)stopAirPlaySessionOfType:(unint64_t)a3 error:(id *)a4
{
  return -[DMDAirPlayManager _setOutputDevices:forSessionType:password:error:](self, "_setOutputDevices:forSessionType:password:error:", 0, a3, 0, a4);
}

- (void)_outputContextForSessionType:(unint64_t)a3
{
  switch(a3)
  {
    case 3uLL:
      return (void *)MRAVOutputContextGetSharedSystemScreenContext(self, a2);
    case 2uLL:
      return (void *)MRAVOutputContextGetSharedSystemAudioContext(self, a2);
    case 1uLL:
      return (void *)MRAVOutputContextGetSharedAudioPresentationContext(self, a2);
  }
  return 0;
}

- (BOOL)_setOutputDevices:(id)a3 forSessionType:(unint64_t)a4 password:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  SEL v15;
  void *v16;
  NSNumber *v17;
  void *v18;
  SEL v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  SEL v25;

  v10 = a3;
  v11 = a5;
  v12 = -[DMDAirPlayManager _outputContextForSessionType:](self, "_outputContextForSessionType:", a4);
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = v13;
  if (v11)
    -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v11, CFSTR("AVOutputContextSetOutputDevicePasswordKey"));
  if (!v12)
  {
    v23 = DMFErrorWithCodeAndUserInfo(1302, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    if (!a6)
      goto LABEL_15;
    goto LABEL_14;
  }
  v15 = NSSelectorFromString(CFSTR("avOutputContext"));
  if ((objc_opt_respondsToSelector(v12, v15) & 1) != 0)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "valueForKey:", CFSTR("avOutputContext")));
    v17 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", getpid());
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    objc_msgSend(v16, "setValue:forKey:", v18, CFSTR("applicationProcessID"));

    v19 = NSSelectorFromString(CFSTR("avOutputDevice"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
    LOBYTE(v19) = objc_opt_respondsToSelector(v20, v19);

    if ((v19 & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "valueForKey:", CFSTR("avOutputDevice")));

    }
    else
    {
      v22 = 0;
    }
    v25 = NSSelectorFromString(CFSTR("setOutputDevice:options:"));
    if ((objc_opt_respondsToSelector(v16, v25) & 1) != 0)
      ((void (*)(void *, SEL, void *, NSMutableDictionary *))objc_msgSend(v16, "methodForSelector:", v25))(v16, v25, v22, v14);

  }
  v24 = 0;
  if (a6)
LABEL_14:
    *a6 = objc_retainAutorelease(v24);
LABEL_15:

  return v24 == 0;
}

- (void)_promptUserToMirrorOnDisplayNamed:(id)a3 withCompletion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSBundle *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSBundle *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSBundle *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  DMDUserNotification *v22;

  v6 = a4;
  v7 = a3;
  v22 = objc_opt_new(DMDUserNotification);
  v9 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("AirPlay"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setHeader:](v22, "setHeader:", v11);

  v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v12));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Display"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setDefaultButtonTitle:](v22, "setDefaultButtonTitle:", v15);

  v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v16));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_1000BC2E0, CFSTR("DMFNotifications")));
  -[DMDUserNotification setAlternateButtonTitle:](v22, "setAlternateButtonTitle:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[DMDAirPlayManager _messageForAirPlayPromptOnDisplayNamed:](self, "_messageForAirPlayPromptOnDisplayNamed:", v7));
  -[DMDUserNotification setMessage:](v22, "setMessage:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[DMDUserNotificationController sharedController](DMDUserNotificationController, "sharedController"));
  objc_msgSend(v21, "showNotification:completion:", v22, v6);

}

- (id)_messageForAirPlayPromptOnDisplayNamed:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSBundle *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  NSBundle *v12;
  NSBundle *v13;
  NSBundle *v14;
  NSBundle *v15;
  NSBundle *v16;
  NSBundle *v17;
  void *v18;
  void *v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DMDDeviceController shared](DMDDeviceController, "shared"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deviceType"));
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  switch((unint64_t)v6)
  {
    case 1uLL:
      v8 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v10 = v9;
      v11 = CFSTR("Would you like to display your iPhone's screen on “%@”?");
      break;
    case 2uLL:
      v12 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v10 = v9;
      v11 = CFSTR("Would you like to display your iPod's screen on “%@”?");
      break;
    case 3uLL:
      v13 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v10 = v9;
      v11 = CFSTR("Would you like to display your iPad's screen on “%@”?");
      break;
    case 4uLL:
      v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v14);
      v10 = v9;
      v11 = CFSTR("Would you like to display your Apple TV's output on “%@”?");
      break;
    case 7uLL:
      v16 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v16);
      v10 = v9;
      v11 = CFSTR("Would you like to display your Mac's screen on “%@”?");
      break;
    case 8uLL:
      v17 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v17);
      v10 = v9;
      v11 = CFSTR("Would you like to display your Apple Vision Pro's screen on “%@”?");
      break;
    default:
      v15 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(DMFConnection, v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v15);
      v10 = v9;
      v11 = CFSTR("Would you like to display your device's screen on “%@”?");
      break;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_1000BC2E0, CFSTR("DMFNotifications")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v3));

  return v19;
}

- (id)_discoverDeviceWithDestinationDeviceID:(id)a3 scanWaitTime:(double)a4 error:(id *)a5
{
  id v7;
  const void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD block[4];
  NSObject *v15;
  uint64_t *v16;
  uint64_t *v17;
  const void *v18;
  double v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  id v30;

  v7 = a3;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_100011724;
  v28 = sub_100011734;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v30 = v7;
  v8 = (const void *)MRAVReconnaissanceSessionCreateWithEndpointFeatures(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v30, 1), 2);
  MRAVReconnaissanceSessionSetUseWeakMatching(v8, 1);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100011FE4;
  block[3] = &unk_1000B9CA8;
  v19 = a4;
  v16 = &v20;
  v17 = &v24;
  v18 = v8;
  v9 = dispatch_semaphore_create(0);
  v15 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  CFRelease(v8);
  v10 = (void *)v21[3];
  if (a5)
    *a5 = objc_retainAutorelease((id)v25[5]);
  v11 = v15;
  v12 = v10;

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v12;
}

- (id)_discoverDeviceWithDestinationName:(id)a3 scanWaitTime:(double)a4 sessionType:(unint64_t)a5
{
  id v8;
  uint64_t v9;
  const void *v10;
  dispatch_semaphore_t v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  dispatch_time_t v15;
  id v16;
  _QWORD v18[5];
  id v19;
  NSObject *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a3;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = sub_100011724;
  v26 = sub_100011734;
  v27 = 0;
  if (a5 == 3)
    v9 = 2;
  else
    v9 = 1;
  v10 = (const void *)MRAVRoutingDiscoverySessionCreate(v9);
  MRAVRoutingDiscoverySessionSetDiscoveryMode(v10, 3);
  v11 = dispatch_semaphore_create(0);
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000122D8;
  v18[3] = &unk_1000B9CD0;
  v18[4] = self;
  v12 = v8;
  v19 = v12;
  v21 = &v22;
  v13 = v11;
  v20 = v13;
  v14 = MRAVRoutingDiscoverySessionAddOutputDevicesChangedCallback(v10, v18);
  v15 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_semaphore_wait(v13, v15);
  if (v14)
    MRAVRoutingDiscoverySessionRemoveOutputDevicesChangedCallback(v10, v14);
  CFRelease(v10);
  v16 = (id)v23[5];

  _Block_object_dispose(&v22, 8);
  return v16;
}

- (NSString)currentlyPickedDestinationName
{
  return self->_currentlyPickedDestinationName;
}

- (void)setCurrentlyPickedDestinationName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)currentlyPickedDestinationDeviceID
{
  return self->_currentlyPickedDestinationDeviceID;
}

- (void)setCurrentlyPickedDestinationDeviceID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentlyPickedDestinationDeviceID, 0);
  objc_storeStrong((id *)&self->_currentlyPickedDestinationName, 0);
}

@end
