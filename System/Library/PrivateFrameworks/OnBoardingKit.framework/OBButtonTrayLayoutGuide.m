@implementation OBButtonTrayLayoutGuide

- (NSLayoutConstraint)widthConstraint
{
  return self->_widthConstraint;
}

- (void)setWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_widthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_widthConstraint, 0);
}

@end
