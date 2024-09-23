@implementation WFActionExtension

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  NSMutableOrderedSet *v5;
  void *v6;
  void *v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *j;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  uint64_t WFWorkflowExecutionLogObject;
  NSObject *v33;
  void *v34;
  WFActionExtension *v35;
  void *v36;
  id obj;
  uint64_t v38;
  void *v39;
  NSMutableArray *v40;
  id v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[32];
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  _QWORD v57[2];
  _QWORD v58[2];
  _BYTE v59[128];
  _BYTE v60[128];

  v4 = a3;
  -[WFActionExtension setExtensionContext:](self, "setExtensionContext:", v4);
  self->_initializationResult = (int64_t)+[WFInitialization initializeProcessWithDatabase:](WFInitialization, "initializeProcessWithDatabase:", 1);
  if (v4)
    objc_msgSend(v4, "_extensionHostAuditToken");
  else
    memset(v52, 0, sizeof(v52));
  v36 = v4;
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[VCAccessSpecifier accessSpecifierForAuditToken:](VCAccessSpecifier, "accessSpecifierForAuditToken:", v52));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "associatedAppBundleIdentifier"));
  v5 = objc_opt_new(NSMutableOrderedSet);
  v40 = objc_opt_new(NSMutableArray);
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v35 = self;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFActionExtension extensionContext](self, "extensionContext"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "inputItems"));

  obj = v7;
  v41 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
  if (v41)
  {
    v42 = 0;
    v38 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v41; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v38)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributedTitle"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attributedContentText"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachments"));
        NSLog(CFSTR("Started action extension with input: %@ %@ %@"), v10, v11, v12);

        v13 = (void *)objc_claimAutoreleasedReturnValue(+[WFNSExtensionItemContentItem itemWithObject:sourceAppBundleIdentifier:](WFNSExtensionItemContentItem, "itemWithObject:sourceAppBundleIdentifier:", v9, v39));
        -[NSMutableArray addObject:](v40, "addObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", CFSTR("ActionExtensionWorkflowToken")));

        if (v15)
        {
          v16 = v15;

          v42 = v16;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachments"));
        objc_msgSend(v17, "count");

        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "attachments"));
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v45;
          do
          {
            for (j = 0; j != v20; j = (char *)j + 1)
            {
              if (*(_QWORD *)v45 != v21)
                objc_enumerationMutation(v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)j), "registeredTypeIdentifiers"));
              -[NSMutableOrderedSet addObjectsFromArray:](v5, "addObjectsFromArray:", v23);

            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v59, 16);
          }
          while (v20);
        }

      }
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v60, 16);
    }
    while (v41);
  }
  else
  {
    v42 = 0;
  }

  -[WFActionExtension setContentItems:](v35, "setContentItems:", v40);
  if (-[NSMutableArray count](v40, "count"))
  {
    v43 = 0;
    v24 = v42;
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[WFActionExtension instantiateWorkflowFromSingleUseToken:error:](v35, "instantiateWorkflowFromSingleUseToken:error:", v42, &v43));
    v26 = v43;
    if (v25)
    {
      -[WFActionExtension processAndRunWorkflow:](v35, "processAndRunWorkflow:", v25);

      goto LABEL_29;
    }
  }
  else
  {
    v57[0] = NSLocalizedFailureReasonErrorKey;
    v27 = sub_10000559C(CFSTR("The app that opened this extension did not provide any input."));
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    v58[0] = v28;
    v57[1] = NSLocalizedDescriptionKey;
    v29 = sub_10000559C(CFSTR("Unfortunately, there is nothing Shortcuts can do about this; it is due to a bug in the host app. We’d recommend contacting the maker of that app and letting them know of this problem."));
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v58[1] = v30;
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v58, v57, 2));
    v26 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", NSPOSIXErrorDomain, 22, v31));

    v24 = v42;
  }
  WFWorkflowExecutionLogObject = getWFWorkflowExecutionLogObject();
  v33 = objc_claimAutoreleasedReturnValue(WFWorkflowExecutionLogObject);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v54 = "-[WFActionExtension beginRequestWithExtensionContext:]";
    v55 = 2114;
    v56 = v26;
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s Failed to load requested shortcut in action extension: %{public}@", buf, 0x16u);
  }

  -[WFActionExtension finishWithOutput:error:cancelled:](v35, "finishWithOutput:error:cancelled:", 0, v26, 0);
LABEL_29:

}

