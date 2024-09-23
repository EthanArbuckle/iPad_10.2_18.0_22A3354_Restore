@implementation VISearchResult

- (VISearchResult)initWithRegionOfInterestResults:(id)a3
{
  id v4;
  VISearchResult *v5;
  uint64_t v6;
  NSArray *regionOfInterestResults;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VISearchResult;
  v5 = -[VISearchResult init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    regionOfInterestResults = v5->_regionOfInterestResults;
    v5->_regionOfInterestResults = (NSArray *)v6;

  }
  return v5;
}

- (VISearchResult)initWithRegionOfInterestResults:(id)a3 userFeedbackPayload:(id)a4
{
  id v6;
  id v7;
  VISearchResult *v8;
  uint64_t v9;
  NSArray *regionOfInterestResults;
  uint64_t v11;
  NSData *userFeedbackPayload;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VISearchResult;
  v8 = -[VISearchResult init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    regionOfInterestResults = v8->_regionOfInterestResults;
    v8->_regionOfInterestResults = (NSArray *)v9;

    v11 = objc_msgSend(v7, "copy");
    userFeedbackPayload = v8->_userFeedbackPayload;
    v8->_userFeedbackPayload = (NSData *)v11;

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v10;
  void *v11;
  NSArray *regionOfInterestResults;
  void *v13;
  uint64_t v15;
  uint64_t v16;

  if (a3 == self)
    return 1;
  v15 = v5;
  v16 = v3;
  v10 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v10;
  else
    v11 = 0;
  regionOfInterestResults = self->_regionOfInterestResults;
  objc_msgSend(v11, "regionOfInterestResults", v6, v15, v4, v16, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(regionOfInterestResults) = VIObjectIsEqual((unint64_t)regionOfInterestResults, (uint64_t)v13);

  return (char)regionOfInterestResults;
}

- (unint64_t)hash
{
  return -[NSArray hash](self->_regionOfInterestResults, "hash");
}

+ (id)empty
{
  VISearchResult *v2;

  v2 = [VISearchResult alloc];
  return -[VISearchResult initWithRegionOfInterestResults:](v2, "initWithRegionOfInterestResults:", MEMORY[0x1E0C9AA60]);
}

- (NSArray)regionOfInterestResults
{
  return self->_regionOfInterestResults;
}

- (NSData)userFeedbackPayload
{
  return self->_userFeedbackPayload;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userFeedbackPayload, 0);
  objc_storeStrong((id *)&self->_regionOfInterestResults, 0);
}

@end
