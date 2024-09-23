@implementation AWDBltUIBuildSuccess

- (void)dealloc
{
  objc_super v3;

  -[AWDBltUIBuildSuccess setSectionid:](self, "setSectionid:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDBltUIBuildSuccess;
  -[AWDBltUIBuildSuccess dealloc](&v3, sel_dealloc);
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

- (BOOL)hasSectionid
{
  return self->_sectionid != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDBltUIBuildSuccess;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDBltUIBuildSuccess description](&v3, sel_description), -[AWDBltUIBuildSuccess dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  NSString *sectionid;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_timestamp), CFSTR("timestamp"));
  sectionid = self->_sectionid;
  if (sectionid)
    objc_msgSend(v3, "setObject:forKey:", sectionid, CFSTR("sectionid"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDBltUIBuildSuccessReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
  if (self->_sectionid)
    PBDataWriterWriteStringField();
}

- (void)copyTo:(id)a3
{
  NSString *sectionid;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_timestamp;
    *((_BYTE *)a3 + 24) |= 1u;
  }
  sectionid = self->_sectionid;
  if (sectionid)
    objc_msgSend(a3, "setSectionid:", sectionid);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  _QWORD *v6;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (_QWORD *)v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_timestamp;
    *(_BYTE *)(v5 + 24) |= 1u;
  }

  v6[2] = -[NSString copyWithZone:](self->_sectionid, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *sectionid;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 24) & 1) == 0 || self->_timestamp != *((_QWORD *)a3 + 1))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 24) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    sectionid = self->_sectionid;
    if ((unint64_t)sectionid | *((_QWORD *)a3 + 2))
      LOBYTE(v5) = -[NSString isEqual:](sectionid, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  unint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761u * self->_timestamp;
  else
    v2 = 0;
  return -[NSString hash](self->_sectionid, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_timestamp = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 2))
    -[AWDBltUIBuildSuccess setSectionid:](self, "setSectionid:");
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)sectionid
{
  return self->_sectionid;
}

- (void)setSectionid:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

@end
