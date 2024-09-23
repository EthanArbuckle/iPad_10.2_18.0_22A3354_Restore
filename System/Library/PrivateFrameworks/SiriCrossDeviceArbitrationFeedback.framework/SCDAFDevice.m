@implementation SCDAFDevice

- (SCDAFDevice)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  SCDAFDevice *v5;
  void *v6;
  uint64_t v7;
  NSString *idsIdentifier;
  void *v9;
  uint64_t v10;
  NSString *build;
  void *v12;
  uint64_t v13;
  NSString *enclosureColor;
  void *v15;
  uint64_t v16;
  NSString *locale;
  void *v18;
  uint64_t v19;
  NSString *name;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  NSArray *productTypes;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  NSArray *deviceClass;
  void *v32;
  uint64_t v33;
  NSString *speechId;
  void *v35;
  uint64_t v36;
  NSString *assistantId;
  void *v38;
  char isKindOfClass;
  void *v40;
  uint64_t v41;
  NSString *roomName;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  _QWORD v51[4];
  id v52;
  objc_super v53;

  v4 = a3;
  v53.receiver = self;
  v53.super_class = (Class)SCDAFDevice;
  v5 = -[SCDAFDevice init](&v53, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("idsIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "length"))
    {
      v7 = objc_msgSend(v6, "copy");
      idsIdentifier = v5->_idsIdentifier;
      v5->_idsIdentifier = (NSString *)v7;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("build"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v9, "length"))
    {
      v10 = objc_msgSend(v9, "copy");
      build = v5->_build;
      v5->_build = (NSString *)v10;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("enclosureColor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v12, "length"))
    {
      v13 = objc_msgSend(v12, "copy");
      enclosureColor = v5->_enclosureColor;
      v5->_enclosureColor = (NSString *)v13;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("locale"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v15, "length"))
    {
      v16 = objc_msgSend(v15, "copy");
      locale = v5->_locale;
      v5->_locale = (NSString *)v16;

    }
    v45 = v15;
    v46 = v12;
    v47 = v9;
    v48 = v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("name"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v18, "length"))
    {
      v19 = objc_msgSend(v18, "copy");
      name = v5->_name;
      v5->_name = (NSString *)v19;

    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("productTypes"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = MEMORY[0x24BDAC760];
    v51[0] = MEMORY[0x24BDAC760];
    v51[1] = 3221225472;
    v51[2] = __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke;
    v51[3] = &unk_25175B2E8;
    v24 = v21;
    v52 = v24;
    v44 = v22;
    objc_msgSend(v22, "enumerateObjectsUsingBlock:", v51);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v24);
    v25 = objc_claimAutoreleasedReturnValue();
    productTypes = v5->_productTypes;
    v5->_productTypes = (NSArray *)v25;

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("deviceClass"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v49[0] = v23;
    v49[1] = 3221225472;
    v49[2] = __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke_2;
    v49[3] = &unk_25175B2E8;
    v29 = v27;
    v50 = v29;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v49);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v29);
    v30 = objc_claimAutoreleasedReturnValue();
    deviceClass = v5->_deviceClass;
    v5->_deviceClass = (NSArray *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("speechId"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v32, "length"))
    {
      v33 = objc_msgSend(v32, "copy");
      speechId = v5->_speechId;
      v5->_speechId = (NSString *)v33;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("assistantId"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v35, "length"))
    {
      v36 = objc_msgSend(v35, "copy");
      assistantId = v5->_assistantId;
      v5->_assistantId = (NSString *)v36;

    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roomName"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("roomName"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "copy");
      roomName = v5->_roomName;
      v5->_roomName = (NSString *)v41;

    }
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDD17C8];
  -[SCDAFDevice dictionaryRepresentation](self, "dictionaryRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)dictionaryRepresentation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSString length](self->_idsIdentifier, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_idsIdentifier, CFSTR("idsIdentifier"));
  if (-[NSString length](self->_build, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_build, CFSTR("build"));
  if (-[NSString length](self->_enclosureColor, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_enclosureColor, CFSTR("enclosureColor"));
  if (-[NSString length](self->_locale, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_locale, CFSTR("locale"));
  if (-[NSString length](self->_name, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_name, CFSTR("name"));
  if (-[NSArray count](self->_productTypes, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_productTypes, CFSTR("productTypes"));
  if (-[NSArray count](self->_deviceClass, "count"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_deviceClass, CFSTR("deviceClass"));
  if (-[NSString length](self->_assistantId, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_assistantId, CFSTR("assistantId"));
  if (-[NSString length](self->_speechId, "length"))
    objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_speechId, CFSTR("speechId"));
  -[SCDAFDevice roomName](self, "roomName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (v5)
  {
    -[SCDAFDevice roomName](self, "roomName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("roomName"));

  }
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *idsIdentifier;
  id v5;

  idsIdentifier = self->_idsIdentifier;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", idsIdentifier, CFSTR("idsIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_build, CFSTR("build"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_enclosureColor, CFSTR("enclosureColor"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_locale, CFSTR("locale"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_name, CFSTR("name"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_productTypes, CFSTR("productTypes"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_deviceClass, CFSTR("deviceClass"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_assistantId, CFSTR("assistantId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_speechId, CFSTR("speechId"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_roomName, CFSTR("roomName"));

}

- (SCDAFDevice)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SCDAFDevice *v13;
  void *v16;

  v3 = a3;
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("idsIdentifier"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("build"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("enclosureColor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("locale"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("productTypes"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("deviceClass"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("assistantId"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("speechId"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("roomName"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(SCDAFDevice);
  -[SCDAFDevice setIdsIdentifier:](v13, "setIdsIdentifier:", v16);
  -[SCDAFDevice setBuild:](v13, "setBuild:", v4);
  -[SCDAFDevice setEnclosureColor:](v13, "setEnclosureColor:", v5);
  -[SCDAFDevice setLocale:](v13, "setLocale:", v6);
  -[SCDAFDevice setName:](v13, "setName:", v7);
  -[SCDAFDevice setProductTypes:](v13, "setProductTypes:", v8);
  -[SCDAFDevice setDeviceClass:](v13, "setDeviceClass:", v9);
  -[SCDAFDevice setAssistantId:](v13, "setAssistantId:", v10);
  -[SCDAFDevice setSpeechId:](v13, "setSpeechId:", v11);
  -[SCDAFDevice setRoomName:](v13, "setRoomName:", v12);

  return v13;
}

- (NSString)assistantId
{
  return self->_assistantId;
}

- (void)setAssistantId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)build
{
  return self->_build;
}

- (void)setBuild:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)enclosureColor
{
  return self->_enclosureColor;
}

- (void)setEnclosureColor:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)idsIdentifier
{
  return self->_idsIdentifier;
}

- (void)setIdsIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)roomName
{
  return self->_roomName;
}

- (void)setRoomName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)speechId
{
  return self->_speechId;
}

- (void)setSpeechId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSArray)productTypes
{
  return self->_productTypes;
}

- (void)setProductTypes:(id)a3
{
  objc_storeStrong((id *)&self->_productTypes, a3);
}

- (NSArray)deviceClass
{
  return self->_deviceClass;
}

- (void)setDeviceClass:(id)a3
{
  objc_storeStrong((id *)&self->_deviceClass, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceClass, 0);
  objc_storeStrong((id *)&self->_productTypes, 0);
  objc_storeStrong((id *)&self->_speechId, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_idsIdentifier, 0);
  objc_storeStrong((id *)&self->_enclosureColor, 0);
  objc_storeStrong((id *)&self->_build, 0);
  objc_storeStrong((id *)&self->_assistantId, 0);
}

void __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v3, "length"))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

void __48__SCDAFDevice_initWithDictionaryRepresentation___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);

}

+ (id)devicesArrayWithDictionaryRepresentation:(id)a3
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
  v8[2] = __56__SCDAFDevice_devicesArrayWithDictionaryRepresentation___block_invoke;
  v8[3] = &unk_25175B360;
  v6 = v5;
  v9 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);

  return v6;
}

+ (unint64_t)deviceClassFromProductTypeString:(id)a3
{
  id v3;
  unint64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "containsString:", CFSTR("iPhone")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("iPad")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("Watch")) & 1) != 0)
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("AudioAccessory")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "containsString:", CFSTR("AppleTV")) & 1) != 0)
  {
    v4 = 4;
  }
  else if (objc_msgSend(v3, "containsString:", CFSTR("mac")))
  {
    v4 = 6;
  }
  else
  {
    v4 = 0;
  }

  return v4;
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
  v9[2] = __45__SCDAFDevice_arrayDictionaryRepresentation___block_invoke;
  v9[3] = &unk_25175B2C0;
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

void __45__SCDAFDevice_arrayDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
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

void __56__SCDAFDevice_devicesArrayWithDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  SCDAFDevice *v4;

  v3 = a2;
  v4 = -[SCDAFDevice initWithDictionaryRepresentation:]([SCDAFDevice alloc], "initWithDictionaryRepresentation:", v3);

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
}

@end
