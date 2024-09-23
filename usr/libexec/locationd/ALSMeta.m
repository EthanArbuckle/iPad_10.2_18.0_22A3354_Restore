@implementation ALSMeta

- (void)dealloc
{
  objc_super v3;

  -[ALSMeta setSoftwareBuild:](self, "setSoftwareBuild:", 0);
  -[ALSMeta setProductId:](self, "setProductId:", 0);
  v3.receiver = self;
  v3.super_class = (Class)ALSMeta;
  -[ALSMeta dealloc](&v3, "dealloc");
}

- (BOOL)hasSoftwareBuild
{
  return self->_softwareBuild != 0;
}

- (BOOL)hasProductId
{
  return self->_productId != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ALSMeta;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[ALSMeta description](&v3, "description"), -[ALSMeta dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  NSString *softwareBuild;
  NSString *productId;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v4 = v3;
  softwareBuild = self->_softwareBuild;
  if (softwareBuild)
    objc_msgSend(v3, "setObject:forKey:", softwareBuild, CFSTR("softwareBuild"));
  productId = self->_productId;
  if (productId)
    objc_msgSend(v4, "setObject:forKey:", productId, CFSTR("productId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10117DA78((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSString *softwareBuild;
  NSString *productId;

  softwareBuild = self->_softwareBuild;
  if (softwareBuild)
    PBDataWriterWriteStringField(a3, softwareBuild, 1);
  productId = self->_productId;
  if (productId)
    PBDataWriterWriteStringField(a3, productId, 2);
}

- (void)copyTo:(id)a3
{
  if (self->_softwareBuild)
    objc_msgSend(a3, "setSoftwareBuild:");
  if (self->_productId)
    objc_msgSend(a3, "setProductId:");
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v5;

  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(self, a2), "allocWithZone:", a3), "init");

  v5[2] = -[NSString copyWithZone:](self->_softwareBuild, "copyWithZone:", a3);
  v5[1] = -[NSString copyWithZone:](self->_productId, "copyWithZone:", a3);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSString *softwareBuild;
  NSString *productId;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self, a2));
  if (v5)
  {
    softwareBuild = self->_softwareBuild;
    if (!((unint64_t)softwareBuild | *((_QWORD *)a3 + 2))
      || (v5 = -[NSString isEqual:](softwareBuild, "isEqual:")) != 0)
    {
      productId = self->_productId;
      if ((unint64_t)productId | *((_QWORD *)a3 + 1))
        LOBYTE(v5) = -[NSString isEqual:](productId, "isEqual:");
      else
        LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_softwareBuild, "hash");
  return -[NSString hash](self->_productId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[ALSMeta setSoftwareBuild:](self, "setSoftwareBuild:");
  if (*((_QWORD *)a3 + 1))
    -[ALSMeta setProductId:](self, "setProductId:");
}

- (NSString)softwareBuild
{
  return self->_softwareBuild;
}

- (void)setSoftwareBuild:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
