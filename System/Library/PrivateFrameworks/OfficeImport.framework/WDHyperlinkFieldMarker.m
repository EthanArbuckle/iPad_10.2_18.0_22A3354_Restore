@implementation WDHyperlinkFieldMarker

- (int)runType
{
  return 8;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WDHyperlinkFieldMarker;
  -[WDFieldMarker description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)internalLink
{
  return *((_BYTE *)self + 72) & 1;
}

- (void)setInternalLink:(BOOL)a3
{
  *((_BYTE *)self + 72) = *((_BYTE *)self + 72) & 0xFE | a3;
}

- (NSString)link
{
  return self->mLink;
}

- (void)setLink:(id)a3
{
  objc_storeStrong((id *)&self->mLink, a3);
}

- (NSString)fragment
{
  return self->mFragment;
}

- (void)setFragment:(id)a3
{
  objc_storeStrong((id *)&self->mFragment, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mFragment, 0);
  objc_storeStrong((id *)&self->mLink, 0);
}

@end
