@implementation REHTMLParentElement

- (REHTMLParentElement)initWithParents:(id)a3 children:(id)a4
{
  id v7;
  id v8;
  REHTMLParentElement *v9;
  REHTMLParentElement *v10;
  uint64_t v11;
  NSArray *children;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)REHTMLParentElement;
  v9 = -[REHTMLElement init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parent, a3);
    v11 = objc_msgSend(v8, "copy");
    children = v10->_children;
    v10->_children = (NSArray *)v11;

  }
  return v10;
}

- (id)_encodedData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEC8], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _prefixContentString](self->_parent, "_prefixContentString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v3, "appendData:", v5);
  -[REHTMLElement _contentString](self->_parent, "_contentString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v3, "appendData:", v7);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = self->_children;
  v9 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "encodedData", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendData:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v10);
  }

  -[REHTMLElement _suffixContentString](self->_parent, "_suffixContentString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[REHTMLElement _encodeString:](self, "_encodeString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend(v3, "appendData:", v15);
  v16 = (void *)objc_msgSend(v3, "copy", (_QWORD)v18);

  return v16;
}

- (id)classes
{
  void *v2;
  void *v3;
  id v4;

  -[REHTMLElement classes](self->_parent, "classes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1A8];
  v4 = v2;

  return v4;
}

- (id)elementBySettingClasses:(id)a3
{
  void *v4;
  void *v5;

  -[REHTMLElement elementBySettingClasses:](self->_parent, "elementBySettingClasses:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParents:children:", v4, self->_children);

  return v5;
}

- (id)attributes
{
  void *v2;
  void *v3;
  id v4;

  -[REHTMLElement attributes](self->_parent, "attributes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x24BDBD1B8];
  v4 = v2;

  return v4;
}

- (id)elementBySettingAtttibutes:(id)a3
{
  void *v4;
  void *v5;

  -[REHTMLElement elementBySettingAtttibutes:](self->_parent, "elementBySettingAtttibutes:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithParents:children:", v4, self->_children);

  return v5;
}

- (id)addChildren:(id)a3
{
  id v4;
  id v5;
  REHTMLElement *parent;
  void *v7;
  REHTMLParentElement *v8;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_alloc((Class)objc_opt_class());
    parent = self->_parent;
    -[NSArray arrayByAddingObjectsFromArray:](self->_children, "arrayByAddingObjectsFromArray:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (REHTMLParentElement *)objc_msgSend(v5, "initWithParents:children:", parent, v7);

  }
  else
  {
    v8 = self;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REHTMLParentElement;
  v4 = -[REHTMLElement copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_storeStrong(v4 + 2, self->_parent);
  objc_storeStrong(v4 + 3, self->_children);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
}

@end
