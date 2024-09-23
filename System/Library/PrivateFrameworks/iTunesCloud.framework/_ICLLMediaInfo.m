@implementation _ICLLMediaInfo

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)_ICLLMediaInfo;
  -[_ICLLMediaInfo description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_ICLLMediaInfo dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *mediaType;
  NSString *playParams;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  mediaType = self->_mediaType;
  if (mediaType)
    objc_msgSend(v3, "setObject:forKey:", mediaType, CFSTR("mediaType"));
  playParams = self->_playParams;
  if (playParams)
    objc_msgSend(v4, "setObject:forKey:", playParams, CFSTR("playParams"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLMediaInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_mediaType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_playParams)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v5 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_mediaType, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_playParams, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *mediaType;
  NSString *playParams;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((mediaType = self->_mediaType, !((unint64_t)mediaType | v4[1]))
     || -[NSString isEqual:](mediaType, "isEqual:")))
  {
    playParams = self->_playParams;
    if ((unint64_t)playParams | v4[2])
      v7 = -[NSString isEqual:](playParams, "isEqual:");
    else
      v7 = 1;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_mediaType, "hash");
  return -[NSString hash](self->_playParams, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playParams, 0);
  objc_storeStrong((id *)&self->_mediaType, 0);
}

@end
