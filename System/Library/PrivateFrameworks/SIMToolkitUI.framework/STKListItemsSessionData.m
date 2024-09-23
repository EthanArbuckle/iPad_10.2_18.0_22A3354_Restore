@implementation STKListItemsSessionData

- (STKListItemsSessionData)initWithText:(id)a3 simLabel:(id)a4 listItems:(id)a5
{
  id v9;
  STKListItemsSessionData *v10;
  STKListItemsSessionData *v11;
  objc_super v13;

  v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)STKListItemsSessionData;
  v10 = -[STKTextSessionData initWithText:simLabel:](&v13, sel_initWithText_simLabel_, a3, a4);
  v11 = v10;
  if (v10)
    objc_storeStrong((id *)&v10->_listItems, a5);

  return v11;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)STKListItemsSessionData;
  v3 = a3;
  -[STKTextSessionData encodeWithXPCDictionary:](&v4, sel_encodeWithXPCDictionary_, v3);
  BSSerializeArrayOfBSXPCEncodableObjectsToXPCDictionaryWithKey();

}

- (STKListItemsSessionData)initWithXPCDictionary:(id)a3
{
  id v4;
  STKListItemsSessionData *v5;
  uint64_t v6;
  NSArray *listItems;
  uint64_t v8;
  NSArray *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKListItemsSessionData;
  v5 = -[STKTextSessionData initWithXPCDictionary:](&v11, sel_initWithXPCDictionary_, v4);
  if (v5)
  {
    BSDeserializeArrayOfBSXPCEncodableObjectsFromXPCDictionaryWithKey();
    v6 = objc_claimAutoreleasedReturnValue();
    listItems = v5->_listItems;
    v5->_listItems = (NSArray *)v6;

    if (!v5->_listItems)
    {
      objc_msgSend(MEMORY[0x24BDBCE30], "array");
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = v5->_listItems;
      v5->_listItems = (NSArray *)v8;

    }
  }

  return v5;
}

- (NSArray)listItems
{
  return self->_listItems;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listItems, 0);
}

@end
