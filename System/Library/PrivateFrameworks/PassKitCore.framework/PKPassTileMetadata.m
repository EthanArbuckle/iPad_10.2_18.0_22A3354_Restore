@implementation PKPassTileMetadata

+ (id)_createDictionaryMapForDictionaries:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (v3)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v3, "count"));
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v15 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v10, "PKStringForKey:", CFSTR("identifier"), (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
            objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v7);
    }

    v12 = (void *)objc_msgSend(v4, "copy");
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)_createWithDictionary:(id)a3 privateDictionaryMap:(id)a4 privateDictionary:(id *)a5 context:(int64_t)a6
{
  id v9;
  id v10;
  void *v11;
  int v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  uint64_t v19;

  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v19 = 0;
    objc_msgSend(v9, "PKStringForKey:", CFSTR("type"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = PKPassTileTypeFromString(v11, &v19);

    v13 = 0;
    if (v12)
    {
      objc_msgSend(v9, "PKStringForKey:", CFSTR("identifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = +[PKPassTileMetadata _createMetadataForType:identifier:context:](PKPassTileMetadata, "_createMetadataForType:identifier:context:", v19, v14, a6);
        v17 = v16;
        if (v16 && objc_msgSend(v16, "_setUpWithDictionary:privateDictionary:", v9, v15))
        {
          if (a5)
            objc_storeStrong(a5, v15);
          v13 = v17;
        }
        else
        {
          v13 = 0;
        }

      }
      else
      {
        v13 = 0;
      }

    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)_createMetadataForType:(int64_t)a3 identifier:(id)a4 context:(int64_t)a5
{
  id v7;
  _QWORD *v8;
  _QWORD *v9;

  v7 = a4;
  if ((unint64_t)a3 > 3)
    v8 = 0;
  else
    v8 = objc_alloc(*off_1E2AD2BC0[a3]);
  v9 = -[PKPassTileMetadata _initWithIdentifier:type:context:](v8, v7, a3, a5);

  return v9;
}

- (_QWORD)_initWithIdentifier:(uint64_t)a3 type:(uint64_t)a4 context:
{
  id v8;
  void *v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  objc_super v14;

  v8 = a2;
  v9 = v8;
  if (a1 && v8)
  {
    v14.receiver = a1;
    v14.super_class = (Class)PKPassTileMetadata;
    v10 = objc_msgSendSuper2(&v14, sel_init);
    v11 = v10;
    if (v10)
    {
      objc_storeStrong((id *)v10 + 2, a2);
      v11[3] = a3;
      v11[5] = a4;
    }
    a1 = v11;
    v12 = a1;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (PKPassTileMetadata)init
{

  return 0;
}

- (BOOL)_setUpWithDictionary:(id)a3 privateDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;

  v5 = a3;
  objc_msgSend(v5, "PKStringForKey:", CFSTR("preferredStyle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_preferredStyle = PKPassTileStyleFromString(v6);

  self->_selectable = objc_msgSend(v5, "PKBoolForKey:", CFSTR("selectable"));
  objc_msgSend(v5, "PKNumberForKey:", CFSTR("showInPrearm"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C9AAB0];
  if (v7)
    v8 = v7;
  v9 = v8;

  v10 = objc_msgSend(v9, "BOOLValue");
  self->_showInPrearm = v10;
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileMetadata)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  _QWORD *v11;
  void *v12;
  PKPassTileMetadata *v13;
  void *v14;
  unint64_t v16;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("type"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = PKPassTileTypeFromString(v6, &v16);

  if ((v7 & 1) != 0 && v16 <= 3 && objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = v16;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("contextIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = PKPassTileContextFromString(v9);
    v11 = -[PKPassTileMetadata _initWithIdentifier:type:context:](self, v5, v8, v10);

    if (v11)
    {
      objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("preferredStyle"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11[4] = PKPassTileStyleFromString(v12);

      *((_BYTE *)v11 + 8) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("selectable"));
      *((_BYTE *)v11 + 9) = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("showInPrearm"));
    }
    self = v11;
    v13 = self;
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("PKPassTileMetadataDecoder"), 0, 0);
    objc_msgSend(v4, "failWithError:", v14);

    v13 = 0;
  }

  return v13;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  unint64_t type;
  __CFString *v6;
  int64_t preferredStyle;
  const __CFString *v8;
  const __CFString *v9;
  __CFString *v10;
  unint64_t v11;
  id v12;

  identifier = self->_identifier;
  v12 = a3;
  objc_msgSend(v12, "encodeObject:forKey:", identifier, CFSTR("identifier"));
  type = self->_type;
  if (type > 3)
    v6 = 0;
  else
    v6 = off_1E2AD2BF8[type];
  objc_msgSend(v12, "encodeObject:forKey:", v6, CFSTR("type"));
  preferredStyle = self->_preferredStyle;
  v8 = CFSTR("compact");
  if (preferredStyle != 1)
    v8 = 0;
  if (preferredStyle)
    v9 = v8;
  else
    v9 = CFSTR("default");
  objc_msgSend(v12, "encodeObject:forKey:", v9, CFSTR("preferredStyle"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_selectable, CFSTR("selectable"));
  objc_msgSend(v12, "encodeBool:forKey:", self->_showInPrearm, CFSTR("showInPrearm"));
  v10 = 0;
  v11 = self->_context - 1;
  if (v11 <= 2)
    v10 = off_1E2AD2BE0[v11];
  objc_msgSend(v12, "encodeObject:forKey:", v10, CFSTR("contextIdentifier"));

}

- (PKPassTileMetadataVehicleFunction)metadataTypeVehicleFunction
{
  if (self->_type != 1)
    self = 0;
  return (PKPassTileMetadataVehicleFunction *)self;
}

- (PKPassTileMetadataHorizontalFlowGroup)metadataTypeHorizontalFlowGroup
{
  if (self->_type != 2)
    self = 0;
  return (PKPassTileMetadataHorizontalFlowGroup *)self;
}

- (PKPassTileMetadataVerticalFlowGroup)metadataTypeVerticalFlowGroup
{
  if (self->_type != 3)
    self = 0;
  return (PKPassTileMetadataVerticalFlowGroup *)self;
}

- (BOOL)isGroupType
{
  return +[PKPassTileMetadata isGroupType:](PKPassTileMetadata, "isGroupType:", self->_type);
}

+ (BOOL)isGroupType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int64_t)type
{
  return self->_type;
}

- (int64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)setPreferredStyle:(int64_t)a3
{
  self->_preferredStyle = a3;
}

- (BOOL)isSelectable
{
  return self->_selectable;
}

- (void)setSelectable:(BOOL)a3
{
  self->_selectable = a3;
}

- (BOOL)showInPrearm
{
  return self->_showInPrearm;
}

- (void)setShowInPrearm:(BOOL)a3
{
  self->_showInPrearm = a3;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
