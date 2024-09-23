@implementation RBSXPCServiceDefinition

+ (BOOL)supportsRBSXPCSecureCoding
{
  return 1;
}

- (RBSXPCServiceDefinition)initWithRBSXPCCoder:(id)a3
{
  id v4;
  RBSXPCServiceDefinition *v5;
  uint64_t v6;
  NSString *identifier;

  v4 = a3;
  v5 = -[RBSXPCServiceDefinition init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v5->_variant = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_variant"));
    v5->_scope = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("_scope"));
  }

  return v5;
}

- (int64_t)variant
{
  return self->_variant;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)hash
{
  NSUInteger v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -[NSString hash](self->_identifier, "hash");
  v4 = 0xBF58476D1CE4E5B9 * (self->_variant ^ ((unint64_t)self->_variant >> 30));
  v5 = 0xBF58476D1CE4E5B9 * (self->_scope ^ ((unint64_t)self->_scope >> 30));
  v6 = (0x94D049BB133111EBLL * (v4 ^ (v4 >> 27))) ^ (0x94D049BB133111EBLL * (v5 ^ (v5 >> 27)));
  return v6 ^ v3 ^ (v6 >> 31);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  NSString *identifier;
  uint64_t v6;
  void *v7;
  BOOL v8;
  int64_t variant;
  int64_t scope;
  BOOL v11;

  v4 = a3;
  identifier = self->_identifier;
  objc_msgSend(v4, "identifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if ((identifier == (NSString *)v6
     || (identifier ? (v8 = v6 == 0) : (v8 = 1), !v8 && -[NSString isEqual:](identifier, "isEqual:", v6)))
    && (variant = self->_variant, variant == objc_msgSend(v4, "variant")))
  {
    scope = self->_scope;
    v11 = scope == objc_msgSend(v4, "scope");
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)encodeWithRBSXPCCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_variant, CFSTR("_variant"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_scope, CFSTR("_scope"));

}

+ (id)definitionWithIdentifier:(id)a3 variant:(int64_t)a4 scope:(int64_t)a5
{
  id v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;

  v8 = a3;
  v9 = objc_alloc_init((Class)a1);
  v10 = objc_msgSend(v8, "copy");

  v11 = (void *)v9[1];
  v9[1] = v10;

  v9[2] = a4;
  v9[3] = a5;
  return v9;
}

- (NSString)description
{
  unint64_t variant;
  __CFString *v3;
  unint64_t scope;
  __CFString *v5;

  variant = self->_variant;
  if (variant > 3)
    v3 = 0;
  else
    v3 = off_1E2D16CF0[variant];
  scope = self->_scope;
  if (scope > 3)
    v5 = 0;
  else
    v5 = off_1E2D16D10[scope];
  return (NSString *)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%@][%@]"), self->_identifier, v3, v5);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
