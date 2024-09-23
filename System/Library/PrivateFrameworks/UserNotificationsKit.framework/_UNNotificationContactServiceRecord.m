@implementation _UNNotificationContactServiceRecord

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSString *bundleIdentifier;
  void *v8;
  _UNNotificationContact *contact;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
LABEL_7:
      v11 = 0;
      goto LABEL_8;
    }
  }
  v5 = v4;
  v6 = v5;
  if (!v5)
    goto LABEL_7;
  bundleIdentifier = self->_bundleIdentifier;
  objc_msgSend(v5, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(bundleIdentifier) = NCIsEqual(bundleIdentifier, v8);

  if (!(_DWORD)bundleIdentifier)
    goto LABEL_7;
  contact = self->_contact;
  objc_msgSend(v6, "contact");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UNNotificationContact isSimilar:](contact, "isSimilar:", v10);

LABEL_8:
  return v11;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[_UNNotificationContact similarHash](self->_contact, "similarHash");
  return -[NSString hash](self->_bundleIdentifier, "hash") + v3;
}

- (_UNNotificationContact)contact
{
  return self->_contact;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

@end
