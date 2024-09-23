@implementation NSURL(SFJSONSerialization)

- (id)jsonData
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "dictionaryRepresentation");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v1))
  {
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v1, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (id)dictionaryRepresentation
{
  _SFPBURL *v1;
  void *v2;

  v1 = -[_SFPBURL initWithNSURL:]([_SFPBURL alloc], "initWithNSURL:", a1);
  -[_SFPBURL dictionaryRepresentation](v1, "dictionaryRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
