@implementation UIEventAttribution

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaser, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_reportEndpoint, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

- (UIEventAttribution)initWithUISClickAttribution:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UIEventAttribution *v10;

  if (a3)
  {
    v4 = a3;
    v5 = objc_msgSend(v4, "sourceIdentifier");
    objc_msgSend(v4, "destinationURL");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportEndpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sourceDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "purchaser");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    self = -[UIEventAttribution initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:](self, "initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:", v5, v6, v7, v8, v9);
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIEventAttribution)initWithSourceIdentifier:(uint8_t)sourceIdentifier destinationURL:(NSURL *)destinationURL sourceDescription:(NSString *)sourceDescription purchaser:(NSString *)purchaser
{
  uint64_t v8;
  uint64_t v10;
  NSString *v11;
  NSString *v12;
  NSURL *v13;
  UIEventAttribution *v14;

  v8 = sourceIdentifier;
  v10 = qword_1ECD7F530;
  v11 = purchaser;
  v12 = sourceDescription;
  v13 = destinationURL;
  if (v10 != -1)
    dispatch_once(&qword_1ECD7F530, &__block_literal_global_406);
  v14 = -[UIEventAttribution initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:](self, "initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:", v8, v13, _MergedGlobals_1171, v12, v11);

  return v14;
}

- (UIEventAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  UIEventAttribution *v16;
  UIEventAttribution *v17;
  uint64_t v18;
  NSURL *destinationURL;
  uint64_t v20;
  NSURL *reportEndpoint;
  uint64_t v22;
  NSString *sourceDescription;
  uint64_t v24;
  NSString *purchaser;
  objc_super v27;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v27.receiver = self;
  v27.super_class = (Class)UIEventAttribution;
  v16 = -[UIEventAttribution init](&v27, sel_init);
  v17 = v16;
  if (v16)
  {
    v16->_sourceIdentifier = a3;
    v18 = objc_msgSend(v12, "copy");
    destinationURL = v17->_destinationURL;
    v17->_destinationURL = (NSURL *)v18;

    v20 = objc_msgSend(v13, "copy");
    reportEndpoint = v17->_reportEndpoint;
    v17->_reportEndpoint = (NSURL *)v20;

    if ((unint64_t)objc_msgSend(v14, "length") > 0x64)
    {
      objc_msgSend(v14, "substringToIndex:", 100);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_msgSend(v14, "copy");
    }
    sourceDescription = v17->_sourceDescription;
    v17->_sourceDescription = (NSString *)v22;

    if ((unint64_t)objc_msgSend(v15, "length") > 0x64)
    {
      objc_msgSend(v15, "substringToIndex:", 100);
      v24 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = objc_msgSend(v15, "copy");
    }
    purchaser = v17->_purchaser;
    v17->_purchaser = (NSString *)v24;

  }
  return v17;
}

- (id)toUISClickAttribution
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[UIEventAttributionView lastEventMessage](UIEventAttributionView, "lastEventMessage");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0DC5B98]);
  v5 = -[UIEventAttribution sourceIdentifier](self, "sourceIdentifier");
  -[UIEventAttribution destinationURL](self, "destinationURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventAttribution reportEndpoint](self, "reportEndpoint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventAttribution sourceDescription](self, "sourceDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIEventAttribution purchaser](self, "purchaser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v4, "initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:eventMessage:", v5, v6, v7, v8, v9, v3);

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  UIEventAttribution *v4;
  void *v5;
  char isKindOfClass;
  UIEventAttribution *v7;
  int sourceIdentifier;
  NSURL *destinationURL;
  void *v10;
  NSURL *v11;
  NSURL *v12;
  NSURL *v13;
  int v14;
  int v15;
  NSURL *reportEndpoint;
  void *v17;
  NSURL *v18;
  NSURL *v19;
  NSString *sourceDescription;
  void *v21;
  NSString *p_isa;
  NSURL *v23;
  NSString *purchaser;
  void *v25;
  NSString *v26;
  NSString *v27;
  objc_super v29;

  v4 = (UIEventAttribution *)a3;
  if (self == v4)
  {
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      sourceIdentifier = self->_sourceIdentifier;
      if (sourceIdentifier != -[UIEventAttribution sourceIdentifier](v7, "sourceIdentifier"))
      {
        LOBYTE(v14) = 0;
LABEL_39:

        goto LABEL_40;
      }
      destinationURL = self->_destinationURL;
      -[UIEventAttribution destinationURL](v7, "destinationURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = destinationURL;
      v12 = v10;
      v13 = v12;
      if (v11 == v12)
      {

      }
      else
      {
        LOBYTE(v14) = 0;
        if (!v11 || !v12)
        {
          v18 = v12;
LABEL_36:

LABEL_37:
          goto LABEL_38;
        }
        v15 = -[NSURL isEqual:](v11, "isEqual:", v12);

        if (!v15)
        {
          LOBYTE(v14) = 0;
LABEL_38:

          goto LABEL_39;
        }
      }
      reportEndpoint = self->_reportEndpoint;
      -[UIEventAttribution reportEndpoint](v7, "reportEndpoint");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = reportEndpoint;
      v19 = v17;
      v11 = v19;
      if (v18 == v19)
      {

      }
      else
      {
        LOBYTE(v14) = 0;
        if (!v18 || !v19)
        {
          p_isa = (NSString *)&v19->super.isa;
LABEL_35:

          goto LABEL_36;
        }
        v14 = -[NSURL isEqual:](v18, "isEqual:", v19);

        if (!v14)
          goto LABEL_37;
      }
      sourceDescription = self->_sourceDescription;
      -[UIEventAttribution sourceDescription](v7, "sourceDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      p_isa = sourceDescription;
      v23 = v21;
      v18 = v23;
      if (p_isa == (NSString *)v23)
      {

      }
      else
      {
        LOBYTE(v14) = 0;
        if (!p_isa || !v23)
        {
          v26 = (NSString *)&v23->super.isa;
LABEL_34:

          goto LABEL_35;
        }
        v14 = -[NSString isEqual:](p_isa, "isEqual:", v23);

        if (!v14)
          goto LABEL_36;
      }
      purchaser = self->_purchaser;
      -[UIEventAttribution purchaser](v7, "purchaser");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = purchaser;
      v27 = v25;
      p_isa = v27;
      if (v26 == v27)
      {
        LOBYTE(v14) = 1;
      }
      else
      {
        LOBYTE(v14) = 0;
        if (v26 && v27)
          LOBYTE(v14) = -[NSString isEqual:](v26, "isEqual:", v27);
      }

      goto LABEL_34;
    }
    v29.receiver = self;
    v29.super_class = (Class)UIEventAttribution;
    LOBYTE(v14) = -[UIEventAttribution isEqual:](&v29, sel_isEqual_, v4);
  }
LABEL_40:

  return v14;
}

- (unint64_t)hash
{
  uint64_t sourceIdentifier;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;

  sourceIdentifier = self->_sourceIdentifier;
  v4 = -[NSURL hash](self->_destinationURL, "hash") ^ sourceIdentifier;
  v5 = -[NSURL hash](self->_reportEndpoint, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sourceDescription, "hash");
  return v6 ^ -[NSString hash](self->_purchaser, "hash");
}

- (uint8_t)sourceIdentifier
{
  return self->_sourceIdentifier;
}

- (NSURL)destinationURL
{
  return self->_destinationURL;
}

- (NSURL)reportEndpoint
{
  return self->_reportEndpoint;
}

- (NSString)sourceDescription
{
  return self->_sourceDescription;
}

- (NSString)purchaser
{
  return self->_purchaser;
}

@end
