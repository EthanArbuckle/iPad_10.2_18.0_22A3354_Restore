@implementation SUDialogManager

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUDialogManager;
  -[SUDialogManager dealloc](&v3, sel_dealloc);
}

+ (void)setSharedInstance:(id)a3
{
  _os_nospin_lock_lock();
  if ((id)__SharedInstance != a3)
  {

    __SharedInstance = (uint64_t)a3;
  }
  _os_nospin_lock_unlock();
}

+ (id)sharedInstance
{
  id v2;
  id v3;

  _os_nospin_lock_lock();
  v2 = (id)__SharedInstance;
  if (!__SharedInstance)
  {
    v2 = objc_alloc_init((Class)objc_opt_class());
    __SharedInstance = (uint64_t)v2;
  }
  v3 = v2;
  _os_nospin_lock_unlock();
  return v3;
}

+ (id)newDialogWithError:(id)a3
{
  void *v4;
  id result;

  if (!a3)
    return 0;
  v4 = (void *)objc_msgSend(a3, "userInfo");
  result = (id)objc_msgSend(v4, "objectForKey:", *MEMORY[0x24BEC8AD0]);
  if (!result)
    return (id)objc_msgSend(objc_alloc(MEMORY[0x24BEC8B90]), "initWithError:", a3);
  return result;
}

- (int64_t)numberOfPendingDialogs
{
  return -[NSMutableArray count](self->_dialogs, "count");
}

- (BOOL)presentDialog:(id)a3
{
  uint64_t v5;
  _QWORD v7[6];

  v5 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __33__SUDialogManager_presentDialog___block_invoke;
  v7[3] = &unk_24DE7B988;
  v7[4] = v5;
  v7[5] = a3;
  return -[SUDialogManager presentDialog:withCompletionBlock:](self, "presentDialog:withCompletionBlock:", a3, v7);
}

uint64_t __33__SUDialogManager_presentDialog___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_performDefaultActionForDialog:buttonIndex:", *(_QWORD *)(a1 + 40), a2);
}

- (BOOL)presentDialog:(id)a3 withCompletionBlock:(id)a4
{
  int v7;
  void *v8;
  int v9;
  int v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int *v18;
  uint64_t v19;
  _QWORD v20[7];
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v7 = objc_msgSend(a3, "isDisplayable");
  if (v7)
  {
    if (!self->_dialogs)
      self->_dialogs = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    if (!-[SUDialogManager _isDisplayingEquivalentDialog:](self, "_isDisplayingEquivalentDialog:", a3))
    {
      v8 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
      v9 = objc_msgSend(v8, "shouldLog");
      if (objc_msgSend(v8, "shouldLogToDisk"))
        v10 = v9 | 2;
      else
        v10 = v9;
      if (!os_log_type_enabled((os_log_t)objc_msgSend(v8, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
        v10 &= 2u;
      if (v10)
      {
        v21 = 138543362;
        v22 = objc_opt_class();
        LODWORD(v19) = 12;
        v18 = &v21;
        v11 = _os_log_send_and_compose_impl();
        if (v11)
        {
          v12 = (void *)v11;
          v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v11, 4, &v21, v19);
          free(v12);
          v18 = (int *)v13;
          SSFileLog();
        }
      }
      v14 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self, v18);
      -[NSMutableArray addObject:](self->_dialogs, "addObject:", a3);
      v15 = (void *)objc_msgSend(a3, "copyXPCEncoding");
      v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2080]), "initWithEncodedDialog:", v15);
      v20[0] = MEMORY[0x24BDAC760];
      v20[1] = 3221225472;
      v20[2] = __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke;
      v20[3] = &unk_24DE7B9D8;
      v20[5] = a3;
      v20[6] = a4;
      v20[4] = v14;
      objc_msgSend(v16, "startWithDialogResponseBlock:", v20);

      xpc_release(v15);
      objc_msgSend(a3, "incrementDisplayCount");
    }
  }
  return v7;
}

void __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD v2[5];
  __int128 v3;
  uint64_t v4;

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke_2;
  v2[3] = &unk_24DE7B9B0;
  v2[4] = a2;
  v4 = *(_QWORD *)(a1 + 48);
  v3 = *(_OWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], v2);
}

