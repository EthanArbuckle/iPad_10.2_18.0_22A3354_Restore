@implementation WBSPerSitePreferenceTimeout

+ (id)timeoutWithInterval:(double)a3 fallbackValue:(id)a4
{
  id v6;
  void *v7;

  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithInterval:fallbackValue:", v6, a3);

  return v7;
}

- (WBSPerSitePreferenceTimeout)initWithInterval:(double)a3 fallbackValue:(id)a4
{
  id v7;
  WBSPerSitePreferenceTimeout *v8;
  WBSPerSitePreferenceTimeout *v9;
  WBSPerSitePreferenceTimeout *v10;
  objc_super v12;

  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)WBSPerSitePreferenceTimeout;
  v8 = -[WBSPerSitePreferenceTimeout init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_interval = a3;
    objc_storeStrong(&v8->_fallbackValue, a4);
    v10 = v9;
  }

  return v9;
}

- (double)interval
{
  return self->_interval;
}

- (id)fallbackValue
{
  return self->_fallbackValue;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_fallbackValue, 0);
}

@end
