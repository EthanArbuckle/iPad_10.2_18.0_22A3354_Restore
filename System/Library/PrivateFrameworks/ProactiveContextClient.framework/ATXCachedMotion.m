@implementation ATXCachedMotion

- (ATXCachedMotion)initWithATXMotion:(id)a3
{
  id v4;
  ATXCachedMotion *v5;
  ATXCachedMotion *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ATXCachedMotion;
  v5 = -[ATXCachedMotion init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ATXCachedMotion update:](v5, "update:", v4);

  return v6;
}

- (void)update:(id)a3
{
  id v4;
  ATXMotion *v5;
  ATXMotion *currentMotion;
  NSDate *v7;
  NSDate *lastUpdated;
  id v9;

  v4 = a3;
  v9 = v4;
  if (v4)
    v5 = (ATXMotion *)v4;
  else
    v5 = -[ATXMotion initFromCMMotionActivity:]([ATXMotion alloc], "initFromCMMotionActivity:", 0);
  currentMotion = self->_currentMotion;
  self->_currentMotion = v5;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastUpdated = self->lastUpdated;
  self->lastUpdated = v7;

}

- (BOOL)isExpired
{
  NSDate *lastUpdated;
  double v3;

  lastUpdated = self->lastUpdated;
  if (!lastUpdated)
    return 1;
  -[NSDate timeIntervalSinceNow](lastUpdated, "timeIntervalSinceNow");
  return v3 < -5.0;
}

- (ATXMotion)currentMotion
{
  return self->_currentMotion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentMotion, 0);
  objc_storeStrong((id *)&self->lastUpdated, 0);
}

@end
