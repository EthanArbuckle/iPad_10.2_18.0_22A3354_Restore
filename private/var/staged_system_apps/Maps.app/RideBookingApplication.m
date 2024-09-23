@implementation RideBookingApplication

- (RideBookingApplication)initWithExtension:(id)a3
{
  id v5;
  RideBookingApplication *v6;
  RideBookingApplication *v7;
  void *v8;
  NSString *v9;
  NSString *identifier;
  NSString *v11;
  void *v12;
  uint64_t v13;
  NSString *version;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *queue;
  id v19;
  void *v20;
  uint64_t v21;
  MapsSuggestionsAppGuardian *appGuardian;
  objc_super v24;

  v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)RideBookingApplication;
  v6 = -[RideBookingApplication init](&v24, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_extension, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_containingAppIdentifer"));
    v9 = (NSString *)objc_msgSend(v8, "copy");
    identifier = v7->_identifier;
    v7->_identifier = v9;

    v11 = v7->_identifier;
    if (v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v11, 0, 0));
    else
      v12 = 0;
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleVersion"));
    version = v7->_version;
    v7->_version = (NSString *)v13;

    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_create("RideBookingApplication", v16);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v17;

    v19 = sub_100B3A5D4();
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "oneAppGuardian"));
    appGuardian = v7->_appGuardian;
    v7->_appGuardian = (MapsSuggestionsAppGuardian *)v21;

    -[MapsSuggestionsAppGuardian registerAppTracker:](v7->_appGuardian, "registerAppTracker:", v7);
  }

  return v7;
}

- (NSString)description
{
  NSString *identifier;
  void *v4;
  void *v5;

  identifier = self->_identifier;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication name](self, "name"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Pointer: %p, Identifier: %@, Name: %@"), self, identifier, v4));

  return (NSString *)v5;
}

- (void)enableForUse
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingApplication extension](self, "extension"));
  objc_msgSend(v2, "_setEnabled:error:", 1, 0);

}

- (BOOL)enabled
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication extension](self, "extension"));
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (NSString)name
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));

  if (!v3
    || (v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v4, 0, 0)), v4, v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedName")), v7 = objc_msgSend(v6, "copy"), v6, v5, !v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication extension](self, "extension"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));
    v7 = objc_msgSend(v9, "copy");

  }
  return (NSString *)v7;
}

- (id)_connectionWithIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
  objc_msgSend(v4, "_setLaunchId:", v5);

  v6 = objc_msgSend(objc_alloc((Class)INCExtensionConnection), "initWithIntent:", v4);
  objc_msgSend(v6, "setRequiresTCC:", 0);
  return v6;
}

- (void)getRideOptionStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t Log;
  NSObject *v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  int v18;
  NSObject *queue;
  uint64_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  char *v27;
  uint64_t v28;
  NSObject *v29;
  id v30;
  _QWORD v31[4];
  id v32;
  id v33;
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  _BYTE v42[14];
  __int16 v43;
  const char *v44;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v14 = objc_alloc((Class)NSString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ handling ListRideOptions"), v15);
      *(_DWORD *)buf = 136315394;
      v40 = v13;
      v41 = 2112;
      *(_QWORD *)v42 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
    v18 = isExtensionLocked();

    if (v18)
    {
      queue = self->_queue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10037D974;
      block[3] = &unk_1011B0520;
      objc_copyWeak(&v37, &location);
      v36 = v10;
      dispatch_async(queue, block);

      objc_destroyWeak(&v37);
    }
    else
    {
      v22 = objc_msgSend(objc_alloc((Class)INListRideOptionsIntent), "initWithPickupLocation:dropOffLocation:", v8, v9);
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v22));
      v24 = MapsSuggestionsLoggingSubsystem;
      v25 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
      v26 = (id)objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        v27 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
        *(_DWORD *)buf = 138412546;
        v40 = v27;
        v41 = 2080;
        *(_QWORD *)v42 = "listRideOptions_resumeWithCompletionHandler";
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

      }
      v28 = GEOFindOrCreateLog(v24, "RideBookingApplication");
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_signpost_enabled(v29))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v29, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "listRideOptions_resumeWithCompletionHandler", ", buf, 2u);
      }

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10037DAB0;
      v31[3] = &unk_1011B33E8;
      objc_copyWeak(&v34, &location);
      v33 = v10;
      v30 = v23;
      v32 = v30;
      objc_msgSend(v30, "resumeWithCompletionHandler:", v31);

      objc_destroyWeak(&v34);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    v20 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v40 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v41 = 1024;
      *(_DWORD *)v42 = 137;
      *(_WORD *)&v42[4] = 2082;
      *(_QWORD *)&v42[6] = "-[RideBookingApplication getRideOptionStatusWithPickupLocation:dropOffLocation:completion:]";
      v43 = 2082;
      v44 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }

  }
}

