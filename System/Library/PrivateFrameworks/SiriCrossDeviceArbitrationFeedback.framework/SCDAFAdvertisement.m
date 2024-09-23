@implementation SCDAFAdvertisement

- (SCDAFAdvertisement)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SCDAFAdvertisement *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  uint64_t v11;
  NSNumber *advertHash;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SCDAFAdvertisement;
  v5 = -[SCDAFAdvertisement init](&v18, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("identifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
      objc_storeStrong((id *)&v5->_identifier, v6);
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("confidence"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_confidence = objc_msgSend(v7, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceClass = objc_msgSend(v8, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertHash"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("advertHash"));
      v11 = objc_claimAutoreleasedReturnValue();
      advertHash = v5->_advertHash;
      v5->_advertHash = (NSNumber *)v11;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productType"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_productType = objc_msgSend(v13, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("tieBreaker"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_tieBreaker = objc_msgSend(v14, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("goodnessScore"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_goodnessScore = objc_msgSend(v15, "integerValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceGroup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_deviceGroup = objc_msgSend(v16, "integerValue");

  }
  return v5;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SCDAFAdvertisement identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SCDAFAdvertisement identifier](self, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("identifier"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement confidence](self, "confidence"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("confidence"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceClass](self, "deviceClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("deviceClass"));

  -[SCDAFAdvertisement advertHash](self, "advertHash");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("advertHash"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement productType](self, "productType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("productType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement tieBreaker](self, "tieBreaker"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, CFSTR("tieBreaker"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement goodnessScore](self, "goodnessScore"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("goodnessScore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceGroup](self, "deviceGroup"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("deviceGroup"));

  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)identifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[SCDAFAdvertisement advertHash](self, "advertHash");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement confidence](self, "confidence"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceClass](self, "deviceClass"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement productType](self, "productType"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[SCDAFAdvertisement deviceGroup](self, "deviceGroup"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%@-%@-%@-%@"), v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v9;
}

- (void)setDeviceGroupWithNumber:(id)a3
{
  self->_deviceGroup = objc_msgSend(a3, "integerValue");
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  identifier = self->_identifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_confidence);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v6, CFSTR("confidence"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceClass);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("deviceClass"));

  objc_msgSend(v5, "encodeObject:forKey:", self->_advertHash, CFSTR("advertHash"));
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_productType);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v8, CFSTR("productType"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_tieBreaker);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v9, CFSTR("tieBreaker"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_goodnessScore);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("goodnessScore"));

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", self->_deviceGroup);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v11, CFSTR("deviceGroup"));

}

- (SCDAFAdvertisement)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SCDAFAdvertisement *v13;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("confidence"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("advertHash"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("productType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("tieBreaker"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("goodnessScore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("deviceGroup"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(SCDAFAdvertisement);
  -[SCDAFAdvertisement setIdentifier:](v13, "setIdentifier:", v5);
  -[SCDAFAdvertisement setConfidence:](v13, "setConfidence:", objc_msgSend(v6, "integerValue"));
  -[SCDAFAdvertisement setDeviceClass:](v13, "setDeviceClass:", objc_msgSend(v7, "integerValue"));
  -[SCDAFAdvertisement setAdvertHash:](v13, "setAdvertHash:", v8);
  -[SCDAFAdvertisement setProductType:](v13, "setProductType:", objc_msgSend(v9, "integerValue"));
  -[SCDAFAdvertisement setTieBreaker:](v13, "setTieBreaker:", objc_msgSend(v10, "integerValue"));
  -[SCDAFAdvertisement setGoodnessScore:](v13, "setGoodnessScore:", objc_msgSend(v11, "integerValue"));
  -[SCDAFAdvertisement setDeviceGroup:](v13, "setDeviceGroup:", objc_msgSend(v12, "integerValue"));

  return v13;
}

- (void)setIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_identifier, a3);
}

- (unint64_t)confidence
{
  return self->_confidence;
}

- (void)setConfidence:(unint64_t)a3
{
  self->_confidence = a3;
}

- (unint64_t)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(unint64_t)a3
{
  self->_deviceClass = a3;
}

- (NSNumber)advertHash
{
  return self->_advertHash;
}

- (void)setAdvertHash:(id)a3
{
  objc_storeStrong((id *)&self->_advertHash, a3);
}

- (unint64_t)productType
{
  return self->_productType;
}

- (void)setProductType:(unint64_t)a3
{
  self->_productType = a3;
}

- (unint64_t)tieBreaker
{
  return self->_tieBreaker;
}

- (void)setTieBreaker:(unint64_t)a3
{
  self->_tieBreaker = a3;
}

- (unint64_t)goodnessScore
{
  return self->_goodnessScore;
}

- (void)setGoodnessScore:(unint64_t)a3
{
  self->_goodnessScore = a3;
}

- (unint64_t)deviceGroup
{
  return self->_deviceGroup;
}

- (void)setDeviceGroup:(unint64_t)a3
{
  self->_deviceGroup = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_advertHash, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)advertisementsArrayWithDictionaryRepresentation:(id)a3
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
  v8[2] = __70__SCDAFAdvertisement_advertisementsArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_25175B360;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
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
  v9[2] = __52__SCDAFAdvertisement_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_25175B388;
  v10 = v5;
  v6 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v9);

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

void __52__SCDAFAdvertisement_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
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

void __70__SCDAFAdvertisement_advertisementsArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SCDAFAdvertisement *v4;

  v3 = a2;
  v4 = -[SCDAFAdvertisement initWithDictionaryRepresentation:]([SCDAFAdvertisement alloc], "initWithDictionaryRepresentation:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

@end
