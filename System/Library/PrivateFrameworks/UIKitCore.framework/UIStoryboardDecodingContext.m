@implementation UIStoryboardDecodingContext

- (UIClassSwapper)classSwapperTemplate
{
  return self->_classSwapperTemplate;
}

- (void)setChildViewControllerIndex:(int64_t)a3
{
  self->_childViewControllerIndex = a3;
}

- (void)setParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_parentViewController, a3);
}

- (int64_t)childViewControllerIndex
{
  return self->_childViewControllerIndex;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (UIStoryboardSegueTemplate)sourceSegueTemplate
{
  return self->_sourceSegueTemplate;
}

- (id)creator
{
  return self->_creator;
}

- (void)setSourceSegueTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_sourceSegueTemplate, a3);
}

- (void)setSender:(id)a3
{
  objc_storeStrong(&self->_sender, a3);
}

- (void)setCreator:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_creator, 0);
  objc_storeStrong((id *)&self->_parentViewController, 0);
  objc_storeStrong((id *)&self->_classSwapperTemplate, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_sourceSegueTemplate, 0);
}

- (id)sender
{
  return self->_sender;
}

- (void)setClassSwapperTemplate:(id)a3
{
  objc_storeStrong((id *)&self->_classSwapperTemplate, a3);
}

@end
