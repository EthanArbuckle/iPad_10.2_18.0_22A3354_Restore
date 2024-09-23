@implementation TUIControlBox

- (Class)layoutClass
{
  return (Class)objc_opt_class(TUIControlLayout, a2);
}

- (NSArray)linkEntities
{
  return self->_linkEntities;
}

- (void)setLinkEntities:(id)a3
{
  objc_storeStrong((id *)&self->_linkEntities, a3);
}

- (BOOL)enableBackgroundForHighlightPreview
{
  return self->_enableBackgroundForHighlightPreview;
}

- (void)setEnableBackgroundForHighlightPreview:(BOOL)a3
{
  self->_enableBackgroundForHighlightPreview = a3;
}

- (BOOL)enableShadowForHighlightPreview
{
  return self->_enableShadowForHighlightPreview;
}

- (void)setEnableShadowForHighlightPreview:(BOOL)a3
{
  self->_enableShadowForHighlightPreview = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkEntities, 0);
}

@end
