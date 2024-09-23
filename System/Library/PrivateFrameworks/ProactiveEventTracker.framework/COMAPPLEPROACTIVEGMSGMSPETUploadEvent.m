@implementation COMAPPLEPROACTIVEGMSGMSPETUploadEvent

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (BOOL)hasUberEvent
{
  return self->_uberEvent != 0;
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
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSPETUploadEvent;
  -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  COMAPPLEPETCOMMONPETMetadata *metadata;
  void *v5;
  COMAPPLEPROACTIVEGMSGMSUberEvent *uberEvent;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  metadata = self->_metadata;
  if (metadata)
  {
    -[COMAPPLEPETCOMMONPETMetadata dictionaryRepresentation](metadata, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("metadata"));

  }
  uberEvent = self->_uberEvent;
  if (uberEvent)
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent dictionaryRepresentation](uberEvent, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("uberEvent"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSPETUploadEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_metadata)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_uberEvent)
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
  if (self->_metadata)
  {
    objc_msgSend(v4, "setMetadata:");
    v4 = v5;
  }
  if (self->_uberEvent)
  {
    objc_msgSend(v5, "setUberEvent:");
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

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[COMAPPLEPETCOMMONPETMetadata copyWithZone:](self->_metadata, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[COMAPPLEPROACTIVEGMSGMSUberEvent copyWithZone:](self->_uberEvent, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  COMAPPLEPETCOMMONPETMetadata *metadata;
  COMAPPLEPROACTIVEGMSGMSUberEvent *uberEvent;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((metadata = self->_metadata, !((unint64_t)metadata | v4[1]))
     || -[COMAPPLEPETCOMMONPETMetadata isEqual:](metadata, "isEqual:")))
  {
    uberEvent = self->_uberEvent;
    if ((unint64_t)uberEvent | v4[2])
      v7 = -[COMAPPLEPROACTIVEGMSGMSUberEvent isEqual:](uberEvent, "isEqual:");
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
  unint64_t v3;

  v3 = -[COMAPPLEPETCOMMONPETMetadata hash](self->_metadata, "hash");
  return -[COMAPPLEPROACTIVEGMSGMSUberEvent hash](self->_uberEvent, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  COMAPPLEPETCOMMONPETMetadata *metadata;
  uint64_t v6;
  COMAPPLEPROACTIVEGMSGMSUberEvent *uberEvent;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  metadata = self->_metadata;
  v6 = v4[1];
  v9 = v4;
  if (metadata)
  {
    if (!v6)
      goto LABEL_7;
    -[COMAPPLEPETCOMMONPETMetadata mergeFrom:](metadata, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent setMetadata:](self, "setMetadata:");
  }
  v4 = v9;
LABEL_7:
  uberEvent = self->_uberEvent;
  v8 = v4[2];
  if (uberEvent)
  {
    if (v8)
    {
      -[COMAPPLEPROACTIVEGMSGMSUberEvent mergeFrom:](uberEvent, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[COMAPPLEPROACTIVEGMSGMSPETUploadEvent setUberEvent:](self, "setUberEvent:");
    goto LABEL_12;
  }

}

- (COMAPPLEPETCOMMONPETMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (COMAPPLEPROACTIVEGMSGMSUberEvent)uberEvent
{
  return self->_uberEvent;
}

- (void)setUberEvent:(id)a3
{
  objc_storeStrong((id *)&self->_uberEvent, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uberEvent, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
}

@end
