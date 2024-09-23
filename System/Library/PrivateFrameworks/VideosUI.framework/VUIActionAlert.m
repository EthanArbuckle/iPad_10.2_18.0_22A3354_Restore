@implementation VUIActionAlert

- (VUIActionAlert)initWithContextData:(id)a3 appContext:(id)a4 controllerClass:(Class)a5
{
  id v8;
  VUIActionAlert *v9;
  uint64_t v10;
  NSString *title;
  uint64_t v12;
  NSString *descriptionString;
  uint64_t v14;
  NSDictionary *dialogMetrics;
  void *v16;
  NSString *v17;
  void *dismissButtonTitle;
  uint64_t v19;
  NSString *v20;
  void *v21;
  _BOOL8 v22;
  void *v23;
  NSMutableArray *v24;
  NSMutableArray *actionItems;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableArray *v36;
  VUIActionAlertActionItem *v37;
  void *v38;
  VUIActionAlert *v39;
  VUIActionAlertActionItem *v40;
  void *v41;
  uint64_t v42;
  VUIAction *cancelAction;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  uint64_t v50;
  id v51;
  uint64_t v52;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  objc_super v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v51 = a4;
  v58.receiver = self;
  v58.super_class = (Class)VUIActionAlert;
  v9 = -[VUIActionAlert init](&v58, sel_init);
  if (v9)
  {
    objc_msgSend(v8, "vui_stringForKey:", CFSTR("title"));
    v10 = objc_claimAutoreleasedReturnValue();
    title = v9->_title;
    v9->_title = (NSString *)v10;

    objc_msgSend(v8, "vui_stringForKey:", CFSTR("description"));
    v12 = objc_claimAutoreleasedReturnValue();
    descriptionString = v9->_descriptionString;
    v9->_descriptionString = (NSString *)v12;

    objc_msgSend(v8, "vui_dictionaryForKey:", CFSTR("metrics"));
    v14 = objc_claimAutoreleasedReturnValue();
    dialogMetrics = v9->_dialogMetrics;
    v9->_dialogMetrics = (NSDictionary *)v14;

    objc_storeStrong((id *)&v9->_controllerClass, a5);
    objc_msgSend(v8, "vui_stringForKey:", CFSTR("dismissButtonTitle"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = v16;
      dismissButtonTitle = v9->_dismissButtonTitle;
      v9->_dismissButtonTitle = v17;
    }
    else
    {
      +[VUILocalizationManager sharedInstance](VUILocalizationManager, "sharedInstance");
      dismissButtonTitle = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(dismissButtonTitle, "localizedStringForKey:", CFSTR("OK"));
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = v9->_dismissButtonTitle;
      v9->_dismissButtonTitle = (NSString *)v19;

    }
    objc_msgSend(v8, "vui_stringForKey:", CFSTR("style"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = !objc_msgSend(v21, "length") || (objc_msgSend(v21, "isEqualToString:", CFSTR("actionSheet")) & 1) == 0;
    v9->_style = v22;
    objc_msgSend(v8, "vui_arrayForKey:", CFSTR("actionItems"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "count"))
    {
      v46 = v21;
      v47 = v16;
      v48 = v8;
      v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      actionItems = v9->_actionItems;
      v9->_actionItems = v24;

      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v45 = v23;
      obj = v23;
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
      if (v52)
      {
        v50 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v52; ++i)
          {
            if (*(_QWORD *)v55 != v50)
              objc_enumerationMutation(obj);
            v27 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
            objc_msgSend(v27, "vui_stringForKey:", CFSTR("title"), v45);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "vui_stringForKey:", CFSTR("titleImage"));
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "stringByReplacingOccurrencesOfString:withString:", CFSTR("symbol://"), &stru_1E9FF3598);
            v30 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v27, "vui_dictionaryForKey:", CFSTR("action"));
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "vui_dictionaryForKey:", CFSTR("contextData"));
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "vui_dictionaryForKey:", CFSTR("metrics"));
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            +[VUIAction actionWithDictionary:appContext:](VUIAction, "actionWithDictionary:appContext:", v31, v51);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v53 = v30;
              if (v30)
              {
                objc_msgSend(MEMORY[0x1E0DC3870], "vuiSystemImageNamed:withConfiguration:accessibilityDescription:", v30, 0, 0);
                v35 = (void *)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                v35 = 0;
              }
              v36 = v9->_actionItems;
              v37 = -[VUIActionAlertActionItem initWithTitle:titleImage:action:metrics:]([VUIActionAlertActionItem alloc], "initWithTitle:titleImage:action:metrics:", v28, v35, v34, v33);
              v38 = v28;
              v39 = v9;
              v40 = v37;
              -[NSMutableArray addObject:](v36, "addObject:", v37);

              v9 = v39;
              v28 = v38;

              v30 = v53;
            }

          }
          v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
        }
        while (v52);
      }

      v16 = v47;
      v8 = v48;
      v23 = v45;
      v21 = v46;
    }
    objc_msgSend(v8, "vui_dictionaryForKey:", CFSTR("cancelAction"), v45);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (v41)
    {
      +[VUIAction actionWithDictionary:appContext:](VUIAction, "actionWithDictionary:appContext:", v41, v51);
      v42 = objc_claimAutoreleasedReturnValue();
      cancelAction = v9->_cancelAction;
      v9->_cancelAction = (VUIAction *)v42;

    }
  }

  return v9;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *dismissButtonTitle;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  VUIActionAlert *v30;
  id obj;
  id v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v6 = a4;
  -[objc_class vui_alertControllerWithTitle:message:preferredStyle:](self->_controllerClass, "vui_alertControllerWithTitle:message:preferredStyle:", self->_title, self->_descriptionString, self->_style);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionAlert dialogMetrics](self, "dialogMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = self;
  -[VUIActionAlert actionItems](self, "actionItems");
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v46 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend(v12, "title");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "titleImage");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "metrics");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke;
        v41[3] = &unk_1E9F9F6B8;
        v41[4] = v12;
        v42 = v7;
        v43 = v32;
        v44 = v6;
        +[VUIAlertAction vui_actionWithTitle:titleImage:style:metrics:handler:](VUIAlertAction, "vui_actionWithTitle:titleImage:style:metrics:handler:", v13, v14, 0, v15, v41);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v33, "vui_addAction:", v16);
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    }
    while (v9);
  }
  -[VUIActionAlert cancelAction](v30, "cancelAction");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIActionAlert dismissButtonTitle](v30, "dismissButtonTitle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  dismissButtonTitle = v30->_dismissButtonTitle;
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_2;
  v34[3] = &unk_1E9F9F6E0;
  v20 = obj;
  v35 = v20;
  v21 = v18;
  v36 = v21;
  v22 = v7;
  v37 = v22;
  v23 = v17;
  v38 = v23;
  v24 = v32;
  v39 = v24;
  v25 = v6;
  v40 = v25;
  +[VUIAlertAction vui_actionWithTitle:titleImage:style:handler:](VUIAlertAction, "vui_actionWithTitle:titleImage:style:handler:", dismissButtonTitle, 0, 1, v34);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vui_addAction:isPreferred:", v26, 0);
  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "vui_presentAlertFromPresentingController:animated:completion:", v27, 1, 0);
  if (v22)
  {
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "recordDialog:", v22);

  }
  if (v25)
  {
    -[VUIActionAlert cancelAction](v30, "cancelAction");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v29)
      (*((void (**)(id, uint64_t))v25 + 2))(v25, 1);
  }

}

