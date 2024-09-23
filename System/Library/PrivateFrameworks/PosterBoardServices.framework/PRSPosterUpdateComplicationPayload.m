@implementation PRSPosterUpdateComplicationPayload

- (PRSPosterUpdateComplicationPayload)initWithComplications:(id)a3
{
  id v4;
  PRSPosterUpdateComplicationPayload *v5;
  uint64_t v6;
  NSArray *complications;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateComplicationPayload;
  v5 = -[PRSPosterUpdatePayload _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithArray:copyItems:", v4, 1);
    complications = v5->_complications;
    v5->_complications = (NSArray *)v6;

  }
  return v5;
}

- (PRSPosterUpdateComplicationPayload)initWithAmbientWidgets:(id)a3
{
  id v4;
  PRSPosterUpdateComplicationPayload *v5;
  uint64_t v6;
  NSDictionary *ambientWidgets;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRSPosterUpdateComplicationPayload;
  v5 = -[PRSPosterUpdatePayload _init](&v9, sel__init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", v4, 1);
    ambientWidgets = v5->_ambientWidgets;
    v5->_ambientWidgets = (NSDictionary *)v6;

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithComplications:", self->_complications);
}

- (PRSPosterUpdateComplicationPayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateComplicationPayload *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *complications;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    objc_opt_self();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("_complications"));
    v9 = objc_claimAutoreleasedReturnValue();
    complications = v5->_complications;
    v5->_complications = (NSArray *)v9;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeObject:forKey:", self->_complications, CFSTR("_complications"));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return (id)-[NSArray copy](self->_complications, "copy");
}

- (NSArray)complications
{
  return self->_complications;
}

- (NSDictionary)ambientWidgets
{
  return self->_ambientWidgets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ambientWidgets, 0);
  objc_storeStrong((id *)&self->_complications, 0);
}

@end
