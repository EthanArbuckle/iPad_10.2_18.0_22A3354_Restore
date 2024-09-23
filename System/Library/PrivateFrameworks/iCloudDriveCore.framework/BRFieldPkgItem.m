@implementation BRFieldPkgItem

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) < 4)
    return off_24FE41668[a3 - 1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), *(_QWORD *)&a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int)StringAsType:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("DIRECTORY")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("FILE")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("SYMLINK")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("TOMBSTONE")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 1;
  }

  return v4;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (void)setMtime:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_mtime = a3;
}

- (void)setHasMtime:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMtime
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setIsWritable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 8u;
  self->_isWritable = a3;
}

- (void)setHasIsWritable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 8;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsWritable
{
  return (*(_BYTE *)&self->_has >> 3) & 1;
}

- (void)setIsExecutable:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 4u;
  self->_isExecutable = a3;
}

- (void)setHasIsExecutable:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 4;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExecutable
{
  return (*(_BYTE *)&self->_has >> 2) & 1;
}

- (BOOL)hasSymlinkContent
{
  return self->_symlinkContent != 0;
}

- (BOOL)hasQuarantineInfo
{
  return self->_quarantineInfo != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setXattrIndex:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_xattrIndex = a3;
}

- (void)setHasXattrIndex:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasXattrIndex
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
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
  v8.super_class = (Class)BRFieldPkgItem;
  -[BRFieldPkgItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldPkgItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  unsigned int v4;
  __CFString *v5;
  NSString *path;
  char has;
  void *v8;
  NSString *symlinkContent;
  NSData *quarantineInfo;
  NSData *signature;
  void *v12;
  void *v14;
  void *v15;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = self->_type - 1;
  if (v4 >= 4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown: %i)"), self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_24FE41668[v4];
  }
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("type"));

  path = self->_path;
  if (path)
    objc_msgSend(v3, "setObject:forKey:", path, CFSTR("path"));
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_mtime);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v14, CFSTR("mtime"));

    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 4) == 0)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_8;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isWritable);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("isWritable"));

  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_9:
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_isExecutable);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("isExecutable"));

  }
LABEL_10:
  symlinkContent = self->_symlinkContent;
  if (symlinkContent)
    objc_msgSend(v3, "setObject:forKey:", symlinkContent, CFSTR("symlinkContent"));
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo)
    objc_msgSend(v3, "setObject:forKey:", quarantineInfo, CFSTR("quarantineInfo"));
  signature = self->_signature;
  if (signature)
    objc_msgSend(v3, "setObject:forKey:", signature, CFSTR("signature"));
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_xattrIndex);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v12, CFSTR("xattrIndex"));

  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldPkgItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;
  void *v5;
  id v6;

  v6 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_path)
    PBDataWriterWriteStringField();
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteInt64Field();
    has = (char)self->_has;
  }
  v5 = v6;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
    has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }
  if (self->_symlinkContent)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_quarantineInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  char has;
  _DWORD *v6;

  v4 = a3;
  v4[14] = self->_type;
  v6 = v4;
  if (self->_path)
  {
    objc_msgSend(v4, "setPath:");
    v4 = v6;
  }
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)v4 + 1) = self->_mtime;
    *((_BYTE *)v4 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((_BYTE *)v4 + 61) = self->_isWritable;
  *((_BYTE *)v4 + 64) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((_BYTE *)v4 + 60) = self->_isExecutable;
    *((_BYTE *)v4 + 64) |= 4u;
  }
