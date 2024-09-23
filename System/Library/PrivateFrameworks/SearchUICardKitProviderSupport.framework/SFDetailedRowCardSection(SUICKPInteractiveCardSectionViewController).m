@implementation SFDetailedRowCardSection(SUICKPInteractiveCardSectionViewController)

- (BOOL)_SUICKPInteractiveCardSectionViewController_shouldHandlePunchout
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "userReportRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 != 0;

  return v2;
}

- (BOOL)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "userReportRequest");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1 == 0;

  return v2;
}

@end
