@implementation PKPaymentSetupProductsSectionFactoryContext

+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7
{
  return (id)objc_msgSend(a1, "contextWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:tokenizerCharacterSet:", a3, a4, a5, a6, a7, 0);
}

+ (id)contextWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPrimaryRegion:primaryCountryName:secondaryRegion:secondaryCountryName:location:tokenizerCharacterSet:", v19, v18, v17, v16, v15, v14);

  return v20;
}

- (PKPaymentSetupProductsSectionFactoryContext)initWithPrimaryRegion:(id)a3 primaryCountryName:(id)a4 secondaryRegion:(id)a5 secondaryCountryName:(id)a6 location:(id)a7 tokenizerCharacterSet:(id)a8
{
  id v15;
  id v16;
  id v17;
  PKPaymentSetupProductsSectionFactoryContext *v18;
  PKPaymentSetupProductsSectionFactoryContext *v19;
  id v21;
  id v22;
  id v23;
  objc_super v24;

  v23 = a3;
  v22 = a4;
  v21 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)PKPaymentSetupProductsSectionFactoryContext;
  v18 = -[PKPaymentSetupProductsSectionFactoryContext init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_primaryRegion, a3);
    objc_storeStrong((id *)&v19->_primaryCountryName, a4);
    objc_storeStrong((id *)&v19->_secondaryRegion, a5);
    objc_storeStrong((id *)&v19->_secondaryCountryName, a6);
    objc_storeStrong((id *)&v19->_location, a7);
    objc_storeStrong((id *)&v19->_tokenizerCharacterSet, a8);
  }

  return v19;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("primaryRegion: '%@'; "), self->_primaryRegion);
  objc_msgSend(v6, "appendFormat:", CFSTR("secondaryRegion: '%@'; "), self->_secondaryRegion);
  objc_msgSend(v6, "appendFormat:", CFSTR("location: '%@'; "), self->_location);
  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSString)primaryRegion
{
  return self->_primaryRegion;
}

- (NSString)primaryCountryName
{
  return self->_primaryCountryName;
}

- (NSString)secondaryRegion
{
  return self->_secondaryRegion;
}

- (NSString)secondaryCountryName
{
  return self->_secondaryCountryName;
}

- (CLLocation)location
{
  return self->_location;
}

- (NSCharacterSet)tokenizerCharacterSet
{
  return self->_tokenizerCharacterSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenizerCharacterSet, 0);
  objc_storeStrong((id *)&self->_location, 0);
  objc_storeStrong((id *)&self->_secondaryCountryName, 0);
  objc_storeStrong((id *)&self->_secondaryRegion, 0);
  objc_storeStrong((id *)&self->_primaryCountryName, 0);
  objc_storeStrong((id *)&self->_primaryRegion, 0);
}

@end
