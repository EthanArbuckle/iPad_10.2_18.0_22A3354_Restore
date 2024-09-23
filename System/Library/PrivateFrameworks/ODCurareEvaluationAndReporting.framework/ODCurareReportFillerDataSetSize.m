@implementation ODCurareReportFillerDataSetSize

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)ODCurareReportFillerDataSetSize;
  -[ODCurareReportFillerDataSetSize description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ODCurareReportFillerDataSetSize dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfUserSessions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("numberOfUserSessions"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_numberOfUserSamples);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("numberOfUserSamples"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ODCurareReportFillerDataSetSizeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3;

  v3 = a3;
  PBDataWriterWriteUint32Field();
  PBDataWriterWriteUint32Field();

}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 3) = self->_numberOfUserSessions;
  *((_DWORD *)a3 + 2) = self->_numberOfUserSamples;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 3) = self->_numberOfUserSessions;
  *((_DWORD *)result + 2) = self->_numberOfUserSamples;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  v5 = objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && self->_numberOfUserSessions == v4[3]
    && self->_numberOfUserSamples == v4[2];

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_numberOfUserSamples) ^ (2654435761 * self->_numberOfUserSessions);
}

- (void)mergeFrom:(id)a3
{
  self->_numberOfUserSessions = *((_DWORD *)a3 + 3);
  self->_numberOfUserSamples = *((_DWORD *)a3 + 2);
}

- (unsigned)numberOfUserSessions
{
  return self->_numberOfUserSessions;
}

- (void)setNumberOfUserSessions:(unsigned int)a3
{
  self->_numberOfUserSessions = a3;
}

- (unsigned)numberOfUserSamples
{
  return self->_numberOfUserSamples;
}

- (void)setNumberOfUserSamples:(unsigned int)a3
{
  self->_numberOfUserSamples = a3;
}

@end
