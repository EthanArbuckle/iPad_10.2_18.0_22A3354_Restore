@implementation STKMutableTextInputSessionData

- (void)setDefaultText:(id)a3
{
  NSString *v4;
  NSString *defaultText;

  v4 = (NSString *)objc_msgSend(a3, "copy");
  defaultText = self->super._defaultText;
  self->super._defaultText = v4;

}

- (void)setIsSecure:(BOOL)a3
{
  self->super._isSecure = a3;
}

- (void)setIsDigitsOnly:(BOOL)a3
{
  self->super._isDigitsOnly = a3;
}

- (void)setMinimumInputLength:(unint64_t)a3
{
  self->super._minimumInputLength = a3;
}

- (void)setMaximumInputLength:(unint64_t)a3
{
  self->super._maximumInputLength = a3;
}

@end
