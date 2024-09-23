@implementation GKFriendSuggestion

- (GKFriendSuggestion)initWithSuggestion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  GKFriendSuggestion *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= 1)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "recipients"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "_gkPrefixedURIHandle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "handle"));
      self = -[GKFriendSuggestion initWithContactID:handle:prefixedHandle:contactAssociationID:](self, "initWithContactID:handle:prefixedHandle:contactAssociationID:", v11, v12, v10, 0);

      v7 = self;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (GKFriendSuggestion)initWithContactID:(id)a3 handle:(id)a4 prefixedHandle:(id)a5 contactAssociationID:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  GKFriendSuggestion *v15;
  GKFriendSuggestion *v16;
  objc_super v18;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)GKFriendSuggestion;
  v15 = -[GKFriendSuggestion init](&v18, "init");
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_contactID, a3);
    objc_storeStrong((id *)&v16->_handle, a4);
    objc_storeStrong((id *)&v16->_prefixedHandle, a5);
    objc_storeStrong((id *)&v16->_contactAssociationID, a6);
  }

  return v16;
}

- (id)description
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  id v16;
  objc_super v17;

  if (os_log_is_debug_enabled(os_log_GKContacts))
  {
    v4 = objc_opt_class(self, v3);
    v5 = objc_claimAutoreleasedReturnValue(-[GKFriendSuggestion contactID](self, "contactID"));
    v6 = (void *)v5;
    if (v5)
      v7 = (const __CFString *)v5;
    else
      v7 = CFSTR("nil");
    v8 = objc_claimAutoreleasedReturnValue(-[GKFriendSuggestion prefixedHandle](self, "prefixedHandle"));
    v9 = (void *)v8;
    if (v8)
      v10 = (const __CFString *)v8;
    else
      v10 = CFSTR("nil");
    v11 = objc_claimAutoreleasedReturnValue(-[GKFriendSuggestion contactAssociationID](self, "contactAssociationID"));
    v12 = (void *)v11;
    if (v11)
      v13 = (const __CFString *)v11;
    else
      v13 = CFSTR("nil");
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@(%p)(contactID:%@, prefixedHandle:%@, CAID:%@)"), v4, self, v7, v10, v13));

    return v14;
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)GKFriendSuggestion;
    v16 = -[GKFriendSuggestion description](&v17, "description");
    return (id)objc_claimAutoreleasedReturnValue(v16);
  }
}

- (NSString)contactID
{
  return self->_contactID;
}

- (void)setContactID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)handle
{
  return self->_handle;
}

- (void)setHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)prefixedHandle
{
  return self->_prefixedHandle;
}

- (void)setPrefixedHandle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)contactAssociationID
{
  return self->_contactAssociationID;
}

- (void)setContactAssociationID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactAssociationID, 0);
  objc_storeStrong((id *)&self->_prefixedHandle, 0);
  objc_storeStrong((id *)&self->_handle, 0);
  objc_storeStrong((id *)&self->_contactID, 0);
}

@end
