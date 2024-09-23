@implementation TUMomentsRawVideoMessageDescriptor

- (TUMomentsRawVideoMessageDescriptor)initWithUUID:(id)a3 videoURL:(id)a4
{
  id v7;
  id v8;
  TUMomentsRawVideoMessageDescriptor *v9;
  TUMomentsRawVideoMessageDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)TUMomentsRawVideoMessageDescriptor;
  v9 = -[TUMomentsRawVideoMessageDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_uuid, a3);
    objc_storeStrong((id *)&v10->_videoURL, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[TUMomentsRawVideoMessageDescriptor uuid](self, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUMomentsRawVideoMessageDescriptor videoURL](self, "videoURL");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_videoURL);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, v7);

}

- (TUMomentsRawVideoMessageDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  TUMomentsRawVideoMessageDescriptor *v12;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_uuid);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_videoURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v11 = v10 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v12 = 0;
  }
  else
  {
    self = -[TUMomentsRawVideoMessageDescriptor initWithUUID:videoURL:](self, "initWithUUID:videoURL:", v7, v10);
    v12 = self;
  }

  return v12;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (TUSandboxExtendedURL)videoURL
{
  return self->_videoURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

@end
