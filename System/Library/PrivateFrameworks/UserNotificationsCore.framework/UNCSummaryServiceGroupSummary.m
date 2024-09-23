@implementation UNCSummaryServiceGroupSummary

- (UNCSummaryServiceGroupSummary)initWithSpotlightIdentifier:(id)a3 threadSummary:(id)a4
{
  id v6;
  id v7;
  UNCSummaryServiceGroupSummary *v8;
  uint64_t v9;
  NSString *spotlightIdentifier;
  uint64_t v11;
  NSAttributedString *threadSummary;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)UNCSummaryServiceGroupSummary;
  v8 = -[UNCSummaryServiceGroupSummary init](&v14, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    spotlightIdentifier = v8->_spotlightIdentifier;
    v8->_spotlightIdentifier = (NSString *)v9;

    v11 = objc_msgSend(v7, "copy");
    threadSummary = v8->_threadSummary;
    v8->_threadSummary = (NSAttributedString *)v11;

  }
  return v8;
}

- (NSString)spotlightIdentifier
{
  return self->_spotlightIdentifier;
}

- (void)setSpotlightIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSAttributedString)threadSummary
{
  return self->_threadSummary;
}

- (void)setThreadSummary:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_threadSummary, 0);
  objc_storeStrong((id *)&self->_spotlightIdentifier, 0);
}

@end