void __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vui_dictionaryForKey:", CFSTR("click"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (*(_QWORD *)(a1 + 40))
    {
      objc_msgSend(v4, "addEntriesFromDictionary:");
    }
    else
    {
      VUIDefaultLogObject();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_cold_1(v6);

    }
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordClick:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_63;
  v10[3] = &unk_1E9F98E18;
  v9 = *(_QWORD *)(a1 + 48);
  v11 = *(id *)(a1 + 56);
  +[VUIApplicationRouter invokeAction:targetResponder:completion:](VUIApplicationRouter, "invokeAction:targetResponder:completion:", v8, v9, v10);

}

uint64_t __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_63(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v12;
  const __CFString *v13;
  _QWORD v14[4];
  _QWORD v15[5];

  v15[4] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "firstObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "metrics");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vui_dictionaryForKey:", CFSTR("click"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0C99E08];
    v14[0] = CFSTR("targetId");
    v14[1] = CFSTR("targetType");
    v15[0] = CFSTR("cancel");
    v15[1] = CFSTR("button");
    v15[2] = CFSTR("cancel");
    v14[2] = CFSTR("actionType");
    v14[3] = CFSTR("actionDetails");
    v6 = &stru_1E9FF3598;
    if (*(_QWORD *)(a1 + 40))
      v6 = *(const __CFString **)(a1 + 40);
    v12 = CFSTR("name");
    v13 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15[3] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dictionaryWithDictionary:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (*(_QWORD *)(a1 + 48))
      objc_msgSend(v9, "addEntriesFromDictionary:");
    +[VUIMetricsController sharedInstance](VUIMetricsController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recordClick:", v9);

  }
  return objc_msgSend(*(id *)(a1 + 56), "performWithTargetResponder:completionHandler:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (NSString)descriptionString
{
  return self->_descriptionString;
}

- (void)setDescriptionString:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionString, a3);
}

- (NSMutableArray)actionItems
{
  return self->_actionItems;
}

- (void)setActionItems:(id)a3
{
  objc_storeStrong((id *)&self->_actionItems, a3);
}

- (NSString)dismissButtonTitle
{
  return self->_dismissButtonTitle;
}

- (void)setDismissButtonTitle:(id)a3
{
  objc_storeStrong((id *)&self->_dismissButtonTitle, a3);
}

- (VUIAction)cancelAction
{
  return self->_cancelAction;
}

- (void)setCancelAction:(id)a3
{
  objc_storeStrong((id *)&self->_cancelAction, a3);
}

- (int64_t)style
{
  return self->_style;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (NSDictionary)dialogMetrics
{
  return self->_dialogMetrics;
}

- (void)setDialogMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_dialogMetrics, a3);
}

- (Class)controllerClass
{
  return self->_controllerClass;
}

- (void)setControllerClass:(Class)a3
{
  objc_storeStrong((id *)&self->_controllerClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controllerClass, 0);
  objc_storeStrong((id *)&self->_dialogMetrics, 0);
  objc_storeStrong((id *)&self->_cancelAction, 0);
  objc_storeStrong((id *)&self->_dismissButtonTitle, 0);
  objc_storeStrong((id *)&self->_actionItems, 0);
  objc_storeStrong((id *)&self->_descriptionString, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __63__VUIActionAlert_performWithTargetResponder_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "VUIActionAlert should have dialog metrics if actionItems have click metrics", v1, 2u);
}

@end
