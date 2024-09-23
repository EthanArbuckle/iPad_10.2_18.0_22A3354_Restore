@implementation TLKDescriptionContainerBoxView

- (id)calculateViewForFirstBaselineLayout
{
  void *v3;
  void *v4;
  id v5;

  -[TLKDescriptionContainerBoxView viewForFirstAndLastBaseline](self, "viewForFirstAndLastBaseline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = self;
  v5 = v3;

  return v5;
}

- (TLKTextView)viewForFirstAndLastBaseline
{
  return self->_viewForFirstAndLastBaseline;
}

- (void)setViewForFirstAndLastBaseline:(id)a3
{
  objc_storeStrong((id *)&self->_viewForFirstAndLastBaseline, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewForFirstAndLastBaseline, 0);
}

@end
