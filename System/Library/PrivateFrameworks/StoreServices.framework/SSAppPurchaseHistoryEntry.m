@implementation SSAppPurchaseHistoryEntry

+ (id)databaseTable
{
  return CFSTR("app_purchase_history");
}

+ (id)disambiguatedSQLForProperty:(id)a3
{
  const __CFString *v5;
  objc_super v7;

  v5 = CFSTR("IFNULL(app_purchase_history.is_first_party, 0)");
  if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IFNULL(app_purchase_history.is_first_party, 0)")) & 1) == 0)
  {
    v5 = CFSTR("IFNULL(app_purchase_history.is_preorder, 0)");
    if ((objc_msgSend(a3, "isEqualToString:", CFSTR("IFNULL(app_purchase_history.is_preorder, 0)")) & 1) == 0)
    {
      v7.receiver = a1;
      v7.super_class = (Class)&OBJC_METACLASS___SSAppPurchaseHistoryEntry;
      return objc_msgSendSuper2(&v7, sel_disambiguatedSQLForProperty_, a3);
    }
  }
  return (id)v5;
}

+ (id)supportsPlatformPredicate:(BOOL)a3
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("supports_ipad");
  else
    v3 = CFSTR("supports_iphone");
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", v3, objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
}

+ (id)predicateForAccountIdentifier:(id)a3
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("account_unique_identifier"), a3);
}

+ (id)predicateForNotFirstParty
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToLongLong:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToLongLong:", CFSTR("IFNULL(app_purchase_history.is_first_party, 0)"), 0);
}

+ (id)predicateForNotHidden
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("is_hidden"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0));
}

+ (id)predicateForHasMessagesExtension
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("has_messages_extension"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1));
}

+ (id)predicateForIs32BitOnly:(BOOL)a3
{
  return +[SSSQLiteComparisonPredicate predicateWithProperty:equalToValue:](SSSQLiteComparisonPredicate, "predicateWithProperty:equalToValue:", CFSTR("is_32_bit_only"), objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a3));
}

@end
