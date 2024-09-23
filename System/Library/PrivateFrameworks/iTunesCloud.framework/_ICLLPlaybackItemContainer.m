@implementation _ICLLPlaybackItemContainer

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLPlaybackItemContainer;
  -[_ICLLPlaybackItemContainer description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLPlaybackItemContainer dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mediaId;
  NSString *containerId;
  NSString *featureName;
  NSString *stationHash;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  mediaId = self->_mediaId;
  if (mediaId)
    objc_msgSend(v3, "setObject:forKey:", mediaId, CFSTR("mediaId"));
  containerId = self->_containerId;
  if (containerId)
    objc_msgSend(v3, "setObject:forKey:", containerId, CFSTR("containerId"));
  featureName = self->_featureName;
  if (featureName)
    objc_msgSend(v3, "setObject:forKey:", featureName, CFSTR("featureName"));
  stationHash = self->_stationHash;
  if (stationHash)
    objc_msgSend(v3, "setObject:forKey:", stationHash, CFSTR("stationHash"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLPlaybackItemContainerReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_mediaId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_containerId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_featureName)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_stationHash)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v5 + 40) = self->_type;
    *(_BYTE *)(v5 + 44) |= 1u;
  }
  v7 = -[NSString copyWithZone:](self->_mediaId, "copyWithZone:", a3);
  v8 = (void *)v6[3];
  v6[3] = v7;

  v9 = -[NSString copyWithZone:](self->_containerId, "copyWithZone:", a3);
  v10 = (void *)v6[1];
  v6[1] = v9;

  v11 = -[NSString copyWithZone:](self->_featureName, "copyWithZone:", a3);
  v12 = (void *)v6[2];
  v6[2] = v11;

  v13 = -[NSString copyWithZone:](self->_stationHash, "copyWithZone:", a3);
  v14 = (void *)v6[4];
  v6[4] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *mediaId;
  NSString *containerId;
  NSString *featureName;
  NSString *stationHash;
  char v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_15;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 44) & 1) == 0 || self->_type != *((_DWORD *)v4 + 10))
      goto LABEL_15;
  }
  else if ((*((_BYTE *)v4 + 44) & 1) != 0)
  {
LABEL_15:
    v9 = 0;
    goto LABEL_16;
  }
  mediaId = self->_mediaId;
  if ((unint64_t)mediaId | *((_QWORD *)v4 + 3) && !-[NSString isEqual:](mediaId, "isEqual:"))
    goto LABEL_15;
  containerId = self->_containerId;
  if ((unint64_t)containerId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](containerId, "isEqual:"))
      goto LABEL_15;
  }
  featureName = self->_featureName;
  if ((unint64_t)featureName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](featureName, "isEqual:"))
      goto LABEL_15;
  }
  stationHash = self->_stationHash;
  if ((unint64_t)stationHash | *((_QWORD *)v4 + 4))
    v9 = -[NSString isEqual:](stationHash, "isEqual:");
  else
    v9 = 1;
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_mediaId, "hash") ^ v3;
  v5 = -[NSString hash](self->_containerId, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_featureName, "hash");
  return v6 ^ -[NSString hash](self->_stationHash, "hash");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stationHash, 0);
  objc_storeStrong((id *)&self->_mediaId, 0);
  objc_storeStrong((id *)&self->_featureName, 0);
  objc_storeStrong((id *)&self->_containerId, 0);
}

@end
