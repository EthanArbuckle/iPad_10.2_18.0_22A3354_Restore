@implementation TIKBSessionTouchInfo

- (TIKeyboardTouchEvent)touch
{
  return self->_touch;
}

- (void)setTouch:(id)a3
{
  objc_storeStrong((id *)&self->_touch, a3);
}

- (unint64_t)layoutId
{
  return self->_layoutId;
}

- (void)setLayoutId:(unint64_t)a3
{
  self->_layoutId = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touch, 0);
}

@end
