@implementation TPSDiscoverabilityTip

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TPSDiscoverabilityTip)initWithCoder:(id)a3
{
  id v4;
  TPSDiscoverabilityTip *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSDictionary *preconditions;
  objc_super v12;
  _QWORD v13[6];

  v13[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TPSDiscoverabilityTip;
  v5 = -[TPSTip initWithCoder:](&v12, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v13[0] = objc_opt_class();
    v13[1] = objc_opt_class();
    v13[2] = objc_opt_class();
    v13[3] = objc_opt_class();
    v13[4] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("preconditions"));
    v9 = objc_claimAutoreleasedReturnValue();
    preconditions = v5->_preconditions;
    v5->_preconditions = (NSDictionary *)v9;

    v5->_localContent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("localContent"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSDiscoverabilityTip;
  v4 = a3;
  -[TPSTip encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_preconditions, CFSTR("preconditions"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeBool:forKey:", self->_localContent, CFSTR("localContent"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TPSDiscoverabilityTip;
  v4 = -[TPSTip copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPreconditions:", self->_preconditions);
  objc_msgSend(v4, "setLocalContent:", self->_localContent);
  return v4;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  NSDictionary *preconditions;
  objc_super v8;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v8.receiver = self;
  v8.super_class = (Class)TPSDiscoverabilityTip;
  -[TPSTip debugDescription](&v8, sel_debugDescription);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %d\n"), CFSTR("localContent"), self->_localContent);
  preconditions = self->_preconditions;
  if (preconditions)
    objc_msgSend(v5, "appendFormat:", CFSTR(" %@ = %@\n"), CFSTR("preconditions"), preconditions);
  return v5;
}

- (BOOL)isLocalContent
{
  return self->_localContent;
}

- (void)setLocalContent:(BOOL)a3
{
  self->_localContent = a3;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
  objc_storeStrong((id *)&self->_attributedString, a3);
}

- (NSDictionary)preconditions
{
  return self->_preconditions;
}

- (void)setPreconditions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preconditions, 0);
  objc_storeStrong((id *)&self->_attributedString, 0);
}

@end
