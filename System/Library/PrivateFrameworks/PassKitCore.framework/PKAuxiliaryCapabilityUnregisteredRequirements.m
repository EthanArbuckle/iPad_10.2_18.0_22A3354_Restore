@implementation PKAuxiliaryCapabilityUnregisteredRequirements

- (PKAuxiliaryCapabilityUnregisteredRequirements)initWithDictionary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PKAuxiliaryCapabilityUnregisteredRequirements *v7;
  PKAuxiliaryCapabilityUnregisteredRequirements *v8;
  id *p_isa;
  objc_super v11;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "PKStringForKey:", CFSTR("dpanIdentifier"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("requirementIdentifiers"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 0;
    if (v5 && v6)
    {
      v11.receiver = self;
      v11.super_class = (Class)PKAuxiliaryCapabilityUnregisteredRequirements;
      v8 = -[PKAuxiliaryCapabilityUnregisteredRequirements init](&v11, sel_init);
      p_isa = (id *)&v8->super.isa;
      if (v8)
      {
        objc_storeStrong((id *)&v8->_dpanIdentifier, v5);
        objc_storeStrong(p_isa + 2, v6);
      }
      self = p_isa;
      v7 = self;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)dpanIdentifier
{
  return self->_dpanIdentifier;
}

- (NSArray)requirementIdentifiers
{
  return self->_requirementIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirementIdentifiers, 0);
  objc_storeStrong((id *)&self->_dpanIdentifier, 0);
}

@end
