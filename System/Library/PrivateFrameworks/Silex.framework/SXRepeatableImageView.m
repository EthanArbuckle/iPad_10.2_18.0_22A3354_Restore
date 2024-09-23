@implementation SXRepeatableImageView

- (void)setImage:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v4 = (void *)MEMORY[0x24BDF6950];
  v5 = a3;
  objc_msgSend(v4, "colorWithPatternImage:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SXRepeatableImageView setBackgroundColor:](self, "setBackgroundColor:", v6);
  -[SXRepeatableImageView setRepeatingImage:](self, "setRepeatingImage:", v5);

}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (UIImage)repeatingImage
{
  return self->_repeatingImage;
}

- (void)setRepeatingImage:(id)a3
{
  objc_storeStrong((id *)&self->_repeatingImage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatingImage, 0);
}

@end
