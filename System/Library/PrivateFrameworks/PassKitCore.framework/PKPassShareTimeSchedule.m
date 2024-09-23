@implementation PKPassShareTimeSchedule

+ (id)emptySchedule
{
  PKPassShareTimeSchedule *v2;

  v2 = objc_alloc_init(PKPassShareTimeSchedule);
  -[PKPassShareTimeSchedule setInterval:](v2, "setInterval:", 1);
  -[PKPassShareTimeSchedule setFrequency:](v2, "setFrequency:", 2);
  return v2;
}

- (PKPassShareTimeSchedule)initWithDictionary:(id)a3
{
  id v4;
  PKPassShareTimeSchedule *v5;
  id v6;
  void (**v7)(void *, const __CFString *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PKPassShareTimeSchedule *v12;
  _QWORD aBlock[4];
  id v15;
  objc_super v16;

  v4 = a3;
  if (v4)
  {
    v16.receiver = self;
    v16.super_class = (Class)PKPassShareTimeSchedule;
    v5 = -[PKPassShareTimeSchedule init](&v16, sel_init);
    if (v5)
    {
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke;
      aBlock[3] = &unk_1E2ACE1D0;
      v6 = v4;
      v15 = v6;
      v7 = (void (**)(void *, const __CFString *))_Block_copy(aBlock);
      v7[2](v7, CFSTR("hoursOfDay"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareTimeSchedule setHoursOfDay:](v5, "setHoursOfDay:", v8);

      v7[2](v7, CFSTR("daysOfTheWeek"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareTimeSchedule setDaysOfWeek:](v5, "setDaysOfWeek:", v9);

      v7[2](v7, CFSTR("daysOfTheMonth"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKPassShareTimeSchedule setDaysOfMonth:](v5, "setDaysOfMonth:", v10);

      v5->_interval = objc_msgSend(v6, "PKIntegerForKey:", CFSTR("interval"));
      objc_msgSend(v6, "PKStringForKey:", CFSTR("frequency"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_frequency = PKPassShareTimeScheduleFrequencyFromString(v11);

    }
    self = v5;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "PKArrayContaining:forKey:", objc_opt_class(), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "PKArrayContaining:forKey:", objc_opt_class(), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pk_arrayByApplyingBlock:", &__block_literal_global_114);
    v6 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

uint64_t __46__PKPassShareTimeSchedule_initWithDictionary___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a2, "integerValue"));
}

- (id)dictionaryRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[NSArray pk_arrayByApplyingBlock:](self->_hoursOfDay, "pk_arrayByApplyingBlock:", &__block_literal_global_127);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("hoursOfDay"));

  -[NSArray pk_arrayByApplyingBlock:](self->_daysOfWeek, "pk_arrayByApplyingBlock:", &__block_literal_global_128);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("daysOfTheWeek"));

  -[NSArray pk_arrayByApplyingBlock:](self->_daysOfMonth, "pk_arrayByApplyingBlock:", &__block_literal_global_129);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("daysOfTheMonth"));

  if (self->_interval)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("interval"));

  }
  switch(self->_frequency)
  {
    case 0uLL:
      goto LABEL_9;
    case 1uLL:
      v8 = CFSTR("day");
      goto LABEL_8;
    case 2uLL:
      v8 = CFSTR("week");
      goto LABEL_8;
    case 3uLL:
      v8 = CFSTR("month");
      goto LABEL_8;
    default:
      v8 = CFSTR("none");
LABEL_8:
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("frequency"));
LABEL_9:
      v9 = (void *)objc_msgSend(v3, "copy");

      return v9;
  }
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

uint64_t __51__PKPassShareTimeSchedule_dictionaryRepresentation__block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "stringValue");
}

- (void)setHoursOfDay:(id)a3
{
  NSArray *v4;
  NSArray *hoursOfDay;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_131_0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  hoursOfDay = self->_hoursOfDay;
  self->_hoursOfDay = v4;

}

uint64_t __41__PKPassShareTimeSchedule_setHoursOfDay___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDaysOfWeek:(id)a3
{
  NSArray *v4;
  NSArray *daysOfWeek;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_132);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  daysOfWeek = self->_daysOfWeek;
  self->_daysOfWeek = v4;

}

uint64_t __41__PKPassShareTimeSchedule_setDaysOfWeek___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void)setDaysOfMonth:(id)a3
{
  NSArray *v4;
  NSArray *daysOfMonth;

  objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_133_0);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  daysOfMonth = self->_daysOfMonth;
  self->_daysOfMonth = v4;

}

