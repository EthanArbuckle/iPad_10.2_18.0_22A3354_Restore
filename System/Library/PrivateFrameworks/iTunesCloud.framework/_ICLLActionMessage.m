@implementation _ICLLActionMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLActionMessage;
  -[_ICLLActionMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLActionMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  _ICLLPlaybackSyncAction *playbackSync;
  void *v6;
  _ICLLAddQueueItemsAction *addItems;
  void *v8;
  _ICLLRemoveQueueItemAction *removeItem;
  void *v10;
  _ICLLMoveQueueItemAction *moveItem;
  void *v12;
  _ICLLCurrentItemChangeAction *currentItemChange;
  void *v14;
  _ICLLReactionAction *reaction;
  void *v16;
  _ICLLParticipantChangeAction *participantChange;
  void *v18;
  _ICLLServerNoticeAction *serverNotice;
  void *v20;
  _ICLLClientInfoAction *clientInfo;
  void *v22;
  _ICLLReplaceQueueItemsAction *replaceQueueItems;
  void *v24;
  _ICLLPlayNowQueueItemsAction *playNowQueueItems;
  void *v26;
  _ICLLCurrentItemTransitionAction *currentItemTransition;
  void *v28;
  _ICLLQueueSyncAction *queueSync;
  void *v30;
  void *v31;
  NSString *originatorUUID;
  void *v33;
  _ICLLDisplayMessage *displayMessage;
  void *v35;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_originatorId);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("originatorId"));

  }
  playbackSync = self->_playbackSync;
  if (playbackSync)
  {
    -[_ICLLPlaybackSyncAction dictionaryRepresentation](playbackSync, "dictionaryRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("playbackSync"));

  }
  addItems = self->_addItems;
  if (addItems)
  {
    -[_ICLLAddQueueItemsAction dictionaryRepresentation](addItems, "dictionaryRepresentation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("addItems"));

  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    -[_ICLLRemoveQueueItemAction dictionaryRepresentation](removeItem, "dictionaryRepresentation");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("removeItem"));

  }
  moveItem = self->_moveItem;
  if (moveItem)
  {
    -[_ICLLMoveQueueItemAction dictionaryRepresentation](moveItem, "dictionaryRepresentation");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("moveItem"));

  }
  currentItemChange = self->_currentItemChange;
  if (currentItemChange)
  {
    -[_ICLLCurrentItemChangeAction dictionaryRepresentation](currentItemChange, "dictionaryRepresentation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("currentItemChange"));

  }
  reaction = self->_reaction;
  if (reaction)
  {
    -[_ICLLReactionAction dictionaryRepresentation](reaction, "dictionaryRepresentation");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("reaction"));

  }
  participantChange = self->_participantChange;
  if (participantChange)
  {
    -[_ICLLParticipantChangeAction dictionaryRepresentation](participantChange, "dictionaryRepresentation");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("participantChange"));

  }
  serverNotice = self->_serverNotice;
  if (serverNotice)
  {
    -[_ICLLServerNoticeAction dictionaryRepresentation](serverNotice, "dictionaryRepresentation");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("serverNotice"));

  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    -[_ICLLClientInfoAction dictionaryRepresentation](clientInfo, "dictionaryRepresentation");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("clientInfo"));

  }
  replaceQueueItems = self->_replaceQueueItems;
  if (replaceQueueItems)
  {
    -[_ICLLReplaceQueueItemsAction dictionaryRepresentation](replaceQueueItems, "dictionaryRepresentation");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("replaceQueueItems"));

  }
  playNowQueueItems = self->_playNowQueueItems;
  if (playNowQueueItems)
  {
    -[_ICLLPlayNowQueueItemsAction dictionaryRepresentation](playNowQueueItems, "dictionaryRepresentation");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("playNowQueueItems"));

  }
  currentItemTransition = self->_currentItemTransition;
  if (currentItemTransition)
  {
    -[_ICLLCurrentItemTransitionAction dictionaryRepresentation](currentItemTransition, "dictionaryRepresentation");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v28, CFSTR("currentItemTransition"));

  }
  queueSync = self->_queueSync;
  if (queueSync)
  {
    -[_ICLLQueueSyncAction dictionaryRepresentation](queueSync, "dictionaryRepresentation");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v30, CFSTR("queueSync"));

  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_action);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("action"));

  }
  originatorUUID = self->_originatorUUID;
  if (originatorUUID)
    objc_msgSend(v3, "setObject:forKey:", originatorUUID, CFSTR("originatorUUID"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_displayNotice);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("displayNotice"));

  }
  displayMessage = self->_displayMessage;
  if (displayMessage)
  {
    -[_ICLLDisplayMessage dictionaryRepresentation](displayMessage, "dictionaryRepresentation");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("displayMessage"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLActionMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    v4 = v5;
  }
  if (self->_playbackSync)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_addItems)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_removeItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_moveItem)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_currentItemChange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reaction)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participantChange)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_serverNotice)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_clientInfo)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_replaceQueueItems)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_originatorUUID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_playNowQueueItems)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_currentItemTransition)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_queueSync)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v4 = v5;
  }
  if (self->_displayMessage)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
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
  uint64_t v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_action;
    *(_BYTE *)(v5 + 148) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_originatorId;
    *(_BYTE *)(v5 + 148) |= 1u;
  }
  v8 = -[_ICLLPlaybackSyncAction copyWithZone:](self->_playbackSync, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v8;

  v10 = -[_ICLLAddQueueItemsAction copyWithZone:](self->_addItems, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v10;

  v12 = -[_ICLLRemoveQueueItemAction copyWithZone:](self->_removeItem, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 120);
  *(_QWORD *)(v6 + 120) = v12;

  v14 = -[_ICLLMoveQueueItemAction copyWithZone:](self->_moveItem, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v14;

  v16 = -[_ICLLCurrentItemChangeAction copyWithZone:](self->_currentItemChange, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v16;

  v18 = -[_ICLLReactionAction copyWithZone:](self->_reaction, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v18;

  v20 = -[_ICLLParticipantChangeAction copyWithZone:](self->_participantChange, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 80);
  *(_QWORD *)(v6 + 80) = v20;

  v22 = -[_ICLLServerNoticeAction copyWithZone:](self->_serverNotice, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 136);
  *(_QWORD *)(v6 + 136) = v22;

  v24 = -[_ICLLClientInfoAction copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v24;

  v26 = -[_ICLLReplaceQueueItemsAction copyWithZone:](self->_replaceQueueItems, "copyWithZone:", a3);
  v27 = *(void **)(v6 + 128);
  *(_QWORD *)(v6 + 128) = v26;

  v28 = -[NSString copyWithZone:](self->_originatorUUID, "copyWithZone:", a3);
  v29 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v28;

  v30 = -[_ICLLPlayNowQueueItemsAction copyWithZone:](self->_playNowQueueItems, "copyWithZone:", a3);
  v31 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v30;

  v32 = -[_ICLLCurrentItemTransitionAction copyWithZone:](self->_currentItemTransition, "copyWithZone:", a3);
  v33 = *(void **)(v6 + 48);
  *(_QWORD *)(v6 + 48) = v32;

  v34 = -[_ICLLQueueSyncAction copyWithZone:](self->_queueSync, "copyWithZone:", a3);
  v35 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v34;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_BYTE *)(v6 + 144) = self->_displayNotice;
    *(_BYTE *)(v6 + 148) |= 4u;
  }
  v36 = -[_ICLLDisplayMessage copyWithZone:](self->_displayMessage, "copyWithZone:", a3);
  v37 = *(void **)(v6 + 56);
  *(_QWORD *)(v6 + 56) = v36;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _ICLLPlaybackSyncAction *playbackSync;
  _ICLLAddQueueItemsAction *addItems;
  _ICLLRemoveQueueItemAction *removeItem;
  _ICLLMoveQueueItemAction *moveItem;
  _ICLLCurrentItemChangeAction *currentItemChange;
  _ICLLReactionAction *reaction;
  _ICLLParticipantChangeAction *participantChange;
  _ICLLServerNoticeAction *serverNotice;
  _ICLLClientInfoAction *clientInfo;
  _ICLLReplaceQueueItemsAction *replaceQueueItems;
  NSString *originatorUUID;
  _ICLLPlayNowQueueItemsAction *playNowQueueItems;
  _ICLLCurrentItemTransitionAction *currentItemTransition;
  _ICLLQueueSyncAction *queueSync;
  char v19;
  _ICLLDisplayMessage *displayMessage;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_44;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 2) == 0 || self->_action != *((_DWORD *)v4 + 4))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 148) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 148) & 1) == 0 || self->_originatorId != *((_QWORD *)v4 + 1))
      goto LABEL_44;
  }
  else if ((*((_BYTE *)v4 + 148) & 1) != 0)
  {
    goto LABEL_44;
  }
  playbackSync = self->_playbackSync;
  if ((unint64_t)playbackSync | *((_QWORD *)v4 + 12)
    && !-[_ICLLPlaybackSyncAction isEqual:](playbackSync, "isEqual:"))
  {
    goto LABEL_44;
  }
  addItems = self->_addItems;
  if ((unint64_t)addItems | *((_QWORD *)v4 + 3))
  {
    if (!-[_ICLLAddQueueItemsAction isEqual:](addItems, "isEqual:"))
      goto LABEL_44;
  }
  removeItem = self->_removeItem;
  if ((unint64_t)removeItem | *((_QWORD *)v4 + 15))
  {
    if (!-[_ICLLRemoveQueueItemAction isEqual:](removeItem, "isEqual:"))
      goto LABEL_44;
  }
  moveItem = self->_moveItem;
  if ((unint64_t)moveItem | *((_QWORD *)v4 + 8))
  {
    if (!-[_ICLLMoveQueueItemAction isEqual:](moveItem, "isEqual:"))
      goto LABEL_44;
  }
  currentItemChange = self->_currentItemChange;
  if ((unint64_t)currentItemChange | *((_QWORD *)v4 + 5))
  {
    if (!-[_ICLLCurrentItemChangeAction isEqual:](currentItemChange, "isEqual:"))
      goto LABEL_44;
  }
  reaction = self->_reaction;
  if ((unint64_t)reaction | *((_QWORD *)v4 + 14))
  {
    if (!-[_ICLLReactionAction isEqual:](reaction, "isEqual:"))
      goto LABEL_44;
  }
  participantChange = self->_participantChange;
  if ((unint64_t)participantChange | *((_QWORD *)v4 + 10))
  {
    if (!-[_ICLLParticipantChangeAction isEqual:](participantChange, "isEqual:"))
      goto LABEL_44;
  }
  serverNotice = self->_serverNotice;
  if ((unint64_t)serverNotice | *((_QWORD *)v4 + 17))
  {
    if (!-[_ICLLServerNoticeAction isEqual:](serverNotice, "isEqual:"))
      goto LABEL_44;
  }
  clientInfo = self->_clientInfo;
  if ((unint64_t)clientInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[_ICLLClientInfoAction isEqual:](clientInfo, "isEqual:"))
      goto LABEL_44;
  }
  replaceQueueItems = self->_replaceQueueItems;
  if ((unint64_t)replaceQueueItems | *((_QWORD *)v4 + 16))
  {
    if (!-[_ICLLReplaceQueueItemsAction isEqual:](replaceQueueItems, "isEqual:"))
      goto LABEL_44;
  }
  originatorUUID = self->_originatorUUID;
  if ((unint64_t)originatorUUID | *((_QWORD *)v4 + 9))
  {
    if (!-[NSString isEqual:](originatorUUID, "isEqual:"))
      goto LABEL_44;
  }
  playNowQueueItems = self->_playNowQueueItems;
  if ((unint64_t)playNowQueueItems | *((_QWORD *)v4 + 11))
  {
    if (!-[_ICLLPlayNowQueueItemsAction isEqual:](playNowQueueItems, "isEqual:"))
      goto LABEL_44;
  }
  currentItemTransition = self->_currentItemTransition;
  if ((unint64_t)currentItemTransition | *((_QWORD *)v4 + 6))
  {
    if (!-[_ICLLCurrentItemTransitionAction isEqual:](currentItemTransition, "isEqual:"))
      goto LABEL_44;
  }
  queueSync = self->_queueSync;
  if ((unint64_t)queueSync | *((_QWORD *)v4 + 13))
  {
    if (!-[_ICLLQueueSyncAction isEqual:](queueSync, "isEqual:"))
      goto LABEL_44;
  }
  if ((*(_BYTE *)&self->_has & 4) == 0)
  {
    if ((*((_BYTE *)v4 + 148) & 4) == 0)
      goto LABEL_50;
LABEL_44:
    v19 = 0;
    goto LABEL_45;
  }
  if ((*((_BYTE *)v4 + 148) & 4) == 0)
    goto LABEL_44;
  if (!self->_displayNotice)
  {
    if (!*((_BYTE *)v4 + 144))
      goto LABEL_50;
    goto LABEL_44;
  }
  if (!*((_BYTE *)v4 + 144))
    goto LABEL_44;
