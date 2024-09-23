@implementation _UIKeyShortcutHUDPresentationResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  objc_msgSend(a3, "encodeBool:forKey:", self->_accepted, CFSTR("accepted"));
}

- (_UIKeyShortcutHUDPresentationResponse)initWithCoder:(id)a3
{
  id v4;
  _UIKeyShortcutHUDPresentationResponse *v5;
  uint64_t v6;

  v4 = a3;
  v5 = (_UIKeyShortcutHUDPresentationResponse *)objc_opt_new();
  v6 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("accepted"));

  -[_UIKeyShortcutHUDPresentationResponse setAccepted:](v5, "setAccepted:", v6);
  return v5;
}

- (BOOL)accepted
{
  return self->_accepted;
}

- (void)setAccepted:(BOOL)a3
{
  self->_accepted = a3;
}

@end
