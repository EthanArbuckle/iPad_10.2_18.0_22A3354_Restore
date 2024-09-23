@implementation _TUIRenderReferenceOverrideAlpha

- (BOOL)updateLayoutAttributes:(id)a3 forIdentifier:(id)a4
{
  objc_msgSend(a3, "setAlpha:", self->_alpha);
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

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_query, 0);
}

@end
