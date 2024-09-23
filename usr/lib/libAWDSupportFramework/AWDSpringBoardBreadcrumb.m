@implementation AWDSpringBoardBreadcrumb

- (void)dealloc
{
  objc_super v3;

  -[AWDSpringBoardBreadcrumb setType:](self, "setType:", 0);
  -[AWDSpringBoardBreadcrumb setEntityID:](self, "setEntityID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardBreadcrumb;
  -[AWDSpringBoardBreadcrumb dealloc](&v3, sel_dealloc);
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_BYTE *)&self->_has & 1;
}

- (void)setWasTapped:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 2u;
  self->_wasTapped = a3;
}

- (void)setHasWasTapped:(BOOL)a3
{
  char v3;

  if (a3)
    v3 = 2;
  else
    v3 = 0;
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasTapped
{
  return (*(_BYTE *)&self->_has >> 1) & 1;
}

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasEntityID
{
  return self->_entityID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDSpringBoardBreadcrumb;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDSpringBoardBreadcrumb description](&v3, sel_description), -[AWDSpringBoardBreadcrumb dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  char has;
  NSString *type;
  NSString *entityID;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", self->_wasTapped), CFSTR("wasTapped"));
  type = self->_type;
  if (type)
    objc_msgSend(v3, "setObject:forKey:", type, CFSTR("type"));
  entityID = self->_entityID;
  if (entityID)
    objc_msgSend(v3, "setObject:forKey:", entityID, CFSTR("entityID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDSpringBoardBreadcrumbReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    PBDataWriterWriteUint64Field();
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
    PBDataWriterWriteBOOLField();
  if (self->_type)
    PBDataWriterWriteStringField();
  if (self->_entityID)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  char has;

  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_BYTE *)a3 + 32) = self->_wasTapped;
    *((_BYTE *)a3 + 36) |= 2u;
  }
  if (self->_type)
    objc_msgSend(a3, "setType:");
  if (self->_entityID)
    objc_msgSend(a3, "setEntityID:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  char has;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  has = (char)self->_has;
  if ((has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 36) |= 1u;
    has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_BYTE *)(v5 + 32) = self->_wasTapped;
    *(_BYTE *)(v5 + 36) |= 2u;
  }

  *(_QWORD *)(v6 + 24) = -[NSString copyWithZone:](self->_type, "copyWithZone:", a3);
  *(_QWORD *)(v6 + 16) = -[NSString copyWithZone:](self->_entityID, "copyWithZone:", a3);
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *type;
  NSString *entityID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (!v5)
    return v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)a3 + 36) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
      goto LABEL_11;
  }
  else if ((*((_BYTE *)a3 + 36) & 1) != 0)
  {
    goto LABEL_11;
  }
  if ((*(_BYTE *)&self->_has & 2) == 0)
  {
    if ((*((_BYTE *)a3 + 36) & 2) == 0)
      goto LABEL_17;
LABEL_11:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((_BYTE *)a3 + 36) & 2) == 0)
    goto LABEL_11;
  if (self->_wasTapped)
  {
    if (!*((_BYTE *)a3 + 32))
      goto LABEL_11;
    goto LABEL_17;
  }
  if (*((_BYTE *)a3 + 32))
    goto LABEL_11;
LABEL_17:
  type = self->_type;
  if (!((unint64_t)type | *((_QWORD *)a3 + 3)) || (v5 = -[NSString isEqual:](type, "isEqual:")) != 0)
  {
    entityID = self->_entityID;
    if ((unint64_t)entityID | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSString isEqual:](entityID, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  uint64_t v4;
  NSUInteger v5;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v3 = 2654435761u * self->_timestamp;
    if ((*(_BYTE *)&self->_has & 2) != 0)
      goto LABEL_3;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  v3 = 0;
  if ((*(_BYTE *)&self->_has & 2) == 0)
    goto LABEL_5;
LABEL_3:
  v4 = 2654435761 * self->_wasTapped;
LABEL_6:
  v5 = v4 ^ v3 ^ -[NSString hash](self->_type, "hash");
  return v5 ^ -[NSString hash](self->_entityID, "hash");
}

- (void)mergeFrom:(id)a3
{
  char v5;

  v5 = *((_BYTE *)a3 + 36);
  if ((v5 & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
    v5 = *((_BYTE *)a3 + 36);
  }
  if ((v5 & 2) != 0)
  {
    self->_wasTapped = *((_BYTE *)a3 + 32);
    *(_BYTE *)&self->_has |= 2u;
  }
  if (*((_QWORD *)a3 + 3))
    -[AWDSpringBoardBreadcrumb setType:](self, "setType:");
  if (*((_QWORD *)a3 + 2))
    -[AWDSpringBoardBreadcrumb setEntityID:](self, "setEntityID:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)wasTapped
{
  return self->_wasTapped;
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (NSString)entityID
{
  return self->_entityID;
}

- (void)setEntityID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
