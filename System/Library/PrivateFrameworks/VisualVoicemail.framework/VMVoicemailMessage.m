@implementation VMVoicemailMessage

- (void)setRemoteUID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x20u;
  self->_remoteUID = a3;
}

- (void)setHasRemoteUID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 32;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xDF | v3;
}

- (BOOL)hasRemoteUID
{
  return (*(_BYTE *)&self->_has >> 5) & 1;
}

- (void)setIdentifier:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_identifier = a3;
}

- (void)setHasIdentifier:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIdentifier
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setDate:(double)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_date = a3;
}

- (void)setHasDate:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDate
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasSenderDestinationID
{
  return self->_senderDestinationID != 0;
}

- (BOOL)hasCallbackDestinationID
{
  return self->_callbackDestinationID != 0;
}

- (void)setDuration:(double)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDuration
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasDataURL
{
  return self->_dataURL != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFlags
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasTranscriptionURL
{
  return self->_transcriptionURL != 0;
}

- (BOOL)hasTranscript
{
  return self->_transcript != 0;
}

- (BOOL)hasAudio
{
  return self->_audio != 0;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 0x10u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 16;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xEF | v3;
}

- (BOOL)hasProtocolVersion
{
  return (*(_BYTE *)&self->_has >> 4) & 1;
}

- (BOOL)hasReceiverDestinationID
{
  return self->_receiverDestinationID != 0;
}

- (BOOL)hasReceiverLabelID
{
  return self->_receiverLabelID != 0;
}

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)VMVoicemailMessage;
  -[VMVoicemailMessage description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VMVoicemailMessage dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  void *v5;
  NSString *senderDestinationID;
  NSString *callbackDestinationID;
  void *v8;
  NSString *dataURL;
  void *v10;
  NSString *transcriptionURL;
  VMTranscriptMessage *transcript;
  void *v13;
  VMAudioMessage *audio;
  void *v15;
  void *v16;
  NSString *receiverDestinationID;
  NSString *receiverLabelID;
  NSString *uuid;
  void *v21;
  void *v22;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_remoteUID);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v21, CFSTR("remoteUID"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_identifier);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("identifier"));

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_date);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("date"));

  }
LABEL_5:
  senderDestinationID = self->_senderDestinationID;
  if (senderDestinationID)
    objc_msgSend(v3, "setObject:forKey:", senderDestinationID, CFSTR("senderDestinationID"));
  callbackDestinationID = self->_callbackDestinationID;
  if (callbackDestinationID)
    objc_msgSend(v3, "setObject:forKey:", callbackDestinationID, CFSTR("callbackDestinationID"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_duration);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("duration"));

  }
  dataURL = self->_dataURL;
  if (dataURL)
    objc_msgSend(v3, "setObject:forKey:", dataURL, CFSTR("dataURL"));
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_flags);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("flags"));

  }
  transcriptionURL = self->_transcriptionURL;
  if (transcriptionURL)
    objc_msgSend(v3, "setObject:forKey:", transcriptionURL, CFSTR("transcriptionURL"));
  transcript = self->_transcript;
  if (transcript)
  {
    -[VMTranscriptMessage dictionaryRepresentation](transcript, "dictionaryRepresentation");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v13, CFSTR("transcript"));

  }
  audio = self->_audio;
  if (audio)
  {
    -[VMAudioMessage dictionaryRepresentation](audio, "dictionaryRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("audio"));

  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_protocolVersion);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("protocolVersion"));

  }
  receiverDestinationID = self->_receiverDestinationID;
  if (receiverDestinationID)
    objc_msgSend(v3, "setObject:forKey:", receiverDestinationID, CFSTR("receiverDestinationID"));
  receiverLabelID = self->_receiverLabelID;
  if (receiverLabelID)
    objc_msgSend(v3, "setObject:forKey:", receiverLabelID, CFSTR("receiverLabelID"));
  uuid = self->_uuid;
  if (uuid)
    objc_msgSend(v3, "setObject:forKey:", uuid, CFSTR("uuid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VMVoicemailMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  id v6;

  v4 = a3;
  has = (char)self->_has;
  v6 = v4;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  v4 = v6;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
LABEL_5:
  if (self->_senderDestinationID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_callbackDestinationID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    v4 = v6;
  }
  if (self->_dataURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_transcriptionURL)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_transcript)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if (self->_audio)
  {
    PBDataWriterWriteSubmessage();
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteUint32Field();
    v4 = v6;
  }
  if (self->_receiverDestinationID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_receiverLabelID)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }
  if (self->_uuid)
  {
    PBDataWriterWriteStringField();
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    v4[20] = self->_remoteUID;
    *((_BYTE *)v4 + 120) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  v4[13] = self->_identifier;
  *((_BYTE *)v4 + 120) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *((_QWORD *)v4 + 1) = *(_QWORD *)&self->_date;
    *((_BYTE *)v4 + 120) |= 1u;
  }
