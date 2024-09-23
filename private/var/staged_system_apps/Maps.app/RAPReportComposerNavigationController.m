@implementation RAPReportComposerNavigationController

- (PlaceCardDismissable)dismissalDelegate
{
  return (PlaceCardDismissable *)objc_loadWeakRetained((id *)&self->_dismissalDelegate);
}

- (void)setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dismissalDelegate);
}

@end
