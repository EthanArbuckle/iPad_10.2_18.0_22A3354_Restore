@implementation SXResolvedAutoPlacement

- (SXResolvedAutoPlacement)initWithAdvertisement:(id)a3 suggestedArticles:(id)a4
{
  id v7;
  id v8;
  SXResolvedAutoPlacement *v9;
  SXResolvedAutoPlacement *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXResolvedAutoPlacement;
  v9 = -[SXResolvedAutoPlacement init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_advertisement, a3);
    objc_storeStrong((id *)&v10->_suggestedArticles, a4);
  }

  return v10;
}

- (SXAdvertisementPlacementType)advertisement
{
  return self->_advertisement;
}

- (SXSuggestedArticlesPlacementType)suggestedArticles
{
  return self->_suggestedArticles;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedArticles, 0);
  objc_storeStrong((id *)&self->_advertisement, 0);
}

@end
