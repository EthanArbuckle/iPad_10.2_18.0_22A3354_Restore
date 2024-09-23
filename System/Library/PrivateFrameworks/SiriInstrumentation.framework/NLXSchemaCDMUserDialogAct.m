@implementation NLXSchemaCDMUserDialogAct

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  objc_super v40;

  v4 = a3;
  v40.receiver = self;
  v40.super_class = (Class)NLXSchemaCDMUserDialogAct;
  -[SISchemaInstrumentationMessage applySensitiveConditionsPolicy:](&v40, sel_applySensitiveConditionsPolicy_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applySensitiveConditionsPolicy:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "suppressMessage");

  if (v8)
    -[NLXSchemaCDMUserDialogAct deleteAlignment](self, "deleteAlignment");
  -[NLXSchemaCDMUserDialogAct reference](self, "reference");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "applySensitiveConditionsPolicy:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "suppressMessage");

  if (v11)
    -[NLXSchemaCDMUserDialogAct deleteReference](self, "deleteReference");
  -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "applySensitiveConditionsPolicy:", v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "suppressMessage");

  if (v14)
    -[NLXSchemaCDMUserDialogAct deleteAccepted](self, "deleteAccepted");
  -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "applySensitiveConditionsPolicy:", v4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "suppressMessage");

  if (v17)
    -[NLXSchemaCDMUserDialogAct deleteRejected](self, "deleteRejected");
  -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "applySensitiveConditionsPolicy:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "suppressMessage");

  if (v20)
    -[NLXSchemaCDMUserDialogAct deleteCancelled](self, "deleteCancelled");
  -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "applySensitiveConditionsPolicy:", v4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "suppressMessage");

  if (v23)
    -[NLXSchemaCDMUserDialogAct deleteWantedToRepeat](self, "deleteWantedToRepeat");
  -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "applySensitiveConditionsPolicy:", v4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "suppressMessage");

  if (v26)
    -[NLXSchemaCDMUserDialogAct deleteAcknowledged](self, "deleteAcknowledged");
  -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "applySensitiveConditionsPolicy:", v4);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v28, "suppressMessage");

  if (v29)
    -[NLXSchemaCDMUserDialogAct deleteWantedToProceed](self, "deleteWantedToProceed");
  -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "applySensitiveConditionsPolicy:", v4);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "suppressMessage");

  if (v32)
    -[NLXSchemaCDMUserDialogAct deleteWantedToPause](self, "deleteWantedToPause");
  -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "applySensitiveConditionsPolicy:", v4);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "suppressMessage");

  if (v35)
    -[NLXSchemaCDMUserDialogAct deleteDelegated](self, "deleteDelegated");
  -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "applySensitiveConditionsPolicy:", v4);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "suppressMessage");

  if (v38)
    -[NLXSchemaCDMUserDialogAct deleteUserStatedTask](self, "deleteUserStatedTask");

  return v5;
}

- (BOOL)hasAlignment
{
  return self->_alignment != 0;
}

- (void)deleteAlignment
{
  -[NLXSchemaCDMUserDialogAct setAlignment:](self, "setAlignment:", 0);
}

- (BOOL)hasReference
{
  return self->_reference != 0;
}

- (void)deleteReference
{
  -[NLXSchemaCDMUserDialogAct setReference:](self, "setReference:", 0);
}

- (void)setAccepted:(id)a3
{
  NLXSchemaCDMUserAccepted *v4;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMUserAccepted *accepted;

  v4 = (NLXSchemaCDMUserAccepted *)a3;
  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 3;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  accepted = self->_accepted;
  self->_accepted = v4;

}

- (NLXSchemaCDMUserAccepted)accepted
{
  if (self->_whichUserdialogacttype == 3)
    return self->_accepted;
  else
    return (NLXSchemaCDMUserAccepted *)0;
}

- (void)deleteAccepted
{
  NLXSchemaCDMUserAccepted *accepted;

  if (self->_whichUserdialogacttype == 3)
  {
    self->_whichUserdialogacttype = 0;
    accepted = self->_accepted;
    self->_accepted = 0;

  }
}

