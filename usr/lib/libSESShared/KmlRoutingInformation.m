@implementation KmlRoutingInformation

- (KmlRoutingInformation)initWithReaderInformation:(id)a3
{
  return -[KmlRoutingInformation initWithInformation:readerIdentifier:](self, "initWithInformation:readerIdentifier:", a3, 0);
}

- (KmlRoutingInformation)initWithInformation:(id)a3 readerIdentifier:(id)a4
{
  id v6;
  __CFString *v7;
  KmlRoutingInformation *v8;
  void *v9;
  uint64_t v10;
  NSString *manufacturer;
  uint64_t v12;
  NSString *regionString;
  uint64_t v14;
  NSString *brand;
  __CFString *v16;
  __CFString *v17;
  uint64_t v18;
  NSString *v19;
  uint64_t v20;
  NSString *v21;
  uint64_t v22;
  NSString *v23;
  NSString *readerIdentifier;
  NSString *v25;
  NSString *v26;
  NSString *v27;
  objc_super v29;

  v6 = a3;
  v7 = (__CFString *)a4;
  v29.receiver = self;
  v29.super_class = (Class)KmlRoutingInformation;
  v8 = -[KmlRoutingInformation init](&v29, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR("."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "count") == 3)
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", 0);
      v10 = objc_claimAutoreleasedReturnValue();
      manufacturer = v8->_manufacturer;
      v8->_manufacturer = (NSString *)v10;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v12 = objc_claimAutoreleasedReturnValue();
      regionString = v8->_regionString;
      v8->_regionString = (NSString *)v12;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v14 = objc_claimAutoreleasedReturnValue();
      brand = v8->_brand;
      v8->_brand = (NSString *)v14;

      v16 = CFSTR("Unknown");
      if (v7)
        v16 = v7;
      v17 = v16;
    }
    else
    {
      if (objc_msgSend(v9, "count") != 5)
      {
        v25 = v8->_manufacturer;
        v8->_manufacturer = (NSString *)CFSTR("Unknown");

        v26 = v8->_regionString;
        v8->_regionString = (NSString *)CFSTR("Unknown");

        v27 = v8->_brand;
        v8->_brand = (NSString *)CFSTR("Unknown");

        readerIdentifier = v8->_readerIdentifier;
        v8->_readerIdentifier = (NSString *)CFSTR("Unknown");
        goto LABEL_10;
      }
      objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = v8->_manufacturer;
      v8->_manufacturer = (NSString *)v18;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = v8->_regionString;
      v8->_regionString = (NSString *)v20;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 3);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v8->_brand;
      v8->_brand = (NSString *)v22;

      objc_msgSend(v9, "objectAtIndexedSubscript:", 4);
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    readerIdentifier = v8->_readerIdentifier;
    v8->_readerIdentifier = &v17->isa;
LABEL_10:

  }
  return v8;
}

- (id)getReaderInformation
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("V.%@.%@.%@.%@"), self->_manufacturer, self->_regionString, self->_brand, self->_readerIdentifier);
}

- (id)getRoutingInformation
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@.%@"), self->_manufacturer, self->_regionString, self->_brand);
}

- (NSString)manufacturer
{
  return self->_manufacturer;
}

- (NSString)regionString
{
  return self->_regionString;
}

- (NSString)brand
{
  return self->_brand;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_brand, 0);
  objc_storeStrong((id *)&self->_regionString, 0);
  objc_storeStrong((id *)&self->_manufacturer, 0);
}

@end
