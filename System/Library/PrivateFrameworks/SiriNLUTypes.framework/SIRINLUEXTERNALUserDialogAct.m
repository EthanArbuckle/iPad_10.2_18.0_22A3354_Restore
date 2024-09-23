@implementation SIRINLUEXTERNALUserDialogAct

- (BOOL)hasAccepted
{
  return self->_accepted != 0;
}

- (BOOL)hasRejected
{
  return self->_rejected != 0;
}

- (BOOL)hasCancelled
{
  return self->_cancelled != 0;
}

- (BOOL)hasWantedToRepeat
{
  return self->_wantedToRepeat != 0;
}

- (BOOL)hasAcknowledged
{
  return self->_acknowledged != 0;
}

- (BOOL)hasWantedToProceed
{
  return self->_wantedToProceed != 0;
}

- (BOOL)hasWantedToPause
{
  return self->_wantedToPause != 0;
}

- (BOOL)hasDelegated
{
  return self->_delegated != 0;
}

- (BOOL)hasUserStatedTask
{
  return self->_userStatedTask != 0;
}

- (BOOL)hasWantedToUndo
{
  return self->_wantedToUndo != 0;
}

- (BOOL)hasAlignment
{
  return self->_alignment != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserDialogAct;
  -[SIRINLUEXTERNALUserDialogAct description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SIRINLUEXTERNALUserDialogAct dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  SIRINLUEXTERNALUserAccepted *accepted;
  void *v5;
  SIRINLUEXTERNALUserRejected *rejected;
  void *v7;
  SIRINLUEXTERNALUserCancelled *cancelled;
  void *v9;
  SIRINLUEXTERNALUserWantedToRepeat *wantedToRepeat;
  void *v11;
  SIRINLUEXTERNALUserAcknowledged *acknowledged;
  void *v13;
  SIRINLUEXTERNALUserWantedToProceed *wantedToProceed;
  void *v15;
  SIRINLUEXTERNALUserWantedToPause *wantedToPause;
  void *v17;
  SIRINLUEXTERNALDelegatedUserDialogAct *delegated;
  void *v19;
  SIRINLUEXTERNALUserStatedTask *userStatedTask;
  void *v21;
  SIRINLUEXTERNALUserWantedToUndo *wantedToUndo;
  void *v23;
  SIRINLUEXTERNALUtteranceAlignment *alignment;
  void *v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accepted = self->_accepted;
  if (accepted)
  {
    -[SIRINLUEXTERNALUserAccepted dictionaryRepresentation](accepted, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("accepted"));

  }
  rejected = self->_rejected;
  if (rejected)
  {
    -[SIRINLUEXTERNALUserRejected dictionaryRepresentation](rejected, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("rejected"));

  }
  cancelled = self->_cancelled;
  if (cancelled)
  {
    -[SIRINLUEXTERNALUserCancelled dictionaryRepresentation](cancelled, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("cancelled"));

  }
  wantedToRepeat = self->_wantedToRepeat;
  if (wantedToRepeat)
  {
    -[SIRINLUEXTERNALUserWantedToRepeat dictionaryRepresentation](wantedToRepeat, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("wanted_to_repeat"));

  }
  acknowledged = self->_acknowledged;
  if (acknowledged)
  {
    -[SIRINLUEXTERNALUserAcknowledged dictionaryRepresentation](acknowledged, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("acknowledged"));

  }
  wantedToProceed = self->_wantedToProceed;
  if (wantedToProceed)
  {
    -[SIRINLUEXTERNALUserWantedToProceed dictionaryRepresentation](wantedToProceed, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("wanted_to_proceed"));

  }
  wantedToPause = self->_wantedToPause;
  if (wantedToPause)
  {
    -[SIRINLUEXTERNALUserWantedToPause dictionaryRepresentation](wantedToPause, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("wanted_to_pause"));

  }
  delegated = self->_delegated;
  if (delegated)
  {
    -[SIRINLUEXTERNALDelegatedUserDialogAct dictionaryRepresentation](delegated, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("delegated"));

  }
  userStatedTask = self->_userStatedTask;
  if (userStatedTask)
  {
    -[SIRINLUEXTERNALUserStatedTask dictionaryRepresentation](userStatedTask, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("user_stated_task"));

  }
  wantedToUndo = self->_wantedToUndo;
  if (wantedToUndo)
  {
    -[SIRINLUEXTERNALUserWantedToUndo dictionaryRepresentation](wantedToUndo, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("wanted_to_undo"));

  }
  alignment = self->_alignment;
  if (alignment)
  {
    -[SIRINLUEXTERNALUtteranceAlignment dictionaryRepresentation](alignment, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("alignment"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserDialogActReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accepted)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_rejected)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_cancelled)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_wantedToRepeat)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_acknowledged)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_wantedToProceed)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_wantedToPause)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_delegated)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_userStatedTask)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_wantedToUndo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_alignment)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_accepted)
  {
    objc_msgSend(v4, "setAccepted:");
    v4 = v5;
  }
  if (self->_rejected)
  {
    objc_msgSend(v5, "setRejected:");
    v4 = v5;
  }
  if (self->_cancelled)
  {
    objc_msgSend(v5, "setCancelled:");
    v4 = v5;
  }
  if (self->_wantedToRepeat)
  {
    objc_msgSend(v5, "setWantedToRepeat:");
    v4 = v5;
  }
  if (self->_acknowledged)
  {
    objc_msgSend(v5, "setAcknowledged:");
    v4 = v5;
  }
  if (self->_wantedToProceed)
  {
    objc_msgSend(v5, "setWantedToProceed:");
    v4 = v5;
  }
  if (self->_wantedToPause)
  {
    objc_msgSend(v5, "setWantedToPause:");
    v4 = v5;
  }
  if (self->_delegated)
  {
    objc_msgSend(v5, "setDelegated:");
    v4 = v5;
  }
  if (self->_userStatedTask)
  {
    objc_msgSend(v5, "setUserStatedTask:");
    v4 = v5;
  }
  if (self->_wantedToUndo)
  {
    objc_msgSend(v5, "setWantedToUndo:");
    v4 = v5;
  }
  if (self->_alignment)
  {
    objc_msgSend(v5, "setAlignment:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[SIRINLUEXTERNALUserAccepted copyWithZone:](self->_accepted, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[SIRINLUEXTERNALUserRejected copyWithZone:](self->_rejected, "copyWithZone:", a3);
  v9 = (void *)v5[6];
  v5[6] = v8;

  v10 = -[SIRINLUEXTERNALUserCancelled copyWithZone:](self->_cancelled, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[SIRINLUEXTERNALUserWantedToRepeat copyWithZone:](self->_wantedToRepeat, "copyWithZone:", a3);
  v13 = (void *)v5[10];
  v5[10] = v12;

  v14 = -[SIRINLUEXTERNALUserAcknowledged copyWithZone:](self->_acknowledged, "copyWithZone:", a3);
  v15 = (void *)v5[2];
  v5[2] = v14;

  v16 = -[SIRINLUEXTERNALUserWantedToProceed copyWithZone:](self->_wantedToProceed, "copyWithZone:", a3);
  v17 = (void *)v5[9];
  v5[9] = v16;

  v18 = -[SIRINLUEXTERNALUserWantedToPause copyWithZone:](self->_wantedToPause, "copyWithZone:", a3);
  v19 = (void *)v5[8];
  v5[8] = v18;

  v20 = -[SIRINLUEXTERNALDelegatedUserDialogAct copyWithZone:](self->_delegated, "copyWithZone:", a3);
  v21 = (void *)v5[5];
  v5[5] = v20;

  v22 = -[SIRINLUEXTERNALUserStatedTask copyWithZone:](self->_userStatedTask, "copyWithZone:", a3);
  v23 = (void *)v5[7];
  v5[7] = v22;

  v24 = -[SIRINLUEXTERNALUserWantedToUndo copyWithZone:](self->_wantedToUndo, "copyWithZone:", a3);
  v25 = (void *)v5[11];
  v5[11] = v24;

  v26 = -[SIRINLUEXTERNALUtteranceAlignment copyWithZone:](self->_alignment, "copyWithZone:", a3);
  v27 = (void *)v5[3];
  v5[3] = v26;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUserAccepted *accepted;
  SIRINLUEXTERNALUserRejected *rejected;
  SIRINLUEXTERNALUserCancelled *cancelled;
  SIRINLUEXTERNALUserWantedToRepeat *wantedToRepeat;
  SIRINLUEXTERNALUserAcknowledged *acknowledged;
  SIRINLUEXTERNALUserWantedToProceed *wantedToProceed;
  SIRINLUEXTERNALUserWantedToPause *wantedToPause;
  SIRINLUEXTERNALDelegatedUserDialogAct *delegated;
  SIRINLUEXTERNALUserStatedTask *userStatedTask;
  SIRINLUEXTERNALUserWantedToUndo *wantedToUndo;
  SIRINLUEXTERNALUtteranceAlignment *alignment;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_24;
  accepted = self->_accepted;
  if ((unint64_t)accepted | v4[1])
  {
    if (!-[SIRINLUEXTERNALUserAccepted isEqual:](accepted, "isEqual:"))
      goto LABEL_24;
  }
  rejected = self->_rejected;
  if ((unint64_t)rejected | v4[6] && !-[SIRINLUEXTERNALUserRejected isEqual:](rejected, "isEqual:"))
    goto LABEL_24;
  cancelled = self->_cancelled;
  if ((unint64_t)cancelled | v4[4] && !-[SIRINLUEXTERNALUserCancelled isEqual:](cancelled, "isEqual:"))
    goto LABEL_24;
  if (((wantedToRepeat = self->_wantedToRepeat, !((unint64_t)wantedToRepeat | v4[10]))
     || -[SIRINLUEXTERNALUserWantedToRepeat isEqual:](wantedToRepeat, "isEqual:"))
    && ((acknowledged = self->_acknowledged, !((unint64_t)acknowledged | v4[2]))
     || -[SIRINLUEXTERNALUserAcknowledged isEqual:](acknowledged, "isEqual:"))
    && ((wantedToProceed = self->_wantedToProceed, !((unint64_t)wantedToProceed | v4[9]))
     || -[SIRINLUEXTERNALUserWantedToProceed isEqual:](wantedToProceed, "isEqual:"))
    && ((wantedToPause = self->_wantedToPause, !((unint64_t)wantedToPause | v4[8]))
     || -[SIRINLUEXTERNALUserWantedToPause isEqual:](wantedToPause, "isEqual:"))
    && ((delegated = self->_delegated, !((unint64_t)delegated | v4[5]))
     || -[SIRINLUEXTERNALDelegatedUserDialogAct isEqual:](delegated, "isEqual:"))
    && ((userStatedTask = self->_userStatedTask, !((unint64_t)userStatedTask | v4[7]))
     || -[SIRINLUEXTERNALUserStatedTask isEqual:](userStatedTask, "isEqual:"))
    && ((wantedToUndo = self->_wantedToUndo, !((unint64_t)wantedToUndo | v4[11]))
     || -[SIRINLUEXTERNALUserWantedToUndo isEqual:](wantedToUndo, "isEqual:")))
  {
    alignment = self->_alignment;
    if ((unint64_t)alignment | v4[3])
      v16 = -[SIRINLUEXTERNALUtteranceAlignment isEqual:](alignment, "isEqual:");
    else
      v16 = 1;
  }
  else
  {
LABEL_24:
    v16 = 0;
  }

  return v16;
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

  v3 = -[SIRINLUEXTERNALUserAccepted hash](self->_accepted, "hash");
  v4 = -[SIRINLUEXTERNALUserRejected hash](self->_rejected, "hash") ^ v3;
  v5 = -[SIRINLUEXTERNALUserCancelled hash](self->_cancelled, "hash");
  v6 = v4 ^ v5 ^ -[SIRINLUEXTERNALUserWantedToRepeat hash](self->_wantedToRepeat, "hash");
  v7 = -[SIRINLUEXTERNALUserAcknowledged hash](self->_acknowledged, "hash");
  v8 = v7 ^ -[SIRINLUEXTERNALUserWantedToProceed hash](self->_wantedToProceed, "hash");
  v9 = v6 ^ v8 ^ -[SIRINLUEXTERNALUserWantedToPause hash](self->_wantedToPause, "hash");
  v10 = -[SIRINLUEXTERNALDelegatedUserDialogAct hash](self->_delegated, "hash");
  v11 = v10 ^ -[SIRINLUEXTERNALUserStatedTask hash](self->_userStatedTask, "hash");
  v12 = v11 ^ -[SIRINLUEXTERNALUserWantedToUndo hash](self->_wantedToUndo, "hash");
  return v9 ^ v12 ^ -[SIRINLUEXTERNALUtteranceAlignment hash](self->_alignment, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  SIRINLUEXTERNALUserAccepted *accepted;
  uint64_t v6;
  SIRINLUEXTERNALUserRejected *rejected;
  uint64_t v8;
  SIRINLUEXTERNALUserCancelled *cancelled;
  uint64_t v10;
  SIRINLUEXTERNALUserWantedToRepeat *wantedToRepeat;
  uint64_t v12;
  SIRINLUEXTERNALUserAcknowledged *acknowledged;
  uint64_t v14;
  SIRINLUEXTERNALUserWantedToProceed *wantedToProceed;
  uint64_t v16;
  SIRINLUEXTERNALUserWantedToPause *wantedToPause;
  uint64_t v18;
  SIRINLUEXTERNALDelegatedUserDialogAct *delegated;
  uint64_t v20;
  SIRINLUEXTERNALUserStatedTask *userStatedTask;
  uint64_t v22;
  SIRINLUEXTERNALUserWantedToUndo *wantedToUndo;
  uint64_t v24;
  SIRINLUEXTERNALUtteranceAlignment *alignment;
  uint64_t v26;
  _QWORD *v27;

  v4 = a3;
  accepted = self->_accepted;
  v27 = v4;
  v6 = v4[1];
  if (accepted)
  {
    if (v6)
      -[SIRINLUEXTERNALUserAccepted mergeFrom:](accepted, "mergeFrom:");
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUserDialogAct setAccepted:](self, "setAccepted:");
  }
  rejected = self->_rejected;
  v8 = v27[6];
  if (rejected)
  {
    if (v8)
      -[SIRINLUEXTERNALUserRejected mergeFrom:](rejected, "mergeFrom:");
  }
  else if (v8)
  {
    -[SIRINLUEXTERNALUserDialogAct setRejected:](self, "setRejected:");
  }
  cancelled = self->_cancelled;
  v10 = v27[4];
  if (cancelled)
  {
    if (v10)
      -[SIRINLUEXTERNALUserCancelled mergeFrom:](cancelled, "mergeFrom:");
  }
  else if (v10)
  {
    -[SIRINLUEXTERNALUserDialogAct setCancelled:](self, "setCancelled:");
  }
  wantedToRepeat = self->_wantedToRepeat;
  v12 = v27[10];
  if (wantedToRepeat)
  {
    if (v12)
      -[SIRINLUEXTERNALUserWantedToRepeat mergeFrom:](wantedToRepeat, "mergeFrom:");
  }
  else if (v12)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToRepeat:](self, "setWantedToRepeat:");
  }
  acknowledged = self->_acknowledged;
  v14 = v27[2];
  if (acknowledged)
  {
    if (v14)
      -[SIRINLUEXTERNALUserAcknowledged mergeFrom:](acknowledged, "mergeFrom:");
  }
  else if (v14)
  {
    -[SIRINLUEXTERNALUserDialogAct setAcknowledged:](self, "setAcknowledged:");
  }
  wantedToProceed = self->_wantedToProceed;
  v16 = v27[9];
  if (wantedToProceed)
  {
    if (v16)
      -[SIRINLUEXTERNALUserWantedToProceed mergeFrom:](wantedToProceed, "mergeFrom:");
  }
  else if (v16)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToProceed:](self, "setWantedToProceed:");
  }
  wantedToPause = self->_wantedToPause;
  v18 = v27[8];
  if (wantedToPause)
  {
    if (v18)
      -[SIRINLUEXTERNALUserWantedToPause mergeFrom:](wantedToPause, "mergeFrom:");
  }
  else if (v18)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToPause:](self, "setWantedToPause:");
  }
  delegated = self->_delegated;
  v20 = v27[5];
  if (delegated)
  {
    if (v20)
      -[SIRINLUEXTERNALDelegatedUserDialogAct mergeFrom:](delegated, "mergeFrom:");
  }
  else if (v20)
  {
    -[SIRINLUEXTERNALUserDialogAct setDelegated:](self, "setDelegated:");
  }
  userStatedTask = self->_userStatedTask;
  v22 = v27[7];
  if (userStatedTask)
  {
    if (v22)
      -[SIRINLUEXTERNALUserStatedTask mergeFrom:](userStatedTask, "mergeFrom:");
  }
  else if (v22)
  {
    -[SIRINLUEXTERNALUserDialogAct setUserStatedTask:](self, "setUserStatedTask:");
  }
  wantedToUndo = self->_wantedToUndo;
  v24 = v27[11];
  if (wantedToUndo)
  {
    if (v24)
      -[SIRINLUEXTERNALUserWantedToUndo mergeFrom:](wantedToUndo, "mergeFrom:");
  }
  else if (v24)
  {
    -[SIRINLUEXTERNALUserDialogAct setWantedToUndo:](self, "setWantedToUndo:");
  }
  alignment = self->_alignment;
  v26 = v27[3];
  if (alignment)
  {
    if (v26)
      -[SIRINLUEXTERNALUtteranceAlignment mergeFrom:](alignment, "mergeFrom:");
  }
  else if (v26)
  {
    -[SIRINLUEXTERNALUserDialogAct setAlignment:](self, "setAlignment:");
  }

}

