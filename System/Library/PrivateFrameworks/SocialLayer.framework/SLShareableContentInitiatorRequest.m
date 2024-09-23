@implementation SLShareableContentInitiatorRequest

- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3
{
  return -[SLShareableContentInitiatorRequest initWithFileURL:containerSetupInfo:collaborationMetadata:](self, "initWithFileURL:containerSetupInfo:collaborationMetadata:", a3, 0, 0);
}

- (SLShareableContentInitiatorRequest)initWithContainerSetupInfo:(id)a3
{
  return -[SLShareableContentInitiatorRequest initWithFileURL:containerSetupInfo:collaborationMetadata:](self, "initWithFileURL:containerSetupInfo:collaborationMetadata:", 0, a3, 0);
}

- (SLShareableContentInitiatorRequest)initWithCollaborationMetadata:(id)a3
{
  return -[SLShareableContentInitiatorRequest initWithFileURL:containerSetupInfo:collaborationMetadata:](self, "initWithFileURL:containerSetupInfo:collaborationMetadata:", 0, 0, a3);
}

- (SLShareableContentInitiatorRequest)initWithFileURL:(id)a3 containerSetupInfo:(id)a4 collaborationMetadata:(id)a5
{
  id v9;
  id v10;
  id v11;
  SLShareableContentInitiatorRequest *v12;
  SLShareableContentInitiatorRequest *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SLShareableContentInitiatorRequest;
  v12 = -[SLShareableContentInitiatorRequest init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_fileURL, a3);
    objc_storeStrong((id *)&v13->_containerSetupInfo, a4);
    objc_storeStrong((id *)&v13->_collaborationMetadata, a5);
  }

  return v13;
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@ %p"), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SLShareableContentInitiatorRequest fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" fileURL=%@"), v4);

  -[SLShareableContentInitiatorRequest containerSetupInfo](self, "containerSetupInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" containerSetupInfo=%@"), v5);

  -[SLShareableContentInitiatorRequest collaborationMetadata](self, "collaborationMetadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" collaborationMetadata=%@"), v6);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v3, "copy");

  return (NSString *)v7;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (SLShareableContentInitiatorRequest)initWithBSXPCCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id CKContainerSetupInfoClass_0;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SLShareableContentInitiatorRequest *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CKContainerSetupInfoClass_0 = getCKContainerSetupInfoClass_0();
  NSStringFromSelector(sel_containerSetupInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", CKContainerSetupInfoClass_0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_collaborationMetadata);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SLShareableContentInitiatorRequest initWithFileURL:containerSetupInfo:collaborationMetadata:](self, "initWithFileURL:containerSetupInfo:collaborationMetadata:", v7, v10, v13);
  return v14;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  -[SLShareableContentInitiatorRequest fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentInitiatorRequest containerSetupInfo](self, "containerSetupInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerSetupInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentInitiatorRequest collaborationMetadata](self, "collaborationMetadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationMetadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLShareableContentInitiatorRequest)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id CKContainerSetupInfoClass_0;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  SLShareableContentInitiatorRequest *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  CKContainerSetupInfoClass_0 = getCKContainerSetupInfoClass_0();
  NSStringFromSelector(sel_containerSetupInfo);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", CKContainerSetupInfoClass_0, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_collaborationMetadata);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[SLShareableContentInitiatorRequest initWithFileURL:containerSetupInfo:collaborationMetadata:](self, "initWithFileURL:containerSetupInfo:collaborationMetadata:", v7, v10, v13);
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
  -[SLShareableContentInitiatorRequest fileURL](self, "fileURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_fileURL);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, v6);

  -[SLShareableContentInitiatorRequest containerSetupInfo](self, "containerSetupInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_containerSetupInfo);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, v8);

  -[SLShareableContentInitiatorRequest collaborationMetadata](self, "collaborationMetadata");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_collaborationMetadata);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, v9);

}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (CKContainerSetupInfo)containerSetupInfo
{
  return self->_containerSetupInfo;
}

- (_SWCollaborationMetadata)collaborationMetadata
{
  return self->_collaborationMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collaborationMetadata, 0);
  objc_storeStrong((id *)&self->_containerSetupInfo, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
