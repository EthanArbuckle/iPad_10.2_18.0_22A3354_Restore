@implementation BRFieldPkgLocalItem

- (void)setGenerationID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_generationID = a3;
}

- (void)setHasGenerationID:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGenerationID
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (void)setSize:(int64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasXattrs
{
  return self->_xattrs != 0;
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
  v8.super_class = (Class)BRFieldPkgLocalItem;
  -[BRFieldPkgLocalItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BRFieldPkgLocalItem dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  BRFieldPkgItem *item;
  void *v5;
  void *v6;
  char has;
  void *v8;
  void *v9;
  NSData *xattrs;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  item = self->_item;
  if (item)
  {
    -[BRFieldPkgItem dictionaryRepresentation](item, "dictionaryRepresentation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("item"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_fileID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("fileID"));

  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_generationID);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("generationID"));

    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLongLong:", self->_size);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("size"));

  }
  xattrs = self->_xattrs;
  if (xattrs)
    objc_msgSend(v3, "setObject:forKey:", xattrs, CFSTR("xattrs"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldPkgLocalItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  char has;
  void *v6;
  id v7;

  v4 = a3;
  if (!self->_item)
    -[BRFieldPkgLocalItem writeTo:].cold.1();
  v7 = v4;
  PBDataWriterWriteSubmessage();
  PBDataWriterWriteInt64Field();
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
    PBDataWriterWriteInt64Field();
  v6 = v7;
  if (self->_xattrs)
  {
    PBDataWriterWriteDataField();
    v6 = v7;
  }

}

- (void)copyTo:(id)a3
{
  void *v4;
  char has;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "setItem:", self->_item);
  v4 = v6;
  *((_QWORD *)v6 + 1) = self->_fileID;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v6 + 6) = self->_generationID;
    *((_BYTE *)v6 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *((_QWORD *)v6 + 2) = self->_size;
    *((_BYTE *)v6 + 48) |= 1u;
  }
  if (self->_xattrs)
  {
    objc_msgSend(v6, "setXattrs:");
    v4 = v6;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  char has;
  uint64_t v9;
  void *v10;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[BRFieldPkgItem copyWithZone:](self->_item, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  *(_QWORD *)(v5 + 8) = self->_fileID;
  has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_generationID;
    *(_BYTE *)(v5 + 48) |= 2u;
    has = (char)self->_has;
  }
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 16) = self->_size;
    *(_BYTE *)(v5 + 48) |= 1u;
  }
  v9 = -[NSData copyWithZone:](self->_xattrs, "copyWithZone:", a3);
  v10 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v9;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BRFieldPkgItem *item;
  NSData *xattrs;
  char v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_17;
  item = self->_item;
  if ((unint64_t)item | *((_QWORD *)v4 + 4))
  {
    if (!-[BRFieldPkgItem isEqual:](item, "isEqual:"))
      goto LABEL_17;
  }
  if (self->_fileID != *((_QWORD *)v4 + 1))
    goto LABEL_17;
  if ((*(_BYTE *)&self->_has & 2) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 2) == 0 || self->_generationID != *((_DWORD *)v4 + 6))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 2) != 0)
  {
LABEL_17:
    v7 = 0;
    goto LABEL_18;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 48) & 1) == 0 || self->_size != *((_QWORD *)v4 + 2))
      goto LABEL_17;
  }
  else if ((*((_BYTE *)v4 + 48) & 1) != 0)
  {
    goto LABEL_17;
  }
  xattrs = self->_xattrs;
  if ((unint64_t)xattrs | *((_QWORD *)v4 + 5))
    v7 = -[NSData isEqual:](xattrs, "isEqual:");
  else
    v7 = 1;
LABEL_18:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  int64_t fileID;
  uint64_t v6;

  v3 = -[BRFieldPkgItem hash](self->_item, "hash");
  if ((*(_BYTE *)&self->_has & 2) != 0)
    v4 = 2654435761 * self->_generationID;
  else
    v4 = 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v6 = 2654435761 * self->_size;
  else
    v6 = 0;
  fileID = self->_fileID;
  return (2654435761 * fileID) ^ v3 ^ v4 ^ v6 ^ -[NSData hash](self->_xattrs, "hash");
}

- (void)mergeFrom:(id)a3
{
  id v4;
  BRFieldPkgItem *item;
  uint64_t v6;
  char v7;
  id v8;

  v4 = a3;
  item = self->_item;
  v6 = *((_QWORD *)v4 + 4);
  v8 = v4;
  if (item)
  {
    if (!v6)
      goto LABEL_7;
    -[BRFieldPkgItem mergeFrom:](item, "mergeFrom:");
  }
  else
  {
    if (!v6)
      goto LABEL_7;
    -[BRFieldPkgLocalItem setItem:](self, "setItem:");
  }
  v4 = v8;
LABEL_7:
  self->_fileID = *((_QWORD *)v4 + 1);
  v7 = *((_BYTE *)v4 + 48);
  if ((v7 & 2) != 0)
  {
    self->_generationID = *((_DWORD *)v4 + 6);
    *(_BYTE *)&self->_has |= 2u;
    v7 = *((_BYTE *)v4 + 48);
  }
  if ((v7 & 1) != 0)
  {
    self->_size = *((_QWORD *)v4 + 2);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 5))
  {
    -[BRFieldPkgLocalItem setXattrs:](self, "setXattrs:");
    v4 = v8;
  }

}

- (BRFieldPkgItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (int64_t)fileID
{
  return self->_fileID;
}

- (void)setFileID:(int64_t)a3
{
  self->_fileID = a3;
}

- (unsigned)generationID
{
  return self->_generationID;
}

- (int64_t)size
{
  return self->_size;
}

- (NSData)xattrs
{
  return self->_xattrs;
}

- (void)setXattrs:(id)a3
{
  objc_storeStrong((id *)&self->_xattrs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xattrs, 0);
  objc_storeStrong((id *)&self->_item, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldPkgLocalItem writeTo:]", "BRFieldPkgLocalItem.m", 156, "self->_item != nil");
}

@end
