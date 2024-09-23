@implementation UISClickAttribution

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISClickAttribution)initWithSourceIdentifier:(unsigned __int8)a3 destinationURL:(id)a4 reportEndpoint:(id)a5 sourceDescription:(id)a6 purchaser:(id)a7 eventMessage:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  UISClickAttribution *v19;
  UISClickAttribution *v20;
  uint64_t v21;
  NSURL *destinationURL;
  uint64_t v23;
  NSURL *reportEndpoint;
  uint64_t v25;
  NSString *sourceDescription;
  uint64_t v27;
  NSString *purchaser;
  uint64_t v29;
  BKSHIDEventAuthenticationMessage *eventMessage;
  objc_super v32;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v32.receiver = self;
  v32.super_class = (Class)UISClickAttribution;
  v19 = -[UISClickAttribution init](&v32, sel_init);
  v20 = v19;
  if (v19)
  {
    v19->_sourceIdentifier = a3;
    v21 = objc_msgSend(v14, "copy");
    destinationURL = v20->_destinationURL;
    v20->_destinationURL = (NSURL *)v21;

    v23 = objc_msgSend(v15, "copy");
    reportEndpoint = v20->_reportEndpoint;
    v20->_reportEndpoint = (NSURL *)v23;

    if ((unint64_t)objc_msgSend(v16, "length") > 0x64)
    {
      objc_msgSend(v16, "substringToIndex:", 100);
      v25 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = objc_msgSend(v16, "copy");
    }
    sourceDescription = v20->_sourceDescription;
    v20->_sourceDescription = (NSString *)v25;

    if ((unint64_t)objc_msgSend(v17, "length") > 0x64)
    {
      objc_msgSend(v17, "substringToIndex:", 100);
      v27 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v27 = objc_msgSend(v17, "copy");
    }
    purchaser = v20->_purchaser;
    v20->_purchaser = (NSString *)v27;

    v29 = objc_msgSend(v18, "copy");
    eventMessage = v20->_eventMessage;
    v20->_eventMessage = (BKSHIDEventAuthenticationMessage *)v29;

  }
  return v20;
}

