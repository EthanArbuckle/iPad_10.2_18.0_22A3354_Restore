@implementation BMSyncDevicePeerMetadata

- (BMSyncDevicePeerMetadata)initWithName:(id)a3 model:(id)a4 platform:(int64_t)a5
{
  id v9;
  id v10;
  BMSyncDevicePeerMetadata *v11;
  BMSyncDevicePeerMetadata *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BMSyncDevicePeerMetadata;
  v11 = -[BMSyncDevicePeerMetadata init](&v14, "init");
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_name, a3);
    objc_storeStrong((id *)&v12->_model, a4);
    v12->_platform = a5;
  }

  return v12;
}

+ (id)devicePeerMetadata
{
  BMSyncDevicePeerMetadata *v2;
  void *v3;
  BMSyncDevicePeerMetadata *v4;

  v2 = [BMSyncDevicePeerMetadata alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BMDeviceMetadataUtils osBuildVersion](BMDeviceMetadataUtils, "osBuildVersion"));
  v4 = -[BMSyncDevicePeerMetadata initWithName:model:platform:](v2, "initWithName:model:platform:", 0, v3, +[BMDeviceMetadataUtils platform](BMDeviceMetadataUtils, "platform"));

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  void *v3;
  void *v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  NSString *name;
  NSString *v12;
  int v13;
  BOOL v14;
  NSString *model;
  void *v16;
  id platform;

  v6 = a3;
  v8 = objc_opt_class(BMSyncDevicePeerMetadata, v7);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) == 0)
  {
    v14 = 0;
    goto LABEL_18;
  }
  v9 = v6;
  v10 = v9;
  name = self->_name;
  v12 = name;
  if (!name)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "name"));
    if (!v3)
    {
      v13 = 0;
      goto LABEL_10;
    }
    v12 = self->_name;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "name"));
  if (!-[NSString isEqualToString:](v12, "isEqualToString:", v4))
  {
    v14 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v13 = 1;
LABEL_10:
  model = self->_model;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "model"));
  if (-[NSString isEqual:](model, "isEqual:", v16))
  {
    platform = (id)self->_platform;
    v14 = platform == objc_msgSend(v10, "platform");
  }
  else
  {
    v14 = 0;
  }

  if (v13)
    goto LABEL_14;
LABEL_15:
  if (!name)

LABEL_18:
  return v14;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_name, "hash");
  v4 = -[NSString hash](self->_model, "hash") ^ v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_platform));
  v6 = v4 ^ (unint64_t)objc_msgSend(v5, "hash");

  return v6;
}

- (id)initFromDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  BMSyncDevicePeerMetadata *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  if ((objc_msgSend(v5, "isEqual:", v6) & 1) != 0)
    v7 = 0;
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name")));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("model")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform")));
  v10 = objc_msgSend(v9, "unsignedIntegerValue");

  v11 = -[BMSyncDevicePeerMetadata initWithName:model:platform:](self, "initWithName:model:platform:", v7, v8, v10);
  return v11;
}

- (id)dictionaryRepresentation
{
  NSString *name;
  NSString *v4;
  int64_t platform;
  NSString *model;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("name");
  name = self->_name;
  v4 = name;
  if (!name)
    v4 = (NSString *)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  model = self->_model;
  platform = self->_platform;
  v11[0] = v4;
  v11[1] = model;
  v10[1] = CFSTR("model");
  v10[2] = CFSTR("platform");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", platform));
  v11[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v11, v10, 3));

  if (!name)
  return v8;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)model
{
  return self->_model;
}

- (int64_t)platform
{
  return self->_platform;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