LABEL_5:
  v6 = v4;
  if (self->_senderDestinationID)
  {
    objc_msgSend(v4, "setSenderDestinationID:");
    v4 = v6;
  }
  if (self->_callbackDestinationID)
  {
    objc_msgSend(v6, "setCallbackDestinationID:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = *(_QWORD *)&self->_duration;
    *((_BYTE *)v4 + 120) |= 2u;
  }
  if (self->_dataURL)
  {
    objc_msgSend(v6, "setDataURL:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    v4[12] = self->_flags;
    *((_BYTE *)v4 + 120) |= 4u;
  }
  if (self->_transcriptionURL)
  {
    objc_msgSend(v6, "setTranscriptionURL:");
    v4 = v6;
  }
  if (self->_transcript)
  {
    objc_msgSend(v6, "setTranscript:");
    v4 = v6;
  }
  if (self->_audio)
  {
    objc_msgSend(v6, "setAudio:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    v4[14] = self->_protocolVersion;
    *((_BYTE *)v4 + 120) |= 0x10u;
  }
  if (self->_receiverDestinationID)
  {
    objc_msgSend(v6, "setReceiverDestinationID:");
    v4 = v6;
  }
  if (self->_receiverLabelID)
  {
    objc_msgSend(v6, "setReceiverLabelID:");
    v4 = v6;
  }
  if (self->_uuid)
  {
    objc_msgSend(v6, "setUuid:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 0x20) != 0)
  {
    *(_DWORD *)(v5 + 80) = self->_remoteUID;
    *(_BYTE *)(v5 + 120) |= 0x20u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 52) = self->_identifier;
  *(_BYTE *)(v5 + 120) |= 8u;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
LABEL_4:
    *(double *)(v5 + 8) = self->_date;
    *(_BYTE *)(v5 + 120) |= 1u;
  }
LABEL_5:
  v8 = -[NSString copyWithZone:](self->_senderDestinationID, "copyWithZone:", a3);
  v9 = *(void **)(v6 + 88);
  *(_QWORD *)(v6 + 88) = v8;

  v10 = -[NSString copyWithZone:](self->_callbackDestinationID, "copyWithZone:", a3);
  v11 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v10;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(double *)(v6 + 16) = self->_duration;
    *(_BYTE *)(v6 + 120) |= 2u;
  }
  v12 = -[NSString copyWithZone:](self->_dataURL, "copyWithZone:", a3);
  v13 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v12;

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 48) = self->_flags;
    *(_BYTE *)(v6 + 120) |= 4u;
  }
  v14 = -[NSString copyWithZone:](self->_transcriptionURL, "copyWithZone:", a3);
  v15 = *(void **)(v6 + 104);
  *(_QWORD *)(v6 + 104) = v14;

  v16 = -[VMTranscriptMessage copyWithZone:](self->_transcript, "copyWithZone:", a3);
  v17 = *(void **)(v6 + 96);
  *(_QWORD *)(v6 + 96) = v16;

  v18 = -[VMAudioMessage copyWithZone:](self->_audio, "copyWithZone:", a3);
  v19 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v18;

  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 56) = self->_protocolVersion;
    *(_BYTE *)(v6 + 120) |= 0x10u;
  }
  v20 = -[NSString copyWithZone:](self->_receiverDestinationID, "copyWithZone:", a3);
  v21 = *(void **)(v6 + 72);
  *(_QWORD *)(v6 + 72) = v20;

  v22 = -[NSString copyWithZone:](self->_receiverLabelID, "copyWithZone:", a3);
  v23 = *(void **)(v6 + 64);
  *(_QWORD *)(v6 + 64) = v22;

  v24 = -[NSString copyWithZone:](self->_uuid, "copyWithZone:", a3);
  v25 = *(void **)(v6 + 112);
  *(_QWORD *)(v6 + 112) = v24;

  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *senderDestinationID;
  NSString *callbackDestinationID;
  char has;
  NSString *dataURL;
  NSString *transcriptionURL;
  VMTranscriptMessage *transcript;
  VMAudioMessage *audio;
  NSString *receiverDestinationID;
  NSString *receiverLabelID;
  NSString *uuid;
  char v15;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_51;
  if ((*(_BYTE *)&self->_has & 0x20) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 0x20) == 0 || self->_remoteUID != *((_DWORD *)v4 + 20))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 0x20) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 8) == 0 || self->_identifier != *((_DWORD *)v4 + 13))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 8) != 0)
  {
    goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 1) == 0 || self->_date != *((double *)v4 + 1))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
    goto LABEL_51;
  }
  senderDestinationID = self->_senderDestinationID;
  if ((unint64_t)senderDestinationID | *((_QWORD *)v4 + 11)
    && !-[NSString isEqual:](senderDestinationID, "isEqual:"))
  {
    goto LABEL_51;
  }
  callbackDestinationID = self->_callbackDestinationID;
  if ((unint64_t)callbackDestinationID | *((_QWORD *)v4 + 4))
  {
    if (!-[NSString isEqual:](callbackDestinationID, "isEqual:"))
      goto LABEL_51;
  }
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 2) == 0 || self->_duration != *((double *)v4 + 2))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 2) != 0)
  {
    goto LABEL_51;
  }
  dataURL = self->_dataURL;
  if ((unint64_t)dataURL | *((_QWORD *)v4 + 5))
  {
    if (!-[NSString isEqual:](dataURL, "isEqual:"))
    {
LABEL_51:
      v15 = 0;
      goto LABEL_52;
    }
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 4) == 0 || self->_flags != *((_DWORD *)v4 + 12))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 4) != 0)
  {
    goto LABEL_51;
  }
  transcriptionURL = self->_transcriptionURL;
  if ((unint64_t)transcriptionURL | *((_QWORD *)v4 + 13)
    && !-[NSString isEqual:](transcriptionURL, "isEqual:"))
  {
    goto LABEL_51;
  }
  transcript = self->_transcript;
  if ((unint64_t)transcript | *((_QWORD *)v4 + 12))
  {
    if (!-[VMTranscriptMessage isEqual:](transcript, "isEqual:"))
      goto LABEL_51;
  }
  audio = self->_audio;
  if ((unint64_t)audio | *((_QWORD *)v4 + 3))
  {
    if (!-[VMAudioMessage isEqual:](audio, "isEqual:"))
      goto LABEL_51;
  }
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
  {
    if ((*((_BYTE *)v4 + 120) & 0x10) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 14))
      goto LABEL_51;
  }
  else if ((*((_BYTE *)v4 + 120) & 0x10) != 0)
  {
    goto LABEL_51;
  }
  receiverDestinationID = self->_receiverDestinationID;
  if ((unint64_t)receiverDestinationID | *((_QWORD *)v4 + 9)
    && !-[NSString isEqual:](receiverDestinationID, "isEqual:"))
  {
    goto LABEL_51;
  }
  receiverLabelID = self->_receiverLabelID;
  if ((unint64_t)receiverLabelID | *((_QWORD *)v4 + 8))
  {
    if (!-[NSString isEqual:](receiverLabelID, "isEqual:"))
      goto LABEL_51;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((_QWORD *)v4 + 14))
    v15 = -[NSString isEqual:](uuid, "isEqual:");
  else
    v15 = 1;
