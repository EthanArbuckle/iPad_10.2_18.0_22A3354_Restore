@implementation REMFamilyChecklistFamilyGroceryListEligibility

- (REMFamilyChecklistFamilyGroceryListEligibility)initWithIsEligible:(BOOL)a3 ineligibilityReasons:(int64_t)a4
{
  REMFamilyChecklistFamilyGroceryListEligibility *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REMFamilyChecklistFamilyGroceryListEligibility;
  result = -[REMFamilyChecklistFamilyGroceryListEligibility init](&v7, sel_init);
  if (result)
  {
    result->_isEligible = a3;
    result->_ineligibilityReasons = a4;
  }
  return result;
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_opt_new();
  if ((-[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons") & 4) != 0)
    objc_msgSend(v3, "addObject:", CFSTR(".noActivePrimaryCloudKitAccount"));
  if ((-[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons") & 0x10) != 0)
    objc_msgSend(v3, "addObject:", CFSTR(".unsupportedLocale"));
  if ((-[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons") & 0x100) != 0)
    objc_msgSend(v3, "addObject:", CFSTR(".primaryCloudKitAccountNotMigrated"));
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@: %p isEligible: %@, ineligibilityReasons: %@>"), v5, self, v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  int v5;
  BOOL v6;
  int64_t v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (v5 = -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"),
        v5 == objc_msgSend(v4, "isEligible")))
  {
    v7 = -[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons");
    v6 = v7 == objc_msgSend(v4, "ineligibilityReasons");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithBool:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"));
  v4 = objc_msgSend(v3, "hash");
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", -[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons"));
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REMFamilyChecklistFamilyGroceryListEligibility)initWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("isEligible"));
  v6 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("ineligibilityReasons"));

  return -[REMFamilyChecklistFamilyGroceryListEligibility initWithIsEligible:ineligibilityReasons:](self, "initWithIsEligible:ineligibilityReasons:", v5, v6);
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeBool:forKey:", -[REMFamilyChecklistFamilyGroceryListEligibility isEligible](self, "isEligible"), CFSTR("isEligible"));
  objc_msgSend(v4, "encodeInteger:forKey:", -[REMFamilyChecklistFamilyGroceryListEligibility ineligibilityReasons](self, "ineligibilityReasons"), CFSTR("ineligibilityReasons"));

}

- (BOOL)isEligible
{
  return self->_isEligible;
}

- (int64_t)ineligibilityReasons
{
  return self->_ineligibilityReasons;
}

@end
