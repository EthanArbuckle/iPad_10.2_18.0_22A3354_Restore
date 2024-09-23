@implementation TTSSchemaTTSAudioInterface

- (id)suppressMessageUnderConditions
{
  SISensitiveConditionsSet *v2;

  v2 = objc_alloc_init(SISensitiveConditionsSet);
  -[SISensitiveConditionsSet addCondition:](v2, "addCondition:", 1);
  return v2;
}

- (BOOL)hasVendorId
{
  return self->_vendorId != 0;
}

- (void)deleteVendorId
{
  -[TTSSchemaTTSAudioInterface setVendorId:](self, "setVendorId:", 0);
}

- (BOOL)hasProductId
{
  return self->_productId != 0;
}

- (void)deleteProductId
{
  -[TTSSchemaTTSAudioInterface setProductId:](self, "setProductId:", 0);
}

- (BOOL)readFrom:(id)a3
{
  return TTSSchemaTTSAudioInterfaceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TTSSchemaTTSAudioInterface vendorId](self, "vendorId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    PBDataWriterWriteStringField();
  -[TTSSchemaTTSAudioInterface productId](self, "productId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    PBDataWriterWriteStringField();

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_12;
  -[TTSSchemaTTSAudioInterface vendorId](self, "vendorId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "vendorId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_11;
  -[TTSSchemaTTSAudioInterface vendorId](self, "vendorId");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[TTSSchemaTTSAudioInterface vendorId](self, "vendorId");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "vendorId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_12;
  }
  else
  {

  }
  -[TTSSchemaTTSAudioInterface productId](self, "productId");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "productId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[TTSSchemaTTSAudioInterface productId](self, "productId");
    v12 = objc_claimAutoreleasedReturnValue();
    if (!v12)
    {

LABEL_15:
      v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    -[TTSSchemaTTSAudioInterface productId](self, "productId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "productId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if ((v16 & 1) != 0)
      goto LABEL_15;
  }
  else
  {
LABEL_11:

  }
LABEL_12:
  v17 = 0;
LABEL_13:

  return v17;
}

- (unint64_t)hash
{
  NSUInteger v3;

  v3 = -[NSString hash](self->_vendorId, "hash");
  return -[NSString hash](self->_productId, "hash") ^ v3;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_productId)
  {
    -[TTSSchemaTTSAudioInterface productId](self, "productId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("productId"));

  }
  if (self->_vendorId)
  {
    -[TTSSchemaTTSAudioInterface vendorId](self, "vendorId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("vendorId"));

  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3);
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[TTSSchemaTTSAudioInterface dictionaryRepresentation](self, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v2))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v2, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (TTSSchemaTTSAudioInterface)initWithJSON:(id)a3
{
  void *v4;
  TTSSchemaTTSAudioInterface *v5;
  uint64_t v7;

  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", a3, 0, &v7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = -[TTSSchemaTTSAudioInterface initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (TTSSchemaTTSAudioInterface)initWithDictionary:(id)a3
{
  id v4;
  TTSSchemaTTSAudioInterface *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TTSSchemaTTSAudioInterface *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TTSSchemaTTSAudioInterface;
  v5 = -[TTSSchemaTTSAudioInterface init](&v12, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("vendorId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[TTSSchemaTTSAudioInterface setVendorId:](v5, "setVendorId:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productId"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      -[TTSSchemaTTSAudioInterface setProductId:](v5, "setProductId:", v9);

    }
    v10 = v5;

  }
  return v5;
}

- (NSString)vendorId
{
  return self->_vendorId;
}

- (void)setVendorId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)productId
{
  return self->_productId;
}

- (void)setProductId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void)setHasVendorId:(BOOL)a3
{
  self->_hasVendorId = a3;
}

- (void)setHasProductId:(BOOL)a3
{
  self->_hasProductId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productId, 0);
  objc_storeStrong((id *)&self->_vendorId, 0);
}

@end
