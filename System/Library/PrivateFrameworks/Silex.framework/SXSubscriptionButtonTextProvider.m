@implementation SXSubscriptionButtonTextProvider

- (SXSubscriptionButtonTextProvider)initWithTitle:(id)a3
{
  id v4;
  SXSubscriptionButtonTextProvider *v5;
  uint64_t v6;
  NSString *title;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SXSubscriptionButtonTextProvider;
  v5 = -[SXSubscriptionButtonTextProvider init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    title = v5->_title;
    v5->_title = (NSString *)v6;

  }
  return v5;
}

- (NSString)title
{
  return self->_title;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
}

@end