- (void)getRequestRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  uint64_t Log;
  NSObject *v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  id v28;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id location;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  const char *v46;

  v10 = a3;
  v32 = a4;
  v11 = a5;
  v12 = a6;
  if (v12)
  {
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "name"));
    v30 = objc_msgSend(objc_alloc((Class)INSpeakableString), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v13, v13, v13);
    v14 = objc_msgSend(objc_alloc((Class)INRequestRideIntent), "initWithPickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:", v10, v32, v30, 0, 0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v14));
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v16 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v18 = objc_alloc((Class)NSString);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v20 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@ confirming RequestRide: %@"), v19, v14);
      *(_DWORD *)buf = 136315394;
      v42 = v17;
      v43 = 2112;
      *(_QWORD *)v44 = v20;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    v21 = MapsSuggestionsLoggingSubsystem;
    v22 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v23 = (id)objc_claimAutoreleasedReturnValue(v22);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      v24 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v42 = v24;
      v43 = 2080;
      *(_QWORD *)v44 = "requestRideStatus_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v25 = GEOFindOrCreateLog(v21, "RideBookingApplication");
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_signpost_enabled(v26))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v26, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "requestRideStatus_resumeWithCompletionHandler", ", buf, 2u);
    }

    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_10037EB30;
    v33[3] = &unk_1011B3460;
    objc_copyWeak(&v39, &location);
    v38 = v12;
    v34 = v10;
    v27 = v14;
    v35 = v27;
    v36 = v11;
    v28 = v31;
    v37 = v28;
    objc_msgSend(v28, "resumeWithCompletionHandler:", v33);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);

  }
  else
  {
    v29 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v13 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v42 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v43 = 1024;
      *(_DWORD *)v44 = 200;
      *(_WORD *)&v44[4] = 2082;
      *(_QWORD *)&v44[6] = "-[RideBookingApplication getRequestRideStatusWithPickupLocation:dropOffLocation:rideOption:completion:]";
      v45 = 2082;
      v46 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)getRideStatusWithPickupLocation:(id)a3 dropOffLocation:(id)a4 rideOption:(id)a5 partySize:(unint64_t)a6 paymentMethod:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t Log;
  NSObject *v24;
  char *v25;
  id v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  char *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id location;
  uint8_t buf[4];
  const char *v45;
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  const char *v49;

  v38 = a3;
  v39 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a8;
  v37 = v14;
  if (v16)
  {
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));
    v36 = objc_msgSend(objc_alloc((Class)INSpeakableString), "initWithVocabularyIdentifier:spokenPhrase:pronunciationHint:", v17, v17, v17);
    v18 = objc_alloc((Class)INRequestRideIntent);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a6));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "intentsPaymentMethod"));
    v21 = objc_msgSend(v18, "initWithPickupLocation:dropOffLocation:rideOptionName:partySize:paymentMethod:scheduledPickupTime:", v38, v39, v36, v19, v20, 0);

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v21));
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v24 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v26 = objc_alloc((Class)NSString);
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v28 = objc_msgSend(v26, "initWithFormat:", CFSTR("%@ handling RequestRide: %@"), v27, v21);
      *(_DWORD *)buf = 136315394;
      v45 = v25;
      v46 = 2112;
      *(_QWORD *)v47 = v28;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    v29 = MapsSuggestionsLoggingSubsystem;
    v30 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v31 = (id)objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      v32 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v45 = v32;
      v46 = 2080;
      *(_QWORD *)v47 = "getRideStatus_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v33 = GEOFindOrCreateLog(v29, "RideBookingApplication");
    v34 = objc_claimAutoreleasedReturnValue(v33);
    if (os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getRideStatus_resumeWithCompletionHandler", ", buf, 2u);
    }

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_10037FDD4;
    v40[3] = &unk_1011B34D8;
    objc_copyWeak(&v42, &location);
    v41 = v16;
    objc_msgSend(v22, "resumeWithCompletionHandler:", v40);

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);

  }
  else
  {
    v35 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v17 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v45 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v46 = 1024;
      *(_DWORD *)v47 = 278;
      *(_WORD *)&v47[4] = 2082;
      *(_QWORD *)&v47[6] = "-[RideBookingApplication getRideStatusWithPickupLocation:dropOffLocation:rideOption:partySize"
                           ":paymentMethod:completion:]";
      v48 = 2082;
      v49 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)getRideStatusWithCompletion:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  void *v9;
  id v10;
  INGetRideStatusIntent *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  char *v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  _BYTE v27[14];
  __int16 v28;
  const char *v29;

  v4 = a3;
  if (v4)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v6 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v8 = objc_alloc((Class)NSString);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v10 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@ handling GetRideStatus"), v9);
      *(_DWORD *)buf = 136315394;
      v25 = v7;
      v26 = 2112;
      *(_QWORD *)v27 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v11 = objc_opt_new(INGetRideStatusIntent);
    v12 = objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v11));

    objc_initWeak(&location, self);
    v13 = MapsSuggestionsLoggingSubsystem;
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v15 = (id)objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v16 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v25 = v16;
      v26 = 2080;
      *(_QWORD *)v27 = "getRideStatusWithCompletion_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v17 = GEOFindOrCreateLog(v13, "RideBookingApplication");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v18, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "getRideStatusWithCompletion_resumeWithCompletionHandler", ", buf, 2u);
    }

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100380E1C;
    v20[3] = &unk_1011B34D8;
    objc_copyWeak(&v22, &location);
    v21 = v4;
    -[NSObject resumeWithCompletionHandler:](v12, "resumeWithCompletionHandler:", v20);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  else
  {
    v19 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v12 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v26 = 1024;
      *(_DWORD *)v27 = 343;
      *(_WORD *)&v27[4] = 2082;
      *(_QWORD *)&v27[6] = "-[RideBookingApplication getRideStatusWithCompletion:]";
      v28 = 2082;
      v29 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)startUpdates
{
  uint64_t Log;
  NSObject *v4;
  char *v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  INGetRideStatusIntent *v10;
  INCExtensionConnection *v11;
  INCExtensionConnection *getRideStatusConnection;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  INCExtensionConnection *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  const char *v27;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
    v6 = objc_alloc((Class)NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
    v8 = (char *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ starting updates"), v7);
    *(_DWORD *)buf = 136315394;
    v25 = v5;
    v26 = 2112;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (!self->_getRideStatusConnection)
  {
    v9 = objc_alloc((Class)INCExtensionConnection);
    v10 = objc_opt_new(INGetRideStatusIntent);
    v11 = (INCExtensionConnection *)objc_msgSend(v9, "initWithIntent:", v10);
    getRideStatusConnection = self->_getRideStatusConnection;
    self->_getRideStatusConnection = v11;

    -[INCExtensionConnection setRequiresTCC:](self->_getRideStatusConnection, "setRequiresTCC:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[INCExtensionConnection intent](self->_getRideStatusConnection, "intent"));
    objc_msgSend(v14, "_setLaunchId:", v13);

  }
  v15 = MapsSuggestionsLoggingSubsystem;
  v16 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
    *(_DWORD *)buf = 138412546;
    v25 = v18;
    v26 = 2080;
    v27 = "startGetRideStatusUpdates_resumeWithCompletionHandler";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  v19 = GEOFindOrCreateLog(v15, "RideBookingApplication");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "startGetRideStatusUpdates_resumeWithCompletionHandler", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v21 = self->_getRideStatusConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100381DE8;
  v22[3] = &unk_1011B3528;
  objc_copyWeak(&v23, (id *)buf);
  -[INCExtensionConnection resumeWithCompletionHandler:](v21, "resumeWithCompletionHandler:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)stopUpdates
{
  uint64_t Log;
  NSObject *v4;
  char *v5;
  id v6;
  void *v7;
  char *v8;
  id v9;
  INGetRideStatusIntent *v10;
  INCExtensionConnection *v11;
  INCExtensionConnection *getRideStatusConnection;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  uint64_t v19;
  NSObject *v20;
  INCExtensionConnection *v21;
  _QWORD v22[4];
  id v23;
  uint8_t buf[4];
  char *v25;
  __int16 v26;
  const char *v27;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
    v6 = objc_alloc((Class)NSString);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
    v8 = (char *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@ stopping updates"), v7);
    *(_DWORD *)buf = 136315394;
    v25 = v5;
    v26 = 2112;
    v27 = v8;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (!self->_getRideStatusConnection)
  {
    v9 = objc_alloc((Class)INCExtensionConnection);
    v10 = objc_opt_new(INGetRideStatusIntent);
    v11 = (INCExtensionConnection *)objc_msgSend(v9, "initWithIntent:", v10);
    getRideStatusConnection = self->_getRideStatusConnection;
    self->_getRideStatusConnection = v11;

    -[INCExtensionConnection setRequiresTCC:](self->_getRideStatusConnection, "setRequiresTCC:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[INCExtensionConnection intent](self->_getRideStatusConnection, "intent"));
    objc_msgSend(v14, "_setLaunchId:", v13);

  }
  v15 = MapsSuggestionsLoggingSubsystem;
  v16 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
    *(_DWORD *)buf = 138412546;
    v25 = v18;
    v26 = 2080;
    v27 = "stopGetRideStatusUpdates_resumeWithCompletionHandler";
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

  }
  v19 = GEOFindOrCreateLog(v15, "RideBookingApplication");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "stopGetRideStatusUpdates_resumeWithCompletionHandler", ", buf, 2u);
  }

  objc_initWeak((id *)buf, self);
  v21 = self->_getRideStatusConnection;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10038233C;
  v22[3] = &unk_1011B3528;
  objc_copyWeak(&v23, (id *)buf);
  -[INCExtensionConnection resumeWithCompletionHandler:](v21, "resumeWithCompletionHandler:", v22);
  objc_destroyWeak(&v23);
  objc_destroyWeak((id *)buf);
}

- (void)intentResponseDidUpdate:(id)a3 withSerializedCacheItems:(id)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v8[4];
  id v9;
  RideBookingApplication *v10;
  id v11;
  id location;

  v5 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100382608;
  v8[3] = &unk_1011AFF10;
  objc_copyWeak(&v11, &location);
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(queue, v8);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  uint64_t Log;
  NSObject *v25;
  char *v26;
  id v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id location;
  uint8_t buf[4];
  const char *v42;
  __int16 v43;
  _BYTE v44[14];
  __int16 v45;
  const char *v46;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v36 = v10;
  if (v13)
  {
    v14 = objc_alloc((Class)INSendRideFeedbackIntent);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "identifier"));
    v16 = objc_msgSend(v14, "initWithRideIdentifier:", v15);

    if (v11)
    {
      -[NSObject setRating:](v16, "setRating:", v11);
      if (!v12)
        goto LABEL_9;
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject rating](v16, "rating"));
      -[NSObject setRating:](v16, "setRating:", v18);

      if (!v12)
      {
LABEL_9:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v16));
        Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
        v25 = objc_claimAutoreleasedReturnValue(Log);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
          v27 = objc_alloc((Class)NSString);
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
          v29 = objc_msgSend(v27, "initWithFormat:", CFSTR("%@ handling SendRideFeeback: %@"), v28, v16, v36);
          *(_DWORD *)buf = 136315394;
          v42 = v26;
          v43 = 2112;
          *(_QWORD *)v44 = v29;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

        }
        objc_initWeak(&location, self);
        v30 = MapsSuggestionsLoggingSubsystem;
        v31 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
        v32 = (id)objc_claimAutoreleasedReturnValue(v31);
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          v33 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
          *(_DWORD *)buf = 138412546;
          v42 = v33;
          v43 = 2080;
          *(_QWORD *)v44 = "sendFeedbackForRide_resumeWithCompletionHandler";
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

        }
        v34 = GEOFindOrCreateLog(v30, "RideBookingApplication");
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (os_signpost_enabled(v35))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "sendFeedbackForRide_resumeWithCompletionHandler", ", buf, 2u);
        }

        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_100382D24;
        v37[3] = &unk_1011B34D8;
        objc_copyWeak(&v39, &location);
        v38 = v13;
        objc_msgSend(v23, "resumeWithCompletionHandler:", v37);

        objc_destroyWeak(&v39);
        objc_destroyWeak(&location);

        goto LABEL_16;
      }
    }
    v19 = objc_alloc((Class)INCurrencyAmount);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "amount"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "currencyCode"));
    v22 = objc_msgSend(v19, "initWithAmount:currencyCode:", v20, v21);
    -[NSObject setTip:](v16, "setTip:", v22);

    goto LABEL_9;
  }
  v17 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
  v16 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136446978;
    v42 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
    v43 = 1024;
    *(_DWORD *)v44 = 465;
    *(_WORD *)&v44[4] = 2082;
    *(_QWORD *)&v44[6] = "-[RideBookingApplication sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
    v45 = 2082;
    v46 = "nil == (completion)";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
  }
