@implementation PPBaseFeedback

- (BOOL)isMapped
{
  return -[NSString length](self->_mappingId, "length") != 0;
}

- (PPBaseFeedback)initWithFeedbackItems:(id)a3 mappingId:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  PPBaseFeedback *v11;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bundleIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PPBaseFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:](self, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v7, v8, 0, v10, v6);

  return v11;
}

- (PPBaseFeedback)initWithFeedbackItems:(id)a3 timestamp:(id)a4 clientIdentifier:(id)a5 clientBundleId:(id)a6 mappingId:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  PPBaseFeedback *v17;
  PPBaseFeedback *v18;
  id v20;
  objc_super v21;

  v20 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)PPBaseFeedback;
  v17 = -[PPBaseFeedback init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_feedbackItems, a3);
    objc_storeStrong((id *)&v18->_timestamp, a4);
    objc_storeStrong((id *)&v18->_clientIdentifier, a5);
    objc_storeStrong((id *)&v18->_clientBundleId, a6);
    objc_storeStrong((id *)&v18->_mappingId, a7);
  }

  return v18;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;

  v3 = -[NSArray hash](self->_feedbackItems, "hash");
  v4 = -[NSDate hash](self->_timestamp, "hash") - v3 + 32 * v3;
  v5 = -[NSString hash](self->_clientIdentifier, "hash") - v4 + 32 * v4;
  v6 = -[NSString hash](self->_clientBundleId, "hash") - v5 + 32 * v5;
  return -[NSString hash](self->_mappingId, "hash") - v6 + 32 * v6;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *feedbackItems;
  id v5;

  feedbackItems = self->_feedbackItems;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", feedbackItems, CFSTR("feedbackItems"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_timestamp, CFSTR("timestamp"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientIdentifier, CFSTR("clientIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_clientBundleId, CFSTR("clientBundleId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mappingId, CFSTR("mappingId"));

}

- (PPBaseFeedback)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PPBaseFeedback *v14;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = (void *)MEMORY[0x18D7805AC]();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", v6, v5, 0);
  objc_autoreleasePoolPop(v7);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("feedbackItems"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timestamp"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientIdentifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("clientBundleId"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mappingId"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  if (v9 && v10)
  {
    self = -[PPBaseFeedback initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:](self, "initWithFeedbackItems:timestamp:clientIdentifier:clientBundleId:mappingId:", v9, v10, v11, v12, v13);
    v14 = self;
  }

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  PPBaseFeedback *v4;
  PPBaseFeedback *v5;
  BOOL v6;

  v4 = (PPBaseFeedback *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPBaseFeedback isEqualToPPBaseFeedback:](self, "isEqualToPPBaseFeedback:", v5);

  return v6;
}

- (BOOL)isEqualToPPBaseFeedback:(id)a3
{
  id *v4;
  id *v5;
  NSArray *feedbackItems;
  NSArray *v7;
  NSArray *v8;
  NSArray *v9;
  char v10;
  NSDate *timestamp;
  NSDate *v12;
  NSDate *v13;
  NSDate *v14;
  char v15;
  NSString *clientIdentifier;
  NSString *v17;
  NSString *v18;
  NSString *v19;
  char v20;
  NSString *clientBundleId;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  char v25;
  char v26;
  NSString *v28;
  NSString *v29;

  v4 = (id *)a3;
  v5 = v4;
  if (!v4)
    goto LABEL_16;
  feedbackItems = self->_feedbackItems;
  v7 = (NSArray *)v4[2];
  if (feedbackItems == v7)
  {

  }
  else
  {
    v8 = v7;
    v9 = feedbackItems;
    v10 = -[NSArray isEqual:](v9, "isEqual:", v8);

    if ((v10 & 1) == 0)
      goto LABEL_16;
  }
  timestamp = self->_timestamp;
  v12 = (NSDate *)v5[5];
  if (timestamp == v12)
  {

  }
  else
  {
    v13 = v12;
    v14 = timestamp;
    v15 = -[NSDate isEqual:](v14, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_16;
  }
  clientIdentifier = self->_clientIdentifier;
  v17 = (NSString *)v5[1];
  if (clientIdentifier == v17)
  {

  }
  else
  {
    v18 = v17;
    v19 = clientIdentifier;
    v20 = -[NSString isEqual:](v19, "isEqual:", v18);

    if ((v20 & 1) == 0)
      goto LABEL_16;
  }
  clientBundleId = self->_clientBundleId;
  v22 = (NSString *)v5[3];
  if (clientBundleId == v22)
  {

  }
  else
  {
    v23 = v22;
    v24 = clientBundleId;
    v25 = -[NSString isEqual:](v24, "isEqual:", v23);

    if ((v25 & 1) == 0)
    {
LABEL_16:
      v26 = 0;
      goto LABEL_17;
    }
  }
  v28 = self->_mappingId;
  v29 = v28;
  if (v28 == v5[4])
    v26 = 1;
  else
    v26 = -[NSString isEqual:](v28, "isEqual:");

LABEL_17:
  return v26;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@: {"), v5);

  objc_msgSend(v3, "appendFormat:", CFSTR("  clientIdentifier : %@, "), self->_clientIdentifier);
  objc_msgSend(v3, "appendFormat:", CFSTR("  clientBundleId : %@, "), self->_clientBundleId);
  objc_msgSend(v3, "appendFormat:", CFSTR("  mappingId : %@, "), self->_mappingId);
  objc_msgSend(v3, "appendFormat:", CFSTR("  timestamp : %@, "), self->_timestamp);
  objc_msgSend(v3, "appendString:", CFSTR("  feedbackItems : ["));
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_feedbackItems;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v3, "appendFormat:", CFSTR("%@, "), *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  objc_msgSend(v3, "appendString:", CFSTR("] }"));
  v11 = (void *)objc_msgSend(v3, "copy");

  return v11;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_clientIdentifier, a3);
}

- (NSArray)feedbackItems
{
  return self->_feedbackItems;
}

- (NSString)clientBundleId
{
  return self->_clientBundleId;
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_clientBundleId, 0);
  objc_storeStrong((id *)&self->_feedbackItems, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
