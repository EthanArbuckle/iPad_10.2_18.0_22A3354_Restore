@implementation WFiTunesStoreObject

- (NSString)formattedPrice
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setNumberStyle:", 2);
  -[WFiTunesStoreObject currencyCode](self, "currencyCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCurrencyCode:", v4);

  -[WFiTunesStoreObject price](self, "price");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (NSString)artistID
{
  return self->_artistID;
}

- (NSString)artistName
{
  return self->_artistName;
}

- (NSDate)releaseDate
{
  return self->_releaseDate;
}

- (NSNumber)price
{
  return self->_price;
}

- (NSString)currencyCode
{
  return self->_currencyCode;
}

- (NSString)descriptionText
{
  return self->_descriptionText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_storeStrong((id *)&self->_currencyCode, 0);
  objc_storeStrong((id *)&self->_price, 0);
  objc_storeStrong((id *)&self->_releaseDate, 0);
  objc_storeStrong((id *)&self->_artistName, 0);
  objc_storeStrong((id *)&self->_artistID, 0);
}

+ (id)JSONKeyPathsByPropertyKey
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;
  _QWORD v7[6];
  _QWORD v8[7];

  v8[6] = *MEMORY[0x1E0C80C00];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesStoreObject;
  objc_msgSendSuper2(&v6, sel_JSONKeyPathsByPropertyKey);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  v7[0] = CFSTR("currencyCode");
  v7[1] = CFSTR("artistID");
  v8[0] = CFSTR("currency");
  v8[1] = CFSTR("artistId");
  v7[2] = CFSTR("artistName");
  v7[3] = CFSTR("kind");
  v8[2] = CFSTR("artistName");
  v8[3] = CFSTR("kind");
  v7[4] = CFSTR("releaseDate");
  v7[5] = CFSTR("descriptionText");
  v8[4] = CFSTR("releaseDate");
  v8[5] = &unk_1E7B8D9A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addEntriesFromDictionary:", v4);

  return v3;
}

+ (id)descriptionTextJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:](MTLValueTransformer, "transformerUsingForwardBlock:", &__block_literal_global_317_37547);
}

id __53__WFiTunesStoreObject_descriptionTextJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKey:", CFSTR("longDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(v2, "objectForKey:", CFSTR("description"));
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

@end
