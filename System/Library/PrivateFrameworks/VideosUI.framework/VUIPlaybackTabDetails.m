@implementation VUIPlaybackTabDetails

- (VUIPlaybackTabDetails)initWithDictionary:(id)a3
{
  id v4;
  VUIPlaybackTabDetails *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIPlaybackTabDetails;
  v5 = -[VUIPlaybackTabDetails init](&v13, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "vui_stringForKey:", CFSTR("title"));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v6)
      v8 = (__CFString *)v6;
    else
      v8 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_title, v8);

    objc_msgSend(v4, "vui_stringForKey:", CFSTR("tabId"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)v9;
    if (v9)
      v11 = (__CFString *)v9;
    else
      v11 = &stru_1E9FF3598;
    objc_storeStrong((id *)&v5->_tabId, v11);

    v5->_isSelected = objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", CFSTR("isSelected"), 0);
  }

  return v5;
}

- (VUIPlaybackTabDetails)initWithTabId:(id)a3 andTitle:(id)a4 isSelected:(BOOL)a5
{
  id v9;
  id v10;
  VUIPlaybackTabDetails *v11;
  VUIPlaybackTabDetails *v12;
  objc_super v14;

  v9 = a3;
  v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)VUIPlaybackTabDetails;
  v11 = -[VUIPlaybackTabDetails init](&v14, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_title, a4);
    objc_storeStrong((id *)&v12->_tabId, a3);
    v12->_isSelected = a5;
  }

  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  VUIPlaybackTabDetails *v4;
  uint64_t v5;
  NSString *title;
  uint64_t v7;
  NSString *tabId;

  v4 = objc_alloc_init(VUIPlaybackTabDetails);
  v5 = -[NSString copy](self->_title, "copy");
  title = v4->_title;
  v4->_title = (NSString *)v5;

  v7 = -[NSString copy](self->_tabId, "copy");
  tabId = v4->_tabId;
  v4->_tabId = (NSString *)v7;

  v4->_isSelected = self->_isSelected;
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  VUIPlaybackTabDetails *v4;
  VUIPlaybackTabDetails *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = (VUIPlaybackTabDetails *)a3;
  if (v4 == self)
  {
    v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[VUIPlaybackTabDetails title](self, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[VUIPlaybackTabDetails title](v5, "title");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", v7))
      {
        -[VUIPlaybackTabDetails tabId](self, "tabId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[VUIPlaybackTabDetails tabId](v5, "tabId");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v8, "isEqualToString:", v9);

      }
      else
      {
        v10 = 0;
      }

    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

- (NSString)tabId
{
  return self->_tabId;
}

- (NSString)title
{
  return self->_title;
}

- (BOOL)isSelected
{
  return self->_isSelected;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tabId, 0);
}

@end
