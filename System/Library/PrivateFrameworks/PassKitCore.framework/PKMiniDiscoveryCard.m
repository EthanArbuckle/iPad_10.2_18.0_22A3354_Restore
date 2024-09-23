@implementation PKMiniDiscoveryCard

- (PKMiniDiscoveryCard)initWithDictionary:(id)a3
{
  id v4;
  PKMiniDiscoveryCard *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PKMiniDiscoveryCard;
  v5 = -[PKDiscoveryCard initWithDictionary:](&v8, sel_initWithDictionary_, v4);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("miniCardTemplateType"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_miniCardTemplateType = PKDiscoveryMiniCardTemplateTypeFromString(v6);

  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  v5 = -[PKDiscoveryCard isEqual:](&v7, sel_isEqual_, v4)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && self->_miniCardTemplateType == v4[14];

  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMiniDiscoveryCard;
  v3 = -[PKDiscoveryCard hash](&v5, sel_hash);
  return self->_miniCardTemplateType - v3 + 32 * v3;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  -[PKDiscoveryCard description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR(" %@ "), v4);

  objc_msgSend(v3, "appendFormat:", CFSTR("%@: '%ld'; "), CFSTR("miniCardTemplateType"), self->_miniCardTemplateType);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKMiniDiscoveryCard;
  v4 = a3;
  -[PKDiscoveryCard encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_miniCardTemplateType, CFSTR("miniCardTemplateType"), v5.receiver, v5.super_class);

}

- (PKMiniDiscoveryCard)initWithCoder:(id)a3
{
  id v4;
  PKMiniDiscoveryCard *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKMiniDiscoveryCard;
  v5 = -[PKDiscoveryCard initWithCoder:](&v7, sel_initWithCoder_, v4);
  if (v5)
    v5->_miniCardTemplateType = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("miniCardTemplateType"));

  return v5;
}

- (int64_t)miniCardTemplateType
{
  return self->_miniCardTemplateType;
}

@end
