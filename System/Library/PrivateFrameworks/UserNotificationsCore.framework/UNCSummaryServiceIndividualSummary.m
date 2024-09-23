@implementation UNCSummaryServiceIndividualSummary

- (UNCSummaryServiceIndividualSummary)initWithSpotlightIdentifier:(id)a3 individualSummary:(id)a4 isHighlight:(BOOL)a5 contentCreationDate:(id)a6
{
  id v10;
  id v11;
  id v12;
  UNCSummaryServiceIndividualSummary *v13;
  uint64_t v14;
  NSString *spotlightIdentifier;
  uint64_t v16;
  NSAttributedString *individualSummary;
  uint64_t v18;
  NSDate *contentCreationDate;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v21.receiver = self;
  v21.super_class = (Class)UNCSummaryServiceIndividualSummary;
  v13 = -[UNCSummaryServiceIndividualSummary init](&v21, sel_init);
  if (v13)
  {
    v14 = objc_msgSend(v10, "copy");
    spotlightIdentifier = v13->_spotlightIdentifier;
    v13->_spotlightIdentifier = (NSString *)v14;

    v16 = objc_msgSend(v11, "copy");
    individualSummary = v13->_individualSummary;
    v13->_individualSummary = (NSAttributedString *)v16;

    v13->_isHighlight = a5;
    v18 = objc_msgSend(v12, "copy");
    contentCreationDate = v13->_contentCreationDate;
    v13->_contentCreationDate = (NSDate *)v18;

  }
  return v13;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSAttributedString)individualSummary
{
  return self->_individualSummary;
}

- (void)setIndividualSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (BOOL)isHighlight
{
  return self->_isHighlight;
}

- (void)setIsHighlight:(BOOL)a3
{
  self->_isHighlight = a3;
}

- (NSDate)contentCreationDate
{
  return self->_contentCreationDate;
}

- (void)setContentCreationDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCreationDate, 0);
  objc_storeStrong((id *)&self->_individualSummary, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

@end
