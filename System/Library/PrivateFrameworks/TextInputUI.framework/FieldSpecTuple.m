@implementation FieldSpecTuple

- (NSString)key
{
  return self->_key;
}

- (TIAnalyticsFieldSpec)fieldSpec
{
  return self->_fieldSpec;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fieldSpec, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

+ (id)tupleWithKey:(id)a3 eventSpec:(id)a4
{
  NSString *v5;
  TIAnalyticsFieldSpec *v6;
  FieldSpecTuple *v7;
  TIAnalyticsFieldSpec *fieldSpec;
  TIAnalyticsFieldSpec *v9;
  NSString *key;

  v5 = (NSString *)a3;
  v6 = (TIAnalyticsFieldSpec *)a4;
  v7 = objc_alloc_init(FieldSpecTuple);
  fieldSpec = v7->_fieldSpec;
  v7->_fieldSpec = v6;
  v9 = v6;

  key = v7->_key;
  v7->_key = v5;

  return v7;
}

@end
