@implementation TUNearbySuggestion

- (TUNearbySuggestion)initWithIdentifier:(id)a3 deviceHandle:(id)a4 activity:(id)a5 type:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  TUNearbySuggestion *v14;
  TUNearbySuggestion *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUNearbySuggestion;
  v14 = -[TUNearbySuggestion init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_deviceHandle, a4);
    objc_storeStrong((id *)&v15->_activity, a5);
    v15->_type = a6;
  }

  return v15;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  int64_t type;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier=%@"), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(" deviceHandle=%@"), self->_deviceHandle);
  objc_msgSend(v6, "appendFormat:", CFSTR(" activity=%@"), self->_activity);
  type = self->_type;
  v8 = CFSTR("pullRequest");
  if (type == 1)
    v8 = CFSTR("intelligentRoutingRecommendation");
  if (type == 2)
    v9 = CFSTR("systemWake");
  else
    v9 = v8;
  objc_msgSend(v6, "appendFormat:", CFSTR(" type=%@"), v9);
  objc_msgSend(v6, "appendString:", CFSTR(">"));
  v10 = (void *)objc_msgSend(v6, "copy");

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUNearbySuggestion)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  TUNearbySuggestion *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_opt_class();
  NSStringFromSelector(sel_deviceHandle);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_opt_class();
  NSStringFromSelector(sel_activity);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  NSStringFromSelector(sel_type);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  v16 = -[TUNearbySuggestion initWithIdentifier:deviceHandle:activity:type:](self, "initWithIdentifier:deviceHandle:activity:type:", v7, v10, v13, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSUUID *identifier;
  id v5;
  void *v6;
  TUNearbyDeviceHandle *deviceHandle;
  void *v8;
  TUConversationActivity *activity;
  void *v10;
  int64_t type;
  id v12;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  deviceHandle = self->_deviceHandle;
  NSStringFromSelector(sel_deviceHandle);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", deviceHandle, v8);

  activity = self->_activity;
  NSStringFromSelector(sel_activity);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", activity, v10);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v12);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0
    && -[TUNearbySuggestion isEqualToSuggestion:](self, "isEqualToSuggestion:", v4);

  return v5;
}

- (BOOL)isEqualToSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[TUNearbySuggestion identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "isEqual:", v6);
  return (char)v4;
}

- (BOOL)isEquivalentToSuggestion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  BOOL v10;

  v4 = a3;
  -[TUNearbySuggestion deviceHandle](self, "deviceHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "deviceHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEquivalentToDeviceHandle:", v6))
  {
    -[TUNearbySuggestion activity](self, "activity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (TUObjectsAreEqualOrNil((unint64_t)v7, (uint64_t)v8))
    {
      v9 = -[TUNearbySuggestion type](self, "type");
      v10 = v9 == objc_msgSend(v4, "type");
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TUNearbySuggestion identifier](self, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (TUNearbyDeviceHandle)deviceHandle
{
  return self->_deviceHandle;
}

- (TUConversationActivity)activity
{
  return self->_activity;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_deviceHandle, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
