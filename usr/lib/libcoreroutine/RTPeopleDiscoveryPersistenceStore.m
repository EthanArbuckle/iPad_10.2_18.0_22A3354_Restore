@implementation RTPeopleDiscoveryPersistenceStore

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  RTPeopleDiscoveryContactRecord *contactRecord;
  id v5;

  contactRecord = self->_contactRecord;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", contactRecord, CFSTR("ContactRecord"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_densityRecord, CFSTR("DensityRecord"));

}

- (RTPeopleDiscoveryPersistenceStore)initWithContactRecord:(id)a3 densityRecord:(id)a4
{
  id v6;
  id v7;
  RTPeopleDiscoveryPersistenceStore *v8;
  RTPeopleDiscoveryPersistenceStore *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)RTPeopleDiscoveryPersistenceStore;
  v8 = -[RTPeopleDiscoveryPersistenceStore init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[RTPeopleDiscoveryPersistenceStore setContactRecord:](v8, "setContactRecord:", v6);
    -[RTPeopleDiscoveryPersistenceStore setDensityRecord:](v9, "setDensityRecord:", v7);
  }

  return v9;
}

- (BOOL)isEqual:(id)a3
{
  RTPeopleDiscoveryPersistenceStore *v4;
  RTPeopleDiscoveryPersistenceStore *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (RTPeopleDiscoveryPersistenceStore *)a3;
  if (self == v4)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[RTPeopleDiscoveryPersistenceStore contactRecord](self, "contactRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTPeopleDiscoveryPersistenceStore contactRecord](v5, "contactRecord");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqual:", v7))
      {
        -[RTPeopleDiscoveryPersistenceStore densityRecord](self, "densityRecord");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTPeopleDiscoveryPersistenceStore densityRecord](v5, "densityRecord");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqual:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (RTPeopleDiscoveryPersistenceStore)initWithCoder:(id)a3
{
  id v4;
  RTPeopleDiscoveryPersistenceStore *v5;
  uint64_t v6;
  RTPeopleDiscoveryContactRecord *contactRecord;
  uint64_t v8;
  RTPeopleDensityRecord *densityRecord;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RTPeopleDiscoveryPersistenceStore;
  v5 = -[RTPeopleDiscoveryPersistenceStore init](&v11, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("ContactRecord"));
    v6 = objc_claimAutoreleasedReturnValue();
    contactRecord = v5->_contactRecord;
    v5->_contactRecord = (RTPeopleDiscoveryContactRecord *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("DensityRecord"));
    v8 = objc_claimAutoreleasedReturnValue();
    densityRecord = v5->_densityRecord;
    v5->_densityRecord = (RTPeopleDensityRecord *)v8;

  }
  return v5;
}

- (RTPeopleDiscoveryContactRecord)contactRecord
{
  return self->_contactRecord;
}

- (void)setContactRecord:(id)a3
{
  objc_storeStrong((id *)&self->_contactRecord, a3);
}

- (RTPeopleDensityRecord)densityRecord
{
  return self->_densityRecord;
}

- (void)setDensityRecord:(id)a3
{
  objc_storeStrong((id *)&self->_densityRecord, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_densityRecord, 0);
  objc_storeStrong((id *)&self->_contactRecord, 0);
}

@end
