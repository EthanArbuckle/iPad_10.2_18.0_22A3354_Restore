@implementation ISDialogOperation

- (ISDialogOperation)init
{
  ISDialogOperation *result;
  objc_super v4;

  __ISRecordSPIClassUsage(self);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  result = -[ISOperation init](&v4, sel_init);
  if (result)
    result->_performDefaultActions = 1;
  return result;
}

- (void)dealloc
{
  __CFUserNotification *v3;
  objc_super v4;

  -[ISDialogOperation setDialog:](self, "setDialog:", 0);
  -[ISDialogOperation setSelectedButton:](self, "setSelectedButton:", 0);
  v3 = -[ISDialogOperation userNotification](self, "userNotification");
  if (v3)
    CFUserNotificationCancel(v3);
  -[ISDialogOperation setUserNotification:](self, "setUserNotification:", 0);

  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  -[ISDialogOperation dealloc](&v4, sel_dealloc);
}

+ (id)operationWithDialog:(id)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setDialog:", a3);
  return v4;
}

+ (id)operationWithError:(id)a3
{
  ISDialog *v4;
  void *v5;

  v4 = -[ISDialog initWithError:]([ISDialog alloc], "initWithError:", a3);
  v5 = (void *)objc_msgSend(a1, "operationWithDialog:", v4);

  return v5;
}

- (void)handleButtonSelected:(int64_t)a3 withResponseDictionary:(id)a4
{
  ISOperationDelegate *v7;
  NSArray *v8;
  id v9;
  void *v10;
  NSArray *v11;

  v7 = -[ISOperation delegate](self, "delegate");
  v8 = -[ISDialog buttons](-[ISDialogOperation dialog](self, "dialog"), "buttons");
  if (-[NSArray count](v8, "count") <= a3)
    v9 = 0;
  else
    v9 = -[NSArray objectAtIndex:](v8, "objectAtIndex:", a3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[ISOperationDelegate operation:selectedButton:](v7, "operation:selectedButton:", self, v9);
  }
  else if (-[ISDialogOperation performDefaultActions](self, "performDefaultActions"))
  {
    objc_msgSend(v9, "performDefaultActionForDialog:", -[ISDialogOperation dialog](self, "dialog"));
  }
  -[ISDialogOperation setSelectedButton:](self, "setSelectedButton:", v9);
  -[ISOperation lock](self, "lock");
  v10 = (void *)objc_msgSend(a4, "objectForKey:", *MEMORY[0x24BDBD728]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v10, 0);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = (NSArray *)objc_msgSend(v10, "copy");
    else
      v11 = 0;
  }
  self->_textFieldValues = v11;
  -[ISOperation unlock](self, "unlock");
  -[ISOperation setSuccess:](self, "setSuccess:", 1);
}

- (NSArray)textFieldValues
{
  NSArray *v3;

  -[ISOperation lock](self, "lock");
  v3 = self->_textFieldValues;
  -[ISOperation unlock](self, "unlock");
  return v3;
}

- (void)cancel
{
  __CFUserNotification *v3;
  objc_super v4;

  v3 = -[ISDialogOperation userNotification](self, "userNotification");
  if (v3)
    CFUserNotificationCancel(v3);
  v4.receiver = self;
  v4.super_class = (Class)ISDialogOperation;
  -[ISOperation cancel](&v4, sel_cancel);
}

- (void)run
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  NSArray *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  __int16 v24;
  NSArray *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v3 = -[ISOperation copySerializationLocks](self, "copySerializationLocks");
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "makeObjectsPerformSelector:", sel_lock);
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v5)
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v6 = objc_msgSend(v5, "shouldLog");
    if (objc_msgSend(v5, "shouldLogToDisk"))
      v7 = v6 | 2;
    else
      v7 = v6;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v5, "OSLogObject"), OS_LOG_TYPE_INFO))
      v7 &= 2u;
    if (v7)
    {
      v22 = 138412546;
      v23 = objc_opt_class();
      v24 = 2112;
      v25 = -[ISOperation serializationLockIdentifiers](self, "serializationLockIdentifiers");
      LODWORD(v21) = 22;
      v20 = &v22;
      v8 = _os_log_send_and_compose_impl();
      if (v8)
      {
        v9 = (void *)v8;
        v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v8, 4, &v22, v21);
        free(v9);
        v20 = (int *)v10;
        SSFileLog();
      }
    }
    -[ISOperation sendDidTakeSerializationLocks](self, "sendDidTakeSerializationLocks", v20);
  }
  -[ISDialogOperation _run](self, "_run");
  if (v4)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v11)
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v12 = objc_msgSend(v11, "shouldLog");
    v13 = objc_msgSend(v11, "shouldLogToDisk");
    v14 = objc_msgSend(v11, "OSLogObject");
    if (v13)
      v12 |= 2u;
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      v12 &= 2u;
    if (v12)
    {
      v15 = objc_opt_class();
      v16 = -[ISOperation serializationLockIdentifiers](self, "serializationLockIdentifiers");
      v22 = 138412546;
      v23 = v15;
      v24 = 2112;
      v25 = v16;
      LODWORD(v21) = 22;
      v20 = &v22;
      v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v17, 4, &v22, v21);
        free(v18);
        v20 = (int *)v19;
        SSFileLog();
      }
    }
    objc_msgSend(v4, "makeObjectsPerformSelector:", sel_unlock, v20);

  }
}

