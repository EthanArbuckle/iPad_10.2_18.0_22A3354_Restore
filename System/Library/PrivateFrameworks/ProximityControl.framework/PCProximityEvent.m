@implementation PCProximityEvent

- (PCProximityEvent)initWithType:(int64_t)a3 mediaRemoteID:(id)a4 info:(id)a5
{
  id v9;
  id v10;
  PCProximityEvent *v11;
  PCProximityEvent *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PCProximityEvent;
  v11 = -[PCProximityEvent init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_eventType = a3;
    objc_storeStrong((id *)&v11->_info, a5);
    objc_storeStrong((id *)&v12->_mediaRemoteID, a4);
  }

  return v12;
}

- (PCProximityEvent)initWithError:(id)a3 mediaRemoteID:(id)a4
{
  id v7;
  id v8;
  PCProximityEvent *v9;
  PCProximityEvent *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PCProximityEvent;
  v9 = -[PCProximityEvent init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_error, a3);
    objc_storeStrong((id *)&v10->_mediaRemoteID, a4);
  }

  return v10;
}

- (id)description
{
  unint64_t eventType;
  const __CFString *v4;
  void *v5;
  void *v6;
  NSError *error;
  void *v8;

  eventType = self->_eventType;
  if (eventType > 9)
    v4 = CFSTR("?");
  else
    v4 = *(&off_24CCF68D8 + eventType);
  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("<PCProximityEvent id=%@ type=%@"), self->_mediaRemoteID, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_expectsDisplayContext)
    objc_msgSend(v5, "appendString:", CFSTR(", expects content"));
  if (self->_info)
    objc_msgSend(v6, "appendString:", CFSTR(", info present"));
  error = self->_error;
  if (error)
  {
    -[NSError localizedDescription](error, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "appendFormat:", CFSTR(", error=%@"), v8);

  }
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *mediaRemoteID;
  id v8;
  NSString *v9;
  void *v10;
  int v11;
  char v12;
  void *v13;
  NSError *error;
  NSError *v15;
  int v16;
  void *v18;
  NSDictionary *info;
  NSDictionary *v20;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    if (objc_msgSend(v5, "eventType") != self->_eventType
      || self->_expectsDisplayContext != objc_msgSend(v5, "expectsDisplayContext"))
    {
      goto LABEL_13;
    }
    objc_msgSend(v5, "mediaRemoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    mediaRemoteID = self->_mediaRemoteID;
    v8 = v6;
    v9 = mediaRemoteID;
    if (v8 == v9)
    {

    }
    else
    {
      v10 = v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_20;
      v11 = objc_msgSend(v8, "isEqual:", v9);

      if (!v11)
        goto LABEL_13;
    }
    objc_msgSend(v5, "error");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    error = self->_error;
    v8 = v13;
    v15 = error;
    if (v8 == v15)
    {

    }
    else
    {
      v10 = v15;
      if ((v8 == 0) == (v15 != 0))
        goto LABEL_20;
      v16 = objc_msgSend(v8, "isEqual:", v15);

      if (!v16)
      {
LABEL_13:
        v12 = 0;
LABEL_14:

        goto LABEL_15;
      }
    }
    objc_msgSend(v5, "info");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    info = self->_info;
    v8 = v18;
    v20 = info;
    v10 = v20;
    if (v8 == v20)
    {
      v12 = 1;
      goto LABEL_21;
    }
    if ((v8 == 0) != (v20 != 0))
    {
      v12 = objc_msgSend(v8, "isEqual:", v20);
LABEL_21:

      goto LABEL_14;
    }
LABEL_20:
    v12 = 0;
    goto LABEL_21;
  }
  v12 = 0;
LABEL_15:

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  NSError *error;
  NSDictionary *info;
  NSString *mediaRemoteID;
  id v8;

  v4 = a3;
  error = self->_error;
  v8 = v4;
  if (error)
  {
    objc_msgSend(v4, "encodeObject:forKey:", error, CFSTR("err"));
    v4 = v8;
  }
  if (LODWORD(self->_eventType))
  {
    objc_msgSend(v8, "encodeInteger:forKey:", SLODWORD(self->_eventType), CFSTR("type"));
    v4 = v8;
  }
  if (self->_expectsDisplayContext)
  {
    objc_msgSend(v8, "encodeBool:forKey:", 1, CFSTR("exp"));
    v4 = v8;
  }
  info = self->_info;
  if (info)
  {
    objc_msgSend(v8, "encodeObject:forKey:", info, CFSTR("info"));
    v4 = v8;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    objc_msgSend(v8, "encodeObject:forKey:", mediaRemoteID, CFSTR("mID"));
    v4 = v8;
  }

}

- (PCProximityEvent)initWithCoder:(id)a3
{
  id v4;
  PCProximityEvent *v5;
  id v6;
  id v7;
  id v8;
  objc_super v10;
  uint64_t v11;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProximityEvent;
  v5 = -[PCProximityEvent init](&v10, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v11 = 0;
    if (NSDecodeSInt64RangedIfPresent())
      LODWORD(v5->_eventType) = v11;
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("exp")))
      v5->_expectsDisplayContext = objc_msgSend(v6, "decodeBoolForKey:", CFSTR("exp"));

    v7 = v6;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();

    v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

  }
  return v5;
}

- (NSDictionary)info
{
  return self->_info;
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (BOOL)expectsDisplayContext
{
  return self->_expectsDisplayContext;
}

- (void)setExpectsDisplayContext:(BOOL)a3
{
  self->_expectsDisplayContext = a3;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_info, 0);
}

@end
