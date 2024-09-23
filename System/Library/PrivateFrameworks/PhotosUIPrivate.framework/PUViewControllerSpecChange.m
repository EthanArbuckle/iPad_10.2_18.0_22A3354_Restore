@implementation PUViewControllerSpecChange

- (BOOL)changed
{
  return -[PUViewControllerSpecChange traitCollectionChanged](self, "traitCollectionChanged")
      || -[PUViewControllerSpecChange layoutReferenceSizeChanged](self, "layoutReferenceSizeChanged")
      || -[PUViewControllerSpecChange layoutStyleChanged](self, "layoutStyleChanged")
      || -[PUViewControllerSpecChange presentedForSecondScreenChanged](self, "presentedForSecondScreenChanged")
      || -[PUViewControllerSpecChange secondScreenSizeChanged](self, "secondScreenSizeChanged")
      || -[PUViewControllerSpecChange prefersCompactLayoutForSplitScreenChanged](self, "prefersCompactLayoutForSplitScreenChanged");
}

- (BOOL)traitCollectionChanged
{
  return self->_traitCollectionChanged;
}

- (void)setTraitCollectionChanged:(BOOL)a3
{
  self->_traitCollectionChanged = a3;
}

- (BOOL)layoutReferenceSizeChanged
{
  return self->_layoutReferenceSizeChanged;
}

- (void)setLayoutReferenceSizeChanged:(BOOL)a3
{
  self->_layoutReferenceSizeChanged = a3;
}

- (BOOL)layoutStyleChanged
{
  return self->_layoutStyleChanged;
}

- (void)setLayoutStyleChanged:(BOOL)a3
{
  self->_layoutStyleChanged = a3;
}

- (BOOL)presentedForSecondScreenChanged
{
  return self->_presentedForSecondScreenChanged;
}

- (void)setPresentedForSecondScreenChanged:(BOOL)a3
{
  self->_presentedForSecondScreenChanged = a3;
}

- (BOOL)secondScreenSizeChanged
{
  return self->_secondScreenSizeChanged;
}

- (void)setSecondScreenSizeChanged:(BOOL)a3
{
  self->_secondScreenSizeChanged = a3;
}

- (BOOL)prefersCompactLayoutForSplitScreenChanged
{
  return self->_prefersCompactLayoutForSplitScreenChanged;
}

- (void)setPrefersCompactLayoutForSplitScreenChanged:(BOOL)a3
{
  self->_prefersCompactLayoutForSplitScreenChanged = a3;
}

@end
