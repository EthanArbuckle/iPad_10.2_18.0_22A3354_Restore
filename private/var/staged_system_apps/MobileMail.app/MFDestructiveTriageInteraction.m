@implementation MFDestructiveTriageInteraction

+ (id)interactionWithMessageListItemSelection:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  objc_super v15;

  v10 = a3;
  v15.receiver = a1;
  v15.super_class = (Class)&OBJC_METACLASS___MFDestructiveTriageInteraction;
  v11 = objc_msgSendSuper2(&v15, "interactionWithMessageListItemSelection:undoManager:origin:actor:", v10, a4, a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  if (objc_msgSend(v10, "isSelectAll"))
    v13 = 2;
  else
    v13 = 0;
  objc_msgSend(v12, "setType:", v13);

  return v12;
}

+ (id)interactionWithMessageListItems:(id)a3 undoManager:(id)a4 origin:(int64_t)a5 actor:(int64_t)a6
{
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___MFDestructiveTriageInteraction;
  v6 = objc_msgSendSuper2(&v9, "interactionWithMessageListItems:undoManager:origin:actor:", a3, a4, a5, a6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend(v7, "setType:", 0);
  return v7;
}

- (id)triageAction
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  MSTriageAction *v7;
  MSTriageAction *triageAction;
  void *v9;
  id v10;
  MSTriageAction *v11;
  MSTriageAction *v12;
  uint64_t v14;

  if (!self->_triageAction)
  {
    v3 = objc_msgSend((id)objc_opt_class(self), "deleteOrArchive");
    if (v3 == (id)1)
      v4 = 3;
    else
      v4 = 2;
    if (v3 == (id)1
      && -[MFDestructiveTriageInteraction isMessageListItemSelectionSourceTrash](self, "isMessageListItemSelectionSourceTrash"))
    {
      v5 = objc_alloc((Class)MSDeleteTriageAction);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
      v7 = (MSTriageAction *)objc_msgSend(v5, "initWithMessageListSelection:origin:actor:delegate:", v6, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self);
      triageAction = self->_triageAction;
      self->_triageAction = v7;
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[ECMessageFlagChange setRead](ECMessageFlagChange, "setRead"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction query](self, "query"));

      v10 = objc_alloc((Class)MSMoveTriageAction);
      if (v9)
      {
        triageAction = (MSTriageAction *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction query](self, "query"));
        LOBYTE(v14) = 0;
        v11 = (MSTriageAction *)objc_msgSend(v10, "initWithQuery:origin:actor:delegate:destinationMailboxType:flagChange:copyMessages:", triageAction, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, v4, v6, v14);
      }
      else
      {
        triageAction = (MSTriageAction *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
        LOBYTE(v14) = 0;
        v11 = (MSTriageAction *)objc_msgSend(v10, "initWithMessageListSelection:origin:actor:delegate:destinationMailboxType:flagChange:copyMessages:", triageAction, -[MFTriageInteraction origin](self, "origin"), -[MFTriageInteraction actor](self, "actor"), self, v4, v6, v14);
      }
      v12 = self->_triageAction;
      self->_triageAction = v11;

    }
  }
  return self->_triageAction;
}

- (BOOL)supportsSelectAll
{
  return 1;
}

- (id)updateReason
{
  return CFSTR("destructiveChangeHappened");
}

- (BOOL)isMessageListItemSelectionSourceTrash
{
  void *v3;
  unsigned int v4;
  Block_layout *v5;
  Block_layout *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  _QWORD v11[4];
  Block_layout *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v4 = objc_msgSend(v3, "isSelectAll");

  v5 = (Block_layout *)objc_claimAutoreleasedReturnValue(-[MFTriageInteraction messageListItemSelection](self, "messageListItemSelection"));
  v6 = v5;
  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[Block_layout mailboxes](v5, "mailboxes"));
    v8 = objc_msgSend(v7, "ef_all:", &stru_100520EF0);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[Block_layout messageListItems](v5, "messageListItems"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10015D368;
    v11[3] = &unk_100520F18;
    v12 = &stru_100520ED0;
    v8 = objc_msgSend(v9, "ef_all:", v11);

    v6 = v12;
  }

  return v8;
}

+ (unint64_t)deleteOrArchive
{
  return 0;
}

- (void)setTriageAction:(id)a3
{
  objc_storeStrong((id *)&self->_triageAction, a3);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_triageAction, 0);
}

@end
