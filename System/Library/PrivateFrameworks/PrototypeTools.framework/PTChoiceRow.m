@implementation PTChoiceRow

- (id)possibleValues:(id)a3 titles:(id)a4
{
  id v6;

  v6 = a4;
  -[PTChoiceRow setPossibleValues:](self, "setPossibleValues:", a3);
  -[PTChoiceRow setPossibleTitles:](self, "setPossibleTitles:", v6);

  return self;
}

- (id)possibleShortTitles:(id)a3
{
  -[PTChoiceRow setPossibleShortTitles:](self, "setPossibleShortTitles:", a3);
  return self;
}

- (int64_t)numberOfSections
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v5;
  int64_t v6;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_dataSource);
    v6 = objc_msgSend(v5, "numberOfSectionsForChoiceRow:", self);

  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)titleForSection:(int64_t)a3
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v7;
  void *v8;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v7, "choiceRow:titleForSection:", self, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v7;
  int64_t v8;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_dataSource);
    v8 = objc_msgSend(v7, "choiceRow:numberOfRowsInSection:", self, a3);

  }
  else
  {
    v8 = -[NSArray count](self->_possibleValues, "count");
  }

  return v8;
}

- (id)valueForRow:(int64_t)a3 inSection:(int64_t)a4
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v9;
  void *v10;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v9, "choiceRow:valueForRow:inSection:", self, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndex:](self->_possibleValues, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)titleForRow:(int64_t)a3 inSection:(int64_t)a4
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v9;
  void *v10;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v9, "choiceRow:titleForRow:inSection:", self, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndex:](self->_possibleTitles, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)shortTitleForRow:(int64_t)a3 inSection:(int64_t)a4
{
  PTChoiceRowDataSource **p_dataSource;
  id WeakRetained;
  id v9;
  void *v10;

  p_dataSource = &self->_dataSource;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  if (WeakRetained)
  {
    v9 = objc_loadWeakRetained((id *)p_dataSource);
    objc_msgSend(v9, "choiceRow:shortTitleForRow:inSection:", self, a3, a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[NSArray objectAtIndex:](self->_possibleShortTitles, "objectAtIndex:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (id)indexPathForValue:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[PTChoiceRow numberOfSections](self, "numberOfSections") < 1)
  {
LABEL_8:
    v8 = 0;
  }
  else
  {
    v5 = 0;
    while (-[PTChoiceRow numberOfRowsInSection:](self, "numberOfRowsInSection:", v5) < 1)
    {
LABEL_7:
      if (++v5 >= -[PTChoiceRow numberOfSections](self, "numberOfSections"))
        goto LABEL_8;
    }
    v6 = 0;
    while (1)
    {
      -[PTChoiceRow valueForRow:inSection:](self, "valueForRow:inSection:", v6, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "isEqual:", v7))
        break;

      if (++v6 >= -[PTChoiceRow numberOfRowsInSection:](self, "numberOfRowsInSection:", v5))
        goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x1E0CB36B0], "pt_indexPathForRow:inSection:", v6, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (BOOL)isEqual:(id)a3
{
  PTChoiceRow *v4;
  char v5;
  objc_super v7;

  v4 = (PTChoiceRow *)a3;
  if (self == v4)
  {
    v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PTChoiceRow;
    if (-[PTRow isEqual:](&v7, sel_isEqual_, v4) && BSEqualObjects() && BSEqualObjects())
      v5 = BSEqualObjects();
    else
      v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];

  objc_msgSend(MEMORY[0x1E0D01788], "builder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v10[2] = __19__PTChoiceRow_hash__block_invoke;
  v10[3] = &unk_1E7058178;
  v10[4] = self;
  v10[0] = MEMORY[0x1E0C809B0];
  v4 = (id)objc_msgSend(v3, "appendHashingBlocks:", v10, 0);
  v5 = (id)objc_msgSend(v3, "appendObject:", self->_possibleValues);
  v6 = (id)objc_msgSend(v3, "appendObject:", self->_possibleTitles);
  v7 = (id)objc_msgSend(v3, "appendObject:", self->_possibleShortTitles);
  v8 = objc_msgSend(v3, "hash");

  return v8;
}

id __19__PTChoiceRow_hash__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PTChoiceRow;
  return objc_msgSendSuper2(&v2, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PTChoiceRow;
  v4 = -[PTRow copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setPossibleValues:", self->_possibleValues);
  objc_msgSend(v4, "setPossibleTitles:", self->_possibleTitles);
  objc_msgSend(v4, "setPossibleShortTitles:", self->_possibleShortTitles);
  return v4;
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
  v5.super_class = (Class)PTChoiceRow;
  v4 = a3;
  -[PTRow encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_possibleValues, CFSTR("values"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_possibleTitles, CFSTR("titles"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_possibleShortTitles, CFSTR("shortTitles"));

}

- (PTChoiceRow)initWithCoder:(id)a3
{
  id v4;
  PTChoiceRow *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSArray *possibleValues;
  uint64_t v12;
  NSArray *possibleTitles;
  uint64_t v14;
  NSArray *possibleShortTitles;
  NSArray *v16;
  const __CFString *v17;
  NSArray *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PTChoiceRow;
  v5 = -[PTRow initWithCoder:](&v20, sel_initWithCoder_, v4);
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    PTPlistableClasses();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("values"));
    v10 = objc_claimAutoreleasedReturnValue();
    possibleValues = v5->_possibleValues;
    v5->_possibleValues = (NSArray *)v10;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("titles"));
    v12 = objc_claimAutoreleasedReturnValue();
    possibleTitles = v5->_possibleTitles;
    v5->_possibleTitles = (NSArray *)v12;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("shortTitles"));
    v14 = objc_claimAutoreleasedReturnValue();
    possibleShortTitles = v5->_possibleShortTitles;
    v5->_possibleShortTitles = (NSArray *)v14;

    v16 = v5->_possibleTitles;
    objc_opt_class();
    if ((PTValidateArray(v16) & 1) == 0)
    {
      v17 = (const __CFString *)v5->_possibleTitles;
      if (!v17)
        v17 = CFSTR("nil");
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("PTChoiceRow expected array of strings for 'possibleTitles', got %@"), v17);
    }
    if (!v5->_possibleValues)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("PTChoiceRow expected array of plist types for 'possibleValues', got nil"));
    v18 = v5->_possibleShortTitles;
    if (v18)
    {
      objc_opt_class();
      if ((PTValidateArray(v18) & 1) == 0)
        objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0CB2C88], CFSTR("PTChoiceRow expected optional array of strings for 'possibleShortTitles', got %@"), v5->_possibleShortTitles);
    }

  }
  return v5;
}

- (BOOL)isEncodable
{
  unsigned int v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PTChoiceRow;
  v3 = -[PTRow isEncodable](&v5, sel_isEncodable);
  if (v3)
    LOBYTE(v3) = PTObjectIsRecursivelyPlistable(self->_possibleValues);
  return v3;
}

- (NSArray)possibleValues
{
  return self->_possibleValues;
}

- (void)setPossibleValues:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (NSArray)possibleTitles
{
  return self->_possibleTitles;
}

- (void)setPossibleTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSArray)possibleShortTitles
{
  return self->_possibleShortTitles;
}

- (void)setPossibleShortTitles:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (PTChoiceRowDataSource)dataSource
{
  return (PTChoiceRowDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSString)choiceIdentifier
{
  return self->_choiceIdentifier;
}

- (void)setChoiceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_choiceIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_choiceIdentifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_possibleShortTitles, 0);
  objc_storeStrong((id *)&self->_possibleTitles, 0);
  objc_storeStrong((id *)&self->_possibleValues, 0);
}

@end
