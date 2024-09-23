@implementation SKPseudonyms

- (SKPseudonyms)initWithIDSService:(id)a3
{
  id v4;
  SKPseudonyms *v5;
  uint64_t v6;
  IDSService *service;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SKPseudonyms;
  v5 = -[SKPseudonyms init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE4FCB8]), "initWithService:", v4);
    service = v5->_service;
    v5->_service = (IDSService *)v6;

  }
  return v5;
}

- (id)pseudonymForPseudonymURI:(id)a3
{
  return (id)-[IDSService pseudonymForPseudonymURI:](self->_service, "pseudonymForPseudonymURI:", a3);
}

- (id)pseudonymsForMaskedURI:(id)a3
{
  return (id)-[IDSService pseudonymsForMaskedURI:](self->_service, "pseudonymsForMaskedURI:", a3);
}

- (id)pseudonymsForMaskedURI:(id)a3 matchingProperties:(id)a4
{
  IDSService *service;
  id v7;
  void *v8;
  void *v9;

  service = self->_service;
  v7 = a3;
  -[SKPseudonyms propertiesWithUpdatedServices:](self, "propertiesWithUpdatedServices:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IDSService pseudonymsForMaskedURI:matchingProperties:](service, "pseudonymsForMaskedURI:matchingProperties:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)provisionPseudonymWithProperties:(id)a3 completion:(id)a4
{
  IDSService *service;
  id v7;
  id v8;

  service = self->_service;
  v7 = a4;
  -[SKPseudonyms propertiesWithUpdatedServices:](self, "propertiesWithUpdatedServices:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymWithProperties:completion:](service, "provisionPseudonymWithProperties:completion:", v8, v7);

}

- (void)provisionPseudonymWithProperties:(id)a3 requestProperties:(id)a4 completion:(id)a5
{
  IDSService *service;
  id v9;
  id v10;
  id v11;

  service = self->_service;
  v9 = a5;
  v10 = a4;
  -[SKPseudonyms propertiesWithUpdatedServices:](self, "propertiesWithUpdatedServices:", a3);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymWithProperties:requestProperties:completion:](service, "provisionPseudonymWithProperties:requestProperties:completion:", v11, v10, v9);

}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 completion:(id)a5
{
  IDSService *service;
  id v9;
  id v10;
  id v11;

  service = self->_service;
  v9 = a5;
  v10 = a3;
  -[SKPseudonyms propertiesWithUpdatedServices:](self, "propertiesWithUpdatedServices:", a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymForURI:withProperties:completion:](service, "provisionPseudonymForURI:withProperties:completion:", v10, v11, v9);

}

- (void)provisionPseudonymForURI:(id)a3 withProperties:(id)a4 requestProperties:(id)a5 completion:(id)a6
{
  IDSService *service;
  id v11;
  id v12;
  id v13;
  id v14;

  service = self->_service;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  -[SKPseudonyms propertiesWithUpdatedServices:](self, "propertiesWithUpdatedServices:", a4);
  v14 = (id)objc_claimAutoreleasedReturnValue();
  -[IDSService provisionPseudonymForURI:withProperties:requestProperties:completion:](service, "provisionPseudonymForURI:withProperties:requestProperties:completion:", v13, v14, v12, v11);

}

- (void)renewPseudonym:(id)a3 forUpdatedDuration:(double)a4 completion:(id)a5
{
  -[IDSService renewPseudonym:forUpdatedDuration:completion:](self->_service, "renewPseudonym:forUpdatedDuration:completion:", a3, a5, a4);
}

- (void)revokePseudonym:(id)a3 completion:(id)a4
{
  -[IDSService revokePseudonym:completion:](self->_service, "revokePseudonym:completion:", a3, a4);
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 scopeID:(id)a4 expiryDurationInSeconds:(double)a5
{
  return (id)-[IDSService pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:](self->_service, "pseudonymPropertiesWithFeatureID:scopeID:expiryDurationInSeconds:", a3, a4, a5);
}

- (id)pseudonymPropertiesWithFeatureID:(id)a3 expiryDurationInSeconds:(double)a4
{
  return (id)-[IDSService pseudonymPropertiesWithFeatureID:expiryDurationInSeconds:](self->_service, "pseudonymPropertiesWithFeatureID:expiryDurationInSeconds:", a3, a4);
}

- (id)propertiesWithUpdatedServices:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (objc_class *)MEMORY[0x24BDBCEF0];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "allowedServices");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = v7;
  else
    v9 = MEMORY[0x24BDBD1A8];
  v10 = (void *)objc_msgSend(v6, "initWithArray:", v9);

  -[IDSService serviceIdentifier](self->_service, "serviceIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v11);

  objc_msgSend(v10, "addObject:", CFSTR("com.apple.private.alloy.status.keysharing"));
  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "withUpdatedAllowedServices:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
