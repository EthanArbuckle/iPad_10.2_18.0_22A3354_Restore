@implementation SFPerformEntityQueryCommand

- (SFPerformEntityQueryCommand)initWithProtobuf:(id)a3
{
  id v4;
  SFPerformEntityQueryCommand *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFSymbolImage *v11;
  void *v12;
  SFSymbolImage *v13;
  void *v14;
  void *v15;
  void *v16;
  SFColor *v17;
  void *v18;
  SFColor *v19;
  void *v20;
  SFDrillDownMetadata *v21;
  void *v22;
  SFDrillDownMetadata *v23;
  void *v24;
  SFDrillDownMetadata *v25;
  void *v26;
  SFDrillDownMetadata *v27;
  SFPerformEntityQueryCommand *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)SFPerformEntityQueryCommand;
  v5 = -[SFPerformEntityQueryCommand init](&v30, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "searchString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "searchString");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformEntityQueryCommand setSearchString:](v5, "setSearchString:", v7);

    }
    objc_msgSend(v4, "tokenString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v4, "tokenString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformEntityQueryCommand setTokenString:](v5, "setTokenString:", v9);

    }
    objc_msgSend(v4, "symbolImage");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      v11 = [SFSymbolImage alloc];
      objc_msgSend(v4, "symbolImage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = -[SFSymbolImage initWithProtobuf:](v11, "initWithProtobuf:", v12);
      -[SFPerformEntityQueryCommand setSymbolImage:](v5, "setSymbolImage:", v13);

    }
    if (objc_msgSend(v4, "entityType"))
      -[SFPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", objc_msgSend(v4, "entityType"));
    objc_msgSend(v4, "entityIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      objc_msgSend(v4, "entityIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFPerformEntityQueryCommand setEntityIdentifier:](v5, "setEntityIdentifier:", v15);

    }
    objc_msgSend(v4, "entityBackgroundColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      v17 = [SFColor alloc];
      objc_msgSend(v4, "entityBackgroundColor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[SFColor initWithProtobuf:](v17, "initWithProtobuf:", v18);
      -[SFPerformEntityQueryCommand setEntityBackgroundColor:](v5, "setEntityBackgroundColor:", v19);

    }
    objc_msgSend(v4, "metadata");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
    {
      v21 = [SFDrillDownMetadata alloc];
      objc_msgSend(v4, "metadata");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = -[SFDrillDownMetadata initWithProtobuf:](v21, "initWithProtobuf:", v22);
      -[SFPerformEntityQueryCommand setMetadata:](v5, "setMetadata:", v23);

    }
    objc_msgSend(v4, "drilldownMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = [SFDrillDownMetadata alloc];
      objc_msgSend(v4, "drilldownMetadata");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[SFDrillDownMetadata initWithProtobuf:](v25, "initWithProtobuf:", v26);
      -[SFPerformEntityQueryCommand setDrilldownMetadata:](v5, "setDrilldownMetadata:", v27);

    }
    v28 = v5;
  }

  return v5;
}

- (void)setEntityType:(int)a3
{
  *(_BYTE *)&self->_has |= 1u;
  self->_entityType = a3;
}

- (BOOL)hasEntityType
{
  return *(_BYTE *)&self->_has & 1;
}

