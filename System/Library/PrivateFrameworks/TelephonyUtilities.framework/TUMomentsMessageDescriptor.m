@implementation TUMomentsMessageDescriptor

- (TUMomentsMessageDescriptor)initWithMessageUUID:(id)a3 videoURL:(id)a4 thumbnailURL:(id)a5
{
  id v9;
  id v10;
  id v11;
  TUMomentsMessageDescriptor *v12;
  TUMomentsMessageDescriptor *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)TUMomentsMessageDescriptor;
  v12 = -[TUMomentsMessageDescriptor init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_messageUUID, a3);
    objc_storeStrong((id *)&v13->_videoURL, a4);
    objc_storeStrong((id *)&v13->_thumbnailURL, a5);
  }

  return v13;
}

- (TUMomentsMessageDescriptor)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  TUMomentsMessageDescriptor *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_messageUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_videoURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_thumbnailURL);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[TUMomentsMessageDescriptor initWithMessageUUID:videoURL:thumbnailURL:](self, "initWithMessageUUID:videoURL:thumbnailURL:", v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[TUMomentsMessageDescriptor messageUUID](self, "messageUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_messageUUID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[TUMomentsMessageDescriptor videoURL](self, "videoURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_videoURL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[TUMomentsMessageDescriptor thumbnailURL](self, "thumbnailURL");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_thumbnailURL);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSUUID)messageUUID
{
  return self->_messageUUID;
}

- (TUSandboxExtendedURL)videoURL
{
  return self->_videoURL;
}

- (TUSandboxExtendedURL)thumbnailURL
{
  return self->_thumbnailURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailURL, 0);
  objc_storeStrong((id *)&self->_videoURL, 0);
  objc_storeStrong((id *)&self->_messageUUID, 0);
}

@end
