@implementation GKFriendSuggesterSettings

- (GKFriendSuggesterSettings)init
{
  return -[GKFriendSuggesterSettings initWithBagValues:](self, "initWithBagValues:", &__NSDictionary0__struct);
}

- (GKFriendSuggesterSettings)initWithBagValues:(id)a3
{
  id v4;
  GKFriendSuggesterSettings *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)GKFriendSuggesterSettings;
  v5 = -[GKFriendSuggesterSettings init](&v7, "init");
  if (v5)
  {
    v5->_mininumIDsForServiceRequest = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-friend-rerank-minimum"), 2);
    v5->_mininumIDsForContactAssociationIDsOnly = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-friend-rerank-caidonly-minimum"), 30);
    v5->_suggestionsLimit = (unint64_t)objc_msgSend(v4, "unsignedIntegerValueFromKey:defaultValue:", CFSTR("gk-friend-rerank-caidonly-minimum"), 30);
  }

  return v5;
}

+ (id)allBagKeys
{
  _QWORD v3[3];

  v3[0] = CFSTR("gk-friend-rerank-minimum");
  v3[1] = CFSTR("gk-friend-rerank-caidonly-minimum");
  v3[2] = CFSTR("gk-friend-rerank-overall-limit");
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  objc_super v10;

  if (os_log_is_debug_enabled(os_log_GKContacts))
  {
    v3 = objc_opt_class(self);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[GKFriendSuggesterSettings mininumIDsForServiceRequest](self, "mininumIDsForServiceRequest")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[GKFriendSuggesterSettings mininumIDsForContactAssociationIDsOnly](self, "mininumIDsForContactAssociationIDsOnly")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[GKFriendSuggesterSettings suggestionsLimit](self, "suggestionsLimit")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%p)(mininumIDsForServiceRequest:%@, mininumIDsForContactAssociationIDsOnly:%@, suggestionsLimit:%@)"), v3, self, v4, v5, v6));

    return v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)GKFriendSuggesterSettings;
    v9 = -[GKFriendSuggesterSettings description](&v10, "description");
    return (id)objc_claimAutoreleasedReturnValue(v9);
  }
}

- (unint64_t)mininumIDsForServiceRequest
{
  return self->_mininumIDsForServiceRequest;
}

- (unint64_t)mininumIDsForContactAssociationIDsOnly
{
  return self->_mininumIDsForContactAssociationIDsOnly;
}

- (unint64_t)suggestionsLimit
{
  return self->_suggestionsLimit;
}

@end