- (void)setRejected:(id)a3
{
  NLXSchemaCDMUserRejected *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  NLXSchemaCDMUserRejected *rejected;

  v4 = (NLXSchemaCDMUserRejected *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  self->_whichUserdialogacttype = 4 * (v4 != 0);
  rejected = self->_rejected;
  self->_rejected = v4;

}

- (NLXSchemaCDMUserRejected)rejected
{
  if (self->_whichUserdialogacttype == 4)
    return self->_rejected;
  else
    return (NLXSchemaCDMUserRejected *)0;
}

- (void)deleteRejected
{
  NLXSchemaCDMUserRejected *rejected;

  if (self->_whichUserdialogacttype == 4)
  {
    self->_whichUserdialogacttype = 0;
    rejected = self->_rejected;
    self->_rejected = 0;

  }
}

- (void)setCancelled:(id)a3
{
  NLXSchemaCDMUserCancelled *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMUserCancelled *cancelled;

  v4 = (NLXSchemaCDMUserCancelled *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 5;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  cancelled = self->_cancelled;
  self->_cancelled = v4;

}

- (NLXSchemaCDMUserCancelled)cancelled
{
  if (self->_whichUserdialogacttype == 5)
    return self->_cancelled;
  else
    return (NLXSchemaCDMUserCancelled *)0;
}

- (void)deleteCancelled
{
  NLXSchemaCDMUserCancelled *cancelled;

  if (self->_whichUserdialogacttype == 5)
  {
    self->_whichUserdialogacttype = 0;
    cancelled = self->_cancelled;
    self->_cancelled = 0;

  }
}

- (void)setWantedToRepeat:(id)a3
{
  NLXSchemaCDMUserWantedToRepeat *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;

  v4 = (NLXSchemaCDMUserWantedToRepeat *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 6;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = v4;

}

- (NLXSchemaCDMUserWantedToRepeat)wantedToRepeat
{
  if (self->_whichUserdialogacttype == 6)
    return self->_wantedToRepeat;
  else
    return (NLXSchemaCDMUserWantedToRepeat *)0;
}

- (void)deleteWantedToRepeat
{
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;

  if (self->_whichUserdialogacttype == 6)
  {
    self->_whichUserdialogacttype = 0;
    wantedToRepeat = self->_wantedToRepeat;
    self->_wantedToRepeat = 0;

  }
}

- (void)setAcknowledged:(id)a3
{
  NLXSchemaCDMUserAcknowledged *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMUserAcknowledged *acknowledged;

  v4 = (NLXSchemaCDMUserAcknowledged *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 7;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  acknowledged = self->_acknowledged;
  self->_acknowledged = v4;

}

- (NLXSchemaCDMUserAcknowledged)acknowledged
{
  if (self->_whichUserdialogacttype == 7)
    return self->_acknowledged;
  else
    return (NLXSchemaCDMUserAcknowledged *)0;
}

- (void)deleteAcknowledged
{
  NLXSchemaCDMUserAcknowledged *acknowledged;

  if (self->_whichUserdialogacttype == 7)
  {
    self->_whichUserdialogacttype = 0;
    acknowledged = self->_acknowledged;
    self->_acknowledged = 0;

  }
}

- (void)setWantedToProceed:(id)a3
{
  NLXSchemaCDMUserWantedToProceed *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;

  v4 = (NLXSchemaCDMUserWantedToProceed *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  self->_whichUserdialogacttype = 8 * (v4 != 0);
  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = v4;

}

- (NLXSchemaCDMUserWantedToProceed)wantedToProceed
{
  if (self->_whichUserdialogacttype == 8)
    return self->_wantedToProceed;
  else
    return (NLXSchemaCDMUserWantedToProceed *)0;
}

- (void)deleteWantedToProceed
{
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;

  if (self->_whichUserdialogacttype == 8)
  {
    self->_whichUserdialogacttype = 0;
    wantedToProceed = self->_wantedToProceed;
    self->_wantedToProceed = 0;

  }
}

- (void)setWantedToPause:(id)a3
{
  NLXSchemaCDMUserWantedToPause *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMUserWantedToPause *wantedToPause;

  v4 = (NLXSchemaCDMUserWantedToPause *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 9;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = v4;

}

- (NLXSchemaCDMUserWantedToPause)wantedToPause
{
  if (self->_whichUserdialogacttype == 9)
    return self->_wantedToPause;
  else
    return (NLXSchemaCDMUserWantedToPause *)0;
}

- (void)deleteWantedToPause
{
  NLXSchemaCDMUserWantedToPause *wantedToPause;

  if (self->_whichUserdialogacttype == 9)
  {
    self->_whichUserdialogacttype = 0;
    wantedToPause = self->_wantedToPause;
    self->_wantedToPause = 0;

  }
}

- (void)setDelegated:(id)a3
{
  NLXSchemaCDMDelegatedUserDialogAct *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMUserStatedTask *userStatedTask;
  unint64_t v13;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;

  v4 = (NLXSchemaCDMDelegatedUserDialogAct *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = 0;

  v13 = 10;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  delegated = self->_delegated;
  self->_delegated = v4;

}

- (NLXSchemaCDMDelegatedUserDialogAct)delegated
{
  if (self->_whichUserdialogacttype == 10)
    return self->_delegated;
  else
    return (NLXSchemaCDMDelegatedUserDialogAct *)0;
}

- (void)deleteDelegated
{
  NLXSchemaCDMDelegatedUserDialogAct *delegated;

  if (self->_whichUserdialogacttype == 10)
  {
    self->_whichUserdialogacttype = 0;
    delegated = self->_delegated;
    self->_delegated = 0;

  }
}

- (void)setUserStatedTask:(id)a3
{
  NLXSchemaCDMUserStatedTask *v4;
  NLXSchemaCDMUserAccepted *accepted;
  NLXSchemaCDMUserRejected *rejected;
  NLXSchemaCDMUserCancelled *cancelled;
  NLXSchemaCDMUserWantedToRepeat *wantedToRepeat;
  NLXSchemaCDMUserAcknowledged *acknowledged;
  NLXSchemaCDMUserWantedToProceed *wantedToProceed;
  NLXSchemaCDMUserWantedToPause *wantedToPause;
  NLXSchemaCDMDelegatedUserDialogAct *delegated;
  unint64_t v13;
  NLXSchemaCDMUserStatedTask *userStatedTask;

  v4 = (NLXSchemaCDMUserStatedTask *)a3;
  accepted = self->_accepted;
  self->_accepted = 0;

  rejected = self->_rejected;
  self->_rejected = 0;

  cancelled = self->_cancelled;
  self->_cancelled = 0;

  wantedToRepeat = self->_wantedToRepeat;
  self->_wantedToRepeat = 0;

  acknowledged = self->_acknowledged;
  self->_acknowledged = 0;

  wantedToProceed = self->_wantedToProceed;
  self->_wantedToProceed = 0;

  wantedToPause = self->_wantedToPause;
  self->_wantedToPause = 0;

  delegated = self->_delegated;
  self->_delegated = 0;

  v13 = 11;
  if (!v4)
    v13 = 0;
  self->_whichUserdialogacttype = v13;
  userStatedTask = self->_userStatedTask;
  self->_userStatedTask = v4;

}

- (NLXSchemaCDMUserStatedTask)userStatedTask
{
  if (self->_whichUserdialogacttype == 11)
    return self->_userStatedTask;
  else
    return (NLXSchemaCDMUserStatedTask *)0;
}

- (void)deleteUserStatedTask
{
  NLXSchemaCDMUserStatedTask *userStatedTask;

  if (self->_whichUserdialogacttype == 11)
  {
    self->_whichUserdialogacttype = 0;
    userStatedTask = self->_userStatedTask;
    self->_userStatedTask = 0;

  }
}

- (BOOL)readFrom:(id)a3
{
  return NLXSchemaCDMUserDialogActReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct reference](self, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[NLXSchemaCDMUserDialogAct reference](self, "reference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
  -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    PBDataWriterWriteSubmessage();

  }
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unint64_t whichUserdialogacttype;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  int v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  int v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  char v62;
  BOOL v63;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_58;
  whichUserdialogacttype = self->_whichUserdialogacttype;
  if (whichUserdialogacttype != objc_msgSend(v4, "whichUserdialogacttype"))
    goto LABEL_58;
  -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alignment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = (void *)v8;
    -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "alignment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqual:", v11);

    if (!v12)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct reference](self, "reference");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reference");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct reference](self, "reference");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    -[NLXSchemaCDMUserDialogAct reference](self, "reference");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reference");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v15, "isEqual:", v16);

    if (!v17)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accepted");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accepted");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v20, "isEqual:", v21);

    if (!v22)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rejected");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
  v23 = objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    v24 = (void *)v23;
    -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "rejected");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v25, "isEqual:", v26);

    if (!v27)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
  v28 = objc_claimAutoreleasedReturnValue();
  if (v28)
  {
    v29 = (void *)v28;
    -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cancelled");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "isEqual:", v31);

    if (!v32)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wantedToRepeat");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
  v33 = objc_claimAutoreleasedReturnValue();
  if (v33)
  {
    v34 = (void *)v33;
    -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wantedToRepeat");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v35, "isEqual:", v36);

    if (!v37)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "acknowledged");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
  v38 = objc_claimAutoreleasedReturnValue();
  if (v38)
  {
    v39 = (void *)v38;
    -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acknowledged");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v40, "isEqual:", v41);

    if (!v42)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wantedToProceed");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
  v43 = objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    v44 = (void *)v43;
    -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wantedToProceed");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend(v45, "isEqual:", v46);

    if (!v47)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "wantedToPause");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
  v48 = objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v49 = (void *)v48;
    -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wantedToPause");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v50, "isEqual:", v51);

    if (!v52)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegated");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) == (v7 != 0))
    goto LABEL_57;
  -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
  v53 = objc_claimAutoreleasedReturnValue();
  if (v53)
  {
    v54 = (void *)v53;
    -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "delegated");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = objc_msgSend(v55, "isEqual:", v56);

    if (!v57)
      goto LABEL_58;
  }
  else
  {

  }
  -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userStatedTask");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 == 0) != (v7 != 0))
  {
    -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
    v58 = objc_claimAutoreleasedReturnValue();
    if (!v58)
    {

LABEL_61:
      v63 = 1;
      goto LABEL_59;
    }
    v59 = (void *)v58;
    -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userStatedTask");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v60, "isEqual:", v61);

    if ((v62 & 1) != 0)
      goto LABEL_61;
  }
  else
  {
LABEL_57:

  }