- (UISClickAttribution)clickAttributionWithReportEndpoint:(id)a3
{
  id v4;
  UISClickAttribution *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  UISClickAttribution *v11;

  v4 = a3;
  v5 = [UISClickAttribution alloc];
  v6 = -[UISClickAttribution sourceIdentifier](self, "sourceIdentifier");
  -[UISClickAttribution destinationURL](self, "destinationURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISClickAttribution sourceDescription](self, "sourceDescription");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISClickAttribution purchaser](self, "purchaser");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UISClickAttribution eventMessage](self, "eventMessage");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[UISClickAttribution initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:eventMessage:](v5, "initWithSourceIdentifier:destinationURL:reportEndpoint:sourceDescription:purchaser:eventMessage:", v6, v7, v4, v8, v9, v10);

  return v11;
}

- (UISClickAttribution)initWithCoder:(id)a3
{
  id v4;
  UISClickAttribution *v5;
  void *v6;
  uint64_t v7;
  NSURL *destinationURL;
  void *v9;
  uint64_t v10;
  NSURL *reportEndpoint;
  void *v12;
  uint64_t v13;
  NSString *sourceDescription;
  void *v15;
  uint64_t v16;
  NSString *purchaser;
  void *v18;
  uint64_t v19;
  BKSHIDEventAuthenticationMessage *eventMessage;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)UISClickAttribution;
  v5 = -[UISClickAttribution init](&v22, sel_init);
  if (v5)
  {
    v5->_sourceIdentifier = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SourceIdentifier"));
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("DestinationURL"));
    v7 = objc_claimAutoreleasedReturnValue();
    destinationURL = v5->_destinationURL;
    v5->_destinationURL = (NSURL *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("ReportEndpoint"));
    v10 = objc_claimAutoreleasedReturnValue();
    reportEndpoint = v5->_reportEndpoint;
    v5->_reportEndpoint = (NSURL *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("SourceDescription"));
    v13 = objc_claimAutoreleasedReturnValue();
    sourceDescription = v5->_sourceDescription;
    v5->_sourceDescription = (NSString *)v13;

    objc_opt_self();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v15, CFSTR("Purchaser"));
    v16 = objc_claimAutoreleasedReturnValue();
    purchaser = v5->_purchaser;
    v5->_purchaser = (NSString *)v16;

    objc_opt_self();
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v18, CFSTR("EventMessage"));
    v19 = objc_claimAutoreleasedReturnValue();
    eventMessage = v5->_eventMessage;
    v5->_eventMessage = (BKSHIDEventAuthenticationMessage *)v19;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t sourceIdentifier;
  id v5;

  sourceIdentifier = self->_sourceIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", sourceIdentifier, CFSTR("SourceIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationURL, CFSTR("DestinationURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_reportEndpoint, CFSTR("ReportEndpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceDescription, CFSTR("SourceDescription"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_purchaser, CFSTR("Purchaser"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_eventMessage, CFSTR("EventMessage"));

}

- (BOOL)isEqual:(id)a3
{
  UISClickAttribution *v4;
  void *v5;
  char isKindOfClass;
  UISClickAttribution *v7;
  int sourceIdentifier;
  NSURL *destinationURL;
  NSURL *v10;
  NSURL *reportEndpoint;
  NSURL *v12;
  NSString *sourceDescription;
  NSString *v14;
  NSString *purchaser;
  NSString *v16;
  BKSHIDEventAuthenticationMessage *eventMessage;
  BKSHIDEventAuthenticationMessage *v18;
  unsigned __int8 v19;
  objc_super v21;

  v4 = (UISClickAttribution *)a3;
  if (self == v4)
  {
    v19 = 1;
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
      if (sourceIdentifier == -[UISClickAttribution sourceIdentifier](v7, "sourceIdentifier"))
      {
        destinationURL = self->_destinationURL;
        -[UISClickAttribution destinationURL](v7, "destinationURL");
        v10 = (NSURL *)objc_claimAutoreleasedReturnValue();
        if (destinationURL == v10 || -[NSURL isEqual:](destinationURL, "isEqual:", v10))
        {
          reportEndpoint = self->_reportEndpoint;
          -[UISClickAttribution reportEndpoint](v7, "reportEndpoint");
          v12 = (NSURL *)objc_claimAutoreleasedReturnValue();
          if (reportEndpoint == v12 || -[NSURL isEqual:](reportEndpoint, "isEqual:", v12))
          {
            sourceDescription = self->_sourceDescription;
            -[UISClickAttribution sourceDescription](v7, "sourceDescription");
            v14 = (NSString *)objc_claimAutoreleasedReturnValue();
            if (sourceDescription == v14 || -[NSString isEqual:](sourceDescription, "isEqual:", v14))
            {
              purchaser = self->_purchaser;
              -[UISClickAttribution purchaser](v7, "purchaser");
              v16 = (NSString *)objc_claimAutoreleasedReturnValue();
              if (purchaser == v16 || -[NSString isEqual:](purchaser, "isEqual:", v16))
              {
                eventMessage = self->_eventMessage;
                -[UISClickAttribution eventMessage](v7, "eventMessage");
                v18 = (BKSHIDEventAuthenticationMessage *)objc_claimAutoreleasedReturnValue();
                if (eventMessage == v18)
                  v19 = 1;
                else
                  v19 = -[BKSHIDEventAuthenticationMessage isEqual:](eventMessage, "isEqual:", v18);

              }
              else
              {
                v19 = 0;
              }

            }
            else
            {
              v19 = 0;
            }

          }
          else
          {
            v19 = 0;
          }

        }
        else
        {
          v19 = 0;
        }

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v21.receiver = self;
      v21.super_class = (Class)UISClickAttribution;
      v19 = -[UISClickAttribution isEqual:](&v21, sel_isEqual_, v4);
    }
  }

  return v19;
}

- (unint64_t)hash
{
  uint64_t sourceIdentifier;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;

  sourceIdentifier = self->_sourceIdentifier;
  v4 = -[NSURL hash](self->_destinationURL, "hash") ^ sourceIdentifier;
  v5 = -[NSURL hash](self->_reportEndpoint, "hash");
  v6 = v4 ^ v5 ^ -[NSString hash](self->_sourceDescription, "hash");
  v7 = -[NSString hash](self->_purchaser, "hash");
  return v6 ^ v7 ^ -[BKSHIDEventAuthenticationMessage hash](self->_eventMessage, "hash");
}

- (unsigned)sourceIdentifier
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

- (BKSHIDEventAuthenticationMessage)eventMessage
{
  return self->_eventMessage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventMessage, 0);
  objc_storeStrong((id *)&self->_purchaser, 0);
  objc_storeStrong((id *)&self->_sourceDescription, 0);
  objc_storeStrong((id *)&self->_reportEndpoint, 0);
  objc_storeStrong((id *)&self->_destinationURL, 0);
}

@end
