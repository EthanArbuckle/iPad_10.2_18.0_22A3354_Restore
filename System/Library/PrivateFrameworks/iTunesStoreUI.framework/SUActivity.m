@implementation SUActivity

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUActivity;
  -[SUActivity dealloc](&v3, sel_dealloc);
}

- (void)setActivityImage:(id)a3
{
  UIImage *suActivityImage;

  suActivityImage = self->_suActivityImage;
  if (suActivityImage != a3)
  {

    self->_suActivityImage = (UIImage *)a3;
  }
}

- (void)setActivityTitle:(id)a3
{
  NSString *suActivityTitle;

  suActivityTitle = self->_suActivityTitle;
  if (suActivityTitle != a3)
  {

    self->_suActivityTitle = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setActivityType:(id)a3
{
  NSString *suActivityType;

  suActivityType = self->_suActivityType;
  if (suActivityType != a3)
  {

    self->_suActivityType = (NSString *)objc_msgSend(a3, "copy");
  }
}

- (void)setActivityViewController:(id)a3
{
  UIViewController *suActivityViewController;

  suActivityViewController = self->_suActivityViewController;
  if (suActivityViewController != a3)
  {

    self->_suActivityViewController = (UIViewController *)a3;
  }
}

- (id)activityImage
{
  return self->_suActivityImage;
}

- (id)activityTitle
{
  return self->_suActivityTitle;
}

- (id)activityType
{
  return self->_suActivityType;
}

- (id)activityViewController
{
  return self->_suActivityViewController;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  SUActivity *v5;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0;
  v5 = self;
  return -[SUActivityDelegate activity:canPerformWithActivityItems:](self->_delegate, "activity:canPerformWithActivityItems:", self, a3);
}

- (void)performActivity
{
  SUActivity *v3;
  objc_super v4;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = self;
    -[SUActivityDelegate performActionForActivity:](self->_delegate, "performActionForActivity:", self);
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)SUActivity;
    -[UIActivity performActivity](&v4, sel_performActivity);
  }
}

- (void)prepareWithActivityItems:(id)a3
{
  SUActivity *v5;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v5 = self;
    -[SUActivityDelegate activity:prepareWithActivityItems:](self->_delegate, "activity:prepareWithActivityItems:", self, a3);
  }
}

- (SUActivityDelegate)ITunesStoreDelegate
{
  return self->_delegate;
}

- (void)setITunesStoreDelegate:(id)a3
{
  self->_delegate = (SUActivityDelegate *)a3;
}

@end
