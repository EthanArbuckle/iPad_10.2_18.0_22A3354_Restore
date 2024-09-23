@implementation AEMinimalTemplateStepRange

- (NSString)keyPath
{
  return self->_keyPath;
}

- (void)setKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSMutableArray)steps
{
  return self->_steps;
}

- (void)setSteps:(id)a3
{
  objc_storeStrong((id *)&self->_steps, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

@end
