@implementation TPPBDispositionEntry

- (BOOL)hasPeerID
{
  return self->_peerID != 0;
}

- (BOOL)hasDisposition
{
  return self->_disposition != 0;
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
  v8.super_class = (Class)TPPBDispositionEntry;
  -[TPPBDispositionEntry description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TPPBDispositionEntry dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *peerID;
  TPPBDisposition *disposition;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  peerID = self->_peerID;
  if (peerID)
    objc_msgSend(v3, "setObject:forKey:", peerID, CFSTR("peerID"));
  disposition = self->_disposition;
  if (disposition)
  {
    -[TPPBDisposition dictionaryRepresentation](disposition, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("disposition"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TPPBDispositionEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_peerID)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_disposition)
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
  if (self->_peerID)
  {
    objc_msgSend(v4, "setPeerID:");
    v4 = v5;
  }
  if (self->_disposition)
  {
    objc_msgSend(v5, "setDisposition:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_peerID, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[TPPBDisposition copyWithZone:](self->_disposition, "copyWithZone:", a3);
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *peerID;
  TPPBDisposition *disposition;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((peerID = self->_peerID, !((unint64_t)peerID | v4[2]))
     || -[NSString isEqual:](peerID, "isEqual:")))
  {
    disposition = self->_disposition;
    if ((unint64_t)disposition | v4[1])
      v7 = -[TPPBDisposition isEqual:](disposition, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_peerID, "hash");
  return -[TPPBDisposition hash](self->_disposition, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  TPPBDisposition *disposition;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[TPPBDispositionEntry setPeerID:](self, "setPeerID:");
    v4 = v7;
  }
  disposition = self->_disposition;
  v6 = v4[1];
  if (disposition)
  {
    if (v6)
    {
      -[TPPBDisposition mergeFrom:](disposition, "mergeFrom:");
LABEL_8:
      v4 = v7;
    }
  }
  else if (v6)
  {
    -[TPPBDispositionEntry setDisposition:](self, "setDisposition:");
    goto LABEL_8;
  }

}

- (NSString)peerID
{
  return self->_peerID;
}

- (void)setPeerID:(id)a3
{
  objc_storeStrong((id *)&self->_peerID, a3);
}

- (TPPBDisposition)disposition
{
  return self->_disposition;
}

- (void)setDisposition:(id)a3
{
  objc_storeStrong((id *)&self->_disposition, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerID, 0);
  objc_storeStrong((id *)&self->_disposition, 0);
}

@end
