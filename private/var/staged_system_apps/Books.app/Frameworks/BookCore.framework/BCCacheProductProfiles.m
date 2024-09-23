@implementation BCCacheProductProfiles

- (BCCacheProductProfiles)init
{
  BCCacheProductProfiles *v2;
  BCCacheProductProfiles *v3;
  uint64_t v4;
  NSMutableDictionary *completions;
  uint64_t v6;
  NSMutableSet *profilesToFetch;
  id v8;
  id *v9;
  id v10;
  id v11;
  _QWORD v13[4];
  id *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BCCacheProductProfiles;
  v2 = -[BCCacheProductProfiles init](&v15, "init");
  v3 = v2;
  if (v2)
  {
    v2->_accessLock._os_unfair_lock_opaque = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    completions = v3->_completions;
    v3->_completions = (NSMutableDictionary *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set"));
    profilesToFetch = v3->_profilesToFetch;
    v3->_profilesToFetch = (NSMutableSet *)v6;

    v8 = objc_alloc((Class)BUCoalescingCallBlock);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_40DC;
    v13[3] = &unk_28B728;
    v9 = v3;
    v14 = v9;
    v10 = objc_msgSend(v8, "initWithNotifyBlock:blockDescription:", v13, CFSTR("BCCacheProductProfiles"));
    v11 = v9[4];
    v9[4] = v10;

    objc_msgSend(v9[4], "setCoalescingDelay:", 0.2);
    objc_msgSend(v9[4], "setMaximumDelay:", 0.4);

  }
  return v3;
}

- (void)fetchCoverURLsFor:(id)a3 immediately:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v13[5];
  id v14;
  id v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_4394;
  v13[3] = &unk_28B750;
  v13[4] = self;
  v10 = v8;
  v14 = v10;
  v11 = v9;
  v15 = v11;
  os_unfair_lock_lock(&self->_accessLock);
  sub_4394((uint64_t)v13);
  os_unfair_lock_unlock(&self->_accessLock);
  if (v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", v10));
    -[BCCacheProductProfiles performFetch:](self, "performFetch:", v12);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BCCacheProductProfiles coalescedFetch](self, "coalescedFetch"));
    objc_msgSend(v12, "signalWithCompletion:", &stru_28B790);
  }

}

- (id)describedImagesFromProductProfile:(id)a3
{
  return &__NSArray0__struct;
}

- (void)batchFetchCoverURLsFor:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_452C;
  v10[3] = &unk_28B7B8;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "profilesForStoreIDs:keyProfile:completion:", v9, CFSTR("kAEUserPublishingLookProfileProduct"), v10);

}

- (void)_fetchedProfile:(id)a3 withIdentifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_accessLock;
  id v8;
  _QWORD *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[2];
  void (*v22)(uint64_t);
  void *v23;
  BCCacheProductProfiles *v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _BYTE v33[128];

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = sub_41FC;
  v31 = sub_420C;
  v32 = 0;
  p_accessLock = &self->_accessLock;
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v22 = sub_4A24;
  v23 = &unk_28B7E0;
  v26 = &v27;
  v24 = self;
  v8 = a4;
  v25 = v8;
  v9 = v21;
  os_unfair_lock_lock(p_accessLock);
  v22((uint64_t)v9);
  os_unfair_lock_unlock(p_accessLock);

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = (id)v28[5];
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expiration", (_QWORD)v17));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "error"));
        (*(void (**)(uint64_t, id, void *, void *))(v14 + 16))(v14, v6, v15, v16);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v33, 16);
    }
    while (v11);
  }

  _Block_object_dispose(&v27, 8);
}

- (void)performFetch:(id)a3
{
  id v4;
  _QWORD *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t *v11;
  _QWORD v12[2];
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_41FC;
  v21 = sub_420C;
  v22 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v13 = sub_4C2C;
  v14 = &unk_28B700;
  v16 = &v17;
  v4 = a3;
  v15 = v4;
  v5 = v12;
  os_unfair_lock_lock(&self->_accessLock);
  v13((uint64_t)v5);
  os_unfair_lock_unlock(&self->_accessLock);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[AEUserPublishing sharedInstance](AEUserPublishing, "sharedInstance"));
  v7 = v18[5];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4C64;
  v9[3] = &unk_28B858;
  v11 = &v17;
  v9[4] = self;
  v8 = v4;
  v10 = v8;
  objc_msgSend(v6, "profilesForStoreIDs:keyProfile:completion:", v7, CFSTR("kAEUserPublishingLookProfileProduct"), v9);

  _Block_object_dispose(&v17, 8);
}

- (NSMutableDictionary)completions
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompletions:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSMutableSet)profilesToFetch
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setProfilesToFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (BUCoalescingCallBlock)coalescedFetch
{
  return (BUCoalescingCallBlock *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCoalescedFetch:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (os_unfair_lock_s)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(os_unfair_lock_s)a3
{
  self->_accessLock = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedFetch, 0);
  objc_storeStrong((id *)&self->_profilesToFetch, 0);
  objc_storeStrong((id *)&self->_completions, 0);
}

@end
