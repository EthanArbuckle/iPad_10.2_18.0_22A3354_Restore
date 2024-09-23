@implementation UABestAppSuggestionManagerProxy

- (void)setWeakManager:(id)a3
{
  objc_storeWeak((id *)&self->_weakManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakManager);
}

- (void)notifyBestAppsChanged:(id)a3 when:(id)a4 confidence:(double)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a4;
  v9 = a3;
  -[UABestAppSuggestionManagerProxy weakManager](self, "weakManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "notifyBestAppsChanged:when:confidence:", v9, v8, a5);

}

- (UABestAppSuggestionManager)weakManager
{
  return (UABestAppSuggestionManager *)objc_loadWeakRetained((id *)&self->_weakManager);
}

@end
