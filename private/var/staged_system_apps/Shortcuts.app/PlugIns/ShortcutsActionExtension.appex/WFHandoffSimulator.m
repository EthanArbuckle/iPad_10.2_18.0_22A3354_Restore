@implementation WFHandoffSimulator

+ (void)registerHandoffURLRequestHandler:(id)a3
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v5 = a3;
  if (!v5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 27, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ICManager sharedManager](ICManager, "sharedManager"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004260;
  v9[3] = &unk_100008388;
  v10 = v5;
  v11 = a1;
  v7 = v5;
  objc_msgSend(v6, "registerHandler:forIncomingRequestsWithAction:scheme:", v9, CFSTR("continue-user-activity"), 0);

}

+ (id)URLForSimulatingHandoffWithActivityType:(id)a3 userInfo:(id)a4 webpageURL:(id)a5 fromSource:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  unsigned int v16;
  id v17;
  NSMutableArray *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSURLComponents *v25;
  void *v27;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = v14;
  if (!v12 || !v14)
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("userInfo && handoffSource"));

  }
  v16 = objc_msgSend(v11, "isEqualToString:", NSUserActivityTypeBrowsingWeb);
  if (!v13 || !v16)
  {
    v18 = objc_opt_new(NSMutableArray);
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("type"), v11));
    -[NSMutableArray addObject:](v18, "addObject:", v19);

    if (v12)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:", v12));
      v17 = v20;
      if (!v20)
      {
LABEL_12:

        goto LABEL_13;
      }
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "absoluteString"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("userInfoURL"), v21));
      -[NSMutableArray addObject:](v18, "addObject:", v22);

    }
    if (v13)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "absoluteString"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", CFSTR("webpageURL"), v23));
      -[NSMutableArray addObject:](v18, "addObject:", v24);

    }
    v25 = objc_opt_new(NSURLComponents);
    -[NSURLComponents setScheme:](v25, "setScheme:", WFWorkflowActiveURLScheme);
    -[NSURLComponents setHost:](v25, "setHost:", CFSTR("continue-user-activity"));
    -[NSURLComponents setQueryItems:](v25, "setQueryItems:", v18);
    v17 = (id)objc_claimAutoreleasedReturnValue(-[NSURLComponents URL](v25, "URL"));

    goto LABEL_12;
  }
  v17 = v13;
LABEL_13:

  return v17;
}

+ (id)URLForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;
  _QWORD v14[2];
  _QWORD v15[2];

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7 || !v8)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("WFHandoffSimulator.m"), 70, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("state && handoffSource"));

  }
  v14[0] = WFHandoffWorkflowControllerStateKey;
  v14[1] = WFHandoffSourceKey;
  v15[0] = v7;
  v15[1] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v15, v14, 2));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "URLForSimulatingHandoffWithActivityType:userInfo:webpageURL:fromSource:", WFHandoffContinueWorkflowActivityType, v10, 0, v9));

  return v11;
}

+ (id)temporaryFileURLBySerializingUserInfo:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  void *v10;
  unsigned int v11;
  id v12;
  id v13;
  id v15;
  id v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver wf_securelyArchivedDataWithRootObject:deletionResponsibility:](NSKeyedArchiver, "wf_securelyArchivedDataWithRootObject:deletionResponsibility:", a3, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[WFTemporaryFileManager proposedSharedTemporaryFileURLForFilename:](WFTemporaryFileManager, "proposedSharedTemporaryFileURLForFilename:", CFSTR("URLHandoffUserInfo.plist")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "URLByDeletingLastPathComponent"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "path"));
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if ((v8 & 1) != 0)
  {
    v9 = 0;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v16 = 0;
    objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v16);
    v9 = v16;

  }
  v15 = v9;
  v11 = objc_msgSend(v3, "writeToURL:options:error:", v4, 0, &v15);
  v12 = v15;

  v13 = 0;
  if (v11)
    v13 = v4;

  return v13;
}

+ (void)deserializeUserInfoAtURL:(id)a3 completionHandler:(id)a4
{
  void (**v5)(id, _QWORD);
  void *v6;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSSet *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  id v20;

  v20 = a3;
  v5 = (void (**)(id, _QWORD))a4;
  if (objc_msgSend(v20, "isFileURL")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(+[WFTemporaryFileManager sharedAppGroupDirectoryURL](WFTemporaryFileManager, "sharedAppGroupDirectoryURL")), v7 = objc_msgSend(v20, "wf_isContainedByDirectoryAtURL:", v6), v6, (v7 & 1) != 0))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[WFFileType typeWithUTType:](WFFileType, "typeWithUTType:", UTTypePropertyList));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[WFFileRepresentation fileWithURL:options:ofType:](WFFileRepresentation, "fileWithURL:options:ofType:", v20, 1, v8));

    v10 = objc_opt_class(NSString);
    v11 = objc_opt_class(NSNumber);
    v12 = objc_opt_class(NSArray);
    v13 = objc_opt_class(NSDictionary);
    v14 = objc_opt_class(NSDate);
    v15 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v10, v11, v12, v13, v14, objc_opt_class(NSData), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = objc_msgSend(v16, "mutableCopy");

    objc_msgSend(v17, "addObject:", objc_opt_class(NSURL));
    objc_msgSend(v17, "addObject:", objc_opt_class(WFWorkflowControllerState));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "mappedData"));
    v19 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:](NSKeyedUnarchiver, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v18, v17, v5);

  }
  else
  {
    v5[2](v5, 0);
  }

}

+ (id)userActivityForContinuingWorkflowWithState:(id)a3 fromSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  const __CFString *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[2];

  v6 = a3;
  v7 = a4;
  v17[0] = WFHandoffWorkflowControllerStateKey;
  v17[1] = WFHandoffSourceKey;
  v18[0] = v6;
  v18[1] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 2));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "temporaryFileURLBySerializingUserInfo:", v8));
  if (v9)
  {
    v10 = objc_alloc((Class)NSUserActivity);
    v11 = objc_msgSend(v10, "initWithActivityType:", WFHandoffContinueWorkflowActivityType);
    v15 = CFSTR("userInfoURL");
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "absoluteString"));
    v16 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
    objc_msgSend(v11, "setUserInfo:", v13);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

+ (void)getStateForContinuingWorkflowFromUserActivityUserInfo:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  NSSet *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  void (**v21)(id, void *, id);
  _QWORD v22[4];
  id v23;
  void (**v24)(id, void *, id);

  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", WFHandoffSourceKey));
  v9 = (void *)v8;
  v10 = (void *)WFWorkflowRunSourceHandoff;
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", WFHandoffWorkflowControllerStateKey));
  v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", WFHandoffWorkflowControllerStateDataKey));
  v14 = (void *)v13;
  if (v12)
  {
    v7[2](v7, v12, v11);
  }
  else if (v13)
  {
    v15 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(WFWorkflowControllerState));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000041A4;
    v22[3] = &unk_1000083B0;
    v24 = v7;
    v23 = v11;
    v17 = +[NSKeyedUnarchiver wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:](NSKeyedUnarchiver, "wf_securelyUnarchiveObjectWithData:allowedClasses:completionHandler:", v14, v16, v22);

  }
  else
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("userInfoURL")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", v18));

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000041B4;
    v20[3] = &unk_1000083D8;
    v21 = v7;
    objc_msgSend(a1, "deserializeUserInfoAtURL:completionHandler:", v19, v20);

  }
}

@end
