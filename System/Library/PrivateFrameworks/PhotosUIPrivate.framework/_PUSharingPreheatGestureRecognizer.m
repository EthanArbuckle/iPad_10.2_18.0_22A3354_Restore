@implementation _PUSharingPreheatGestureRecognizer

- (_PUSharingPreheatGestureRecognizer)initWithSharingPreheatBlock:(id)a3
{
  id v4;
  _PUSharingPreheatGestureRecognizer *v5;
  void *v6;
  id sharingPreheatBlock;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PUSharingPreheatGestureRecognizer;
  v5 = -[_PUSharingPreheatGestureRecognizer initWithTarget:action:](&v9, sel_initWithTarget_action_, 0, 0);
  if (v5)
  {
    v6 = _Block_copy(v4);
    sharingPreheatBlock = v5->_sharingPreheatBlock;
    v5->_sharingPreheatBlock = v6;

  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  void (**sharingPreheatBlock)(void);
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_PUSharingPreheatGestureRecognizer;
  -[_PUSharingPreheatGestureRecognizer touchesBegan:withEvent:](&v6, sel_touchesBegan_withEvent_, a3, a4);
  sharingPreheatBlock = (void (**)(void))self->_sharingPreheatBlock;
  if (sharingPreheatBlock)
    sharingPreheatBlock[2]();
  -[_PUSharingPreheatGestureRecognizer setState:](self, "setState:", 5);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sharingPreheatBlock, 0);
}

@end
