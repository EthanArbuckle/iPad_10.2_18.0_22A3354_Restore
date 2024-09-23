@implementation _UITextInputSessionActionInformation

- (NSString)sessionActionString
{
  return self->_sessionActionString;
}

- (void)setSessionActionString:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (BOOL)sessionHasOnlyPrimaryInput
{
  return self->_sessionHasOnlyPrimaryInput;
}

- (void)setSessionHasOnlyPrimaryInput:(BOOL)a3
{
  self->_sessionHasOnlyPrimaryInput = a3;
}

- (BOOL)sessionHasDictation
{
  return self->_sessionHasDictation;
}

- (void)setSessionHasDictation:(BOOL)a3
{
  self->_sessionHasDictation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionActionString, 0);
}

@end
