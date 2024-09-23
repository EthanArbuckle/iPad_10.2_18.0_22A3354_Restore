@implementation APPBTransparencyDetails

- (BOOL)readFrom:(id)a3
{
  return APPBTransparencyDetailsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (NSString)transparencyRendererURL
{
  return self->_transparencyRendererURL;
}

- (NSString)transparencyRendererPayload
{
  return self->_transparencyRendererPayload;
}

- (BOOL)hasTransparencyRendererURL
{
  return self->_transparencyRendererURL != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, 0);
  objc_storeStrong((id *)&self->_transparencyRendererPayload, 0);
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, 0);
  objc_storeStrong((id *)&self->_targetingExpressionId, 0);
}

- (BOOL)hasTransparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage != 0;
}

- (BOOL)hasTransparencyRendererPayload
{
  return self->_transparencyRendererPayload != 0;
}

- (BOOL)hasTargetingExpressionId
{
  return self->_targetingExpressionId != 0;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPBTransparencyDetails;
  v3 = -[APPBTransparencyDetails description](&v8, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPBTransparencyDetails dictionaryRepresentation](self, "dictionaryRepresentation"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ %@"), v4, v5));

  return v6;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *transparencyRendererPayload;
  NSString *transparencyRendererURL;
  NSString *targetingExpressionId;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
  if (transparencyDetailsUnavailableMessage)
    objc_msgSend(v3, "setObject:forKey:", transparencyDetailsUnavailableMessage, CFSTR("transparencyDetailsUnavailableMessage"));
  transparencyRendererPayload = self->_transparencyRendererPayload;
  if (transparencyRendererPayload)
    objc_msgSend(v4, "setObject:forKey:", transparencyRendererPayload, CFSTR("transparencyRendererPayload"));
  transparencyRendererURL = self->_transparencyRendererURL;
  if (transparencyRendererURL)
    objc_msgSend(v4, "setObject:forKey:", transparencyRendererURL, CFSTR("transparencyRendererURL"));
  targetingExpressionId = self->_targetingExpressionId;
  if (targetingExpressionId)
    objc_msgSend(v4, "setObject:forKey:", targetingExpressionId, CFSTR("targetingExpressionId"));
  return v4;
}

- (void)writeTo:(id)a3
{
  id v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *transparencyRendererPayload;
  NSString *transparencyRendererURL;
  NSString *targetingExpressionId;
  id v9;

  v4 = a3;
  transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage;
  v9 = v4;
  if (transparencyDetailsUnavailableMessage)
  {
    PBDataWriterWriteStringField(v4, transparencyDetailsUnavailableMessage, 1);
    v4 = v9;
  }
  transparencyRendererPayload = self->_transparencyRendererPayload;
  if (transparencyRendererPayload)
  {
    PBDataWriterWriteStringField(v9, transparencyRendererPayload, 2);
    v4 = v9;
  }
  transparencyRendererURL = self->_transparencyRendererURL;
  if (transparencyRendererURL)
  {
    PBDataWriterWriteStringField(v9, transparencyRendererURL, 3);
    v4 = v9;
  }
  targetingExpressionId = self->_targetingExpressionId;
  if (targetingExpressionId)
  {
    PBDataWriterWriteStringField(v9, targetingExpressionId, 4);
    v4 = v9;
  }

}

- (void)copyTo:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = v4;
  if (self->_transparencyDetailsUnavailableMessage)
  {
    objc_msgSend(v4, "setTransparencyDetailsUnavailableMessage:");
    v4 = v5;
  }
  if (self->_transparencyRendererPayload)
  {
    objc_msgSend(v5, "setTransparencyRendererPayload:");
    v4 = v5;
  }
  if (self->_transparencyRendererURL)
  {
    objc_msgSend(v5, "setTransparencyRendererURL:");
    v4 = v5;
  }
  if (self->_targetingExpressionId)
  {
    objc_msgSend(v5, "setTargetingExpressionId:");
    v4 = v5;
  }

}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;

  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3), "init");
  v6 = -[NSString copyWithZone:](self->_transparencyDetailsUnavailableMessage, "copyWithZone:", a3);
  v7 = (void *)v5[2];
  v5[2] = v6;

  v8 = -[NSString copyWithZone:](self->_transparencyRendererPayload, "copyWithZone:", a3);
  v9 = (void *)v5[3];
  v5[3] = v8;

  v10 = -[NSString copyWithZone:](self->_transparencyRendererURL, "copyWithZone:", a3);
  v11 = (void *)v5[4];
  v5[4] = v10;

  v12 = -[NSString copyWithZone:](self->_targetingExpressionId, "copyWithZone:", a3);
  v13 = (void *)v5[1];
  v5[1] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  NSString *transparencyDetailsUnavailableMessage;
  NSString *transparencyRendererPayload;
  NSString *transparencyRendererURL;
  NSString *targetingExpressionId;
  unsigned __int8 v9;

  v4 = a3;
  if (objc_msgSend(v4, "isMemberOfClass:", objc_opt_class(self))
    && ((transparencyDetailsUnavailableMessage = self->_transparencyDetailsUnavailableMessage,
         !((unint64_t)transparencyDetailsUnavailableMessage | v4[2]))
     || -[NSString isEqual:](transparencyDetailsUnavailableMessage, "isEqual:"))
    && ((transparencyRendererPayload = self->_transparencyRendererPayload,
         !((unint64_t)transparencyRendererPayload | v4[3]))
     || -[NSString isEqual:](transparencyRendererPayload, "isEqual:"))
    && ((transparencyRendererURL = self->_transparencyRendererURL, !((unint64_t)transparencyRendererURL | v4[4]))
     || -[NSString isEqual:](transparencyRendererURL, "isEqual:")))
  {
    targetingExpressionId = self->_targetingExpressionId;
    if ((unint64_t)targetingExpressionId | v4[1])
      v9 = -[NSString isEqual:](targetingExpressionId, "isEqual:");
    else
      v9 = 1;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_transparencyDetailsUnavailableMessage, "hash");
  v4 = -[NSString hash](self->_transparencyRendererPayload, "hash") ^ v3;
  v5 = -[NSString hash](self->_transparencyRendererURL, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_targetingExpressionId, "hash");
}

- (void)mergeFrom:(id)a3
{
  _QWORD *v4;

  v4 = a3;
  if (v4[2])
    -[APPBTransparencyDetails setTransparencyDetailsUnavailableMessage:](self, "setTransparencyDetailsUnavailableMessage:");
  if (v4[3])
    -[APPBTransparencyDetails setTransparencyRendererPayload:](self, "setTransparencyRendererPayload:");
  if (v4[4])
    -[APPBTransparencyDetails setTransparencyRendererURL:](self, "setTransparencyRendererURL:");
  if (v4[1])
    -[APPBTransparencyDetails setTargetingExpressionId:](self, "setTargetingExpressionId:");

}

- (NSString)transparencyDetailsUnavailableMessage
{
  return self->_transparencyDetailsUnavailableMessage;
}

- (void)setTransparencyDetailsUnavailableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyDetailsUnavailableMessage, a3);
}

- (void)setTransparencyRendererPayload:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyRendererPayload, a3);
}

- (void)setTransparencyRendererURL:(id)a3
{
  objc_storeStrong((id *)&self->_transparencyRendererURL, a3);
}

- (NSString)targetingExpressionId
{
  return self->_targetingExpressionId;
}

- (void)setTargetingExpressionId:(id)a3
{
  objc_storeStrong((id *)&self->_targetingExpressionId, a3);
}

@end
