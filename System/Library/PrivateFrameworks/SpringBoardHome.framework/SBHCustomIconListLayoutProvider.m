@implementation SBHCustomIconListLayoutProvider

- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3 defaultLayout:(id)a4
{
  id v6;
  id v7;
  SBHCustomIconListLayoutProvider *v8;
  uint64_t v9;
  NSDictionary *listLayouts;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBHCustomIconListLayoutProvider;
  v8 = -[SBHCustomIconListLayoutProvider init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    listLayouts = v8->_listLayouts;
    v8->_listLayouts = (NSDictionary *)v9;

    objc_storeStrong((id *)&v8->_defaultLayout, a4);
  }

  return v8;
}

- (SBHCustomIconListLayoutProvider)initWithListLayouts:(id)a3
{
  return -[SBHCustomIconListLayoutProvider initWithListLayouts:defaultLayout:](self, "initWithListLayouts:defaultLayout:", a3, 0);
}

- (SBHCustomIconListLayoutProvider)init
{
  return -[SBHCustomIconListLayoutProvider initWithListLayouts:defaultLayout:](self, "initWithListLayouts:defaultLayout:", MEMORY[0x1E0C9AA70], 0);
}

- (id)layoutForIconLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBHCustomIconListLayoutProvider listLayouts](self, "listLayouts");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[SBHCustomIconListLayoutProvider defaultLayout](self, "defaultLayout");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (NSDictionary)listLayouts
{
  return self->_listLayouts;
}

- (SBIconListLayout)defaultLayout
{
  return self->_defaultLayout;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultLayout, 0);
  objc_storeStrong((id *)&self->_listLayouts, 0);
}

@end