LABEL_16:

}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t Log;
  NSObject *v13;
  char *v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  const char *v36;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc((Class)INCancelRideIntent);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v10 = objc_msgSend(v8, "initWithRideIdentifier:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v10));
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v13 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v15 = objc_alloc((Class)NSString);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v17 = objc_msgSend(v15, "initWithFormat:", CFSTR("%@ confirming CancelRide: %@"), v16, v10);
      *(_DWORD *)buf = 136315394;
      v32 = v14;
      v33 = 2112;
      *(_QWORD *)v34 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak(&location, self);
    v18 = MapsSuggestionsLoggingSubsystem;
    v19 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      v33 = 2080;
      *(_QWORD *)v34 = "checkIfCanCancelRide_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v22 = GEOFindOrCreateLog(v18, "RideBookingApplication");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "checkIfCanCancelRide_resumeWithCompletionHandler", ", buf, 2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100383CA0;
    v26[3] = &unk_1011B33E8;
    objc_copyWeak(&v29, &location);
    v28 = v7;
    v24 = v11;
    v27 = v24;
    objc_msgSend(v24, "resumeWithCompletionHandler:", v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    v25 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v33 = 1024;
      *(_DWORD *)v34 = 522;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[RideBookingApplication checkIfCanCancelRideWithRideStatus:completion:]";
      v35 = 2082;
      v36 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint64_t Log;
  NSObject *v12;
  char *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id location;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  const char *v36;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = objc_alloc((Class)INCancelRideIntent);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
    v10 = objc_msgSend(v8, "initWithRideIdentifier:", v9);

    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v12 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
      v14 = objc_alloc((Class)NSString);
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
      v16 = objc_msgSend(v14, "initWithFormat:", CFSTR("%@ handling CancelRide: %@"), v15, v10);
      *(_DWORD *)buf = 136315394;
      v32 = v13;
      v33 = 2112;
      *(_QWORD *)v34 = v16;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _connectionWithIntent:](self, "_connectionWithIntent:", v10));
    objc_initWeak(&location, self);
    v18 = MapsSuggestionsLoggingSubsystem;
    v19 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v20 = (id)objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      v21 = (char *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication uniqueName](self, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v32 = v21;
      v33 = 2080;
      *(_QWORD *)v34 = "cancelRide_resumeWithCompletionHandler";
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s BEGIN", buf, 0x16u);

    }
    v22 = GEOFindOrCreateLog(v18, "RideBookingApplication");
    v23 = objc_claimAutoreleasedReturnValue(v22);
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "cancelRide_resumeWithCompletionHandler", ", buf, 2u);
    }

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_100384E48;
    v26[3] = &unk_1011B33E8;
    objc_copyWeak(&v29, &location);
    v28 = v7;
    v24 = v17;
    v27 = v24;
    objc_msgSend(v24, "resumeWithCompletionHandler:", v26);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

  }
  else
  {
    v25 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v33 = 1024;
      *(_DWORD *)v34 = 590;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[RideBookingApplication cancelRideWithRideStatus:completion:]";
      v35 = 2082;
      v36 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)openWithActivity:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100385BA8;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (id)_passengersChoiceFromAvailablePartySizeOptions:(id)a3 optionPriceRange:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100385F30;
    v9[3] = &unk_1011B35C8;
    v10 = v5;
    v7 = sub_10039DCD4(a3, v9);
    a3 = (id)objc_claimAutoreleasedReturnValue(v7);

  }
  return a3;
}

