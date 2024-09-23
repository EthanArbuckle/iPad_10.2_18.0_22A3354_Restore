@implementation NSDateComponents(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  if (objc_msgSend(a1, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "year"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v3, "re_actionIdentifierHashValue");

  }
  if (objc_msgSend(a1, "month") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "month"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "re_actionIdentifierHashValue");

  }
  if (objc_msgSend(a1, "day") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "day"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v7, "re_actionIdentifierHashValue");

  }
  if (objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "hour"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v9, "re_actionIdentifierHashValue");

  }
  if (objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "minute"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "re_actionIdentifierHashValue");

  }
  if (objc_msgSend(a1, "second") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "second"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v13, "re_actionIdentifierHashValue");

  }
  return v4 ^ v2 ^ v6 ^ v8 ^ v10 ^ v12;
}

@end
