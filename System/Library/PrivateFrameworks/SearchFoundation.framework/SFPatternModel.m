@implementation SFPatternModel

- (SFPatternModel)initWithProtobuf:(id)a3
{
  id v4;
  SFPatternModel *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SFPatternModel *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SFPatternModel;
  v5 = -[SFPatternModel init](&v16, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "pattern_id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "pattern_id");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel setPattern_id:](v5, "setPattern_id:", v7);

    }
    objc_msgSend(v4, "pattern_parameters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "pattern_parameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel setPattern_parameters:](v5, "setPattern_parameters:", v9);

    }
    objc_msgSend(v4, "pattern_bundle_id");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v4, "pattern_bundle_id");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel setPattern_bundle_id:](v5, "setPattern_bundle_id:", v11);

    }
    objc_msgSend(v4, "pattern_template_directory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v4, "pattern_template_directory");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel setPattern_template_directory:](v5, "setPattern_template_directory:", v13);

    }
    v14 = v5;
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFPatternModel)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPatternModel *v6;
  SFPatternModel *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[_SFPBPatternModel initWithData:]([_SFPBPatternModel alloc], "initWithData:", v5);
  v7 = -[SFPatternModel initWithProtobuf:](self, "initWithProtobuf:", v6);

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  _SFPBPatternModel *v6;

  v4 = a3;
  v6 = -[_SFPBPatternModel initWithFacade:]([_SFPBPatternModel alloc], "initWithFacade:", self);
  -[_SFPBPatternModel data](v6, "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("_backingStore"));

}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPatternModel *v2;
  void *v3;

  v2 = -[_SFPBPatternModel initWithFacade:]([_SFPBPatternModel alloc], "initWithFacade:", self);
  -[_SFPBPatternModel dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPatternModel *v2;
  void *v3;

  v2 = -[_SFPBPatternModel initWithFacade:]([_SFPBPatternModel alloc], "initWithFacade:", self);
  -[_SFPBPatternModel jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[SFPatternModel pattern_id](self, "pattern_id");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setPattern_id:", v6);

  -[SFPatternModel pattern_parameters](self, "pattern_parameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setPattern_parameters:", v8);

  -[SFPatternModel pattern_bundle_id](self, "pattern_bundle_id");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setPattern_bundle_id:", v10);

  -[SFPatternModel pattern_template_directory](self, "pattern_template_directory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setPattern_template_directory:", v12);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPatternModel *v5;
  SFPatternModel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;

  v5 = (SFPatternModel *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPatternModel isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v6 = v5;
      -[SFPatternModel pattern_id](self, "pattern_id");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel pattern_id](v6, "pattern_id");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v7 == 0) == (v8 != 0))
      {
        v11 = 0;
LABEL_37:

        goto LABEL_38;
      }
      -[SFPatternModel pattern_id](self, "pattern_id");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[SFPatternModel pattern_id](self, "pattern_id");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPatternModel pattern_id](v6, "pattern_id");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v10, "isEqual:", v3))
        {
          v11 = 0;
          goto LABEL_35;
        }
        v41 = v10;
      }
      -[SFPatternModel pattern_parameters](self, "pattern_parameters");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel pattern_parameters](v6, "pattern_parameters");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if ((v12 == 0) == (v13 != 0))
      {

        v11 = 0;
        goto LABEL_34;
      }
      -[SFPatternModel pattern_parameters](self, "pattern_parameters");
      v15 = objc_claimAutoreleasedReturnValue();
      v40 = (void *)v15;
      if (v15)
      {
        v16 = (void *)v15;
        v35 = v14;
        v17 = v12;
        -[SFPatternModel pattern_parameters](self, "pattern_parameters");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPatternModel pattern_parameters](v6, "pattern_parameters");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v18;
        if (!objc_msgSend(v18, "isEqual:"))
        {
          v11 = 0;
          v12 = v17;
          v14 = v35;
          goto LABEL_32;
        }
        v39 = v3;
        v12 = v17;
        v14 = v35;
      }
      else
      {
        v39 = v3;
      }
      -[SFPatternModel pattern_bundle_id](self, "pattern_bundle_id");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPatternModel pattern_bundle_id](v6, "pattern_bundle_id");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if ((v19 == 0) == (v20 != 0))
      {

        v11 = 0;
        v3 = v39;
        v16 = v40;
        if (!v40)
          goto LABEL_33;
        goto LABEL_32;
      }
      v33 = v20;
      v34 = v19;
      -[SFPatternModel pattern_bundle_id](self, "pattern_bundle_id");
      v16 = v40;
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v36
        || (-[SFPatternModel pattern_bundle_id](self, "pattern_bundle_id"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            -[SFPatternModel pattern_bundle_id](v6, "pattern_bundle_id"),
            v31 = (void *)objc_claimAutoreleasedReturnValue(),
            v32 = v21,
            objc_msgSend(v21, "isEqual:")))
      {
        -[SFPatternModel pattern_template_directory](self, "pattern_template_directory");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPatternModel pattern_template_directory](v6, "pattern_template_directory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v22 == 0) == (v23 != 0))
        {

          v11 = 0;
          v16 = v40;
        }
        else
        {
          v29 = v22;
          v30 = v23;
          -[SFPatternModel pattern_template_directory](self, "pattern_template_directory");
          v24 = objc_claimAutoreleasedReturnValue();
          v16 = v40;
          if (v24)
          {
            v28 = (void *)v24;
            -[SFPatternModel pattern_template_directory](self, "pattern_template_directory");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPatternModel pattern_template_directory](v6, "pattern_template_directory");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = objc_msgSend(v27, "isEqual:");

          }
          else
          {

            v11 = 1;
          }
        }
        v3 = v39;
        if (!v36)
        {
LABEL_31:

          if (!v16)
          {
LABEL_33:

LABEL_34:
            v10 = v41;
            if (!v9)
            {
LABEL_36:

              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
LABEL_32:

          goto LABEL_33;
        }
      }
      else
      {
        v11 = 0;
        v3 = v39;
      }

      goto LABEL_31;
    }
    v11 = 0;
  }
LABEL_38:

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  unint64_t v10;

  -[SFPatternModel pattern_id](self, "pattern_id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[SFPatternModel pattern_parameters](self, "pattern_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[SFPatternModel pattern_bundle_id](self, "pattern_bundle_id");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash");
  -[SFPatternModel pattern_template_directory](self, "pattern_template_directory");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v6 ^ v8 ^ objc_msgSend(v9, "hash");

  return v10;
}

- (NSString)pattern_id
{
  return self->_pattern_id;
}

- (void)setPattern_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSData)pattern_parameters
{
  return self->_pattern_parameters;
}

- (void)setPattern_parameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)pattern_bundle_id
{
  return self->_pattern_bundle_id;
}

- (void)setPattern_bundle_id:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)pattern_template_directory
{
  return self->_pattern_template_directory;
}

- (void)setPattern_template_directory:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pattern_template_directory, 0);
  objc_storeStrong((id *)&self->_pattern_bundle_id, 0);
  objc_storeStrong((id *)&self->_pattern_parameters, 0);
  objc_storeStrong((id *)&self->_pattern_id, 0);
}

@end
