@implementation AWDWiFiNWActivityHistogramBin

- (void)dealloc
{
  objc_super v3;

  -[AWDWiFiNWActivityHistogramBin setBin:](self, "setBin:", 0);
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityHistogramBin;
  -[AWDWiFiNWActivityHistogramBin dealloc](&v3, sel_dealloc);
}

- (BOOL)hasBin
{
  return self->_bin != 0;
}

- (void)setHits:(unint64_t)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_hits = a3;
}

- (void)setHasHits:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasHits
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityHistogramBin;
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@ %@"), -[AWDWiFiNWActivityHistogramBin description](&v3, sel_description), -[AWDWiFiNWActivityHistogramBin dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *bin;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = v3;
  bin = self->_bin;
  if (bin)
    objc_msgSend(v3, "setObject:forKey:", bin, CFSTR("bin"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", self->_hits), CFSTR("hits"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityHistogramBinReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_bin)
    PBDataWriterWriteStringField();
  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  if (self->_bin)
    objc_msgSend(a3, "setBin:");
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_QWORD *)a3 + 1) = self->_hits;
    *((_BYTE *)a3 + 24) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(_QWORD *)(v5 + 16) = -[NSString copyWithZone:](self->_bin, "copyWithZone:", a3);
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *(_QWORD *)(v5 + 8) = self->_hits;
    *(_BYTE *)(v5 + 24) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5;
  NSString *bin;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class());
  if (v5)
  {
    bin = self->_bin;
    if (!((unint64_t)bin | *((_QWORD *)a3 + 2)) || (v5 = -[NSString isEqual:](bin, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) == 0;
      if ((*(_BYTE *)&self->_has & 1) != 0)
        LOBYTE(v5) = (*((_BYTE *)a3 + 24) & 1) != 0 && self->_hits == *((_QWORD *)a3 + 1);
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;

  v3 = -[NSString hash](self->_bin, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v4 = 2654435761u * self->_hits;
  else
    v4 = 0;
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[AWDWiFiNWActivityHistogramBin setBin:](self, "setBin:");
  if ((*((_BYTE *)a3 + 24) & 1) != 0)
  {
    self->_hits = *((_QWORD *)a3 + 1);
    *(_BYTE *)&self->_has |= 1u;
  }
}

- (NSString)bin
{
  return self->_bin;
}

- (void)setBin:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)hits
{
  return self->_hits;
}

@end
