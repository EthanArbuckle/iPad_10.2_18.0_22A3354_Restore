@implementation MTUniversalPlaybackPositionTransactionContext

+ (void)setUPPDomainVersion:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v3 = objc_msgSend(v6, "length");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v5 = v4;
  if (v3)
    objc_msgSend(v4, "setObject:forKey:", v6, CFSTR("kMTUPPTransitionContextUPPDomainVersionKey"));
  else
    objc_msgSend(v4, "removeObjectForKey:", CFSTR("kMTUPPTransitionContextUPPDomainVersionKey"));

}

+ (id)UPPDomainVersion
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringForKey:", CFSTR("kMTUPPTransitionContextUPPDomainVersionKey")));

  return v3;
}

- (id)lastSyncedDomainVersion
{
  return objc_msgSend((id)objc_opt_class(self), "UPPDomainVersion");
}

- (NSMutableDictionary)mediaItems
{
  return self->_mediaItems;
}

- (void)setMediaItems:(id)a3
{
  objc_storeStrong((id *)&self->_mediaItems, a3);
}

- (double)syncStartTime
{
  return self->_syncStartTime;
}

- (void)setSyncStartTime:(double)a3
{
  self->_syncStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaItems, 0);
}

@end
