@implementation _TUILoadedImageResourceCollector

- (void)collectImageResource:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (objc_msgSend(v4, "isImageLoaded"))
  {
    v5.receiver = self;
    v5.super_class = (Class)_TUILoadedImageResourceCollector;
    -[_TUIImageResourceCollector collectImageResource:](&v5, "collectImageResource:", v4);
  }

}

@end
