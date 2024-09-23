@implementation PXPlaceAnnotation

- (PXPlaceAnnotation)initWithData:(id)a3
{
  id v4;
  PXPlaceAnnotation *v5;
  PXPlaceAnnotation *v6;
  void *v7;
  uint64_t v8;
  NSNumber *placeLevel;
  uint64_t v10;
  PXPlaceAnnotation *placeName;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXPlaceAnnotation;
  v5 = -[PXPlaceAnnotation init](&v13, sel_init);
  v6 = v5;
  if (v4 && v5)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v4, 0, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("level"));
      v8 = objc_claimAutoreleasedReturnValue();
      placeLevel = v6->_placeLevel;
      v6->_placeLevel = (NSNumber *)v8;

      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("name"));
      v10 = objc_claimAutoreleasedReturnValue();
      placeName = (PXPlaceAnnotation *)v6->_placeName;
      v6->_placeName = (NSString *)v10;
    }
    else
    {
      placeName = v6;
      v6 = 0;
    }

  }
  return v6;
}

- (PXPlaceAnnotation)initWithPlaceLevel:(id)a3 placeName:(id)a4
{
  id v7;
  id v8;
  PXPlaceAnnotation *v9;
  PXPlaceAnnotation *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPlaceAnnotation;
  v9 = -[PXPlaceAnnotation init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_placeLevel, a3);
    objc_storeStrong((id *)&v10->_placeName, a4);
  }

  return v10;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlaceAnnotation placeName](self, "placeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("placeLevel: %@, placeName: %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (NSString)placeLevelAsString
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PXPlaceAnnotation placeLevel](self, "placeLevel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    if (v5 >= 0x15)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v5);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E5142310[(int)v5];
    }
  }
  else
  {
    v6 = 0;
  }
  return (NSString *)v6;
}

- (NSData)data
{
  void *v2;
  void *v3;
  uint64_t v5;

  -[PXPlaceAnnotation dictionary](self, "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v2, 100, 0, &v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (NSDictionary)dictionary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

  }
  else
  {
    -[PXPlaceAnnotation placeName](self, "placeName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
      return (NSDictionary *)v4;
  }
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[PXPlaceAnnotation placeLevel](self, "placeLevel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v6, CFSTR("level"));

  }
  -[PXPlaceAnnotation placeName](self, "placeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[PXPlaceAnnotation placeName](self, "placeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("name"));

  }
  return (NSDictionary *)v4;
}

- (BOOL)isEqual:(id)a3
{
  PXPlaceAnnotation *v4;
  PXPlaceAnnotation *v5;
  BOOL v6;

  v4 = (PXPlaceAnnotation *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PXPlaceAnnotation isEqualToPlaceAnnotation:](self, "isEqualToPlaceAnnotation:", v5);

  return v6;
}

- (BOOL)isEqualToPlaceAnnotation:(id)a3
{
  PXPlaceAnnotation *v4;
  PXPlaceAnnotation *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  BOOL v16;

  v4 = (PXPlaceAnnotation *)a3;
  v5 = v4;
  if (v4 == self)
    goto LABEL_7;
  if (!v4)
    goto LABEL_8;
  -[PXPlaceAnnotation placeName](v4, "placeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlaceAnnotation placeName](self, "placeName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != v7)
  {
    -[PXPlaceAnnotation placeName](v5, "placeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPlaceAnnotation placeName](self, "placeName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "isEqualToString:", v9);

    if (!v10)
      goto LABEL_8;
  }
  -[PXPlaceAnnotation placeLevel](v5, "placeLevel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11 == v12
    || (-[PXPlaceAnnotation placeLevel](v5, "placeLevel"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PXPlaceAnnotation placeLevel](self, "placeLevel"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v13, "isEqualToNumber:", v14),
        v14,
        v13,
        v15))
  {
LABEL_7:
    v16 = 1;
  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[PXPlaceAnnotation placeLevel](self, "placeLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXPlaceAnnotation placeName](self, "placeName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v4)
  {
    -[PXPlaceAnnotation placeLevel](self, "placeLevel");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v4[1];
    v4[1] = v5;

    -[PXPlaceAnnotation placeName](self, "placeName");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v4[2];
    v4[2] = v7;

  }
  return v4;
}

- (NSNumber)placeLevel
{
  return self->_placeLevel;
}

- (void)setPlaceLevel:(id)a3
{
  objc_storeStrong((id *)&self->_placeLevel, a3);
}

- (NSString)placeName
{
  return self->_placeName;
}

- (void)setPlaceName:(id)a3
{
  objc_storeStrong((id *)&self->_placeName, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeName, 0);
  objc_storeStrong((id *)&self->_placeLevel, 0);
}

@end
