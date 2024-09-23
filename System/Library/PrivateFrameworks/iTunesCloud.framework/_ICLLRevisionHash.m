@implementation _ICLLRevisionHash

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLRevisionHash;
  -[_ICLLRevisionHash description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLRevisionHash dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *hashValue;
  void *v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_type);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("type"));

  }
  hashValue = self->_hashValue;
  if (hashValue)
    objc_msgSend(v3, "setObject:forKey:", hashValue, CFSTR("hashValue"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_revision);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("revision"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  int *v4;
  int *v5;
  int *v6;
  int *v8;
  char v9;
  unsigned int v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  BOOL v15;
  int v16;
  unint64_t v18;
  char v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  char v24;
  char v25;
  unsigned int v26;
  uint64_t v27;
  unint64_t v28;
  char v29;
  NSString *v30;
  NSString *hashValue;
  int v32;
  uint64_t v33;

  v4 = (int *)MEMORY[0x1E0D82BF0];
  v5 = (int *)MEMORY[0x1E0D82BD8];
  v6 = (int *)MEMORY[0x1E0D82BC8];
  if (*(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BF0]) < *(_QWORD *)((char *)a3 + (int)*MEMORY[0x1E0D82BD8]))
  {
    v8 = (int *)MEMORY[0x1E0D82BB8];
    while (1)
    {
      if (*((_BYTE *)a3 + *v6))
        goto LABEL_48;
      v9 = 0;
      v10 = 0;
      v11 = 0;
      while (1)
      {
        v12 = *v4;
        v13 = *(_QWORD *)((char *)a3 + v12);
        if (v13 == -1 || v13 >= *(_QWORD *)((char *)a3 + *v5))
          break;
        v14 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v13);
        *(_QWORD *)((char *)a3 + v12) = v13 + 1;
        v11 |= (unint64_t)(v14 & 0x7F) << v9;
        if ((v14 & 0x80) == 0)
          goto LABEL_12;
        v9 += 7;
        v15 = v10++ >= 9;
        if (v15)
        {
          v11 = 0;
          v16 = *((unsigned __int8 *)a3 + *v6);
          goto LABEL_14;
        }
      }
      *((_BYTE *)a3 + *v6) = 1;
LABEL_12:
      v16 = *((unsigned __int8 *)a3 + *v6);
      if (*((_BYTE *)a3 + *v6))
        v11 = 0;
LABEL_14:
      if (v16 || (v11 & 7) == 4)
        goto LABEL_48;
      v18 = v11 >> 3;
      if ((v11 >> 3) == 3)
        break;
      if ((_DWORD)v18 != 2)
      {
        if ((_DWORD)v18 != 1)
        {
          v32 = PBReaderSkipValueWithTag();
          if (!v32)
            return v32;
          goto LABEL_47;
        }
        v19 = 0;
        v20 = 0;
        v21 = 0;
        *(_BYTE *)&self->_has |= 2u;
        while (1)
        {
          v22 = *v4;
          v23 = *(_QWORD *)((char *)a3 + v22);
          if (v23 == -1 || v23 >= *(_QWORD *)((char *)a3 + *v5))
            break;
          v24 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v23);
          *(_QWORD *)((char *)a3 + v22) = v23 + 1;
          v21 |= (unint64_t)(v24 & 0x7F) << v19;
          if ((v24 & 0x80) == 0)
            goto LABEL_39;
          v19 += 7;
          v15 = v20++ >= 9;
          if (v15)
          {
            LODWORD(v21) = 0;
            goto LABEL_41;
          }
        }
        *((_BYTE *)a3 + *v6) = 1;
LABEL_39:
        if (*((_BYTE *)a3 + *v6))
          LODWORD(v21) = 0;
LABEL_41:
        v33 = 20;
        goto LABEL_46;
      }
      PBReaderReadString();
      v30 = (NSString *)objc_claimAutoreleasedReturnValue();
      hashValue = self->_hashValue;
      self->_hashValue = v30;

LABEL_47:
      if (*(_QWORD *)((char *)a3 + *v4) >= *(_QWORD *)((char *)a3 + *v5))
        goto LABEL_48;
    }
    v25 = 0;
    v26 = 0;
    v21 = 0;
    *(_BYTE *)&self->_has |= 1u;
    while (1)
    {
      v27 = *v4;
      v28 = *(_QWORD *)((char *)a3 + v27);
      if (v28 == -1 || v28 >= *(_QWORD *)((char *)a3 + *v5))
        break;
      v29 = *(_BYTE *)(*(_QWORD *)((char *)a3 + *v8) + v28);
      *(_QWORD *)((char *)a3 + v27) = v28 + 1;
      v21 |= (unint64_t)(v29 & 0x7F) << v25;
      if ((v29 & 0x80) == 0)
        goto LABEL_43;
      v25 += 7;
      v15 = v26++ >= 9;
      if (v15)
      {
        LODWORD(v21) = 0;
        goto LABEL_45;
      }
    }
    *((_BYTE *)a3 + *v6) = 1;
LABEL_43:
    if (*((_BYTE *)a3 + *v6))
      LODWORD(v21) = 0;
LABEL_45:
    v33 = 16;
LABEL_46:
    *(_DWORD *)((char *)&self->super.super.isa + v33) = v21;
    goto LABEL_47;
  }
LABEL_48:
  LOBYTE(v32) = *((_BYTE *)a3 + *v6) == 0;
  return v32;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }
  if (self->_hashValue)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteInt32Field();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_type;
    *(_BYTE *)(v5 + 24) |= 2u;
  }
  v7 = -[NSString copyWithZone:](self->_hashValue, "copyWithZone:", a3);
  v8 = *(void **)(v6 + 8);
  *(_QWORD *)(v6 + 8) = v7;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_revision;
    *(_BYTE *)(v6 + 24) |= 1u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  char has;
  char v6;
  NSString *hashValue;
  BOOL v8;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_14;
  has = (char)self->_has;
  v6 = *((_BYTE *)v4 + 24);
  if ((has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 24) & 2) == 0 || self->_type != *((_DWORD *)v4 + 5))
      goto LABEL_14;
  }
  else if ((*((_BYTE *)v4 + 24) & 2) != 0)
  {
    goto LABEL_14;
  }
  hashValue = self->_hashValue;
  if ((unint64_t)hashValue | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](hashValue, "isEqual:"))
    {
LABEL_14:
      v8 = 0;
      goto LABEL_15;
    }
    has = (char)self->_has;
    v6 = *((_BYTE *)v4 + 24);
  }
  v8 = (v6 & 1) == 0;
  if ((has & 1) != 0)
  {
    if ((v6 & 1) == 0 || self->_revision != *((_DWORD *)v4 + 4))
      goto LABEL_14;
    v8 = 1;
  }
LABEL_15:

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3;
  NSUInteger v4;
  uint64_t v5;

  if ((*(_BYTE *)&self->_has & 2) != 0)
    v3 = 2654435761 * self->_type;
  else
    v3 = 0;
  v4 = -[NSString hash](self->_hashValue, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_revision;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hashValue, 0);
}

@end
