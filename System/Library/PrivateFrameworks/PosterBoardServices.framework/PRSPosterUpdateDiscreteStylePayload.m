@implementation PRSPosterUpdateDiscreteStylePayload

- (PRSPosterUpdateDiscreteStylePayload)initWithVariation:(id)a3 saturation:(id)a4 luminance:(id)a5
{
  id v9;
  id v10;
  id v11;
  id *v12;
  PRSPosterUpdateDiscreteStylePayload *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PRSPosterUpdateDiscreteStylePayload;
  v12 = -[PRSPosterUpdatePayload _init](&v15, sel__init);
  v13 = (PRSPosterUpdateDiscreteStylePayload *)v12;
  if (v12)
  {
    objc_storeStrong(v12 + 1, a3);
    objc_storeStrong((id *)&v13->_saturation, a4);
    objc_storeStrong((id *)&v13->_luminance, a5);
  }

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  return (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initWithVariation:saturation:luminance:", self->_variation, self->_saturation, self->_luminance);
}

- (PRSPosterUpdateDiscreteStylePayload)initWithCoder:(id)a3
{
  id v4;
  PRSPosterUpdateDiscreteStylePayload *v5;
  void *v6;
  uint64_t v7;
  NSNumber *luminance;
  void *v9;
  uint64_t v10;
  NSNumber *saturation;
  void *v12;
  uint64_t v13;
  NSNumber *variation;

  v4 = a3;
  v5 = -[PRSPosterUpdatePayload _init](self, "_init");
  if (v5)
  {
    objc_opt_self();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v6, CFSTR("_luminance"));
    v7 = objc_claimAutoreleasedReturnValue();
    luminance = v5->_luminance;
    v5->_luminance = (NSNumber *)v7;

    objc_opt_self();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v9, CFSTR("_saturation"));
    v10 = objc_claimAutoreleasedReturnValue();
    saturation = v5->_saturation;
    v5->_saturation = (NSNumber *)v10;

    objc_opt_self();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", v12, CFSTR("_variation"));
    v13 = objc_claimAutoreleasedReturnValue();
    variation = v5->_variation;
    v5->_variation = (NSNumber *)v13;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSNumber *luminance;
  id v5;

  luminance = self->_luminance;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", luminance, CFSTR("_luminance"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_saturation, CFSTR("_saturation"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_variation, CFSTR("_variation"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)rawValue
{
  return 0;
}

- (NSNumber)variation
{
  return self->_variation;
}

- (NSNumber)saturation
{
  return self->_saturation;
}

- (NSNumber)luminance
{
  return self->_luminance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saturation, 0);
  objc_storeStrong((id *)&self->_luminance, 0);
  objc_storeStrong((id *)&self->_variation, 0);
}

@end
