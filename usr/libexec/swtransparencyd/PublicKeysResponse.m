@implementation PublicKeysResponse

+ (id)descriptor
{
  id v2;
  uint64_t v4;

  v2 = (id)qword_10012A6E8;
  if (!qword_10012A6E8)
  {
    LODWORD(v4) = 28;
    v2 = +[TransparencyGPBDescriptor allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:](TransparencyGPBDescriptor, "allocDescriptorForClass:messageName:fileDescription:fields:fieldCount:storageSize:flags:", PublicKeysResponse, CFSTR("PublicKeysResponse"), &unk_100126088, &off_100126300, 11, 88, v4);
    objc_msgSend(v2, "setupExtraTextInfo:", &unk_1000DB427);
    qword_10012A6E8 = (uint64_t)v2;
  }
  return v2;
}

- (NSDictionary)metadata
{
  return (NSDictionary *)objc_getAssociatedObject(self, CFSTR("metadata"));
}

- (void)setMetadata:(id)a3
{
  objc_setAssociatedObject(self, CFSTR("metadata"), a3, (void *)1);
}

- (void)setMetadataValue:(id)a3 key:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (v9)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PublicKeysResponse metadata](self, "metadata"));
    v8 = objc_msgSend(v7, "mutableCopy");

    if (!v8)
      v8 = objc_alloc_init((Class)NSMutableDictionary);
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);
    -[PublicKeysResponse setMetadata:](self, "setMetadata:", v8);

  }
}

@end
