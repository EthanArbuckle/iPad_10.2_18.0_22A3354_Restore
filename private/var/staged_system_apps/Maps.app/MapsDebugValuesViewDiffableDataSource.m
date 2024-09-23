@implementation MapsDebugValuesViewDiffableDataSource

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id WeakRetained;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_debugVC);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sectionAtIndex:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
  return v7;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id WeakRetained;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_debugVC);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "sectionAtIndex:", a4));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "footer"));
  return v7;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debugVC);
}

@end
