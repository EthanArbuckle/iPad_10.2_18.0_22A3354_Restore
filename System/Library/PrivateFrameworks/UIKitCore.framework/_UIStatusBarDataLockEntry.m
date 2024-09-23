@implementation _UIStatusBarDataLockEntry

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_UIStatusBarDataLockEntry;
  return self->_unlockFailureCount ^ -[_UIStatusBarDataEntry hash](&v3, sel_hash);
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataLockEntry;
  v4 = -[_UIStatusBarDataEntry copyWithZone:](&v6, sel_copyWithZone_, a3);
  objc_msgSend(v4, "setUnlockFailureCount:", self->_unlockFailureCount);
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIStatusBarDataLockEntry;
  v4 = a3;
  -[_UIStatusBarDataEntry encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_unlockFailureCount, CFSTR("unlockFailureCount"), v5.receiver, v5.super_class);

}

- (_UIStatusBarDataLockEntry)initWithCoder:(id)a3
{
  id v3;
  _UIStatusBarDataLockEntry *v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_UIStatusBarDataLockEntry;
  v3 = a3;
  v4 = -[_UIStatusBarDataEntry initWithCoder:](&v7, sel_initWithCoder_, v3);
  v5 = objc_msgSend(v3, "decodeIntegerForKey:", CFSTR("unlockFailureCount"), v7.receiver, v7.super_class);

  -[_UIStatusBarDataLockEntry setUnlockFailureCount:](v4, "setUnlockFailureCount:", v5);
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  int64_t unlockFailureCount;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIStatusBarDataLockEntry;
  if (-[_UIStatusBarDataEntry isEqual:](&v9, sel_isEqual_, v4))
  {
    v5 = v4;
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0 || -[_UIStatusBarDataEntry isEnabled](self, "isEnabled"))
    {
      unlockFailureCount = self->_unlockFailureCount;
      v7 = unlockFailureCount == objc_msgSend(v5, "unlockFailureCount");
    }
    else
    {
      v7 = 1;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_ui_descriptionBuilder
{
  void *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIStatusBarDataLockEntry;
  -[_UIStatusBarDataEntry _ui_descriptionBuilder](&v6, sel__ui_descriptionBuilder);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(sel_unlockFailureCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "appendKey:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (int64_t)unlockFailureCount
{
  return self->_unlockFailureCount;
}

- (void)setUnlockFailureCount:(int64_t)a3
{
  self->_unlockFailureCount = a3;
}

@end
