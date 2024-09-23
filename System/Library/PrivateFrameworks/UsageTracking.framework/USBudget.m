@implementation USBudget

- (USBudget)initWithCategories:(id)a3 applications:(id)a4 webDomains:(id)a5 schedule:(id)a6 calendarIdentifier:(id)a7 identifier:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  USBudget *v23;
  USBudget *v24;
  uint64_t v25;
  void *identifier;
  uint64_t v27;
  NSString *v28;
  uint64_t v29;
  NSSet *categoryIdentifiers;
  uint64_t v31;
  NSSet *bundleIdentifiers;
  uint64_t v33;
  NSSet *webDomains;
  uint64_t v35;
  void *calendarIdentifier;
  void *v37;
  uint64_t v38;
  NSString *v39;
  uint64_t v40;
  NSDictionary *schedule;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[4];
  USBudget *v47;
  SEL v48;

  v15 = a3;
  v16 = a4;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a5;
  v21 = (void *)objc_opt_new();
  objc_msgSend(v21, "normalizeDomainNames:", v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v15, "count") && !objc_msgSend(v16, "count") && !objc_msgSend(v22, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageMonitor.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("(categoryIdentifiers.count > 0) || (bundleIdentifiers.count > 0) || (normalizedWebDomains.count > 0)"));

  }
  if (!objc_msgSend(v17, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageMonitor.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("schedule.count > 0"));

  }
  v46[0] = MEMORY[0x24BDAC760];
  v46[1] = 3221225472;
  v46[2] = __94__USBudget_initWithCategories_applications_webDomains_schedule_calendarIdentifier_identifier___block_invoke;
  v46[3] = &unk_24C7DAC60;
  v48 = a2;
  v23 = self;
  v47 = v23;
  objc_msgSend(v17, "enumerateKeysAndObjectsUsingBlock:", v46);
  v45.receiver = v23;
  v45.super_class = (Class)USBudget;
  v24 = -[USBudget init](&v45, sel_init);
  if (v19)
  {
    v25 = objc_msgSend(v19, "copy");
    identifier = v24->_identifier;
    v24->_identifier = (NSString *)v25;
  }
  else
  {
    identifier = (void *)objc_opt_new();
    objc_msgSend(identifier, "UUIDString");
    v27 = objc_claimAutoreleasedReturnValue();
    v28 = v24->_identifier;
    v24->_identifier = (NSString *)v27;

  }
  v29 = objc_msgSend(v15, "copy");
  categoryIdentifiers = v24->_categoryIdentifiers;
  v24->_categoryIdentifiers = (NSSet *)v29;

  v31 = objc_msgSend(v16, "copy");
  bundleIdentifiers = v24->_bundleIdentifiers;
  v24->_bundleIdentifiers = (NSSet *)v31;

  v33 = objc_msgSend(v22, "copy");
  webDomains = v24->_webDomains;
  v24->_webDomains = (NSSet *)v33;

  if (v18)
  {
    v35 = objc_msgSend(v18, "copy");
    calendarIdentifier = v24->_calendarIdentifier;
    v24->_calendarIdentifier = (NSString *)v35;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
    calendarIdentifier = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(calendarIdentifier, "calendarIdentifier");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = objc_msgSend(v37, "copy");
    v39 = v24->_calendarIdentifier;
    v24->_calendarIdentifier = (NSString *)v38;

  }
  v40 = objc_msgSend(v17, "copy");
  schedule = v24->_schedule;
  v24->_schedule = (NSDictionary *)v40;

  return v24;
}

void __94__USBudget_initWithCategories_applications_webDomains_schedule_calendarIdentifier_identifier___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  double v4;
  id v5;

  objc_msgSend(a3, "doubleValue");
  if (v4 < 0.0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("USUsageMonitor.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("timeLimit.doubleValue >= 0.0"));

  }
}

- (USBudget)initWithType:(int64_t)a3 items:(id)a4 schedule:(id)a5 calendarIdentifier:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  USBudget *v19;
  id v20;
  id v21;
  id v22;

  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_opt_new();
  switch(a3)
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("USUsageMonitor.m"), 55, CFSTR("Screen Time budgets are unsupported"));

      break;
    case 2:
      v19 = self;
      v20 = v17;
      v21 = v13;
      goto LABEL_6;
    case 3:
      v19 = self;
      v20 = v17;
      v21 = v17;
      v22 = v13;
      goto LABEL_7;
    case 4:
      v19 = self;
      v20 = v13;
      v21 = v17;
LABEL_6:
      v22 = v17;
LABEL_7:
      self = -[USBudget initWithCategories:applications:webDomains:schedule:calendarIdentifier:identifier:](v19, "initWithCategories:applications:webDomains:schedule:calendarIdentifier:identifier:", v20, v21, v22, v14, v15, v16);
      break;
    default:
      break;
  }

  return self;
}

