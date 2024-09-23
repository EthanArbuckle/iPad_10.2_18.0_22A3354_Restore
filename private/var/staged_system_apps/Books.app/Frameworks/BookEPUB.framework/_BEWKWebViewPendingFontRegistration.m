@implementation _BEWKWebViewPendingFontRegistration

- (BEStyleManaging)styleManager
{
  return self->_styleManager;
}

- (void)setStyleManager:(id)a3
{
  objc_storeStrong((id *)&self->_styleManager, a3);
}

- (id)fontRegistrationHandler
{
  return self->_fontRegistrationHandler;
}

- (void)setFontRegistrationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fontRegistrationHandler, 0);
  objc_storeStrong((id *)&self->_styleManager, 0);
}

@end
