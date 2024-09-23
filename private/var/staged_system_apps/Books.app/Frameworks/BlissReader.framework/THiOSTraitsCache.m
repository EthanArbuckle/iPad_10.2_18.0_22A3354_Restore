@implementation THiOSTraitsCache

- (THiOSTraitsCache)init
{
  THiOSTraitsCache *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THiOSTraitsCache;
  result = -[THiOSTraitsCache init](&v3, "init");
  if (result)
    result->_accessLock._os_unfair_lock_opaque = 0;
  return result;
}

- (void)updateTraitsWithCollection:(id)a3
{
  id v4;
  BOOL v5;
  BOOL v6;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = objc_msgSend(v4, "horizontalSizeClass") == (char *)&dword_0 + 1;
  objc_msgSend(v4, "horizontalSizeClass");
  v6 = objc_msgSend(v4, "verticalSizeClass") == (char *)&dword_0 + 1;
  objc_msgSend(v4, "verticalSizeClass");

  os_unfair_lock_lock(&self->_accessLock);
  self->mCompactWidth = v5;
  self->mCompactHeight = v6;
  os_unfair_lock_unlock(&self->_accessLock);
}

- (BOOL)isCompactWidth
{
  THiOSTraitsCache *v2;
  os_unfair_lock_s *p_accessLock;

  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(v2) = v2->mCompactWidth;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (BOOL)isCompactHeight
{
  THiOSTraitsCache *v2;
  os_unfair_lock_s *p_accessLock;

  v2 = self;
  p_accessLock = &self->_accessLock;
  os_unfair_lock_lock(&self->_accessLock);
  LOBYTE(v2) = v2->mCompactHeight;
  os_unfair_lock_unlock(p_accessLock);
  return (char)v2;
}

- (void)setCompactWidth:(BOOL)a3
{
  self->mCompactWidth = a3;
}

- (void)setCompactHeight:(BOOL)a3
{
  self->mCompactHeight = a3;
}

@end
