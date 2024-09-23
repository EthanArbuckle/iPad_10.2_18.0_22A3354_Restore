@implementation WFActionUserInterfaceListener

- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5
{
  return -[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:](self, "initWithUserInterfaceType:actionClassName:classNamesByType:attribution:", a3, a4, a5, 0);
}

- (WFActionUserInterfaceListener)initWithUserInterfaceType:(id)a3 actionClassName:(id)a4 classNamesByType:(id)a5 attribution:(id)a6
{
  NSString *v10;
  NSString *v11;
  id v12;
  id v13;
  Class v14;
  NSObject *v15;
  NSString *v16;
  NSString *v17;
  objc_class *v18;
  NSObject *v19;
  WFActionUserInterfaceListener *v20;
  WFActionUserInterfaceListener *v21;
  const char *v22;
  NSObject *v23;
  os_log_type_t v24;
  uint32_t v25;
  objc_super v27;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  NSString *v31;
  __int16 v32;
  NSString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v10 = (NSString *)a3;
  v11 = (NSString *)a4;
  v12 = a5;
  v13 = a6;
  v14 = NSClassFromString(v11);
  if (v14)
  {
    -[objc_class userInterfaceXPCInterface](v14, "userInterfaceXPCInterface");
    v15 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v16 = (NSString *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = NSClassFromString(v16);
      if (v18)
      {
        v19 = objc_msgSend([v18 alloc], "initWithUserInterfaceType:attribution:", v10, v13);
        v27.receiver = self;
        v27.super_class = (Class)WFActionUserInterfaceListener;
        v20 = -[WFSingleConnectionXPCListener initWithExportedObject:exportedInterface:](&v27, sel_initWithExportedObject_exportedInterface_, v19, v15);
        self = v20;
        if (v20)
        {
          objc_storeStrong((id *)&v20->_actionInterface, v19);
          self = self;
          v21 = self;
LABEL_15:

          goto LABEL_16;
        }
LABEL_14:
        v21 = 0;
        goto LABEL_15;
      }
      getWFDialogLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
        goto LABEL_14;
      *(_DWORD *)buf = 136315394;
      v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
      v30 = 2114;
      v31 = v17;
      v22 = "%s No interface class found with name: %{public}@";
      v23 = v19;
      v24 = OS_LOG_TYPE_FAULT;
      v25 = 22;
    }
    else
    {
      getWFDialogLogObject();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      *(_DWORD *)buf = 136315650;
      v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
      v30 = 2114;
      v31 = v10;
      v32 = 2114;
      v33 = v11;
      v22 = "%s No user interface of type %{public}@ for action: %{public}@";
      v23 = v19;
      v24 = OS_LOG_TYPE_ERROR;
      v25 = 32;
    }
    _os_log_impl(&dword_227027000, v23, v24, v22, buf, v25);
    goto LABEL_14;
  }
  getWFDialogLogObject();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "-[WFActionUserInterfaceListener initWithUserInterfaceType:actionClassName:classNamesByType:attribution:]";
    v30 = 2114;
    v31 = v11;
    _os_log_impl(&dword_227027000, v15, OS_LOG_TYPE_FAULT, "%s Action class not loaded: %{public}@", buf, 0x16u);
  }
  v21 = 0;
LABEL_16:

  return v21;
}

- (WFActionUserInterface)actionInterface
{
  return self->_actionInterface;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionInterface, 0);
}

@end
