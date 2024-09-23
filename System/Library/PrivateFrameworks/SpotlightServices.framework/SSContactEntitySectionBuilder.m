@implementation SSContactEntitySectionBuilder

- (BOOL)shouldSkipSection
{
  return !-[SSSectionBuilder isContactEntitySearch](self, "isContactEntitySearch");
}

- (SSContactResultBuilder)contactResultBuilder
{
  return (SSContactResultBuilder *)objc_loadWeakRetained((id *)&self->_contactResultBuilder);
}

- (void)setContactResultBuilder:(id)a3
{
  objc_storeWeak((id *)&self->_contactResultBuilder, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_contactResultBuilder);
}

@end
