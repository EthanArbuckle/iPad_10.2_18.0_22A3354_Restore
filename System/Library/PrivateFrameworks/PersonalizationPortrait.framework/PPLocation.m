@implementation PPLocation

- (PPLocation)initWithPlacemark:(id)a3 category:(unsigned __int16)a4 mostRelevantRecord:(id)a5
{
  id v10;
  id v11;
  PPLocation *v12;
  PPLocation *v13;
  uint64_t v14;
  NSString *clusterIdentifier;
  void *v17;
  objc_super v18;

  v10 = a3;
  v11 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPLocation.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placemark"));

  }
  v18.receiver = self;
  v18.super_class = (Class)PPLocation;
  v12 = -[PPLocation init](&v18, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_placemark, a3);
    v13->_category = a4;
    objc_storeStrong((id *)&v13->_mostRelevantRecord, a5);
    +[PPLocation clusterIdentifierFromPlacemark:](PPLocation, "clusterIdentifierFromPlacemark:", v10);
    v14 = objc_claimAutoreleasedReturnValue();
    clusterIdentifier = v13->_clusterIdentifier;
    v13->_clusterIdentifier = (NSString *)v14;

  }
  return v13;
}

- (PPLocation)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  unsigned __int16 v6;
  void *v7;
  PPLocation *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("pmk"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("cat"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("mrr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    self = -[PPLocation initWithPlacemark:category:mostRelevantRecord:](self, "initWithPlacemark:category:mostRelevantRecord:", v5, v6, v7);
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  CLPlacemark *placemark;
  id v5;

  placemark = self->_placemark;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", placemark, CFSTR("pmk"));
  objc_msgSend(v5, "encodeInt32:forKey:", self->_category, CFSTR("cat"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_mostRelevantRecord, CFSTR("mrr"));

}

- (id)description
{
  id v3;
  CLPlacemark *placemark;
  void *v5;
  void *v6;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  placemark = self->_placemark;
  +[PPLocation describeCategory:](PPLocation, "describeCategory:", self->_category);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<PPLocation p:'%@' c:%@ r:%@>"), placemark, v5, self->_mostRelevantRecord);

  return v6;
}

- (BOOL)isEqualToLocation:(id)a3
{
  PPLocation *v4;
  PPLocation *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  BOOL v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;

  v4 = (PPLocation *)a3;
  v5 = v4;
  if (v4 == self)
  {
    v21 = 1;
    goto LABEL_48;
  }
  if (!v4)
    goto LABEL_47;
  -[CLPlacemark name](self->_placemark, "name");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark name](v5->_placemark, "name");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v6 | v7)
  {
    v9 = (void *)v7;
    if (!v6 || !v7)
      goto LABEL_46;
    v22 = objc_msgSend((id)v6, "isEqualToString:", v7);

    if (!v22)
      goto LABEL_47;
  }
  -[CLPlacemark thoroughfare](self->_placemark, "thoroughfare");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark thoroughfare](v5->_placemark, "thoroughfare");
  v8 = objc_claimAutoreleasedReturnValue();
  if (v6 | v8)
  {
    v9 = (void *)v8;
    if (!v6 || !v8)
      goto LABEL_46;
    v10 = objc_msgSend((id)v6, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_47;
  }
  -[CLPlacemark subThoroughfare](self->_placemark, "subThoroughfare");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark subThoroughfare](v5->_placemark, "subThoroughfare");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v6 | v11)
  {
    v9 = (void *)v11;
    if (!v6 || !v11)
      goto LABEL_46;
    v12 = objc_msgSend((id)v6, "isEqualToString:", v11);

    if (!v12)
      goto LABEL_47;
  }
  -[CLPlacemark locality](self->_placemark, "locality");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark locality](v5->_placemark, "locality");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v6 | v13)
  {
    v9 = (void *)v13;
    if (!v6 || !v13)
      goto LABEL_46;
    v23 = objc_msgSend((id)v6, "isEqualToString:", v13);

    if (!v23)
      goto LABEL_47;
  }
  -[CLPlacemark subLocality](self->_placemark, "subLocality");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark subLocality](v5->_placemark, "subLocality");
  v14 = objc_claimAutoreleasedReturnValue();
  if (v6 | v14)
  {
    v9 = (void *)v14;
    if (!v6 || !v14)
      goto LABEL_46;
    v15 = objc_msgSend((id)v6, "isEqualToString:", v14);

    if (!v15)
      goto LABEL_47;
  }
  -[CLPlacemark administrativeArea](self->_placemark, "administrativeArea");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark administrativeArea](v5->_placemark, "administrativeArea");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v6 | v16)
  {
    v9 = (void *)v16;
    if (!v6 || !v16)
      goto LABEL_46;
    v24 = objc_msgSend((id)v6, "isEqualToString:", v16);

    if (!v24)
      goto LABEL_47;
  }
  -[CLPlacemark subAdministrativeArea](self->_placemark, "subAdministrativeArea");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark subAdministrativeArea](v5->_placemark, "subAdministrativeArea");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v6 | v17)
  {
    v9 = (void *)v17;
    if (!v6 || !v17)
      goto LABEL_46;
    v25 = objc_msgSend((id)v6, "isEqualToString:", v17);

    if (!v25)
      goto LABEL_47;
  }
  -[CLPlacemark postalCode](self->_placemark, "postalCode");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark postalCode](v5->_placemark, "postalCode");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v6 | v18)
  {
    v9 = (void *)v18;
    if (!v6 || !v18)
      goto LABEL_46;
    v26 = objc_msgSend((id)v6, "isEqualToString:", v18);

    if (!v26)
      goto LABEL_47;
  }
  -[CLPlacemark country](self->_placemark, "country");
  v6 = objc_claimAutoreleasedReturnValue();
  -[CLPlacemark country](v5->_placemark, "country");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v6 | v19)
  {
    v9 = (void *)v19;
    if (v6 && v19)
    {
      v20 = objc_msgSend((id)v6, "isEqualToString:", v19);

      if (v20)
        goto LABEL_24;
LABEL_47:
      v21 = 0;
      goto LABEL_48;
    }
LABEL_46:

    goto LABEL_47;
  }
