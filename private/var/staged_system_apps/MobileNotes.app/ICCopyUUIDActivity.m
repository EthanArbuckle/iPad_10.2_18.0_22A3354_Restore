@implementation ICCopyUUIDActivity

- (ICCopyUUIDActivity)initWithUUIDString:(id)a3
{
  id v5;
  ICCopyUUIDActivity *v6;
  ICCopyUUIDActivity *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ICCopyUUIDActivity;
  v6 = -[ICCopyUUIDActivity init](&v9, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_uuidString, a3);

  return v7;
}

- (id)activityImage
{
  return +[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("tag"));
}

- (id)activityTitle
{
  return CFSTR("Copy UUID (Internal)");
}

- (id)activityType
{
  return CFSTR("com.apple.mobilenotes.copyUUID");
}

- (void)performActivityWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, uint64_t, void *);

  v7 = (void (**)(id, uint64_t, void *))a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICCopyUUIDActivity uuidString](self, "uuidString"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIPasteboard generalPasteboard](UIPasteboard, "generalPasteboard"));
  objc_msgSend(v5, "setString:", v4);

  -[ICCopyUUIDActivity activityDidFinish:](self, "activityDidFinish:", 1);
  if (v7)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICCopyUUIDActivity activityType](self, "activityType"));
    v7[2](v7, 1, v6);

  }
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