- (USBudget)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v30;
  void *v31;
  objc_super v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  BOOL v37;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCF20]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("CategoryIdentifiers"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("BundleIdentifiers"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("WebDomains"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "normalizeDomainNames:", v10);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CalendarIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BDBCF20]);
  v14 = objc_opt_class();
  v15 = (void *)objc_msgSend(v13, "initWithObjects:", v14, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v15, CFSTR("Schedule"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  v35 = &v34;
  v36 = 0x2020000000;
  v37 = 0;
  v37 = objc_msgSend(v16, "count") != 0;
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = __26__USBudget_initWithCoder___block_invoke;
  v33[3] = &unk_24C7DAC88;
  v33[4] = &v34;
  objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v33);
  if (!v5)
    goto LABEL_7;
  if (objc_msgSend(v9, "count") || objc_msgSend(v31, "count"))
  {
    if (!v12)
      goto LABEL_7;
    goto LABEL_5;
  }
  v17 = 0;
  if (objc_msgSend(v30, "count") && v12)
  {
LABEL_5:
    if (*((_BYTE *)v35 + 24))
    {
      v32.receiver = self;
      v32.super_class = (Class)USBudget;
      v17 = -[USBudget init](&v32, sel_init);
      v18 = objc_msgSend(v5, "copy");
      v19 = (void *)*((_QWORD *)v17 + 1);
      *((_QWORD *)v17 + 1) = v18;

      v20 = objc_msgSend(v9, "copy");
      v21 = (void *)*((_QWORD *)v17 + 2);
      *((_QWORD *)v17 + 2) = v20;

      v22 = objc_msgSend(v31, "copy");
      v23 = (void *)*((_QWORD *)v17 + 3);
      *((_QWORD *)v17 + 3) = v22;

      v24 = objc_msgSend(v30, "copy");
      v25 = (void *)*((_QWORD *)v17 + 4);
      *((_QWORD *)v17 + 4) = v24;

      v26 = objc_msgSend(v12, "copy");
      v27 = (void *)*((_QWORD *)v17 + 5);
      *((_QWORD *)v17 + 5) = v26;

      v28 = objc_msgSend(v16, "copy");
      self = (USBudget *)*((_QWORD *)v17 + 6);
      *((_QWORD *)v17 + 6) = v28;
      goto LABEL_8;
    }
LABEL_7:
    v17 = 0;
  }
LABEL_8:

  _Block_object_dispose(&v34, 8);
  return (USBudget *)v17;
}

uint64_t __26__USBudget_initWithCoder___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  uint64_t result;
  double v7;

  result = objc_msgSend(a3, "doubleValue");
  if (v7 < 0.0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("Identifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_categoryIdentifiers, CFSTR("CategoryIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_bundleIdentifiers, CFSTR("BundleIdentifiers"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webDomains, CFSTR("WebDomains"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_calendarIdentifier, CFSTR("CalendarIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_schedule, CFSTR("Schedule"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t k;
  void *v19;
  void *v20;
  id v21;
  _QWORD v23[4];
  id v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  objc_super v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x24BDD16A8];
  v42.receiver = self;
  v42.super_class = (Class)USBudget;
  -[USBudget description](&v42, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USBudget identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "appendString:", CFSTR(" Categories: ("));
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  -[USBudget categoryIdentifiers](self, "categoryIdentifiers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v35 != v9)
          objc_enumerationMutation(v7);
        if (*((_BYTE *)v39 + 24))
        {
          objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
          *((_BYTE *)v39 + 24) = 0;
        }
        else
        {
          objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i));
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
    }
    while (v8);
  }

  objc_msgSend(v6, "appendString:", CFSTR(")"));
  objc_msgSend(v6, "appendString:", CFSTR(" Applications: ("));
  *((_BYTE *)v39 + 24) = 1;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[USBudget bundleIdentifiers](self, "bundleIdentifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v31;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v31 != v13)
          objc_enumerationMutation(v11);
        if (*((_BYTE *)v39 + 24))
        {
          objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
          *((_BYTE *)v39 + 24) = 0;
        }
        else
        {
          objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * j));
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v44, 16);
    }
    while (v12);
  }

  objc_msgSend(v6, "appendString:", CFSTR(")"));
  objc_msgSend(v6, "appendString:", CFSTR(" WebDomains: ("));
  *((_BYTE *)v39 + 24) = 1;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[USBudget webDomains](self, "webDomains");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v27;
    do
    {
      for (k = 0; k != v16; ++k)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v15);
        if (*((_BYTE *)v39 + 24))
        {
          objc_msgSend(v6, "appendString:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
          *((_BYTE *)v39 + 24) = 0;
        }
        else
        {
          objc_msgSend(v6, "appendFormat:", CFSTR(", %@"), *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * k));
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v26, v43, 16);
    }
    while (v16);
  }

  objc_msgSend(v6, "appendString:", CFSTR(")"));
  -[USBudget calendarIdentifier](self, "calendarIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR(" %@:{"), v19);

  *((_BYTE *)v39 + 24) = 1;
  -[USBudget schedule](self, "schedule");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __23__USBudget_description__block_invoke;
  v23[3] = &unk_24C7DACB0;
  v25 = &v38;
  v21 = v6;
  v24 = v21;
  objc_msgSend(v20, "enumerateKeysAndObjectsUsingBlock:", v23);

  objc_msgSend(v21, "appendString:", CFSTR("}"));
  _Block_object_dispose(&v38, 8);
  return v21;
}

uint64_t __23__USBudget_description__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  uint64_t v5;
  uint64_t result;

  v5 = a1 + 32;
  v4 = *(void **)(a1 + 32);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v5 + 8) + 8) + 24))
    return objc_msgSend(v4, "appendFormat:", CFSTR(", %@: %@"), a2, a3);
  result = objc_msgSend(v4, "appendFormat:", CFSTR("%@: %@"), a2, a3);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  return result;
}

- (NSSet)items
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "set");
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSSet)categoryIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 16, 1);
}

- (NSSet)bundleIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 24, 1);
}

- (NSSet)webDomains
{
  return (NSSet *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)calendarIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSDictionary)schedule
{
  return (NSDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (int64_t)type
{
  return self->_type;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedule, 0);
  objc_storeStrong((id *)&self->_calendarIdentifier, 0);
  objc_storeStrong((id *)&self->_webDomains, 0);
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_storeStrong((id *)&self->_categoryIdentifiers, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
