@implementation UISceneOpenExternalURLOptions

- (BOOL)universalLinksOnly
{
  return self->_universalLinksOnly;
}

- (void)setUniversalLinksOnly:(BOOL)universalLinksOnly
{
  self->_universalLinksOnly = universalLinksOnly;
}

- (UIEventAttribution)eventAttribution
{
  return self->_eventAttribution;
}

- (void)setEventAttribution:(UIEventAttribution *)eventAttribution
{
  objc_setProperty_nonatomic_copy(self, a2, eventAttribution, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventAttribution, 0);
}

@end
