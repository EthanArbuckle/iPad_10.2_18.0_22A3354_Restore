@implementation WBSTranslationContextSnapshot

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSString)targetLocale
{
  return self->_targetLocale;
}

- (void)setTargetLocale:(id)a3
{
  objc_storeStrong((id *)&self->_targetLocale, a3);
}

- (NSString)webpageLocale
{
  return self->_webpageLocale;
}

- (void)setWebpageLocale:(id)a3
{
  objc_storeStrong((id *)&self->_webpageLocale, a3);
}

- (NSURL)webpageURL
{
  return self->_webpageURL;
}

- (void)setWebpageURL:(id)a3
{
  objc_storeStrong((id *)&self->_webpageURL, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_webpageURL, 0);
  objc_storeStrong((id *)&self->_webpageLocale, 0);
  objc_storeStrong((id *)&self->_targetLocale, 0);
}

@end
