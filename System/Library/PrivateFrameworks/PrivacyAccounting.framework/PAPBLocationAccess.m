@implementation PAPBLocationAccess

- (BOOL)hasAccess
{
  return self->_access != 0;
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
  v8.super_class = (Class)PAPBLocationAccess;
  -[PAPBLocationAccess description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PAPBLocationAccess dictionaryRepresentation](self, "dictionaryRepresentation");
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

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  access = self->_access;
  if (access)
  {
    -[PAPBAccess dictionaryRepresentation](access, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("access"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PAPBLocationAccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_access)
    PBDataWriterWriteSubmessage();
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[PAPBAccess copyWithZone:](self->_access, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  PAPBAccess *access;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
  {
    access = self->_access;
    if ((unint64_t)access | v4[1])
      v6 = -[PAPBAccess isEqual:](access, "isEqual:");
    else
      v6 = 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return -[PAPBAccess hash](self->_access, "hash");
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
  if (access)
  {
    if (v6)
    {
      v7 = v4;
      -[PAPBAccess mergeFrom:](access, "mergeFrom:");
LABEL_6:
      v4 = v7;
    }
  }
  else if (v6)
  {
    v7 = v4;
    -[PAPBLocationAccess setAccess:](self, "setAccess:");
    goto LABEL_6;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_access, 0);
}

@end