- (SFPerformEntityQueryCommand)initWithCoder:(id)a3
{
  id v4;
  SFPerformEntityQueryCommand *v5;
  void *v6;
  _SFPBCommand *v7;
  SFCommand *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v4 = a3;
  v5 = -[SFPerformEntityQueryCommand init](self, "init");
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_backingStore"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[_SFPBCommand initWithData:]([_SFPBCommand alloc], "initWithData:", v6);
  v8 = -[SFCommand initWithProtobuf:]([SFCommand alloc], "initWithProtobuf:", v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[SFCommand searchString](v8, "searchString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setSearchString:](v5, "setSearchString:", v9);

    -[SFCommand tokenString](v8, "tokenString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setTokenString:](v5, "setTokenString:", v10);

    -[SFCommand symbolImage](v8, "symbolImage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setSymbolImage:](v5, "setSymbolImage:", v11);

    -[SFPerformEntityQueryCommand setEntityType:](v5, "setEntityType:", -[SFCommand entityType](v8, "entityType"));
    -[SFCommand entityIdentifier](v8, "entityIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setEntityIdentifier:](v5, "setEntityIdentifier:", v12);

    -[SFCommand entityBackgroundColor](v8, "entityBackgroundColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setEntityBackgroundColor:](v5, "setEntityBackgroundColor:", v13);

    -[SFCommand metadata](v8, "metadata");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setMetadata:](v5, "setMetadata:", v14);

    -[SFCommand drilldownMetadata](v8, "drilldownMetadata");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPerformEntityQueryCommand setDrilldownMetadata:](v5, "setDrilldownMetadata:", v15);

    -[SFCommand commandDetail](v8, "commandDetail");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandDetail:](v5, "setCommandDetail:", v16);

    -[SFCommand normalizedTopic](v8, "normalizedTopic");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setNormalizedTopic:](v5, "setNormalizedTopic:", v17);

    -[SFCommand backendData](v8, "backendData");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setBackendData:](v5, "setBackendData:", v18);

    -[SFCommand commandReference](v8, "commandReference");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFCommand setCommandReference:](v5, "setCommandReference:", v19);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFPerformEntityQueryCommand;
  -[SFCommand encodeWithCoder:](&v3, sel_encodeWithCoder_, a3);
}

