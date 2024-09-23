@implementation STKListItem

- (STKListItem)initWithText:(id)a3 selected:(BOOL)a4
{
  id v6;
  STKListItem *v7;
  uint64_t v8;
  NSString *text;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)STKListItem;
  v7 = -[STKListItem init](&v11, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    text = v7->_text;
    v7->_text = (NSString *)v8;

    v7->_selected = a4;
  }

  return v7;
}

- (void)encodeWithXPCDictionary:(id)a3
{
  xpc_object_t xdict;

  xdict = a3;
  BSSerializeStringToXPCDictionaryWithKey();
  xpc_dictionary_set_BOOL(xdict, "_selected", self->_selected);

}

- (STKListItem)initWithXPCDictionary:(id)a3
{
  id v4;
  STKListItem *v5;
  uint64_t v6;
  NSString *text;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STKListItem;
  v5 = -[STKListItem init](&v9, sel_init);
  if (v5)
  {
    BSDeserializeStringFromXPCDictionaryWithKey();
    v6 = objc_claimAutoreleasedReturnValue();
    text = v5->_text;
    v5->_text = (NSString *)v6;

    v5->_selected = xpc_dictionary_get_BOOL(v4, "_selected");
  }

  return v5;
}

- (NSString)text
{
  return self->_text;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_text, 0);
}

@end
