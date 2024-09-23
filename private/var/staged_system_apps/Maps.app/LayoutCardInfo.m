@implementation LayoutCardInfo

- (LayoutCardInfo)init
{
  LayoutCardInfo *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LayoutCardInfo;
  result = -[LayoutCardInfo init](&v3, "init");
  if (result)
    result->_alpha = 1.0;
  return result;
}

- (NSLayoutConstraint)bottomToBottomContentConstraint
{
  return self->_bottomToBottomContentConstraint;
}

- (void)setBottomToBottomContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_bottomToBottomContentConstraint, a3);
}

- (NSLayoutConstraint)topToTopContentConstraint
{
  return self->_topToTopContentConstraint;
}

- (void)setTopToTopContentConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_topToTopContentConstraint, a3);
}

- (ContaineeProtocol)modalPresenter
{
  return self->_modalPresenter;
}

- (void)setModalPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_modalPresenter, a3);
}

- (unint64_t)backgroundLayout
{
  return self->_backgroundLayout;
}

- (void)setBackgroundLayout:(unint64_t)a3
{
  self->_backgroundLayout = a3;
}

- (double)alpha
{
  return self->_alpha;
}

- (void)setAlpha:(double)a3
{
  self->_alpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modalPresenter, 0);
  objc_storeStrong((id *)&self->_topToTopContentConstraint, 0);
  objc_storeStrong((id *)&self->_bottomToBottomContentConstraint, 0);
}

@end
