@implementation PK_ipp_t

- (PK_ipp_t)init
{
  PK_ipp_t *v2;
  uint64_t v3;
  NSMutableArray *attrs;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PK_ipp_t;
  v2 = -[PK_ipp_t init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    attrs = v2->_attrs;
    v2->_attrs = (NSMutableArray *)v3;

  }
  return v2;
}

- (id)_initWithAttrs:(id)a3
{
  id v4;
  PK_ipp_t *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *attrs;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = -[PK_ipp_t init](self, "init");
  if (v5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          attrs = v5->_attrs;
          v11 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v9), "copy", (_QWORD)v13);
          -[NSMutableArray addObject:](attrs, "addObject:", v11);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v7);
    }

  }
  return v5;
}

- (void)_addAttrToAppropriateGroup:(id)a3
{
  unint64_t v4;
  int v5;
  int v6;
  uint64_t v7;
  unint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[NSMutableArray count](self->_attrs, "count");
  v5 = objc_msgSend(v10, "group_tag");
  if (!v4)
    goto LABEL_13;
  v6 = v5;
  v7 = 0;
  v8 = -1;
  while (1)
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_attrs, "objectAtIndexedSubscript:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "group_tag") != v6)
      break;
    v8 = ++v7;
LABEL_7:

    if (v7 == v4)
      goto LABEL_10;
  }
  if (v8 == -1)
  {
    ++v7;
    goto LABEL_7;
  }

LABEL_10:
  if (v8 == -1 || v8 >= v4)
  {
LABEL_13:
    -[NSMutableArray addObject:](self->_attrs, "addObject:", v10);
    goto LABEL_14;
  }
  -[NSMutableArray insertObject:atIndex:](self->_attrs, "insertObject:atIndex:", v10, v8);
LABEL_14:

}

- (void)_withGroupingBehavior:(id)a3
{
  id v4;
  BOOL addAttributesInAppropriateGroups;
  id v6;

  v4 = a3;
  addAttributesInAppropriateGroups = self->_addAttributesInAppropriateGroups;
  self->_addAttributesInAppropriateGroups = 1;
  v6 = v4;
  (*((void (**)(id, PK_ipp_t *))v4 + 2))(v4, self);
  self->_addAttributesInAppropriateGroups = addAttributesInAppropriateGroups;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PK_ipp_t)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  PK_ipp_t *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_dataRepresentation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PK_ipp_t initWithData:](self, "initWithData:", v5);

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[PK_ipp_t dataRepresentation](self, "dataRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("_dataRepresentation"));

}

- (id)_descriptionLeader
{
  return CFSTR("raw collection");
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)PK_ipp_t;
  -[PK_ipp_t description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ { %d attrs @ %p }"), v4, -[NSMutableArray count](self->_attrs, "count"), self->_attrs);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)debugDescription
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PK_ipp_t userCodableDictionary](self, "userCodableDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v2, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ { %@ }"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)userCodableDictionary
{
  void *v3;
  NSMutableArray *attrs;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;
  _QWORD v13[4];
  id v14;
  void *v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  attrs = self->_attrs;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __33__PK_ipp_t_userCodableDictionary__block_invoke;
  v13[3] = &unk_24E6CB080;
  v5 = v3;
  v14 = v5;
  -[NSMutableArray enumerateObjectsUsingBlock:](attrs, "enumerateObjectsUsingBlock:", v13);
  v6 = (void *)MEMORY[0x24BDD17C8];
  v12.receiver = self;
  v12.super_class = (Class)PK_ipp_t;
  -[PK_ipp_t description](&v12, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PK_ipp_t _descriptionLeader](self, "_descriptionLeader");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ %@"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v9;
  v16[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)enumerateAttributes:(id)a3
{
  id v4;
  NSMutableArray *attrs;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  attrs = self->_attrs;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __32__PK_ipp_t_enumerateAttributes___block_invoke;
  v7[3] = &unk_24E6CB0A8;
  v8 = v4;
  v6 = v4;
  -[NSMutableArray enumerateObjectsUsingBlock:](attrs, "enumerateObjectsUsingBlock:", v7);

}

- (void)replaceOrAddAttribute:(id)a3 withAttribute:(id)a4 settingGroup:(int)a5
{
  uint64_t v5;
  id v8;
  id v9;
  NSMutableArray *attrs;
  uint64_t v11;
  void *v12;
  NSMutableArray *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = *(_QWORD *)&a5;
  v8 = a3;
  v9 = a4;
  attrs = self->_attrs;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __61__PK_ipp_t_replaceOrAddAttribute_withAttribute_settingGroup___block_invoke;
  v15[3] = &unk_24E6CB0D0;
  v14 = v8;
  v16 = v14;
  v11 = -[NSMutableArray indexOfObjectPassingTest:](attrs, "indexOfObjectPassingTest:", v15);
  v12 = (void *)objc_msgSend(v9, "_copySettingGroup:", v5);
  v13 = self->_attrs;
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray addObject:](v13, "addObject:", v12);
  else
    -[NSMutableArray replaceObjectAtIndex:withObject:](v13, "replaceObjectAtIndex:withObject:", v11, v12);

}

