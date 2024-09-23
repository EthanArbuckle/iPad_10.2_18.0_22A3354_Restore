@implementation BKTouchDeliveryGenericGestureFocusObserver

- (BKTouchDeliveryGenericGestureFocusObserver)initWithHIDSystem:(id)a3
{
  id v5;
  BKTouchDeliveryGenericGestureFocusObserver *v6;
  BKTouchDeliveryGenericGestureFocusObserver *v7;
  NSMutableDictionary *v8;
  NSMutableDictionary *lock_destinationPerDisplayUUID;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKTouchDeliveryGenericGestureFocusObserver;
  v6 = -[BKTouchDeliveryGenericGestureFocusObserver init](&v11, "init");
  v7 = v6;
  if (v6)
  {
    v6->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_HIDSystem, a3);
    v8 = objc_opt_new(NSMutableDictionary);
    lock_destinationPerDisplayUUID = v7->_lock_destinationPerDisplayUUID;
    v7->_lock_destinationPerDisplayUUID = v8;

  }
  return v7;
}

- (id)eventDestinationForDisplayUUID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  os_unfair_lock_s *p_lock;
  void *v9;
  id v10;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  v6 = (void *)BKSDisplayUUIDMainKey;
  if (v5)
    v6 = v4;
  v7 = v6;

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_destinationPerDisplayUUID, "objectForKey:", v7));
  v10 = objc_msgSend(v9, "copy");

  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)setEventDestination:(id)a3 forDisplayUUID:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "length");
  v9 = (void *)BKSDisplayUUIDMainKey;
  if (v8)
    v9 = v7;
  v10 = v9;

  v12 = BKLogTouchEvents(v11);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138543618;
    v15 = v6;
    v16 = 2114;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "set focus-follows-touch destination:%{public}@ for display:%{public}@", (uint8_t *)&v14, 0x16u);
  }

  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKey:](self->_lock_destinationPerDisplayUUID, "setObject:forKey:", v6, v10);
  os_unfair_lock_unlock(&self->_lock);

}

- (BOOL)destinationPIDMatchesHapticFeedbackRequestPID:(int)a3
{
  os_unfair_lock_s *p_lock;
  NSMutableDictionary *lock_destinationPerDisplayUUID;
  _QWORD v8[5];
  int v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_destinationPerDisplayUUID = self->_lock_destinationPerDisplayUUID;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000602A0;
  v8[3] = &unk_1000EB840;
  v9 = a3;
  v8[4] = &v10;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](lock_destinationPerDisplayUUID, "enumerateKeysAndObjectsUsingBlock:", v8);
  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)p_lock;
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  return -[BKTouchDeliveryGenericGestureFocusObserver destinationsForEvent:fromSender:overrideSenderDescriptor:](self, "destinationsForEvent:fromSender:overrideSenderDescriptor:", a3, a4, 0);
}

- (id)destinationsForEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 overrideSenderDescriptor:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v8 = a4;
  v9 = a5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayUUID"));
  v11 = objc_msgSend(v10, "length");
  v12 = (void *)BKSDisplayUUIDMainKey;
  if (v11)
    v12 = v10;
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](self->_lock_destinationPerDisplayUUID, "objectForKey:", v13));
  if (IOHIDEventGetType(a3) == 39 && v14)
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObject:](NSSet, "setWithObject:", v14));
  else
    v15 = objc_claimAutoreleasedReturnValue(-[BKHIDSystemInterface destinationsForEvent:fromSender:overrideSenderDescriptor:](self->_HIDSystem, "destinationsForEvent:fromSender:overrideSenderDescriptor:", a3, v8, v9));
  v16 = (void *)v15;
  os_unfair_lock_unlock(&self->_lock);

  return v16;
}

- (void)postEvent:(__IOHIDEvent *)a3 toDestination:(id)a4
{
  -[BKHIDSystemInterface postEvent:toDestination:](self->_HIDSystem, "postEvent:toDestination:", a3, a4);
}

- (void)postEvent:(__IOHIDEvent *)a3 fromSender:(id)a4
{
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKTouchDeliveryGenericGestureFocusObserver destinationsForEvent:fromSender:](self, "destinationsForEvent:fromSender:", a3, a4));
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        -[BKTouchDeliveryGenericGestureFocusObserver postEvent:toDestination:](self, "postEvent:toDestination:", a3, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10));
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (BKHIDSystemInterface)HIDSystem
{
  return self->_HIDSystem;
}

- (void)setHIDSystem:(id)a3
{
  objc_storeStrong((id *)&self->_HIDSystem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_HIDSystem, 0);
  objc_storeStrong((id *)&self->_lock_destinationPerDisplayUUID, 0);
}

+ (id)sharedInstance
{
  if (qword_1001174A0 != -1)
    dispatch_once(&qword_1001174A0, &stru_1000EB818);
  return (id)qword_1001174A8;
}

@end