- (void)processAndRunWorkflow:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[WFActionExtension contentItems](self, "contentItems"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100005428;
  v7[3] = &unk_100008440;
  objc_copyWeak(&v9, &location);
  v6 = v4;
  v8 = v6;
  objc_msgSend(v5, "if_mapAsynchronously:completionHandler:", &stru_100008418, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (id)instantiateWorkflowFromSingleUseToken:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t WFWorkflowExecutionLogObject;
  NSObject *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults systemShortcutsUserDefaults](NSUserDefaults, "systemShortcutsUserDefaults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "workflowIdentifierConsumingSingleUseToken:", v5));

  if (v7)
  {
    v8 = objc_claimAutoreleasedReturnValue(+[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject referenceForWorkflowID:](v8, "referenceForWorkflowID:", v7));
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[WFWorkflow workflowWithReference:database:error:](WFWorkflow, "workflowWithReference:database:error:", v9, v8, a4));
    }
    else
    {
      WFWorkflowExecutionLogObject = getWFWorkflowExecutionLogObject();
      v13 = objc_claimAutoreleasedReturnValue(WFWorkflowExecutionLogObject);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        v15 = 136315394;
        v16 = "-[WFActionExtension instantiateWorkflowFromSingleUseToken:error:]";
        v17 = 2112;
        v18 = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s Resolved single use token to workflow ID %@, but no workflow found in the database with that ID", (uint8_t *)&v15, 0x16u);
      }

      v10 = 0;
    }

  }
  else
  {
    v11 = getWFWorkflowExecutionLogObject();
    v8 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v15 = 136315394;
      v16 = "-[WFActionExtension instantiateWorkflowFromSingleUseToken:error:]";
      v17 = 2112;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%s Given single use token %@ not found in user defaults", (uint8_t *)&v15, 0x16u);
    }
    v10 = 0;
  }

  return v10;
}

- (void)runWorkflow:(id)a3 withInput:(id)a4 javaScriptRunners:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "effectiveInputClasses"));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005320;
  v14[3] = &unk_100008468;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v12 = v9;
  v13 = v8;
  objc_msgSend(v10, "generateCollectionByCoercingToItemClasses:completionHandler:", v11, v14);

}

- (void)finishWithOutput:(id)a3 error:(id)a4 cancelled:(BOOL)a5
{
  id v7;
  void *v8;
  id v9;

  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "items"));
  v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "if_compactMap:", &stru_1000084A8));

  -[WFActionExtension finishWithItems:error:](self, "finishWithItems:error:", v9, v7);
}

- (void)finishWithItems:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  Block_layout *v16;
  _QWORD v17[5];
  id v18;
  Block_layout *v19;
  _QWORD v20[5];
  _QWORD v21[5];
  Block_layout *v22;
  _QWORD v23[4];
  id v24;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v10 = objc_msgSend(v9, "mutableCopy");

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "userInfo"));
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_100005038;
    v23[3] = &unk_1000084D0;
    v24 = v10;
    v12 = v10;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v23);

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "domain"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v13, objc_msgSend(v8, "code"), v12));

  }
  else
  {
    v14 = 0;
  }
  if (objc_msgSend(v6, "count"))
  {
    v21[0] = 0;
    v21[1] = v21;
    v21[2] = 0x3032000000;
    v21[3] = sub_10000508C;
    v21[4] = sub_1000050B4;
    v22 = &stru_100008510;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[WFActionExtension extensionContext](self, "extensionContext"));
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_1000050BC;
    v20[3] = &unk_100008560;
    v20[4] = v21;
    objc_msgSend(v15, "completeRequestReturningItems:completionHandler:", v6, v20);

    _Block_object_dispose(v21, 8);
    v16 = &stru_100008510;
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_100005174;
    v17[3] = &unk_1000085B0;
    v17[4] = self;
    v18 = v14;
    v19 = &stru_100008510;
    v16 = objc_retainBlock(v17);
    v16->invoke(v16, 0);

  }
}

- (void)workflowRunnerClient:(id)a3 didFinishRunningWorkflowWithOutput:(id)a4 error:(id)a5 cancelled:(BOOL)a6
{
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005024;
  block[3] = &unk_1000085D8;
  block[4] = self;
  v9 = a5;
  v10 = a6;
  v7 = v9;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

}

- (NSExtensionContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContext, a3);
}

- (int64_t)initializationResult
{
  return self->_initializationResult;
}

- (void)setInitializationResult:(int64_t)a3
{
  self->_initializationResult = a3;
}

- (WFWorkflowRunnerClient)runnerClient
{
  return self->_runnerClient;
}

- (void)setRunnerClient:(id)a3
{
  objc_storeStrong((id *)&self->_runnerClient, a3);
}

- (NSArray)contentItems
{
  return self->_contentItems;
}

- (void)setContentItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentItems, 0);
  objc_storeStrong((id *)&self->_runnerClient, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

@end
