@implementation INHomeAttributeValue(ActionIdentifier)

- (uint64_t)re_actionIdentifierHashValue
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  switch(objc_msgSend(a1, "type"))
  {
    case 1:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(a1, "BOOLValue"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v6 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(a1, "doubleValue");
      objc_msgSend(v6, "numberWithDouble:");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 3:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      objc_msgSend(a1, "stringValue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 4:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v7 = (void *)MEMORY[0x24BDD16E0];
      v8 = objc_msgSend(a1, "integerValue");
      goto LABEL_8;
    case 5:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      v7 = (void *)MEMORY[0x24BDD16E0];
      v8 = objc_msgSend(a1, "limitValue");
LABEL_8:
      objc_msgSend(v7, "numberWithInteger:", v8);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = v4;
      v5 = objc_msgSend(v4, "re_actionIdentifierHashValue") ^ v3;

      break;
    default:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "unit"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v2, "re_actionIdentifierHashValue");
      break;
  }

  return v5;
}

@end
