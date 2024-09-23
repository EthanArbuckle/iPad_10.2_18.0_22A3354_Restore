@implementation SCDAFBoost

- (SCDAFBoost)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SCDAFBoost *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SCDAFBoost;
  v5 = -[SCDAFBoost init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_type = objc_msgSend(v6, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boostKind"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_kind = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("boostValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "floatValue");
    v5->_boostValue = v9;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("currentDecay"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_currentDecay = (double)objc_msgSend(v10, "longLongValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDecay"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_totalDecay = (double)objc_msgSend(v11, "longLongValue");

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCDAFBoost type](self, "type"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[SCDAFBoost kind](self, "kind"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("boostKind"));

  v6 = (void *)MEMORY[0x24BDD16E0];
  -[SCDAFBoost boostValue](self, "boostValue");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("boostValue"));

  v8 = (void *)MEMORY[0x24BDD16E0];
  -[SCDAFBoost currentDecay](self, "currentDecay");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("currentDecay"));

  v10 = (void *)MEMORY[0x24BDD16E0];
  -[SCDAFBoost totalDecay](self, "totalDecay");
  objc_msgSend(v10, "numberWithDouble:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("totalDecay"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  int64_t type;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  type = self->_type;
  v6 = a3;
  objc_msgSend(v4, "numberWithInteger:", type);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v7, CFSTR("type"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", self->_kind);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v8, CFSTR("boostKind"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_boostValue);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v9, CFSTR("boostValue"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_currentDecay);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v10, CFSTR("currentDecay"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", self->_totalDecay);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v11, CFSTR("totalDecay"));

}

- (SCDAFBoost)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  SCDAFBoost *v10;
  float v11;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boostKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("boostValue"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("currentDecay"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("totalDecay"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(SCDAFBoost);
  -[SCDAFBoost setType:](v10, "setType:", objc_msgSend(v5, "integerValue"));
  -[SCDAFBoost setKind:](v10, "setKind:", objc_msgSend(v6, "integerValue"));
  objc_msgSend(v7, "floatValue");
  -[SCDAFBoost setBoostValue:](v10, "setBoostValue:", v11);
  -[SCDAFBoost setCurrentDecay:](v10, "setCurrentDecay:", (double)objc_msgSend(v8, "longLongValue"));
  -[SCDAFBoost setTotalDecay:](v10, "setTotalDecay:", (double)objc_msgSend(v9, "longLongValue"));

  return v10;
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (int64_t)kind
{
  return self->_kind;
}

- (void)setKind:(int64_t)a3
{
  self->_kind = a3;
}

- (double)boostValue
{
  return self->_boostValue;
}

- (void)setBoostValue:(double)a3
{
  self->_boostValue = a3;
}

- (double)currentDecay
{
  return self->_currentDecay;
}

- (void)setCurrentDecay:(double)a3
{
  self->_currentDecay = a3;
}

- (double)totalDecay
{
  return self->_totalDecay;
}

- (void)setTotalDecay:(double)a3
{
  self->_totalDecay = a3;
}

+ (id)arrayDictionaryRepresentation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__SCDAFBoost_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_25175B338;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)boostsArrayWithDictionaryRepresentation:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v4 = a3;
  objc_msgSend(v3, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __54__SCDAFBoost_boostsArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_25175B360;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __54__SCDAFBoost_boostsArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SCDAFBoost *v4;

  v3 = a2;
  v4 = -[SCDAFBoost initWithDictionaryRepresentation:]([SCDAFBoost alloc], "initWithDictionaryRepresentation:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

void __44__SCDAFBoost_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

@end
