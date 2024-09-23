@implementation PKSharingGenericMessage

- (PKSharingGenericMessage)initWithVertical:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6
{
  PKSharingGenericMessage *v6;

  if (a3 == 2)
  {
    self = -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:](self, "initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:", 2, a4, a5, a6, 0);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6
{
  return -[PKSharingGenericMessage initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:](self, "initWithFormat:type:genericSharingDict:appleSharingDict:displayInformation:", a3, a4, a5, a6, 0);
}

- (PKSharingGenericMessage)initWithFormat:(unint64_t)a3 type:(unint64_t)a4 genericSharingDict:(id)a5 appleSharingDict:(id)a6 displayInformation:(id)a7
{
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  PKSharingGenericMessage *v20;

  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_msgSend(a5, "mutableCopy");
  v15 = v14;
  if (v14)
    v16 = v14;
  else
    v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = v16;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setObject:forKeyedSubscript:", v18, CFSTR("sharingDataType"));

  objc_msgSend((id)objc_opt_class(), "_contentForGenericSharingDict:appleSharingDict:format:", v17, v13, a3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[PKSharingMessage initWithContent:format:type:displayInformation:](self, "initWithContent:format:type:displayInformation:", v19, a3, a4, v12);
  return v20;
}

- (BOOL)configureWithContent:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  NSDictionary *v7;
  NSDictionary *genericSharingDict;
  NSDictionary *v9;
  NSDictionary *appleSharingDict;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PKSharingGenericMessage;
  v5 = -[PKSharingMessage configureWithContent:](&v12, sel_configureWithContent_, v4);
  if (v5)
  {
    PKSharingMessageGenericDataKeyForFormat(-[PKSharingMessage format](self, "format"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "PKDictionaryForKey:", v6);
    v7 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    genericSharingDict = self->_genericSharingDict;
    self->_genericSharingDict = v7;

    objc_msgSend(v4, "PKDictionaryForKey:", CFSTR("apple"));
    v9 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    appleSharingDict = self->_appleSharingDict;
    self->_appleSharingDict = v9;

  }
  return v5;
}

+ (id)_contentForGenericSharingDict:(id)a3 appleSharingDict:(id)a4 format:(unint64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a3;
  PKSharingMessageGenericDataKeyForFormat(a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v9;
  v12[1] = CFSTR("apple");
  v13[0] = v8;
  v13[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = (void *)MEMORY[0x1E0CB37A0];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; "), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PKSharingMessage identifier](self, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("identifier: '%@'; "), v7);

  PKSharingMessageTypeToString(-[PKSharingMessage type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("type: '%@'; "), v8);

  PKSharingMessageFormatToString(-[PKSharingMessage format](self, "format"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("format: '%@'; "), v9);

  objc_msgSend(v6, "appendFormat:", CFSTR("genericSharingDict: '%@'; "), self->_genericSharingDict);
  objc_msgSend(v6, "appendFormat:", CFSTR("appleSharingDict: '%@'; "), self->_appleSharingDict);
  -[PKSharingMessage displayInformation](self, "displayInformation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("displayInformation: '%@'; "), v10);

  objc_msgSend(v6, "appendFormat:", CFSTR(">"));
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (self->_genericSharingDict)
    objc_msgSend(v3, "addObject:");
  if (self->_appleSharingDict)
    objc_msgSend(v4, "addObject:");
  v5 = PKCombinedHash(17, v4);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  PKSharingGenericMessage *v4;
  PKSharingGenericMessage *v5;
  BOOL v6;

  v4 = (PKSharingGenericMessage *)a3;
  v5 = v4;
  if (v4 == self)
    v6 = 1;
  else
    v6 = v4
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && -[PKSharingGenericMessage isEqualToSharingGenericMessage:](self, "isEqualToSharingGenericMessage:", v5);

  return v6;
}

- (BOOL)isEqualToSharingGenericMessage:(id)a3
{
  _QWORD *v4;
  NSDictionary *genericSharingDict;
  NSDictionary *v6;
  BOOL v7;
  char v8;
  NSDictionary *appleSharingDict;
  NSDictionary *v11;
  BOOL v12;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSharingGenericMessage;
  if (!-[PKSharingGenericMessage isEqual:](&v13, sel_isEqual_, v4))
    goto LABEL_8;
  genericSharingDict = self->_genericSharingDict;
  v6 = (NSDictionary *)v4[6];
  if (genericSharingDict)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    if ((-[NSDictionary isEqual:](genericSharingDict, "isEqual:") & 1) != 0)
      goto LABEL_11;
LABEL_8:
    v8 = 0;
    goto LABEL_9;
  }
  if (genericSharingDict != v6)
    goto LABEL_8;
LABEL_11:
  appleSharingDict = self->_appleSharingDict;
  v11 = (NSDictionary *)v4[7];
  if (appleSharingDict)
    v12 = v11 == 0;
  else
    v12 = 1;
  if (v12)
    v8 = appleSharingDict == v11;
  else
    v8 = -[NSDictionary isEqual:](appleSharingDict, "isEqual:");
LABEL_9:

  return v8;
}

- (void)addEmbeddedMessages:(id)a3
{
  NSDictionary *appleSharingDict;
  id v5;
  void *v6;
  void *v7;
  id v8;
  NSDictionary *v9;
  NSDictionary *v10;
  void *v11;
  id v12;

  appleSharingDict = self->_appleSharingDict;
  v5 = a3;
  v6 = (void *)-[NSDictionary mutableCopy](appleSharingDict, "mutableCopy");
  v7 = v6;
  if (v6)
    v8 = v6;
  else
    v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = v8;

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v5, CFSTR("embededMessages"));
  v9 = (NSDictionary *)objc_msgSend(v12, "copy");
  v10 = self->_appleSharingDict;
  self->_appleSharingDict = v9;

  objc_msgSend((id)objc_opt_class(), "_contentForGenericSharingDict:appleSharingDict:format:", self->_genericSharingDict, v12, -[PKSharingMessage format](self, "format"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKSharingMessage updateMessageContentTo:](self, "updateMessageContentTo:", v11);

}

- (id)embeddedMessageURLs
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[NSDictionary PKArrayContaining:forKey:](self->_appleSharingDict, "PKArrayContaining:forKey:", objc_opt_class(), CFSTR("embededMessages"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v17 = v2;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v9, "PKURLForKey:", CFSTR("address"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "PKStringForKey:", CFSTR("targetDeviceType"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v10)
            v13 = v11 == 0;
          else
            v13 = 1;
          if (!v13)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", PKPassCredentialShareTargetDeviceFromString(v11));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, v14);

          }
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v6);
    }

    v15 = (void *)objc_msgSend(v3, "copy");
    v2 = v17;
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (NSDictionary)genericSharingDict
{
  return self->_genericSharingDict;
}

- (NSDictionary)appleSharingDict
{
  return self->_appleSharingDict;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appleSharingDict, 0);
  objc_storeStrong((id *)&self->_genericSharingDict, 0);
}

@end
