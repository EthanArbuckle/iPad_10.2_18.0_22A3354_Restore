@implementation SBSQuickActionControlRequest

- (SBSQuickActionControlRequest)initWithExtensionBundleIdentifier:(id)a3 containerBundleIdentifier:(id)a4 kind:(id)a5 quickActionCategory:(unint64_t)a6 type:(unint64_t)a7 location:(int64_t)a8
{
  id v15;
  id v16;
  id v17;
  SBSQuickActionControlRequest *v18;
  SBSQuickActionControlRequest *v19;
  objc_super v21;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v21.receiver = self;
  v21.super_class = (Class)SBSQuickActionControlRequest;
  v18 = -[SBSQuickActionControlRequest init](&v21, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_extensionBundleIdentifier, a3);
    objc_storeStrong((id *)&v19->_containerBundleIdentifier, a4);
    objc_storeStrong((id *)&v19->_kind, a5);
    v19->_quickActionCategory = a6;
    v19->_type = a7;
    v19->_location = a8;
  }

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:quickActionCategory:type:location:", self->_extensionBundleIdentifier, self->_containerBundleIdentifier, self->_kind, self->_quickActionCategory, self->_type, self->_location);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *extensionBundleIdentifier;
  id v5;

  extensionBundleIdentifier = self->_extensionBundleIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", extensionBundleIdentifier, CFSTR("kSBSQuickActionControlRequestExtensionBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_containerBundleIdentifier, CFSTR("kSBSQuickActionControlRequestContainerBundleIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_kind, CFSTR("kSBSQuickActionControlRequestKind"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_quickActionCategory, CFSTR("kSBSQuickActionControlRequestQuickActionCategory"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("kSBSQuickActionControlRequestType"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_location, CFSTR("SBSQuickActionControlRequestLocation"));

}

- (SBSQuickActionControlRequest)initWithCoder:(id)a3
{
  id v4;
  SBSQuickActionControlRequest *v5;
  uint64_t v6;
  NSString *extensionBundleIdentifier;
  uint64_t v8;
  NSString *containerBundleIdentifier;
  uint64_t v10;
  NSString *kind;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBSQuickActionControlRequest;
  v5 = -[SBSQuickActionControlRequest init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBSQuickActionControlRequestExtensionBundleIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    extensionBundleIdentifier = v5->_extensionBundleIdentifier;
    v5->_extensionBundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBSQuickActionControlRequestContainerBundleIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    containerBundleIdentifier = v5->_containerBundleIdentifier;
    v5->_containerBundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kSBSQuickActionControlRequestKind"));
    v10 = objc_claimAutoreleasedReturnValue();
    kind = v5->_kind;
    v5->_kind = (NSString *)v10;

    v5->_quickActionCategory = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSBSQuickActionControlRequestQuickActionCategory"));
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("kSBSQuickActionControlRequestType"));
    v5->_location = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("SBSQuickActionControlRequestLocation"));
  }

  return v5;
}

- (NSString)extensionBundleIdentifier
{
  return self->_extensionBundleIdentifier;
}

- (NSString)containerBundleIdentifier
{
  return self->_containerBundleIdentifier;
}

- (NSString)kind
{
  return self->_kind;
}

- (unint64_t)quickActionCategory
{
  return self->_quickActionCategory;
}

- (unint64_t)type
{
  return self->_type;
}

- (int64_t)location
{
  return self->_location;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_containerBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
}

@end
