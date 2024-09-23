@implementation PKPaymentTransactionQuestion

- (PKPaymentTransactionQuestion)initWithDictionary:(id)a3
{
  id v4;
  PKPaymentTransactionQuestion *v5;
  void *v6;
  uint64_t v7;
  NSDate *expirationDate;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPaymentTransactionQuestion;
  v5 = -[PKPaymentTransactionQuestion init](&v10, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "PKStringForKey:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = PKPaymentTransactionQuestionTypeFromString(v6);

    objc_msgSend(v4, "PKDateForKey:", CFSTR("expirationDate"));
    v7 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v7;

    *(_WORD *)&v5->_answered = 0;
  }

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  id v7;
  void *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD72E0[type];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("type"));
  if (self->_expirationDate)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    objc_msgSend(v7, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ssZZZZZ"));
    objc_msgSend(v7, "stringFromDate:", self->_expirationDate);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v8, CFSTR("expirationDate"));

  }
  v9 = (void *)objc_msgSend(v4, "copy");

  return v9;
}

- (NSArray)allowedAnswers
{
  void *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  if (self->_type - 1 > 1)
  {
    v2 = 0;
  }
  else
  {
    v4[0] = CFSTR("yes");
    v4[1] = CFSTR("no");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return (NSArray *)v2;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safelyAddObject:", self->_expirationDate);
  v4 = PKCombinedHash(17, v3);
  v5 = self->_type - v4 + 32 * v4;
  v6 = self->_answered - v5 + 32 * v5;
  v7 = self->_answeredOnThisDevice - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPaymentTransactionQuestion *v4;
  PKPaymentTransactionQuestion *v5;
  BOOL v6;

  v4 = (PKPaymentTransactionQuestion *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPaymentTransactionQuestion isEqualToQuestion:](self, "isEqualToQuestion:", v5);

  return v6;
}

- (BOOL)isEqualToQuestion:(id)a3
{
  id v4;
  NSDate *expirationDate;
  uint64_t v6;
  void *v7;
  BOOL v8;
  char v9;
  unint64_t type;
  int answered;
  int answeredOnThisDevice;
  BOOL v13;

  v4 = a3;
  expirationDate = self->_expirationDate;
  objc_msgSend(v4, "expirationDate");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (expirationDate)
    v8 = v6 == 0;
  else
    v8 = 1;
  if (v8)
  {
    if (expirationDate != (NSDate *)v6)
    {
LABEL_12:
      v13 = 0;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = -[NSDate isEqual:](expirationDate, "isEqual:", v6);
    if ((v9 & 1) == 0)
      goto LABEL_12;
  }
  type = self->_type;
  if (type != objc_msgSend(v4, "type"))
    goto LABEL_12;
  answered = self->_answered;
  if (answered != objc_msgSend(v4, "answered"))
    goto LABEL_12;
  answeredOnThisDevice = self->_answeredOnThisDevice;
  v13 = answeredOnThisDevice == objc_msgSend(v4, "answeredOnThisDevice");
LABEL_13:

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t type;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("<%@: %p; "), objc_opt_class(), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  type = self->_type;
  if (type > 2)
    v6 = CFSTR("unknown");
  else
    v6 = off_1E2AD72E0[type];
  objc_msgSend(v3, "appendFormat:", CFSTR("type: '%@'; "), v6);
  -[NSDate description](self->_expirationDate, "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR("expirationDate: '%@'; "), v7);

  if (self->_answered)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("answered: '%@'; "), v8);
  if (self->_answeredOnThisDevice)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  objc_msgSend(v4, "appendFormat:", CFSTR("answered on device: '%@'; "), v9);
  objc_msgSend(v4, "appendFormat:", CFSTR(">"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPaymentTransactionQuestion)initWithCoder:(id)a3
{
  id v4;
  PKPaymentTransactionQuestion *v5;
  uint64_t v6;
  NSDate *expirationDate;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPaymentTransactionQuestion;
  v5 = -[PKPaymentTransactionQuestion init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("expirationDate"));
    v6 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v6;

    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("type"));
    v5->_answered = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("answered")) != 0;
    v5->_answeredOnThisDevice = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("answeredOnThisDevice")) != 0;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("type"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_answered, CFSTR("answered"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_answeredOnThisDevice, CFSTR("answeredOnThisDevice"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_expirationDate, CFSTR("expirationDate"));

}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (BOOL)answered
{
  return self->_answered;
}

- (void)setAnswered:(BOOL)a3
{
  self->_answered = a3;
}

- (BOOL)answeredOnThisDevice
{
  return self->_answeredOnThisDevice;
}

- (void)setAnsweredOnThisDevice:(BOOL)a3
{
  self->_answeredOnThisDevice = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_expirationDate, 0);
}

@end
