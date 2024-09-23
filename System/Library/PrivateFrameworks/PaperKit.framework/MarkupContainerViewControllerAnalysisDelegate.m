@implementation MarkupContainerViewControllerAnalysisDelegate

- (id)presentingViewControllerForContext:(id)a3
{
  return (id)MEMORY[0x1DF0E666C](self->viewController, a2, a3);
}

- (void)contextWillPresentVisualSearchController:(id)a3
{
  @objc MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_markupContainerViewController_willPresentViewControllerWithAnimation_, (void (*)(uint64_t))specialized MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:));
}

- (void)contextDidDismissVisualSearchController:(id)a3
{
  @objc MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_markupContainerViewController_didDismissViewControllerWithAnimation_, (void (*)(uint64_t))specialized MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:));
}

- (void)contextActiveInteractionTypesDidChange:(id)a3
{
  @objc MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_markupContainerViewControllerActiveAnalysisInteractionTypesDidChange_, (void (*)(uint64_t))specialized MarkupContainerViewControllerAnalysisDelegate.contextActiveInteractionTypesDidChange(_:));
}

- (void)contextAvailableResultsDidChange:(id)a3
{
  @objc MarkupContainerViewControllerAnalysisDelegate.contextWillPresentVisualSearchController(_:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t)&selRef_markupContainerViewControllerAvailableAnalysisResultTypesDidChange_, (void (*)(uint64_t))specialized MarkupContainerViewControllerAnalysisDelegate.contextActiveInteractionTypesDidChange(_:));
}

@end
