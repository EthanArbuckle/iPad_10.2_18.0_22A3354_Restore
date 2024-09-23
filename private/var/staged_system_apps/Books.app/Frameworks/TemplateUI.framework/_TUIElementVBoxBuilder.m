@implementation _TUIElementVBoxBuilder

- (TUIBox)pivotChild
{
  return self->_pivotChild;
}

- (void)setPivotChild:(id)a3
{
  objc_storeStrong((id *)&self->_pivotChild, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pivotChild, 0);
}

@end
