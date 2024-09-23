@implementation _ICLLCommandMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLCommandMessage;
  -[_ICLLCommandMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLCommandMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _ICLLPlaybackSyncCommand *playbackSync;
  void *v5;
  _ICLLAddQueueItemsCommand *addItems;
  void *v7;
  _ICLLRemoveQueueItemCommand *removeItem;
  void *v9;
  _ICLLMoveQueueItemCommand *moveItem;
  void *v11;
  _ICLLCurrentItemChangeCommand *currentItemChange;
  void *v13;
  _ICLLPlaybackControlSettingsCommand *playbackControlSettings;
  void *v15;
  _ICLLReactionCommand *reaction;
  void *v17;
  _ICLLClientInfoCommand *clientInfo;
  void *v19;
  _ICLLReplaceQueueItemsCommand *replaceQueueItems;
  void *v21;
  _ICLLPlayNowQueueItemsCommand *playNowQueueItems;
  void *v23;
  _ICLLCurrentItemTransitionCommand *currentItemTransition;
  void *v25;
  void *v26;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  playbackSync = self->_playbackSync;
  if (playbackSync)
  {
    -[_ICLLPlaybackSyncCommand dictionaryRepresentation](playbackSync, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("playbackSync"));

  }
  addItems = self->_addItems;
  if (addItems)
  {
    -[_ICLLAddQueueItemsCommand dictionaryRepresentation](addItems, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("addItems"));

  }
  removeItem = self->_removeItem;
  if (removeItem)
  {
    -[_ICLLRemoveQueueItemCommand dictionaryRepresentation](removeItem, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("removeItem"));

  }
  moveItem = self->_moveItem;
  if (moveItem)
  {
    -[_ICLLMoveQueueItemCommand dictionaryRepresentation](moveItem, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("moveItem"));

  }
  currentItemChange = self->_currentItemChange;
  if (currentItemChange)
  {
    -[_ICLLCurrentItemChangeCommand dictionaryRepresentation](currentItemChange, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("currentItemChange"));

  }
  playbackControlSettings = self->_playbackControlSettings;
  if (playbackControlSettings)
  {
    -[_ICLLPlaybackControlSettingsCommand dictionaryRepresentation](playbackControlSettings, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("playbackControlSettings"));

  }
  reaction = self->_reaction;
  if (reaction)
  {
    -[_ICLLReactionCommand dictionaryRepresentation](reaction, "dictionaryRepresentation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v17, CFSTR("reaction"));

  }
  clientInfo = self->_clientInfo;
  if (clientInfo)
  {
    -[_ICLLClientInfoCommand dictionaryRepresentation](clientInfo, "dictionaryRepresentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v19, CFSTR("clientInfo"));

  }
  replaceQueueItems = self->_replaceQueueItems;
  if (replaceQueueItems)
  {
    -[_ICLLReplaceQueueItemsCommand dictionaryRepresentation](replaceQueueItems, "dictionaryRepresentation");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("replaceQueueItems"));

  }
  playNowQueueItems = self->_playNowQueueItems;
  if (playNowQueueItems)
  {
    -[_ICLLPlayNowQueueItemsCommand dictionaryRepresentation](playNowQueueItems, "dictionaryRepresentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v23, CFSTR("playNowQueueItems"));

  }
  currentItemTransition = self->_currentItemTransition;
  if (currentItemTransition)
  {
    -[_ICLLCurrentItemTransitionCommand dictionaryRepresentation](currentItemTransition, "dictionaryRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v25, CFSTR("currentItemTransition"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_command);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v26, CFSTR("command"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLCommandMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
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
  if (self->_playbackControlSettings)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_reaction)
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

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  void *v28;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_command;
    *(_BYTE *)(v5 + 104) |= 1u;
  }
  v7 = -[_ICLLPlaybackSyncCommand copyWithZone:](self->_playbackSync, "copyWithZone:", a3);
  v8 = (void *)v6[9];
  v6[9] = v7;

  v9 = -[_ICLLAddQueueItemsCommand copyWithZone:](self->_addItems, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[_ICLLRemoveQueueItemCommand copyWithZone:](self->_removeItem, "copyWithZone:", a3);
  v12 = (void *)v6[11];
  v6[11] = v11;

  v13 = -[_ICLLMoveQueueItemCommand copyWithZone:](self->_moveItem, "copyWithZone:", a3);
  v14 = (void *)v6[6];
  v6[6] = v13;

  v15 = -[_ICLLCurrentItemChangeCommand copyWithZone:](self->_currentItemChange, "copyWithZone:", a3);
  v16 = (void *)v6[4];
  v6[4] = v15;

  v17 = -[_ICLLPlaybackControlSettingsCommand copyWithZone:](self->_playbackControlSettings, "copyWithZone:", a3);
  v18 = (void *)v6[8];
  v6[8] = v17;

  v19 = -[_ICLLReactionCommand copyWithZone:](self->_reaction, "copyWithZone:", a3);
  v20 = (void *)v6[10];
  v6[10] = v19;

  v21 = -[_ICLLClientInfoCommand copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  v22 = (void *)v6[2];
  v6[2] = v21;

  v23 = -[_ICLLReplaceQueueItemsCommand copyWithZone:](self->_replaceQueueItems, "copyWithZone:", a3);
  v24 = (void *)v6[12];
  v6[12] = v23;

  v25 = -[_ICLLPlayNowQueueItemsCommand copyWithZone:](self->_playNowQueueItems, "copyWithZone:", a3);
  v26 = (void *)v6[7];
  v6[7] = v25;

  v27 = -[_ICLLCurrentItemTransitionCommand copyWithZone:](self->_currentItemTransition, "copyWithZone:", a3);
  v28 = (void *)v6[5];
  v6[5] = v27;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _ICLLPlaybackSyncCommand *playbackSync;
  _ICLLAddQueueItemsCommand *addItems;
  _ICLLRemoveQueueItemCommand *removeItem;
  _ICLLMoveQueueItemCommand *moveItem;
  _ICLLCurrentItemChangeCommand *currentItemChange;
  _ICLLPlaybackControlSettingsCommand *playbackControlSettings;
  _ICLLReactionCommand *reaction;
  _ICLLClientInfoCommand *clientInfo;
  _ICLLReplaceQueueItemsCommand *replaceQueueItems;
  _ICLLPlayNowQueueItemsCommand *playNowQueueItems;
  _ICLLCurrentItemTransitionCommand *currentItemTransition;
  char v16;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_29;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 104) & 1) == 0 || self->_command != *((_DWORD *)v4 + 6))
      goto LABEL_29;
  }
  else if ((*((_BYTE *)v4 + 104) & 1) != 0)
  {
LABEL_29:
    v16 = 0;
    goto LABEL_30;
  }
  playbackSync = self->_playbackSync;
  if ((unint64_t)playbackSync | *((_QWORD *)v4 + 9)
    && !-[_ICLLPlaybackSyncCommand isEqual:](playbackSync, "isEqual:"))
  {
    goto LABEL_29;
  }
  addItems = self->_addItems;
  if ((unint64_t)addItems | *((_QWORD *)v4 + 1))
  {
    if (!-[_ICLLAddQueueItemsCommand isEqual:](addItems, "isEqual:"))
      goto LABEL_29;
  }
  removeItem = self->_removeItem;
  if ((unint64_t)removeItem | *((_QWORD *)v4 + 11))
  {
    if (!-[_ICLLRemoveQueueItemCommand isEqual:](removeItem, "isEqual:"))
      goto LABEL_29;
  }
  moveItem = self->_moveItem;
  if ((unint64_t)moveItem | *((_QWORD *)v4 + 6))
  {
    if (!-[_ICLLMoveQueueItemCommand isEqual:](moveItem, "isEqual:"))
      goto LABEL_29;
  }
  currentItemChange = self->_currentItemChange;
  if ((unint64_t)currentItemChange | *((_QWORD *)v4 + 4))
  {
    if (!-[_ICLLCurrentItemChangeCommand isEqual:](currentItemChange, "isEqual:"))
      goto LABEL_29;
  }
  playbackControlSettings = self->_playbackControlSettings;
  if ((unint64_t)playbackControlSettings | *((_QWORD *)v4 + 8))
  {
    if (!-[_ICLLPlaybackControlSettingsCommand isEqual:](playbackControlSettings, "isEqual:"))
      goto LABEL_29;
  }
  reaction = self->_reaction;
  if ((unint64_t)reaction | *((_QWORD *)v4 + 10))
  {
    if (!-[_ICLLReactionCommand isEqual:](reaction, "isEqual:"))
      goto LABEL_29;
  }
  clientInfo = self->_clientInfo;
  if ((unint64_t)clientInfo | *((_QWORD *)v4 + 2))
  {
    if (!-[_ICLLClientInfoCommand isEqual:](clientInfo, "isEqual:"))
      goto LABEL_29;
  }
  replaceQueueItems = self->_replaceQueueItems;
  if ((unint64_t)replaceQueueItems | *((_QWORD *)v4 + 12))
  {
    if (!-[_ICLLReplaceQueueItemsCommand isEqual:](replaceQueueItems, "isEqual:"))
      goto LABEL_29;
  }
  playNowQueueItems = self->_playNowQueueItems;
  if ((unint64_t)playNowQueueItems | *((_QWORD *)v4 + 7))
  {
    if (!-[_ICLLPlayNowQueueItemsCommand isEqual:](playNowQueueItems, "isEqual:"))
      goto LABEL_29;
  }
  currentItemTransition = self->_currentItemTransition;
  if ((unint64_t)currentItemTransition | *((_QWORD *)v4 + 5))
    v16 = -[_ICLLCurrentItemTransitionCommand isEqual:](currentItemTransition, "isEqual:");
  else
    v16 = 1;
LABEL_30:

  return v16;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_command;
  else
    v3 = 0;
  v4 = -[_ICLLPlaybackSyncCommand hash](self->_playbackSync, "hash") ^ v3;
  v5 = -[_ICLLAddQueueItemsCommand hash](self->_addItems, "hash");
  v6 = v4 ^ v5 ^ -[_ICLLRemoveQueueItemCommand hash](self->_removeItem, "hash");
  v7 = -[_ICLLMoveQueueItemCommand hash](self->_moveItem, "hash");
  v8 = v7 ^ -[_ICLLCurrentItemChangeCommand hash](self->_currentItemChange, "hash");
  v9 = v6 ^ v8 ^ -[_ICLLPlaybackControlSettingsCommand hash](self->_playbackControlSettings, "hash");
  v10 = -[_ICLLReactionCommand hash](self->_reaction, "hash");
  v11 = v10 ^ -[_ICLLClientInfoCommand hash](self->_clientInfo, "hash");
  v12 = v11 ^ -[_ICLLReplaceQueueItemsCommand hash](self->_replaceQueueItems, "hash");
  v13 = v9 ^ v12 ^ -[_ICLLPlayNowQueueItemsCommand hash](self->_playNowQueueItems, "hash");
  return v13 ^ -[_ICLLCurrentItemTransitionCommand hash](self->_currentItemTransition, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replaceQueueItems, 0);
  objc_storeStrong((id *)&self->_removeItem, 0);
  objc_storeStrong((id *)&self->_reaction, 0);
  objc_storeStrong((id *)&self->_playbackSync, 0);
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);
  objc_storeStrong((id *)&self->_playNowQueueItems, 0);
  objc_storeStrong((id *)&self->_moveItem, 0);
  objc_storeStrong((id *)&self->_currentItemTransition, 0);
  objc_storeStrong((id *)&self->_currentItemChange, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_addItems, 0);
}

