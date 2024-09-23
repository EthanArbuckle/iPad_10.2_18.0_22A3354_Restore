@implementation TMLUITableViewDataSource

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  double v3;

  return objc_msgSend_count(self->_sections, a2, v3, a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  double v4;
  void *v5;
  const char *v6;
  double v7;
  int64_t v8;

  objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend_numberOfRows(v5, v6, v7);

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v5;
  const char *v6;
  double v7;
  uint64_t v8;
  const char *v9;
  double v10;
  void *v11;
  const char *v12;
  double v13;
  uint64_t v14;
  const char *v15;
  double v16;
  void *v17;

  sections = self->_sections;
  v5 = a4;
  v8 = objc_msgSend_section(v5, v6, v7);
  objc_msgSend_objectAtIndexedSubscript_(sections, v9, v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_row(v5, v12, v13);

  objc_msgSend_cellForRow_(v11, v15, v16, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_header(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  double v4;
  void *v5;
  const char *v6;
  double v7;
  void *v8;

  objc_msgSend_objectAtIndexedSubscript_(self->_sections, a2, v4, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_footer(v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
