@implementation TVRUICaptionsButton

- (TVRUICaptionsButton)initWithCaptionsEnabled:(BOOL)a3 buttonLocation:(int64_t)a4
{
  TVRUICaptionsButton *v5;
  TVRUICaptionsButton *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TVRUICaptionsButton;
  v5 = -[TVRUIButton initWithType:hasTapAction:buttonLocation:](&v11, sel_initWithType_hasTapAction_buttonLocation_, 16, 1, 1);
  v6 = v5;
  if (v5)
  {
    v5->_captionsEnabled = a3;
    -[TVRUIButton styleProvider](v5, "styleProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "captionsButtonIcon:", v6->_captionsEnabled);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton imageView](v6, "imageView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setImage:", v8);

  }
  return v6;
}

- (void)setCaptionsEnabled:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;

  if (self->_captionsEnabled != a3)
  {
    self->_captionsEnabled = a3;
    -[TVRUIButton styleProvider](self, "styleProvider");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "captionsButtonIcon:", self->_captionsEnabled);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIButton imageView](self, "imageView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setImage:", v4);

  }
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;

  -[TVRUIButton _descriptionBuilder](self, "_descriptionBuilder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[TVRUICaptionsButton captionsEnabled](self, "captionsEnabled"), CFSTR("captionsEnabled"));
  objc_msgSend(v3, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_boldTextEnabledStatusChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)TVRUICaptionsButton;
  -[TVRUIButton _boldTextEnabledStatusChanged:](&v8, sel__boldTextEnabledStatusChanged_, a3);
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[TVRUICaptionsButton _boldTextEnabledStatusChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVRUIButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionsButtonIcon:", -[TVRUICaptionsButton captionsEnabled](self, "captionsEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (void)_largeTextEnabledStatusChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v8.receiver = self;
  v8.super_class = (Class)TVRUICaptionsButton;
  -[TVRUIButton _largeTextEnabledStatusChanged:](&v8, sel__largeTextEnabledStatusChanged_, a3);
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[TVRUICaptionsButton _largeTextEnabledStatusChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVRUIButton styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "captionsButtonIcon:", -[TVRUICaptionsButton captionsEnabled](self, "captionsEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButton imageView](self, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v6);

}

- (BOOL)captionsEnabled
{
  return self->_captionsEnabled;
}

@end
