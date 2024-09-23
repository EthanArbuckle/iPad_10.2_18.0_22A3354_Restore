@implementation PAPBReplayKitAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (BOOL)hasBroadcaster
{
  return self->_broadcaster != 0;
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
  v8.super_class = (Class)PAPBReplayKitAccess;
  -[PAPBReplayKitAccess description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAPBReplayKitAccess dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  PAPBAccess *access;
  void *v5;
  PAPBApplication *broadcaster;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  access = self->_access;
  if (access)
  {
    -[PAPBAccess dictionaryRepresentation](access, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("access"));

  }
  broadcaster = self->_broadcaster;
  if (broadcaster)
  {
    -[PAPBApplication dictionaryRepresentation](broadcaster, "dictionaryRepresentation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("broadcaster"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBReplayKitAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_access)
  {
    PBDataWriterWriteSubmessage();
    v4 = v5;
  }
  if (self->_broadcaster)
  {
    PBDataWriterWriteSubmessage();
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
  v6 = -[PAPBAccess copyWithZone:](self->_access, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[PAPBApplication copyWithZone:](self->_broadcaster, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PAPBAccess *access;
  PAPBApplication *broadcaster;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((access = self->_access, !((unint64_t)access | v4[1])) || -[PAPBAccess isEqual:](access, "isEqual:")))
  {
    broadcaster = self->_broadcaster;
    if ((unint64_t)broadcaster | v4[2])
      v7 = -[PAPBApplication isEqual:](broadcaster, "isEqual:");
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

  v3 = -[PAPBAccess hash](self->_access, "hash");
  return -[PAPBApplication hash](self->_broadcaster, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PAPBAccess *access;
  uint64_t v6;
  PAPBApplication *broadcaster;
  uint64_t v8;
  _QWORD *v9;

  v4 = a3;
  access = self->_access;
  v6 = v4[1];
  v9 = v4;
  if (access)
  {
    if (!v6)
      goto LABEL_7;
    -[PAPBAccess mergeFrom:](access, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[PAPBReplayKitAccess setAccess:](self, "setAccess:");
  }
  v4 = v9;
LABEL_7:
  broadcaster = self->_broadcaster;
  v8 = v4[2];
  if (broadcaster)
  {
    if (v8)
    {
      -[PAPBApplication mergeFrom:](broadcaster, "mergeFrom:");
LABEL_12:
      v4 = v9;
    }
  }
  else if (v8)
  {
    -[PAPBReplayKitAccess setBroadcaster:](self, "setBroadcaster:");
    goto LABEL_12;
  }

}

- (PAPBAccess)access
{
  return self->_access;
}

- (void)setAccess:(id)a3
{
  objc_storeStrong((id *)&self->_access, a3);
}

- (PAPBApplication)broadcaster
{
  return self->_broadcaster;
}

- (void)setBroadcaster:(id)a3
{
  objc_storeStrong((id *)&self->_broadcaster, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broadcaster, 0);
  objc_storeStrong((id *)&self->_access, 0);
}

@end
