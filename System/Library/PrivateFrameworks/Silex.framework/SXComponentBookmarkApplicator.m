@implementation SXComponentBookmarkApplicator

- (SXComponentBookmarkApplicator)initWithScrollPositionRestoring:(id)a3
{
  id v5;
  SXComponentBookmarkApplicator *v6;
  SXComponentBookmarkApplicator *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXComponentBookmarkApplicator;
  v6 = -[SXComponentBookmarkApplicator init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_scrollPositionRestoring, a3);

  return v7;
}

- (void)applyBookmark:(id)a3
{
  void *v4;
  SXComponentScrollPosition *v5;
  void *v6;
  SXComponentScrollPosition *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v9, "componentIdentifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v4)
      {
        v5 = [SXComponentScrollPosition alloc];
        objc_msgSend(v9, "componentIdentifier");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = -[SXComponentScrollPosition initWithComponentIdentifier:canvasWidth:relativePageOffset:](v5, "initWithComponentIdentifier:canvasWidth:relativePageOffset:", v6, 0.0, 0.0);

        -[SXComponentBookmarkApplicator scrollPositionRestoring](self, "scrollPositionRestoring");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "updateScrollPosition:animated:", v7, 0);

      }
    }
  }

}

- (SXScrollPositionRestoring)scrollPositionRestoring
{
  return self->_scrollPositionRestoring;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollPositionRestoring, 0);
}

@end