- (PK_ipp_t)initWithData:(id)a3
{
  id v4;
  PK_ipp_t *v5;
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v11;
  uint64_t v12;
  void *dataRemaining;
  NSObject *v14;
  uint8_t v16[16];
  uint64_t v17;
  id v18;

  v4 = a3;
  v5 = -[PK_ipp_t init](self, "init");
  if (v5)
  {
    v17 = 0;
    v6 = v4;
    v18 = v6;
    v7 = (void *)MEMORY[0x227667A1C](-[PK_ipp_t setState:](v5, "setState:", 0));
    do
    {
      v8 = ippReadIO(&v17, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))_read_cb, v5);
      v9 = v8;
    }
    while (v8 != -1 && v8 != 3);
    objc_autoreleasePoolPop(v7);
    if (v9 == 3)
    {
      v11 = objc_msgSend(v6, "length");
      if (v11 - v17 < 1)
      {
LABEL_15:

        goto LABEL_16;
      }
      objc_msgSend(v6, "subdataWithRange:");
      v12 = objc_claimAutoreleasedReturnValue();
      dataRemaining = v5->_dataRemaining;
      v5->_dataRemaining = (NSData *)v12;
    }
    else
    {
      _PKLogCategory(PKLogCategoryDefault[0]);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_220F9A000, v14, OS_LOG_TYPE_DEFAULT, "Couldn't convert data to ipp", v16, 2u);
      }

      dataRemaining = v5;
      v5 = 0;
    }

    goto LABEL_15;
  }
LABEL_16:

  return v5;
}

- (id)dataRepresentation
{
  void *v3;
  void *v4;

  -[PK_ipp_t setState:](self, "setState:", 0);
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithCapacity:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x227667A1C]();
  ippWriteIO(v3, (uint64_t (*)(void *, unsigned __int8 *, unint64_t))_write_cb, self);
  objc_autoreleasePoolPop(v4);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[PK_ipp_t dataRepresentation](self, "dataRepresentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataRepresentation");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqual:", v6);

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PK_ipp_t dataRepresentation](self, "dataRepresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  void *v4;

  -[PK_ipp_t dataRepresentation](self, "dataRepresentation", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithData:", v3);

  return v4;
}

- (id)mutableCopy
{
  return -[PK_ipp_t copyWithZone:](self, "copyWithZone:", 0);
}

- (void)withNewAttr:(id)a3 groupTag:(int)a4 valueTag:(int)a5 apply:(id)a6
{
  uint64_t v7;
  uint64_t v8;
  void (**v10)(id, PK_ipp_attribute_t *);
  PK_ipp_attribute_t *v11;
  id v12;

  v7 = *(_QWORD *)&a5;
  v8 = *(_QWORD *)&a4;
  v12 = a3;
  v10 = (void (**)(id, PK_ipp_attribute_t *))a6;
  v11 = -[PK_ipp_attribute_t initWithName:group:value:]([PK_ipp_attribute_t alloc], "initWithName:group:value:", v12, v8, v7);
  v10[2](v10, v11);
  if (self->_addAttributesInAppropriateGroups)
    -[PK_ipp_t _addAttrToAppropriateGroup:](self, "_addAttrToAppropriateGroup:", v11);
  else
    -[NSMutableArray addObject:](self->_attrs, "addObject:", v11);

}

- (id)addNewEmptyAttribute:(id)a3 groupTag:(int)a4 valueTag:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  PK_ipp_attribute_t *v9;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  v9 = -[PK_ipp_attribute_t initWithName:group:value:]([PK_ipp_attribute_t alloc], "initWithName:group:value:", v8, v6, v5);
  if (self->_addAttributesInAppropriateGroups)
    -[PK_ipp_t _addAttrToAppropriateGroup:](self, "_addAttrToAppropriateGroup:", v9);
  else
    -[NSMutableArray addObject:](self->_attrs, "addObject:", v9);

  return v9;
}

