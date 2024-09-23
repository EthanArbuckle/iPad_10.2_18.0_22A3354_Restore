@implementation WBSStartPageSectionDescriptor

- (WBSStartPageSectionDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  WBSStartPageSectionDescriptor *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("IsEnabled"));

  if (objc_msgSend(v5, "length"))
  {
    self = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:](self, "initWithIdentifier:enabled:", v5, v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSStartPageSectionDescriptor)initWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  id v5;
  WBSStartPageSectionDescriptor *v6;
  uint64_t v7;
  NSString *identifier;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)WBSStartPageSectionDescriptor;
  v5 = a3;
  v6 = -[WBSStartPageSectionDescriptor init](&v10, sel_init);
  v7 = objc_msgSend(v5, "copy", v10.receiver, v10.super_class);

  identifier = v6->_identifier;
  v6->_identifier = (NSString *)v7;

  v6->_enabled = a4;
  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)dictionaryRepresentation
{
  NSString *identifier;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  identifier = self->_identifier;
  v6[1] = CFSTR("IsEnabled");
  v7[0] = identifier;
  v6[0] = CFSTR("Identifier");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_enabled);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (BOOL)isEqual:(id)a3
{
  WBSStartPageSectionDescriptor *v4;
  WBSStartPageSectionDescriptor *v5;
  BOOL v6;

  v4 = (WBSStartPageSectionDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[NSString isEqualToString:](self->_identifier, "isEqualToString:", v5->_identifier))
        v6 = self->_enabled == v5->_enabled;
      else
        v6 = 0;

    }
    else
    {
      v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  _BOOL8 enabled;

  enabled = self->_enabled;
  return -[NSString hash](self->_identifier, "hash") ^ (enabled - 1);
}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_enabled)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; identifier = %@; enabled = %@>"),
               v4,
               self,
               self->_identifier,
               v5);
}

- (id)sectionWithEnabled:(BOOL)a3
{
  WBSStartPageSectionDescriptor *v3;

  if (self->_enabled == a3)
    v3 = self;
  else
    v3 = (WBSStartPageSectionDescriptor *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithIdentifier:enabled:", self->_identifier, a3);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enabled, CFSTR("IsEnabled"));

}

- (WBSStartPageSectionDescriptor)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  WBSStartPageSectionDescriptor *v6;

  v4 = a3;
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    self = -[WBSStartPageSectionDescriptor initWithIdentifier:enabled:](self, "initWithIdentifier:enabled:", v5, objc_msgSend(v4, "safari_BOOLForKey:", CFSTR("IsEnabled")));
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

@end
