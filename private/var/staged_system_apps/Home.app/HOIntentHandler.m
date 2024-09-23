@implementation HOIntentHandler

+ (id)intentHandlerWithNavigator:(id)a3
{
  id v3;
  HOIntentHandler *v4;

  v3 = a3;
  v4 = objc_opt_new(HOIntentHandler);
  -[HOIntentHandler setNavigator:](v4, "setNavigator:", v3);

  return v4;
}

+ (void)handleIntent:(id)a3 withNavigator:(id)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "intentHandlerWithNavigator:", a4));
  v7 = objc_opt_class(INConfigureHomeIntent);
  if ((objc_opt_isKindOfClass(v10, v7) & 1) != 0)
  {
    objc_msgSend(v6, "handleConfigureIntent:", v10);
  }
  else
  {
    v8 = objc_opt_class(INShowHomeIntent);
    if ((objc_opt_isKindOfClass(v10, v8) & 1) != 0)
    {
      objc_msgSend(v6, "handleShowHomeIntent:", v10);
    }
    else
    {
      v9 = objc_opt_class(SecurityAccessoryConfigurationIntent);
      if ((objc_opt_isKindOfClass(v10, v9) & 1) != 0)
        objc_msgSend(v6, "handleShowSingleAccessoryQuickControlsIntent:", v10);
    }
  }

}

- (void)showServiceForFilter:(id)a3 withTimeRange:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "entityName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "home"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "room"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description"));

  if (!v9)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "home"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "hf_unitaryCameraProfile"));
    v17 = v16;
    if (v16)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "accessory"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "name"));

    }
    else
    {
      v9 = 0;
    }

  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler _serviceTypeFromFilter:](self, "_serviceTypeFromFilter:", v6));
  if (objc_msgSend(v19, "isEqual:", HMServiceTypeCameraControl))
  {
    v33 = v11;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate hf_sharedCalendar](NSDate, "hf_sharedCalendar"));
    v21 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "startDateComponents"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateFromComponents:", v22));

    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "endDateComponents"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "dateFromComponents:", v24));

    v34 = v21;
    if (-[HOIntentHandler _shouldHandleMostRecentCameraClipForFilter:timeRange:](self, "_shouldHandleMostRecentCameraClipForFilter:timeRange:", v6, v21))
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));

      v27 = HFLogForCategory(61);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v36 = v9;
        v37 = 2112;
        v38 = v26;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Adjusted camera:%@ startDate: %@", buf, 0x16u);
      }

    }
    else
    {
      v26 = v23;
    }
    v11 = v33;
    v30 = HFLogForCategory(61);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v36 = v9;
      v37 = 2112;
      v38 = v26;
      v39 = 2112;
      v40 = v25;
      v41 = 2112;
      v42 = v33;
      v43 = 2112;
      v44 = v13;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Launch camera:%@, startDate:%@, endDate:%@, home:%@, room:%@", buf, 0x34u);
    }

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
    objc_msgSend(v32, "showCameraWithName:homeName:startDate:endDate:roomName:", v9, v33, v26, v25, v13);

    v7 = v34;
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
    objc_msgSend(v29, "showServiceWithName:serviceType:homeName:roomName:", v9, v19, v11, v13);

  }
}

- (void)handleShowSingleAccessoryQuickControlsIntent:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "accessory"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v5);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "homeManager"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "homes"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "hf_accessoryWithIdentifier:", v6));
          if (v14)
          {
            v15 = (void *)v14;
            v16 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
            v17 = objc_msgSend(v16, "showAccessory:secondaryDestination:", v15, 0);

            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (void)showRoomForFilter:(id)a3 withTimeRange:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "entityName"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "description"));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "home"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "hf_roomWithName:", v8));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "hf_unitaryCameraProfile"));
  v13 = v12;
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "accessory"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "name"));

    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate hf_sharedCalendar](NSDate, "hf_sharedCalendar"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDateComponents"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateFromComponents:", v17));

    v27 = v6;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endDateComponents"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "dateFromComponents:", v19));

    v21 = HFLogForCategory(61);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413058;
      v29 = v8;
      v30 = 2112;
      v31 = v15;
      v32 = 2112;
      v33 = v18;
      v34 = 2112;
      v35 = v20;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Displaying unitary camera in room:%@ with one camera:%@ startDate:%@ endDate:%@", buf, 0x2Au);
    }

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
    objc_msgSend(v23, "showCameraWithName:homeName:startDate:endDate:roomName:", v15, v24, v18, v20, v8);

    v6 = v27;
  }
  else
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
    v26 = objc_msgSend(v25, "showRoomWithName:", v8);

  }
}

