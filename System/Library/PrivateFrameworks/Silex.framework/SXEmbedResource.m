@implementation SXEmbedResource

- (id)expirationDateWithValue:(id)a3 withType:(int)a4
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  if (a4 == 3)
  {
    v4 = (void *)MEMORY[0x24BDD1500];
    v5 = a3;
    objc_msgSend(v4, "dateFormatterWithFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZ"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dateFromString:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

@end
