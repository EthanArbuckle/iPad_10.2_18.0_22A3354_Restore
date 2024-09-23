@implementation PXSearchZeroKeywordBaseViewModel

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchZeroKeywordBaseViewModel;
  return -[PXSearchZeroKeywordBaseViewModel init](&v3, sel_init);
}

- (PXSearchZeroKeywordBaseViewModel)initWithType:(int64_t)a3 title:(id)a4 representedObject:(id)a5 displayInfo:(id)a6
{
  id v11;
  id v12;
  id v13;
  PXSearchZeroKeywordBaseViewModel *v14;
  PXSearchZeroKeywordBaseViewModel *v15;
  objc_super v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PXSearchZeroKeywordBaseViewModel;
  v14 = -[PXSearchZeroKeywordBaseViewModel init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_itemType = a3;
    objc_storeStrong((id *)&v14->_title, a4);
    objc_storeStrong(&v15->_representedObject, a5);
    objc_storeStrong(&v15->_displayInfo, a6);
  }

  return v15;
}

- (id)description
{
  void *v2;
  void *v3;

  -[PXSearchZeroKeywordBaseViewModel debugDictionary](self, "debugDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSDictionary)debugDictionary
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("self"));

  -[PXSearchZeroKeywordBaseViewModel itemType](self, "itemType");
  PLSearchHomeItemTypeName();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("itemType"));

  -[PXSearchZeroKeywordBaseViewModel title](self, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("title"));

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[PXSearchZeroKeywordBaseViewModel representedObject](self, "representedObject");
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v10, CFSTR("representedObject"));

  -[PXSearchZeroKeywordBaseViewModel representedObject](self, "representedObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if ((v9 & 1) != 0)
  {
    -[PXSearchZeroKeywordBaseViewModel representedObject](self, "representedObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "debugDictionary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v13, CFSTR("representedObject"));

  }
  v14 = (void *)MEMORY[0x1E0CB3940];
  -[PXSearchZeroKeywordBaseViewModel displayInfo](self, "displayInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "stringWithFormat:", CFSTR("%@"), v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("displayInfo"));

  return (NSDictionary *)v3;
}

- (int64_t)itemType
{
  return self->_itemType;
}

- (NSString)title
{
  return self->_title;
}

- (id)representedObject
{
  return self->_representedObject;
}

- (id)displayInfo
{
  return self->_displayInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_displayInfo, 0);
  objc_storeStrong(&self->_representedObject, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
