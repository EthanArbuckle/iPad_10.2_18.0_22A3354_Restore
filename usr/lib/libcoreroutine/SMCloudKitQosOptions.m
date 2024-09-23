@implementation SMCloudKitQosOptions

- (SMCloudKitQosOptions)initWithDefaultQos:(BOOL)a3 masqueradeBundleID:(id)a4 xpcActivity:(id)a5
{
  id v9;
  id v10;
  SMCloudKitQosOptions *v11;
  SMCloudKitQosOptions *v12;
  objc_super v14;

  v9 = a4;
  v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)SMCloudKitQosOptions;
  v11 = -[SMCloudKitQosOptions init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_defaultQos = a3;
    objc_storeStrong((id *)&v11->_masqueradeBundleID, a4);
    objc_storeStrong((id *)&v12->_xpcActivity, a5);
  }

  return v12;
}

- (BOOL)defaultQos
{
  return self->_defaultQos;
}

- (NSString)masqueradeBundleID
{
  return self->_masqueradeBundleID;
}

- (OS_xpc_object)xpcActivity
{
  return self->_xpcActivity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcActivity, 0);
  objc_storeStrong((id *)&self->_masqueradeBundleID, 0);
}

@end
