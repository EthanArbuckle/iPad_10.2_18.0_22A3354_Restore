@implementation SKNotificationsCache

- (void)prepareWithDiskOperationMap:(id)a3
{
  uint64_t v4;
  __objc2_class *v5;
  void *i;
  SKDiskOperations *v7;
  void *v8;
  void *v9;
  SKDiskOperations *v10;
  __objc2_class *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  id v19;
  __DADisk *v20;
  DADiskRef v21;
  SKDiskOperations *v22;
  void *v23;
  id v24;
  void *vtable;
  void *v26;
  void *v27;
  void *v28;
  SKDiskOperations *v29;
  id v30;
  NSObject *v31;
  void *v32;
  SKDiskOperations *v33;
  id v34;
  SKDiskOperations *v35;
  uint64_t v36;
  SKNotificationsCache *v37;
  id v38;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[2];
  _QWORD v45[2];
  uint8_t buf[4];
  const char *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];

  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  obj = a3;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
  if (v38)
  {
    v4 = *(_QWORD *)v41;
    v5 = &OBJC_METACLASS___SKVolume;
    v36 = *(_QWORD *)v41;
    v37 = self;
    do
    {
      for (i = 0; i != v38; i = (char *)i + 1)
      {
        if (*(_QWORD *)v41 != v4)
          objc_enumerationMutation(obj);
        v7 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(objc_msgSend(obj, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * (_QWORD)i)));
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v5[64].vtable));
        if (objc_msgSend(v8, "isEqualToString:", off_100051A40))
        {

LABEL_8:
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
          v10 = -[SKDiskOperations initWithWholeDiskOperation:]([SKDiskOperations alloc], "initWithWholeDiskOperation:", v7);
          objc_msgSend(v9, "addObject:", v10);
          goto LABEL_34;
        }
        v11 = v5;
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", v5[64].vtable));
        if ((objc_msgSend(v12, "isEqualToString:", off_100051A38) & 1) != 0)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v7, "objectForKeyedSubscript:", off_100051A48));
          v14 = sub_10000FC5C(v13);

          self = v37;
          v5 = v11;
          if ((v14 & 1) == 0)
            goto LABEL_8;
        }
        else
        {

          v5 = v11;
        }
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKey:](v7, "objectForKey:", off_100051A50));
        v10 = (SKDiskOperations *)DADiskCopyDescription((DADiskRef)v9);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", kDADiskDescriptionVolumeNetworkKey));
        if (sub_10000FC18(v15))
        {
          v16 = sub_10000BA9C();
          v17 = objc_claimAutoreleasedReturnValue(v16);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136315394;
            v47 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
            v48 = 2112;
            v49 = v9;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "%s: %@ is a network disk, ignoring", buf, 0x16u);
          }
        }
        else
        {
          v17 = objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectForKeyedSubscript:](v10, "objectForKeyedSubscript:", kDADiskDescriptionMediaWholeKey));
          if ((sub_10000FC18(v17) & 1) != 0
            || +[SKAPFSDisk isLIFSAPFSWithDiskDescription:](SKAPFSDisk, "isLIFSAPFSWithDiskDescription:", v10))
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
            v19 = objc_msgSend(v18, "indexOfObject:", v9);

            self = v37;
            v20 = (__DADisk *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
            v21 = v20;
            if (v19 == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              v22 = -[SKDiskOperations initWithWholeDiskOperation:]([SKDiskOperations alloc], "initWithWholeDiskOperation:", v7);
              -[__DADisk addObject:](v21, "addObject:", v22);
            }
            else
            {
              v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[__DADisk objectAtIndexedSubscript:](v20, "objectAtIndexedSubscript:", v19));
              -[SKDiskOperations setWholeDiskOperation:](v22, "setWholeDiskOperation:", v7);
            }
          }
          else
          {
            v21 = DADiskCopyWholeDisk((DADiskRef)v9);
            if (v21)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
              v24 = objc_msgSend(v23, "indexOfObject:", v21);

              if (v24 == (id)0x7FFFFFFFFFFFFFFFLL)
              {
                vtable = v11[64].vtable;
                v44[0] = off_100051A50;
                v44[1] = vtable;
                v45[0] = v21;
                v45[1] = off_100051A28;
                v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v45, v44, 2));
                v35 = -[SKDiskOperations initWithWholeDiskOperation:]([SKDiskOperations alloc], "initWithWholeDiskOperation:", v22);
                v26 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations childrenOperations](v35, "childrenOperations"));
                objc_msgSend(v26, "addObject:", v7);

                v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
                v28 = v27;
                v29 = v35;
              }
              else
              {
                v22 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
                v35 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations objectAtIndexedSubscript:](v22, "objectAtIndexedSubscript:", v24));
                v27 = (void *)objc_claimAutoreleasedReturnValue(-[SKDiskOperations childrenOperations](v35, "childrenOperations"));
                v28 = v27;
                v29 = v7;
              }
              objc_msgSend(v27, "addObject:", v29);

              self = v37;
            }
            else
            {
              v30 = sub_10000BA9C();
              v31 = objc_claimAutoreleasedReturnValue(v30);
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136315394;
                v47 = "-[SKNotificationsCache prepareWithDiskOperationMap:]";
                v48 = 2112;
                v49 = v9;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: Failed to get whole disk for %@", buf, 0x16u);
              }

              v22 = -[SKDiskOperations initWithWholeDiskOperation:]([SKDiskOperations alloc], "initWithWholeDiskOperation:", v7);
              v32 = (void *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](self, "disksToProcess"));
              v34 = objc_msgSend(v32, "indexOfObject:", v9);

              self = v37;
              v33 = (SKDiskOperations *)objc_claimAutoreleasedReturnValue(-[SKNotificationsCache disksToProcess](v37, "disksToProcess"));
              v35 = v33;
              if (v34 == (id)0x7FFFFFFFFFFFFFFFLL)
                -[SKDiskOperations addObject:](v33, "addObject:", v22);
              else
                -[SKDiskOperations setObject:atIndexedSubscript:](v33, "setObject:atIndexedSubscript:", v22);
            }

          }
          v5 = v11;
        }

        v4 = v36;