LABEL_7:
  if (self->_symlinkContent)
  {
    objc_msgSend(v6, "setSymlinkContent:");
    v4 = v6;
  }
  if (self->_quarantineInfo)
  {
    objc_msgSend(v6, "setQuarantineInfo:");
    v4 = v6;
  }
  if (self->_signature)
  {
    objc_msgSend(v6, "setSignature:");
    v4 = v6;
  }
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *((_QWORD *)v4 + 2) = self->_xattrIndex;
    *((_BYTE *)v4 + 64) |= 2u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 56) = self->_type;
  v6 = -[NSString copyWithZone:](self->_path, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v6;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_mtime;
    *(_BYTE *)(v5 + 64) |= 1u;
    has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0)
        goto LABEL_5;
      goto LABEL_4;
    }
  }
  else if ((*(_BYTE *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(_BYTE *)(v5 + 61) = self->_isWritable;
  *(_BYTE *)(v5 + 64) |= 8u;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_BYTE *)(v5 + 60) = self->_isExecutable;
    *(_BYTE *)(v5 + 64) |= 4u;
  }
LABEL_5:
  v9 = -[NSString copyWithZone:](self->_symlinkContent, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v9;

  v11 = -[NSData copyWithZone:](self->_quarantineInfo, "copyWithZone:", a3);
  v12 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v11;

  v13 = -[NSData copyWithZone:](self->_signature, "copyWithZone:", a3);
  v14 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v13;

  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_xattrIndex;
    *(_BYTE *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *path;
  NSString *symlinkContent;
  NSData *quarantineInfo;
  NSData *signature;
  BOOL v9;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_36;
  if (self->_type != *((_DWORD *)v4 + 14))
    goto LABEL_36;
  path = self->_path;
  if ((unint64_t)path | *((_QWORD *)v4 + 3))
  {
    if (!-[NSString isEqual:](path, "isEqual:"))
      goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 1) == 0 || self->_mtime != *((_QWORD *)v4 + 1))
      goto LABEL_36;
  }
  else if ((*((_BYTE *)v4 + 64) & 1) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 8) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 8) == 0)
      goto LABEL_36;
    if (self->_isWritable)
    {
      if (!*((_BYTE *)v4 + 61))
        goto LABEL_36;
    }
    else if (*((_BYTE *)v4 + 61))
    {
      goto LABEL_36;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 4) != 0)
    {
      if (self->_isExecutable)
      {
        if (!*((_BYTE *)v4 + 60))
          goto LABEL_36;
        goto LABEL_26;
      }
      if (!*((_BYTE *)v4 + 60))
        goto LABEL_26;
    }
LABEL_36:
    v9 = 0;
    goto LABEL_37;
  }
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
    goto LABEL_36;
LABEL_26:
  symlinkContent = self->_symlinkContent;
  if ((unint64_t)symlinkContent | *((_QWORD *)v4 + 6)
    && !-[NSString isEqual:](symlinkContent, "isEqual:"))
  {
    goto LABEL_36;
  }
  quarantineInfo = self->_quarantineInfo;
  if ((unint64_t)quarantineInfo | *((_QWORD *)v4 + 4))
  {
    if (!-[NSData isEqual:](quarantineInfo, "isEqual:"))
      goto LABEL_36;
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((_QWORD *)v4 + 5))
  {
    if (!-[NSData isEqual:](signature, "isEqual:"))
      goto LABEL_36;
  }
  v9 = (*((_BYTE *)v4 + 64) & 2) == 0;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 64) & 2) == 0 || self->_xattrIndex != *((_QWORD *)v4 + 2))
      goto LABEL_36;
    v9 = 1;
  }
LABEL_37:

  return v9;
}