- (id)_statusWithGetRideStatusIntentResponse:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RideBookingRideOption *v11;
  void *v12;
  void *v13;
  RideBookingRideOption *v14;
  void *v15;
  void *v16;
  id v17;
  RideBookingApplication *v18;
  void *v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  RideBookingRideStatus *v24;
  unsigned int v26;
  RideBookingRideStatus *v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "code");
  if (v5 > 7)
    v29 = 0;
  else
    v29 = qword_100E35398[v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rideOption"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "availablePartySizeOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "priceRange"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:](self, "_passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:", v9, v10));

  v11 = [RideBookingRideOption alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "estimatedPickupDate"));
  v14 = -[RideBookingRideOption initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:](v11, "initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:", self, v12, &__NSArray0__struct, v13, v28);

  -[RideBookingRideOption setIntentsRideOption:](v14, "setIntentsRideOption:", v7);
  v27 = [RideBookingRideStatus alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionStatus"));
  v26 = objc_msgSend(v15, "isCanceled");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionStatus"));
  v17 = objc_msgSend(v16, "isCanceledByService");
  v18 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivityForCancelingInApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rideIdentifier"));
  v21 = (char *)objc_msgSend(v8, "phase");
  if ((unint64_t)(v21 - 1) >= 6)
    v22 = 0;
  else
    v22 = v21;
  v23 = 3;
  if (v4)
    v23 = v29;
  v24 = -[RideBookingRideStatus initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:](v27, "initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:", v18, v14, v26, v17, v19, v20, v22, v23);

  -[RideBookingRideStatus setIntentsRideStatus:](v24, "setIntentsRideStatus:", v8);
  -[RideBookingRideStatus setGetRideStatusIntentResponse:](v24, "setGetRideStatusIntentResponse:", v4);

  return v24;
}