LABEL_24:
  v21 = self->_category == v5->_category;
LABEL_48:

  return v21;
}

- (id)customizedDescription
{
  CLPlacemark *placemark;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;

  placemark = self->_placemark;
  v4 = &stru_1E226D4B0;
  if (placemark)
  {
    -[CLPlacemark postalAddress](placemark, "postalAddress");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "street");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (!v8)
    {
      v9 = (void *)objc_opt_new();
      -[CLPlacemark subThoroughfare](self->_placemark, "subThoroughfare");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        -[CLPlacemark subThoroughfare](self->_placemark, "subThoroughfare");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "appendString:", v11);

      }
      -[CLPlacemark thoroughfare](self->_placemark, "thoroughfare");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = objc_alloc(MEMORY[0x1E0CB3940]);
        -[CLPlacemark thoroughfare](self->_placemark, "thoroughfare");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR(" %@"), v14);
        objc_msgSend(v9, "appendString:", v15);

      }
      objc_msgSend(v6, "setStreet:", v9);

    }
    objc_msgSend(MEMORY[0x1E0C973B0], "singleLineStringFromPostalAddress:addCountryName:", v6, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "length"))
    {
      v17 = v16;
    }
    else
    {
      -[CLPlacemark name](self->_placemark, "name");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
    if (v17)
      v19 = v17;
    else
      v19 = &stru_1E226D4B0;
    v4 = v19;

  }
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  PPLocation *v4;
  PPLocation *v5;
  BOOL v6;

  v4 = (PPLocation *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PPLocation isEqualToLocation:](self, "isEqualToLocation:", v5);

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  -[CLPlacemark name](self->_placemark, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  -[CLPlacemark thoroughfare](self->_placemark, "thoroughfare");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") - v4 + 32 * v4;

  -[CLPlacemark subThoroughfare](self->_placemark, "subThoroughfare");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hash") - v6 + 32 * v6;

  -[CLPlacemark locality](self->_placemark, "locality");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hash") - v8 + 32 * v8;

  -[CLPlacemark subLocality](self->_placemark, "subLocality");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "hash") - v10 + 32 * v10;

  -[CLPlacemark administrativeArea](self->_placemark, "administrativeArea");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "hash") - v12 + 32 * v12;

  -[CLPlacemark subAdministrativeArea](self->_placemark, "subAdministrativeArea");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "hash") - v14 + 32 * v14;

  -[CLPlacemark postalCode](self->_placemark, "postalCode");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "hash") - v16 + 32 * v16;

  -[CLPlacemark country](self->_placemark, "country");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "hash") - v18 + 32 * v18;

  return self->_category - v20 + 32 * v20;
}

- (NSSet)featureNames
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__PPLocation_featureNames__block_invoke;
  block[3] = &unk_1E226C130;
  block[4] = self;
  if (featureNames__pasOnceToken8 != -1)
    dispatch_once(&featureNames__pasOnceToken8, block);
  return (NSSet *)(id)featureNames__pasExprOnceResult_3569;
}