LABEL_58:
  v63 = 0;
LABEL_59:

  return v63;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;

  v3 = -[USOSchemaUSOUtteranceAlignment hash](self->_alignment, "hash");
  v4 = -[USOSchemaUSOGraph hash](self->_reference, "hash") ^ v3;
  v5 = -[NLXSchemaCDMUserAccepted hash](self->_accepted, "hash");
  v6 = v4 ^ v5 ^ -[NLXSchemaCDMUserRejected hash](self->_rejected, "hash");
  v7 = -[NLXSchemaCDMUserCancelled hash](self->_cancelled, "hash");
  v8 = v7 ^ -[NLXSchemaCDMUserWantedToRepeat hash](self->_wantedToRepeat, "hash");
  v9 = v6 ^ v8 ^ -[NLXSchemaCDMUserAcknowledged hash](self->_acknowledged, "hash");
  v10 = -[NLXSchemaCDMUserWantedToProceed hash](self->_wantedToProceed, "hash");
  v11 = v10 ^ -[NLXSchemaCDMUserWantedToPause hash](self->_wantedToPause, "hash");
  v12 = v11 ^ -[NLXSchemaCDMDelegatedUserDialogAct hash](self->_delegated, "hash");
  return v9 ^ v12 ^ -[NLXSchemaCDMUserStatedTask hash](self->_userStatedTask, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_accepted)
  {
    -[NLXSchemaCDMUserDialogAct accepted](self, "accepted");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("accepted"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("accepted"));

    }
  }
  if (self->_acknowledged)
  {
    -[NLXSchemaCDMUserDialogAct acknowledged](self, "acknowledged");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("acknowledged"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("acknowledged"));

    }
  }
  if (self->_alignment)
  {
    -[NLXSchemaCDMUserDialogAct alignment](self, "alignment");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("alignment"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("alignment"));

    }
  }
  if (self->_cancelled)
  {
    -[NLXSchemaCDMUserDialogAct cancelled](self, "cancelled");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("cancelled"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("cancelled"));

    }
  }
  if (self->_delegated)
  {
    -[NLXSchemaCDMUserDialogAct delegated](self, "delegated");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("delegated"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("delegated"));

    }
  }
  if (self->_reference)
  {
    -[NLXSchemaCDMUserDialogAct reference](self, "reference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v20, CFSTR("reference"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("reference"));

    }
  }
  if (self->_rejected)
  {
    -[NLXSchemaCDMUserDialogAct rejected](self, "rejected");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v23, CFSTR("rejected"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v24, CFSTR("rejected"));

    }
  }
  if (self->_userStatedTask)
  {
    -[NLXSchemaCDMUserDialogAct userStatedTask](self, "userStatedTask");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v26, CFSTR("userStatedTask"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("userStatedTask"));

    }
  }
  if (self->_wantedToPause)
  {
    -[NLXSchemaCDMUserDialogAct wantedToPause](self, "wantedToPause");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "dictionaryRepresentation");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v29, CFSTR("wantedToPause"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("wantedToPause"));

    }
  }
  if (self->_wantedToProceed)
  {
    -[NLXSchemaCDMUserDialogAct wantedToProceed](self, "wantedToProceed");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "dictionaryRepresentation");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v32, CFSTR("wantedToProceed"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("wantedToProceed"));

    }
  }
  if (self->_wantedToRepeat)
  {
    -[NLXSchemaCDMUserDialogAct wantedToRepeat](self, "wantedToRepeat");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v35, CFSTR("wantedToRepeat"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v36, CFSTR("wantedToRepeat"));

    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[NLXSchemaCDMUserDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NLXSchemaCDMUserDialogAct)initWithJSON:(id)a3
{
  void *v4;
  NLXSchemaCDMUserDialogAct *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[NLXSchemaCDMUserDialogAct initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (NLXSchemaCDMUserDialogAct)initWithDictionary:(id)a3
{
  id v4;
  NLXSchemaCDMUserDialogAct *v5;
  uint64_t v6;
  USOSchemaUSOUtteranceAlignment *v7;
  uint64_t v8;
  USOSchemaUSOGraph *v9;
  uint64_t v10;
  NLXSchemaCDMUserAccepted *v11;
  uint64_t v12;
  NLXSchemaCDMUserRejected *v13;
  uint64_t v14;
  NLXSchemaCDMUserCancelled *v15;
  void *v16;
  NLXSchemaCDMUserWantedToRepeat *v17;
  void *v18;
  NLXSchemaCDMUserAcknowledged *v19;
  void *v20;
  NLXSchemaCDMUserWantedToProceed *v21;
  void *v22;
  void *v23;
  NLXSchemaCDMUserWantedToPause *v24;
  void *v25;
  NLXSchemaCDMDelegatedUserDialogAct *v26;
  void *v27;
  NLXSchemaCDMUserStatedTask *v28;
  NLXSchemaCDMUserDialogAct *v29;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)NLXSchemaCDMUserDialogAct;
  v5 = -[NLXSchemaCDMUserDialogAct init](&v35, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("alignment"));
    v6 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = -[USOSchemaUSOUtteranceAlignment initWithDictionary:]([USOSchemaUSOUtteranceAlignment alloc], "initWithDictionary:", v6);
      -[NLXSchemaCDMUserDialogAct setAlignment:](v5, "setAlignment:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("reference"));
    v8 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = -[USOSchemaUSOGraph initWithDictionary:]([USOSchemaUSOGraph alloc], "initWithDictionary:", v8);
      -[NLXSchemaCDMUserDialogAct setReference:](v5, "setReference:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("accepted"));
    v10 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = -[NLXSchemaCDMUserAccepted initWithDictionary:]([NLXSchemaCDMUserAccepted alloc], "initWithDictionary:", v10);
      -[NLXSchemaCDMUserDialogAct setAccepted:](v5, "setAccepted:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("rejected"));
    v12 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = -[NLXSchemaCDMUserRejected initWithDictionary:]([NLXSchemaCDMUserRejected alloc], "initWithDictionary:", v12);
      -[NLXSchemaCDMUserDialogAct setRejected:](v5, "setRejected:", v13);

    }
    v32 = (void *)v12;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("cancelled"));
    v14 = objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = -[NLXSchemaCDMUserCancelled initWithDictionary:]([NLXSchemaCDMUserCancelled alloc], "initWithDictionary:", v14);
      -[NLXSchemaCDMUserDialogAct setCancelled:](v5, "setCancelled:", v15);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wantedToRepeat"), v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = -[NLXSchemaCDMUserWantedToRepeat initWithDictionary:]([NLXSchemaCDMUserWantedToRepeat alloc], "initWithDictionary:", v16);
      -[NLXSchemaCDMUserDialogAct setWantedToRepeat:](v5, "setWantedToRepeat:", v17);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("acknowledged"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v19 = -[NLXSchemaCDMUserAcknowledged initWithDictionary:]([NLXSchemaCDMUserAcknowledged alloc], "initWithDictionary:", v18);
      -[NLXSchemaCDMUserDialogAct setAcknowledged:](v5, "setAcknowledged:", v19);

    }
    v33 = (void *)v10;
    v34 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wantedToProceed"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21 = -[NLXSchemaCDMUserWantedToProceed initWithDictionary:]([NLXSchemaCDMUserWantedToProceed alloc], "initWithDictionary:", v20);
      -[NLXSchemaCDMUserDialogAct setWantedToProceed:](v5, "setWantedToProceed:", v21);

    }
    v22 = (void *)v8;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("wantedToPause"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v24 = -[NLXSchemaCDMUserWantedToPause initWithDictionary:]([NLXSchemaCDMUserWantedToPause alloc], "initWithDictionary:", v23);
      -[NLXSchemaCDMUserDialogAct setWantedToPause:](v5, "setWantedToPause:", v24);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("delegated"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v26 = -[NLXSchemaCDMDelegatedUserDialogAct initWithDictionary:]([NLXSchemaCDMDelegatedUserDialogAct alloc], "initWithDictionary:", v25);
      -[NLXSchemaCDMUserDialogAct setDelegated:](v5, "setDelegated:", v26);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("userStatedTask"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v28 = -[NLXSchemaCDMUserStatedTask initWithDictionary:]([NLXSchemaCDMUserStatedTask alloc], "initWithDictionary:", v27);
      -[NLXSchemaCDMUserDialogAct setUserStatedTask:](v5, "setUserStatedTask:", v28);

    }
    v29 = v5;

  }
  return v5;
}

- (unint64_t)whichUserdialogacttype
{
  return self->_whichUserdialogacttype;
}

- (USOSchemaUSOUtteranceAlignment)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_alignment, a3);
}

- (USOSchemaUSOGraph)reference
{
  return self->_reference;
}

- (void)setReference:(id)a3
{
  objc_storeStrong((id *)&self->_reference, a3);
}

- (void)setHasAlignment:(BOOL)a3
{
  self->_hasAlignment = a3;
}

- (void)setHasReference:(BOOL)a3
{
  self->_hasReference = a3;
}

- (BOOL)hasAccepted
{
  return self->_hasAccepted;
}

- (void)setHasAccepted:(BOOL)a3
{
  self->_hasAccepted = a3;
}

- (BOOL)hasRejected
{
  return self->_hasRejected;
}

- (void)setHasRejected:(BOOL)a3
{
  self->_hasRejected = a3;
}

- (BOOL)hasCancelled
{
  return self->_hasCancelled;
}

- (void)setHasCancelled:(BOOL)a3
{
  self->_hasCancelled = a3;
}

- (BOOL)hasWantedToRepeat
{
  return self->_hasWantedToRepeat;
}

- (void)setHasWantedToRepeat:(BOOL)a3
{
  self->_hasWantedToRepeat = a3;
}

- (BOOL)hasAcknowledged
{
  return self->_hasAcknowledged;
}

- (void)setHasAcknowledged:(BOOL)a3
{
  self->_hasAcknowledged = a3;
}

- (BOOL)hasWantedToProceed
{
  return self->_hasWantedToProceed;
}

- (void)setHasWantedToProceed:(BOOL)a3
{
  self->_hasWantedToProceed = a3;
}

- (BOOL)hasWantedToPause
{
  return self->_hasWantedToPause;
}

- (void)setHasWantedToPause:(BOOL)a3
{
  self->_hasWantedToPause = a3;
}

- (BOOL)hasDelegated
{
  return self->_hasDelegated;
}

- (void)setHasDelegated:(BOOL)a3
{
  self->_hasDelegated = a3;
}

- (BOOL)hasUserStatedTask
{
  return self->_hasUserStatedTask;
}

- (void)setHasUserStatedTask:(BOOL)a3
{
  self->_hasUserStatedTask = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userStatedTask, 0);
  objc_storeStrong((id *)&self->_delegated, 0);
  objc_storeStrong((id *)&self->_wantedToPause, 0);
  objc_storeStrong((id *)&self->_wantedToProceed, 0);
  objc_storeStrong((id *)&self->_acknowledged, 0);
  objc_storeStrong((id *)&self->_wantedToRepeat, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_rejected, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
  objc_storeStrong((id *)&self->_reference, 0);
  objc_storeStrong((id *)&self->_alignment, 0);
}

@end
