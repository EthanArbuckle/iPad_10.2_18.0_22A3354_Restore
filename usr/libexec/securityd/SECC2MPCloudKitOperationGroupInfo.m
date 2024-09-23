@implementation SECC2MPCloudKitOperationGroupInfo

- (BOOL)hasOperationGroupId
{
  return self->_operationGroupId != 0;
}

- (BOOL)hasOperationGroupName
{
  return self->_operationGroupName != 0;
}

- (void)setOperationGroupTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_operationGroupTriggered = a3;
}

- (void)setHasOperationGroupTriggered:(BOOL)a3
{
  *(_BYTE *)&self->_has = *(_BYTE *)&self->_has & 0xFE | a3;
}

- (BOOL)hasOperationGroupTriggered
{
  return *(_BYTE *)&self->_has & 1;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SECC2MPCloudKitOperationGroupInfo;
  v3 = -[SECC2MPCloudKitOperationGroupInfo description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SECC2MPCloudKitOperationGroupInfo dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *operationGroupId;
  NSString *operationGroupName;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  operationGroupId = self->_operationGroupId;
  if (operationGroupId)
    objc_msgSend(v3, "setObject:forKey:", operationGroupId, CFSTR("operation_group_id"));
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
    objc_msgSend(v4, "setObject:forKey:", operationGroupName, CFSTR("operation_group_name"));
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_operationGroupTriggered));
    objc_msgSend(v4, "setObject:forKey:", v7, CFSTR("operation_group_triggered"));

  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001B720C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *operationGroupId;
  NSString *operationGroupName;
  id v7;

  v4 = a3;
  operationGroupId = self->_operationGroupId;
  v7 = v4;
  if (operationGroupId)
  {
    PBDataWriterWriteStringField(v4, operationGroupId, 1);
    v4 = v7;
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName)
  {
    PBDataWriterWriteStringField(v7, operationGroupName, 2);
    v4 = v7;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    PBDataWriterWriteBOOLField(v7, self->_operationGroupTriggered, 101);
    v4 = v7;
  }

}

- (void)copyTo:(id)a3
{
  _BYTE *v4;
  _BYTE *v5;

  v4 = a3;
  v5 = v4;
  if (self->_operationGroupId)
  {
    objc_msgSend(v4, "setOperationGroupId:");
    v4 = v5;
  }
  if (self->_operationGroupName)
  {
    objc_msgSend(v5, "setOperationGroupName:");
    v4 = v5;
  }
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    v4[24] = self->_operationGroupTriggered;
    v4[28] |= 1u;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_operationGroupId, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_operationGroupName, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    *((_BYTE *)v5 + 24) = self->_operationGroupTriggered;
    *((_BYTE *)v5 + 28) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *operationGroupId;
  NSString *operationGroupName;
  BOOL v7;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self)))
    goto LABEL_8;
  operationGroupId = self->_operationGroupId;
  if ((unint64_t)operationGroupId | *((_QWORD *)v4 + 1))
  {
    if (!-[NSString isEqual:](operationGroupId, "isEqual:"))
      goto LABEL_8;
  }
  operationGroupName = self->_operationGroupName;
  if ((unint64_t)operationGroupName | *((_QWORD *)v4 + 2))
  {
    if (!-[NSString isEqual:](operationGroupName, "isEqual:"))
      goto LABEL_8;
  }
  v7 = (*((_BYTE *)v4 + 28) & 1) == 0;
  if ((*(_BYTE *)&self->_has & 1) != 0)
  {
    if ((*((_BYTE *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      v7 = 0;
      goto LABEL_9;
    }
    if (self->_operationGroupTriggered)
    {
      if (!*((_BYTE *)v4 + 24))
        goto LABEL_8;
    }
    else if (*((_BYTE *)v4 + 24))
    {
      goto LABEL_8;
    }
    v7 = 1;
  }
LABEL_9:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3;
  NSUInteger v4;
  uint64_t v5;

  v3 = -[NSString hash](self->_operationGroupId, "hash");
  v4 = -[NSString hash](self->_operationGroupName, "hash");
  if ((*(_BYTE *)&self->_has & 1) != 0)
    v5 = 2654435761 * self->_operationGroupTriggered;
  else
    v5 = 0;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  BOOL *v4;
  BOOL *v5;

  v4 = (BOOL *)a3;
  v5 = v4;
  if (*((_QWORD *)v4 + 1))
  {
    -[SECC2MPCloudKitOperationGroupInfo setOperationGroupId:](self, "setOperationGroupId:");
    v4 = v5;
  }
  if (*((_QWORD *)v4 + 2))
  {
    -[SECC2MPCloudKitOperationGroupInfo setOperationGroupName:](self, "setOperationGroupName:");
    v4 = v5;
  }
  if (v4[28])
  {
    self->_operationGroupTriggered = v4[24];
    *(_BYTE *)&self->_has |= 1u;
  }

}

- (NSString)operationGroupId
{
  return self->_operationGroupId;
}

- (void)setOperationGroupId:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupId, a3);
}

- (NSString)operationGroupName
{
  return self->_operationGroupName;
}

- (void)setOperationGroupName:(id)a3
{
  objc_storeStrong((id *)&self->_operationGroupName, a3);
}

- (BOOL)operationGroupTriggered
{
  return self->_operationGroupTriggered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_operationGroupId, 0);
}

@end