- (void)_handleResponseForNotification:(__CFUserNotification *)a3 responseFlags:(unint64_t)a4
{
  NSUInteger v7;
  __CFString *v8;
  uint64_t v9;
  NSUInteger v10;

  v7 = -[NSArray count](-[ISDialog buttons](-[ISDialogOperation dialog](self, "dialog"), "buttons"), "count");
  if (v7 == 3)
  {
    v8 = +[ISDialog buttonTitleKeyForCFUserNotificationButtonTag:](ISDialog, "buttonTitleKeyForCFUserNotificationButtonTag:", a4 & 3);
    if (v8)
    {
      v9 = objc_msgSend(-[ISDialog orderedButtonTitleKeysForCFUserNotification](-[ISDialogOperation dialog](self, "dialog"), "orderedButtonTitleKeysForCFUserNotification"), "indexOfObject:", v8);
      goto LABEL_14;
    }
LABEL_9:
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_14;
  }
  if (a4 == 3)
    goto LABEL_9;
  v10 = v7;
  if (a4 == 2)
  {
    if (objc_msgSend(MEMORY[0x24BEB1DE8], "deviceIsAppleTV")
      || !-[ISDialog noDefaultButton](self->_dialog, "noDefaultButton"))
    {
      v9 = v10 - 2;
    }
    else
    {
      v9 = v10 - 1;
    }
  }
  else if (a4)
  {
    v9 = 0;
  }
  else
  {
    v9 = v7 - 1;
  }
LABEL_14:
  -[ISDialogOperation handleButtonSelected:withResponseDictionary:](self, "handleButtonSelected:withResponseDictionary:", v9, CFUserNotificationGetResponseDictionary(a3));
}

- (void)_run
{
  ISDialog *v3;
  ISDialog *v4;
  Class v5;
  id v6;
  ISDevice *v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  int v23;
  int v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  int v29;
  int v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  int *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  _BYTE v45[128];
  int v46;
  uint64_t v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v3 = -[ISDialogOperation dialog](self, "dialog");
  if (v3 && (v4 = v3, -[ISDialog isDisplayable](v3, "isDisplayable")))
  {
    v5 = NSClassFromString(CFSTR("DialogManager"));
    v6 = -[ISDialog copyUserNotification](v4, "copyUserNotification");
    if (v6)
    {
      if (!v5
        || (-[objc_class checkInDialog:](v5, "checkInDialog:", v4) & 1) != 0
        || -[ISDialog allowDuplicates](v4, "allowDuplicates"))
      {
        v7 = +[ISDevice sharedInstance](ISDevice, "sharedInstance");
        v8 = -[ISOperation copyActivePowerAssertionIdentifiers](self, "copyActivePowerAssertionIdentifiers");
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        if (!v9)
          v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v10 = objc_msgSend(v9, "shouldLog");
        if (objc_msgSend(v9, "shouldLogToDisk"))
          v11 = v10 | 2;
        else
          v11 = v10;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_DEBUG))
          v11 &= 2u;
        if (v11)
        {
          v46 = 138412546;
          v47 = objc_opt_class();
          v48 = 2048;
          v49 = objc_msgSend(v8, "count");
          LODWORD(v35) = 22;
          v34 = &v46;
          v12 = _os_log_send_and_compose_impl();
          if (v12)
          {
            v13 = (void *)v12;
            v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v46, v35);
            free(v13);
            v34 = (int *)v14;
            SSFileLog();
          }
        }
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16, v34);
        if (v15)
        {
          v16 = *(_QWORD *)v41;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v41 != v16)
                objc_enumerationMutation(v8);
              -[ISDevice releasePowerAssertion:](v7, "releasePowerAssertion:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * i));
            }
            v15 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          }
          while (v15);
        }
        v18 = (void *)-[objc_class daemon](NSClassFromString(CFSTR("Daemon")), "daemon");
        objc_msgSend(v18, "beginShowingDialog");
        -[ISDialogOperation _showUserNotification:](self, "_showUserNotification:", v6);
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
        if (v19)
        {
          v20 = *(_QWORD *)v37;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v37 != v20)
                objc_enumerationMutation(v8);
              -[ISDevice takePowerAssertion:](v7, "takePowerAssertion:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * j));
            }
            v19 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v44, 16);
          }
          while (v19);
        }
        -[objc_class checkOutDialog:](v5, "checkOutDialog:", v4);
        objc_msgSend(v18, "endShowingDialog");

      }
      else
      {
        v28 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        if (!v28)
          v28 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v29 = objc_msgSend(v28, "shouldLog");
        if (objc_msgSend(v28, "shouldLogToDisk"))
          v30 = v29 | 2;
        else
          v30 = v29;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v28, "OSLogObject"), OS_LOG_TYPE_INFO))
          v30 &= 2u;
        if (v30)
        {
          v46 = 138412290;
          v47 = objc_opt_class();
          LODWORD(v35) = 12;
          v34 = &v46;
          v31 = _os_log_send_and_compose_impl();
          if (v31)
          {
            v32 = (void *)v31;
            v33 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v31, 4, &v46, v35);
            free(v32);
            v34 = (int *)v33;
            SSFileLog();
          }
        }
        -[ISOperation setSuccess:](self, "setSuccess:", 1, v34);
      }
    }
    else
    {
      -[ISOperation setError:](self, "setError:", ISError());
    }

  }
  else
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    if (!v22)
      v22 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
    v23 = objc_msgSend(v22, "shouldLog");
    if (objc_msgSend(v22, "shouldLogToDisk"))
      v24 = v23 | 2;
    else
      v24 = v23;
    if (!os_log_type_enabled((os_log_t)objc_msgSend(v22, "OSLogObject"), OS_LOG_TYPE_INFO))
      v24 &= 2u;
    if (v24)
    {
      v46 = 138412290;
      v47 = objc_opt_class();
      LODWORD(v35) = 12;
      v34 = &v46;
      v25 = _os_log_send_and_compose_impl();
      if (v25)
      {
        v26 = (void *)v25;
        v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v25, 4, &v46, v35);
        free(v26);
        v34 = (int *)v27;
        SSFileLog();
      }
    }
    -[ISOperation setSuccess:](self, "setSuccess:", 1, v34);
  }
}

