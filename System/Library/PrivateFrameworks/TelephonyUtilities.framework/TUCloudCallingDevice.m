@implementation TUCloudCallingDevice

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[TUCloudCallingDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCloudCallingDevice modelIdentifier](self, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCloudCallingDevice uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TUCloudCallingDevice linkedUserURIs](self, "linkedUserURIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p name=%@ modelIdentifier=%@ uniqueID=%@ linkedUserURIs=%@ isDefaultPairedDevice=%d supportsRestrictingSecondaryCalling=%d>"), v4, self, v5, v6, v7, v8, -[TUCloudCallingDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"), -[TUCloudCallingDevice supportsRestrictingSecondaryCalling](self, "supportsRestrictingSecondaryCalling"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[TUCloudCallingDevice uniqueID](self, "uniqueID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "uniqueID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqualToString:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TUCloudCallingDevice)initWithCoder:(id)a3
{
  id v4;
  TUCloudCallingDevice *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  v5 = -[TUCloudCallingDevice init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCloudCallingDevice setName:](v5, "setName:", v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modelIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCloudCallingDevice setModelIdentifier:](v5, "setModelIdentifier:", v7);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uniqueID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCloudCallingDevice setUniqueID:](v5, "setUniqueID:", v8);

    v9 = (void *)MEMORY[0x1E0C99E60];
    v10 = objc_opt_class();
    objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v11, CFSTR("linkedUserURIs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TUCloudCallingDevice setLinkedUserURIs:](v5, "setLinkedUserURIs:", v12);

    -[TUCloudCallingDevice setDefaultPairedDevice:](v5, "setDefaultPairedDevice:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("defaultPairedDevice")));
    -[TUCloudCallingDevice setSupportsRestrictingSecondaryCalling:](v5, "setSupportsRestrictingSecondaryCalling:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("supportsRestrictingSecondaryCalling")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[TUCloudCallingDevice name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v4, CFSTR("name"));

  -[TUCloudCallingDevice modelIdentifier](self, "modelIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("modelIdentifier"));

  -[TUCloudCallingDevice uniqueID](self, "uniqueID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v6, CFSTR("uniqueID"));

  -[TUCloudCallingDevice linkedUserURIs](self, "linkedUserURIs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("linkedUserURIs"));

  objc_msgSend(v8, "encodeBool:forKey:", -[TUCloudCallingDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"), CFSTR("defaultPairedDevice"));
  objc_msgSend(v8, "encodeBool:forKey:", -[TUCloudCallingDevice supportsRestrictingSecondaryCalling](self, "supportsRestrictingSecondaryCalling"), CFSTR("supportsRestrictingSecondaryCalling"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  -[TUCloudCallingDevice name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setName:", v5);

  -[TUCloudCallingDevice modelIdentifier](self, "modelIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setModelIdentifier:", v6);

  -[TUCloudCallingDevice uniqueID](self, "uniqueID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUniqueID:", v7);

  -[TUCloudCallingDevice linkedUserURIs](self, "linkedUserURIs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLinkedUserURIs:", v8);

  objc_msgSend(v4, "setDefaultPairedDevice:", -[TUCloudCallingDevice isDefaultPairedDevice](self, "isDefaultPairedDevice"));
  objc_msgSend(v4, "setSupportsRestrictingSecondaryCalling:", -[TUCloudCallingDevice supportsRestrictingSecondaryCalling](self, "supportsRestrictingSecondaryCalling"));
  return v4;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)modelIdentifier
{
  return self->_modelIdentifier;
}

- (void)setModelIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)uniqueID
{
  return self->_uniqueID;
}

- (void)setUniqueID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDefaultPairedDevice
{
  return self->_defaultPairedDevice;
}

- (void)setDefaultPairedDevice:(BOOL)a3
{
  self->_defaultPairedDevice = a3;
}

- (BOOL)supportsRestrictingSecondaryCalling
{
  return self->_supportsRestrictingSecondaryCalling;
}

- (void)setSupportsRestrictingSecondaryCalling:(BOOL)a3
{
  self->_supportsRestrictingSecondaryCalling = a3;
}

- (NSArray)linkedUserURIs
{
  return self->_linkedUserURIs;
}

- (void)setLinkedUserURIs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkedUserURIs, 0);
  objc_storeStrong((id *)&self->_uniqueID, 0);
  objc_storeStrong((id *)&self->_modelIdentifier, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
