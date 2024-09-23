@implementation MFUnsubscribeTriageInteraction

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001BEA10;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA458 != -1)
    dispatch_once(&qword_1005AA458, block);
  return (id)qword_1005AA450;
}

+ (id)interactionWithMessageListItemSelection:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v8 = a3;
  v16.receiver = a1;
  v16.super_class = (Class)&OBJC_METACLASS___MFUnsubscribeTriageInteraction;
  v9 = objc_msgSendSuper2(&v16, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v8, 0, a4, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "messageListItems"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "groupedSenderMessageListItems"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "senderForMessageList:", v13));

  objc_msgSend(v10, "setSender:", v14);
  return v10;
}

+ (id)interactionWithReferenceMessageListItems:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5
{
  id v8;
  id v9;
  void *v10;

  v8 = a3;
  v9 = objc_msgSend(objc_alloc((Class)MSMessageListItemSelection), "initWithMessageListItems:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:origin:actor:", v9, a4, a5));

  return v10;
}

+ (id)interactionWithReferenceMessageListItemsAndConfirmation:(id)a3 origin:(int64_t)a4 actor:(int64_t)a5 shouldAskForConfirmation:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v10 = a3;
  v11 = objc_msgSend(objc_alloc((Class)MSMessageListItemSelection), "initWithMessageListItems:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "interactionWithMessageListItemSelection:origin:actor:", v11, a4, a5));
  objc_msgSend(v12, "setShouldAskForConfirmation:", v6);

  return v12;
}

- (id)senderForMessageList:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  void *v18;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id obj;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  id v32;
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];

  v20 = a3;
  v3 = objc_alloc_init((Class)NSMutableSet);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v20;
  v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16, v20);
  if (v21)
  {
    v23 = *(_QWORD *)v47;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(obj);
        v4 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)v27);
        v42 = 0u;
        v43 = 0u;
        v44 = 0u;
        v45 = 0u;
        v31 = v4;
        v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mailboxes"));
        v22 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (v22)
        {
          v24 = *(_QWORD *)v43;
          do
          {
            v28 = 0;
            do
            {
              if (*(_QWORD *)v43 != v24)
                objc_enumerationMutation(v25);
              v5 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)v28);
              v38 = 0u;
              v39 = 0u;
              v40 = 0u;
              v41 = 0u;
              v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "account"));
              v29 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "emailAddresses"));

              v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
              if (v32)
              {
                v30 = *(_QWORD *)v39;
                do
                {
                  v33 = 0;
                  do
                  {
                    if (*(_QWORD *)v39 != v30)
                      objc_enumerationMutation(v29);
                    v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v33);
                    v34 = 0u;
                    v35 = 0u;
                    v36 = 0u;
                    v37 = 0u;
                    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "toList"));
                    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
                    if (v9)
                    {
                      v10 = *(_QWORD *)v35;
                      do
                      {
                        v11 = 0;
                        do
                        {
                          if (*(_QWORD *)v35 != v10)
                            objc_enumerationMutation(v8);
                          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)v11), "emailAddressValue"));
                          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "simpleAddress"));
                          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleAddress"));
                          v15 = objc_msgSend(v13, "isEqualToString:", v14);

                          if (v15)
                          {
                            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "simpleAddress"));
                            objc_msgSend(v3, "addObject:", v16);

                          }
                          v11 = (char *)v11 + 1;
                        }
                        while (v9 != v11);
                        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v34, v50, 16);
                      }
                      while (v9);
                    }

                    v33 = (char *)v33 + 1;
                  }
                  while (v33 != v32);
                  v32 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v38, v51, 16);
                }
                while (v32);
              }

              v28 = (char *)v28 + 1;
            }
            while (v28 != v22);
            v22 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
          }
          while (v22);
        }

        v27 = (char *)v27 + 1;
      }
      while (v27 != v21);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v53, 16);
    }
    while (v21);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "componentsJoinedByString:", CFSTR(", ")));

  return v18;
}

