@implementation _UITableViewCellActionButton

+ (id)actionButtonWithStyle:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "buttonWithType:", 0);
}

- (UIVisualEffect)backgroundEffect
{
  return self->_backgroundEffect;
}

- (void)setBackgroundEffect:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 752);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundEffect, 0);
}

@end
