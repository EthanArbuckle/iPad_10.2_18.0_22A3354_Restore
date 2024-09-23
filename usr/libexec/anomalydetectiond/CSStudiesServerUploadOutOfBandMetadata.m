@implementation CSStudiesServerUploadOutOfBandMetadata

- (CSStudiesServerUploadOutOfBandMetadata)initWithLookingBack:(double)a3 keyValuePairs:(id)a4
{
  id v7;
  CSStudiesServerUploadOutOfBandMetadata *v8;
  CSStudiesServerUploadOutOfBandMetadata *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSStudiesServerUploadOutOfBandMetadata;
  v8 = -[CSStudiesServerUploadOutOfBandMetadata init](&v11, "init");
  v9 = v8;
  if (v8)
  {
    v8->_lookBack = a3;
    objc_storeStrong((id *)&v8->_keyValuePairs, a4);
  }

  return v9;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[CSStudiesServerUploadOutOfBandMetadata lookBack](self, "lookBack");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("kCSStudiesServerUploadOOBMetadataLookBackKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CSStudiesServerUploadOutOfBandMetadata keyValuePairs](self, "keyValuePairs"));
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("kCSStudiesServerUploadOOBMetadataKeyValuePairsEncoderKey"));

}

- (CSStudiesServerUploadOutOfBandMetadata)initWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  uint64_t v7;
  NSSet *v8;
  void *v9;
  void *v10;
  CSStudiesServerUploadOutOfBandMetadata *v11;

  v4 = a3;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("kCSStudiesServerUploadOOBMetadataLookBackKey"));
  v6 = v5;
  v7 = objc_opt_class(NSDictionary);
  v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(NSString), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("kCSStudiesServerUploadOOBMetadataKeyValuePairsEncoderKey")));
  v11 = -[CSStudiesServerUploadOutOfBandMetadata initWithLookingBack:keyValuePairs:](self, "initWithLookingBack:keyValuePairs:", v10, v6);

  return v11;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)lookBack
{
  return self->_lookBack;
}

- (NSDictionary)keyValuePairs
{
  return self->_keyValuePairs;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyValuePairs, 0);
}

@end
