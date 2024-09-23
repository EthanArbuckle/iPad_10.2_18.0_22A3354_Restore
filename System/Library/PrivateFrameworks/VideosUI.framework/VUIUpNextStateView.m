@implementation VUIUpNextStateView

- (void)setImage:(id)a3
{
  objc_storeStrong((id *)&self->_image, a3);
}

- (VUILabel)label
{
  return self->_label;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
