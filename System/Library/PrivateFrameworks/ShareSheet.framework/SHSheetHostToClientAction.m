@implementation SHSheetHostToClientAction

- (void)performActionForHostedWindowScene:(id)a3
{
  +[SHSheetHostToClientActionManager receivedAction:forWindowScene:](SHSheetHostToClientActionManager, "receivedAction:forWindowScene:", self, a3);
}

@end
