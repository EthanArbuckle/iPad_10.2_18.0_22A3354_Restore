@implementation _ICLLPlaybackSyncStateQuery

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackSyncStateQuery;
  -[_ICLLPlaybackSyncStateQuery description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlaybackSyncStateQuery dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSMutableArray *participantStates;
  NSMutableArray *transportControlStates;
  NSString *currentItemId;
  NSString *initialAVSyncStartItemId;
  void *v9;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  participantStates = self->_participantStates;
  if (participantStates)
    objc_msgSend(v3, "setObject:forKey:", participantStates, CFSTR("participantStates"));
  transportControlStates = self->_transportControlStates;
  if (transportControlStates)
    objc_msgSend(v4, "setObject:forKey:", transportControlStates, CFSTR("transportControlStates"));
  currentItemId = self->_currentItemId;
  if (currentItemId)
    objc_msgSend(v4, "setObject:forKey:", currentItemId, CFSTR("currentItemId"));
  initialAVSyncStartItemId = self->_initialAVSyncStartItemId;
  if (initialAVSyncStartItemId)
    objc_msgSend(v4, "setObject:forKey:", initialAVSyncStartItemId, CFSTR("initialAVSyncStartItemId"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_initialAVSyncInitiator);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v9, CFSTR("initialAVSyncInitiator"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackSyncStateQueryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v5 = self->_participantStates;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v7);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v10 = self->_transportControlStates;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v16;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v10);
        PBDataWriterWriteStringField();
        ++v14;
      }
      while (v12 != v14);
      v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v12);
  }

  if (self->_currentItemId)
    PBDataWriterWriteStringField();
  if (self->_initialAVSyncStartItemId)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteBOOLField();

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableArray *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = self->_participantStates;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v10), "copyWithZone:", a3);
        -[_ICLLPlaybackSyncStateQuery addParticipantStates:](v5, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v12 = self->_transportControlStates;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v24;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v24 != v15)
          objc_enumerationMutation(v12);
        v17 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v16), "copyWithZone:", a3, (_QWORD)v23);
        -[_ICLLPlaybackSyncStateQuery addTransportControlStates:](v5, v17);

        ++v16;
      }
      while (v14 != v16);
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v14);
  }

  v18 = -[NSString copyWithZone:](self->_currentItemId, "copyWithZone:", a3);
  v19 = *(void **)(v5 + 8);
  *(_QWORD *)(v5 + 8) = v18;

  v20 = -[NSString copyWithZone:](self->_initialAVSyncStartItemId, "copyWithZone:", a3);
  v21 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v20;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_BYTE *)(v5 + 40) = self->_initialAVSyncInitiator;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSMutableArray *participantStates;
  NSMutableArray *transportControlStates;
  NSString *currentItemId;
  NSString *initialAVSyncStartItemId;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  participantStates = self->_participantStates;
  if ((unint64_t)participantStates | *((_QWORD *)v4 + 3))
  {
    if (!-[NSMutableArray isEqual:](participantStates, "isEqual:"))
      goto LABEL_12;
  }
  transportControlStates = self->_transportControlStates;
  if ((unint64_t)transportControlStates | *((_QWORD *)v4 + 4))
  {
    if (!-[NSMutableArray isEqual:](transportControlStates, "isEqual:"))
      goto LABEL_12;
  }
  currentItemId = self->_currentItemId;
  if ((unint64_t)currentItemId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](currentItemId, "isEqual:"))
      goto LABEL_12;
  }
  initialAVSyncStartItemId = self->_initialAVSyncStartItemId;
  if ((unint64_t)initialAVSyncStartItemId | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](initialAVSyncStartItemId, "isEqual:"))
      goto LABEL_12;
  }
  v9 = (*((_BYTE *)v4 + 44) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0)
    {
LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
    if (self->_initialAVSyncInitiator)
    {
      if (!*((_BYTE *)v4 + 40))
        goto LABEL_12;
    }
    else if (*((_BYTE *)v4 + 40))
    {
      goto LABEL_12;
    }
    v9 = 1;
  }
LABEL_13:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  uint64_t v7;

  v3 = -[NSMutableArray hash](self->_participantStates, "hash");
  v4 = -[NSMutableArray hash](self->_transportControlStates, "hash");
  v5 = -[NSString hash](self->_currentItemId, "hash");
  v6 = -[NSString hash](self->_initialAVSyncStartItemId, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v7 = 2654435761 * self->_initialAVSyncInitiator;
  else
    v7 = 0;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportControlStates, 0);
  objc_storeStrong((id *)&self->_participantStates, 0);
  objc_storeStrong((id *)&self->_initialAVSyncStartItemId, 0);
  objc_storeStrong((id *)&self->_currentItemId, 0);
}

- (void)addParticipantStates:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 24);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 24);
      *(_QWORD *)(a1 + 24) = v5;

      v4 = *(void **)(a1 + 24);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

- (void)addTransportControlStates:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = a2;
  if (a1)
  {
    v4 = *(void **)(a1 + 32);
    v7 = v3;
    if (!v4)
    {
      v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v6 = *(void **)(a1 + 32);
      *(_QWORD *)(a1 + 32) = v5;

      v4 = *(void **)(a1 + 32);
    }
    objc_msgSend(v4, "addObject:", v7);
    v3 = v7;
  }

}

@end
