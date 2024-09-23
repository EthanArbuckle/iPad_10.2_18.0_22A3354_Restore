@implementation WBSCRDTPositionSortValue

- (WBSCRDTPositionSortValue)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  WBSCRDTPositionSortValue *v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("sortValue"));
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    self = -[WBSCRDTPositionSortValue initWithSortValue:deviceIdentifier:changeID:](self, "initWithSortValue:deviceIdentifier:changeID:", v5, v6, objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("changeID")));
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (WBSCRDTPositionSortValue)initWithSortValue:(int64_t)a3 deviceIdentifier:(id)a4 changeID:(int64_t)a5
{
  id v8;
  WBSCRDTPositionSortValue *v9;
  WBSCRDTPositionSortValue *v10;
  uint64_t v11;
  NSString *deviceIdentifier;
  WBSCRDTPositionSortValue *v13;
  objc_super v15;

  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)WBSCRDTPositionSortValue;
  v9 = -[WBSCRDTPositionSortValue init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_sortValue = a3;
    v11 = objc_msgSend(v8, "copy");
    deviceIdentifier = v10->_deviceIdentifier;
    v10->_deviceIdentifier = (NSString *)v11;

    v10->_changeID = a5;
    v13 = v10;
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSCRDTPositionSortValue)init
{

  return 0;
}

- (WBSCRDTPositionSortValue)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  WBSCRDTPositionSortValue *v8;

  v4 = a3;
  objc_msgSend(v4, "safari_numberForKey:", CFSTR("sortValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(v4, "safari_stringForKey:", CFSTR("deviceIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v4, "safari_numberForKey:", CFSTR("changeID"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        self = -[WBSCRDTPositionSortValue initWithSortValue:deviceIdentifier:changeID:](self, "initWithSortValue:deviceIdentifier:changeID:", objc_msgSend(v5, "longLongValue"), v6, objc_msgSend(v7, "longLongValue"));
        v8 = self;
      }
      else
      {
        v8 = 0;
      }

    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t sortValue;
  id v5;

  sortValue = self->_sortValue;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", sortValue, CFSTR("sortValue"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceIdentifier, CFSTR("deviceIdentifier"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_changeID, CFSTR("changeID"));

}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  int64_t changeID;
  NSString *deviceIdentifier;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("sortValue");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", self->_sortValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  deviceIdentifier = self->_deviceIdentifier;
  changeID = self->_changeID;
  v10[0] = v3;
  v10[1] = deviceIdentifier;
  v9[1] = CFSTR("deviceIdentifier");
  v9[2] = CFSTR("changeID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", changeID);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v7;
}

- (BOOL)isEqual:(id)a3
{
  WBSCRDTPositionSortValue *v4;
  BOOL v5;

  v4 = (WBSCRDTPositionSortValue *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && -[WBSCRDTPositionSortValue isEqualToPositionSortValue:](self, "isEqualToPositionSortValue:", v4);
  }

  return v5;
}

- (unint64_t)hash
{
  int64_t v2;

  v2 = self->_changeID ^ self->_sortValue;
  return v2 ^ -[NSString hash](self->_deviceIdentifier, "hash");
}

- (BOOL)isEqualToPositionSortValue:(id)a3
{
  _QWORD *v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  v6 = self->_sortValue == v4[1]
    && self->_changeID == v4[3]
    && -[NSString isEqualToString:](self->_deviceIdentifier, "isEqualToString:", v4[2]);

  return v6;
}

- (int64_t)compare:(id)a3
{
  _QWORD *v4;
  int64_t sortValue;
  int64_t v6;
  NSComparisonResult v7;
  int64_t changeID;
  uint64_t v10;

  v4 = a3;
  sortValue = self->_sortValue;
  v6 = v4[1];
  if (sortValue < v6)
    goto LABEL_2;
  if (sortValue > v6)
  {
LABEL_4:
    v7 = NSOrderedDescending;
    goto LABEL_6;
  }
  v7 = -[NSString compare:](self->_deviceIdentifier, "compare:", v4[2]);
  if (v7)
    goto LABEL_6;
  changeID = self->_changeID;
  v10 = v4[3];
  if (changeID < 0)
  {
    if ((v10 & 0x8000000000000000) == 0)
      goto LABEL_4;
LABEL_11:
    if (changeID < 0)
      changeID = -changeID;
    if (v10 < 0)
      v10 = -v10;
    if (changeID >= (unint64_t)v10)
    {
      v7 = (unint64_t)(changeID > (unint64_t)v10);
      goto LABEL_6;
    }
    goto LABEL_2;
  }
  if ((v10 & 0x8000000000000000) == 0)
    goto LABEL_11;
LABEL_2:
  v7 = NSOrderedAscending;
LABEL_6:

  return v7;
}

- (WBSCRDTPositionSortValue)positionSortValueWithSortValue:(int64_t)a3
{
  return (WBSCRDTPositionSortValue *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSortValue:deviceIdentifier:changeID:", a3, self->_deviceIdentifier, self->_changeID);
}

- (WBSCRDTPositionSortValue)positionSortValueWithChangeID:(int64_t)a3
{
  return (WBSCRDTPositionSortValue *)(id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithSortValue:deviceIdentifier:changeID:", self->_sortValue, self->_deviceIdentifier, a3);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{ %lld, %@, %lld }"), self->_sortValue, self->_deviceIdentifier, self->_changeID);
}

- (int64_t)sortValue
{
  return self->_sortValue;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (int64_t)changeID
{
  return self->_changeID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
