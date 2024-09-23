@implementation SXWebContentLoadEvent

- (SXWebContentLoadEvent)initWithURL:(id)a3
{
  id v4;
  SXWebContentLoadEvent *v5;
  uint64_t v6;
  NSURL *URL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebContentLoadEvent;
  v5 = -[SXAnalyticsEvent init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    URL = v5->_URL;
    v5->_URL = (NSURL *)v6;

  }
  return v5;
}

- (NSURL)URL
{
  return self->_URL;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
