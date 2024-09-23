@implementation PKSEConsistencyCheckDeviceCredentialISO18013Properties

- (PKSEConsistencyCheckDeviceCredentialISO18013Properties)init
{

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_hasKeyMeterial)
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("hasKeyMaterial: '%@'; "), v5);
  objc_msgSend(v4, "appendFormat:", CFSTR("isoIdentifier: '%@'; "), self->_isoIdentifier);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)hasKeyMeterial
{
  return self->_hasKeyMeterial;
}

- (NSString)isoIdentifier
{
  return self->_isoIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isoIdentifier, 0);
}

@end
