@implementation _SFPBPatternModel

- (_SFPBPatternModel)initWithFacade:(id)a3
{
  id v4;
  _SFPBPatternModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBPatternModel *v14;

  v4 = a3;
  v5 = -[_SFPBPatternModel init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "pattern_id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "pattern_id");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPatternModel setPattern_id:](v5, "setPattern_id:", v7);

    }
    objc_msgSend(v4, "pattern_parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "pattern_parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPatternModel setPattern_parameters:](v5, "setPattern_parameters:", v9);

    }
    objc_msgSend(v4, "pattern_bundle_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "pattern_bundle_id");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPatternModel setPattern_bundle_id:](v5, "setPattern_bundle_id:", v11);

    }
    objc_msgSend(v4, "pattern_template_directory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "pattern_template_directory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_SFPBPatternModel setPattern_template_directory:](v5, "setPattern_template_directory:", v13);

    }
    v14 = v5;
  }

  return v5;
}

- (void)setPattern_id:(id)a3
{
  NSString *v4;
  NSString *pattern_id;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pattern_id = self->_pattern_id;
  self->_pattern_id = v4;

}

- (void)setPattern_parameters:(id)a3
{
  NSData *v4;
  NSData *pattern_parameters;

  v4 = (NSData *)objc_msgSend(a3, "copy");
  pattern_parameters = self->_pattern_parameters;
  self->_pattern_parameters = v4;

}

- (void)setPattern_bundle_id:(id)a3
{
  NSString *v4;
  NSString *pattern_bundle_id;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pattern_bundle_id = self->_pattern_bundle_id;
  self->_pattern_bundle_id = v4;

}

- (void)setPattern_template_directory:(id)a3
{
  NSString *v4;
  NSString *pattern_template_directory;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  pattern_template_directory = self->_pattern_template_directory;
  self->_pattern_template_directory = v4;

}

- (BOOL)readFrom:(id)a3
{
  return _SFPBPatternModelReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[_SFPBPatternModel pattern_id](self, "pattern_id");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    PBDataWriterWriteStringField();

  -[_SFPBPatternModel pattern_parameters](self, "pattern_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    PBDataWriterWriteDataField();

  -[_SFPBPatternModel pattern_bundle_id](self, "pattern_bundle_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    PBDataWriterWriteStringField();

  -[_SFPBPatternModel pattern_template_directory](self, "pattern_template_directory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
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
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  BOOL v27;

  v4 = a3;
  if (!objc_msgSend(v4, "isMemberOfClass:", objc_opt_class()))
    goto LABEL_22;
  -[_SFPBPatternModel pattern_id](self, "pattern_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBPatternModel pattern_id](self, "pattern_id");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    -[_SFPBPatternModel pattern_id](self, "pattern_id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (!v11)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBPatternModel pattern_parameters](self, "pattern_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBPatternModel pattern_parameters](self, "pattern_parameters");
  v12 = objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    v13 = (void *)v12;
    -[_SFPBPatternModel pattern_parameters](self, "pattern_parameters");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_parameters");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v14, "isEqual:", v15);

    if (!v16)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBPatternModel pattern_bundle_id](self, "pattern_bundle_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_bundle_id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) == (v6 != 0))
    goto LABEL_21;
  -[_SFPBPatternModel pattern_bundle_id](self, "pattern_bundle_id");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    -[_SFPBPatternModel pattern_bundle_id](self, "pattern_bundle_id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_bundle_id");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v19, "isEqual:", v20);

    if (!v21)
      goto LABEL_22;
  }
  else
  {

  }
  -[_SFPBPatternModel pattern_template_directory](self, "pattern_template_directory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pattern_template_directory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v5 == 0) != (v6 != 0))
  {
    -[_SFPBPatternModel pattern_template_directory](self, "pattern_template_directory");
    v22 = objc_claimAutoreleasedReturnValue();
    if (!v22)
    {

LABEL_25:
      v27 = 1;
      goto LABEL_23;
    }
    v23 = (void *)v22;
    -[_SFPBPatternModel pattern_template_directory](self, "pattern_template_directory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pattern_template_directory");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v24, "isEqual:", v25);

    if ((v26 & 1) != 0)
      goto LABEL_25;
  }
  else
  {
LABEL_21:

  }
LABEL_22:
  v27 = 0;
LABEL_23:

  return v27;
}

- (unint64_t)hash
{
  NSUInteger v3;
  uint64_t v4;
  NSUInteger v5;

  v3 = -[NSString hash](self->_pattern_id, "hash");
  v4 = -[NSData hash](self->_pattern_parameters, "hash") ^ v3;
  v5 = -[NSString hash](self->_pattern_bundle_id, "hash");
  return v4 ^ v5 ^ -[NSString hash](self->_pattern_template_directory, "hash");
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_pattern_bundle_id)
  {
    -[_SFPBPatternModel pattern_bundle_id](self, "pattern_bundle_id");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("patternBundleId"));

  }
  if (self->_pattern_id)
  {
    -[_SFPBPatternModel pattern_id](self, "pattern_id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("patternId"));

  }
  if (self->_pattern_parameters)
  {
    -[_SFPBPatternModel pattern_parameters](self, "pattern_parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "base64EncodedStringWithOptions:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("patternParameters"));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("patternParameters"));

    }
  }
  if (self->_pattern_template_directory)
  {
    -[_SFPBPatternModel pattern_template_directory](self, "pattern_template_directory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "copy");
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("patternTemplateDirectory"));

  }
  return v3;
}

- (NSData)jsonData
{
  void *v2;
  void *v3;

  -[_SFPBPatternModel dictionaryRepresentation](self, "dictionaryRepresentation");
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

- (_SFPBPatternModel)initWithJSON:(id)a3
{
  void *v4;
  _SFPBPatternModel *v5;
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
    self = -[_SFPBPatternModel initWithDictionary:](self, "initWithDictionary:", v4);
    v5 = self;
  }

  return v5;
}

- (_SFPBPatternModel)initWithDictionary:(id)a3
{
  id v4;
  _SFPBPatternModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _SFPBPatternModel *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_SFPBPatternModel;
  v5 = -[_SFPBPatternModel init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v7 = (void *)objc_msgSend(v6, "copy");
      -[_SFPBPatternModel setPattern_id:](v5, "setPattern_id:", v7);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternParameters"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v8, 0);
      -[_SFPBPatternModel setPattern_parameters:](v5, "setPattern_parameters:", v9);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternBundleId"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v11 = (void *)objc_msgSend(v10, "copy");
      -[_SFPBPatternModel setPattern_bundle_id:](v5, "setPattern_bundle_id:", v11);

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("patternTemplateDirectory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v13 = (void *)objc_msgSend(v12, "copy");
      -[_SFPBPatternModel setPattern_template_directory:](v5, "setPattern_template_directory:", v13);

    }
    v14 = v5;

  }
  return v5;
}

- (NSString)pattern_id
{
  return self->_pattern_id;
}

- (NSData)pattern_parameters
{
  return self->_pattern_parameters;
}

- (NSString)pattern_bundle_id
{
  return self->_pattern_bundle_id;
}

- (NSString)pattern_template_directory
{
  return self->_pattern_template_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_template_directory, 0);
  objc_storeStrong((id *)&self->_pattern_bundle_id, 0);
  objc_storeStrong((id *)&self->_pattern_parameters, 0);
  objc_storeStrong((id *)&self->_pattern_id, 0);
}

@end
