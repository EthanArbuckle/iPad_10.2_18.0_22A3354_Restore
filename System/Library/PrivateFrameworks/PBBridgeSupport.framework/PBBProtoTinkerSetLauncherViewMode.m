@implementation PBBProtoTinkerSetLauncherViewMode

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v8.receiver = self;
  v8.super_class = (Class)PBBProtoTinkerSetLauncherViewMode;
  -[PBBProtoTinkerSetLauncherViewMode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PBBProtoTinkerSetLauncherViewMode dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_launcherViewMode);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("launcherViewMode"));

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PBBProtoTinkerSetLauncherViewModeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  *((_DWORD *)a3 + 2) = self->_launcherViewMode;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 2) = self->_launcherViewMode;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  _DWORD *v4;
  BOOL v5;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    v5 = self->_launcherViewMode == v4[2];
  else
    v5 = 0;

  return v5;
}

- (unint64_t)hash
{
  return 2654435761 * self->_launcherViewMode;
}

- (void)mergeFrom:(id)a3
{
  self->_launcherViewMode = *((_DWORD *)a3 + 2);
}

- (unsigned)launcherViewMode
{
  return self->_launcherViewMode;
}

- (void)setLauncherViewMode:(unsigned int)a3
{
  self->_launcherViewMode = a3;
}

@end
