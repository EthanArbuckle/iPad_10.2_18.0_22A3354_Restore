@implementation SXWebCalAction

- (SXWebCalAction)initWithURL:(id)a3
{
  id v5;
  SXWebCalAction *v6;
  SXWebCalAction *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXWebCalAction;
  v6 = -[SXWebCalAction init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_URL, a3);

  return v7;
}

- (NSString)type
{
  return (NSString *)CFSTR("webcal");
}

- (SXJSONDictionary)analytics
{
  return self->analytics;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->analytics, 0);
}

@end
