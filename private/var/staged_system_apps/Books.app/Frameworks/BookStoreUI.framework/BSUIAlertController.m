@implementation BSUIAlertController

- (BSUIAlertController)init
{
  BSUIAlertController *v2;
  uint64_t v3;
  NSMapTable *actionsToActionModelsTable;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BSUIAlertController;
  v2 = -[BSUIAlertController init](&v6, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 5, 5));
    actionsToActionModelsTable = v2->_actionsToActionModelsTable;
    v2->_actionsToActionModelsTable = (NSMapTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[BSUIAlertController dismiss](self, "dismiss");
  v3.receiver = self;
  v3.super_class = (Class)BSUIAlertController;
  -[BSUIAlertController dealloc](&v3, "dealloc");
}

+ (void)showActionSheet:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_opt_class(NSString);
  v18 = BUDynamicCast(v17, v16);
  v23 = (id)objc_claimAutoreleasedReturnValue(v18);

  v19 = objc_opt_class(NSString);
  v20 = BUDynamicCast(v19, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v22 = (void *)objc_opt_new(a1);
  objc_msgSend(v22, "presentAlertWithStyle:title:message:actions:metricsData:useSortStyle:options:", 0, v23, v21, v14, v13, 0, v12);

}

+ (void)showAlert:(id)a3 message:(id)a4 actions:(id)a5 metricsDataOptions:(id)a6 options:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = objc_opt_class(NSString);
  v18 = BUDynamicCast(v17, v16);
  v23 = (id)objc_claimAutoreleasedReturnValue(v18);

  v19 = objc_opt_class(NSString);
  v20 = BUDynamicCast(v19, v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v22 = (void *)objc_opt_new(a1);
  objc_msgSend(v22, "presentAlertWithStyle:title:message:actions:metricsData:useSortStyle:options:", 1, v23, v21, v14, v13, 0, v12);

}

+ (id)createActionModelsFrom:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _JSAAlertActionModel *v7;
  void *v8;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueAtIndex:", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (objc_msgSend(v4, "isObject"))
  {
    v6 = 1;
    do
    {
      v7 = -[_JSAAlertActionModel initWithAction:]([_JSAAlertActionModel alloc], "initWithAction:", v4);
      objc_msgSend(v5, "addObject:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "valueAtIndex:", v6));

      ++v6;
      v4 = v8;
    }
    while ((objc_msgSend(v8, "isObject") & 1) != 0);
  }
  else
  {
    v8 = v4;
  }

  return v5;
}

- (void)_recordAlertMetrics:(id)a3 actionType:(id)a4 title:(id)a5 message:(id)a6 alertStyle:(int64_t)a7 actionTargetId:(id)a8 returnValue:(id)a9
{
  id v14;
  id v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  id v20;
  unsigned int v21;
  id *v22;
  id v23;
  void *v24;
  NSMutableString *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  void *i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD *v36;
  void *v37;
  void *v38;
  void *v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  void *v50;
  _BYTE v51[128];
  _QWORD v52[3];
  _QWORD v53[3];

  v45 = a3;
  v44 = a4;
  v43 = a5;
  v42 = a6;
  v14 = a8;
  v15 = a9;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v16, "timeIntervalSince1970");
  v18 = v17;

  v19 = v18 * 1000.0;
  v20 = JSARecordResultUnknown;
  v40 = v15;
  if (objc_msgSend(v15, "isBoolean"))
  {
    v21 = objc_msgSend(v15, "toBool");
    v22 = (id *)&JSARecordResultSuccess;
    if (!v21)
      v22 = (id *)&JSARecordResultFailure;
    v23 = *v22;

    v20 = v23;
  }
  v52[0] = JSARecordKeyUserActionTargetId;
  v52[1] = JSARecordKeyUserActionResult;
  v41 = v14;
  v53[0] = v14;
  v53[1] = v20;
  v52[2] = JSARecordKeyUserActionResponseTime;
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v19));
  v53[2] = v24;
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v53, v52, 3));

  v25 = objc_opt_new(NSMutableString);
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionModels](self, "actionModels"));
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v28; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "option"));
        -[NSMutableString appendString:](v25, "appendString:", v32);

        v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionModels](self, "actionModels"));
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "lastObject"));

        if (v31 != v34)
          -[NSMutableString appendString:](v25, "appendString:", CFSTR(" "));
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v46, v51, 16);
    }
    while (v28);
  }

  if (v45)
    v35 = objc_msgSend(v45, "mutableCopy");
  else
    v35 = &__NSDictionary0__struct;
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v44, JSARecordKeyActionType);
  v36 = &JSARecordDialogTypeAlert;
  if (a7 != 1)
    v36 = &JSARecordDialogTypeActionSheet;
  objc_msgSend(v35, "setObject:forKeyedSubscript:", *v36, JSARecordKeyDialogType);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v43, JSARecordKeyTitle);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v42, JSARecordKeyMessage);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v25, JSARecordKeyOptions);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v20, JSARecordKeyResult);
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v41, JSARecordKeyTargetId);
  v50 = v38;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v50, 1));
  objc_msgSend(v35, "setObject:forKeyedSubscript:", v37, JSARecordKeyUserActions);

  objc_msgSend(v35, "setObject:forKeyedSubscript:", JSARecordEventTypeDialog, JSARecordKeyEventType);
  +[JSAApplication recordNativeEvent:](JSAApplication, "recordNativeEvent:", v35);

}

