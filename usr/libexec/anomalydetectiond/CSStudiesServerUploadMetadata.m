@implementation CSStudiesServerUploadMetadata

- (CSStudiesServerUploadMetadata)initWithPayloadType:(id)a3 channel:(id)a4 keyValuePairs:(id)a5
{
  id v9;
  id v10;
  id v11;
  CSStudiesServerUploadMetadata *v12;
  CSStudiesServerUploadMetadata *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSStudiesServerUploadMetadata;
  v12 = -[CSStudiesServerUploadMetadata init](&v15, "init");
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_payloadType, a3);
    objc_storeStrong((id *)&v13->_channel, a4);
    objc_storeStrong((id *)&v13->_keyValuePairs, a5);
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploadMetadata payloadType](self, "payloadType"));
  objc_msgSend(v7, "encodeObject:forKey:", v4, CFSTR("kCSStudiesServerUploadMetadataPayloadTypeEncoderKey"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploadMetadata channel](self, "channel"));
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("kCSStudiesServerUploadMetadataChannelEncoderKey"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploadMetadata keyValuePairs](self, "keyValuePairs"));
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("kCSStudiesServerUploadMetadataKetValyePairsEncoderKey"));

}

- (CSStudiesServerUploadMetadata)initWithCoder:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  NSSet *v10;
  void *v11;
  void *v12;
  CSStudiesServerUploadMetadata *v13;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kCSStudiesServerUploadMetadataPayloadTypeEncoderKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("kCSStudiesServerUploadMetadataChannelEncoderKey"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_opt_class(NSDictionary);
  v10 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v9, objc_opt_class(NSString), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("kCSStudiesServerUploadMetadataKetValyePairsEncoderKey")));
  v13 = -[CSStudiesServerUploadMetadata initWithPayloadType:channel:keyValuePairs:](self, "initWithPayloadType:channel:keyValuePairs:", v6, v8, v12);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)payloadType
{
  return self->_payloadType;
}

- (NSString)channel
{
  return self->_channel;
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void)setKeyValuePairs:(id)a3
{
  objc_storeStrong((id *)&self->_keyValuePairs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
  objc_storeStrong((id *)&self->_channel, 0);
  objc_storeStrong((id *)&self->_payloadType, 0);
}

@end
