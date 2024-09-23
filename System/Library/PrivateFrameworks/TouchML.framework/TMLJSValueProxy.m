@implementation TMLJSValueProxy

- (TMLJSValueProxy)initWithTarget:(id)a3 keyPath:(id)a4
{
  id v7;
  id v8;
  TMLJSValueProxy *v9;
  TMLJSValueProxy *v10;
  const char *v11;
  double v12;
  uint64_t v13;
  NSString *keyPath;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TMLJSValueProxy;
  v9 = -[TMLJSValueProxy init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong(&v9->_target, a3);
    v13 = objc_msgSend_copy(v8, v11, v12);
    keyPath = v10->_keyPath;
    v10->_keyPath = (NSString *)v13;

  }
  return v10;
}

- (id)_
{
  double v2;
  void *v3;
  const char *v4;
  double v5;
  void *v6;
  id v7;
  void *v8;
  const char *v9;
  double v10;

  objc_msgSend_tmlValueForKeyPath_(self->_target, a2, v2, self->_keyPath);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if (v3)
  {
    v7 = v3;
  }
  else
  {
    objc_msgSend_currentContext(MEMORY[0x24BDDA720], v4, v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_jsValueInContext_(TMLJSNil, v9, v10, v8);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (void)set_:(id)a3
{
  double v3;
  const char *v5;
  double v6;
  id v7;

  objc_msgSend_unwrap_(TMLJSNil, a2, v3, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTMLValue_forKeyPath_(self->_target, v5, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong(&self->_target, 0);
}

@end