- (unint64_t)hash
{
  uint64_t type;
  NSUInteger v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  type = self->_type;
  v4 = -[NSString hash](self->_path, "hash");
  if ((*(_BYTE *)&self->_has & 1) == 0)
  {
    v5 = 0;
    if ((*(_BYTE *)&self->_has & 8) != 0)
      goto LABEL_3;
LABEL_6:
    v6 = 0;
    if ((*(_BYTE *)&self->_has & 4) != 0)
      goto LABEL_4;
    goto LABEL_7;
  }
  v5 = 2654435761 * self->_mtime;
  if ((*(_BYTE *)&self->_has & 8) == 0)
    goto LABEL_6;
LABEL_3:
  v6 = 2654435761 * self->_isWritable;
  if ((*(_BYTE *)&self->_has & 4) != 0)
  {
LABEL_4:
    v7 = 2654435761 * self->_isExecutable;
    goto LABEL_8;
  }
LABEL_7:
  v7 = 0;
LABEL_8:
  v8 = -[NSString hash](self->_symlinkContent, "hash");
  v9 = -[NSData hash](self->_quarantineInfo, "hash");
  v10 = -[NSData hash](self->_signature, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v11 = 2654435761 * self->_xattrIndex;
  else
    v11 = 0;
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * type) ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4;
  char v5;
  id v6;

  v4 = a3;
  self->_type = *((_DWORD *)v4 + 14);
  v6 = v4;
  if (*((_QWORD *)v4 + 3))
  {
    -[BRFieldPkgItem setPath:](self, "setPath:");
    v4 = v6;
  }
  v5 = *((_BYTE *)v4 + 64);
  if ((v5 & 1) != 0)
  {
    self->_mtime = *((_QWORD *)v4 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)v4 + 64);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0)
        goto LABEL_7;
      goto LABEL_6;
    }
  }
  else if ((*((_BYTE *)v4 + 64) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_isWritable = *((_BYTE *)v4 + 61);
  *(_BYTE *)&self->_has |= 8u;
  if ((*((_BYTE *)v4 + 64) & 4) != 0)
  {
LABEL_6:
    self->_isExecutable = *((_BYTE *)v4 + 60);
    *(_BYTE *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((_QWORD *)v4 + 6))
  {
    -[BRFieldPkgItem setSymlinkContent:](self, "setSymlinkContent:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 4))
  {
    -[BRFieldPkgItem setQuarantineInfo:](self, "setQuarantineInfo:");
    v4 = v6;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BRFieldPkgItem setSignature:](self, "setSignature:");
    v4 = v6;
  }
  if ((*((_BYTE *)v4 + 64) & 2) != 0)
  {
    self->_xattrIndex = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 2u;
  }

}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
  objc_storeStrong((id *)&self->_path, a3);
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (BOOL)isExecutable
{
  return self->_isExecutable;
}

- (NSString)symlinkContent
{
  return self->_symlinkContent;
}

- (void)setSymlinkContent:(id)a3
{
  objc_storeStrong((id *)&self->_symlinkContent, a3);
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (void)setQuarantineInfo:(id)a3
{
  objc_storeStrong((id *)&self->_quarantineInfo, a3);
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
  objc_storeStrong((id *)&self->_signature, a3);
}

- (int64_t)xattrIndex
{
  return self->_xattrIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (BRFieldPkgItem)initWithPkgItem:(id)a3
{
  id v4;
  BRFieldPkgItem *v5;
  BRFieldPkgItem *v6;

  v4 = a3;
  v5 = -[BRFieldPkgItem init](self, "init");
  v6 = v5;
  if (v5)
    -[BRFieldPkgItem updateWithPkgItem:](v5, "updateWithPkgItem:", v4);

  return v6;
}

- (void)updateWithPkgItem:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;

  v9 = a3;
  -[BRFieldPkgItem setType:](self, "setType:", objc_msgSend(v9, "type"));
  objc_msgSend(v9, "pathInPackage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldPkgItem setPath:](self, "setPath:", v4);

  objc_msgSend(v9, "quarantineInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldPkgItem setQuarantineInfo:](self, "setQuarantineInfo:", v5);

  -[BRFieldPkgItem setMtime:](self, "setMtime:", objc_msgSend(v9, "mtime"));
  if (objc_msgSend(v9, "isSymLink"))
  {
    objc_msgSend(v9, "symlinkContent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldPkgItem setSymlinkContent:](self, "setSymlinkContent:", v6);
LABEL_9:

    v8 = v9;
    goto LABEL_10;
  }
  v7 = objc_msgSend(v9, "isFile");
  v8 = v9;
  if (v7)
  {
    if ((objc_msgSend(v9, "mode") & 1) != 0)
      -[BRFieldPkgItem setIsWritable:](self, "setIsWritable:", 1);
    if ((objc_msgSend(v9, "mode") & 2) != 0)
      -[BRFieldPkgItem setIsExecutable:](self, "setIsExecutable:", 1);
    objc_msgSend(v9, "contentSignature");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[BRFieldPkgItem setSignature:](self, "setSignature:", v6);
    goto LABEL_9;
  }
LABEL_10:

}

- (void)clear
{
  -[BRFieldPkgItem setType:](self, "setType:", 0);
  -[BRFieldPkgItem setPath:](self, "setPath:", 0);
  -[BRFieldPkgItem setHasMtime:](self, "setHasMtime:", 0);
  -[BRFieldPkgItem setHasIsExecutable:](self, "setHasIsExecutable:", 0);
  -[BRFieldPkgItem setHasIsWritable:](self, "setHasIsWritable:", 0);
  -[BRFieldPkgItem setSignature:](self, "setSignature:", 0);
  -[BRFieldPkgItem setSymlinkContent:](self, "setSymlinkContent:", 0);
  -[BRFieldPkgItem setQuarantineInfo:](self, "setQuarantineInfo:", 0);
  -[BRFieldPkgItem setHasXattrIndex:](self, "setHasXattrIndex:", 0);
}

@end
