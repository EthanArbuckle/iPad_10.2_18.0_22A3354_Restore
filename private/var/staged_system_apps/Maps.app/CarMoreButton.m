@implementation CarMoreButton

- (CarMoreButton)init
{
  return -[CarCardRoundedButton initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[CarMoreButton _updateImage](self, "_updateImage");
  }
}

- (void)_updateImage
{
  const __CFString *v3;
  uint64_t v4;
  id v5;

  if ((~-[CarMoreButton options](self, "options") & 6) == 0)
  {
    v3 = CFSTR("ellipsis");
LABEL_8:
    v4 = objc_claimAutoreleasedReturnValue(+[UIImage _mapsCar_systemImageNamed:textStyle:](UIImage, "_mapsCar_systemImageNamed:textStyle:", v3, UIFontTextStyleFootnote));
    goto LABEL_9;
  }
  if ((-[CarMoreButton options](self, "options") & 2) != 0)
  {
    v3 = CFSTR("phone.fill");
    goto LABEL_8;
  }
  if ((-[CarMoreButton options](self, "options") & 4) != 0)
  {
    v3 = CFSTR("square.and.arrow.up");
    goto LABEL_8;
  }
  v4 = 0;
LABEL_9:
  v5 = (id)v4;
  -[CarMoreButton setImage:forState:](self, "setImage:forState:", v4, 0);

}

- (void)didMoveToWindow
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarMoreButton;
  -[CarFocusableButton didMoveToWindow](&v4, "didMoveToWindow");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarMoreButton window](self, "window"));

  if (v3)
    -[CarMoreButton _updateImage](self, "_updateImage");
}

- (id)accessibilityIdentifier
{
  return CFSTR("CarMoreButton");
}

- (unint64_t)options
{
  return self->_options;
}

@end
