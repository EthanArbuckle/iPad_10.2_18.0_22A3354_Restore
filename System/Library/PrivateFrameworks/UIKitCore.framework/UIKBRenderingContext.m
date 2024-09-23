@implementation UIKBRenderingContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_renderConfig, 0);
}

- (int64_t)handBias
{
  return self->_handBias;
}

- (UIKBRenderConfig)renderConfig
{
  return self->_renderConfig;
}

- (int64_t)keyboardType
{
  return self->_keyboardType;
}

- (unint64_t)shiftState
{
  return self->_shiftState;
}

- (void)setRenderConfig:(id)a3
{
  objc_storeStrong((id *)&self->_renderConfig, a3);
}

+ (id)renderingContextForRenderConfig:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithRenderConfig:", v4);

  return v5;
}

- (UIKBRenderingContext)initWithRenderConfig:(id)a3
{
  id v5;
  UIKBRenderingContext *v6;
  UIKBRenderingContext *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UIKBRenderingContext;
  v6 = -[UIKBRenderingContext init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_shiftState = 0;
    objc_storeStrong((id *)&v6->_renderConfig, a3);
    v7->_isFloating = objc_msgSend(v5, "isFloating");
  }

  return v7;
}

- (void)setIsFloating:(BOOL)a3
{
  self->_isFloating = a3;
}

- (void)setShiftState:(unint64_t)a3
{
  self->_shiftState = a3;
}

- (void)setKeyboardType:(int64_t)a3
{
  self->_keyboardType = a3;
}

- (void)setHandBias:(int64_t)a3
{
  self->_handBias = a3;
}

- (BOOL)isFloating
{
  return self->_isFloating;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  UIKBRenderConfig **v5;
  unint64_t v6;
  int isFloating;
  BOOL v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (UIKBRenderConfig **)v4;
    v6 = -[UIKBRenderingContext shiftState](self, "shiftState");
    v8 = v6 == objc_msgSend(v5, "shiftState")
      && (isFloating = self->_isFloating, isFloating == objc_msgSend(v5, "isFloating"))
      && self->_renderConfig == v5[3];

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  UIKBRenderingContext *v4;

  v4 = -[UIKBRenderingContext init](+[UIKBRenderingContext allocWithZone:](UIKBRenderingContext, "allocWithZone:", a3), "init");
  v4->_shiftState = self->_shiftState;
  objc_storeStrong((id *)&v4->_renderConfig, self->_renderConfig);
  v4->_isFloating = self->_isFloating;
  return v4;
}

@end
