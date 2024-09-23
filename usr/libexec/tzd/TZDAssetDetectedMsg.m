@implementation TZDAssetDetectedMsg

+ (id)options
{
  if (qword_100026058[0] != -1)
    dispatch_once(qword_100026058, &stru_100020A38);
  return (id)qword_100026050;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TZDAssetDetectedMsg;
  v3 = -[TZDAssetDetectedMsg description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TZDAssetDetectedMsg dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *assetVersion;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  assetVersion = self->_assetVersion;
  if (assetVersion)
    objc_msgSend(v3, "setObject:forKey:", assetVersion, CFSTR("assetVersion"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000055AC((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (!self->_assetVersion)
    sub_10001A074();
  v5 = v4;
  PBDataWriterWriteStringField();

}

- (void)copyTo:(id)a3
{
  _objc_msgSend(a3, "setAssetVersion:", self->_assetVersion);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_assetVersion, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  NSString *assetVersion;
  unsigned __int8 v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self, v5)))
  {
    assetVersion = self->_assetVersion;
    if ((unint64_t)assetVersion | v4[1])
      v7 = -[NSString isEqual:](assetVersion, "isEqual:");
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
  return -[NSString hash](self->_assetVersion, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 1))
    -[TZDAssetDetectedMsg setAssetVersion:](self, "setAssetVersion:");
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_assetVersion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetVersion, 0);
}

@end
