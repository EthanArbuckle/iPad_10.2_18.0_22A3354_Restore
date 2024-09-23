@implementation SFRenderingCommand

- (id)commandBlock
{
  return self->_commandBlock;
}

- (void)setCommandBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (CGSize)contextSize
{
  double width;
  double height;
  CGSize result;

  width = self->_contextSize.width;
  height = self->_contextSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setContextSize:(CGSize)a3
{
  self->_contextSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_commandBlock, 0);
}

@end
