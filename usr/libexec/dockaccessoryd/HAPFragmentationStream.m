@implementation HAPFragmentationStream

+ (id)fragmentationPacketsForData:(id)a3 maxLength:(unint64_t)a4 transactionIdentifier:(unsigned __int16)a5
{
  uint64_t v5;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  id v11;
  NSObject *v12;
  __CFString *v13;
  NSObject *v14;
  id v15;
  __CFString *v16;
  NSObject *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  HAPFragmentationPacket *v22;
  void *v23;
  HAPFragmentationPacket *v24;
  uint64_t v25;
  NSObject *v26;
  id v27;
  __CFString *v28;
  NSObject *v29;
  int v31;
  NSObject *v32;
  __int16 v33;
  _BYTE v34[18];

  v5 = a5;
  v7 = a3;
  v8 = (unint64_t)objc_msgSend(v7, "length");
  if (a4)
  {
    v10 = v8;
    if (v8)
    {
      if (HIDWORD(v8))
      {
        v11 = sub_10007CCE4(0, v9);
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          v13 = sub_10007CD2C(0);
          v14 = objc_claimAutoreleasedReturnValue(v13);
          v31 = 138543874;
          v32 = v14;
          v33 = 1024;
          *(_DWORD *)v34 = -1;
          *(_WORD *)&v34[4] = 2048;
          *(_QWORD *)&v34[6] = v10;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Data cannot be larger than %u, is %tu", (uint8_t *)&v31, 0x1Cu);

        }
        goto LABEL_18;
      }
      v18 = a4 - 12;
      v12 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", (a4 + v8 - 13) / (a4 - 12)));
      v19 = 0;
      v20 = 0;
      while (1)
      {
        v21 = v10 - v19 >= v18 ? v18 : v10 - v19;
        v22 = [HAPFragmentationPacket alloc];
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subdataWithRange:", v19, v21));
        v24 = -[HAPFragmentationPacket initWithData:transactionIdentifier:length:offset:](v22, "initWithData:transactionIdentifier:length:offset:", v23, v5, v10, v20);

        if (!v24)
          break;
        -[NSObject addObject:](v12, "addObject:", v24);

        v19 = (v20 + v18);
        v20 = v19;
        if (v19 >= v10)
        {
          v12 = v12;
          v26 = v12;
          goto LABEL_19;
        }
      }
      v27 = sub_10007CCE4(0, v25);
      v17 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v28 = sub_10007CD2C(0);
        v29 = objc_claimAutoreleasedReturnValue(v28);
        v31 = 138543618;
        v32 = v29;
        v33 = 1024;
        *(_DWORD *)v34 = v20;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Failed to create packet for remaining data at offset %u", (uint8_t *)&v31, 0x12u);

      }
      goto LABEL_17;
    }
  }
  v15 = sub_10007CCE4(0, v9);
  v12 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    v16 = sub_10007CD2C(0);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    v31 = 138543874;
    v32 = v17;
    v33 = 2048;
    *(_QWORD *)v34 = objc_msgSend(v7, "length");
    *(_WORD *)&v34[8] = 2048;
    *(_QWORD *)&v34[10] = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Cannot create fragmented packet with length '%tu', max length '%tu'", (uint8_t *)&v31, 0x20u);
LABEL_17:

  }
LABEL_18:
  v26 = 0;
LABEL_19:

  return v26;
}