- (id)createAlertControllerWith:(id)a3 alertStyle:(int64_t)a4 title:(id)a5 message:(id)a6 alignment:(int64_t)a7 tintColor:(id)a8 metricsData:(id)a9
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *i;
  void *j;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  char *v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  char v33;
  id v35;
  void *v36;
  id v37;
  char v38;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  id obj;
  uint64_t v45;
  id v47;
  id val;
  _QWORD v49[4];
  id v50;
  BSUIAlertController *v51;
  id v52;
  id v53;
  id v54;
  id v55;
  void *v56;
  id v57[2];
  id location;
  _QWORD v59[6];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];

  v35 = a3;
  v13 = a5;
  v14 = a6;
  v37 = a8;
  v41 = a9;
  v42 = v14;
  v43 = v13;
  v40 = (void *)a4;
  val = (id)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v13, v14, a4));
  if (v37)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(val, "view"));
    objc_msgSend(v15, "setTintColor:", v37);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[BSUIAlertController createActionModelsFrom:](BSUIAlertController, "createActionModelsFrom:", v35, v35));
  -[BSUIAlertController setActionModels:](self, "setActionModels:", v16);

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionModels](self, "actionModels"));
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v65;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v19)
          objc_enumerationMutation(v17);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i), "type") == (char *)&dword_0 + 1)
        {
          v38 = 0;
          goto LABEL_13;
        }
      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v64, v69, 16);
      if (v18)
        continue;
      break;
    }
  }
  v38 = 1;
LABEL_13:

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionModels](self, "actionModels"));
  v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
  if (v47)
  {
    v45 = *(_QWORD *)v61;
    do
    {
      for (j = 0; j != v47; j = (char *)j + 1)
      {
        if (*(_QWORD *)v61 != v45)
          objc_enumerationMutation(obj);
        v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v22, "type") == (char *)&dword_0 + 1)
        {
          v59[0] = _NSConcreteStackBlock;
          v59[1] = 3221225472;
          v59[2] = sub_22CD4;
          v59[3] = &unk_2E4C10;
          v59[4] = v22;
          v59[5] = self;
          objc_msgSend(val, "addTextFieldWithConfigurationHandler:", v59);
        }
        else
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "actionType"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "title"));
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "callback"));
          v26 = objc_msgSend(v22, "selected");
          v27 = (char *)objc_msgSend(v22, "style");
          objc_initWeak(&location, val);
          v49[0] = _NSConcreteStackBlock;
          v49[1] = 3221225472;
          v49[2] = sub_22D34;
          v49[3] = &unk_2E4C38;
          v28 = v25;
          v50 = v28;
          objc_copyWeak(v57, &location);
          v51 = self;
          v52 = v41;
          v29 = v23;
          v53 = v29;
          v54 = v43;
          v30 = v42;
          v57[1] = v40;
          v55 = v30;
          v56 = v22;
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v24, v27, v49));
          v32 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionsToActionModelsTable](self, "actionsToActionModelsTable"));
          objc_msgSend(v32, "setObject:forKey:", v22, v31);

          if ((objc_msgSend(v22, "allowsEmpty") & 1) == 0)
          {
            v33 = objc_msgSend(v22, "style") == (char *)&dword_0 + 1 ? 1 : v38;
            if ((v33 & 1) == 0)
              objc_msgSend(v31, "setEnabled:", 0);
          }
          if (v27 != (_BYTE *)&dword_0 + 1)
          {
            objc_msgSend(v31, "_setTitleTextAlignment:", a7);
            objc_msgSend(v31, "_setChecked:", v26);
          }
          objc_msgSend(val, "addAction:", v31);

          objc_destroyWeak(v57);
          objc_destroyWeak(&location);

        }
      }
      v47 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    }
    while (v47);
  }

  return val;
}

