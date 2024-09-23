@implementation MOEventBundleProcessorResult

- (id)init:(id)a3 sourceAppBundleIds:(id)a4 removedAppBundleIds:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOEventBundleProcessorResult *v12;
  id *p_isa;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)MOEventBundleProcessorResult;
  v12 = -[MOEventBundleProcessorResult init](&v15, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_processedBundles, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *processedBundles;
  id v5;

  processedBundles = self->_processedBundles;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", processedBundles, CFSTR("coderKeyMOEventBundleProcessorResultBundles"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_sourceAppBundleIds, CFSTR("coderKeyMOEventBundleProcessorResultSourceBundleIDs"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_removedAppBundleIds, CFSTR("coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs"));

}

- (MOEventBundleProcessorResult)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  MOEventBundleProcessorResult *v6;
  uint64_t v7;
  uint64_t v8;
  NSSet *v9;
  void *v10;
  uint64_t v11;
  NSArray *processedBundles;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSSet *v16;
  void *v17;
  uint64_t v18;
  NSSet *sourceAppBundleIds;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSSet *v23;
  void *v24;
  uint64_t v25;
  NSSet *removedAppBundleIds;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MOEventBundleProcessorResult;
  v6 = -[MOEventBundleProcessorResult init](&v28, "init");
  if (v6)
  {
    v7 = objc_opt_class(NSArray, v5);
    v9 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, objc_opt_class(MOEventBundle, v8), 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v10, CFSTR("coderKeyMOEventBundleProcessorResultBundles")));
    processedBundles = v6->_processedBundles;
    v6->_processedBundles = (NSArray *)v11;

    v14 = objc_opt_class(NSArray, v13);
    v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v14, objc_opt_class(NSString, v15), 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v17, CFSTR("coderKeyMOEventBundleProcessorResultSourceBundleIDs")));
    sourceAppBundleIds = v6->_sourceAppBundleIds;
    v6->_sourceAppBundleIds = (NSSet *)v18;

    v21 = objc_opt_class(NSArray, v20);
    v23 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(NSString, v22), 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v24, CFSTR("coderKeyMOEventBundleProcessorResultSourceRemovedBundleIDs")));
    removedAppBundleIds = v6->_removedAppBundleIds;
    v6->_removedAppBundleIds = (NSSet *)v25;

  }
  return v6;
}

- (NSArray)processedBundles
{
  return self->_processedBundles;
}

- (void)setProcessedBundles:(id)a3
{
  objc_storeStrong((id *)&self->_processedBundles, a3);
}

- (NSSet)sourceAppBundleIds
{
  return self->_sourceAppBundleIds;
}

- (void)setSourceAppBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_sourceAppBundleIds, a3);
}

- (NSSet)removedAppBundleIds
{
  return self->_removedAppBundleIds;
}

- (void)setRemovedAppBundleIds:(id)a3
{
  objc_storeStrong((id *)&self->_removedAppBundleIds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_removedAppBundleIds, 0);
  objc_storeStrong((id *)&self->_sourceAppBundleIds, 0);
  objc_storeStrong((id *)&self->_processedBundles, 0);
}

@end
