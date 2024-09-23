@implementation IMDocumentFragmentFilter

- (IMDocumentFragmentFilter)initWithDocument:(id)a3 filterSpecification:(id *)a4
{
  id v6;
  IMDocumentFragmentFilter *v7;
  IMDocumentFragmentFilter *v8;
  __int128 v9;
  IMBloomFilter *v10;
  id v11;
  void *v12;
  IMBloomFilter *v13;
  IMBloomFilter *filter;
  _QWORD v16[4];
  IMDocumentFragmentFilter *v17;
  __int128 v18;
  int64_t numberOfHashFunctions;
  objc_super v20;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMDocumentFragmentFilter;
  v7 = -[IMDocumentFragmentFilter init](&v20, "init");
  v8 = v7;
  if (v7)
  {
    v9 = *(_OWORD *)&a4->var0.var2;
    *(_OWORD *)&v7->_specification.bloomFilterSpecification.expectedNumberOfInsertions = *(_OWORD *)&a4->var0.var0;
    *(_OWORD *)&v7->_specification.bloomFilterSpecification.numberOfHashFunctions = v9;
    v10 = [IMBloomFilter alloc];
    v11 = IMBloomFilterCharacterHashProvider();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v18 = *(_OWORD *)&v8->_specification.bloomFilterSpecification.expectedNumberOfInsertions;
    numberOfHashFunctions = v8->_specification.bloomFilterSpecification.numberOfHashFunctions;
    v13 = -[IMBloomFilter initWithSpecification:hashProvider:](v10, "initWithSpecification:hashProvider:", &v18, v12);
    filter = v8->_filter;
    v8->_filter = v13;

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_FF834;
    v16[3] = &unk_291180;
    v17 = v8;
    IMWithAccessToCharacters(v6, v16);

  }
  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  $D17E2B1FF93C96A0ED10EA4F53971FE6 *p_specification;
  id v5;

  p_specification = &self->_specification;
  v5 = a3;
  objc_msgSend(v5, "encodeBytes:length:forKey:", p_specification, 32, CFSTR("specification"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_filter, CFSTR("filter"));

}

- (IMDocumentFragmentFilter)initWithCoder:(id)a3
{
  id v4;
  IMDocumentFragmentFilter *v5;
  id v6;
  _OWORD *v7;
  __int128 v8;
  id v9;
  uint64_t v10;
  IMBloomFilter *filter;
  uint64_t v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IMDocumentFragmentFilter;
  v5 = -[IMDocumentFragmentFilter init](&v14, "init");
  if (v5)
  {
    v13 = 0;
    v6 = objc_retainAutorelease(v4);
    v7 = objc_msgSend(v6, "decodeBytesForKey:returnedLength:", CFSTR("specification"), &v13);
    v8 = v7[1];
    *(_OWORD *)&v5->_specification.bloomFilterSpecification.expectedNumberOfInsertions = *v7;
    *(_OWORD *)&v5->_specification.bloomFilterSpecification.numberOfHashFunctions = v8;
    v9 = objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(IMBloomFilter), CFSTR("filter"));
    v10 = objc_claimAutoreleasedReturnValue(v9);
    filter = v5->_filter;
    v5->_filter = (IMBloomFilter *)v10;

  }
  return v5;
}

- (BOOL)mightContainFragment:(id)a3
{
  id v4;
  char v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  v5 = 1;
  if ((uint64_t)objc_msgSend(v4, "length") >= self->_specification.windowWidth)
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_FFA94;
    v7[3] = &unk_2911A8;
    v7[4] = self;
    v7[5] = &v8;
    IMWithAccessToCharacters(v4, v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }

  return v5;
}

- (int64_t)indexSize
{
  return -[IMBloomFilter indexSize](self->_filter, "indexSize");
}

- (NSString)usageDescription
{
  return -[IMBloomFilter usageDescription](self->_filter, "usageDescription");
}

- (void)dealloc
{
  IMBloomFilter *filter;
  objc_super v4;

  filter = self->_filter;
  self->_filter = 0;

  v4.receiver = self;
  v4.super_class = (Class)IMDocumentFragmentFilter;
  -[IMDocumentFragmentFilter dealloc](&v4, "dealloc");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filter, 0);
}

@end
