@implementation ICRemoteCameraDeviceProxy

- (ICRemoteCameraDeviceProxy)initWithPrimaryIdentifierString:(id)a3 uuidString:(id)a4 localizedName:(id)a5
{
  id v9;
  id v10;
  id v11;
  ICRemoteCameraDeviceProxy *v12;
  ICRemoteCameraDeviceProxy *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)ICRemoteCameraDeviceProxy;
  v12 = -[ICRemoteCameraDeviceProxy init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_primaryIdentifierString, a3);
    objc_storeStrong((id *)&v13->_uuidString, a4);
    objc_storeStrong((id *)&v13->_localizedName, a5);
  }

  return v13;
}

- (NSDictionary)deviceContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[3];
  _QWORD v9[3];

  v8[0] = CFSTR("ICDevicePrimaryIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceProxy primaryIdentifierString](self, "primaryIdentifierString"));
  v9[0] = v3;
  v8[1] = CFSTR("ICDeviceHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceProxy uuidString](self, "uuidString"));
  v9[1] = v4;
  v8[2] = CFSTR("ICDeviceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceProxy localizedName](self, "localizedName"));
  v9[2] = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v9, v8, 3));

  return (NSDictionary *)v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICRemoteCameraDeviceProxy camera](self, "camera"));
  objc_msgSend(v3, "setDelegate:", 0);

  -[ICRemoteCameraDeviceProxy setCamera:](self, "setCamera:", 0);
  -[ICRemoteCameraDeviceProxy setUuidString:](self, "setUuidString:", 0);
  -[ICRemoteCameraDeviceProxy setLocalizedName:](self, "setLocalizedName:", 0);
  v4.receiver = self;
  v4.super_class = (Class)ICRemoteCameraDeviceProxy;
  -[ICRemoteCameraDeviceProxy dealloc](&v4, "dealloc");
}

- (NSString)uuidString
{
  return self->_uuidString;
}

- (void)setUuidString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)primaryIdentifierString
{
  return self->_primaryIdentifierString;
}

- (void)setPrimaryIdentifierString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)localizedName
{
  return self->_localizedName;
}

- (void)setLocalizedName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (ICRemoteCameraDevice)camera
{
  return self->_camera;
}

- (void)setCamera:(id)a3
{
  objc_storeStrong((id *)&self->_camera, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_camera, 0);
  objc_storeStrong((id *)&self->_localizedName, 0);
  objc_storeStrong((id *)&self->_primaryIdentifierString, 0);
  objc_storeStrong((id *)&self->_uuidString, 0);
}

@end