- (id)_statusWithRequestRideStatusIntentResponse:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  RideBookingRideOption *v11;
  void *v12;
  void *v13;
  RideBookingRideOption *v14;
  void *v15;
  void *v16;
  id v17;
  RideBookingApplication *v18;
  void *v19;
  void *v20;
  char *v21;
  char *v22;
  uint64_t v23;
  RideBookingRideStatus *v24;
  unsigned int v26;
  RideBookingRideStatus *v27;
  void *v28;
  uint64_t v29;

  v4 = a3;
  v5 = (unint64_t)objc_msgSend(v4, "code");
  if (v5 > 0xA)
    v29 = 0;
  else
    v29 = qword_100E353D8[v5];
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideStatus"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "rideOption"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "rideStatus"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "availablePartySizeOptions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "priceRange"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:](self, "_passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:", v9, v10));

  v11 = [RideBookingRideOption alloc];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "estimatedPickupDate"));
  v14 = -[RideBookingRideOption initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:](v11, "initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:", self, v12, &__NSArray0__struct, v13, v28);

  -[RideBookingRideOption setIntentsRideOption:](v14, "setIntentsRideOption:", v7);
  v27 = [RideBookingRideStatus alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionStatus"));
  v26 = objc_msgSend(v15, "isCanceled");
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "completionStatus"));
  v17 = objc_msgSend(v16, "isCanceledByService");
  v18 = self;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userActivityForCancelingInApplication"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "rideIdentifier"));
  v21 = (char *)objc_msgSend(v8, "phase");
  if ((unint64_t)(v21 - 1) >= 6)
    v22 = 0;
  else
    v22 = v21;
  v23 = 3;
  if (v4)
    v23 = v29;
  v24 = -[RideBookingRideStatus initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:](v27, "initWithApplication:rideOption:canceled:canceledByService:userActivityForCanceling:identifier:phase:error:", v18, v14, v26, v17, v19, v20, v22, v23);

  -[RideBookingRideStatus setIntentsRideStatus:](v24, "setIntentsRideStatus:", v8);
  -[RideBookingRideStatus setRequestRideIntentResponse:](v24, "setRequestRideIntentResponse:", v4);

  return v24;
}

