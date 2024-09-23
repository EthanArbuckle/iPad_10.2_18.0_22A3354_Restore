@implementation UIKBAutoFillTestTableViewDataSource

- (UIKBAutoFillTestTableViewDataSource)init
{
  UIKBAutoFillTestTableViewDataSource *v2;
  uint64_t v3;
  NSMutableDictionary *rowCountMap;
  uint64_t v5;
  NSMutableDictionary *visibleCellDataMap;
  uint64_t v7;
  NSMutableDictionary *headerDataMap;
  uint64_t v9;
  NSMutableDictionary *footerDataMap;
  UIKBAutoFillTestTableViewDataSource *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKBAutoFillTestTableViewDataSource;
  v2 = -[UIKBAutoFillTestTableViewDataSource init](&v13, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    rowCountMap = v2->_rowCountMap;
    v2->_rowCountMap = (NSMutableDictionary *)v3;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v5 = objc_claimAutoreleasedReturnValue();
    visibleCellDataMap = v2->_visibleCellDataMap;
    v2->_visibleCellDataMap = (NSMutableDictionary *)v5;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v7 = objc_claimAutoreleasedReturnValue();
    headerDataMap = v2->_headerDataMap;
    v2->_headerDataMap = (NSMutableDictionary *)v7;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    footerDataMap = v2->_footerDataMap;
    v2->_footerDataMap = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (UIKBAutoFillTestTableViewDataSource)initWithCoder:(id)a3
{
  id v4;
  UIKBAutoFillTestTableViewDataSource *v5;
  void *v6;
  uint64_t v7;
  NSMutableDictionary *rowCountMap;
  void *v9;
  uint64_t v10;
  NSMutableDictionary *visibleCellDataMap;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *headerDataMap;
  void *v15;
  uint64_t v16;
  NSMutableDictionary *footerDataMap;
  UIKBAutoFillTestTableViewDataSource *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)UIKBAutoFillTestTableViewDataSource;
  v5 = -[UIKBAutoFillTestTableViewDataSource init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("rowCountMap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "mutableCopy");
    rowCountMap = v5->_rowCountMap;
    v5->_rowCountMap = (NSMutableDictionary *)v7;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("visibleCellDataMap"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mutableCopy");
    visibleCellDataMap = v5->_visibleCellDataMap;
    v5->_visibleCellDataMap = (NSMutableDictionary *)v10;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("headerDataMap"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "mutableCopy");
    headerDataMap = v5->_headerDataMap;
    v5->_headerDataMap = (NSMutableDictionary *)v13;

    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("footerDataMap"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "mutableCopy");
    footerDataMap = v5->_footerDataMap;
    v5->_footerDataMap = (NSMutableDictionary *)v16;

    v18 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSMutableDictionary *rowCountMap;
  id v5;

  rowCountMap = self->_rowCountMap;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", rowCountMap, CFSTR("rowCountMap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_visibleCellDataMap, CFSTR("visibleCellDataMap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_headerDataMap, CFSTR("headerDataMap"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_footerDataMap, CFSTR("footerDataMap"));

}

- (void)setNumberOfRows:(int64_t)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *rowCountMap;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  rowCountMap = self->_rowCountMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](rowCountMap, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setCellData:(id)a3 forRowAtIndexPath:(id)a4
{
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_visibleCellDataMap, "setObject:forKeyedSubscript:", a3, a4);
}

- (void)setHeaderData:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *headerDataMap;
  void *v6;
  id v7;
  id v8;

  headerDataMap = self->_headerDataMap;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](headerDataMap, "setObject:forKeyedSubscript:", v7, v8);

}

- (void)setFooterData:(id)a3 forSection:(int64_t)a4
{
  NSMutableDictionary *footerDataMap;
  void *v6;
  id v7;
  id v8;

  footerDataMap = self->_footerDataMap;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithInteger:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](footerDataMap, "setObject:forKeyedSubscript:", v7, v8);

}

- (int64_t)numberOfSections
{
  return -[NSMutableDictionary count](self->_rowCountMap, "count");
}

- (int64_t)numberOfRowsInSection:(int64_t)a3
{
  NSMutableDictionary *rowCountMap;
  void *v4;
  void *v5;
  int64_t v6;

  rowCountMap = self->_rowCountMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](rowCountMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (id)cellForRowAtIndexPath:(id)a3
{
  void *v3;
  UITableViewCell *v4;
  UITableViewCell *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  UITableViewCell *v10;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_visibleCellDataMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cell");
  v4 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    v5 = [UITableViewCell alloc];
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@"), v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[UITableViewCell initWithStyle:reuseIdentifier:](v5, "initWithStyle:reuseIdentifier:", 0, v9);

  }
  v10 = v4;

  return v10;
}

- (double)heightForRowAtIndexPath:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_visibleCellDataMap, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "height");
  if (v4 == 0.0)
    v5 = 44.0;
  else
    v5 = v4;

  return v5;
}

- (id)titleForHeaderInSection:(int64_t)a3
{
  NSMutableDictionary *headerDataMap;
  void *v4;
  void *v5;
  void *v6;

  headerDataMap = self->_headerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](headerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)titleForFooterInSection:(int64_t)a3
{
  NSMutableDictionary *footerDataMap;
  void *v4;
  void *v5;
  void *v6;

  footerDataMap = self->_footerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](footerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (double)heightForHeaderInSection:(int64_t)a3
{
  NSMutableDictionary *headerDataMap;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  headerDataMap = self->_headerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](headerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "height");
  v6 = -1.0;
  if (v7 > 0.0)
  {
    objc_msgSend(v5, "height");
    v6 = v8;
  }

  return v6;
}

- (double)heightForFooterInSection:(int64_t)a3
{
  NSMutableDictionary *footerDataMap;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  footerDataMap = self->_footerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](footerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "height");
  v6 = -1.0;
  if (v7 > 0.0)
  {
    objc_msgSend(v5, "height");
    v6 = v8;
  }

  return v6;
}

- (id)viewForHeaderInSection:(int64_t)a3
{
  NSMutableDictionary *headerDataMap;
  void *v4;
  void *v5;
  void *v6;

  headerDataMap = self->_headerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](headerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "headerFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)viewForFooterInSection:(int64_t)a3
{
  NSMutableDictionary *footerDataMap;
  void *v4;
  void *v5;
  void *v6;

  footerDataMap = self->_footerDataMap;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](footerDataMap, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "headerFooterView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerDataMap, 0);
  objc_storeStrong((id *)&self->_headerDataMap, 0);
  objc_storeStrong((id *)&self->_visibleCellDataMap, 0);
  objc_storeStrong((id *)&self->_rowCountMap, 0);
}

@end
