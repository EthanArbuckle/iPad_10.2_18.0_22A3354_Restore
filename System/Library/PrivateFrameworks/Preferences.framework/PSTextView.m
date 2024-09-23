@implementation PSTextView

- (void)setCell:(id)a3
{
  objc_storeStrong((id *)&self->_cell, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cell, 0);
}

@end
