@implementation SXCalendarEventAddition

- (id)notesWithValue:(id)a3 withType:(int)a4
{
  id v5;
  SXFormattedText *v6;
  void *v7;
  SXFormattedText *v8;
  SXFormattedText *v9;

  v5 = a3;
  if (v5)
  {
    v6 = [SXFormattedText alloc];
    -[SXJSONObject specificationVersion](self, "specificationVersion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SXJSONObject initWithJSONObject:andVersion:](v6, "initWithJSONObject:andVersion:", v5, v7);
  }
  else
  {
    -[SXJSONObject valueForLookupKey:](self, "valueForLookupKey:", CFSTR("notes"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v9 = 0;
      goto LABEL_7;
    }
    v8 = -[SXFormattedText initWithText:]([SXFormattedText alloc], "initWithText:", v7);
  }
  v9 = v8;
LABEL_7:

  return v9;
}

@end