uint64_t __42__PKPassShareTimeSchedule_setDaysOfMonth___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)intersect:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  void (**v7)(void *, void *);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  PKPassShareTimeSchedule *v14;
  uint64_t v16;
  uint64_t v17;
  id (*v18)(uint64_t, _QWORD *);
  void *v19;
  PKPassShareTimeSchedule *v20;
  id v21;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __37__PKPassShareTimeSchedule_intersect___block_invoke;
    v19 = &unk_1E2ACE258;
    v20 = self;
    v6 = v4;
    v21 = v6;
    v7 = (void (**)(void *, void *))_Block_copy(&v16);
    v7[2](v7, &__block_literal_global_137_1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8 && !objc_msgSend(v8, "count", v16, v17, v18, v19, v20))
    {
      v14 = 0;
    }
    else
    {
      v7[2](v7, &__block_literal_global_138_0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "count"))
      {
        v14 = 0;
      }
      else
      {
        v7[2](v7, &__block_literal_global_139);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if ((!v12 || objc_msgSend(v12, "count")) && self->_interval == v6[4] && self->_frequency == v6[5])
        {
          v14 = objc_alloc_init(PKPassShareTimeSchedule);
          -[PKPassShareTimeSchedule setHoursOfDay:](v14, "setHoursOfDay:", v9);
          -[PKPassShareTimeSchedule setDaysOfWeek:](v14, "setDaysOfWeek:", v11);
          -[PKPassShareTimeSchedule setDaysOfMonth:](v14, "setDaysOfMonth:", v13);
          -[PKPassShareTimeSchedule setInterval:](v14, "setInterval:", self->_interval);
          -[PKPassShareTimeSchedule setFrequency:](v14, "setFrequency:", self->_frequency);
        }
        else
        {
          v14 = 0;
        }

      }
    }

  }
  else
  {
    v14 = self;
  }

  return v14;
}

id __37__PKPassShareTimeSchedule_intersect___block_invoke(uint64_t a1, _QWORD *a2)
{
  void (*v4)(void);
  _QWORD *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  BOOL v14;
  void *v15;
  void *v16;
  id v17;
  id v18;

  v4 = (void (*)(void))a2[2];
  v5 = a2;
  v4();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
    v7 = v6;
  else
    v7 = 0;
  v8 = v7;

  ((void (*)(id, _QWORD))a2[2])(v5, *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  v12 = 0;
  if (v8 | v11)
  {
    if (v8)
      v13 = v11 == 0;
    else
      v13 = 0;
    if (v13)
    {
      v17 = (id)v8;
      v12 = v6;
    }
    else
    {
      if (v8)
        v14 = 1;
      else
        v14 = v11 == 0;
      if (v14)
      {
        v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v8);
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
        objc_msgSend(v15, "intersectSet:", v16);
        objc_msgSend(v15, "allObjects");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = (id)v11;
        v12 = v9;
      }
    }
  }

  return v12;
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hoursOfDay");
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "daysOfWeek");
}

uint64_t __37__PKPassShareTimeSchedule_intersect___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "daysOfMonth");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassShareTimeSchedule)initWithCoder:(id)a3
{
  id v4;
  PKPassShareTimeSchedule *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  NSArray *hoursOfDay;
  uint64_t v11;
  NSArray *daysOfWeek;
  uint64_t v13;
  NSArray *daysOfMonth;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PKPassShareTimeSchedule;
  v5 = -[PKPassShareTimeSchedule init](&v18, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("hoursOfDay"));
    v9 = objc_claimAutoreleasedReturnValue();
    hoursOfDay = v5->_hoursOfDay;
    v5->_hoursOfDay = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("daysOfWeek"));
    v11 = objc_claimAutoreleasedReturnValue();
    daysOfWeek = v5->_daysOfWeek;
    v5->_daysOfWeek = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("daysOfMonth"));
    v13 = objc_claimAutoreleasedReturnValue();
    daysOfMonth = v5->_daysOfMonth;
    v5->_daysOfMonth = (NSArray *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("interval"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_interval = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("frequency"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_frequency = PKPassShareTimeScheduleFrequencyFromString(v16);

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *hoursOfDay;
  void *v5;
  unint64_t v6;
  const __CFString *v7;
  id v8;

  hoursOfDay = self->_hoursOfDay;
  v8 = a3;
  objc_msgSend(v8, "encodeObject:forKey:", hoursOfDay, CFSTR("hoursOfDay"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_daysOfWeek, CFSTR("daysOfWeek"));
  objc_msgSend(v8, "encodeObject:forKey:", self->_daysOfMonth, CFSTR("daysOfMonth"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_interval);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "encodeObject:forKey:", v5, CFSTR("interval"));

  v6 = self->_frequency - 1;
  if (v6 > 2)
    v7 = CFSTR("none");
  else
    v7 = off_1E2ACE2F0[v6];
  objc_msgSend(v8, "encodeObject:forKey:", v7, CFSTR("frequency"));

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendFormat:", CFSTR("hoursOfDay: '%@'; "), self->_hoursOfDay);
  objc_msgSend(v6, "appendFormat:", CFSTR("daysOfWeek: '%@'; "), self->_daysOfWeek);
  objc_msgSend(v6, "appendFormat:", CFSTR("daysOfMonth: '%@'; "), self->_daysOfMonth);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_interval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("interval: '%@'; "), v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_frequency);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("frequency: '%@'; "), v8);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_hoursOfDay)
    objc_msgSend(v3, "addObject:");
  if (self->_daysOfWeek)
    objc_msgSend(v4, "addObject:");
  if (self->_daysOfMonth)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);
  v6 = self->_interval - v5 + 32 * v5;
  v7 = self->_frequency - v6 + 32 * v6;

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  PKPassShareTimeSchedule *v4;
  PKPassShareTimeSchedule *v5;
  BOOL v6;

  v4 = (PKPassShareTimeSchedule *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKPassShareTimeSchedule isEqualToPassShareTimeSchedule:](self, "isEqualToPassShareTimeSchedule:", v5);

  return v6;
}

