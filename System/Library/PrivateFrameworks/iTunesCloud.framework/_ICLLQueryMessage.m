@implementation _ICLLQueryMessage

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLQueryMessage;
  -[_ICLLQueryMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLQueryMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  _ICLLQueueQuery *queue;
  void *v5;
  _ICLLPlaybackSyncStateQuery *playbackSyncState;
  void *v7;
  _ICLLPlaybackControlSettingsQuery *playbackControlSettings;
  void *v9;
  _ICLLParticipantQuery *participant;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  if (queue)
  {
    -[_ICLLQueueQuery dictionaryRepresentation](queue, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("queue"));

  }
  playbackSyncState = self->_playbackSyncState;
  if (playbackSyncState)
  {
    -[_ICLLPlaybackSyncStateQuery dictionaryRepresentation](playbackSyncState, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("playbackSyncState"));

  }
  playbackControlSettings = self->_playbackControlSettings;
  if (playbackControlSettings)
  {
    -[_ICLLPlaybackControlSettingsQuery dictionaryRepresentation](playbackControlSettings, "dictionaryRepresentation");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("playbackControlSettings"));

  }
  participant = self->_participant;
  if (participant)
  {
    -[_ICLLParticipantQuery dictionaryRepresentation](participant, "dictionaryRepresentation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v11, CFSTR("participant"));

  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_query);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("query"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLQueryMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_queue)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playbackSyncState)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_playbackControlSettings)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_participant)
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

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_query;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v7 = -[_ICLLQueueQuery copyWithZone:](self->_queue, "copyWithZone:", a3);
  v8 = (void *)v6[5];
  v6[5] = v7;

  v9 = -[_ICLLPlaybackSyncStateQuery copyWithZone:](self->_playbackSyncState, "copyWithZone:", a3);
  v10 = (void *)v6[3];
  v6[3] = v9;

  v11 = -[_ICLLPlaybackControlSettingsQuery copyWithZone:](self->_playbackControlSettings, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[_ICLLParticipantQuery copyWithZone:](self->_participant, "copyWithZone:", a3);
  v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  _ICLLQueueQuery *queue;
  _ICLLPlaybackSyncStateQuery *playbackSyncState;
  _ICLLPlaybackControlSettingsQuery *playbackControlSettings;
  _ICLLParticipantQuery *participant;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_query != *((_DWORD *)v4 + 8))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  queue = self->_queue;
  if ((unint64_t)queue | *((_QWORD *)v4 + 5) && !-[_ICLLQueueQuery isEqual:](queue, "isEqual:"))
    goto LABEL_15;
  playbackSyncState = self->_playbackSyncState;
  if ((unint64_t)playbackSyncState | *((_QWORD *)v4 + 3))
  {
    if (!-[_ICLLPlaybackSyncStateQuery isEqual:](playbackSyncState, "isEqual:"))
      goto LABEL_15;
  }
  playbackControlSettings = self->_playbackControlSettings;
  if ((unint64_t)playbackControlSettings | *((_QWORD *)v4 + 2))
  {
    if (!-[_ICLLPlaybackControlSettingsQuery isEqual:](playbackControlSettings, "isEqual:"))
      goto LABEL_15;
  }
  participant = self->_participant;
  if ((unint64_t)participant | *((_QWORD *)v4 + 1))
    v9 = -[_ICLLParticipantQuery isEqual:](participant, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_query;
  else
    v3 = 0;
  v4 = -[_ICLLQueueQuery hash](self->_queue, "hash") ^ v3;
  v5 = -[_ICLLPlaybackSyncStateQuery hash](self->_playbackSyncState, "hash");
  v6 = v4 ^ v5 ^ -[_ICLLPlaybackControlSettingsQuery hash](self->_playbackControlSettings, "hash");
  return v6 ^ -[_ICLLParticipantQuery hash](self->_participant, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_playbackSyncState, 0);
  objc_storeStrong((id *)&self->_playbackControlSettings, 0);
  objc_storeStrong((id *)&self->_participant, 0);
}

- (void)clearOneofValuesForQuery
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  if (a1)
  {
    *(_BYTE *)(a1 + 48) &= ~1u;
    *(_DWORD *)(a1 + 32) = 0;
    v2 = *(void **)(a1 + 40);
    *(_QWORD *)(a1 + 40) = 0;

    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v4 = *(void **)(a1 + 16);
    *(_QWORD *)(a1 + 16) = 0;

    v5 = *(void **)(a1 + 8);
    *(_QWORD *)(a1 + 8) = 0;

  }
}

- (void)setPlaybackSyncState:(uint64_t)a1
{
  id v4;

  v4 = a2;
  if (a1)
  {
    -[_ICLLQueryMessage clearOneofValuesForQuery](a1);
    *(_BYTE *)(a1 + 48) |= 1u;
    *(_DWORD *)(a1 + 32) = 2;
    objc_storeStrong((id *)(a1 + 24), a2);
  }

}

@end
