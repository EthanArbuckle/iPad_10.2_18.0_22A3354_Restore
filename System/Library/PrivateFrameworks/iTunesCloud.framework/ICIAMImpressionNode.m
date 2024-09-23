@implementation ICIAMImpressionNode

- (BOOL)hasImpressionType
{
  return self->_impressionType != 0;
}

- (BOOL)hasRecoAlgoId
{
  return self->_recoAlgoId != 0;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)ICIAMImpressionNode;
  -[ICIAMImpressionNode description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICIAMImpressionNode dictionaryRepresentation](self, "dictionaryRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *impressionType;
  NSString *recoAlgoId;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  impressionType = self->_impressionType;
  if (impressionType)
    objc_msgSend(v3, "setObject:forKey:", impressionType, CFSTR("impressionType"));
  recoAlgoId = self->_recoAlgoId;
  if (recoAlgoId)
    objc_msgSend(v4, "setObject:forKey:", recoAlgoId, CFSTR("recoAlgoId"));
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ICIAMImpressionNodeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_impressionType)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_recoAlgoId)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_impressionType)
  {
    objc_msgSend(v4, "setImpressionType:");
    v4 = v5;
  }
  if (self->_recoAlgoId)
  {
    objc_msgSend(v5, "setRecoAlgoId:");
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
  v6 = -[NSString copyWithZone:](self->_impressionType, "copyWithZone:", a3);
  v7 = (void *)v5[1];
  v5[1] = v6;

  v8 = -[NSString copyWithZone:](self->_recoAlgoId, "copyWithZone:", a3);
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *impressionType;
  NSString *recoAlgoId;
  char v7;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class())
    && ((impressionType = self->_impressionType, !((unint64_t)impressionType | v4[1]))
     || -[NSString isEqual:](impressionType, "isEqual:")))
  {
    recoAlgoId = self->_recoAlgoId;
    if ((unint64_t)recoAlgoId | v4[2])
      v7 = -[NSString isEqual:](recoAlgoId, "isEqual:");
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

  v3 = -[NSString hash](self->_impressionType, "hash");
  return -[NSString hash](self->_recoAlgoId, "hash") ^ v3;
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;

  v4 = a3;
  v5 = v4;
  if (v4[1])
  {
    -[ICIAMImpressionNode setImpressionType:](self, "setImpressionType:");
    v4 = v5;
  }
  if (v4[2])
  {
    -[ICIAMImpressionNode setRecoAlgoId:](self, "setRecoAlgoId:");
    v4 = v5;
  }

}

- (NSString)impressionType
{
  return self->_impressionType;
}

- (void)setImpressionType:(id)a3
{
  objc_storeStrong((id *)&self->_impressionType, a3);
}

- (NSString)recoAlgoId
{
  return self->_recoAlgoId;
}

- (void)setRecoAlgoId:(id)a3
{
  objc_storeStrong((id *)&self->_recoAlgoId, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recoAlgoId, 0);
  objc_storeStrong((id *)&self->_impressionType, 0);
}

@end