- (id)featureValueForName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("category_")))
  {
    objc_msgSend(MEMORY[0x1E0C9E918], "featureValueWithInt64:", -[PPLocation category](self, "category"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v4, "hasPrefix:", CFSTR("placemark_")))
    {
      -[PPLocation placemark](self, "placemark");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("placemark_"), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pp_featureValueForName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!objc_msgSend(v4, "hasPrefix:", CFSTR("record_")))
      {
        v5 = 0;
        goto LABEL_9;
      }
      -[PPLocation mostRelevantRecord](self, "mostRelevantRecord");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "substringFromIndex:", objc_msgSend(CFSTR("record_"), "length"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "featureValueForName:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v8;

  }
LABEL_9:

  return v5;
}

- (CLPlacemark)placemark
{
  return self->_placemark;
}

- (unsigned)category
{
  return self->_category;
}

- (PPLocationRecord)mostRelevantRecord
{
  return self->_mostRelevantRecord;
}

- (NSString)clusterIdentifier
{
  return self->_clusterIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clusterIdentifier, 0);
  objc_storeStrong((id *)&self->_mostRelevantRecord, 0);
  objc_storeStrong((id *)&self->_placemark, 0);
}

void __26__PPLocation_featureNames__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;

  v2 = (void *)MEMORY[0x18D7805AC]();
  v3 = (void *)MEMORY[0x18D7805AC]();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("category_"), 0);
  objc_autoreleasePoolPop(v3);
  objc_msgSend(*(id *)(a1 + 32), "placemark");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pp_featureNames");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_pas_mappedArrayWithTransform:", &__block_literal_global_3571);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "mostRelevantRecord");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "featureNames");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_pas_mappedArrayWithTransform:", &__block_literal_global_139_3572);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setByAddingObjectsFromArray:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setByAddingObjectsFromArray:", v12);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)featureNames__pasExprOnceResult_3569;
  featureNames__pasExprOnceResult_3569 = v14;

  objc_autoreleasePoolPop(v2);
}

uint64_t __26__PPLocation_featureNames__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("record_"), "stringByAppendingString:", a2);
}

uint64_t __26__PPLocation_featureNames__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(CFSTR("placemark_"), "stringByAppendingString:", a2);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)describeCategory:(unsigned __int16)a3
{
  if (a3 > 7u)
    return CFSTR("restaurant");
  else
    return off_1E226A9C0[a3];
}

+ (unsigned)categoryForDescription:(id)a3
{
  id v3;
  unsigned __int16 v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("restaurant")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("organization")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("activity location")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("tourist attraction")) & 1) != 0)
  {
    v4 = 4;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("work")) & 1) != 0)
  {
    v4 = 6;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("home")) & 1) != 0)
  {
    v4 = 5;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("dynamic")))
  {
    v4 = 7;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)clusterIdentifierFromPlacemark:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  _QWORD v25[2];
  _QWORD v26[2];
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  objc_msgSend(v3, "subThoroughfare");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      objc_msgSend(v3, "thoroughfare");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v3, "name");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = v8;
        objc_msgSend(v3, "subThoroughfare");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v27[1] = v10;
        objc_msgSend(v3, "thoroughfare");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v27[2] = v11;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_pas_componentsJoinedByString:", CFSTR(" "));
        v13 = objc_claimAutoreleasedReturnValue();

LABEL_11:
        v8 = (void *)v13;
        goto LABEL_12;
      }
    }
    objc_msgSend(v3, "thoroughfare");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "name");
    v15 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v15;
    if (!v14)
      goto LABEL_12;
    v26[0] = v15;
    objc_msgSend(v3, "thoroughfare");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = v10;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v26;
LABEL_10:
    objc_msgSend(v16, "arrayWithObjects:count:", v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_pas_componentsJoinedByString:", CFSTR(" "));
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (!v7)
    goto LABEL_12;
  objc_msgSend(v3, "thoroughfare");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v3, "subThoroughfare");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "thoroughfare", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25[1] = v10;
    v16 = (void *)MEMORY[0x1E0C99D20];
    v17 = v25;
    goto LABEL_10;
  }
  v8 = 0;
LABEL_12:
  objc_autoreleasePoolPop(v4);
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "thoroughfare");
    v19 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v19;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "locality");
    v20 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v20;
  }
  if (!objc_msgSend(v8, "length"))
  {
    objc_msgSend(v3, "administrativeArea");
    v21 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v21;
  }
  v22 = (void *)MEMORY[0x18D7805AC]();
  objc_msgSend(v8, "lowercaseString");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v22);

  return v23;
}

@end