- (void)clearOneofValuesForCommand
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

  if (a1)
  {
    *(_BYTE *)(a1 + 104) &= ~1u;
    *(_DWORD *)(a1 + 24) = 0;
    v2 = *(void **)(a1 + 72);
    *(_QWORD *)(a1 + 72) = 0;

    v3 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

    v4 = *(void **)(a1 + 88);
    *(_QWORD *)(a1 + 88) = 0;

    v5 = *(void **)(a1 + 48);
    *(_QWORD *)(a1 + 48) = 0;

    v6 = *(void **)(a1 + 32);
    *(_QWORD *)(a1 + 32) = 0;

    v7 = *(void **)(a1 + 64);
    *(_QWORD *)(a1 + 64) = 0;

    v8 = *(void **)(a1 + 80);
    *(_QWORD *)(a1 + 80) = 0;

    v9 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v10 = *(void **)(a1 + 96);
    *(_QWORD *)(a1 + 96) = 0;

    v11 = *(void **)(a1 + 56);
    *(_QWORD *)(a1 + 56) = 0;

    v12 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

  }
}

- (void)setRemoveItem:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(_BYTE *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 3;
    objc_storeStrong((id *)(a1 + 88), a2);
  }

}

- (void)setMoveItem:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(_BYTE *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 4;
    objc_storeStrong((id *)(a1 + 48), a2);
  }

}

- (void)setClientInfo:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLCommandMessage clearOneofValuesForCommand](a1);
    *(_BYTE *)(a1 + 104) |= 1u;
    *(_DWORD *)(a1 + 24) = 8;
    objc_storeStrong((id *)(a1 + 16), a2);
  }

}

@end
