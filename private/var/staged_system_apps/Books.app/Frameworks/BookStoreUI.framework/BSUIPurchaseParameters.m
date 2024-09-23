@implementation BSUIPurchaseParameters

- (BSUIPurchaseParameters)initWithBuyParams:(id)a3 isAudiobook:(BOOL)a4 hasRacSupport:(BOOL)a5 supportsUnifiedProductPage:(id)a6 editionKind:(id)a7 tracker:(id)a8
{
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  id v16;
  id v17;
  BSUIPurchaseParameters *v18;
  BSUIPurchaseParameters *v19;
  objc_super v21;

  v11 = a5;
  v12 = a4;
  v14 = a3;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v21.receiver = self;
  v21.super_class = (Class)BSUIPurchaseParameters;
  v18 = -[BSUIPurchaseParameters init](&v21, "init");
  v19 = v18;
  if (v18)
  {
    -[BSUIPurchaseParameters setBuyParams:](v18, "setBuyParams:", v14);
    -[BSUIPurchaseParameters setIsAudiobook:](v19, "setIsAudiobook:", v12);
    -[BSUIPurchaseParameters setHasRacSupport:](v19, "setHasRacSupport:", v11);
    -[BSUIPurchaseParameters setTracker:](v19, "setTracker:", v17);
    -[BSUIPurchaseParameters setSupportsUnifiedProductPage:](v19, "setSupportsUnifiedProductPage:", v15);
    -[BSUIPurchaseParameters setEditionKind:](v19, "setEditionKind:", v16);
  }

  return v19;
}

- (NSString)buyParams
{
  return self->_buyParams;
}

- (void)setBuyParams:(id)a3
{
  objc_storeStrong((id *)&self->_buyParams, a3);
}

- (NSString)editionKind
{
  return self->_editionKind;
}

- (void)setEditionKind:(id)a3
{
  objc_storeStrong((id *)&self->_editionKind, a3);
}

- (BOOL)isAudiobook
{
  return self->_isAudiobook;
}

- (void)setIsAudiobook:(BOOL)a3
{
  self->_isAudiobook = a3;
}

- (BOOL)hasRacSupport
{
  return self->_hasRacSupport;
}

- (void)setHasRacSupport:(BOOL)a3
{
  self->_hasRacSupport = a3;
}

- (_TtC13BookAnalytics9BATracker)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)setPageId:(id)a3
{
  objc_storeStrong((id *)&self->_pageId, a3);
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
  objc_storeStrong((id *)&self->_pageType, a3);
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
  objc_storeStrong((id *)&self->_pageContext, a3);
}

- (NSNumber)supportsUnifiedProductPage
{
  return self->_supportsUnifiedProductPage;
}

- (void)setSupportsUnifiedProductPage:(id)a3
{
  self->_supportsUnifiedProductPage = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageType, 0);
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_editionKind, 0);
  objc_storeStrong((id *)&self->_buyParams, 0);
}

@end
