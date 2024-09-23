@implementation BKAcquireSlotDialogResponse

+ (BOOL)isDialogResponse:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("dialog")));
  v4 = v3 != 0;

  return v4;
}

- (BKAcquireSlotDialogResponse)initWithDialogDictionary:(id)a3
{
  id v4;
  BKAcquireSlotDialogResponse *v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *dialogDictionary;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BKAcquireSlotDialogResponse;
  v5 = -[BKAcquireSlotDialogResponse init](&v10, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("dialog")));
    v7 = (NSDictionary *)objc_msgSend(v6, "copy");
    dialogDictionary = v5->_dialogDictionary;
    v5->_dialogDictionary = v7;

  }
  return v5;
}

- (id)createTransferDialogWithCompletion:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  void *v27;
  id obj;
  id v29;
  _QWORD v30[5];
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];

  v29 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v4 = objc_opt_class(NSString);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse dialogDictionary](self, "dialogDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("message")));
  v7 = BUDynamicCast(v4, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);

  v9 = objc_opt_class(NSString);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse dialogDictionary](self, "dialogDictionary"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("explanation")));
  v12 = BUDynamicCast(v9, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse dialogDictionary](self, "dialogDictionary"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse _createButtonsFromDialogDictionary:](self, "_createButtonsFromDialogDictionary:", v14));

  v27 = (void *)v8;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v8, v13, 1));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = v15;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "title"));
        v23 = objc_msgSend(v21, "style");
        v30[0] = _NSConcreteStackBlock;
        v30[1] = 3221225472;
        v30[2] = sub_1001BD348;
        v30[3] = &unk_1008EE898;
        v24 = v29;
        v30[4] = v21;
        v31 = v24;
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v22, v23, v30));
        objc_msgSend(v16, "addAction:", v25);

      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v18);
  }

  return v16;
}

- (id)_createButtonsFromDialogDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  const __CFString *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v4 = a3;
  v5 = objc_alloc_init((Class)NSMutableArray);
  v6 = objc_opt_class(NSString);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonString")));
  v8 = BUDynamicCast(v6, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!v9)
  {
    v10 = objc_opt_class(NSString);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButton")));
    v12 = BUDynamicCast(v10, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v12);

  }
  if (objc_msgSend(v9, "length"))
  {
    v13 = objc_opt_class(NSDictionary);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("okButtonAction")));
    v15 = BUDynamicCast(v13, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse _createActionFromButtonDictionary:title:](self, "_createActionFromButtonDictionary:title:", v16, v9));
    objc_msgSend(v5, "addObject:", v17);

  }
  v18 = objc_opt_class(NSString);
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButtonString")));
  v20 = BUDynamicCast(v18, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  if (v21
    || (v22 = objc_opt_class(NSString),
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelButton"))),
        v24 = BUDynamicCast(v22, v23),
        v21 = (void *)objc_claimAutoreleasedReturnValue(v24),
        v23,
        v21))
  {
    v25 = CFSTR("cancelButtonAction");
  }
  else
  {
    v32 = objc_opt_class(NSString);
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("otherButtonString")));
    v34 = BUDynamicCast(v32, v33);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v34);

    v25 = CFSTR("otherButtonAction");
  }
  if (objc_msgSend(v21, "length"))
  {
    v26 = objc_opt_class(NSDictionary);
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", v25));
    v28 = BUDynamicCast(v26, v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKAcquireSlotDialogResponse _createActionFromButtonDictionary:title:](self, "_createActionFromButtonDictionary:title:", v29, v21));
    objc_msgSend(v30, "setStyle:", 1);
    objc_msgSend(v5, "addObject:", v30);

  }
  return v5;
}

- (id)_createActionFromButtonDictionary:(id)a3 title:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_BKAcquireSlotDialogButtonAction actionButtonWithTitle:](_BKAcquireSlotDialogButtonAction, "actionButtonWithTitle:", a4));
  v7 = objc_opt_class(NSString);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("buyParams")));

  v9 = BUDynamicCast(v7, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(v6, "setBuyParams:", v10);

  return v6;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
}

@end
