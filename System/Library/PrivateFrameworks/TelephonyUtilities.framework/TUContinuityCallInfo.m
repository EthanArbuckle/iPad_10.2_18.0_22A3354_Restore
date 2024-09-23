@implementation TUContinuityCallInfo

- (TUContinuityCallInfo)initWithCallIdentifier:(id)a3 callerIdSubstring:(id)a4 displayName:(id)a5
{
  id v8;
  id v9;
  id v10;
  TUContinuityCallInfo *v11;
  uint64_t v12;
  NSString *callIdentifier;
  uint64_t v14;
  NSString *callerIdSubstring;
  uint64_t v16;
  NSString *displayName;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)TUContinuityCallInfo;
  v11 = -[TUContinuityCallInfo init](&v19, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    callIdentifier = v11->_callIdentifier;
    v11->_callIdentifier = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    callerIdSubstring = v11->_callerIdSubstring;
    v11->_callerIdSubstring = (NSString *)v14;

    v16 = objc_msgSend(v10, "copy");
    displayName = v11->_displayName;
    v11->_displayName = (NSString *)v16;

  }
  return v11;
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

  objc_msgSend(v6, "appendFormat:", CFSTR(" callIdentifier=%@"), self->_callIdentifier);
  objc_msgSend(v6, "appendFormat:", CFSTR(" displayName=%@"), self->_displayName);
  objc_msgSend(v6, "appendFormat:", CFSTR(" callerIdSubstring=%@"), self->_callerIdSubstring);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  v7 = (void *)objc_msgSend(v6, "copy");

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUContinuityCallInfo)initWithCoder:(id)a3
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
  TUContinuityCallInfo *v14;

  v4 = a3;
  v5 = objc_opt_class();
  NSStringFromSelector(sel_callIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  NSStringFromSelector(sel_callerIdSubstring);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  NSStringFromSelector(sel_displayName);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = -[TUContinuityCallInfo initWithCallIdentifier:callerIdSubstring:displayName:](self, "initWithCallIdentifier:callerIdSubstring:displayName:", v7, v10, v13);
  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *callIdentifier;
  id v5;
  void *v6;
  NSString *callerIdSubstring;
  void *v8;
  NSString *displayName;
  id v10;

  callIdentifier = self->_callIdentifier;
  v5 = a3;
  NSStringFromSelector(sel_callIdentifier);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callIdentifier, v6);

  callerIdSubstring = self->_callerIdSubstring;
  NSStringFromSelector(sel_callerIdSubstring);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", callerIdSubstring, v8);

  displayName = self->_displayName;
  NSStringFromSelector(sel_displayName);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", displayName, v10);

}

- (NSString)callIdentifier
{
  return self->_callIdentifier;
}

- (NSString)callerIdSubstring
{
  return self->_callerIdSubstring;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_callerIdSubstring, 0);
  objc_storeStrong((id *)&self->_callIdentifier, 0);
}

@end