LABEL_52:

  return v15;
}

- (unint64_t)hash
{
  double date;
  double v4;
  long double v5;
  double v6;
  unint64_t v7;
  NSUInteger v8;
  unint64_t v9;
  double duration;
  double v11;
  long double v12;
  double v13;
  NSUInteger v14;
  uint64_t v15;
  NSUInteger v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;

  if ((*(_BYTE *)&self->_has & 0x20) == 0)
  {
    v25 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_9:
    v24 = 0;
    if ((*(_BYTE *)&self->_has & 1) != 0)
      goto LABEL_4;
LABEL_10:
    v7 = 0;
    goto LABEL_13;
  }
  v25 = 2654435761 * self->_remoteUID;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_9;
LABEL_3:
  v24 = 2654435761 * self->_identifier;
  if ((*(_BYTE *)&self->_has & 1) == 0)
    goto LABEL_10;
LABEL_4:
  date = self->_date;
  v4 = -date;
  if (date >= 0.0)
    v4 = self->_date;
  v5 = floor(v4 + 0.5);
  v6 = (v4 - v5) * 1.84467441e19;
  v7 = 2654435761u * (unint64_t)fmod(v5, 1.84467441e19);
  if (v6 >= 0.0)
  {
    if (v6 > 0.0)
      v7 += (unint64_t)v6;
  }
  else
  {
    v7 -= (unint64_t)fabs(v6);
  }
LABEL_13:
  v23 = -[NSString hash](self->_senderDestinationID, "hash");
  v8 = -[NSString hash](self->_callbackDestinationID, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    duration = self->_duration;
    v11 = -duration;
    if (duration >= 0.0)
      v11 = self->_duration;
    v12 = floor(v11 + 0.5);
    v13 = (v11 - v12) * 1.84467441e19;
    v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0)
        v9 += (unint64_t)v13;
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    v9 = 0;
  }
  v14 = -[NSString hash](self->_dataURL, "hash");
  if ((*(_BYTE *)&self->_has & 4) != 0)
    v15 = 2654435761 * self->_flags;
  else
    v15 = 0;
  v16 = -[NSString hash](self->_transcriptionURL, "hash");
  v17 = -[VMTranscriptMessage hash](self->_transcript, "hash");
  v18 = -[VMAudioMessage hash](self->_audio, "hash");
  if ((*(_BYTE *)&self->_has & 0x10) != 0)
    v19 = 2654435761 * self->_protocolVersion;
  else
    v19 = 0;
  v20 = v24 ^ v25 ^ v7 ^ v23 ^ v8 ^ v9 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ -[NSString hash](self->_receiverDestinationID, "hash");
  v21 = -[NSString hash](self->_receiverLabelID, "hash");
  return v20 ^ v21 ^ -[NSString hash](self->_uuid, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  id v5;
  char v6;
  VMTranscriptMessage *transcript;
  uint64_t v8;
  VMAudioMessage *audio;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = v4;
  v6 = *((_BYTE *)v4 + 120);
  if ((v6 & 0x20) != 0)
  {
    self->_remoteUID = *((_DWORD *)v4 + 20);
    *(_BYTE *)&self->_has |= 0x20u;
    v6 = *((_BYTE *)v4 + 120);
    if ((v6 & 8) == 0)
    {
LABEL_3:
      if ((v6 & 1) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*((_BYTE *)v4 + 120) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_identifier = *((_DWORD *)v4 + 13);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 120) & 1) != 0)
  {
LABEL_4:
    self->_date = *((double *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
LABEL_5:
  v11 = v4;
  if (*((_QWORD *)v4 + 11))
  {
    -[VMVoicemailMessage setSenderDestinationID:](self, "setSenderDestinationID:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 4))
  {
    -[VMVoicemailMessage setCallbackDestinationID:](self, "setCallbackDestinationID:");
    v5 = v11;
  }
  if ((*((_BYTE *)v5 + 120) & 2) != 0)
  {
    self->_duration = *((double *)v5 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)v5 + 5))
  {
    -[VMVoicemailMessage setDataURL:](self, "setDataURL:");
    v5 = v11;
  }
  if ((*((_BYTE *)v5 + 120) & 4) != 0)
  {
    self->_flags = *((_DWORD *)v5 + 12);
    *(_BYTE *)&self->_has |= 4u;
  }
  if (*((_QWORD *)v5 + 13))
  {
    -[VMVoicemailMessage setTranscriptionURL:](self, "setTranscriptionURL:");
    v5 = v11;
  }
  transcript = self->_transcript;
  v8 = *((_QWORD *)v5 + 12);
  if (transcript)
  {
    if (!v8)
      goto LABEL_26;
    -[VMTranscriptMessage mergeFrom:](transcript, "mergeFrom:");
  }
  else
  {
    if (!v8)
      goto LABEL_26;
    -[VMVoicemailMessage setTranscript:](self, "setTranscript:");
  }
  v5 = v11;
LABEL_26:
  audio = self->_audio;
  v10 = *((_QWORD *)v5 + 3);
  if (audio)
  {
    if (!v10)
      goto LABEL_32;
    -[VMAudioMessage mergeFrom:](audio, "mergeFrom:");
  }
  else
  {
    if (!v10)
      goto LABEL_32;
    -[VMVoicemailMessage setAudio:](self, "setAudio:");
  }
  v5 = v11;
LABEL_32:
  if ((*((_BYTE *)v5 + 120) & 0x10) != 0)
  {
    self->_protocolVersion = *((_DWORD *)v5 + 14);
    *(_BYTE *)&self->_has |= 0x10u;
  }
  if (*((_QWORD *)v5 + 9))
  {
    -[VMVoicemailMessage setReceiverDestinationID:](self, "setReceiverDestinationID:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 8))
  {
    -[VMVoicemailMessage setReceiverLabelID:](self, "setReceiverLabelID:");
    v5 = v11;
  }
  if (*((_QWORD *)v5 + 14))
  {
    -[VMVoicemailMessage setUuid:](self, "setUuid:");
    v5 = v11;
  }

}

- (unsigned)remoteUID
{
  return self->_remoteUID;
}

- (unsigned)identifier
{
  return self->_identifier;
}

- (double)date
{
  return self->_date;
}

- (NSString)senderDestinationID
{
  return self->_senderDestinationID;
}

- (void)setSenderDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_senderDestinationID, a3);
}

- (NSString)callbackDestinationID
{
  return self->_callbackDestinationID;
}

- (void)setCallbackDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_callbackDestinationID, a3);
}

- (double)duration
{
  return self->_duration;
}

- (NSString)dataURL
{
  return self->_dataURL;
}

- (void)setDataURL:(id)a3
{
  objc_storeStrong((id *)&self->_dataURL, a3);
}

- (unsigned)flags
{
  return self->_flags;
}

- (NSString)transcriptionURL
{
  return self->_transcriptionURL;
}

- (void)setTranscriptionURL:(id)a3
{
  objc_storeStrong((id *)&self->_transcriptionURL, a3);
}

- (VMTranscriptMessage)transcript
{
  return self->_transcript;
}

- (void)setTranscript:(id)a3
{
  objc_storeStrong((id *)&self->_transcript, a3);
}

- (VMAudioMessage)audio
{
  return self->_audio;
}

- (void)setAudio:(id)a3
{
  objc_storeStrong((id *)&self->_audio, a3);
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (NSString)receiverDestinationID
{
  return self->_receiverDestinationID;
}

- (void)setReceiverDestinationID:(id)a3
{
  objc_storeStrong((id *)&self->_receiverDestinationID, a3);
}

- (NSString)receiverLabelID
{
  return self->_receiverLabelID;
}

- (void)setReceiverLabelID:(id)a3
{
  objc_storeStrong((id *)&self->_receiverLabelID, a3);
}

- (NSString)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
  objc_storeStrong((id *)&self->_uuid, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_transcriptionURL, 0);
  objc_storeStrong((id *)&self->_transcript, 0);
  objc_storeStrong((id *)&self->_senderDestinationID, 0);
  objc_storeStrong((id *)&self->_receiverDestinationID, 0);
  objc_storeStrong((id *)&self->_receiverLabelID, 0);
  objc_storeStrong((id *)&self->_dataURL, 0);
  objc_storeStrong((id *)&self->_callbackDestinationID, 0);
  objc_storeStrong((id *)&self->_audio, 0);
}

@end
