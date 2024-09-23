@implementation MapsExternalDeviceState

+ (id)allKeys
{
  if (qword_1014D2808 != -1)
    dispatch_once(&qword_1014D2808, &stru_1011BA600);
  return (id)qword_1014D2800;
}

- (id)descriptionForKey:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v8;
  unsigned int v9;
  __CFString *v10;
  __CFString *v11;
  objc_super v12;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("connectionType")))
  {
    v12.receiver = self;
    v12.super_class = (Class)MapsExternalDeviceState;
    v5 = -[MapsExternalState descriptionForKey:](&v12, "descriptionForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

    return v6;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MapsExternalDeviceState valueForKey:](self, "valueForKey:", v4));

    v9 = objc_msgSend(v8, "BOOLValue");
    v10 = CFSTR("NO");
    if (v9)
      v10 = CFSTR("YES");
    v11 = v10;

    return v11;
  }
}

- (MapsExternalDeviceState)initWithExternalDevice:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  MapsExternalDeviceState *v14;
  unsigned __int8 v15;
  void *v16;
  MapsExternalDeviceState *v17;
  void *v18;
  unint64_t v19;
  objc_super v21;
  uint8_t buf[4];
  void *v23;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    if (objc_msgSend(v4, "transportType")
      || !GEOConfigGetBOOL(MapsConfig_ExternalDeviceRejectBadTransportTypes, off_1014B50D8))
    {
      v21.receiver = self;
      v21.super_class = (Class)MapsExternalDeviceState;
      v14 = -[MapsExternalDeviceState init](&v21, "init");
      if (v14)
      {
        v14->_lowLightLevel = objc_msgSend(v5, "nightMode");
        v14->_rightHandDrive = objc_msgSend(v5, "rightHandDrive");
        v15 = objc_msgSend(v5, "limitedUI");
        v14->_hasLimitedUI = v15;
        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limitedUIElements"));
          v14->_limitLongLists = objc_msgSend(v16, "containsObject:", AVExternalDeviceLimitedUIElementNonMusicLists);

        }
        else
        {
          v14->_limitLongLists = 0;
        }
        if (v14->_hasLimitedUI)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "limitedUIElements"));
          v14->_disableSoftwareKeyboard = objc_msgSend(v18, "containsObject:", AVExternalDeviceLimitedUIElementSoftKeyboard);

        }
        else
        {
          v14->_disableSoftwareKeyboard = 0;
        }
        v14->_ownsScreen = objc_msgSend(v5, "ownsScreen");
        v14->_supportsNavigationAidedDriving = ((unint64_t)objc_msgSend(v5, "navigationAidedDriving") & 0xFFFFFFFFFFFFFFFELL) == 2;
        v14->_navigationAidedDrivingEnabled = objc_msgSend(v5, "navigationAidedDriving") == (id)2;
        v19 = (unint64_t)objc_msgSend(v5, "transportType");
        if (v19 <= 3)
          v14->_connectionType = qword_100E378B0[v19];
      }
      self = v14;
      v17 = self;
    }
    else
    {
      v6 = sub_10052CF28();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = v5;
        v9 = objc_opt_class(AVExternalDevice);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v10 = objc_opt_class(v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "ID"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p> (ID: %@, name: %@, transportType: %ld)"), v10, v8, v11, v12, objc_msgSend(v8, "transportType")));

        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
        }

        *(_DWORD *)buf = 138543362;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Trying to create state for AVExternalDevice with bad transport type, treating as nil: %{public}@", buf, 0xCu);

      }
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (BOOL)lowLightLevel
{
  return self->_lowLightLevel;
}

- (BOOL)rightHandDrive
{
  return self->_rightHandDrive;
}

- (BOOL)hasLimitedUI
{
  return self->_hasLimitedUI;
}

- (BOOL)limitLongLists
{
  return self->_limitLongLists;
}

- (BOOL)disableSoftwareKeyboard
{
  return self->_disableSoftwareKeyboard;
}

- (BOOL)ownsScreen
{
  return self->_ownsScreen;
}

- (int64_t)connectionType
{
  return self->_connectionType;
}

- (BOOL)supportsNavigationAidedDriving
{
  return self->_supportsNavigationAidedDriving;
}

- (BOOL)isNavigationAidedDrivingEnabled
{
  return self->_navigationAidedDrivingEnabled;
}

@end