- (void)presentAlertWithStyle:(int64_t)a3 title:(id)a4 message:(id)a5 actions:(id)a6 metricsData:(id)a7 useSortStyle:(BOOL)a8 options:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD v26[4];
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  int64_t v34;
  BOOL v35;

  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_230C0;
  v28[3] = &unk_2E4C60;
  v35 = a8;
  v28[4] = self;
  v20 = v17;
  v29 = v20;
  v34 = a3;
  v21 = v15;
  v30 = v21;
  v22 = v16;
  v31 = v22;
  v23 = v18;
  v32 = v23;
  v24 = v19;
  v33 = v24;
  v25 = objc_retainBlock(v28);
  if (v25)
  {
    if (+[NSThread isMainThread](NSThread, "isMainThread"))
    {
      ((void (*)(_QWORD *))v25[2])(v25);
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_231D4;
      v26[3] = &unk_2E3F88;
      v27 = v25;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);

    }
  }

}

- (void)dismiss
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController alertController](self, "alertController"));
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 0, 0);

  -[BSUIAlertController setAlertController:](self, "setAlertController:", 0);
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  int v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _BOOL8 v30;
  id v31;
  void *v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v34 = a5;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController alertController](self, "alertController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "textFields"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v40;
    while (2)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v40 != v13)
          objc_enumerationMutation(v10);
        v15 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)v14);
        if (v15 == v9)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "text"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "stringByReplacingCharactersInRange:withString:", location, length, v34));

          v20 = objc_msgSend(v19, "length");
          if (!v20)
          {
LABEL_13:
            v21 = 1;
            goto LABEL_14;
          }
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "text"));
          v17 = objc_msgSend(v16, "length");

          if (!v17)
            goto LABEL_13;
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
      if (v12)
        continue;
      break;
    }
  }
  v21 = 0;
LABEL_14:

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "actions"));
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v36;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v36 != v25)
          objc_enumerationMutation(v22);
        v27 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)v26);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[BSUIAlertController actionsToActionModelsTable](self, "actionsToActionModelsTable"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "objectForKey:", v27));

        v30 = !v21
           || (objc_msgSend(v29, "allowsEmpty") & 1) != 0
           || objc_msgSend(v29, "style") == (char *)&dword_0 + 1;
        objc_msgSend(v27, "setEnabled:", v30);

        v26 = (char *)v26 + 1;
      }
      while (v24 != v26);
      v31 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      v24 = v31;
    }
    while (v31);
  }

  return 1;
}

- (UIAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (NSMapTable)actionsToActionModelsTable
{
  return self->_actionsToActionModelsTable;
}

- (void)setActionsToActionModelsTable:(id)a3
{
  objc_storeStrong((id *)&self->_actionsToActionModelsTable, a3);
}

- (NSArray)actionModels
{
  return self->_actionModels;
}

- (void)setActionModels:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionModels, 0);
  objc_storeStrong((id *)&self->_actionsToActionModelsTable, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
}

@end
