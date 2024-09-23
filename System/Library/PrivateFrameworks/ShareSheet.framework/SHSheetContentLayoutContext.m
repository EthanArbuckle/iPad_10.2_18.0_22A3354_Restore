@implementation SHSheetContentLayoutContext

- (SHSheetContentLayoutContext)initWithSectionIdentifier:(id)a3 dataSourceSnapshot:(id)a4 environment:(id)a5
{
  id v8;
  id v9;
  id v10;
  SHSheetContentLayoutContext *v11;
  uint64_t v12;
  NSString *sectionIdentifier;
  objc_super v15;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SHSheetContentLayoutContext;
  v11 = -[SHSheetContentLayoutContext init](&v15, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sectionIdentifier = v11->_sectionIdentifier;
    v11->_sectionIdentifier = (NSString *)v12;

    objc_storeStrong((id *)&v11->_dataSourceSnapshot, a4);
    objc_storeStrong((id *)&v11->_environment, a5);
    v11->_sectionTopContentInset = 0.0;
    v11->_sectionBottomContentInset = 0.0;
    v11->_enableSectionFooter = 1;
  }

  return v11;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (NSDiffableDataSourceSnapshot)dataSourceSnapshot
{
  return self->_dataSourceSnapshot;
}

- (NSCollectionLayoutEnvironment)environment
{
  return self->_environment;
}

- (NSDirectionalEdgeInsets)viewDirectionalLayoutMargins
{
  double top;
  double leading;
  double bottom;
  double trailing;
  NSDirectionalEdgeInsets result;

  top = self->_viewDirectionalLayoutMargins.top;
  leading = self->_viewDirectionalLayoutMargins.leading;
  bottom = self->_viewDirectionalLayoutMargins.bottom;
  trailing = self->_viewDirectionalLayoutMargins.trailing;
  result.trailing = trailing;
  result.bottom = bottom;
  result.leading = leading;
  result.top = top;
  return result;
}

- (void)setViewDirectionalLayoutMargins:(NSDirectionalEdgeInsets)a3
{
  self->_viewDirectionalLayoutMargins = a3;
}

- (double)sectionTopContentInset
{
  return self->_sectionTopContentInset;
}

- (void)setSectionTopContentInset:(double)a3
{
  self->_sectionTopContentInset = a3;
}

- (double)sectionBottomContentInset
{
  return self->_sectionBottomContentInset;
}

- (void)setSectionBottomContentInset:(double)a3
{
  self->_sectionBottomContentInset = a3;
}

- (BOOL)enableHeroActions
{
  return self->_enableHeroActions;
}

- (void)setEnableHeroActions:(BOOL)a3
{
  self->_enableHeroActions = a3;
}

- (BOOL)enableTopContentSectionText
{
  return self->_enableTopContentSectionText;
}

- (void)setEnableTopContentSectionText:(BOOL)a3
{
  self->_enableTopContentSectionText = a3;
}

- (BOOL)enableSectionFooter
{
  return self->_enableSectionFooter;
}

- (void)setEnableSectionFooter:(BOOL)a3
{
  self->_enableSectionFooter = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_dataSourceSnapshot, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
}

@end