- (void)_addRange:(int)a3 name:(id)a4 lower:(int)a5 upper:(int)a6
{
  uint64_t v8;
  id v10;
  _QWORD v11[4];
  int v12;
  int v13;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  if (v10 && v8 <= 5 && (_DWORD)v8 != 3)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __39__PK_ipp_t__addRange_name_lower_upper___block_invoke;
    v11[3] = &__block_descriptor_40_e28_v16__0__PK_ipp_attribute_t_8l;
    v12 = a5;
    v13 = a6;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v10, v8, 51, v11);
  }

}

- (void)_addRanges:(int)a3 name:(id)a4 values:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v6 <= 5 && (_DWORD)v6 != 3 && objc_msgSend(v9, "count"))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __35__PK_ipp_t__addRanges_name_values___block_invoke;
    v11[3] = &unk_24E6CB160;
    v12 = v10;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v8, v6, 51, v11);

  }
}

- (void)_addBoolean:(int)a3 name:(id)a4 value:(BOOL)a5
{
  uint64_t v6;
  id v8;
  _QWORD v9[4];
  BOOL v10;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  if (v8 && v6 <= 5 && (_DWORD)v6 != 3)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __35__PK_ipp_t__addBoolean_name_value___block_invoke;
    v9[3] = &__block_descriptor_33_e28_v16__0__PK_ipp_attribute_t_8l;
    v10 = a5;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v8, v6, 34, v9);
  }

}

- (void)_addInteger:(int)a3 valueTag:(int)a4 name:(id)a5 value:(int)a6
{
  uint64_t v7;
  uint64_t v8;
  id v10;
  _QWORD v11[4];
  int v12;

  v7 = *(_QWORD *)&a4;
  v8 = *(_QWORD *)&a3;
  v10 = a5;
  if (v10 && v8 <= 5 && (_DWORD)v8 != 3)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __44__PK_ipp_t__addInteger_valueTag_name_value___block_invoke;
    v11[3] = &__block_descriptor_36_e28_v16__0__PK_ipp_attribute_t_8l;
    v12 = a6;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v10, v8, v7, v11);
  }

}

- (void)_addString:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 value:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[2];

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v17[1] = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v14 && v10 <= 5 && (_DWORD)v10 != 3)
  {
    v17[0] = v14;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v17, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PK_ipp_t _addStrings:valueTag:name:lang:values:](self, "_addStrings:valueTag:name:lang:values:", v10, v9, v12, v13, v16);

  }
}

- (void)_addStrings:(int)a3 valueTag:(int)a4 name:(id)a5 lang:(id)a6 values:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  int v19;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  v15 = v14;
  if (v12 && v10 <= 5 && (_DWORD)v10 != 3 && objc_msgSend(v14, "count"))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __50__PK_ipp_t__addStrings_valueTag_name_lang_values___block_invoke;
    v16[3] = &unk_24E6CB208;
    v17 = v15;
    v18 = v13;
    v19 = v9;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v12, v10, v9, v16);

  }
}

