@implementation TUContinuityHandleAnonym

- (TUContinuityHandleAnonym)initWithIdentifier:(id)a3 label:(id)a4 localizedDisplayName:(id)a5 type:(int64_t)a6
{
  id v11;
  id v12;
  id v13;
  TUContinuityHandleAnonym *v14;
  TUContinuityHandleAnonym *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TUContinuityHandleAnonym;
  v14 = -[TUContinuityHandleAnonym init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_identifier, a3);
    objc_storeStrong((id *)&v15->_label, a4);
    objc_storeStrong((id *)&v15->_localizedDisplayName, a5);
    v15->_type = a6;
  }

  return v15;
}

- (NSString)localizedDisplayName
{
  NSString *v3;

  if (-[NSString length](self->_label, "length"))
  {
    objc_msgSend(MEMORY[0x1E0C97338], "localizedStringForLabel:", self->_label);
    v3 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = self->_localizedDisplayName;
  }
  return v3;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR(" label=%@"), self->_label);
  objc_msgSend(v6, "appendFormat:", CFSTR(" localizedDisplayName=%@"), self->_localizedDisplayName);
  objc_msgSend(v6, "appendFormat:", CFSTR(" type=%ld"), self->_type);
  objc_msgSend(v6, "appendFormat:", CFSTR(" identifier=%@"), self->_identifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityHandleAnonym)initWithCoder:(id)a3
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
  TUContinuityHandleAnonym *v16;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(sel_label);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  NSStringFromSelector(sel_localizedDisplayName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_type);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v4, "decodeIntegerForKey:", v14);

  v16 = -[TUContinuityHandleAnonym initWithIdentifier:label:localizedDisplayName:type:](self, "initWithIdentifier:label:localizedDisplayName:type:", v7, v10, v13, v15);
  return v16;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  NSString *label;
  void *v8;
  NSString *localizedDisplayName;
  void *v10;
  int64_t type;
  id v12;

  identifier = self->_identifier;
  v5 = a3;
  NSStringFromSelector(sel_identifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", identifier, v6);

  label = self->_label;
  NSStringFromSelector(sel_label);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", label, v8);

  localizedDisplayName = self->_localizedDisplayName;
  NSStringFromSelector(sel_localizedDisplayName);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", localizedDisplayName, v10);

  type = self->_type;
  NSStringFromSelector(sel_type);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeInteger:forKey:", type, v12);

}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSString)label
{
  return self->_label;
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_localizedDisplayName, 0);
}

@end
