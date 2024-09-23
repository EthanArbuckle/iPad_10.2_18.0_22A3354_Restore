@implementation SFDescriptionCardSection(SUICKPInteractiveCardSectionViewController)

- (uint64_t)_SUICKPInteractiveCardSectionViewController_shouldRenderButtonOverlay
{
  return objc_msgSend(a1, "descriptionExpand") ^ 1;
}

@end
