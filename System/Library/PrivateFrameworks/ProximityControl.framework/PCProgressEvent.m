@implementation PCProgressEvent

- (PCProgressEvent)initWithEventType:(int64_t)a3
{
  PCProgressEvent *v4;
  PCProgressEvent *v5;
  PCProgressEvent *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PCProgressEvent;
  v4 = -[PCProgressEvent init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_eventType = a3;
    v6 = v4;
  }

  return v5;
}

- (PCProgressEvent)initWithError:(id)a3
{
  id v5;
  PCProgressEvent *v6;
  PCProgressEvent *v7;
  PCProgressEvent *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProgressEvent;
  v6 = -[PCProgressEvent init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_error, a3);
    v7->_eventType = 0;
    v8 = v7;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *mediaRemoteID;
  NSError *v8;
  NSString *v9;
  NSError *v10;
  int v11;
  BOOL v12;
  void *v13;
  NSError *error;
  NSError *v15;
  int v16;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "mediaRemoteID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    mediaRemoteID = self->_mediaRemoteID;
    v8 = v6;
    v9 = mediaRemoteID;
    if (v8 == (NSError *)v9)
    {

    }
    else
    {
      v10 = (NSError *)v9;
      if ((v8 == 0) == (v9 != 0))
        goto LABEL_12;
      v11 = -[NSError isEqual:](v8, "isEqual:", v9);

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

LABEL_15:
      v12 = objc_msgSend(v5, "eventType") == self->_eventType;
      goto LABEL_16;
    }
    v10 = v15;
    if ((v8 == 0) != (v15 != 0))
    {
      v16 = -[NSError isEqual:](v8, "isEqual:", v15);

      if (v16)
        goto LABEL_15;
LABEL_13:
      v12 = 0;
LABEL_16:

      goto LABEL_17;
    }
LABEL_12:

    goto LABEL_13;
  }
  v12 = 0;
LABEL_17:

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
  int64_t eventType;
  NSString *mediaRemoteID;
  id v8;

  v4 = a3;
  error = self->_error;
  v8 = v4;
  if (error)
  {
    objc_msgSend(v4, "encodeObject:forKey:", error, CFSTR("er"));
    v4 = v8;
  }
  eventType = self->_eventType;
  if (eventType)
  {
    objc_msgSend(v8, "encodeInteger:forKey:", eventType, CFSTR("et"));
    v4 = v8;
  }
  mediaRemoteID = self->_mediaRemoteID;
  if (mediaRemoteID)
  {
    objc_msgSend(v8, "encodeObject:forKey:", mediaRemoteID, CFSTR("mrID"));
    v4 = v8;
  }

}

- (PCProgressEvent)initWithCoder:(id)a3
{
  id v4;
  PCProgressEvent *v5;
  id v6;
  id v7;
  PCProgressEvent *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PCProgressEvent;
  v5 = -[PCProgressEvent init](&v10, sel_init);
  if (v5)
  {
    objc_opt_class();
    NSDecodeObjectIfPresent();
    v6 = v4;
    if (objc_msgSend(v6, "containsValueForKey:", CFSTR("et")))
      v5->_eventType = objc_msgSend(v6, "decodeIntegerForKey:", CFSTR("et"));

    v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    v8 = v5;
  }

  return v5;
}

- (id)description
{
  unint64_t eventType;
  const __CFString *v3;

  eventType = self->_eventType;
  if (eventType > 2)
    v3 = CFSTR("?");
  else
    v3 = off_24CCF65D8[eventType];
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@"), v3);
}

- (NSError)error
{
  return self->_error;
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)mediaRemoteID
{
  return self->_mediaRemoteID;
}

- (void)setMediaRemoteID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaRemoteID, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end
