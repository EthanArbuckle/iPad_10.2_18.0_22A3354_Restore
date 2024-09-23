@implementation PKSEConsistencyCheckDeviceCredentialAppletProperties

- (PKSEConsistencyCheckDeviceCredentialAppletProperties)init
{

  return 0;
}

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  const __CFString *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_locked)
    v5 = CFSTR("Y");
  else
    v5 = CFSTR("N");
  objc_msgSend(v3, "appendFormat:", CFSTR("isLocked: '%@'; "), v5);
  if (self->_container)
    v6 = CFSTR("Y");
  else
    v6 = CFSTR("N");
  objc_msgSend(v4, "appendFormat:", CFSTR("isContainer: '%@'; "), v6);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

- (BOOL)isLocked
{
  return self->_locked;
}

- (BOOL)isContainer
{
  return self->_container;
}

@end