- (void)showHomeForFilter:(id)a3 withTimeRange:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "home"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
  objc_msgSend(v6, "showHomeForName:", v7);

}

- (void)handleShowHomeIntent:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  id v11;
  void *v12;
  int v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filters"));
  v6 = objc_msgSend(v5, "count");

  v7 = HFLogForCategory(61);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v9)
    {
      v13 = 138412290;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Handle intent: %@", (uint8_t *)&v13, 0xCu);
    }

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filters"));
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", 0));

    v11 = -[NSObject entityType](v8, "entityType");
    if (v11 == (id)1)
      goto LABEL_10;
    if (v11 == (id)3)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      -[HOIntentHandler showRoomForFilter:withTimeRange:](self, "showRoomForFilter:withTimeRange:", v8, v12);
      goto LABEL_12;
    }
    if (v11 != (id)7)
    {
LABEL_10:
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      -[HOIntentHandler showHomeForFilter:withTimeRange:](self, "showHomeForFilter:withTimeRange:", v8, v12);
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "time"));
      -[HOIntentHandler showServiceForFilter:withTimeRange:](self, "showServiceForFilter:withTimeRange:", v8, v12);
    }
LABEL_12:

    goto LABEL_13;
  }
  if (v9)
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Received Intent with missing filter : %@", (uint8_t *)&v13, 0xCu);
  }
LABEL_13:

}

- (void)handleConfigureIntent:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void **v31;
  uint64_t v32;
  id (*v33)(uint64_t, void *);
  void *v34;
  id v35;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "entities"));
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HFHomeKitDispatcher sharedDispatcher](HFHomeKitDispatcher, "sharedDispatcher"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeFuture"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler entityOfType:inEntities:](self, "entityOfType:inEntities:", 1, v5));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allHomesFuture"));
      v31 = _NSConcreteStackBlock;
      v32 = 3221225472;
      v33 = sub_100049E10;
      v34 = &unk_1000B79D0;
      v10 = v8;
      v35 = v10;
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flatMap:", &v31));

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "entityName"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "description"));
      objc_msgSend(v12, "createOrShowHomeWithName:home:", v14, v11);

      v7 = (void *)v11;
    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler entityOfType:inEntities:](self, "entityOfType:inEntities:", 3, v5));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSError hf_errorWithCode:](NSError, "hf_errorWithCode:", 30));
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NAFuture futureWithError:](NAFuture, "futureWithError:", v16));

    v29 = v15;
    if (v15)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator", v15));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "entityName"));
      v20 = v8;
      v21 = v6;
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "description"));
      v23 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "createOrShowRoomWithName:home:", v22, v7));

      v6 = v21;
      v8 = v20;

      v17 = (void *)v23;
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler entityOfType:inEntities:](self, "entityOfType:inEntities:", 5, v5, v29, v31, v32, v33, v34));
    if (v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HOIntentHandler navigator](self, "navigator"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "entityName"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "description"));
      v28 = objc_msgSend(v25, "createOrEditActionSetWithName:home:switchToHomeTab:", v27, v7, 0);

    }
  }

}

- (id)entityOfType:(int64_t)a3 inEntities:(id)a4
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = a4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "type", (_QWORD)v13) == (id)a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)_serviceTypeFromFilter:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "deviceType") - 1;
  if (v3 <= 0x2A && ((0x6EFFFFFFFFFuLL >> v3) & 1) != 0)
    return *(id *)*(&off_1000B8160 + v3);
  else
    return 0;
}

- (BOOL)_shouldHandleMostRecentCameraClipForFilter:(id)a3 timeRange:(id)a4
{
  id v5;
  void *v6;
  BOOL v7;

  v5 = a4;
  if (objc_msgSend(a3, "deviceType") == (id)42)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "startDateComponents"));
    v7 = v6 == 0;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (HOAppNavigator)navigator
{
  return self->_navigator;
}

- (void)setNavigator:(id)a3
{
  objc_storeStrong((id *)&self->_navigator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigator, 0);
}

@end
