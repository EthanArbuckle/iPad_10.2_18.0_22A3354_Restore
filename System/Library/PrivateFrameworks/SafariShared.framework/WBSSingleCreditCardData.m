@implementation WBSSingleCreditCardData

- (WBSSingleCreditCardData)init
{

  return 0;
}

- (WBSSingleCreditCardData)initWithValue:(id)a3 type:(int64_t)a4
{
  id v7;
  WBSSingleCreditCardData *v8;
  WBSSingleCreditCardData *v9;
  WBSSingleCreditCardData *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)WBSSingleCreditCardData;
  v8 = -[WBSSingleCreditCardData init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong(&v8->_value, a3);
    v9->_type = a4;
    v10 = v9;
  }

  return v9;
}

+ (id)stringForSingleCreditCardDataType:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return CFSTR("Invalid Modification Type");
  else
    return off_1E4B3F610[a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id value;
  id v5;

  value = self->_value;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", value, CFSTR("value"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_type, CFSTR("type"));

}

- (WBSSingleCreditCardData)initWithCoder:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  WBSSingleCreditCardData *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = a3;
  v11[0] = objc_opt_class();
  v11[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v7, CFSTR("value"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v5, "decodeIntForKey:", CFSTR("type"));
  v9 = -[WBSSingleCreditCardData initWithValue:type:](self, "initWithValue:type:", v8, (int)v7);

  return v9;
}

- (id)value
{
  return self->_value;
}

- (int64_t)type
{
  return self->_type;
}

- (BOOL)isVirtualCard
{
  return self->_isVirtualCard;
}

- (void)setIsVirtualCard:(BOOL)a3
{
  self->_isVirtualCard = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end
