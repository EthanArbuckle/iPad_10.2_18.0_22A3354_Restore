@implementation _UICursorAccessory

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t style;
  id v5;

  style = self->_style;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", style, CFSTR("style"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_interactive, CFSTR("interactive"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_large, CFSTR("large"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_identifier, CFSTR("identifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("preferredWidth"), self->_preferredWidth);
  objc_msgSend(v5, "encodeObject:forKey:", self->_groupIdentifier, CFSTR("groupIdentifier"));

}

- (unint64_t)hash
{
  unint64_t preferredWidth;
  NSUInteger v4;

  preferredWidth = (unint64_t)self->_preferredWidth;
  v4 = -[NSString hash](self->_identifier, "hash");
  return v4 ^ -[NSString hash](self->_groupIdentifier, "hash") ^ preferredWidth;
}

- (_UICursorAccessory)initWithCoder:(id)a3
{
  id v4;
  _UICursorAccessory *v5;
  double v6;
  uint64_t v7;
  NSString *identifier;
  uint64_t v9;
  NSString *groupIdentifier;

  v4 = a3;
  v5 = -[_UICursorAccessory init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("preferredWidth"));
    v5->_preferredWidth = v6;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
    v7 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("groupIdentifier"));
    v9 = objc_claimAutoreleasedReturnValue();
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v9;

    v5->_interactive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("interactive"));
    v5->_large = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("large"));
    v5->_style = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("style"));
  }

  return v5;
}

- (id)descriptionBuilder
{
  void *v3;
  id v4;
  NSString *identifier;
  NSString *groupIdentifier;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendFloat:withName:", CFSTR("preferredWidth"), self->_preferredWidth);
  identifier = self->_identifier;
  if (identifier)
    objc_msgSend(v3, "appendString:withName:", identifier, CFSTR("identifier"));
  groupIdentifier = self->_groupIdentifier;
  if (groupIdentifier)
    objc_msgSend(v3, "appendString:withName:", groupIdentifier, CFSTR("groupIdentifier"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  _UICursorAccessory *v4;
  _UICursorAccessory *v5;
  uint64_t v6;
  unint64_t v7;
  BOOL v8;

  v4 = (_UICursorAccessory *)a3;
  if (v4 == self)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[_UICursorAccessory style](v5, "style");
      if (v6 == -[_UICursorAccessory style](self, "style"))
      {
        v7 = -[_UICursorAccessory hash](self, "hash");
        v8 = v7 == -[_UICursorAccessory hash](v5, "hash");
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }
  }

  return v8;
}

- (id)description
{
  void *v2;
  void *v3;

  -[_UICursorAccessory descriptionBuilder](self, "descriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_inputModeCursorAccessory
{
  return 0;
}

- (id)_dictationCursorAccessory
{
  return 0;
}

- (id)_modifierKeyCursorAccessory
{
  return 0;
}

- (id)_deleteCursorAccessory
{
  return 0;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (void)setGroupIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (double)preferredWidth
{
  return self->_preferredWidth;
}

- (void)setPreferredWidth:(double)a3
{
  self->_preferredWidth = a3;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)setInteractive:(BOOL)a3
{
  self->_interactive = a3;
}

- (BOOL)isLarge
{
  return self->_large;
}

- (void)setLarge:(BOOL)a3
{
  self->_large = a3;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
