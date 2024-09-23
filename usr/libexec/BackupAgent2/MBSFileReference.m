@implementation MBSFileReference

- (void)dealloc
{
  objc_super v3;

  -[MBSFileReference setFileID:](self, "setFileID:", 0);
  v3.receiver = self;
  v3.super_class = (Class)MBSFileReference;
  -[MBSFileReference dealloc](&v3, "dealloc");
}

- (void)setSnapshotID:(unsigned int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_snapshotID = a3;
}

- (void)setHasSnapshotID:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSnapshotID
{
  return *(_BYTE *)&self->_has & 1;
}

- (BOOL)hasFileID
{
  return self->_fileID != 0;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MBSFileReference;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), -[MBSFileReference description](&v3, "description"), -[MBSFileReference dictionaryRepresentation](self, "dictionaryRepresentation"));
}

- (id)dictionaryRepresentation
{
  id v3;
  NSData *fileID;

  v3 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_snapshotID), CFSTR("snapshotID"));
  fileID = self->_fileID;
  if (fileID)
    objc_msgSend(v3, "setObject:forKey:", fileID, CFSTR("fileID"));
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100005130((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  NSData *fileID;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    PBDataWriterWriteUint32Field(a3, self->_snapshotID, 1);
  fileID = self->_fileID;
  if (fileID)
    PBDataWriterWriteDataField(a3, fileID, 2);
}

- (void)copyTo:(id)a3
{
  NSData *fileID;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_snapshotID;
    *((_BYTE *)a3 + 20) |= 1u;
  }
  fileID = self->_fileID;
  if (fileID)
    objc_msgSend(a3, "setFileID:", fileID);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5;
  _QWORD *v6;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = v5;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_DWORD *)v5 + 4) = self->_snapshotID;
    *((_BYTE *)v5 + 20) |= 1u;
  }

  v6[1] = -[NSData copyWithZone:](self->_fileID, "copyWithZone:", a3);
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5;
  NSData *fileID;

  v5 = objc_msgSend(a3, "isMemberOfClass:", objc_opt_class(self));
  if (v5)
  {
    if ((*(_BYTE *)&self->_has & 1) != 0)
    {
      if ((*((_BYTE *)a3 + 20) & 1) == 0 || self->_snapshotID != *((_DWORD *)a3 + 4))
        goto LABEL_9;
    }
    else if ((*((_BYTE *)a3 + 20) & 1) != 0)
    {
LABEL_9:
      LOBYTE(v5) = 0;
      return v5;
    }
    fileID = self->_fileID;
    if ((unint64_t)fileID | *((_QWORD *)a3 + 1))
      LOBYTE(v5) = -[NSData isEqual:](fileID, "isEqual:");
    else
      LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2;

  if ((*(_BYTE *)&self->_has & 1) != 0)
    v2 = 2654435761 * self->_snapshotID;
  else
    v2 = 0;
  return (unint64_t)-[NSData hash](self->_fileID, "hash") ^ v2;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_BYTE *)a3 + 20) & 1) != 0)
  {
    self->_snapshotID = *((_DWORD *)a3 + 4);
    *(_BYTE *)&self->_has |= 1u;
  }
  if (*((_QWORD *)a3 + 1))
    -[MBSFileReference setFileID:](self, "setFileID:");
}

- (unsigned)snapshotID
{
  return self->_snapshotID;
}

- (NSData)fileID
{
  return self->_fileID;
}

- (void)setFileID:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

@end
