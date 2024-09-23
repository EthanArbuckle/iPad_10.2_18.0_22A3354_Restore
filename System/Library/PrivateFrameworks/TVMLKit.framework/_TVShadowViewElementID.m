@implementation _TVShadowViewElementID

- (_TVShadowViewElementID)initWithViewElement:(id)a3
{
  void *v3;
  id v6;
  _TVShadowViewElementID *v7;
  _TVShadowViewElementID *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *itemID;
  objc_super v15;

  v6 = a3;
  if (!v6)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("The view element must not be nil."));
  v15.receiver = self;
  v15.super_class = (Class)_TVShadowViewElementID;
  v7 = -[_TVShadowViewElementID init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewElement, a3);
    objc_msgSend(v6, "attributes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("itemID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (!v10)
    {
      objc_msgSend(v6, "attributes");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("searchResultIdentifier"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = objc_msgSend(v11, "copy");
    itemID = v8->_itemID;
    v8->_itemID = (NSString *)v12;

    if (!v10)
    {

    }
  }

  return v8;
}

- (_TVShadowViewElementID)init
{
  -[_TVShadowViewElementID doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unint64_t)hash
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[_TVShadowViewElementID itemID](self, "itemID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[_TVShadowViewElementID itemID](self, "itemID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "hash");
  }
  else
  {
    -[_TVShadowViewElementID viewElement](self, "viewElement");
    v5 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)v5;
  }
  v6 = v5;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "viewElement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_TVShadowViewElementID viewElement](self, "viewElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {
      v10 = 1;
    }
    else
    {
      objc_msgSend(v5, "itemID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[_TVShadowViewElementID itemID](self, "itemID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, itemID: %@, viewElement: %@>"), v5, self, self->_itemID, self->_viewElement);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (IKViewElement)viewElement
{
  return self->_viewElement;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end
