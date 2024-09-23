@implementation NIServerClientPublisher

- (NIServerClientPublisher)initWithClient:(id)a3
{
  id v6;
  NIServerClientPublisher *v7;
  NIServerClientPublisher *v8;
  NSMutableSet *v9;
  NSMutableSet *observers;
  void *v12;
  objc_super v13;

  v6 = a3;
  if (!v6)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("NIServerClientPublisher.mm"), 18, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v13.receiver = self;
  v13.super_class = (Class)NIServerClientPublisher;
  v7 = -[NIServerClientPublisher init](&v13, "init");
  v8 = v7;
  if (v7)
  {
    v7->_observersLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v7->_client, a3);
    v9 = objc_opt_new(NSMutableSet);
    observers = v8->_observers;
    v8->_observers = v9;

  }
  return v8;
}

+ (id)publisherForClient:(id)a3
{
  id v3;
  NIServerClientPublisher *v4;

  v3 = a3;
  v4 = -[NIServerClientPublisher initWithClient:]([NIServerClientPublisher alloc], "initWithClient:", v3);

  return v4;
}

- (void)addObservers:(id)a3
{
  os_unfair_lock_s *p_observersLock;
  id v5;

  p_observersLock = &self->_observersLock;
  v5 = a3;
  os_unfair_lock_lock(p_observersLock);
  -[NSMutableSet addObjectsFromArray:](self->_observers, "addObjectsFromArray:", v5);

  os_unfair_lock_unlock(p_observersLock);
}

- (void)removeObservers:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  os_unfair_lock_lock(&self->_observersLock);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        -[NSMutableSet removeObject:](self->_observers, "removeObject:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v8), (_QWORD)v9);
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_observersLock);
}

- (void)didDiscoverNearbyObject:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient didDiscoverNearbyObject:](self->_client, "didDiscoverNearbyObject:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didDiscoverNearbyObject:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  id v6;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v6 = a3;
  -[NIServerClient didRemoveNearbyObjects:withReason:](self->_client, "didRemoveNearbyObjects:withReason:", v6, a4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "didRemoveNearbyObjects:withReason:", v6, a4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NIServerClient didUpdateHealthStatus:](self->_client, "didUpdateHealthStatus:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didUpdateHealthStatus:", a3, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  -[NIServerClient didGenerateShareableConfigurationData:forObject:](self->_client, "didGenerateShareableConfigurationData:forObject:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didGenerateShareableConfigurationData:forObject:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient didUpdateLocalDiscoveryToken:](self->_client, "didUpdateLocalDiscoveryToken:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didUpdateLocalDiscoveryToken:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  _BOOL8 v4;
  id v6;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v6 = a4;
  -[NIServerClient didReceiveRangingAuthRecommendation:forObject:](self->_client, "didReceiveRangingAuthRecommendation:forObject:", v4, v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "didReceiveRangingAuthRecommendation:forObject:", v4, v6, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateNearbyObjects:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient didUpdateNearbyObjects:](self->_client, "didUpdateNearbyObjects:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didUpdateNearbyObjects:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[NIServerClient object:didUpdateRegion:previousRegion:](self->_client, "object:didUpdateRegion:previousRegion:", v8, v9, v10);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = self->_observers;
  v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v13)
  {
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v12);
        objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), "object:didUpdateRegion:previousRegion:", v8, v9, v10, (_QWORD)v16);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateMotionState:(int64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NIServerClient didUpdateMotionState:](self->_client, "didUpdateMotionState:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didUpdateMotionState:", a3, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)relayDCKMessage:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient relayDCKMessage:](self->_client, "relayDCKMessage:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "relayDCKMessage:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient uwbSessionDidFailWithError:](self->_client, "uwbSessionDidFailWithError:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "uwbSessionDidFailWithError:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient uwbSessionDidInvalidateWithError:](self->_client, "uwbSessionDidInvalidateWithError:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "uwbSessionDidInvalidateWithError:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NIServerClient uwbSessionInterruptedWithReason:timestamp:](self->_client, "uwbSessionInterruptedWithReason:timestamp:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "uwbSessionInterruptedWithReason:timestamp:", a3, a4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  -[NIServerClient uwbSessionInterruptionReasonEnded:timestamp:](self->_client, "uwbSessionInterruptionReasonEnded:timestamp:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "uwbSessionInterruptionReasonEnded:timestamp:", a3, a4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  -[NIServerClient didUpdateAlgorithmState:forObject:](self->_client, "didUpdateAlgorithmState:forObject:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didUpdateAlgorithmState:forObject:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  _BOOL8 v3;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = a3;
  -[NIServerClient didUpdateHomeDeviceUWBRangingAvailability:](self->_client, "didUpdateHomeDeviceUWBRangingAvailability:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didUpdateHomeDeviceUWBRangingAvailability:", v3, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  -[NIServerClient didProcessAcwgM1MsgWithResponse:error:](self->_client, "didProcessAcwgM1MsgWithResponse:error:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didProcessAcwgM1MsgWithResponse:error:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  -[NIServerClient didProcessAcwgM3MsgWithResponse:error:](self->_client, "didProcessAcwgM3MsgWithResponse:error:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didProcessAcwgM3MsgWithResponse:error:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = a4;
  -[NIServerClient didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:](self->_client, "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", v6, v7);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v9 = self->_observers;
  v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "didProcessAcwgRangingSessionResumeRequestMsgWithResponse:error:", v6, v7, (_QWORD)v13);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  uint64_t v5;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v5 = *(_QWORD *)&a3;
  -[NIServerClient requestAcwgRangingSessionSuspend:withSuspendTriggerReason:](self->_client, "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "requestAcwgRangingSessionSuspend:withSuspendTriggerReason:", v5, a4, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NIServerClient didStartAcwgRanging:](self->_client, "didStartAcwgRanging:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didStartAcwgRanging:", a3, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  -[NIServerClient didSuspendAcwgRanging:](self->_client, "didSuspendAcwgRanging:");
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "didSuspendAcwgRanging:", a3, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  uint64_t v4;
  id v6;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = *(_QWORD *)&a3;
  v6 = a4;
  -[NIServerClient didPrefetchAcwgUrsk:error:](self->_client, "didPrefetchAcwgUrsk:error:", v4, v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "didPrefetchAcwgUrsk:error:", v4, v6, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateState:(id)a3
{
  id v4;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v4 = a3;
  -[NIServerClient systemDidUpdateState:](self->_client, "systemDidUpdateState:", v4);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v6 = self->_observers;
  v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "systemDidUpdateState:", v4, (_QWORD)v10);
        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  _BOOL8 v4;
  id v6;
  os_unfair_lock_s *p_observersLock;
  NSMutableSet *v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v4 = a3;
  v6 = a4;
  -[NIServerClient systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:](self->_client, "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:", v4, v6);
  p_observersLock = &self->_observersLock;
  os_unfair_lock_lock(&self->_observersLock);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = self->_observers;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "systemDidUpdateResourceUsageLimitExceeded:forSessionConfigurationTypeWithName:", v4, v6, (_QWORD)v12);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(p_observersLock);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

@end