- (id)_statusWithRideOption:(id)a3 requestRideIntent:(id)a4 requestRideEtaResponse:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  void *v16;
  uint64_t Log;
  NSObject *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  RideBookingApplication *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  RideBookingRideOption *v30;
  void *v31;
  void *v32;
  void *v33;
  RideBookingRideOption *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  void *v46;
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  int v50;
  __int16 v51;
  const char *v52;
  __int16 v53;
  const char *v54;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (!v8)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v18 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v49 = 1024;
      v50 = 878;
      v51 = 2082;
      v52 = "-[RideBookingApplication _statusWithRideOption:requestRideIntent:requestRideEtaResponse:]";
      v53 = 2082;
      v54 = "rideOption==nil";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. rideOption should not be nil";
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, v19, buf, 0x26u);
    }
LABEL_13:

    v21 = 0;
    goto LABEL_24;
  }
  if (!v9)
  {
    v20 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingApplication");
    v18 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m";
      v49 = 1024;
      v50 = 879;
      v51 = 2082;
      v52 = "-[RideBookingApplication _statusWithRideOption:requestRideIntent:requestRideEtaResponse:]";
      v53 = 2082;
      v54 = "requestRideIntent==nil";
      v19 = "At %{public}s:%d, %{public}s forbids: %{public}s. requestRideIntent should not be nil";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "code") == (id)1 || objc_msgSend(v11, "code") == (id)3)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideStatus"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "estimatedPickupDate"));
      v14 = objc_msgSend(v13, "copy");

      v46 = v14;
      if (v14)
      {
        objc_msgSend(v14, "timeIntervalSinceNow");
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", vcvtpd_u64_f64(v15 / 60.0)));
      }
      else
      {
        v16 = 0;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "rideStatus"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "rideOption"));

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
      if (objc_msgSend(v26, "length"))
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "estimatedPickupDate"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "availablePartySizeOptions"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "priceRange"));
          v44 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication _passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:](self, "_passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:", v28, v29));

          v30 = [RideBookingRideOption alloc];
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "name"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "paymentMethods"));
          v45 = v16;
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "estimatedPickupDate"));
          v34 = -[RideBookingRideOption initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:](v30, "initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:", self, v31, v32, v33, v44);

          -[RideBookingRideOption setIntentsRideOption:](v34, "setIntentsRideOption:", v25);
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickupLocation"));
          v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "location"));
          objc_msgSend(v36, "coordinate");
          v38 = v37;
          v40 = v39;
          v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickupLocation"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "dropOffLocation"));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRequestRideStatus statusWithApplication:rideOption:startingWaypointCoordinate:origin:destination:loadingRequestRideStatus:etaMinutesAtStartWaypoint:](RideBookingRequestRideStatus, "statusWithApplication:rideOption:startingWaypointCoordinate:origin:destination:loadingRequestRideStatus:etaMinutesAtStartWaypoint:", self, v34, v41, v42, 0, v45, v38, v40));

          v16 = v45;
