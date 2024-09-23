@implementation PTUIEditFloatRowTableViewCell

- (id)textForValue:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  float v9;
  float v10;
  void *v11;

  v4 = a3;
  -[PTUIRowTableViewCell row](self, "row");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "precision");
  if (v6 >= 0x7FFFFFFF)
    v7 = 0x7FFFFFFFLL;
  else
    v7 = v6;
  v8 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v4, "floatValue");
  v10 = v9;

  objc_msgSend(v8, "stringWithFormat:", CFSTR("%.*f"), v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)valueForText:(id)a3
{
  void *v3;

  v3 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(a3, "floatValue");
  return (id)objc_msgSend(v3, "numberWithFloat:");
}

@end
