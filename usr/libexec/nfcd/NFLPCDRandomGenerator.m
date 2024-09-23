@implementation NFLPCDRandomGenerator

- (NFLPCDRandomGenerator)init
{
  NFLPCDRandomGenerator *v2;
  NSMutableData *v3;
  NSMutableData *rnd;
  NFLPCDRandomGenerator *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)NFLPCDRandomGenerator;
  v2 = -[NFLPCDRandomGenerator init](&v7, "init");
  if (v2)
  {
    v3 = (NSMutableData *)objc_msgSend(objc_alloc((Class)NSMutableData), "initWithLength:", 6);
    rnd = v2->_rnd;
    v2->_rnd = v3;

    arc4random_buf(-[NSMutableData mutableBytes](v2->_rnd, "mutableBytes"), 6uLL);
    v2->_isOverride = 0;
    v2->_lock._os_unfair_lock_opaque = 0;
    v5 = v2;
  }

  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideRnd, 0);
  objc_storeStrong((id *)&self->_rnd, 0);
}

@end