LABEL_23:

          goto LABEL_24;
        }
      }
      else
      {

      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRequestRideStatus statusWithApplication:error:](RideBookingRequestRideStatus, "statusWithApplication:error:", self, 3));
      goto LABEL_23;
    }
    v22 = self;
    v23 = 2;
  }
  else
  {
    v22 = self;
    v23 = 3;
  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRequestRideStatus statusWithApplication:error:](RideBookingRequestRideStatus, "statusWithApplication:error:", v22, v23));
LABEL_24:

  return v21;
}

- (id)_statusWithListRideOptionsResponse:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  unsigned int v17;
  RideBookingPaymentMethod *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  _UNKNOWN **v25;
  void *j;
  void *v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  id v36;
  id v37;
  void *v38;
  uint64_t Log;
  char *v40;
  id v41;
  void *v42;
  void *v43;
  RideBookingRideOption *v44;
  void *v45;
  void *v46;
  RideBookingRideOption *v47;
  uint64_t v48;
  id v49;
  id v50;
  double v51;
  id v52;
  id v53;
  void *v54;
  uint64_t v56;
  char v57;
  void *v58;
  RideBookingApplication *v59;
  NSMutableArray *v60;
  uint64_t v61;
  uint64_t v62;
  unsigned int v63;
  NSMutableArray *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  uint8_t buf[4];
  char *v74;
  __int16 v75;
  id v76;
  _BYTE v77[128];
  _BYTE v78[128];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = objc_msgSend(v4, "code");
    v7 = 0;
    v8 = 1;
    v59 = self;
    switch((unint64_t)v6)
    {
      case 0uLL:
      case 4uLL:
        v8 = 0;
        v7 = 5;
        break;
      case 5uLL:
        v8 = 0;
        v7 = 6;
        break;
      case 6uLL:
        v8 = 0;
        v7 = 7;
        break;
      case 7uLL:
        v8 = 0;
        v7 = 8;
        break;
      case 8uLL:
        v8 = 0;
        v7 = 9;
        break;
      case 9uLL:
        v8 = 0;
        v7 = 10;
        break;
      case 0xAuLL:
        v8 = 0;
        v7 = 11;
        break;
      default:
        break;
    }
    v56 = v7;
    v57 = v8;
    v64 = objc_opt_new(NSMutableArray);
    v69 = 0u;
    v70 = 0u;
    v71 = 0u;
    v72 = 0u;
    v58 = v5;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "paymentMethods"));
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v70;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v70 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v15, "type") == (id)8)
          {
            v16 = (void *)objc_claimAutoreleasedReturnValue(+[PKPaymentRequest availableNetworks](PKPaymentRequest, "availableNetworks"));
            v17 = +[PKPaymentAuthorizationController canMakePaymentsUsingNetworks:](PKPaymentAuthorizationController, "canMakePaymentsUsingNetworks:", v16);

            if (!v17)
              continue;
          }
          v18 = objc_alloc_init(RideBookingPaymentMethod);
          -[RideBookingPaymentMethod setIntentsPaymentMethod:](v18, "setIntentsPaymentMethod:", v15);
          -[NSMutableArray addObject:](v64, "addObject:", v18);

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v69, v78, 16);
      }
      while (v12);
    }

    v60 = objc_opt_new(NSMutableArray);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "rideOptions"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "sortedArrayUsingComparator:", &stru_1011B3608));

    v67 = 0u;
    v68 = 0u;
    v65 = 0u;
    v66 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v66;
      v62 = DefaultLoggingSubsystem;
      v25 = MKPlaceCollectionsLogicController_ptr;
      v61 = *(_QWORD *)v66;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(_QWORD *)v66 != v24)
            objc_enumerationMutation(v21);
          v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)j);
          v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
          if (!-[NSObject length](v28, "length"))
            goto LABEL_35;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "estimatedPickupDate"));

          if (!v29)
            continue;
          v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "priceRange"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "minimumPrice"));
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25[331], "notANumber"));
          if (objc_msgSend(v31, "isEqualToNumber:", v32))
          {

LABEL_31:
            Log = GEOFindOrCreateLog(v62, "RideBooking");
            v28 = objc_claimAutoreleasedReturnValue(Log);
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              v40 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingApplication/RideBookingApplication.m");
              v41 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Skipping INRideOption because the pricing is malformed: %@"), v27);
              *(_DWORD *)buf = 136315394;
              v74 = v40;
              v75 = 2112;
              v76 = v41;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

            }
            goto LABEL_34;
          }
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "priceRange"));
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "maximumPrice"));
          v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25[331], "notANumber"));
          v36 = v23;
          v37 = v21;
          v38 = (void *)v35;
          v63 = objc_msgSend(v34, "isEqualToNumber:", v35);

          v21 = v37;
          v23 = v36;

          v24 = v61;
          if (v63)
            goto LABEL_31;
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "availablePartySizeOptions"));
          v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "priceRange"));
          v28 = objc_claimAutoreleasedReturnValue(-[RideBookingApplication _passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:](v59, "_passengersChoiceFromAvailablePartySizeOptions:optionPriceRange:", v42, v43));

          v44 = [RideBookingRideOption alloc];
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "name"));
          v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "estimatedPickupDate"));
          v47 = -[RideBookingRideOption initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:](v44, "initWithApplication:optionName:paymentMethods:estimatedPickupDate:passengersChoice:", v59, v45, v64, v46, v28);

          -[RideBookingRideOption setIntentsRideOption:](v47, "setIntentsRideOption:", v27);
          -[NSMutableArray addObject:](v60, "addObject:", v47);

