@implementation PKPaymentSetupProductRegionData

- (PKPaymentSetupProductRegionData)initWithRegionDataDictionary:(id)a3
{
  id v4;
  void *v5;
  PKPaymentSetupProductRegionData *v6;
  double v7;
  void *v8;
  uint64_t v9;
  NSArray *inclusionaryZones;
  void *v11;
  uint64_t v12;
  NSArray *exclusionaryZones;
  PKPaymentSetupProductRegionData *v14;
  objc_super v16;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPaymentSetupProductRegionData;
    v6 = -[PKPaymentSetupProductRegionData init](&v16, sel_init);
    if (v6)
    {
      v6->_persistent = objc_msgSend(v5, "PKBoolForKey:", CFSTR("isPersistent"));
      v6->_priority = objc_msgSend(v5, "PKIntegerForKey:", CFSTR("priority"));
      objc_msgSend(v5, "PKDoubleForKey:", CFSTR("maximumMatchingDistance"));
      v6->_maximumMatchingDistance = v7;
      objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("inclusionaryZones"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupProductRegionData _boundaryDataFromList:](v6, "_boundaryDataFromList:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      inclusionaryZones = v6->_inclusionaryZones;
      v6->_inclusionaryZones = (NSArray *)v9;

      objc_msgSend(v5, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("exclusionaryZones"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPaymentSetupProductRegionData _boundaryDataFromList:](v6, "_boundaryDataFromList:", v11);
      v12 = objc_claimAutoreleasedReturnValue();
      exclusionaryZones = v6->_exclusionaryZones;
      v6->_exclusionaryZones = (NSArray *)v12;

    }
    self = v6;
    v14 = self;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_boundaryDataFromList:(id)a3
{
  return (id)objc_msgSend(a3, "pk_arrayByApplyingBlock:", &__block_literal_global_223);
}

uint64_t __57__PKPaymentSetupProductRegionData__boundaryDataFromList___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_191_2);
}

PKPaymentSetupProductRegionDataCoordinate *__57__PKPaymentSetupProductRegionData__boundaryDataFromList___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  PKPaymentSetupProductRegionDataCoordinate *v3;

  v2 = a2;
  v3 = -[PKPaymentSetupProductRegionDataCoordinate initWithCoordinatePair:]([PKPaymentSetupProductRegionDataCoordinate alloc], "initWithCoordinatePair:", v2);

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPaymentSetupProductRegionData *v5;
  uint64_t v6;
  NSArray *inclusionaryZones;
  uint64_t v8;
  NSArray *exclusionaryZones;

  v5 = -[PKPaymentSetupProductRegionData init](+[PKPaymentSetupProductRegionData allocWithZone:](PKPaymentSetupProductRegionData, "allocWithZone:"), "init");
  v5->_persistent = self->_persistent;
  v5->_priority = self->_priority;
  v6 = -[NSArray copyWithZone:](self->_inclusionaryZones, "copyWithZone:", a3);
  inclusionaryZones = v5->_inclusionaryZones;
  v5->_inclusionaryZones = (NSArray *)v6;

  v8 = -[NSArray copyWithZone:](self->_exclusionaryZones, "copyWithZone:", a3);
  exclusionaryZones = v5->_exclusionaryZones;
  v5->_exclusionaryZones = (NSArray *)v8;

  v5->_maximumMatchingDistance = self->_maximumMatchingDistance;
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentSetupProductRegionData)initWithCoder:(id)a3
{
  id v4;
  PKPaymentSetupProductRegionData *v5;
  double v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSArray *inclusionaryZones;
  uint64_t v12;
  NSArray *exclusionaryZones;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PKPaymentSetupProductRegionData;
  v5 = -[PKPaymentSetupProductRegionData init](&v15, sel_init);
  if (v5)
  {
    v5->_persistent = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isPersistent"));
    v5->_priority = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("priority"));
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maximumMatchingDistance"));
    v5->_maximumMatchingDistance = v6;
    v7 = (void *)MEMORY[0x1E0C99E60];
    v8 = objc_opt_class();
    objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("inclusionaryZones"));
    v10 = objc_claimAutoreleasedReturnValue();
    inclusionaryZones = v5->_inclusionaryZones;
    v5->_inclusionaryZones = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("exclusionaryZones"));
    v12 = objc_claimAutoreleasedReturnValue();
    exclusionaryZones = v5->_exclusionaryZones;
    v5->_exclusionaryZones = (NSArray *)v12;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 persistent;
  id v5;

  persistent = self->_persistent;
  v5 = a3;
  objc_msgSend(v5, "encodeBool:forKey:", persistent, CFSTR("isPersistent"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_priority, CFSTR("priority"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_inclusionaryZones, CFSTR("inclusionaryZones"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_exclusionaryZones, CFSTR("exclusionaryZones"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("maximumMatchingDistance"), self->_maximumMatchingDistance);

}

- (BOOL)isPersistent
{
  return self->_persistent;
}

- (unint64_t)priority
{
  return self->_priority;
}

- (NSArray)inclusionaryZones
{
  return self->_inclusionaryZones;
}

- (NSArray)exclusionaryZones
{
  return self->_exclusionaryZones;
}

- (double)maximumMatchingDistance
{
  return self->_maximumMatchingDistance;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exclusionaryZones, 0);
  objc_storeStrong((id *)&self->_inclusionaryZones, 0);
}

@end
