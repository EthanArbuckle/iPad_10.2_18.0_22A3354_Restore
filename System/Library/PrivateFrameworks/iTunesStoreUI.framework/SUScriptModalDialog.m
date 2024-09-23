@implementation SUScriptModalDialog

- (SUScriptModalDialog)initWithDialog:(id)a3
{
  SUScriptModalDialog *v4;

  v4 = -[SUScriptModalDialog init](self, "init");
  if (v4)
    v4->_dialog = (ISDialog *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->_dialog = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUScriptModalDialog;
  -[SUScriptModalDialog dealloc](&v3, sel_dealloc);
}

+ (id)titleForURL:(id)a3
{
  void *v4;
  void *v5;

  if ((objc_msgSend(a3, "isFileURL") & 1) == 0)
    return (id)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("%@://%@"), objc_msgSend(a3, "scheme"), objc_msgSend(a3, "host"));
  v4 = (void *)objc_msgSend(a3, "path");
  v5 = (void *)objc_msgSend(v4, "lastPathComponent");
  if (objc_msgSend(v5, "length"))
    return v5;
  else
    return v4;
}

- (id)copyResponseByRunningModal
{
  void *v3;
  void *v5;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCE98], "invocationWithMethodSignature:", -[SUScriptModalDialog methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__copyResponseByRunningModal));
  objc_msgSend(v3, "setSelector:", sel__copyResponseByRunningModal);
  objc_msgSend(v3, "setTarget:", self);
  WebThreadLockPushModal();
  WebThreadCallDelegate();
  WebThreadLockPopModal();
  v5 = 0;
  objc_msgSend(v3, "getReturnValue:", &v5);
  return v5;
}

- (id)_copyResponseByRunningModal
{
  SUScriptModalDialogResponse *v3;
  id v4;
  void *v5;
  SUScriptDialogAlertController *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  SUScriptModalDialogResponse *v25;
  void *v26;
  SUScriptModalDialog *v27;
  id obj;
  _QWORD v29[7];
  _QWORD v30[6];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  void (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  uint64_t v40;
  _QWORD v41[6];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(SUScriptModalDialogResponse);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x3052000000;
  v49 = __Block_byref_object_copy__6;
  v50 = __Block_byref_object_dispose__6;
  v51 = 0;
  v4 = (id)-[SUScriptModalDialogDelegate presentingViewControllerForScriptModalDialog:](self->_delegate, "presentingViewControllerForScriptModalDialog:", self);
  v5 = (void *)objc_msgSend(v4, "view");
  if (objc_msgSend(v5, "window"))
  {
    v6 = +[SUScriptDialogAlertController alertControllerWithTitle:message:preferredStyle:](SUScriptDialogAlertController, "alertControllerWithTitle:message:preferredStyle:", -[ISDialog title](self->_dialog, "title"), -[ISDialog message](self->_dialog, "message"), 1);
    v7 = (void *)-[ISDialog buttons](self->_dialog, "buttons");
    v26 = v5;
    v27 = self;
    v25 = v3;
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    obj = v7;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
    v9 = MEMORY[0x24BDAC760];
    if (v8)
    {
      v10 = 0;
      v11 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(obj);
          v13 = (void *)MEMORY[0x24BDF67E8];
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "title");
          v41[0] = v9;
          v41[1] = 3221225472;
          v41[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke;
          v41[3] = &unk_24DE7C248;
          v41[4] = &v52;
          v41[5] = v10 + i;
          -[SUScriptDialogAlertController addAction:](v6, "addAction:", objc_msgSend(v13, "actionWithTitle:style:handler:", v14, 0, v41));
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v57, 16);
        v10 += i;
      }
      while (v8);
    }
    v35 = 0;
    v36 = &v35;
    v37 = 0x3052000000;
    v38 = __Block_byref_object_copy__6;
    v39 = __Block_byref_object_dispose__6;
    v40 = 0;
    v15 = (void *)-[ISDialog textFields](v27->_dialog, "textFields");
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v56, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v32;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v32 != v17)
            objc_enumerationMutation(v15);
          v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
          v30[0] = v9;
          v30[1] = 3221225472;
          v30[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_2;
          v30[3] = &unk_24DE7C270;
          v30[4] = v19;
          v30[5] = &v35;
          -[SUScriptDialogAlertController addTextFieldWithConfigurationHandler:](v6, "addTextFieldWithConfigurationHandler:", v30);
        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v31, v56, 16);
      }
      while (v16);
    }
    objc_msgSend(v4, "presentViewController:animated:completion:", v6, 1, 0);
    objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "runModal:", v26);

    v20 = objc_msgSend((id)objc_msgSend((id)v36[5], "text"), "copy");
    v47[5] = v20;
    _Block_object_dispose(&v35, 8);
    v3 = v25;
  }
  else
  {
    NSLog(&CFSTR("warning: View for running modal is not in a window; using alternate code-path through itunesstored for presen"
                 "ting script driven dialog.").isa);
    v21 = dispatch_semaphore_create(0);
    v22 = (void *)-[ISDialog copyXPCEncoding](self->_dialog, "copyXPCEncoding");
    v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB2080]), "initWithEncodedDialog:", v22);
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_3;
    v29[3] = &unk_24DE7C298;
    v29[5] = &v52;
    v29[6] = &v46;
    v29[4] = v21;
    objc_msgSend(v23, "startWithDialogResponseBlock:", v29);
    dispatch_semaphore_wait(v21, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v21);

    xpc_release(v22);
  }

  -[SUScriptModalDialogResponse setTextFieldValue:](v3, "setTextFieldValue:", v47[5]);
  -[SUScriptModalDialogResponse setButtonIndex:](v3, "setButtonIndex:", v53[3]);

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);
  return v3;
}

uint64_t __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_QWORD *)(a1 + 40);
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "stopModal");
}

id __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_2(uint64_t a1, void *a2)
{
  id result;

  objc_msgSend(a2, "setText:", objc_msgSend(*(id *)(a1 + 32), "value"));
  result = (id)objc_msgSend(a2, "setPlaceholder:", objc_msgSend(*(id *)(a1 + 32), "title"));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
  {
    result = a2;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  }
  return result;
}

intptr_t __50__SUScriptModalDialog__copyResponseByRunningModal__block_invoke_3(uint64_t a1, void *a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "selectedButtonIndex");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "textFieldValues"), "firstObject"), "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (SUScriptModalDialogDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUScriptModalDialogDelegate *)a3;
}

@end