- (SIRINLUEXTERNALUserAccepted)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(id)a3
{
  objc_storeStrong((id *)&self->_accepted, a3);
}

- (SIRINLUEXTERNALUserRejected)rejected
{
  return self->_rejected;
}

- (void)setRejected:(id)a3
{
  objc_storeStrong((id *)&self->_rejected, a3);
}

- (SIRINLUEXTERNALUserCancelled)cancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(id)a3
{
  objc_storeStrong((id *)&self->_cancelled, a3);
}

- (SIRINLUEXTERNALUserWantedToRepeat)wantedToRepeat
{
  return self->_wantedToRepeat;
}

- (void)setWantedToRepeat:(id)a3
{
  objc_storeStrong((id *)&self->_wantedToRepeat, a3);
}

- (SIRINLUEXTERNALUserAcknowledged)acknowledged
{
  return self->_acknowledged;
}

- (void)setAcknowledged:(id)a3
{
  objc_storeStrong((id *)&self->_acknowledged, a3);
}

- (SIRINLUEXTERNALUserWantedToProceed)wantedToProceed
{
  return self->_wantedToProceed;
}

- (void)setWantedToProceed:(id)a3
{
  objc_storeStrong((id *)&self->_wantedToProceed, a3);
}

- (SIRINLUEXTERNALUserWantedToPause)wantedToPause
{
  return self->_wantedToPause;
}