LABEL_34:
          v25 = MKPlaceCollectionsLogicController_ptr;
LABEL_35:

        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v65, v77, 16);
      }
      while (v23);
    }

    if ((v57 & (-[NSMutableArray count](v60, "count") == 0)) != 0)
      v48 = 3;
    else
      v48 = v56;
    v5 = v58;
    v49 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "expirationDate"));
    if (!v49)
    {
      v50 = objc_alloc((Class)NSDate);
      v49 = objc_msgSend(v50, "initWithTimeIntervalSinceNow:", GEOConfigGetDouble(MapsConfig_RideBookingMinimumRideOptionsExpirationInterval, off_1014B2E68));
    }
    objc_msgSend(v49, "timeIntervalSinceNow");
    if (v51 < GEOConfigGetDouble(MapsConfig_RideBookingMinimumRideOptionsExpirationInterval, off_1014B2E68))
    {
      v52 = objc_alloc((Class)NSDate);
      v53 = objc_msgSend(v52, "initWithTimeIntervalSinceNow:", GEOConfigGetDouble(MapsConfig_RideBookingMinimumRideOptionsExpirationInterval, off_1014B2E68));

      v49 = v53;
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "userActivity"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:rideOptions:expirationDate:userActivity:rideOptionStatusError:](RideBookingRideOptionStatus, "statusWithApplication:rideOptions:expirationDate:userActivity:rideOptionStatusError:", v59, v60, v49, v54, v48));

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:error:](RideBookingRideOptionStatus, "statusWithApplication:error:", self, 4));
  }

  return v9;
}

- (NSString)uniqueName
{
  return (NSString *)objc_msgSend((id)objc_opt_class(self), "description");
}

- (id)appBundleID
{
  return self->_identifier;
}

- (void)didChangeProtectionStatusForBundleId:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *queue;
  _QWORD block[5];
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication identifier](self, "identifier"));
  v6 = isExtensionLocked();

  if (v6)
  {
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003870BC;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v9, &location);
    block[4] = self;
    dispatch_async(queue, block);
    objc_destroyWeak(&v9);
  }
  objc_destroyWeak(&location);

}

- (void)dealloc
{
  objc_super v3;

  -[MapsSuggestionsAppGuardian unregisterAppTracker:](self->_appGuardian, "unregisterAppTracker:", self);
  v3.receiver = self;
  v3.super_class = (Class)RideBookingApplication;
  -[RideBookingApplication dealloc](&v3, "dealloc");
}

- (RideBookingApplicationRideStatusDelegate)delegate
{
  return (RideBookingApplicationRideStatusDelegate *)objc_loadWeakRetained((id *)&self->delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->delegate, a3);
}

- (_MXExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)version
{
  return self->_version;
}

- (void)setVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_appGuardian, 0);
  objc_storeStrong((id *)&self->_getRideStatusConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)iconWithFormat:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = *(_QWORD *)&a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingApplication extension](self, "extension"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_iconWithFormat:", v3));

  return v5;
}

@end
