@implementation _DUIAccessibilityDragStatus

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_DUIAccessibilityDragStatus)initWithCoder:(id)a3
{
  id v4;
  _DUIAccessibilityDragStatus *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_DUIAccessibilityDragStatus;
  v5 = -[_DUIAccessibilityDragStatus init](&v7, sel_init);
  if (v5)
  {
    v5->_itemCount = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("itemCount"));
    v5->_potentialOperation = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("potentialOperation"));
    v5->_forbidden = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("forbidden"));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t itemCount;
  id v5;

  itemCount = self->_itemCount;
  v5 = a3;
  objc_msgSend(v5, "encodeInteger:forKey:", itemCount, CFSTR("itemCount"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_potentialOperation, CFSTR("potentialOperation"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_forbidden, CFSTR("forbidden"));

}

- (id)description
{
  void *v3;
  uint64_t v4;
  const __CFString *v5;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  if (self->_forbidden)
    v5 = CFSTR("YES");
  else
    v5 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: itemCount=%ld, potentialOperation=%ld, forbidden=%@>"), v4, self, self->_itemCount, self->_potentialOperation, v5);
}

- (int64_t)itemCount
{
  return self->_itemCount;
}

- (void)setItemCount:(int64_t)a3
{
  self->_itemCount = a3;
}

- (unint64_t)potentialOperation
{
  return self->_potentialOperation;
}

- (void)setPotentialOperation:(unint64_t)a3
{
  self->_potentialOperation = a3;
}

- (BOOL)forbidden
{
  return self->_forbidden;
}

- (void)setForbidden:(BOOL)a3
{
  self->_forbidden = a3;
}

@end