LABEL_34:

      }
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v50, 16);
    }
    while (v38);
  }

}

- (SKNotificationsCache)initWithDiskOperationMap:(id)a3
{
  id v4;
  SKNotificationsCache *v5;
  uint64_t v6;
  NSMutableArray *appearedDisks;
  uint64_t v8;
  NSMutableArray *changedDisks;
  uint64_t v10;
  NSMutableArray *disappearedDisks;
  uint64_t v12;
  NSMutableArray *disksToProcess;
  dispatch_group_t v14;
  OS_dispatch_group *processingGroup;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SKNotificationsCache;
  v5 = -[SKNotificationsCache init](&v17, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    appearedDisks = v5->_appearedDisks;
    v5->_appearedDisks = (NSMutableArray *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    changedDisks = v5->_changedDisks;
    v5->_changedDisks = (NSMutableArray *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    disappearedDisks = v5->_disappearedDisks;
    v5->_disappearedDisks = (NSMutableArray *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    disksToProcess = v5->_disksToProcess;
    v5->_disksToProcess = (NSMutableArray *)v12;

    v14 = dispatch_group_create();
    processingGroup = v5->_processingGroup;
    v5->_processingGroup = (OS_dispatch_group *)v14;

    -[SKNotificationsCache prepareWithDiskOperationMap:](v5, "prepareWithDiskOperationMap:", v4);
  }

  return v5;
}

- (NSMutableArray)appearedDisks
{
  return self->_appearedDisks;
}

- (NSMutableArray)changedDisks
{
  return self->_changedDisks;
}

- (NSMutableArray)disappearedDisks
{
  return self->_disappearedDisks;
}

- (OS_dispatch_group)processingGroup
{
  return self->_processingGroup;
}

- (NSMutableArray)disksToProcess
{
  return self->_disksToProcess;
}

- (SKDisk)processedDisk
{
  return self->_processedDisk;
}

- (void)setProcessedDisk:(id)a3
{
  objc_storeStrong((id *)&self->_processedDisk, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processedDisk, 0);
  objc_storeStrong((id *)&self->_disksToProcess, 0);
  objc_storeStrong((id *)&self->_processingGroup, 0);
  objc_storeStrong((id *)&self->_disappearedDisks, 0);
  objc_storeStrong((id *)&self->_changedDisks, 0);
  objc_storeStrong((id *)&self->_appearedDisks, 0);
}

@end
