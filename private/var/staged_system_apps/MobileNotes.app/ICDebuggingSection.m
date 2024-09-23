@implementation ICDebuggingSection

- (ICDebuggingSection)initWithTitle:(id)a3 items:(id)a4
{
  id v7;
  id v8;
  ICDebuggingSection *v9;
  ICDebuggingSection *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ICDebuggingSection;
  v9 = -[ICDebuggingSection init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_title, a3);
    objc_storeStrong((id *)&v10->_items, a4);
  }

  return v10;
}

- (NSString)identifier
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection title](self, "title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "uppercaseString"));

  return (NSString *)v3;
}

- (void)setDestructive:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v3 = a3;
  self->_destructive = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection items](self, "items", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), "setDestructive:", v3);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)ICDebuggingSection;
  v3 = -[ICDebuggingSection debugDescription](&v9, "debugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection items](self, "items"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@, title: %@, items: %@"), v4, v5, v6));

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  ICDebuggingSection *v4;
  void *v5;
  void *v6;
  ICDebuggingSection *v7;

  v4 = +[ICDebuggingSection allocWithZone:](ICDebuggingSection, "allocWithZone:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection title](self, "title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICDebuggingSection items](self, "items"));
  v7 = -[ICDebuggingSection initWithTitle:items:](v4, "initWithTitle:items:", v5, v6);

  return v7;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
  objc_storeStrong((id *)&self->_items, a3);
}

- (BOOL)isDestructive
{
  return self->_destructive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
