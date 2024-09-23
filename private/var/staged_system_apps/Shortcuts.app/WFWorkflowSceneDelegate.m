@implementation WFWorkflowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  WFComposeViewController *v21;
  WFComposeViewController *composeViewController;
  void *v23;
  uint64_t v24;
  id v25;
  void *v26;
  id v27;
  uint64_t WFGeneralLogObject;
  NSObject *v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  const char *v48;
  __int16 v49;
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  uint64_t v54;

  v8 = a3;
  v9 = a4;
  v41 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[WFDatabase defaultDatabase](WFDatabase, "defaultDatabase"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stateRestorationActivity"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager workflowIdentifierFromUserActivity:](WFWindowSceneManager, "workflowIdentifierFromUserActivity:", v11));

  if (v12)
  {
LABEL_12:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "referenceForWorkflowID:", v12));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[WFWorkflow workflowWithReference:database:error:](WFWorkflow, "workflowWithReference:database:error:", v19, v10, 0));
    +[WFWindowSceneManager setupSession:forEditingWorkflow:](WFWindowSceneManager, "setupSession:forEditingWorkflow:", v9, v19);
    v21 = (WFComposeViewController *)objc_msgSend(objc_alloc((Class)WFComposeViewController), "initWithWorkflow:database:", v20, v10);
    composeViewController = self->_composeViewController;
    self->_composeViewController = v21;

    -[WFComposeViewController setDelegate:](self->_composeViewController, "setDelegate:", self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "name"));
    objc_msgSend(v8, "setTitle:", v23);

    v24 = objc_opt_class(UIWindowScene);
    v40 = v8;
    v25 = v8;
    v26 = v25;
    if (v25 && (objc_opt_isKindOfClass(v25, v24) & 1) == 0)
    {
      WFGeneralLogObject = getWFGeneralLogObject();
      v29 = objc_claimAutoreleasedReturnValue(WFGeneralLogObject);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        v30 = (void *)objc_opt_class(v26);
        *(_DWORD *)buf = 136315906;
        v48 = "WFEnforceClass";
        v49 = 2114;
        v50 = v26;
        v51 = 2114;
        v52 = v30;
        v53 = 2114;
        v54 = v24;
        v31 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_FAULT, "%s Warning: %{public}@ is of type %{public}@, not %{public}@! Falling back to nil.", buf, 0x2Au);

      }
      v27 = 0;
    }
    else
    {
      v27 = v26;
    }

    v32 = objc_msgSend(objc_alloc((Class)UIWindow), "initWithWindowScene:", v27);
    -[WFWorkflowSceneDelegate setWindow:](self, "setWindow:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[WFWorkflowSceneDelegate window](self, "window"));
    objc_msgSend(v34, "setBackgroundColor:", v33);

    v35 = objc_alloc((Class)WFComposePresentingViewController);
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[WFWorkflowSceneDelegate composeViewController](self, "composeViewController"));
    v37 = objc_msgSend(v35, "initWithComposeViewController:", v36);
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[WFWorkflowSceneDelegate window](self, "window"));
    objc_msgSend(v38, "setRootViewController:", v37);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[WFWorkflowSceneDelegate window](self, "window"));
    objc_msgSend(v39, "makeKeyAndVisible");

    v8 = v40;
  }
  else
  {
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "userActivities"));
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v43;
      while (2)
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v43 != v16)
            objc_enumerationMutation(v13);
          v18 = objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager workflowIdentifierFromUserActivity:](WFWindowSceneManager, "workflowIdentifierFromUserActivity:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v17)));
          if (v18)
          {
            v12 = (void *)v18;

            goto LABEL_12;
          }
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        if (v15)
          continue;
        break;
      }
    }

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v12, "requestSceneSessionDestruction:options:errorHandler:", v9, 0, 0);
  }

}

- (void)composeViewControllerRequestsDismissal:(id)a3 forTutorial:(BOOL)a4 withCompletionHandler:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(void);

  v11 = (void (**)(void))a5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "window"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "windowScene"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "session"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    objc_msgSend(v10, "requestSceneSessionDestruction:options:errorHandler:", v9, 0, 0);

  }
  if (v11)
    v11[2]();

}

- (id)stateRestorationActivityForScene:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[WFWorkflowSceneDelegate composeViewController](self, "composeViewController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "workflow"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "reference"));

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[WFWindowSceneManager userActivityForEditingWorkflow:](WFWindowSceneManager, "userActivityForEditingWorkflow:", v5));
  else
    v6 = 0;

  return v6;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (WFComposeViewController)composeViewController
{
  return self->_composeViewController;
}

- (void)setComposeViewController:(id)a3
{
  objc_storeStrong((id *)&self->_composeViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_composeViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
