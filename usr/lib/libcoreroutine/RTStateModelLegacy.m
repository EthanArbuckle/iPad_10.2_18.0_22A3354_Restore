@implementation RTStateModelLegacy

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stateModelLut, CFSTR("stateModelLut"));

}

- (RTStateModelLegacy)initWithCoder:(id)a3
{
  id v4;
  RTStateModelLegacy *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *stateModelLut;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)RTStateModelLegacy;
  v5 = -[RTStateModelLegacy init](&v13, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("version")))
      v5->_version = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("version"));
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("stateModelLut"));
    v10 = objc_claimAutoreleasedReturnValue();
    stateModelLut = v5->_stateModelLut;
    v5->_stateModelLut = (NSMutableDictionary *)v10;

  }
  return v5;
}

- (id)description
{
  void *v3;
  int64_t v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[RTStateModelLegacy version](self, "version");
  -[RTStateModelLegacy stateModelLut](self, "stateModelLut");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("version, %lu, states, %lu"), v4, objc_msgSend(v5, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (int64_t)version
{
  return self->_version;
}

- (void)setVersion:(int64_t)a3
{
  self->_version = a3;
}

- (NSMutableDictionary)stateModelLut
{
  return self->_stateModelLut;
}

- (void)setStateModelLut:(id)a3
{
  objc_storeStrong((id *)&self->_stateModelLut, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateModelLut, 0);
}

@end
