@implementation PBUnknownFields

- (void)dealloc
{
  objc_super v3;

  free(self->_buf);
  v3.receiver = self;
  v3.super_class = (Class)PBUnknownFields;
  -[PBUnknownFields dealloc](&v3, sel_dealloc);
}

- (void)writeTo:(id)a3
{
  if (self->_bufLen)
    objc_msgSend(a3, "write:maxLength:", self->_buf);
}

- (id)dictionaryRepresentation
{
  void *v2;
  PBDataReader *v3;
  void *v4;

  if (self->_bufLen)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", self->_buf, self->_bufLen, 0);
    v3 = -[PBDataReader initWithData:]([PBDataReader alloc], "initWithData:", v2);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _dictionaryRepresentation(v3, 0, 6, v4);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PBUnknownFields dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
