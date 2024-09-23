@implementation _PSFeedbackAction

+ (id)engagementWithNonSuggestionWithEngagementIdentifier:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithType:suggestion:transportBundleID:", 1, 0, v4);

  return v5;
}

+ (id)engagementWithSharingSuggestion:(id)a3 transportBundleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v8, "initWithType:suggestion:transportBundleID:", 0, v6, v7);
  }
  else
  {
    objc_msgSend(v6, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithType:suggestion:transportBundleID:", 0, v6, v11);

  }
  return v10;
}

+ (id)engagementWithAppSuggestion:(id)a3 transportBundleID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc((Class)a1);
  v9 = v8;
  if (v7)
  {
    v10 = (void *)objc_msgSend(v8, "initWithType:suggestion:transportBundleID:", 4, v6, v7);
  }
  else
  {
    objc_msgSend(v6, "bundleID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v9, "initWithType:suggestion:transportBundleID:", 4, v6, v11);

  }
  return v10;
}

+ (id)abandonment
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithType:suggestion:transportBundleID:", 2, 0, 0);
}

- (_PSFeedbackAction)initWithType:(int64_t)a3 suggestion:(id)a4 transportBundleID:(id)a5
{
  id v9;
  id v10;
  _PSFeedbackAction *v11;
  _PSFeedbackAction *v12;
  uint64_t v13;
  NSString *transportBundleID;
  objc_super v16;

  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)_PSFeedbackAction;
  v11 = -[_PSFeedbackAction init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong((id *)&v11->_suggestion, a4);
    v13 = objc_msgSend(v10, "copy");
    transportBundleID = v12->_transportBundleID;
    v12->_transportBundleID = (NSString *)v13;

  }
  return v12;
}

- (int64_t)type
{
  return self->_type;
}

- (_PSSuggestion)suggestion
{
  return self->_suggestion;
}

- (NSString)transportBundleID
{
  return self->_transportBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transportBundleID, 0);
  objc_storeStrong((id *)&self->_suggestion, 0);
}

@end
