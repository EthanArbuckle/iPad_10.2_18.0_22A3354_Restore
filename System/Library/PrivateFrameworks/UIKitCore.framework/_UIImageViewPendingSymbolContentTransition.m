@implementation _UIImageViewPendingSymbolContentTransition

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetSymbolImage, 0);
  objc_storeStrong((id *)&self->_sourceSymbolImage, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_symbolContentTransition, 0);
}

+ (id)transitionWithTransition:(id)a3 sourceSymbolImage:(id)a4 targetSymbolImage:(id)a5 options:(id)a6 completion:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (_QWORD *)objc_opt_new();
  v17 = (void *)v16[2];
  v16[2] = v11;
  v18 = v11;

  v19 = (void *)v16[5];
  v16[5] = v12;
  v20 = v12;

  v21 = (void *)v16[6];
  v16[6] = v13;
  v22 = v13;

  v23 = (void *)v16[3];
  v16[3] = v14;
  v24 = v14;

  v25 = _Block_copy(v15);
  v26 = (void *)v16[4];
  v16[4] = v25;

  return v16;
}

- (_UIImageViewPendingSymbolContentTransition)init
{
  _UIImageViewPendingSymbolContentTransition *result;
  CGSize v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_UIImageViewPendingSymbolContentTransition;
  result = -[_UIImageViewPendingSymbolContentTransition init](&v4, sel_init);
  if (result)
  {
    v3 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
    result->_initialSymbolAbsoluteRect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
    result->_initialSymbolAbsoluteRect.size = v3;
  }
  return result;
}

- (NSSymbolContentTransition)symbolContentTransition
{
  return self->_symbolContentTransition;
}

- (NSSymbolEffectOptions)options
{
  return self->_options;
}

- (UIImage)sourceSymbolImage
{
  return self->_sourceSymbolImage;
}

- (UIImage)targetSymbolImage
{
  return self->_targetSymbolImage;
}

- (BOOL)isPendingLayoutPass
{
  return self->_pendingLayoutPass;
}

- (void)setPendingLayoutPass:(BOOL)a3
{
  self->_pendingLayoutPass = a3;
}

- (CGRect)initialSymbolAbsoluteRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_initialSymbolAbsoluteRect.origin.x;
  y = self->_initialSymbolAbsoluteRect.origin.y;
  width = self->_initialSymbolAbsoluteRect.size.width;
  height = self->_initialSymbolAbsoluteRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setInitialSymbolAbsoluteRect:(CGRect)a3
{
  self->_initialSymbolAbsoluteRect = a3;
}

@end
