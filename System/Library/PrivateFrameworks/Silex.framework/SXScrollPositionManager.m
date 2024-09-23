@implementation SXScrollPositionManager

- (void)updateScrollPosition:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[SXScrollPositionManager scrollPositionRestoring](self, "scrollPositionRestoring");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateScrollPosition:animated:", v6, v4);

}

- (SXScrollPositionRestoring)scrollPositionRestoring
{
  return (SXScrollPositionRestoring *)objc_loadWeakRetained((id *)&self->_scrollPositionRestoring);
}

- (void)setScrollPositionRestoring:(id)a3
{
  objc_storeWeak((id *)&self->_scrollPositionRestoring, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollPositionRestoring);
}

@end
