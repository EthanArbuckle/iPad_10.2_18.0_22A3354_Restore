@implementation _TUIRenderReferenceOverrideHoverVisibility

- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4
{
  objc_msgSend(a3, "setForceVisibleOnHover:", self->_forceVisibleOnHover, a4);
  return 1;
}

- (TUIRenderReferenceQuery)query
{
  return self->_query;
}

- (void)setQuery:(id)a3
{
  objc_storeStrong((id *)&self->_query, a3);
}

- (BOOL)forceVisibleOnHover
{
  return self->_forceVisibleOnHover;
}

- (void)setForceVisibleOnHover:(BOOL)a3
{
  self->_forceVisibleOnHover = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
