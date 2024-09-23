@implementation EMState

- (void)setCurrentSheet:(id)a3
{
  objc_storeWeak((id *)&self->_currentSheet, a3);
}

- (EDSheet)currentSheet
{
  return (EDSheet *)objc_loadWeakRetained((id *)&self->_currentSheet);
}

- (id)hyperlinkForRow:(unint64_t)a3 column:(unint64_t)a4
{
  NSMutableDictionary *hyperlinks;
  void *v5;
  void *v6;

  hyperlinks = self->_hyperlinks;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4 | (a3 << 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](hyperlinks, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setHyperlink:(id)a3 forRow:(unint64_t)a4 column:(unint64_t)a5
{
  NSMutableDictionary *hyperlinks;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  void *v11;
  id v12;

  v12 = a3;
  hyperlinks = self->_hyperlinks;
  if (!hyperlinks)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v10 = self->_hyperlinks;
    self->_hyperlinks = v9;

    hyperlinks = self->_hyperlinks;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5 | (a4 << 16));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](hyperlinks, "setObject:forKey:", v12, v11);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hyperlinks, 0);
  objc_destroyWeak((id *)&self->_currentSheet);
  objc_storeStrong((id *)&self->_workbook, 0);
}

@end