- (id)triageAction
{
  MSTriageAction *triageAction;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *v7;

  triageAction = self->_triageAction;
  if (!triageAction)
  {
    v4 = objc_alloc((Class)MSUnsubscribeTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self);
    v7 = self->_triageAction;
    self->_triageAction = v6;

    triageAction = self->_triageAction;
  }
  return triageAction;
}

- (id)title
{
  return (id)_EFLocalizedString(CFSTR("Unsubscribe"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)shortTitle
{
  return (id)_EFLocalizedString(CFSTR("Unsubscribe"), &unk_10059D2A0, &unk_10059D2A8);
}

- (id)alertTitle
{
  return CFSTR("ALERT TITLE!!!");
}

- (id)_iconImageName
{
  return MFImageGlyphCircleXMark;
}

- (id)_previewImageName
{
  return MFImageGlyphCircleXMark;
}

- (id)color
{
  return +[UIColor systemIndigoColor](UIColor, "systemIndigoColor");
}

- (BOOL)supportsSelectAll
{
  return 0;
}

- (BOOL)shouldUpdateWidget
{
  return 1;
}

- (BOOL)_requiresConfirmationPrompt
{
  return 1;
}

- (void)dealloc
{
  objc_super v3;

  NSLog(CFSTR("Deallocating"), a2);
  v3.receiver = self;
  v3.super_class = (Class)MFUnsubscribeTriageInteraction;
  -[MFUnsubscribeTriageInteraction dealloc](&v3, "dealloc");
}

- (id)unsubscribeMessageAlertFormat
{
  return (id)_EFLocalizedString(CFSTR("Mail will send a message from “%@” to unsubscribe from this mailing list."), &unk_10059D2A0, &unk_10059D2A8);
}

- (void)_performInteractionAfterPreparation:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  objc_super v25;
  _QWORD v26[5];
  id v27;
  id v28;
  uint8_t buf[16];

  v6 = a3;
  v7 = a4;
  if (-[MFTriageInteraction shouldAskForConfirmation](self, "shouldAskForConfirmation"))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MFUnsubscribeTriageInteraction log](MFUnsubscribeTriageInteraction, "log"));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "shouldAskForConfirmation = true, presenting UIAlert to confirm MFUnsubscribeTriageInteraction", buf, 2u);
    }

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction delegate](self, "delegate"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "presentingViewControllerForTriageInteraction:", self));
    v10 = _EFLocalizedString(CFSTR("Unsubscribe from Mailing List?"), &unk_10059D2A0, &unk_10059D2A8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MFUnsubscribeTriageInteraction unsubscribeMessageAlertFormat](self, "unsubscribeMessageAlertFormat"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MFUnsubscribeTriageInteraction sender](self, "sender"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1));
    v16 = _EFLocalizedString(CFSTR("Cancel"), &unk_10059D2A0, &unk_10059D2A8);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v17, 1, 0));

    v19 = _EFLocalizedString(CFSTR("Unsubscribe"), &unk_10059D2A0, &unk_10059D2A8);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1001BF73C;
    v26[3] = &unk_100523188;
    v27 = v6;
    v28 = v7;
    v26[4] = self;
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v20, 0, v26));

    objc_msgSend(v15, "addAction:", v18);
    objc_msgSend(v15, "addAction:", v21);
    objc_msgSend(v15, "setModalPresentationStyle:", 7);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction presentationSource](self, "presentationSource"));
    objc_msgSend(v15, "mf_presentFromViewController:withSource:", v9, v22);

  }
  else
  {
    v23 = objc_claimAutoreleasedReturnValue(+[MFUnsubscribeTriageInteraction log](MFUnsubscribeTriageInteraction, "log"));
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "shouldAskForConfirmation = false, performing MFUnsubscribeTriageInteraction directly without confirmation", buf, 2u);
    }

    v25.receiver = self;
    v25.super_class = (Class)MFUnsubscribeTriageInteraction;
    -[MFTriageInteraction _performInteractionAfterPreparation:completion:](&v25, "_performInteractionAfterPreparation:completion:", v6, v7);
  }

}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (NSString)sender
{
  return self->_sender;
}

- (void)setSender:(id)a3
{
  objc_storeStrong((id *)&self->_sender, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sender, 0);
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
