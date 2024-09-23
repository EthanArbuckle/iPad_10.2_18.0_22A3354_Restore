@implementation _NSTextStorageSideData

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak(&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)_NSTextStorageSideData;
  -[_NSTextStorageSideData dealloc](&v3, sel_dealloc);
}

@end
