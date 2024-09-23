@implementation PKAccountPromotionCompletionStep

+ (id)completionStepsFromDictionaries:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  if (!a3)
    return 0;
  v3 = (void *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __68__PKAccountPromotionCompletionStep_completionStepsFromDictionaries___block_invoke;
  v9[3] = &unk_1E2AD53C0;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  v7 = (void *)objc_msgSend(v6, "copy");
  return v7;
}

void __68__PKAccountPromotionCompletionStep_completionStepsFromDictionaries___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  PKAccountPromotionCompletionStep *v6;
  PKAccountPromotionCompletionStep *v7;

  v5 = a2;
  v7 = -[PKAccountPromotionCompletionStep initWithDictionary:index:]([PKAccountPromotionCompletionStep alloc], "initWithDictionary:index:", v5, a3);

  v6 = v7;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    v6 = v7;
  }

}

- (PKAccountPromotionCompletionStep)initWithDictionary:(id)a3 index:(int64_t)a4
{
  id v6;
  PKAccountPromotionCompletionStep *v7;
  PKAccountPromotionCompletionStep *v8;
  PKAccountPromotionCompletionStep *v9;
  objc_super v11;

  v6 = a3;
  if (v6)
  {
    v11.receiver = self;
    v11.super_class = (Class)PKAccountPromotionCompletionStep;
    v7 = -[PKAccountPromotionCompletionStep init](&v11, sel_init);
    v8 = v7;
    if (v7)
      -[PKAccountPromotionCompletionStep _initWithCompletionStepDictionary:index:](v7, "_initWithCompletionStepDictionary:index:", v6, a4);
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_initWithCompletionStepDictionary:(id)a3 index:(int64_t)a4
{
  id v5;
  void *v6;
  NSString *v7;
  NSString *currencyCode;
  NSDecimalNumber *v9;
  NSDecimalNumber *endValue;
  NSDecimalNumber *v11;
  NSDecimalNumber *currentValue;

  self->_index = a4;
  v5 = a3;
  objc_msgSend(v5, "PKStringForKey:", CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_progressType = PKAccountPromotionCompletionStepProgressTypeFromString(v6);

  objc_msgSend(v5, "PKStringForKey:", CFSTR("currencyCode"));
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  currencyCode = self->_currencyCode;
  self->_currencyCode = v7;

  objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("endValue"));
  v9 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  endValue = self->_endValue;
  self->_endValue = v9;

  objc_msgSend(v5, "PKDecimalNumberFromStringForKey:", CFSTR("currentValue"));
  v11 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  currentValue = self->_currentValue;
  self->_currentValue = v11;

  LOBYTE(v6) = objc_msgSend(v5, "PKBoolForKey:", CFSTR("completed"));
  self->_completed = (char)v6;
}

- (id)description
{
  void *v3;
  unint64_t progressType;
  const __CFString *v5;
  void *v6;
  void *v7;
  const __CFString *v8;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithFormat:", CFSTR("<%@: %p; "),
                 objc_opt_class(),
                 self);
  objc_msgSend(v3, "appendFormat:", CFSTR("index: '%ld'; "), self->_index);
  progressType = self->_progressType;
  if (progressType > 4)
    v5 = CFSTR("unknown");
  else
    v5 = off_1E2AD53E0[progressType];
  objc_msgSend(v3, "appendFormat:", CFSTR("progressType: '%@'; "), v5);
  objc_msgSend(v3, "appendFormat:", CFSTR("currencyCode: '%@'; "), self->_currencyCode);
  -[NSDecimalNumber stringValue](self->_currentValue, "stringValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("currentValue: '%@'; "), v6);

  -[NSDecimalNumber stringValue](self->_endValue, "stringValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("endValue: '%@'; "), v7);

  if (self->_completed)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v3, "appendFormat:", CFSTR("completed: '%@'; "), v8);
  objc_msgSend(v3, "appendFormat:", CFSTR(">"));
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  PKAccountPromotionCompletionStep *v4;
  PKAccountPromotionCompletionStep *v5;
  BOOL v6;

  v4 = (PKAccountPromotionCompletionStep *)a3;
  v5 = v4;
  if (self == v4)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKAccountPromotionCompletionStep isEqualToAccountPromotionCompletionStep:](self, "isEqualToAccountPromotionCompletionStep:", v5);

  return v6;
}

- (BOOL)isEqualToAccountPromotionCompletionStep:(id)a3
{
  _QWORD *v4;
  _QWORD *v5;
  void *v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  _BOOL4 v10;
  NSDecimalNumber *currentValue;
  NSDecimalNumber *v12;
  NSDecimalNumber *endValue;
  NSDecimalNumber *v14;
  BOOL v15;

  v4 = a3;
  v5 = v4;
  if (!v4 || self->_index != v4[3] || self->_progressType != v4[2])
    goto LABEL_21;
  v6 = (void *)v4[4];
  v7 = self->_currencyCode;
  v8 = v6;
  if (v7 == v8)
  {

  }
  else
  {
    v9 = v8;
    if (!v7 || !v8)
    {

      goto LABEL_21;
    }
    v10 = -[NSString isEqualToString:](v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_21;
  }
  currentValue = self->_currentValue;
  v12 = (NSDecimalNumber *)v5[6];
  if (currentValue && v12)
  {
    if ((-[NSDecimalNumber isEqual:](currentValue, "isEqual:") & 1) == 0)
      goto LABEL_21;
  }
  else if (currentValue != v12)
  {
    goto LABEL_21;
  }
  endValue = self->_endValue;
  v14 = (NSDecimalNumber *)v5[5];
  if (!endValue || !v14)
  {
    if (endValue == v14)
      goto LABEL_19;
LABEL_21:
    v15 = 0;
    goto LABEL_22;
  }
  if ((-[NSDecimalNumber isEqual:](endValue, "isEqual:") & 1) == 0)
    goto LABEL_21;
LABEL_19:
  v15 = self->_completed == *((unsigned __int8 *)v5 + 8);
LABEL_22:

  return v15;
}

- (unint64_t)hash
{
  id v3;
  uint64_t v4;
  int64_t v5;
  unint64_t v6;
  unint64_t v7;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "safelyAddObject:", self->_currencyCode);
  objc_msgSend(v3, "safelyAddObject:", self->_currentValue);
  objc_msgSend(v3, "safelyAddObject:", self->_endValue);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_index - v4 + 32 * v4;
  v6 = self->_progressType - v5 + 32 * v5;
  v7 = self->_completed - v6 + 32 * v6;

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKAccountPromotionCompletionStep)initWithCoder:(id)a3
{
  id v4;
  PKAccountPromotionCompletionStep *v5;
  void *v6;
  uint64_t v7;
  NSString *currencyCode;
  uint64_t v9;
  NSDecimalNumber *endValue;
  uint64_t v11;
  NSDecimalNumber *currentValue;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PKAccountPromotionCompletionStep;
  v5 = -[PKAccountPromotionCompletionStep init](&v14, sel_init);
  if (v5)
  {
    v5->_index = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("index"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_progressType = PKAccountPromotionCompletionStepProgressTypeFromString(v6);

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currencyCode"));
    v7 = objc_claimAutoreleasedReturnValue();
    currencyCode = v5->_currencyCode;
    v5->_currencyCode = (NSString *)v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("endValue"));
    v9 = objc_claimAutoreleasedReturnValue();
    endValue = v5->_endValue;
    v5->_endValue = (NSDecimalNumber *)v9;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentValue"));
    v11 = objc_claimAutoreleasedReturnValue();
    currentValue = v5->_currentValue;
    v5->_currentValue = (NSDecimalNumber *)v11;

    v5->_completed = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("completed"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t index;
  unint64_t progressType;
  const __CFString *v6;
  id v7;

  index = self->_index;
  v7 = a3;
  objc_msgSend(v7, "encodeInteger:forKey:", index, CFSTR("index"));
  progressType = self->_progressType;
  if (progressType > 4)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD53E0[progressType];
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("type"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currencyCode, CFSTR("currencyCode"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_endValue, CFSTR("endValue"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_currentValue, CFSTR("currentValue"));
  objc_msgSend(v7, "encodeBool:forKey:", self->_completed, CFSTR("completed"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_QWORD *)(v5 + 24) = self->_index;
  *(_QWORD *)(v5 + 16) = self->_progressType;
  v6 = -[NSString copyWithZone:](self->_currencyCode, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 32);
  *(_QWORD *)(v5 + 32) = v6;

  v8 = -[NSDecimalNumber copyWithZone:](self->_endValue, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v8;

  v10 = -[NSDecimalNumber copyWithZone:](self->_currentValue, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  *(_BYTE *)(v5 + 8) = self->_completed;
  return (id)v5;
}

- (unint64_t)progressType
{
  return self->_progressType;
}

- (void)setProgressType:(unint64_t)a3
{
  self->_progressType = a3;
}

- (int64_t)index
{
  return self->_index;
}

- (void)setIndex:(int64_t)a3
{
  self->_index = a3;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (void)setCurrencyCode:(id)a3
{
  objc_storeStrong((id *)&self->_currencyCode, a3);
}

- (NSDecimalNumber)endValue
{
  return self->_endValue;
}

- (void)setEndValue:(id)a3
{
  objc_storeStrong((id *)&self->_endValue, a3);
}

- (NSDecimalNumber)currentValue
{
  return self->_currentValue;
}

- (void)setCurrentValue:(id)a3
{
  objc_storeStrong((id *)&self->_currentValue, a3);
}

- (BOOL)completed
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentValue, 0);
  objc_storeStrong((id *)&self->_endValue, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
}

@end
