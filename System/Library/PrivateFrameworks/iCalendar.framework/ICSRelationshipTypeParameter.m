@implementation ICSRelationshipTypeParameter

+ (id)relationshipTypeParameterFromICSString:(id)a3
{
  return +[ICSRelationshipTypeParameter relationshipParameterFromCode:](ICSRelationshipTypeParameter, "relationshipParameterFromCode:", +[ICSComponent relationshipTypeFromString:](ICSComponent, "relationshipTypeFromString:", a3));
}

+ (id)relationshipParameterFromCode:(unint64_t)a3
{
  return -[ICSPredefinedValue initWithLong:]([ICSRelationshipTypeParameter alloc], "initWithLong:", a3);
}

- (Class)classForCoder
{
  return (Class)objc_opt_class();
}

- (void)_ICSStringWithOptions:(unint64_t)a3 appendingToString:(id)a4
{
  char v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  +[ICSComponent stringFromRelationshipType:](ICSComponent, "stringFromRelationshipType:", -[ICSPredefinedValue longValue](self, "longValue"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  iCalendarAppendStringToStringWithOptions(v7, v6, v4);

}

@end
