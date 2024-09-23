@implementation STStatusBarDataDateTimeEntry

+ (id)_entryForDateValue:(id)a3 mode:(int64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  if (a4 == 2)
  {
    +[STStatusBarData shortTimeFormatter](STStatusBarData, "shortTimeFormatter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else if (a4 == 1)
  {
    +[STStatusBarData timeFormatter](STStatusBarData, "timeFormatter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4)
    {
      v8 = 0;
      goto LABEL_9;
    }
    +[STStatusBarData dateFormatter](STStatusBarData, "dateFormatter");
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;
LABEL_9:
  objc_msgSend(v8, "stringFromDate:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___STStatusBarDataDateTimeEntry;
  objc_msgSendSuper2(&v14, sel_entryWithStringValue_, v9);
  v10 = (_QWORD *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v6, "copy");
  v12 = (void *)v10[4];
  v10[4] = v11;

  v10[3] = a4;
  return v10;
}

+ (id)entryForTimeWithDateValue:(id)a3
{
  return (id)objc_msgSend(a1, "_entryForDateValue:mode:", a3, 1);
}

+ (id)entryForShortTimeWithDateValue:(id)a3
{
  return (id)objc_msgSend(a1, "_entryForDateValue:mode:", a3, 2);
}

+ (id)entryForDateWithDateValue:(id)a3
{
  return (id)objc_msgSend(a1, "_entryForDateValue:mode:", a3, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STStatusBarDataDateTimeEntry;
  v4 = a3;
  -[STStatusBarDataStringEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateValue, CFSTR("dateValue"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_mode, CFSTR("mode"));

}

- (STStatusBarDataDateTimeEntry)initWithCoder:(id)a3
{
  id v3;
  STStatusBarDataDateTimeEntry *v4;
  uint64_t v5;
  NSDate *dateValue;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataDateTimeEntry;
  v3 = a3;
  v4 = -[STStatusBarDataStringEntry initWithCoder:](&v8, sel_initWithCoder_, v3);
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateValue"), v8.receiver, v8.super_class);
  v5 = objc_claimAutoreleasedReturnValue();

  dateValue = v4->_dateValue;
  v4->_dateValue = (NSDate *)v5;

  return v4;
}

- (id)succinctDescriptionBuilder
{
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)STStatusBarDataDateTimeEntry;
  -[STStatusBarDataStringEntry succinctDescriptionBuilder](&v7, sel_succinctDescriptionBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataDateTimeEntry dateValue](self, "dateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:withName:", v4, CFSTR("dateValue"));

  return v3;
}

- (id)_equalsBuilderWithObject:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  int64_t mode;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)STStatusBarDataDateTimeEntry;
  -[STStatusBarDataStringEntry _equalsBuilderWithObject:](&v19, sel__equalsBuilderWithObject_, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  -[STStatusBarDataDateTimeEntry dateValue](self, "dateValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke;
  v17[3] = &unk_1E91E4EA8;
  v9 = v6;
  v18 = v9;
  v10 = (id)objc_msgSend(v5, "appendObject:counterpart:", v7, v17);

  mode = self->_mode;
  v15[0] = v8;
  v15[1] = 3221225472;
  v15[2] = __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke_2;
  v15[3] = &unk_1E91E58B0;
  v16 = v9;
  v12 = v9;
  v13 = (id)objc_msgSend(v5, "appendInteger:counterpart:", mode, v15);

  return v5;
}

uint64_t __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dateValue");
}

uint64_t __57__STStatusBarDataDateTimeEntry__equalsBuilderWithObject___block_invoke_2(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
}

- (id)_hashBuilder
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STStatusBarDataDateTimeEntry;
  -[STStatusBarDataStringEntry _hashBuilder](&v8, sel__hashBuilder);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[STStatusBarDataDateTimeEntry dateValue](self, "dateValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v3, "appendObject:", v4);

  v6 = (id)objc_msgSend(v3, "appendInteger:", self->_mode);
  return v3;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STStatusBarDataDateTimeEntry;
  v4 = a3;
  -[STStatusBarDataStringEntry encodeWithBSXPCCoder:](&v6, sel_encodeWithBSXPCCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_dateValue, CFSTR("dateValue"), v6.receiver, v6.super_class);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_mode);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("modeValue"));

}

- (STStatusBarDataDateTimeEntry)initWithBSXPCCoder:(id)a3
{
  id v4;
  STStatusBarDataDateTimeEntry *v5;
  uint64_t v6;
  NSDate *dateValue;
  void *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)STStatusBarDataDateTimeEntry;
  v5 = -[STStatusBarDataStringEntry initWithBSXPCCoder:](&v10, sel_initWithBSXPCCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("dateValue"));
    v6 = objc_claimAutoreleasedReturnValue();
    dateValue = v5->_dateValue;
    v5->_dateValue = (NSDate *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modeValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_mode = objc_msgSend(v8, "integerValue");

  }
  return v5;
}

- (NSDate)dateValue
{
  return self->_dateValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateValue, 0);
}

@end
