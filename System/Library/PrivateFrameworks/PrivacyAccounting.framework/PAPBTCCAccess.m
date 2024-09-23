@implementation PAPBTCCAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
}

- (BOOL)hasTccService
{
  return self->_tccService != 0;
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
  v8.super_class = (Class)PAPBTCCAccess;
  -[PAPBTCCAccess description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAPBTCCAccess dictionaryRepresentation](self, "dictionaryRepresentation");
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
  NSString *tccService;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  access = self->_access;
  if (access)
  {
    -[PAPBAccess dictionaryRepresentation](access, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("access"));

  }
  tccService = self->_tccService;
  if (tccService)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", tccService, CFSTR("tccService"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBTCCAccessReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_tccService)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PAPBAccess copyWithZone:](self->_access, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_tccService, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PAPBAccess *access;
  NSString *tccService;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((access = self->_access, !((unint64_t)access | v4[1])) || -[PAPBAccess isEqual:](access, "isEqual:")))
  {
    tccService = self->_tccService;
    if ((unint64_t)tccService | v4[2])
      v7 = -[NSString isEqual:](tccService, "isEqual:");
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
  return -[NSString hash](self->_tccService, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  PAPBAccess *access;
  uint64_t v6;
  _QWORD *v7;

  v4 = a3;
  access = self->_access;
  v6 = v4[1];
  v7 = v4;
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
    -[PAPBTCCAccess setAccess:](self, "setAccess:");
  }
  v4 = v7;
LABEL_7:
  if (v4[2])
  {
    -[PAPBTCCAccess setTccService:](self, "setTccService:");
    v4 = v7;
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

- (NSString)tccService
{
  return self->_tccService;
}

- (void)setTccService:(id)a3
{
  objc_storeStrong((id *)&self->_tccService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tccService, 0);
  objc_storeStrong((id *)&self->_access, 0);
}

@end
