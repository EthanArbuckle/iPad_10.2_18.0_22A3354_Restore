@implementation RWIProtocolDOMMediaStats

- (void)setAudio:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("audio"));
}

- (RWIProtocolDOMAudioMediaStats)audio
{
  void *v3;
  RWIProtocolDOMAudioMediaStats *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMAudioMediaStats *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("audio"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMAudioMediaStats alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMMediaStats;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("audio"));
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

- (void)setVideo:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("video"));
}

- (RWIProtocolDOMVideoMediaStats)video
{
  void *v3;
  RWIProtocolDOMVideoMediaStats *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMVideoMediaStats *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("video"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMVideoMediaStats alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMMediaStats;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("video"));
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

- (void)setDevicePixelRatio:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("devicePixelRatio"), a3);
}

- (double)devicePixelRatio
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("devicePixelRatio"));
  return result;
}

- (void)setViewport:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("viewport"));
}

- (RWIProtocolDOMViewportSize)viewport
{
  void *v3;
  RWIProtocolDOMViewportSize *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMViewportSize *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("viewport"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMViewportSize alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMMediaStats;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("viewport"));
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

- (void)setQuality:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setObject:forKey:](&v3, sel_setObject_forKey_, a3, CFSTR("quality"));
}

- (RWIProtocolDOMVideoPlaybackQuality)quality
{
  void *v3;
  RWIProtocolDOMVideoPlaybackQuality *v4;
  void *v5;
  _DWORD *v6;
  RWIProtocolDOMVideoPlaybackQuality *v7;
  _DWORD *v8;
  _DWORD *v9;
  objc_super v11;
  _DWORD *v12;
  _DWORD *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject objectForKey:](&v14, sel_objectForKey_, CFSTR("quality"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [RWIProtocolDOMVideoPlaybackQuality alloc];
    v11.receiver = self;
    v11.super_class = (Class)RWIProtocolDOMMediaStats;
    -[RWIProtocolJSONObject objectForKey:](&v11, sel_objectForKey_, CFSTR("quality"));
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

- (void)setSource:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject setString:forKey:](&v3, sel_setString_forKey_, a3, CFSTR("source"));
}

- (NSString)source
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolDOMMediaStats;
  -[RWIProtocolJSONObject stringForKey:](&v3, sel_stringForKey_, CFSTR("source"));
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

@end