- (HAPFragmentationStream)init
{
  HAPFragmentationStream *v2;
  HAPFragmentationStream *v3;
  const char *v4;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *clientQueue;
  NSMutableOrderedSet *v9;
  NSMutableOrderedSet *pendingPackets;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)HAPFragmentationStream;
  v2 = -[HAPFragmentationStream init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v4 = (const char *)sub_100015E90(v2, 0);
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_create(v4, v6);
    clientQueue = v3->_clientQueue;
    v3->_clientQueue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableOrderedSet *)objc_alloc_init((Class)NSMutableOrderedSet);
    pendingPackets = v3->_pendingPackets;
    v3->_pendingPackets = v9;

  }
  return v3;
}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100008458;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)receivedFragmentedPacket:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100008560;
  v7[3] = &unk_100236AD0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)__transactionDataWithTransactionIdentifier:(unsigned __int16)a3
{
  int v3;
  void *v4;
  uint64_t v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  NSObject *v21;
  __CFString *v22;
  NSObject *v23;
  unsigned int v24;
  id v25;
  id v26;
  __CFString *v27;
  id v28;
  __CFString *v29;
  NSObject *v30;
  id v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  NSObject *v38;
  __int16 v39;
  _BYTE v40[14];
  _BYTE v41[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:"));
  if (!objc_msgSend(v4, "count"))
  {
    v26 = sub_10007CCE4(0, v5);
    v8 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
LABEL_20:
      v19 = 0;
      goto LABEL_21;
    }
    v27 = sub_10007CD2C(0);
    v9 = objc_claimAutoreleasedReturnValue(v27);
    *(_DWORD *)buf = 138543618;
    v38 = v9;
    v39 = 1024;
    *(_DWORD *)v40 = v3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] No packets matching transaction %u", buf, 0x12u);
LABEL_19:

    goto LABEL_20;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
  v7 = objc_msgSend(v6, "length");

  v8 = objc_claimAutoreleasedReturnValue(+[NSMutableData dataWithCapacity:](NSMutableData, "dataWithCapacity:", v7));
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v9 = v4;
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v34;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        v15 = objc_msgSend(v14, "offset", (_QWORD)v33);
        if (-[NSObject length](v8, "length") != (id)v15)
        {
          v20 = sub_10007CCE4(0, v16);
          v21 = objc_claimAutoreleasedReturnValue(v20);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          {
            v22 = sub_10007CD2C(0);
            v23 = objc_claimAutoreleasedReturnValue(v22);
            v24 = objc_msgSend(v14, "offset");
            v25 = -[NSObject length](v8, "length");
            *(_DWORD *)buf = 138543874;
            v38 = v23;
            v39 = 1024;
            *(_DWORD *)v40 = v24;
            *(_WORD *)&v40[4] = 2048;
            *(_QWORD *)&v40[6] = v25;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Packet with offset %u does not match current offset %tu", buf, 0x1Cu);

          }
          goto LABEL_19;
        }
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "data"));
        -[NSObject appendData:](v8, "appendData:", v17);

      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v11)
        continue;
      break;
    }
  }

  if (-[NSObject length](v8, "length") != (id)v7)
  {
    v28 = sub_10007CCE4(0, v18);
    v9 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v29 = sub_10007CD2C(0);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      v31 = -[NSObject length](v8, "length");
      *(_DWORD *)buf = 138543874;
      v38 = v30;
      v39 = 2048;
      *(_QWORD *)v40 = v31;
      *(_WORD *)&v40[8] = 1024;
      *(_DWORD *)&v40[10] = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[HAPFragmentationInputStream] Final payload length, %tu, doesn't match expected payload length, %u", buf, 0x1Cu);

    }
    goto LABEL_19;
  }
  v8 = v8;
  v19 = v8;
LABEL_21:

  return v19;
}

- (BOOL)__isTransactionCompleteWithTransactionIdentifier:(unsigned __int16)a3
{
  void *v3;
  id v4;
  id v5;
  id v6;
  int v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  unsigned int v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:", a3));
  if (objc_msgSend(v3, "count"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v4 = v3;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v5)
    {
      v6 = v5;
      v7 = 0;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "offset", (_QWORD)v16) != v7)
          {

            goto LABEL_12;
          }
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "data"));
          v7 += objc_msgSend(v11, "length");

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v6)
          continue;
        break;
      }
    }
    else
    {
      v7 = 0;
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "firstObject"));
    v14 = objc_msgSend(v13, "length");

    v12 = v7 == v14;
  }
  else
  {
LABEL_12:
    v12 = 0;
  }

  return v12;
}

- (id)__filteredPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream pendingPackets](self, "pendingPackets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("transactionIdentifier == %u"), v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "filteredOrderedSetUsingPredicate:", v5));

  return v6;
}

- (void)__addFragmentationPacket:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void **v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *, uint64_t, _BYTE *);
  void *v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream pendingPackets](self, "pendingPackets"));
  v8 = _NSConcreteStackBlock;
  v9 = 3221225472;
  v10 = sub_100008D94;
  v11 = &unk_100236AF8;
  v6 = v4;
  v12 = v6;
  v13 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", &v8);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream pendingPackets](self, "pendingPackets", v8, v9, v10, v11));
  objc_msgSend(v7, "insertObject:atIndex:", v6, v15[3]);

  _Block_object_dispose(&v14, 8);
}

- (void)__removeAllPendingPacketsWithTransactionIdentifier:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  id v7;

  v3 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream pendingPackets](self, "pendingPackets"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPFragmentationStream __filteredPacketsWithTransactionIdentifier:](self, "__filteredPacketsWithTransactionIdentifier:", v3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "array"));
  objc_msgSend(v7, "removeObjectsInArray:", v6);

}

- (HAPFragmentationStreamDelegate)delegate
{
  return (HAPFragmentationStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (NSMutableOrderedSet)pendingPackets
{
  return self->_pendingPackets;
}

- (NSNumber)currentPacketTransactionIdentifier
{
  return self->_currentPacketTransactionIdentifier;
}

- (void)setCurrentPacketTransactionIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentPacketTransactionIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingPackets, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
