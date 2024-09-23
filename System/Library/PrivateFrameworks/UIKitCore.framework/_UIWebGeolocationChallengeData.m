@implementation _UIWebGeolocationChallengeData

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIWebGeolocationChallengeData;
  -[_UIWebGeolocationChallengeData dealloc](&v3, sel_dealloc);
}

- (NSString)userVisibleDomain
{
  return self->_userVisibleDomain;
}

- (void)setUserVisibleDomain:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (NSString)token
{
  return self->_token;
}

- (void)setToken:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (NSURL)requestingURL
{
  return self->_requestingURL;
}

- (void)setRequestingURL:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (WebAllowDenyPolicyListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

@end
