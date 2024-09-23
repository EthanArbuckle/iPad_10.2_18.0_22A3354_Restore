@implementation _SRUIFDataStoreEntry

- (_SRUIFDataStoreEntry)initWithType:(int64_t)a3 value:(id)a4
{
  id v7;
  _SRUIFDataStoreEntry *v8;
  _SRUIFDataStoreEntry *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_SRUIFDataStoreEntry;
  v8 = -[_SRUIFDataStoreEntry init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_type = a3;
    objc_storeStrong(&v8->_value, a4);
  }

  return v9;
}

- (id)_propertyListStringForType
{
  if (-[_SRUIFDataStoreEntry type](self, "type"))
    return CFSTR("Image");
  else
    return CFSTR("Unknown");
}

- (int64_t)_typeForPropertyListString:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("Image"));
}

- (id)_valuePropertyListRepresentation
{
  id value;
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;

  value = self->_value;
  if (self->_type == 1)
  {
    v3 = (void *)MEMORY[0x24BDBCED8];
    v4 = value;
    objc_msgSend(v3, "dictionary");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "imageData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("PNGData"));

    v7 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v4, "scale");
    v9 = v8;

    objc_msgSend(v7, "numberWithDouble:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v10, CFSTR("Scale"));

  }
  else
  {
    v5 = value;
  }
  return v5;
}

- (id)_valueForPropertyListRepresentation:(id)a3 type:(int64_t)a4
{
  id v5;
  id v6;
  SRUIFImagePNGData *v7;
  void *v8;
  void *v9;

  v5 = a3;
  if (a4 == 1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v6 = v5;
    v7 = objc_alloc_init(SRUIFImagePNGData);
    objc_msgSend(v6, "objectForKey:", CFSTR("PNGData"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFImagePNGData setImageData:](v7, "setImageData:", v8);

    objc_msgSend(v6, "objectForKey:", CFSTR("Scale"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "doubleValue");
    -[SRUIFImagePNGData setScale:](v7, "setScale:");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)propertyListRepresentation
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", &unk_24DC26470, CFSTR("Version"));
  -[_SRUIFDataStoreEntry _propertyListStringForType](self, "_propertyListStringForType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("Type"));

  -[_SRUIFDataStoreEntry _valuePropertyListRepresentation](self, "_valuePropertyListRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("Value"));

  return v3;
}

- (_SRUIFDataStoreEntry)initWithPropertyListRepresentation:(id)a3 error:(id *)p_isa
{
  id v6;
  SRUIFDictionarySchema *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a3;
  v7 = objc_alloc_init(SRUIFDictionarySchema);
  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v7, "setObjectCoercion:forKey:", v8, CFSTR("Version"));

  +[SRUIFCoercion typeAssertionWithClass:](SRUIFCoercion, "typeAssertionWithClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFDictionarySchema setObjectCoercion:forKey:](v7, "setObjectCoercion:forKey:", v9, CFSTR("Type"));

  -[SRUIFDictionarySchema coerceObject:error:](v7, "coerceObject:error:", v6, p_isa);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Version"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "integerValue");

  if (v12 == 1)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("Type"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[_SRUIFDataStoreEntry _typeForPropertyListString:](self, "_typeForPropertyListString:", v13);

    objc_msgSend(v10, "objectForKey:", CFSTR("Value"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SRUIFDataStoreEntry _valueForPropertyListRepresentation:type:](self, "_valueForPropertyListRepresentation:type:", v15, v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
    {
      self = -[_SRUIFDataStoreEntry initWithType:value:](self, "initWithType:value:", v14, v16);
      p_isa = (id *)&self->super.isa;
    }
    else if (p_isa)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Unable to decode value for data store entry %@"), v6);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[SRUIFConversationError errorWithCode:localizedFailureReason:](SRUIFConversationError, "errorWithCode:localizedFailureReason:", 300, v17);
      *p_isa = (id)objc_claimAutoreleasedReturnValue();

      p_isa = 0;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE08FB0], OS_LOG_TYPE_ERROR))
      -[_SRUIFDataStoreEntry initWithPropertyListRepresentation:error:].cold.1();
    p_isa = 0;
  }

  return (_SRUIFDataStoreEntry *)p_isa;
}

- (int64_t)type
{
  return self->_type;
}

- (id)value
{
  return self->_value;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

- (void)initWithPropertyListRepresentation:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_219F26000, v0, v1, "%s unable to deserialize property list with version %{public}ld; returning nil",
    v2,
    v3,
    v4,
    v5,
    2u);
}

@end
