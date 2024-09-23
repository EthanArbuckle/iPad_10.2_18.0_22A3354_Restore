@implementation MFMoveMessageTriageInteraction

- (id)triageAction
{
  int64_t v3;
  id v4;
  void *v5;
  MSTriageAction *v6;
  MSTriageAction *triageAction;
  int64_t v8;
  int64_t v9;
  MSTriageAction *v10;
  MSTriageAction *v11;
  uint64_t v13;

  if (!self->_triageAction)
  {
    v3 = -[MFMoveMessageTriageInteraction targetMailboxType](self, "targetMailboxType");
    v4 = objc_alloc((Class)MSMoveTriageAction);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
    if (v3)
    {
      LOBYTE(v13) = 0;
      v6 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:destinationMailboxType:flagChange:copyMessages:", v5, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, v3, 0, v13);
      triageAction = self->_triageAction;
      self->_triageAction = v6;
    }
    else
    {
      v8 = -[MFTriageInteraction origin](self, "origin");
      v9 = -[MFTriageInteraction actor](self, "actor");
      triageAction = (MSTriageAction *)objc_claimAutoreleasedReturnValue(-[MFMoveMessageTriageInteraction targetMailbox](self, "targetMailbox"));
      LOBYTE(v13) = 0;
      v10 = (MSTriageAction *)objc_msgSend(v4, "initWithMessageListSelection:origin:actor:delegate:destinationMailbox:flagChange:copyMessages:", v5, v8, v9, self, triageAction, 0, v13);
      v11 = self->_triageAction;
      self->_triageAction = v10;

    }
  }
  return self->_triageAction;
}

- (BOOL)isPermittedWithTargetAccount:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  unsigned int v19;
  BOOL v20;
  id v22;
  uint64_t v23;
  void *i;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v4 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "messageListItems"));

  obj = v6;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v22 = v7;
    v23 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(_QWORD *)v31 != v23)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
        v26 = 0u;
        v27 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mailboxes", v22));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v27;
          while (2)
          {
            for (j = 0; j != v10; j = (char *)j + 1)
            {
              if (*(_QWORD *)v27 != v11)
                objc_enumerationMutation(v9);
              v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)j);
              v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "accountsProvider"));
              v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "accountIdentifier"));
              v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "legacyMailAccountForObjectID:", v16));

              if (v17)
              {
                v18 = (void *)objc_claimAutoreleasedReturnValue(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"));
                v19 = +[MailAccount canMoveMessagesFromAccount:toAccount:profileConnection:](MailAccount, "canMoveMessagesFromAccount:toAccount:profileConnection:", v17, v4, v18);

                if (!v19)
                {

                  v20 = 0;
                  goto LABEL_20;
                }
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
            if (v10)
              continue;
            break;
          }
        }

      }
      v20 = 1;
      v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v22);
  }
  else
  {
    v20 = 1;
  }
LABEL_20:

  return v20;
}

- (void)_dispatchInteractionWithCompletion:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  sub_10018ED20((uint64_t)self);
  v5.receiver = self;
  v5.super_class = (Class)MFMoveMessageTriageInteraction;
  -[MFTriageInteraction _dispatchInteractionWithCompletion:](&v5, "_dispatchInteractionWithCompletion:", v4);

}

- (id)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("MOVE_MESSAGE"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerMoveMessage;
}

- (id)shortTitle
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("SWIPE_MOVE"), &stru_100531B00, CFSTR("Main")));

  return v3;
}

- (id)cardTitle
{
  void *v3;
  void *v4;
  void *v5;

  if (-[MFTriageInteraction messageCount](self, "messageCount") < 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MOVE_MESSAGE"), &stru_100531B00, CFSTR("Main")));
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("MOVE_FORMAT%1$lu"), &stru_100531B00, CFSTR("Main")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v4, -[MFTriageInteraction messageCount](self, "messageCount")));

  }
  return v5;
}

- (id)_iconImageName
{
  return MFImageGlyphMove;
}

- (id)_previewImageName
{
  return MFImageGlyphMove;
}

- (id)color
{
  return +[UIColor systemIndigoColor](UIColor, "systemIndigoColor");
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return CFSTR("messageMoved");
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (EMMailbox)targetMailbox
{
  return self->_targetMailbox;
}

- (void)setTargetMailbox:(id)a3
{
  objc_storeStrong((id *)&self->_targetMailbox, a3);
}

- (int64_t)targetMailboxType
{
  return self->_targetMailboxType;
}

- (void)setTargetMailboxType:(int64_t)a3
{
  self->_targetMailboxType = a3;
}

- (BOOL)didPresentTransferUI
{
  return self->_didPresentTransferUI;
}

- (void)setDidPresentTransferUI:(BOOL)a3
{
  self->_didPresentTransferUI = a3;
}

- (BOOL)canHavePrediction
{
  return self->_canHavePrediction;
}

- (void)setCanHavePrediction:(BOOL)a3
{
  self->_canHavePrediction = a3;
}

- (BOOL)hasPrediction
{
  return self->_hasPrediction;
}

- (void)setHasPrediction:(BOOL)a3
{
  self->_hasPrediction = a3;
}

- (BOOL)predictionSelected
{
  return self->_predictionSelected;
}

- (void)setPredictionSelected:(BOOL)a3
{
  self->_predictionSelected = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetMailbox, 0);
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
