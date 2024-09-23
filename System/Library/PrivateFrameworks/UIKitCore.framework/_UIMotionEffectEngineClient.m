@implementation _UIMotionEffectEngineClient

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[UIMotionEffect hash](self->_effect, "hash");
  return -[UIView hash](self->_view, "hash") ^ v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_view, 0);
  objc_storeStrong((id *)&self->_effect, 0);
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  BOOL v5;

  v4 = a3;
  objc_opt_class();
  v5 = (objc_opt_isKindOfClass() & 1) != 0 && (UIMotionEffect *)v4[1] == self->_effect && (UIView *)v4[2] == self->_view;

  return v5;
}

- (_UIMotionEffectEngineClient)initWithMotionEffect:(id)a3 view:(id)a4
{
  id v7;
  id v8;
  _UIMotionEffectEngineClient *v9;
  _UIMotionEffectEngineClient *v10;
  _UIMotionEffectEngineClient *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_UIMotionEffectEngineClient;
  v9 = -[_UIMotionEffectEngineClient init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_effect, a3);
    objc_storeStrong((id *)&v10->_view, a4);
    v11 = v10;
  }

  return v10;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p effect=%@ view=%@>"), v5, self, self->_effect, self->_view);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
