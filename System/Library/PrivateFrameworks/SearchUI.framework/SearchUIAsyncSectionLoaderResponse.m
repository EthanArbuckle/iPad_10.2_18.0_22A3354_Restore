@implementation SearchUIAsyncSectionLoaderResponse

- (NSArray)cardSection
{
  return self->_cardSection;
}

- (void)setCardSection:(id)a3
{
  objc_storeStrong((id *)&self->_cardSection, a3);
}

- (BOOL)animated
{
  return self->_animated;
}

- (void)setAnimated:(BOOL)a3
{
  self->_animated = a3;
}

- (BOOL)reconfigureExisting
{
  return self->_reconfigureExisting;
}

- (void)setReconfigureExisting:(BOOL)a3
{
  self->_reconfigureExisting = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cardSection, 0);
}

@end
