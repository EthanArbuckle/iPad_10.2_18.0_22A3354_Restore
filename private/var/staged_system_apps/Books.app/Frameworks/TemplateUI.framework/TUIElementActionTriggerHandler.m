@implementation TUIElementActionTriggerHandler

- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 actionObject:(id)a4 actionDelegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUIElementActionTriggerHandler *v12;
  TUIElementActionTriggerHandler *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUIElementActionTriggerHandler;
  v12 = -[TUIElementActionTriggerHandler init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_actionsData, a3);
    objc_storeStrong(&v13->_actionObject, a4);
    objc_storeWeak((id *)&v13->_actionDelegate, v11);
  }

  return v13;
}

- (TUIElementActionTriggerHandler)initWithActionsData:(id)a3 block:(id)a4
{
  id v7;
  id v8;
  TUIElementActionTriggerHandler *v9;
  TUIElementActionTriggerHandler *v10;
  id v11;
  id block;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)TUIElementActionTriggerHandler;
  v9 = -[TUIElementActionTriggerHandler init](&v14, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_actionsData, a3);
    v11 = objc_retainBlock(v8);
    block = v10->_block;
    v10->_block = v11;

  }
  return v10;
}

- (BOOL)isEqualToHandler:(id)a3
{
  TUIElementActionTriggerHandler *v4;
  TUIElementActionTriggerHandler *v5;
  TUIElementTriggerBehaviorMap *actionsData;
  void *v7;
  id actionObject;
  id v9;
  char v10;
  id WeakRetained;
  id v12;

  v4 = (TUIElementActionTriggerHandler *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    actionsData = self->_actionsData;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementActionTriggerHandler actionsData](v4, "actionsData"));
    LODWORD(actionsData) = -[TUIElementTriggerBehaviorMap isEqual:](actionsData, "isEqual:", v7);

    if ((_DWORD)actionsData
      && (actionObject = self->_actionObject,
          v9 = (id)objc_claimAutoreleasedReturnValue(-[TUIElementActionTriggerHandler actionObject](v5, "actionObject")),
          v9,
          actionObject == v9))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      v12 = (id)objc_claimAutoreleasedReturnValue(-[TUIElementActionTriggerHandler actionDelegate](v5, "actionDelegate"));
      v10 = WeakRetained == v12;

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5 arguments:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  _BOOL8 v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  NSObject *v24;
  unsigned __int8 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  void *v32;
  id WeakRetained;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  id v42;
  TUIElementActionTriggerHandler *v43;
  uint8_t buf[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  _BOOL8 v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = TUIActionLog();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = v12;
    v16 = v7;
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "layoutAttributes"));
    v43 = self;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "renderModel"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
    v21 = v11;
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "tui_identifierToString"));
    *(_DWORD *)buf = 138544386;
    v45 = v10;
    v46 = 2114;
    v47 = v21;
    v48 = 2048;
    v49 = v16;
    v12 = v15;
    v50 = 2112;
    v51 = v15;
    v52 = 2114;
    v53 = v22;
    _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "invoke trigger='%{public}@ view=%{public}@ allowRefId=%lu arguments=%@ view.id=%{public}@", buf, 0x34u);

    v11 = v21;
    v7 = v18;
    self = v43;

  }
  if (!self->_block)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap behaviorDataForTrigger:](self->_actionsData, "behaviorDataForTrigger:", v10));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "behavior"));
    if (v27)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "arguments"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "dictionaryByAddingEntriesFromDictionary:", v12));

      v30 = TUIActionLog();
      v31 = objc_claimAutoreleasedReturnValue(v30);
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "behavior"));
        *(_DWORD *)buf = 138543618;
        v45 = v32;
        v46 = 2112;
        v47 = v29;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "invoke: trigger via behavior=%{public}@ arguments=%@", buf, 0x16u);

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
      v25 = objc_msgSend(WeakRetained, "handleActionForObject:withName:arguments:", self->_actionObject, v27, v29);
      goto LABEL_11;
    }
    v25 = 0;
    if (v26 || !v7)
      goto LABEL_13;
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap refIdForTrigger:](self->_actionsData, "refIdForTrigger:", v10));
    if (!objc_msgSend(v29, "length"))
    {
      v25 = 0;
      goto LABEL_12;
    }
    WeakRetained = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "descendentViewWithRefId:", v29));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "layoutAttributes"));
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "renderModel"));

    if (WeakRetained == v11)
    {
      v37 = v12;
      v38 = v11;
      v42 = TUIActionLog();
      v41 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
        sub_17EAA4((uint64_t)v29, v38, v41);
      v25 = 0;
    }
    else
    {
      if ((objc_opt_respondsToSelector(v36, "actionHandler") & 1) == 0)
      {
        v25 = 0;
        goto LABEL_29;
      }
      v37 = v12;
      v38 = v11;
      v39 = TUIActionLog();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543618;
        v45 = v29;
        v46 = 2114;
        v47 = WeakRetained;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "invoke: via refId=%{public}@ descendentView=%{public}@", buf, 0x16u);
      }

      v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "actionHandler"));
      v25 = -[NSObject invoke:view:allowRefId:arguments:](v41, "invoke:view:allowRefId:arguments:", v10, v38, 1, v37);
    }

    v11 = v38;
    v12 = v37;