- (BOOL)isEqualToPassShareTimeSchedule:(id)a3
{
  _QWORD *v4;
  NSArray *hoursOfDay;
  NSArray *v6;
  BOOL v7;
  NSArray *daysOfWeek;
  NSArray *v9;
  NSArray *daysOfMonth;
  NSArray *v11;
  BOOL v12;

  v4 = a3;
  if (!v4)
    goto LABEL_22;
  hoursOfDay = self->_hoursOfDay;
  v6 = (NSArray *)v4[1];
  if (hoursOfDay)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
  {
    if (hoursOfDay != v6)
      goto LABEL_22;
  }
  else if ((-[NSArray isEqual:](hoursOfDay, "isEqual:") & 1) == 0)
  {
    goto LABEL_22;
  }
  daysOfWeek = self->_daysOfWeek;
  v9 = (NSArray *)v4[2];
  if (daysOfWeek && v9)
  {
    if ((-[NSArray isEqual:](daysOfWeek, "isEqual:") & 1) == 0)
      goto LABEL_22;
  }
  else if (daysOfWeek != v9)
  {
    goto LABEL_22;
  }
  daysOfMonth = self->_daysOfMonth;
  v11 = (NSArray *)v4[3];
  if (!daysOfMonth || !v11)
  {
    if (daysOfMonth == v11)
      goto LABEL_20;
LABEL_22:
    v12 = 0;
    goto LABEL_23;
  }
  if ((-[NSArray isEqual:](daysOfMonth, "isEqual:") & 1) == 0)
    goto LABEL_22;
LABEL_20:
  if (self->_interval != v4[4])
    goto LABEL_22;
  v12 = self->_frequency == v4[5];
LABEL_23:

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PKPassShareTimeSchedule *v4;
  uint64_t v5;
  NSArray *hoursOfDay;
  uint64_t v7;
  NSArray *daysOfWeek;
  uint64_t v9;
  NSArray *daysOfMonth;

  v4 = -[PKPassShareTimeSchedule init](+[PKPassShareTimeSchedule allocWithZone:](PKPassShareTimeSchedule, "allocWithZone:", a3), "init");
  v5 = -[NSArray copy](self->_hoursOfDay, "copy");
  hoursOfDay = v4->_hoursOfDay;
  v4->_hoursOfDay = (NSArray *)v5;

  v7 = -[NSArray copy](self->_daysOfWeek, "copy");
  daysOfWeek = v4->_daysOfWeek;
  v4->_daysOfWeek = (NSArray *)v7;

  v9 = -[NSArray copy](self->_daysOfMonth, "copy");
  daysOfMonth = v4->_daysOfMonth;
  v4->_daysOfMonth = (NSArray *)v9;

  v4->_interval = self->_interval;
  v4->_frequency = self->_frequency;
  return v4;
}

- (NSArray)hoursOfDay
{
  return self->_hoursOfDay;
}

- (NSArray)daysOfWeek
{
  return self->_daysOfWeek;
}

- (NSArray)daysOfMonth
{
  return self->_daysOfMonth;
}

- (unint64_t)interval
{
  return self->_interval;
}

- (void)setInterval:(unint64_t)a3
{
  self->_interval = a3;
}

- (unint64_t)frequency
{
  return self->_frequency;
}

- (void)setFrequency:(unint64_t)a3
{
  self->_frequency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daysOfMonth, 0);
  objc_storeStrong((id *)&self->_daysOfWeek, 0);
  objc_storeStrong((id *)&self->_hoursOfDay, 0);
}

@end