- (void)setWantedToPause:(id)a3
{
  objc_storeStrong((id *)&self->_wantedToPause, a3);
}

- (SIRINLUEXTERNALDelegatedUserDialogAct)delegated
{
  return self->_delegated;
}

- (void)setDelegated:(id)a3
{
  objc_storeStrong((id *)&self->_delegated, a3);
}

- (SIRINLUEXTERNALUserStatedTask)userStatedTask
{
  return self->_userStatedTask;
}

- (void)setUserStatedTask:(id)a3
{
  objc_storeStrong((id *)&self->_userStatedTask, a3);
}

- (SIRINLUEXTERNALUserWantedToUndo)wantedToUndo
{
  return self->_wantedToUndo;
}

- (void)setWantedToUndo:(id)a3
{
  objc_storeStrong((id *)&self->_wantedToUndo, a3);
}

- (SIRINLUEXTERNALUtteranceAlignment)alignment
{
  return self->_alignment;
}

- (void)setAlignment:(id)a3
{
  objc_storeStrong((id *)&self->_alignment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wantedToUndo, 0);
  objc_storeStrong((id *)&self->_wantedToRepeat, 0);
  objc_storeStrong((id *)&self->_wantedToProceed, 0);
  objc_storeStrong((id *)&self->_wantedToPause, 0);
  objc_storeStrong((id *)&self->_userStatedTask, 0);
  objc_storeStrong((id *)&self->_rejected, 0);
  objc_storeStrong((id *)&self->_delegated, 0);
  objc_storeStrong((id *)&self->_cancelled, 0);
  objc_storeStrong((id *)&self->_alignment, 0);
  objc_storeStrong((id *)&self->_acknowledged, 0);
  objc_storeStrong((id *)&self->_accepted, 0);
}

@end