- (void)_addCollection:(int)a3 name:(id)a4 value:(id)a5
{
  uint64_t v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v6 = *(_QWORD *)&a3;
  v8 = a4;
  v9 = a5;
  v10 = v9;
  if (v8 && v6 <= 5 && (_DWORD)v6 != 3)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__PK_ipp_t__addCollection_name_value___block_invoke;
    v11[3] = &unk_24E6CB160;
    v12 = v9;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v8, v6, 52, v11);

  }
}

- (void)_addResolution:(int)a3 name:(id)a4 unit:(int)a5 xres:(int)a6 yres:(int)a7
{
  uint64_t v10;
  id v12;
  _QWORD v13[4];
  int v14;
  int v15;
  int v16;

  v10 = *(_QWORD *)&a3;
  v12 = a4;
  if (v12
    && v10 <= 5
    && (_DWORD)v10 != 3
    && ((a7 | a6) & 0x80000000) == 0
    && (a5 - 5) >= 0xFFFFFFFE)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __47__PK_ipp_t__addResolution_name_unit_xres_yres___block_invoke;
    v13[3] = &__block_descriptor_44_e28_v16__0__PK_ipp_attribute_t_8l;
    v14 = a6;
    v15 = a7;
    v16 = a5;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v12, v10, 50, v13);
  }

}

- (void)_addOctetString:(int)a3 name:(id)a4 data:(const void *)a5 length:(int)a6
{
  uint64_t v8;
  id v10;
  _QWORD v11[5];
  int v12;

  v8 = *(_QWORD *)&a3;
  v10 = a4;
  if (v10 && v8 <= 5 && (_DWORD)v8 != 3 && !(a6 >> 15))
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __45__PK_ipp_t__addOctetString_name_data_length___block_invoke;
    v11[3] = &__block_descriptor_44_e28_v16__0__PK_ipp_attribute_t_8l;
    v11[4] = a5;
    v12 = a6;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v10, v8, 48, v11);
  }

}

- (void)_deleteAttribute:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  v4 = -[NSMutableArray indexOfObject:](self->_attrs, "indexOfObject:");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableArray removeObjectAtIndex:](self->_attrs, "removeObjectAtIndex:", v4);

}

- (void)_addIntegers:(int)a3 valueTag:(int)a4 name:(id)a5 count:(unint64_t)a6 adder:(id)a7
{
  uint64_t v9;
  uint64_t v10;
  id v12;
  id v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  unint64_t v17;

  v9 = *(_QWORD *)&a4;
  v10 = *(_QWORD *)&a3;
  v12 = a5;
  v13 = a7;
  v14 = v13;
  if (v12 && v10 <= 5 && (_DWORD)v10 != 3 && a6)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __51__PK_ipp_t__addIntegers_valueTag_name_count_adder___block_invoke;
    v15[3] = &unk_24E6CB2C0;
    v16 = v13;
    v17 = a6;
    -[PK_ipp_t withNewAttr:groupTag:valueTag:apply:](self, "withNewAttr:groupTag:valueTag:apply:", v12, v10, v9, v15);

  }
}

- (id)_findAttribute0:(id)a3 valueTag:(int)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  int v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    objc_msgSend(v6, "lowercaseString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __37__PK_ipp_t__findAttribute0_valueTag___block_invoke;
    v12[3] = &unk_24E6CB2E8;
    v13 = v8;
    v14 = &v16;
    v15 = a4;
    v9 = v8;
    -[PK_ipp_t enumerateAttributes:](self, "enumerateAttributes:", v12);
    v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (NSData)dataRemaining
{
  return (NSData *)objc_getProperty(self, a2, 40, 1);
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (unsigned)request_id
{
  return self->_request_id;
}

- (void)setRequest_id:(unsigned int)a3
{
  self->_request_id = a3;
}

- (unsigned)op_or_status
{
  return self->_op_or_status;
}

- (void)setOp_or_status:(unsigned __int16)a3
{
  self->_op_or_status = a3;
}

- (NSMutableArray)attrs
{
  return (NSMutableArray *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataRemaining, 0);
  objc_storeStrong((id *)&self->_attrs, 0);
}

@end