- (void)_showUserNotification:(id)a3
{
  uint64_t v5;
  const void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  void *v19;
  int *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_msgSend(a3, "copyUserNotification");
  if (v5)
  {
    v6 = (const void *)v5;
    -[ISDialogOperation setUserNotification:](self, "setUserNotification:", v5);
    -[ISDialogOperation _waitForUserNotificationResponse:](self, "_waitForUserNotificationResponse:", v6);
    -[ISDialogOperation setUserNotification:](self, "setUserNotification:", 0);
    CFRelease(v6);
  }
  else
  {
    v7 = objc_msgSend(a3, "currentRetryCount");
    v8 = objc_msgSend(a3, "allowedRetryCount");
    v9 = objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
    v10 = (void *)v9;
    if (v7 >= v8)
    {
      if (!v9)
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v16 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v17 = v16 | 2;
      else
        v17 = v16;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v17 &= 2u;
      if (v17)
      {
        v22 = 138412290;
        v23 = objc_opt_class();
        LODWORD(v21) = 12;
        v18 = _os_log_send_and_compose_impl();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v18, 4, &v22, v21);
          free(v19);
          SSFileLog();
        }
      }
      -[ISOperation setError:](self, "setError:", ISError());
    }
    else
    {
      if (!v9)
        v10 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v11 = objc_msgSend(v10, "shouldLog");
      if (objc_msgSend(v10, "shouldLogToDisk"))
        v12 = v11 | 2;
      else
        v12 = v11;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v10, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v12 &= 2u;
      if (v12)
      {
        v22 = 138412290;
        v23 = objc_opt_class();
        LODWORD(v21) = 12;
        v20 = &v22;
        v13 = _os_log_send_and_compose_impl();
        if (v13)
        {
          v14 = (void *)v13;
          v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v13, 4, &v22, v21);
          free(v14);
          v20 = (int *)v15;
          SSFileLog();
        }
      }
      objc_msgSend(a3, "setCurrentRetryCount:", objc_msgSend(a3, "currentRetryCount", v20) + 1);
      objc_msgSend(MEMORY[0x24BDD17F0], "sleepForTimeInterval:", 3.0);
      -[ISDialogOperation _showUserNotification:](self, "_showUserNotification:", a3);
    }
  }
}

- (void)_waitForUserNotificationResponse:(__CFUserNotification *)a3
{
  CFOptionFlags responseFlags;

  responseFlags = 0;
  if (!CFUserNotificationReceiveResponse(a3, 0.0, &responseFlags))
  {
    -[ISDialogOperation _handleResponseForNotification:responseFlags:](self, "_handleResponseForNotification:responseFlags:", a3, responseFlags);
    -[ISDialog incrementDisplayCount](-[ISDialogOperation dialog](self, "dialog"), "incrementDisplayCount");
    -[ISOperation setSuccess:](self, "setSuccess:", 1);
  }
}

- (ISDialog)dialog
{
  return (ISDialog *)objc_getProperty(self, a2, 336, 1);
}

- (void)setDialog:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 336);
}

- (BOOL)performDefaultActions
{
  return self->_performDefaultActions;
}

- (void)setPerformDefaultActions:(BOOL)a3
{
  self->_performDefaultActions = a3;
}

- (ISDialogButton)selectedButton
{
  return (ISDialogButton *)objc_getProperty(self, a2, 352, 1);
}

- (void)setSelectedButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 352);
}

- (id)userNotification
{
  return objc_getProperty(self, a2, 368, 1);
}

- (void)setUserNotification:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 368);
}

@end
