@implementation _TUIFeedSectionDebugButton

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double y;
  double x;
  _TUIFeedSectionDebug **p_debug;
  id v7;
  id WeakRetained;
  void *v9;

  y = a4.y;
  x = a4.x;
  p_debug = &self->_debug;
  v7 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_debug);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "contextMenuInteraction:configurationForMenuAtLocation:", v7, x, y));

  return v9;
}

- (_TUIFeedSectionDebug)debug
{
  return (_TUIFeedSectionDebug *)objc_loadWeakRetained((id *)&self->_debug);
}

- (void)setDebug:(id)a3
{
  objc_storeWeak((id *)&self->_debug, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_debug);
}

@end