LABEL_50:
  displayMessage = self->_displayMessage;
  if ((unint64_t)displayMessage | *((_QWORD *)v4 + 7))
    v19 = -[_ICLLDisplayMessage isEqual:](displayMessage, "isEqual:");
  else
    v19 = 1;
LABEL_45:

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    v20 = 2654435761 * self->_action;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_3;
  }
  else
  {
    v20 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
LABEL_3:
      v19 = 2654435761 * self->_originatorId;
      goto LABEL_6;
    }
  }
  v19 = 0;
LABEL_6:
  v18 = -[_ICLLPlaybackSyncAction hash](self->_playbackSync, "hash");
  v17 = -[_ICLLAddQueueItemsAction hash](self->_addItems, "hash");
  v16 = -[_ICLLRemoveQueueItemAction hash](self->_removeItem, "hash");
  v15 = -[_ICLLMoveQueueItemAction hash](self->_moveItem, "hash");
  v14 = -[_ICLLCurrentItemChangeAction hash](self->_currentItemChange, "hash");
  v3 = -[_ICLLReactionAction hash](self->_reaction, "hash");
  v4 = -[_ICLLParticipantChangeAction hash](self->_participantChange, "hash");
  v5 = -[_ICLLServerNoticeAction hash](self->_serverNotice, "hash");
  v6 = -[_ICLLClientInfoAction hash](self->_clientInfo, "hash");
  v7 = -[_ICLLReplaceQueueItemsAction hash](self->_replaceQueueItems, "hash");
  v8 = -[NSString hash](self->_originatorUUID, "hash");
  v9 = -[_ICLLPlayNowQueueItemsAction hash](self->_playNowQueueItems, "hash");
  v10 = -[_ICLLCurrentItemTransitionAction hash](self->_currentItemTransition, "hash");
  v11 = -[_ICLLQueueSyncAction hash](self->_queueSync, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v12 = 2654435761 * self->_displayNotice;
  else
    v12 = 0;
  return v19 ^ v20 ^ v18 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ -[_ICLLDisplayMessage hash](self->_displayMessage, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverNotice, 0);
  objc_storeStrong((id *)&self->_replaceQueueItems, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_queueSync, 0);
  objc_storeStrong((id *)&self->_playbackSync, 0);
  objc_storeStrong((id *)&self->_playNowQueueItems, 0);
  objc_storeStrong((id *)&self->_participantChange, 0);
  objc_storeStrong((id *)&self->_originatorUUID, 0);
  objc_storeStrong((id *)&self->_moveItem, 0);
  objc_storeStrong((id *)&self->_displayMessage, 0);
  objc_storeStrong((id *)&self->_currentItemTransition, 0);
  objc_storeStrong((id *)&self->_currentItemChange, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_addItems, 0);
}

- (void)clearOneofValuesForAction
{
  void *v2;
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

  if (a1)
  {
    *(_BYTE *)(a1 + 148) &= ~2u;
    *(_DWORD *)(a1 + 16) = 0;
    v2 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v4 = *(void **)(a1 + 120);
    *(_QWORD *)(a1 + 120) = 0;

    v5 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v6 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    v7 = *(void **)(a1 + 112);
    *(_QWORD *)(a1 + 112) = 0;

    v8 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v9 = *(void **)(a1 + 136);
    *(_QWORD *)(a1 + 136) = 0;

    v10 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v11 = *(void **)(a1 + 128);
    *(_QWORD *)(a1 + 128) = 0;

    v12 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    v13 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v14 = *(void **)(a1 + 104);
    *(_QWORD *)(a1 + 104) = 0;

  }
}

@end
