@implementation STUsageItem

- (STUsageItem)initWithCoder:(id)a3
{
  id v4;
  STUsageItem *v5;
  uint64_t v6;
  NSString *identifier;
  uint64_t v8;
  STUsageTrustIdentifier *trustIdentifier;
  uint64_t v10;
  NSString *categoryIdentifier;
  void *v12;
  uint64_t v13;
  UIColor *color;
  void *v15;
  uint64_t v16;
  NSDate *startDate;
  uint64_t v18;
  NSNumber *totalUsage;
  uint64_t v20;
  NSNumber *maxUsage;
  uint64_t v22;
  NSNumber *minUsage;
  objc_super v25;

  v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)STUsageItem;
  v5 = -[STUsageItem init](&v25, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_trustIdentifier"));
    v8 = objc_claimAutoreleasedReturnValue();
    trustIdentifier = v5->_trustIdentifier;
    v5->_trustIdentifier = (STUsageTrustIdentifier *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_categoryIdentifier"));
    v10 = objc_claimAutoreleasedReturnValue();
    categoryIdentifier = v5->_categoryIdentifier;
    v5->_categoryIdentifier = (NSString *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_itemType"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_itemType = objc_msgSend(v12, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_color"));
    v13 = objc_claimAutoreleasedReturnValue();
    color = v5->_color;
    v5->_color = (UIColor *)v13;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_timePeriod"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_timePeriod = objc_msgSend(v15, "unsignedIntegerValue");

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_startDate"));
    v16 = objc_claimAutoreleasedReturnValue();
    startDate = v5->_startDate;
    v5->_startDate = (NSDate *)v16;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_totalUsage"));
    v18 = objc_claimAutoreleasedReturnValue();
    totalUsage = v5->_totalUsage;
    v5->_totalUsage = (NSNumber *)v18;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_maxUsage"));
    v20 = objc_claimAutoreleasedReturnValue();
    maxUsage = v5->_maxUsage;
    v5->_maxUsage = (NSNumber *)v20;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_minUsage"));
    v22 = objc_claimAutoreleasedReturnValue();
    minUsage = v5->_minUsage;
    v5->_minUsage = (NSNumber *)v22;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  void *v5;
  void *v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_trustIdentifier, CFSTR("_trustIdentifier"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_categoryIdentifier, CFSTR("_categoryIdentifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_itemType);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v5, CFSTR("_itemType"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_color, CFSTR("_color"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_timePeriod);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "encodeObject:forKey:", v6, CFSTR("_timePeriod"));

  objc_msgSend(v7, "encodeObject:forKey:", self->_startDate, CFSTR("_startDate"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_totalUsage, CFSTR("_totalUsage"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_maxUsage, CFSTR("_maxUsage"));
  objc_msgSend(v7, "encodeObject:forKey:", self->_minUsage, CFSTR("_minUsage"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = CFSTR("identifier");
  v6[1] = CFSTR("timePeriod");
  v6[2] = CFSTR("startDate");
  v6[3] = CFSTR("totalUsage");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  STUIObjectDescriptionWithProperties(self, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v4 = (_QWORD *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = -[NSString copy](self->_identifier, "copy");
  v6 = (void *)v4[1];
  v4[1] = v5;

  v7 = -[STUsageTrustIdentifier copy](self->_trustIdentifier, "copy");
  v8 = (void *)v4[2];
  v4[2] = v7;

  v9 = -[NSString copy](self->_categoryIdentifier, "copy");
  v10 = (void *)v4[3];
  v4[3] = v9;

  v4[4] = self->_itemType;
  v11 = -[UIColor copy](self->_color, "copy");
  v12 = (void *)v4[5];
  v4[5] = v11;

  v4[6] = self->_timePeriod;
  v13 = -[NSDate copy](self->_startDate, "copy");
  v14 = (void *)v4[7];
  v4[7] = v13;

  v15 = -[NSNumber copy](self->_totalUsage, "copy");
  v16 = (void *)v4[8];
  v4[8] = v15;

  v17 = -[NSNumber copy](self->_maxUsage, "copy");
  v18 = (void *)v4[9];
  v4[9] = v17;

  v19 = -[NSNumber copy](self->_minUsage, "copy");
  v20 = (void *)v4[10];
  v4[10] = v19;

  return v4;
}

- (NSString)budgetItemIdentifier
{
  void *v2;
  void *v3;

  -[STUsageItem trustIdentifier](self, "trustIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)usageTrusted
{
  void *v2;
  char v3;

  -[STUsageItem trustIdentifier](self, "trustIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "usageTrusted");

  return v3;
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v7;

  -[STUsageItem budgetItemIdentifier](self, "budgetItemIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  switch(-[STUsageItem itemType](self, "itemType"))
  {
    case 2uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x24BE844B8], "sharedCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appInfoForBundleIdentifier:", v3);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "displayName");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

      break;
    case 3uLL:
      STCategoryNameWithIdentifier();
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 4uLL:
      objc_msgSend(v3, "_lp_userVisibleHost");
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_6:
      v6 = (__CFString *)v7;
      break;
    default:
      v6 = &stru_24DB8A1D0;
      break;
  }

  return (NSString *)v6;
}

- (UIImage)image
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  switch(-[STUsageItem itemType](self, "itemType"))
  {
    case 2uLL:
    case 5uLL:
    case 6uLL:
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageItem budgetItemIdentifier](self, "budgetItemIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageForBundleIdentifier:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    case 3uLL:
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageItem budgetItemIdentifier](self, "budgetItemIdentifier");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageForCategoryIdentifier:", v4);
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_5:
      v6 = (void *)v5;
      goto LABEL_6;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BE84828], "sharedCache");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      -[STUsageItem displayName](self, "displayName");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "length"))
      {
        v8 = (void *)objc_opt_new();
        objc_msgSend(v8, "setScheme:", CFSTR("https"));
        objc_msgSend(v8, "setHost:", v4);
        objc_msgSend(v8, "URL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_lp_highLevelDomain");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "host");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "URL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v10;
        v14 = v11;
        v15 = v12;
        if (objc_msgSend(v13, "length"))
        {
          objc_msgSend(v13, "substringToIndex:", 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uppercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(v14, "substringToIndex:", 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "uppercaseString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.2((uint64_t)v15, (uint64_t)v14);
        }

      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[STAllowanceItemSearchResultsController tableView:cellForRowAtIndexPath:].cold.1((uint64_t)v4);
        v17 = 0;
      }

      objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "monogramImageForInitial:useDarkColors:", v17, objc_msgSend(v19, "userInterfaceStyle") == 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
      break;
    default:
      v6 = 0;
      break;
  }
  return (UIImage *)v6;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (STUsageTrustIdentifier)trustIdentifier
{
  return self->_trustIdentifier;
}

- (void)setTrustIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)categoryIdentifier
{
  return self->_categoryIdentifier;
}

- (void)setCategoryIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (unint64_t)itemType
{
  return self->_itemType;
}

- (void)setItemType:(unint64_t)a3
{
  self->_itemType = a3;
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
  objc_storeStrong((id *)&self->_color, a3);
}

- (unint64_t)timePeriod
{
  return self->_timePeriod;
}

- (void)setTimePeriod:(unint64_t)a3
{
  self->_timePeriod = a3;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSNumber)totalUsage
{
  return self->_totalUsage;
}

- (void)setTotalUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSNumber)maxUsage
{
  return self->_maxUsage;
}

- (void)setMaxUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSNumber)minUsage
{
  return self->_minUsage;
}

- (void)setMinUsage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_minUsage, 0);
  objc_storeStrong((id *)&self->_maxUsage, 0);
  objc_storeStrong((id *)&self->_totalUsage, 0);
  objc_storeStrong((id *)&self->_startDate, 0);
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
  objc_storeStrong((id *)&self->_trustIdentifier, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
