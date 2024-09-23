@implementation APPBMescalSignSAPSetupRequest

+ (id)options
{
  if (qword_1002697C0 != -1)
    dispatch_once(&qword_1002697C0, &stru_1002149F8);
  return (id)qword_1002697B8;
}

- (BOOL)hasBuffer
{
  return self->_buffer != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBMescalSignSAPSetupRequest;
  v3 = -[APPBMescalSignSAPSetupRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBMescalSignSAPSetupRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *buffer;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  buffer = self->_buffer;
  if (buffer)
    objc_msgSend(v3, "setObject:forKey:", buffer, CFSTR("buffer"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBMescalSignSAPSetupRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *buffer;

  buffer = self->_buffer;
  if (buffer)
    PBDataWriterWriteDataField(a3, buffer, 1);
}

- (void)copyTo:(id)a3
{
  NSData *buffer;

  buffer = self->_buffer;
  if (buffer)
    objc_msgSend(a3, "setBuffer:", buffer);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_buffer, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *buffer;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    buffer = self->_buffer;
    if ((unint64_t)buffer | v4[1])
      v6 = -[NSData isEqual:](buffer, "isEqual:");
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
  return (unint64_t)-[NSData hash](self->_buffer, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[APPBMescalSignSAPSetupRequest setBuffer:](self, "setBuffer:");
}

- (NSData)buffer
{
  return self->_buffer;
}

- (void)setBuffer:(id)a3
{
  objc_storeStrong((id *)&self->_buffer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end
