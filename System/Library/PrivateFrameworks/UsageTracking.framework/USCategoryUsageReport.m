@implementation USCategoryUsageReport

- (USCategoryUsageReport)initWithCategoryIdentifier:(id)a3 totalUsageTime:(double)a4 applicationUsage:(id)a5 webUsage:(id)a6
{
  id v9;
  id v10;
  id v11;
  USCategoryUsageReport *v12;
  uint64_t v13;
  NSString *categoryIdentifier;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)USCategoryUsageReport;
  v9 = a6;
  v10 = a5;
  v11 = a3;
  v12 = -[USCategoryUsageReport init](&v16, sel_init);
  v13 = objc_msgSend(v11, "copy", v16.receiver, v16.super_class);

  categoryIdentifier = v12->_categoryIdentifier;
  v12->_categoryIdentifier = (NSString *)v13;

  -[USCategoryUsageReport _usCategoryUsageReportCommonInitWithTotalUsageTime:applicationUsage:webUsage:](v12, "_usCategoryUsageReportCommonInitWithTotalUsageTime:applicationUsage:webUsage:", v10, v9, a4);
  return v12;
}

- (void)_usCategoryUsageReportCommonInitWithTotalUsageTime:(double)a3 applicationUsage:(id)a4 webUsage:(id)a5
{
  id v7;
  NSArray *v8;
  NSArray *applicationUsage;
  NSArray *v10;
  NSArray *webUsage;

  self->_totalUsageTime = a3;
  v7 = a5;
  v8 = (NSArray *)objc_msgSend(a4, "copy");
  applicationUsage = self->_applicationUsage;
  self->_applicationUsage = v8;

  v10 = (NSArray *)objc_msgSend(v7, "copy");
  webUsage = self->_webUsage;
  self->_webUsage = v10;

}

- (USCategoryUsageReport)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  int v15;
  USCategoryUsageReport *v16;
  double v17;
  double v18;
  uint64_t v19;
  NSString *categoryIdentifier;
  USCategoryUsageReport *v21;
  void *v22;
  objc_super v24;
  uint8_t buf[4];
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  int v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("CategoryIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BDBCF20]);
  v7 = objc_opt_class();
  v8 = (void *)objc_msgSend(v6, "initWithObjects:", v7, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ApplicationUsageWithPickupsAndNotifications"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("ApplicationUsage"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_alloc(MEMORY[0x24BDBCF20]);
  v11 = objc_opt_class();
  v12 = (void *)objc_msgSend(v10, "initWithObjects:", v11, objc_opt_class(), 0);
  objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v12, CFSTR("WebUsage"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "containsValueForKey:", CFSTR("TotalUsageTime"));
  v15 = v14;
  if (v5 && v9 && v13 && v14)
  {
    v24.receiver = self;
    v24.super_class = (Class)USCategoryUsageReport;
    v16 = -[USCategoryUsageReport init](&v24, sel_init);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("TotalUsageTime"));
    v18 = v17;
    v19 = objc_msgSend(v5, "copy");
    categoryIdentifier = v16->_categoryIdentifier;
    v16->_categoryIdentifier = (NSString *)v19;

    -[USCategoryUsageReport _usCategoryUsageReportCommonInitWithTotalUsageTime:applicationUsage:webUsage:](v16, "_usCategoryUsageReportCommonInitWithTotalUsageTime:applicationUsage:webUsage:", v9, v13, v18);
    self = v16;
    v21 = self;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138544130;
      v26 = v5;
      v27 = 2114;
      v28 = v9;
      v29 = 2114;
      v30 = v13;
      v31 = 1026;
      v32 = v15;
      _os_log_error_impl(&dword_20D894000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to decode USCategoryUsageReport with categoryIdentifier: %{public}@, applicationUsage: %{public}@, webUsage: %{public}@, hasTotalUsageTime: %{public}d", buf, 0x26u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD0B88], 4865, 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "failWithError:", v22);

    v21 = 0;
  }

  return v21;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *categoryIdentifier;
  id v5;
  void *v6;
  id v7;

  categoryIdentifier = self->_categoryIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", categoryIdentifier, CFSTR("CategoryIdentifier"));
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("TotalUsageTime"), self->_totalUsageTime);
  objc_msgSend(v5, "encodeObject:forKey:", self->_applicationUsage, CFSTR("ApplicationUsageWithPickupsAndNotifications"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_webUsage, CFSTR("WebUsage"));
  objc_msgSend(MEMORY[0x24BDD1758], "predicateWithFormat:", CFSTR("%K > 0.0"), CFSTR("totalUsageTime"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](self->_applicationUsage, "filteredArrayUsingPredicate:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("ApplicationUsage"));

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
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)USCategoryUsageReport;
  -[USCategoryUsageReport description](&v12, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[USCategoryUsageReport categoryIdentifier](self, "categoryIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[USCategoryUsageReport totalUsageTime](self, "totalUsageTime");
  v7 = v6;
  -[USCategoryUsageReport applicationUsage](self, "applicationUsage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[USCategoryUsageReport webUsage](self, "webUsage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@, CategoryIdentifier: %@, TotalUsageTime: %f, ApplicationUsage: %@\nIndependentWebUsage: %@"), v4, v5, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)categoryIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (double)totalUsageTime
{
  return self->_totalUsageTime;
}

- (NSArray)applicationUsage
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (void)setApplicationUsage:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (NSArray)webUsage
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webUsage, 0);
  objc_storeStrong((id *)&self->_applicationUsage, 0);
  objc_storeStrong((id *)&self->_categoryIdentifier, 0);
}

@end
