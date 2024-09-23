@implementation OADFooterField

- (BOOL)isEmpty
{
  NSString *mText;

  mText = self->super.mText;
  return !mText || -[NSString length](mText, "length") == 0;
}

@end