LABEL_29:

LABEL_11:
LABEL_12:

LABEL_13:
    goto LABEL_14;
  }
  v23 = TUIActionLog();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "invoke: trigger via block", buf, 2u);
  }

  (*((void (**)(void))self->_block + 2))();
  v25 = 1;
LABEL_14:

  return v25;
}

- (BOOL)invoke:(id)a3 view:(id)a4
{
  return -[TUIElementActionTriggerHandler invoke:view:allowRefId:](self, "invoke:view:allowRefId:", a3, a4, 0);
}

- (BOOL)invoke:(id)a3 arguments:(id)a4
{
  return -[TUIElementActionTriggerHandler invoke:view:allowRefId:arguments:](self, "invoke:view:allowRefId:arguments:", a3, 0, 0, a4);
}

+ (id)argumentsForView:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _QWORD v23[6];
  _QWORD v24[6];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  objc_msgSend(v3, "center");
  objc_msgSend(v4, "convertPoint:toView:", 0);
  v6 = v5;
  v8 = v7;

  objc_msgSend(v3, "bounds");
  if (v3)
  {
    v11 = v9;
    v12 = v10;
    v23[0] = CFSTR("sourceViewIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "layoutAttributes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "renderModel"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "tui_identifierToString"));
    v24[0] = v16;
    v24[1] = v3;
    v23[1] = CFSTR("sourceView");
    v23[2] = CFSTR("width");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11));
    v24[2] = v17;
    v23[3] = CFSTR("height");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
    v24[3] = v18;
    v23[4] = CFSTR("positionX");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v6));
    v24[4] = v19;
    v23[5] = CFSTR("positionY");
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v24[5] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 6));

  }
  else
  {
    v21 = &__NSDictionary0__struct;
  }

  return v21;
}

- (BOOL)invoke:(id)a3 view:(id)a4 allowRefId:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  id v10;
  void *v11;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  v10 = objc_msgSend((id)objc_opt_class(self), "argumentsForView:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  LOBYTE(v5) = -[TUIElementActionTriggerHandler invoke:view:allowRefId:arguments:](self, "invoke:view:allowRefId:arguments:", v9, v8, v5, v11);

  return v5;
}

- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5
{
  return -[TUIElementActionTriggerHandler invoke:view:point:allowRefId:](self, "invoke:view:point:allowRefId:", a3, a4, 0, a5.x, a5.y);
}

- (BOOL)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 allowRefId:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  _QWORD v23[6];
  _QWORD v24[6];

  v6 = a6;
  y = a5.y;
  x = a5.x;
  v11 = a3;
  v12 = a4;
  objc_msgSend(v12, "convertPoint:toView:", 0, x, y);
  if (v12)
  {
    v15 = v13;
    v16 = v14;
    v24[0] = v12;
    v23[0] = CFSTR("sourceView");
    v23[1] = CFSTR("sourcePoint");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y));
    v24[1] = v17;
    v24[2] = &off_254AC0;
    v23[2] = CFSTR("width");
    v23[3] = CFSTR("height");
    v24[3] = &off_254AC0;
    v23[4] = CFSTR("positionX");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v15));
    v24[4] = v18;
    v23[5] = CFSTR("positionY");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v16));
    v24[5] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 6));
    v21 = -[TUIElementActionTriggerHandler invoke:view:allowRefId:arguments:](self, "invoke:view:allowRefId:arguments:", v11, v12, v6, v20);

  }
  else
  {
    v21 = -[TUIElementActionTriggerHandler invoke:view:allowRefId:arguments:](self, "invoke:view:allowRefId:arguments:", v11, 0, v6, 0);
  }

  return v21;
}

