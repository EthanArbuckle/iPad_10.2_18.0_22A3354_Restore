@implementation WFEKCalendarDescriptor

- (WFEKCalendarDescriptor)initWithAllCalendars
{
  WFEKCalendarDescriptor *v2;
  WFEKCalendarDescriptor *v3;
  WFEKCalendarDescriptor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WFEKCalendarDescriptor;
  v2 = -[WFEKCalendarDescriptor init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allCalendars = 1;
    v4 = v2;
  }

  return v3;
}

- (WFEKCalendarDescriptor)initWithCalendarTitle:(id)a3 identifier:(id)a4 RGBAValue:(id)a5
{
  id v8;
  id v9;
  id v10;
  WFEKCalendarDescriptor *v11;
  uint64_t v12;
  NSString *calendarTitle;
  uint64_t v14;
  NSString *calendarIdentifier;
  WFEKCalendarDescriptor *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WFEKCalendarDescriptor;
  v11 = -[WFEKCalendarDescriptor init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    calendarTitle = v11->_calendarTitle;
    v11->_calendarTitle = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    calendarIdentifier = v11->_calendarIdentifier;
    v11->_calendarIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_calendarRGBAValue, a5);
    v16 = v11;
  }

  return v11;
}

- (WFEKCalendarDescriptor)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  WFEKCalendarDescriptor *v9;
  WFEKCalendarDescriptor *v10;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("calendarRGBAValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("allCalendars"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "BOOLValue"))
    v9 = -[WFEKCalendarDescriptor initWithAllCalendars](self, "initWithAllCalendars");
  else
    v9 = -[WFEKCalendarDescriptor initWithCalendarTitle:identifier:RGBAValue:](self, "initWithCalendarTitle:identifier:RGBAValue:", v5, v6, v7);
  v10 = v9;

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[WFEKCalendarDescriptor calendarTitle](self, "calendarTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("calendarTitle"));

  -[WFEKCalendarDescriptor calendarIdentifier](self, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("calendarIdentifier"));

  -[WFEKCalendarDescriptor calendarRGBAValue](self, "calendarRGBAValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("calendarRGBAValue"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WFEKCalendarDescriptor allCalendars](self, "allCalendars"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("allCalendars"));

}

- (BOOL)isEqual:(id)a3
{
  WFEKCalendarDescriptor *v4;
  WFEKCalendarDescriptor *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  id v15;
  char v16;
  void *v17;
  void *v18;
  id v19;

  v4 = (WFEKCalendarDescriptor *)a3;
  if (self == v4)
  {
    v6 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      if (-[WFEKCalendarDescriptor allCalendars](v5, "allCalendars")
        && -[WFEKCalendarDescriptor allCalendars](self, "allCalendars"))
      {
        v6 = 1;
LABEL_26:

        goto LABEL_27;
      }
      -[WFEKCalendarDescriptor calendarIdentifier](v5, "calendarIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEKCalendarDescriptor calendarIdentifier](self, "calendarIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v7;
      v10 = v8;
      if (v9 == v10)
      {

      }
      else
      {
        v11 = v10;
        v6 = 0;
        if (!v9 || !v10)
          goto LABEL_25;
        v12 = objc_msgSend(v9, "isEqualToString:", v10);

        if ((v12 & 1) == 0)
          goto LABEL_18;
      }
      -[WFEKCalendarDescriptor calendarTitle](v5, "calendarTitle");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFEKCalendarDescriptor calendarTitle](self, "calendarTitle");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v13;
      v15 = v14;
      if (v9 == v15)
      {

LABEL_20:
        -[WFEKCalendarDescriptor calendarRGBAValue](v5, "calendarRGBAValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[WFEKCalendarDescriptor calendarRGBAValue](self, "calendarRGBAValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v17;
        v19 = v18;
        if (v9 == v19)
        {
          v6 = 1;
          v11 = v9;
        }
        else
        {
          v11 = v19;
          v6 = 0;
          if (v9 && v19)
            v6 = objc_msgSend(v9, "isEqual:", v19);
        }
        goto LABEL_25;
      }
      v11 = v15;
      v6 = 0;
      if (v9 && v15)
      {
        v16 = objc_msgSend(v9, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
        {
LABEL_18:
          v6 = 0;
          goto LABEL_26;
        }
        goto LABEL_20;
      }
LABEL_25:

      goto LABEL_26;
    }
    v6 = 0;
  }
LABEL_27:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;

  if (-[WFEKCalendarDescriptor allCalendars](self, "allCalendars"))
    v3 = 3405691582;
  else
    v3 = 3133065982;
  -[WFEKCalendarDescriptor calendarTitle](self, "calendarTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");
  -[WFEKCalendarDescriptor calendarIdentifier](self, "calendarIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;
  -[WFEKCalendarDescriptor calendarRGBAValue](self, "calendarRGBAValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7 ^ objc_msgSend(v8, "hash");

  return v9;
}

- (id)matchingRemindersListsFromArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v9[5];
  _QWORD v10[5];

  v4 = a3;
  if (-[WFEKCalendarDescriptor allCalendars](self, "allCalendars"))
  {
    v5 = v4;
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke;
    v10[3] = &unk_1E7AF4CD8;
    v10[4] = self;
    objc_msgSend(v4, "if_objectsPassingTest:", v10);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      v9[0] = v6;
      v9[1] = 3221225472;
      v9[2] = __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke_2;
      v9[3] = &unk_1E7AF4CD8;
      v9[4] = self;
      objc_msgSend(v4, "if_objectsPassingTest:", v9);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
  }

  return v5;
}

- (id)matchingCalendarsFromArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD v10[5];
  _QWORD v11[5];
  _QWORD v12[5];

  v4 = a3;
  if (-[WFEKCalendarDescriptor allCalendars](self, "allCalendars"))
  {
    v5 = v4;
  }
  else
  {
    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke;
    v12[3] = &unk_1E7AF4D00;
    v12[4] = self;
    objc_msgSend(v4, "if_objectsPassingTest:", v12);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v5, "count"))
    {
      v11[0] = v6;
      v11[1] = 3221225472;
      v11[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_2;
      v11[3] = &unk_1E7AF4D00;
      v11[4] = self;
      objc_msgSend(v4, "if_objectsPassingTest:", v11);
      v7 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v7;
    }
    if (!objc_msgSend(v5, "count"))
    {
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_3;
      v10[3] = &unk_1E7AF4D00;
      v10[4] = self;
      objc_msgSend(v4, "if_objectsPassingTest:", v10);
      v8 = objc_claimAutoreleasedReturnValue();

      v5 = (id)v8;
    }
  }

  return v5;
}

- (BOOL)allCalendars
{
  return self->_allCalendars;
}

- (NSString)calendarTitle
{
  return self->_calendarTitle;
}

- (NSString)calendarIdentifier
{
  return self->_calendarIdentifier;
}

- (NSNumber)calendarRGBAValue
{
  return self->_calendarRGBAValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendarRGBAValue, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_calendarTitle, 0);
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "calendarIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "calendarIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqualToString:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "calendarTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "calendarRGBAValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      v8 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0DC79F8], "colorWithCGColor:", objc_msgSend(v3, "CGColor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "numberWithUnsignedInt:", objc_msgSend(v9, "RGBAValue"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "calendarRGBAValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToNumber:", v11);

    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

uint64_t __53__WFEKCalendarDescriptor_matchingCalendarsFromArray___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "calendarTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

uint64_t __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "calendarIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "objectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringRepresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "calendarIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "isEqualToString:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __58__WFEKCalendarDescriptor_matchingRemindersListsFromArray___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "calendarTitle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
