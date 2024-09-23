@implementation SUSpacePurgeOptions

- (SUSpacePurgeOptions)init
{
  SUSpacePurgeOptions *v2;
  SUSpacePurgeOptions *v3;
  OS_dispatch_queue *completionQueue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUSpacePurgeOptions;
  v2 = -[SUSpacePurgeOptions init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    completionQueue = v2->_completionQueue;
    v2->_completionQueue = 0;

    v3->_neededBytes = 0;
    *(_WORD *)&v3->_enableCacheDelete = 1;
    v3->_cacheDeleteUrgency = -1;
    v3->_appOffloadUrgency = 1;
  }
  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SUSpacePurgeOptions)initWithCoder:(id)a3
{
  id v4;
  SUSpacePurgeOptions *v5;
  objc_super v7;

  v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SUSpacePurgeOptions;
  v5 = -[SUSpacePurgeOptions init](&v7, sel_init);
  if (v5)
  {
    -[SUSpacePurgeOptions setNeededBytes:](v5, "setNeededBytes:", objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("neededBytes")));
    -[SUSpacePurgeOptions setEnableCacheDelete:](v5, "setEnableCacheDelete:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableCachDelete")));
    -[SUSpacePurgeOptions setEnableAppOffload:](v5, "setEnableAppOffload:", objc_msgSend(v4, "decodeBoolForKey:", CFSTR("enableAppOffload")));
    -[SUSpacePurgeOptions setCacheDeleteUrgency:](v5, "setCacheDeleteUrgency:", objc_msgSend(v4, "decodeIntForKey:", CFSTR("cacheDeleteUrgency")));
    -[SUSpacePurgeOptions setAppOffloadUrgency:](v5, "setAppOffloadUrgency:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("appOffloadUrgency")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t neededBytes;
  id v5;

  neededBytes = self->_neededBytes;
  v5 = a3;
  objc_msgSend(v5, "encodeInt64:forKey:", neededBytes, CFSTR("neededBytes"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableCacheDelete, CFSTR("enableCachDelete"));
  objc_msgSend(v5, "encodeBool:forKey:", self->_enableAppOffload, CFSTR("enableAppOffload"));
  objc_msgSend(v5, "encodeInt:forKey:", self->_cacheDeleteUrgency, CFSTR("cacheDeleteUrgency"));
  objc_msgSend(v5, "encodeInteger:forKey:", self->_appOffloadUrgency, CFSTR("appOffloadUrgency"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;

  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setCompletionQueue:", self->_completionQueue);
  objc_msgSend(v4, "setNeededBytes:", self->_neededBytes);
  objc_msgSend(v4, "setEnableCacheDelete:", self->_enableCacheDelete);
  objc_msgSend(v4, "setEnableAppOffload:", self->_enableAppOffload);
  objc_msgSend(v4, "setCacheDeleteUrgency:", self->_cacheDeleteUrgency);
  objc_msgSend(v4, "setAppOffloadUrgency:", self->_appOffloadUrgency);
  return v4;
}

- (OS_dispatch_queue)completionQueue
{
  return self->_completionQueue;
}

- (void)setCompletionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_completionQueue, a3);
}

- (unint64_t)neededBytes
{
  return self->_neededBytes;
}

- (void)setNeededBytes:(unint64_t)a3
{
  self->_neededBytes = a3;
}

- (BOOL)enableCacheDelete
{
  return self->_enableCacheDelete;
}

- (void)setEnableCacheDelete:(BOOL)a3
{
  self->_enableCacheDelete = a3;
}

- (BOOL)enableAppOffload
{
  return self->_enableAppOffload;
}

- (void)setEnableAppOffload:(BOOL)a3
{
  self->_enableAppOffload = a3;
}

- (int)cacheDeleteUrgency
{
  return self->_cacheDeleteUrgency;
}

- (void)setCacheDeleteUrgency:(int)a3
{
  self->_cacheDeleteUrgency = a3;
}

- (int64_t)appOffloadUrgency
{
  return self->_appOffloadUrgency;
}

- (void)setAppOffloadUrgency:(int64_t)a3
{
  self->_appOffloadUrgency = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQueue, 0);
}

@end