- (NSDictionary)dictionaryRepresentation
{
  _SFPBPerformEntityQueryCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformEntityQueryCommand initWithFacade:]([_SFPBPerformEntityQueryCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformEntityQueryCommand dictionaryRepresentation](v2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSData)jsonData
{
  _SFPBPerformEntityQueryCommand *v2;
  void *v3;

  v2 = -[_SFPBPerformEntityQueryCommand initWithFacade:]([_SFPBPerformEntityQueryCommand alloc], "initWithFacade:", self);
  -[_SFPBPerformEntityQueryCommand jsonData](v2, "jsonData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SFPerformEntityQueryCommand;
  v4 = -[SFCommand copyWithZone:](&v20, sel_copyWithZone_, a3);
  -[SFPerformEntityQueryCommand searchString](self, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setSearchString:", v6);

  -[SFPerformEntityQueryCommand tokenString](self, "tokenString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setTokenString:", v8);

  -[SFPerformEntityQueryCommand symbolImage](self, "symbolImage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setSymbolImage:", v10);

  objc_msgSend(v4, "setEntityType:", -[SFPerformEntityQueryCommand entityType](self, "entityType"));
  -[SFPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "copy");
  objc_msgSend(v4, "setEntityIdentifier:", v12);

  -[SFPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");
  objc_msgSend(v4, "setEntityBackgroundColor:", v14);

  -[SFPerformEntityQueryCommand metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v15, "copy");
  objc_msgSend(v4, "setMetadata:", v16);

  -[SFPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v17, "copy");
  objc_msgSend(v4, "setDrilldownMetadata:", v18);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  SFPerformEntityQueryCommand *v5;
  SFPerformEntityQueryCommand *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
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
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  SFPerformEntityQueryCommand *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  objc_super v69;

  v5 = (SFPerformEntityQueryCommand *)a3;
  if (self == v5)
  {
    v11 = 1;
  }
  else
  {
    if (-[SFPerformEntityQueryCommand isMemberOfClass:](v5, "isMemberOfClass:", objc_opt_class()))
    {
      v69.receiver = self;
      v69.super_class = (Class)SFPerformEntityQueryCommand;
      if (-[SFCommand isEqual:](&v69, sel_isEqual_, v5))
      {
        v6 = v5;
        -[SFPerformEntityQueryCommand searchString](self, "searchString");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformEntityQueryCommand searchString](v6, "searchString");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v7 == 0) == (v8 != 0))
        {
          v11 = 0;
LABEL_50:

          goto LABEL_51;
        }
        -[SFPerformEntityQueryCommand searchString](self, "searchString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          -[SFPerformEntityQueryCommand searchString](self, "searchString");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformEntityQueryCommand searchString](v6, "searchString");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          if (!objc_msgSend(v10, "isEqual:"))
          {
            v11 = 0;
            goto LABEL_48;
          }
          v65 = v10;
        }
        -[SFPerformEntityQueryCommand tokenString](self, "tokenString");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformEntityQueryCommand tokenString](v6, "tokenString");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        if ((v67 == 0) == (v66 != 0))
          goto LABEL_46;
        -[SFPerformEntityQueryCommand tokenString](self, "tokenString");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[SFPerformEntityQueryCommand tokenString](self, "tokenString");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformEntityQueryCommand tokenString](v6, "tokenString");
          v3 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v13, "isEqual:", v3) & 1) == 0)
          {

            goto LABEL_32;
          }
          v61 = v13;
          v63 = v6;
          v14 = v68;
          v15 = v12;
        }
        else
        {
          v63 = v6;
          v14 = v68;
          v15 = 0;
        }
        v68 = v14;
        -[SFPerformEntityQueryCommand symbolImage](self, "symbolImage");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFPerformEntityQueryCommand symbolImage](v63, "symbolImage");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v15;
        v18 = v3;
        if ((v16 == 0) != (v17 != 0))
        {
          v60 = v17;
          -[SFPerformEntityQueryCommand symbolImage](self, "symbolImage");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v16;
          if (v62)
          {
            -[SFPerformEntityQueryCommand symbolImage](self, "symbolImage");
            v19 = objc_claimAutoreleasedReturnValue();
            v6 = v63;
            -[SFPerformEntityQueryCommand symbolImage](v63, "symbolImage");
            v20 = objc_claimAutoreleasedReturnValue();
            v58 = (void *)v19;
            v21 = (void *)v19;
            v3 = (void *)v20;
            if (!objc_msgSend(v21, "isEqual:", v20))
              goto LABEL_29;
          }
          else
          {
            v6 = v63;
          }
          v64 = v12;
          v22 = -[SFPerformEntityQueryCommand entityType](self, "entityType");
          if (v22 != -[SFPerformEntityQueryCommand entityType](v6, "entityType"))
          {
            v12 = v64;
            if (!v62)
            {
LABEL_30:

              if (!v12)
              {
LABEL_46:

                v11 = 0;
                goto LABEL_47;
              }

LABEL_32:
              goto LABEL_46;
            }
LABEL_29:

            goto LABEL_30;
          }
          v57 = v18;
          -[SFPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[SFPerformEntityQueryCommand entityIdentifier](v6, "entityIdentifier");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v64;
          if ((v23 == 0) != (v24 != 0))
          {
            v55 = v23;
            v56 = v24;
            -[SFPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            if (v54)
            {
              -[SFPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPerformEntityQueryCommand entityIdentifier](v6, "entityIdentifier");
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v53 = v25;
              if (!objc_msgSend(v25, "isEqual:"))
              {
                v51 = v3;
                v11 = 0;
                v26 = v54;
                goto LABEL_70;
              }
            }
            -[SFPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            -[SFPerformEntityQueryCommand entityBackgroundColor](v6, "entityBackgroundColor");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            if ((v27 == 0) != (v28 != 0))
            {
              v50 = v28;
              -[SFPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v51 = v3;
              if (v29)
              {
                -[SFPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFPerformEntityQueryCommand entityBackgroundColor](v6, "entityBackgroundColor");
                v47 = (void *)objc_claimAutoreleasedReturnValue();
                v48 = v30;
                if (!objc_msgSend(v30, "isEqual:"))
                {
                  v11 = 0;
                  v12 = v64;
LABEL_68:

LABEL_69:
                  v26 = v54;
                  if (!v54)
                  {
LABEL_71:

                    if (v62)
                    {

                    }
                    if (v12)
                    {

                    }
LABEL_47:
                    v10 = v65;
                    if (!v9)
                    {
LABEL_49:

                      goto LABEL_50;
                    }
LABEL_48:

                    goto LABEL_49;
                  }
LABEL_70:

                  goto LABEL_71;
                }
                v49 = v29;
              }
              else
              {
                v49 = 0;
              }
              -[SFPerformEntityQueryCommand metadata](self, "metadata");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFPerformEntityQueryCommand metadata](v6, "metadata");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              if ((v32 == 0) == (v33 != 0))
              {

                v11 = 0;
                v12 = v64;
                goto LABEL_67;
              }
              v45 = v32;
              v46 = v33;
              -[SFPerformEntityQueryCommand metadata](self, "metadata");
              v44 = objc_claimAutoreleasedReturnValue();
              if (!v44
                || (-[SFPerformEntityQueryCommand metadata](self, "metadata"),
                    v34 = (void *)objc_claimAutoreleasedReturnValue(),
                    -[SFPerformEntityQueryCommand metadata](v6, "metadata"),
                    v42 = (void *)objc_claimAutoreleasedReturnValue(),
                    v43 = v34,
                    objc_msgSend(v34, "isEqual:")))
              {
                -[SFPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[SFPerformEntityQueryCommand drilldownMetadata](v6, "drilldownMetadata");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                if ((v36 == 0) == (v37 != 0))
                {

                  v11 = 0;
                }
                else
                {
                  v41 = v37;
                  -[SFPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v40)
                  {
                    -[SFPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    -[SFPerformEntityQueryCommand drilldownMetadata](v6, "drilldownMetadata");
                    v38 = (void *)objc_claimAutoreleasedReturnValue();
                    v11 = objc_msgSend(v39, "isEqual:", v38);

                  }
                  else
                  {

                    v11 = 1;
                  }
                }
                v12 = v64;
                v35 = (void *)v44;
                if (!v44)
                  goto LABEL_66;
              }
              else
              {
                v11 = 0;
                v12 = v64;
                v35 = (void *)v44;
              }

LABEL_66:
LABEL_67:
              v29 = v49;
              if (!v49)
                goto LABEL_69;
              goto LABEL_68;
            }

            v12 = v64;
            if (v54)
            {

            }
            v23 = v55;
            v24 = v56;
          }
          v63 = v6;

          if (v62)
          {

          }
          v17 = v60;
          v18 = v57;
        }

        if (v12)
        {

        }
        v6 = v63;
        goto LABEL_46;
      }
    }
    v11 = 0;
  }
LABEL_51:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SFPerformEntityQueryCommand;
  v3 = -[SFCommand hash](&v20, sel_hash);
  -[SFPerformEntityQueryCommand searchString](self, "searchString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[SFPerformEntityQueryCommand tokenString](self, "tokenString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash");
  -[SFPerformEntityQueryCommand symbolImage](self, "symbolImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");
  v10 = v9 ^ -[SFPerformEntityQueryCommand entityType](self, "entityType");
  -[SFPerformEntityQueryCommand entityIdentifier](self, "entityIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v10 ^ objc_msgSend(v11, "hash") ^ v3;
  -[SFPerformEntityQueryCommand entityBackgroundColor](self, "entityBackgroundColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash");
  -[SFPerformEntityQueryCommand metadata](self, "metadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 ^ objc_msgSend(v15, "hash");
  -[SFPerformEntityQueryCommand drilldownMetadata](self, "drilldownMetadata");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v12 ^ v16 ^ objc_msgSend(v17, "hash");

  return v18;
}

- (NSString)searchString
{
  return self->_searchString;
}

- (void)setSearchString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)tokenString
{
  return self->_tokenString;
}

- (void)setTokenString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SFSymbolImage)symbolImage
{
  return self->_symbolImage;
}

- (void)setSymbolImage:(id)a3
{
  objc_storeStrong((id *)&self->_symbolImage, a3);
}

- (int)entityType
{
  return self->_entityType;
}

- (NSString)entityIdentifier
{
  return self->_entityIdentifier;
}

- (void)setEntityIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (SFColor)entityBackgroundColor
{
  return self->_entityBackgroundColor;
}

- (void)setEntityBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_entityBackgroundColor, a3);
}

- (SFDrillDownMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_metadata, a3);
}

- (SFDrillDownMetadata)drilldownMetadata
{
  return self->_drilldownMetadata;
}

- (void)setDrilldownMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_drilldownMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drilldownMetadata, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_entityBackgroundColor, 0);
  objc_storeStrong((id *)&self->_entityIdentifier, 0);
  objc_storeStrong((id *)&self->_symbolImage, 0);
  objc_storeStrong((id *)&self->_tokenString, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
