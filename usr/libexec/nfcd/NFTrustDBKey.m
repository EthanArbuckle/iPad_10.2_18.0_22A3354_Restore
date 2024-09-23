@implementation NFTrustDBKey

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NFTrustDBKey)initWithCoder:(id)a3
{
  id v4;
  NFTrustDBKey *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)NFTrustDBKey;
  v5 = -[NFTrustObject initWithCoder:](&v25, "initWithCoder:", v4);
  if (v5)
  {
    v6 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("identifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v7, CFSTR("identifier"));

    v8 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("applicationIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v9, CFSTR("applicationIdentifier"));

    v10 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("instanceAID"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v11, CFSTR("instanceAID"));

    v12 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("slot"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v13, CFSTR("slot"));

    v14 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSString), CFSTR("keyAttestationAuthority"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v15, CFSTR("keyAttestationAuthority"));

    v16 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSData), CFSTR("keyAttestation"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v17, CFSTR("keyAttestation"));

    v18 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterValue"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v19, CFSTR("counterValue"));

    v20 = objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(NSNumber), CFSTR("counterLimit"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v21, CFSTR("counterLimit"));

    v22 = +[NFNSCheckedDecoder coder:decodeArrayOfArrayOfClass:forKey:](NFNSCheckedDecoder, "coder:decodeArrayOfArrayOfClass:forKey:", v4, objc_opt_class(NFTrustLocalValidation), CFSTR("localValidations"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    -[NFTrustDBKey setValue:forKey:](v5, "setValue:forKey:", v23, CFSTR("localValidations"));

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  NSNumber *counterLimit;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  if (self)
  {
    objc_msgSend(v10, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBKey applicationIdentifier](self, "applicationIdentifier"));
    objc_msgSend(v10, "encodeObject:forKey:", v4, CFSTR("applicationIdentifier"));

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBKey instanceAID](self, "instanceAID"));
    objc_msgSend(v10, "encodeObject:forKey:", v5, CFSTR("instanceAID"));

    objc_msgSend(v10, "encodeObject:forKey:", self->_slot, CFSTR("slot"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_keyAttestationAuthority, CFSTR("keyAttestationAuthority"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_keyAttestation, CFSTR("keyAttestation"));
    objc_msgSend(v10, "encodeObject:forKey:", self->_counterValue, CFSTR("counterValue"));
    counterLimit = self->_counterLimit;
  }
  else
  {
    objc_msgSend(v10, "encodeObject:forKey:", 0, CFSTR("identifier"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "applicationIdentifier"));
    objc_msgSend(v10, "encodeObject:forKey:", v8, CFSTR("applicationIdentifier"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(0, "instanceAID"));
    objc_msgSend(v10, "encodeObject:forKey:", v9, CFSTR("instanceAID"));

    objc_msgSend(v10, "encodeObject:forKey:", 0, CFSTR("slot"));
    objc_msgSend(v10, "encodeObject:forKey:", 0, CFSTR("keyAttestationAuthority"));
    objc_msgSend(v10, "encodeObject:forKey:", 0, CFSTR("keyAttestation"));
    objc_msgSend(v10, "encodeObject:forKey:", 0, CFSTR("counterValue"));
    counterLimit = 0;
  }
  objc_msgSend(v10, "encodeObject:forKey:", counterLimit, CFSTR("counterLimit"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NFTrustDBKey localValidations](self, "localValidations"));
  objc_msgSend(v10, "encodeObject:forKey:", v7, CFSTR("localValidations"));

}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (NSString)applicationIdentifier
{
  return self->_applicationIdentifier;
}

- (void)setApplicationIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_applicationIdentifier, a3);
}

- (NSString)instanceAID
{
  return self->_instanceAID;
}

- (void)setInstanceAID:(id)a3
{
  objc_storeStrong((id *)&self->_instanceAID, a3);
}

- (NSArray)localValidations
{
  return self->_localValidations;
}

- (void)setLocalValidations:(id)a3
{
  objc_storeStrong((id *)&self->_localValidations, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localValidations, 0);
  objc_storeStrong((id *)&self->_instanceAID, 0);
  objc_storeStrong((id *)&self->_applicationIdentifier, 0);
  objc_storeStrong((id *)&self->_counterValue, 0);
  objc_storeStrong((id *)&self->_counterLimit, 0);
  objc_storeStrong((id *)&self->_slot, 0);
  objc_storeStrong((id *)&self->_keyAttestation, 0);
  objc_storeStrong((id *)&self->_keyAttestationAuthority, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
