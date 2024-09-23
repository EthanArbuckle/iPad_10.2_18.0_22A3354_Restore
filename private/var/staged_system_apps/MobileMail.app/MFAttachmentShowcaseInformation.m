@implementation MFAttachmentShowcaseInformation

+ (id)showcaseInformation
{
  return objc_alloc_init((Class)a1);
}

- (BOOL)shouldAnimate
{
  return self->_shouldAnimate;
}

- (void)setShouldAnimate:(BOOL)a3
{
  self->_shouldAnimate = a3;
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (EMMailboxObjectID)mailboxObjectID
{
  return self->_mailboxObjectID;
}

- (void)setMailboxObjectID:(id)a3
{
  objc_storeStrong((id *)&self->_mailboxObjectID, a3);
}

- (BOOL)fromManagedAccount
{
  return self->_fromManagedAccount;
}

- (void)setFromManagedAccount:(BOOL)a3
{
  self->_fromManagedAccount = a3;
}

- (CGRect)originRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_originRect.origin.x;
  y = self->_originRect.origin.y;
  width = self->_originRect.size.width;
  height = self->_originRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setOriginRect:(CGRect)a3
{
  self->_originRect = a3;
}

- (UIView)originView
{
  return self->_originView;
}

- (void)setOriginView:(id)a3
{
  objc_storeStrong((id *)&self->_originView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originView, 0);
  objc_storeStrong((id *)&self->_mailboxObjectID, 0);
  objc_storeStrong((id *)&self->_message, 0);
}

@end