- (void)invoke:(id)a3 view:(id)a4 point:(CGPoint)a5 completion:(id)a6
{
  double y;
  double x;
  id v11;
  id v12;
  NSMutableDictionary *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;

  y = a5.y;
  x = a5.x;
  v19 = a6;
  v11 = a4;
  v12 = a3;
  v13 = objc_opt_new(NSMutableDictionary);
  v14 = objc_retainBlock(v19);
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v14, CFSTR("completion"));

  v15 = objc_msgSend((id)objc_opt_class(self), "argumentsForView:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
  -[NSMutableDictionary addEntriesFromDictionary:](v13, "addEntriesFromDictionary:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGPoint:](NSValue, "valueWithCGPoint:", x, y));
  -[NSMutableDictionary setObject:forKeyedSubscript:](v13, "setObject:forKeyedSubscript:", v17, CFSTR("sourcePoint"));

  v18 = -[NSMutableDictionary copy](v13, "copy");
  LOBYTE(self) = -[TUIElementActionTriggerHandler invoke:view:allowRefId:arguments:](self, "invoke:view:allowRefId:arguments:", v12, v11, 0, v18);

  if ((self & 1) == 0)
    (*((void (**)(id, void *))v19 + 2))(v19, &__NSDictionary0__struct);

}

- (BOOL)hasActionForTrigger:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap behaviorDataForTrigger:](self->_actionsData, "behaviorDataForTrigger:", v4));
  if (v5)
  {
    v6 = 1;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TUIElementTriggerBehaviorMap refIdForTrigger:](self->_actionsData, "refIdForTrigger:", v4));
    v6 = v7 != 0;

  }
  return v6;
}

- (id)keyCommands
{
  NSMutableArray *v3;

  v3 = objc_opt_new(NSMutableArray);
  -[TUIElementActionTriggerHandler addKeyCommands:](self, "addKeyCommands:", v3);
  return v3;
}

- (void)addKeyCommands:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[2];

  v4 = a3;
  if (-[TUIElementActionTriggerHandler hasActionForTrigger:](self, "hasActionForTrigger:", CFSTR("press")))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0, "tui_handleSelectKey:"));
    v12[0] = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\x03"), 0, "tui_handleSelectKey:"));
    v12[1] = v6;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 2));
    objc_msgSend(v4, "addObjectsFromArray:", v7);

  }
  if (-[TUIElementActionTriggerHandler hasActionForTrigger:](self, "hasActionForTrigger:", CFSTR("context-menu")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\r"), 0x40000, "tui_handleContextMenuKey:"));
    v11[0] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIKeyCommand keyCommandWithInput:modifierFlags:action:](UIKeyCommand, "keyCommandWithInput:modifierFlags:action:", CFSTR("\x03"), 0x40000, "tui_handleContextMenuKey:"));
    v11[1] = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 2));
    objc_msgSend(v4, "addObjectsFromArray:", v10);

  }
}

- (TUIElementTriggerBehaviorMap)actionsData
{
  return self->_actionsData;
}

- (id)actionObject
{
  return self->_actionObject;
}

- (TUIActionHandlerDelegate)actionDelegate
{
  return (TUIActionHandlerDelegate *)objc_loadWeakRetained((id *)&self->_actionDelegate);
}

- (id)block
{
  return self->_block;
}

- (NSString)refId
{
  return self->_refId;
}

- (void)setRefId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_refId, 0);
  objc_storeStrong(&self->_block, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong(&self->_actionObject, 0);
  objc_storeStrong((id *)&self->_actionsData, 0);
}

@end
