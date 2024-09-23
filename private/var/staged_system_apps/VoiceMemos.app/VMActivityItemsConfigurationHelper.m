@implementation VMActivityItemsConfigurationHelper

+ (id)activityItemsConfigurationForCompositions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v7;
  id v8;
  uint64_t v9;
  void *v10;
  RCShareableComposition *v11;
  NSItemProvider *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v25;
  uint64_t v26;
  id obj;
  _QWORD v28[4];
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v3;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v32;
    v26 = kVMLogCategoryDefault;
    *(_QWORD *)&v7 = 136315394;
    v25 = v7;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(obj);
        v11 = -[RCShareableComposition initWithComposition:]([RCShareableComposition alloc], "initWithComposition:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10));
        v12 = objc_opt_new(NSItemProvider);
        v13 = objc_claimAutoreleasedReturnValue(-[RCShareableComposition title](v11, "title"));
        -[NSItemProvider setSuggestedName:](v12, "setSuggestedName:", v13);

        v30 = 0;
        LOBYTE(v13) = -[RCShareableComposition registerAudioFileRepresentationWithItemProvider:error:](v11, "registerAudioFileRepresentationWithItemProvider:error:", v12, &v30);
        v14 = v30;
        if ((v13 & 1) == 0)
        {
          v15 = OSLogForCategory(v26);
          v16 = objc_claimAutoreleasedReturnValue(v15);
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v25;
            v36 = "+[VMActivityItemsConfigurationHelper activityItemsConfigurationForCompositions:]";
            v37 = 2112;
            v38 = v14;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s -- registerError = %@", buf, 0x16u);
          }

        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition title](v11, "title", v25));
        -[NSItemProvider registerObject:visibility:](v12, "registerObject:visibility:", v17, 0);

        objc_msgSend(v4, "addObject:", v12);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "lastObject"));
        v19 = objc_msgSend(v4, "indexOfObject:", v18);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[RCShareableComposition title](v11, "title"));
        v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v19));
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v20, v21);

        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v8);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIActivityItemsConfiguration activityItemsConfigurationWithItemProviders:](UIActivityItemsConfiguration, "activityItemsConfigurationWithItemProviders:", v4));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10004D4CC;
  v28[3] = &unk_1001AC378;
  v29 = v5;
  v23 = v5;
  objc_msgSend(v22, "setPerItemMetadataProvider:", v28);
  objc_msgSend(v22, "setLocalObject:", obj);

  return v22;
}

@end
