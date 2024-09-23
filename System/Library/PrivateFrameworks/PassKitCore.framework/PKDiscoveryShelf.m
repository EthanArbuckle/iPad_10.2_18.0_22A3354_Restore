@implementation PKDiscoveryShelf

+ (id)shelfWithDictionary:(id)a3
{
  id v3;
  id v4;
  __objc2_class **v5;
  void *v6;
  char v8;

  v3 = a3;
  objc_msgSend(v3, "PKStringForKey:", CFSTR("shelfType"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("textBlock"), "isEqualToString:", v4) & 1) != 0)
  {
    v5 = off_1E2A9EAC8;
LABEL_7:

    goto LABEL_8;
  }
  if ((objc_msgSend(CFSTR("inlineMedia"), "isEqualToString:", v4) & 1) != 0)
  {
    v5 = off_1E2A9EA68;
    goto LABEL_7;
  }
  if ((objc_msgSend(CFSTR("spacer"), "isEqualToString:", v4) & 1) != 0)
  {
    v5 = off_1E2A9EAC0;
    goto LABEL_7;
  }
  v8 = objc_msgSend(CFSTR("callToAction"), "isEqualToString:", v4);

  if ((v8 & 1) == 0)
  {
    v6 = 0;
    goto LABEL_9;
  }
  v5 = off_1E2A9EA48;
LABEL_8:
  v6 = (void *)objc_msgSend(objc_alloc(*v5), "initWithDictionary:", v3);
LABEL_9:

  return v6;
}

- (void)setItem:(id)a3
{
  PKDiscoveryItem **p_item;
  id v5;
  NSString *v6;
  NSString *itemIdentifier;

  p_item = &self->_item;
  v5 = a3;
  objc_storeWeak((id *)p_item, v5);
  objc_msgSend(v5, "identifier");
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();

  itemIdentifier = self->_itemIdentifier;
  self->_itemIdentifier = v6;

}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_type == v4[3];

  return v5;
}

- (unint64_t)hash
{
  return self->_type + 527;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t type;
  id v5;

  type = self->_type;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", type, CFSTR("shelfType"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_itemIdentifier, CFSTR("itemIdentifier"));

}

- (PKDiscoveryShelf)initWithCoder:(id)a3
{
  id v4;
  PKDiscoveryShelf *v5;
  uint64_t v6;
  NSString *itemIdentifier;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKDiscoveryShelf;
  v5 = -[PKDiscoveryShelf init](&v9, sel_init);
  if (v5)
  {
    v5->_type = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("shelfType"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("itemIdentifier"));
    v6 = objc_claimAutoreleasedReturnValue();
    itemIdentifier = v5->_itemIdentifier;
    v5->_itemIdentifier = (NSString *)v6;

  }
  return v5;
}

- (PKDiscoveryItem)item
{
  return (PKDiscoveryItem *)objc_loadWeakRetained((id *)&self->_item);
}

- (int64_t)type
{
  return self->_type;
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_item);
  objc_storeStrong((id *)&self->_itemIdentifier, 0);
}

@end
