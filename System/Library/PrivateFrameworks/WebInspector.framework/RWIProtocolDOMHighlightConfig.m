@implementation RWIProtocolDOMHighlightConfig

- (void)setShowInfo:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject setBool:forKey:](&v3, sel_setBool_forKey_, a3, CFSTR("showInfo"));
}

- (BOOL)showInfo
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  return -[RWIProtocolJSONObject BOOLForKey:](&v3, sel_BOOLForKey_, CFSTR("showInfo"));
}

- (void)setContentColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("contentColor"));
}

- (RWIProtocolDOMRGBAColor)contentColor
{
  void *v3;
  RWIProtocolDOMRGBAColor *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMRGBAColor *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("contentColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("contentColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setPaddingColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("paddingColor"));
}

- (RWIProtocolDOMRGBAColor)paddingColor
{
  void *v3;
  RWIProtocolDOMRGBAColor *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMRGBAColor *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("paddingColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("paddingColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setBorderColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("borderColor"));
}

- (RWIProtocolDOMRGBAColor)borderColor
{
  void *v3;
  RWIProtocolDOMRGBAColor *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMRGBAColor *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("borderColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("borderColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setMarginColor:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("marginColor"));
}

- (RWIProtocolDOMRGBAColor)marginColor
{
  void *v3;
  RWIProtocolDOMRGBAColor *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMRGBAColor *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMHighlightConfig;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("marginColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMRGBAColor alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMHighlightConfig;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("marginColor"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "toJSONObject");
    v6 = v12;
    ++*v12;
    v13 = v6;
    v7 = -[RWIProtocolJSONObject initWithJSONObject:](v4, "initWithJSONObject:", &v13);
    v8 = v13;
    v13 = 0;
    if (v8)
    {
      if (*v8 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v8;
    }
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*v9;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
