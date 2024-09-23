@implementation APCacheStoreCleanupOperation

- (APCacheStoreCleanupOperation)initWithFilesEnumerator:(id)a3 expirationDate:(id)a4
{
  id v7;
  id v8;
  void *v9;
  APCacheStoreCleanupOperation *v10;
  APCacheStoreCleanupOperation *v11;
  double v12;
  uint64_t v13;
  NSDate *now;
  NSString *v16;
  void *v17;
  NSString *v18;
  void *v19;

  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8)
      goto LABEL_3;
  }
  else
  {
    v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ filesEnumerator cannot be nil"), objc_opt_class(self));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    APSimulateCrash(5, v17, 1);

    if (v9)
      goto LABEL_3;
  }
  v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ expirationDate cannot be nil"), objc_opt_class(self));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  APSimulateCrash(5, v19, 1);

LABEL_3:
  v10 = -[APCacheStoreCleanupOperation init](self, "init");
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_filesEnumerator, a3);
    objc_msgSend(v9, "timeIntervalSince1970");
    v11->_expirationDate = v12;
    v11->_maxObjectLifetime = 864000.0;
    v13 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    now = v11->_now;
    v11->_now = (NSDate *)v13;

  }
  return v11;
}

- (void)main
{
  void *v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  BOOL v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  do
  {
    if ((-[APCacheStoreCleanupOperation isCancelled](self, "isCancelled") & 1) != 0)
      break;
    v7 = objc_autoreleasePoolPush();
    v8 = sub_100165840((double *)self);
    objc_autoreleasePoolPop(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v9, "timeIntervalSince1970");
    v11 = v10;

    v6 = v11 - v5;
    if (v11 - v5 > 600.0)
      break;
  }
  while (v8);
  v13 = (id)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now", v6));
  objc_msgSend(v13, "timeIntervalSince1970");
  -[APCacheStoreCleanupOperation setDuration:](self, "setDuration:", v12 - v5);

}

- (double)maxObjectLifetime
{
  return self->_maxObjectLifetime;
}

- (void)setMaxObjectLifetime:(double)a3
{
  self->_maxObjectLifetime = a3;
}

- (id)removalBlock
{
  return self->_removalBlock;
}

- (void)setRemovalBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)ancientItemBlock
{
  return self->_ancientItemBlock;
}

- (void)setAncientItemBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (NSEnumerator)filesEnumerator
{
  return self->_filesEnumerator;
}

- (void)setFilesEnumerator:(id)a3
{
  objc_storeStrong((id *)&self->_filesEnumerator, a3);
}

- (NSDate)now
{
  return self->_now;
}

- (void)setNow:(id)a3
{
  objc_storeStrong((id *)&self->_now, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_now, 0);
  objc_storeStrong((id *)&self->_filesEnumerator, 0);
  objc_storeStrong(&self->_ancientItemBlock, 0);
  objc_storeStrong(&self->_removalBlock, 0);
}

@end
