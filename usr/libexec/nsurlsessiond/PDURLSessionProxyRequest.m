@implementation PDURLSessionProxyRequest

- (id)_initWithActualRequest:(id)a3
{
  id v4;
  PDURLSessionProxyRequest *v5;
  void *v6;

  v4 = a3;
  v5 = -[PDURLSessionProxyRequest init](self, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:](NSKeyedArchiver, "_nsurlsessionproxy_secureArchivedDataWithRootObject:", v4));
    -[PDURLSessionProxyRequest setArchiveList:](v5, "setArchiveList:", v6);

  }
  return v5;
}

- (id)_actualRequest
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = objc_opt_class(NSURLRequest);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyRequest archiveList](self, "archiveList"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:](NSKeyedUnarchiver, "_nsurlsessionproxy_secureUnarchiveObjectOfClass:withData:", v3, v4));

  return v5;
}

- (void)setVersion:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasArchiveList
{
  return self->_archiveList != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PDURLSessionProxyRequest;
  v3 = -[PDURLSessionProxyRequest description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PDURLSessionProxyRequest dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *archiveList;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_version));
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("version"));

  }
  archiveList = self->_archiveList;
  if (archiveList)
    objc_msgSend(v3, "setObject:forKey:", archiveList, CFSTR("archiveList"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10004E570((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSData *archiveList;
  id v6;

  v4 = a3;
  v6 = v4;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteUint32Field(v4, self->_version, 1);
    v4 = v6;
  }
  archiveList = self->_archiveList;
  if (archiveList)
  {
    PBDataWriterWriteDataField(v6, archiveList, 2);
    v4 = v6;
  }

}

- (void)copyTo:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[4] = self->_version;
    *((_BYTE *)v4 + 20) |= 1u;
  }
  if (self->_archiveList)
  {
    v5 = v4;
    objc_msgSend(v4, "setArchiveList:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  _QWORD *v6;
  id v7;
  void *v8;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_version;
    *((_BYTE *)v5 + 20) |= 1u;
  }
  v7 = -[NSData copyWithZone:](self->_archiveList, "copyWithZone:", a3);
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSData *archiveList;
  unsigned __int8 v6;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_9;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 20) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4))
      goto LABEL_9;
  }
  else if ((*((_BYTE *)v4 + 20) & 1) != 0)
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  archiveList = self->_archiveList;
  if ((unint64_t)archiveList | *((_QWORD *)v4 + 1))
    v6 = -[NSData isEqual:](archiveList, "isEqual:");
  else
    v6 = 1;
LABEL_10:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_version;
  else
    v2 = 0;
  return (unint64_t)-[NSData hash](self->_archiveList, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  _DWORD *v4;
  _DWORD *v5;

  v4 = a3;
  if ((v4[5] & 1) != 0)
  {
    self->_version = v4[4];
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)v4 + 1))
  {
    v5 = v4;
    -[PDURLSessionProxyRequest setArchiveList:](self, "setArchiveList:");
    v4 = v5;
  }

}

- (unsigned)version
{
  return self->_version;
}

- (NSData)archiveList
{
  return self->_archiveList;
}

- (void)setArchiveList:(id)a3
{
  objc_storeStrong((id *)&self->_archiveList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_archiveList, 0);
}

@end
