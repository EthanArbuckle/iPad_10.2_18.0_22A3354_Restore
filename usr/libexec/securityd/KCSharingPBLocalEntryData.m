@implementation KCSharingPBLocalEntryData

- (BOOL)hasCloudKitRecord
{
  return self->_cloudKitRecord != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)KCSharingPBLocalEntryData;
  v3 = -[KCSharingPBLocalEntryData description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KCSharingPBLocalEntryData dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSData *cloudKitRecord;
  PBUnknownFields *unknownFields;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  cloudKitRecord = self->_cloudKitRecord;
  if (cloudKitRecord)
    objc_msgSend(v3, "setObject:forKey:", cloudKitRecord, CFSTR("cloudKitRecord"));
  unknownFields = self->_unknownFields;
  if (unknownFields)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PBUnknownFields dictionaryRepresentation](unknownFields, "dictionaryRepresentation"));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("Unknown Fields"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  char v9;
  int v11;
  uint64_t v12;
  unint64_t v14;
  uint64_t Data;
  NSData *v16;
  NSData *cloudKitRecord;
  PBUnknownFields *unknownFields;
  PBUnknownFields *v19;
  PBUnknownFields *v20;
  int v21;

  while (*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(_QWORD *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      break;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    while (1)
    {
      v8 = *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
        break;
      v9 = *(_BYTE *)(*(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(_QWORD *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0)
        goto LABEL_11;
      v5 += 7;
      if (v6++ >= 9)
      {
        v7 = 0;
        v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error))
      v7 = 0;
LABEL_13:
    v12 = v7 & 7;
    if (v11 || (_DWORD)v12 == 4)
      break;
    v14 = v7 >> 3;
    if ((v7 >> 3) == 1)
    {
      Data = PBReaderReadData(a3);
      v16 = (NSData *)objc_claimAutoreleasedReturnValue(Data);
      cloudKitRecord = self->_cloudKitRecord;
      self->_cloudKitRecord = v16;

    }
    else
    {
      unknownFields = self->_unknownFields;
      if (!unknownFields)
      {
        v19 = (PBUnknownFields *)objc_alloc_init((Class)PBUnknownFields);
        v20 = self->_unknownFields;
        self->_unknownFields = v19;

        unknownFields = self->_unknownFields;
      }
      v21 = PBUnknownFieldAdd(unknownFields, v14, v12, a3);
      if (!v21)
        return v21;
    }
  }
  LOBYTE(v21) = *((_BYTE *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v21;
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;
  NSData *cloudKitRecord;
  id v7;

  v4 = a3;
  v5 = v4;
  cloudKitRecord = self->_cloudKitRecord;
  v7 = v4;
  if (cloudKitRecord)
  {
    PBDataWriterWriteDataField(v4, cloudKitRecord, 1);
    v5 = v7;
  }
  -[PBUnknownFields writeTo:](self->_unknownFields, "writeTo:", v5);

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  id v6;
  void *v7;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSData copyWithZone:](self->_cloudKitRecord, "copyWithZone:", a3);
  v7 = (void *)*((_QWORD *)v5 + 2);
  *((_QWORD *)v5 + 2) = v6;

  objc_storeStrong((id *)v5 + 1, self->_unknownFields);
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSData *cloudKitRecord;
  unsigned __int8 v6;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
  {
    cloudKitRecord = self->_cloudKitRecord;
    if ((unint64_t)cloudKitRecord | v4[2])
      v6 = -[NSData isEqual:](cloudKitRecord, "isEqual:");
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
  return (unint64_t)-[NSData hash](self->_cloudKitRecord, "hash");
}

- (void)mergeFrom:(id)a3
{
  if (*((_QWORD *)a3 + 2))
    -[KCSharingPBLocalEntryData setCloudKitRecord:](self, "setCloudKitRecord:");
}

- (PBUnknownFields)unknownFields
{
  return self->_unknownFields;
}

- (NSData)cloudKitRecord
{
  return self->_cloudKitRecord;
}

- (void)setCloudKitRecord:(id)a3
{
  objc_storeStrong((id *)&self->_cloudKitRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudKitRecord, 0);
  objc_storeStrong((id *)&self->_unknownFields, 0);
}

@end