uint64_t __53__SUDialogManager_presentDialog_withCompletionBlock___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(*(id *)(a1 + 32), "selectedButtonIndex");
  v3 = (void *)objc_msgSend(*(id *)(a1 + 40), "object");
  v4 = *(_QWORD *)(a1 + 56);
  if (v4)
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v4, v2);
  return objc_msgSend(v3, "_finishDialog:withButtonIndex:", *(_QWORD *)(a1 + 48), v2);
}

- (BOOL)presentDialogForError:(id)a3
{
  uint64_t v5;
  _QWORD v7[5];

  v5 = objc_msgSend(MEMORY[0x24BEB20C0], "weakReferenceWithObject:", self);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__SUDialogManager_presentDialogForError___block_invoke;
  v7[3] = &unk_24DE7BA00;
  v7[4] = v5;
  return -[SUDialogManager presentDialogForError:withCompletionBlock:](self, "presentDialogForError:withCompletionBlock:", a3, v7);
}

uint64_t __41__SUDialogManager_presentDialogForError___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "object"), "_performDefaultActionForDialog:buttonIndex:", a2, a3);
}

- (BOOL)presentDialogForError:(id)a3 withCompletionBlock:(id)a4
{
  void *v6;
  BOOL v7;
  _QWORD v9[6];

  if (!a3)
    return 0;
  v6 = (void *)objc_msgSend((id)objc_opt_class(), "newDialogWithError:", a3);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __61__SUDialogManager_presentDialogForError_withCompletionBlock___block_invoke;
  v9[3] = &unk_24DE7BA28;
  v9[4] = v6;
  v9[5] = a4;
  v7 = -[SUDialogManager presentDialog:withCompletionBlock:](self, "presentDialog:withCompletionBlock:", v6, v9);

  return v7;
}

uint64_t __61__SUDialogManager_presentDialogForError_withCompletionBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(result + 16))(result, *(_QWORD *)(a1 + 32), a2);
  return result;
}

- (void)_finishDialog:(id)a3 withButtonIndex:(int64_t)a4
{
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  int *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  __int16 v20;
  int64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
  v8 = objc_msgSend(v7, "shouldLog");
  if (objc_msgSend(v7, "shouldLogToDisk"))
    v9 = v8 | 2;
  else
    v9 = v8;
  if (!os_log_type_enabled((os_log_t)objc_msgSend(v7, "OSLogObject"), OS_LOG_TYPE_DEFAULT))
    v9 &= 2u;
  if (v9)
  {
    v18 = 138543618;
    v19 = objc_opt_class();
    v20 = 2048;
    v21 = a4;
    LODWORD(v17) = 22;
    v16 = &v18;
    v10 = _os_log_send_and_compose_impl();
    if (v10)
    {
      v11 = (void *)v10;
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v10, 4, &v18, v17);
      free(v11);
      v16 = (int *)v12;
      SSFileLog();
    }
  }
  v13 = a3;
  -[NSMutableArray removeObject:](self->_dialogs, "removeObject:", a3);
  if (a4 < 0)
  {
    v15 = 0;
  }
  else
  {
    v14 = objc_alloc(MEMORY[0x24BDBCE70]);
    v15 = (void *)objc_msgSend(v14, "initWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4), CFSTR("SUDialogSelectedButtonIndexKey"), 0);
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", v16), "postNotificationName:object:userInfo:", CFSTR("SUDialogDidFinishNotification"), a3, v15);

}

- (BOOL)_isDisplayingEquivalentDialog:(id)a3
{
  NSMutableArray *dialogs;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  dialogs = self->_dialogs;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dialogs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(dialogs);
        if ((objc_msgSend(a3, "isEqual:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8)) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](dialogs, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)_performDefaultActionForDialog:(id)a3 buttonIndex:(int64_t)a4
{
  void *v6;
  void *v7;

  v6 = (void *)objc_msgSend(a3, "buttons");
  if ((a4 & 0x8000000000000000) == 0)
  {
    v7 = v6;
    if (objc_msgSend(v6, "count") > (unint64_t)a4)
      +[SUClientDispatch sendActionForDialog:button:](SUClientDispatch, "sendActionForDialog:button:", a3, objc_msgSend(v7, "objectAtIndex:", a4));
  }
}

@end
