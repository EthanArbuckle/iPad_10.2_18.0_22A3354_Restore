@implementation UIDraggingSystemTouchRoutingPolicy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UIDraggingSystemTouchRoutingPolicy)initWithCoder:(id)a3
{
  id v4;
  UIDraggingSystemTouchRoutingPolicy *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSDictionary *contextIDsToAlwaysSendTouchesByDisplayIdentifier;
  void *v12;
  uint64_t v13;
  NSArray *contextIDsToExcludeFromHitTesting;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)UIDraggingSystemTouchRoutingPolicy;
  v5 = -[UIDraggingSystemTouchRoutingPolicy init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_opt_class();
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v8, objc_opt_class(), v6, v7, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("contextIDsToAlwaysSendTouchesByDisplayIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    contextIDsToAlwaysSendTouchesByDisplayIdentifier = v5->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
    v5->_contextIDsToAlwaysSendTouchesByDisplayIdentifier = (NSDictionary *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", v6, v7, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("contextIDsToExcludeFromHitTesting"));
    v13 = objc_claimAutoreleasedReturnValue();
    contextIDsToExcludeFromHitTesting = v5->_contextIDsToExcludeFromHitTesting;
    v5->_contextIDsToExcludeFromHitTesting = (NSArray *)v13;

    v5->_hitTestingDisabled = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("hitTestingDisabled"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSDictionary *contextIDsToAlwaysSendTouchesByDisplayIdentifier;
  id v5;

  contextIDsToAlwaysSendTouchesByDisplayIdentifier = self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contextIDsToAlwaysSendTouchesByDisplayIdentifier, CFSTR("contextIDsToAlwaysSendTouchesByDisplayIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_contextIDsToExcludeFromHitTesting, CFSTR("contextIDsToExcludeFromHitTesting"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_hitTestingDisabled, CFSTR("hitTestingDisabled"));

}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;

  -[NSObject _ui_descriptionBuilder](self, "_ui_descriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier)
  {
    -[UIDraggingSystemTouchRoutingPolicy contextIDsToAlwaysSendTouchesByDisplayIdentifier](self, "contextIDsToAlwaysSendTouchesByDisplayIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contextIDsToAlwaysSendTouchesByDisplayIdentifier"), v4);

  }
  if (self->_contextIDsToExcludeFromHitTesting)
  {
    -[UIDraggingSystemTouchRoutingPolicy contextIDsToExcludeFromHitTesting](self, "contextIDsToExcludeFromHitTesting");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contextIDsToExcludeFromHitTesting"), v6);

  }
  v8 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("hitTestingDisabled"), -[UIDraggingSystemTouchRoutingPolicy isHitTestingDisabled](self, "isHitTestingDisabled"));
  objc_msgSend(v3, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)contextIDsToAlwaysSendTouchesByDisplayIdentifier
{
  return self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier;
}

- (void)setContextIDsToAlwaysSendTouchesByDisplayIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)contextIDsToExcludeFromHitTesting
{
  return self->_contextIDsToExcludeFromHitTesting;
}

- (void)setContextIDsToExcludeFromHitTesting:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isHitTestingDisabled
{
  return self->_hitTestingDisabled;
}

- (void)setHitTestingDisabled:(BOOL)a3
{
  self->_hitTestingDisabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextIDsToExcludeFromHitTesting, 0);
  objc_storeStrong((id *)&self->_contextIDsToAlwaysSendTouchesByDisplayIdentifier, 0);
}

@end
