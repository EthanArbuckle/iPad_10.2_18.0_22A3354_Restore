@implementation PUScrubberBarItemController

- (void)setBrowsingSession:(id)a3
{
  PUBrowsingSession *v5;
  PUBrowsingSession *v6;

  v5 = (PUBrowsingSession *)a3;
  if (self->_browsingSession != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_browsingSession, a3);
    -[PUScrubberBarItemController _invalidateScrubberBarButtonItem](self, "_invalidateScrubberBarButtonItem");
    v5 = v6;
  }

}

- (UIBarButtonItem)scrubberBarButtonItem
{
  -[PUScrubberBarItemController _updateScrubberBarButtonItemIfNeeded](self, "_updateScrubberBarButtonItemIfNeeded");
  return self->_scrubberBarButtonItem;
}

- (void)_invalidateScrubberBarButtonItem
{
  UIBarButtonItem *scrubberBarButtonItem;
  PUScrubberView *scrubberView;

  scrubberBarButtonItem = self->_scrubberBarButtonItem;
  self->_scrubberBarButtonItem = 0;

  scrubberView = self->_scrubberView;
  self->_scrubberView = 0;

}

- (void)_updateScrubberBarButtonItemIfNeeded
{
  void *v3;
  PUScrubberView *v4;
  PUScrubberView *scrubberView;
  UIBarButtonItem *v6;
  UIBarButtonItem *scrubberBarButtonItem;

  if (!self->_scrubberBarButtonItem)
  {
    if (self->_scrubberView)
      goto LABEL_5;
    -[PUScrubberBarItemController browsingSession](self, "browsingSession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[PUScrubberView initWithFrame:]([PUScrubberView alloc], "initWithFrame:", 0.0, 0.0, 10.0, 40.0);
    scrubberView = self->_scrubberView;
    self->_scrubberView = v4;

    -[PUScrubberView setBrowsingSession:](self->_scrubberView, "setBrowsingSession:", v3);
    -[PUScrubberView updateIfNeeded](self->_scrubberView, "updateIfNeeded");

    if (!self->_scrubberBarButtonItem)
    {
LABEL_5:
      v6 = (UIBarButtonItem *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC34F0]), "initWithCustomView:", self->_scrubberView);
      scrubberBarButtonItem = self->_scrubberBarButtonItem;
      self->_scrubberBarButtonItem = v6;

      -[UIBarButtonItem _setFlexible:](self->_scrubberBarButtonItem, "_setFlexible:", 1);
    }
  }
}

- (PUBrowsingSession)browsingSession
{
  return self->_browsingSession;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_browsingSession, 0);
  objc_storeStrong((id *)&self->_scrubberBarButtonItem, 0);
  objc_storeStrong((id *)&self->_scrubberView, 0);
}

@end
