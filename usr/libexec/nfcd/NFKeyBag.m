@implementation NFKeyBag

- (NFKeyBag)init
{
  NFKeyBag *v2;
  NFKeyBag *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)NFKeyBag;
  v2 = -[NFKeyBag init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    v2->_notifyToken = -1;
    *(_WORD *)&v2->_hasBeenUnlocked = 0;
    v2->_isLocked = 0;
    sub_1001EAC98(v2);
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
