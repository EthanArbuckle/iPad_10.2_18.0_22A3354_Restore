@implementation HAPBTLEControlOutputStream

- (HAPBTLEControlOutputStream)init
{
  NSString *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ is unavailable"), v3));
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v4, 0));

  objc_exception_throw(v5);
}

- (HAPBTLEControlOutputStream)initWithControlType:(unsigned __int8)a3 transactionIdentifier:(id)a4 controlPayload:(id)a5 mtuLength:(unint64_t)a6 timeoutInterval:(double)a7
{
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  HAPBTLEControlOutputStream *v18;
  HAPBTLEControlOutputStream *v19;
  const char *v20;
  dispatch_queue_attr_t v21;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *clientQueue;
  NSData *v25;
  NSData *payload;
  NSOperationQueue *v27;
  NSString *v28;
  void *v29;
  NSOperationQueue *operationQueue;
  HAPBTLEControlOutputStream *v31;
  id v32;
  NSObject *v33;
  __CFString *v34;
  void *v35;
  void *v36;
  const char *v37;
  id v38;
  id v39;
  __CFString *v40;
  id v41;
  __CFString *v42;
  objc_super v44;
  uint8_t buf[4];
  void *v46;
  __int16 v47;
  void *v48;

  v13 = a4;
  v14 = a5;
  v16 = v14;
  if (!v13)
  {
    v32 = sub_10007CCE4(0, v15);
    v33 = objc_claimAutoreleasedReturnValue(v32);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    goto LABEL_9;
  }
  if (!objc_msgSend(v14, "length"))
  {
    v38 = sub_10007CCE4(0, v17);
    v33 = objc_claimAutoreleasedReturnValue(v38);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
LABEL_9:
    v34 = sub_10007CD2C(0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription"));
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    v47 = 2112;
    v48 = v36;
    v37 = "%{public}@[%@] Invalid control payload data.";
    goto LABEL_16;
  }
  if (!a6)
  {
    v39 = sub_10007CCE4(0, v17);
    v33 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      goto LABEL_17;
    v40 = sub_10007CD2C(0);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v40);
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription"));
    *(_DWORD *)buf = 138543618;
    v46 = v35;
    v47 = 2112;
    v48 = v36;
    v37 = "%{public}@[%@] Invalid MTU length.";
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, v37, buf, 0x16u);

    goto LABEL_17;
  }
  if (a7 <= 0.0)
  {
    v41 = sub_10007CCE4(0, v17);
    v33 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v42 = sub_10007CD2C(0);
      v35 = (void *)objc_claimAutoreleasedReturnValue(v42);
      v36 = (void *)objc_claimAutoreleasedReturnValue(+[HAPBTLEControlOutputStream shortDescription](HAPBTLEControlOutputStream, "shortDescription"));
      *(_DWORD *)buf = 138543618;
      v46 = v35;
      v47 = 2112;
      v48 = v36;
      v37 = "%{public}@[%@] Invalid timeout for write.";
      goto LABEL_16;
    }
LABEL_17:

    v31 = 0;
    goto LABEL_18;
  }
  v44.receiver = self;
  v44.super_class = (Class)HAPBTLEControlOutputStream;
  v18 = -[HAPBTLEControlOutputStream init](&v44, "init");
  v19 = v18;
  if (v18)
  {
    v20 = (const char *)sub_100015E90(v18, 0);
    v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    v23 = dispatch_queue_create(v20, v22);
    clientQueue = v19->_clientQueue;
    v19->_clientQueue = (OS_dispatch_queue *)v23;

    v19->_type = a3;
    objc_storeStrong((id *)&v19->_transactionIdentifier, a4);
    v25 = (NSData *)objc_msgSend(v16, "copy");
    payload = v19->_payload;
    v19->_payload = v25;

    v19->_mtuLength = a6;
    v19->_timeoutInterval = a7;
    v27 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v28 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), sub_100015E90(v19, CFSTR("operationQueue")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    -[NSOperationQueue setName:](v27, "setName:", v29);

    -[NSOperationQueue setMaxConcurrentOperationCount:](v27, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue setQualityOfService:](v27, "setQualityOfService:", 25);
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = v27;

  }
  self = v19;
  v31 = self;
LABEL_18:

  return v31;
}

+ (id)shortDescription
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(a1, a2);
  return NSStringFromClass(v2);
}

- (id)shortDescription
{
  return objc_msgSend((id)objc_opt_class(self, a2), "shortDescription");
}

- (id)descriptionWithPointer:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  __CFString *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream shortDescription](self, "shortDescription"));
  if (v3)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(" %p"), self));
  else
    v6 = &stru_10023F210;
  v7 = sub_1000242BC(-[HAPBTLEControlOutputStream type](self, "type"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream transactionIdentifier](self, "transactionIdentifier"));
  v10 = objc_msgSend(v9, "unsignedCharValue");
  v11 = HMFBooleanToString(-[HAPBTLEControlOutputStream isComplete](self, "isComplete"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream payload](self, "payload"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@%@, Type = %@, Transaction Identifier = 0x%02x, Completed = %@, Payload Length = %tu, Remaining Payload Length = %tu>"), v5, v6, v8, v10, v12, objc_msgSend(v13, "length"), -[HAPBTLEControlOutputStream remainingControlPayloadLength](self, "remainingControlPayloadLength")));

  if (v3)
  return v14;
}

- (id)debugDescription
{
  return -[HAPBTLEControlOutputStream descriptionWithPointer:](self, "descriptionWithPointer:", 1);
}

- (id)description
{
  return -[HAPBTLEControlOutputStream descriptionWithPointer:](self, "descriptionWithPointer:", 0);
}

- (unint64_t)remainingControlPayloadLength
{
  void *v3;
  _BYTE *v4;
  unint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream payload](self, "payload"));
  v4 = objc_msgSend(v3, "length");
  v5 = v4 - (_BYTE *)-[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");

  return v5;
}

- (void)open
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000437C4;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)close
{
  NSObject *v3;
  _QWORD block[5];

  v3 = objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream clientQueue](self, "clientQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100043890;
  block[3] = &unk_100236AA8;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)_closeWithError:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if (-[HAPBTLEControlOutputStream isOpen](self, "isOpen"))
  {
    -[HAPBTLEControlOutputStream setOpen:](self, "setOpen:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream delegate](self, "delegate"));
    objc_msgSend(v4, "controlOutputStream:didCloseWithError:", self, v5);

  }
}

- (void)_complete
{
  id v3;

  if (!-[HAPBTLEControlOutputStream isComplete](self, "isComplete"))
  {
    -[HAPBTLEControlOutputStream setComplete:](self, "setComplete:", 1);
    v3 = (id)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream delegate](self, "delegate"));
    objc_msgSend(v3, "controlOutputStreamDidComplete:", self);

  }
}

- (void)sendNextPayloadFragment
{
  id v3;
  id v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  _QWORD v8[5];
  id v9;
  id location;

  v3 = objc_alloc((Class)HMFBlockOperation);
  -[HAPBTLEControlOutputStream timeoutInterval](self, "timeoutInterval");
  v4 = objc_msgSend(v3, "initWithTimeout:");
  objc_initWeak(&location, v4);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100043AC4;
  v8[3] = &unk_100237178;
  objc_copyWeak(&v9, &location);
  v8[4] = self;
  objc_msgSend(v4, "addExecutionBlock:", v8);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100043B68;
  v6[3] = &unk_100237178;
  objc_copyWeak(&v7, &location);
  v6[4] = self;
  objc_msgSend(v4, "setCompletionBlock:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream operationQueue](self, "operationQueue"));
  objc_msgSend(v5, "addOperation:", v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

}

- (void)_sendNextPayloadFragmentWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream clientQueue](self, "clientQueue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100043D44;
  v7[3] = &unk_1002369C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)_nextPacketWithMaximumLength:(unint64_t)a3 error:(id *)a4
{
  uint64_t v7;
  id v8;
  NSObject *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  _BOOL8 v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  HAPBTLEControlPacket *v19;
  uint64_t v20;
  void *v21;
  HAPBTLEControlPacket *v22;
  uint64_t v23;
  unint64_t v24;
  void *v25;
  HAPBTLEControlPacket *v26;
  id v27;
  NSObject *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  __int16 v34;
  void *v35;

  if (-[HAPBTLEControlOutputStream isComplete](self, "isComplete"))
  {
    v8 = sub_10007CCE4(0, v7);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = sub_10007CD2C(0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream shortDescription](self, "shortDescription"));
      v32 = 138543618;
      v33 = v11;
      v34 = 2112;
      v35 = v12;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@[%@] The control output stream is complete", (uint8_t *)&v32, 0x16u);

    }
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Invalid operation."), CFSTR("The control output stream is complete"), 0, 0));
    return 0;
  }
  else
  {
    v14 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength") != 0;
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream payload](self, "payload"));
    v16 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream payload](self, "payload"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subdataWithRange:", v16, (_BYTE *)objc_msgSend(v17, "length")- (_BYTE *)-[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength")));

    v19 = [HAPBTLEControlPacket alloc];
    v20 = -[HAPBTLEControlOutputStream type](self, "type");
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream transactionIdentifier](self, "transactionIdentifier"));
    v22 = -[HAPBTLEControlPacket initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:](v19, "initWithControlType:transactionIdentifier:continuationPacket:packetPayload:maximumLength:", v20, v21, v14, v18, a3);

    if (v22)
    {
      v24 = -[HAPBTLEControlOutputStream controlPayloadWrittenLength](self, "controlPayloadWrittenLength");
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlPacket payload](v22, "payload"));
      -[HAPBTLEControlOutputStream setControlPayloadWrittenLength:](self, "setControlPayloadWrittenLength:", (char *)objc_msgSend(v25, "length") + v24);

      v26 = v22;
    }
    else
    {
      v27 = sub_10007CCE4(0, v23);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v29 = sub_10007CD2C(0);
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[HAPBTLEControlOutputStream shortDescription](self, "shortDescription"));
        v32 = 138543618;
        v33 = v30;
        v34 = 2112;
        v35 = v31;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%{public}@[%@] Failed to create control packet", (uint8_t *)&v32, 0x16u);

      }
      if (a4)
        *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError hapErrorWithcode:description:reason:suggestion:underlyingError:](NSError, "hapErrorWithcode:description:reason:suggestion:underlyingError:", 1, CFSTR("Failed to create control packet."), 0, 0, 0));
    }

    return v22;
  }
}

- (HAPBTLEControlOutputStreamDelegate)delegate
{
  return (HAPBTLEControlOutputStreamDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unsigned)type
{
  return self->_type;
}

- (HAPBTLETransactionIdentifier)transactionIdentifier
{
  return self->_transactionIdentifier;
}

- (NSData)payload
{
  return self->_payload;
}

- (unint64_t)mtuLength
{
  return self->_mtuLength;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (unint64_t)controlPayloadWrittenLength
{
  return self->_controlPayloadWrittenLength;
}

- (void)setControlPayloadWrittenLength:(unint64_t)a3
{
  self->_controlPayloadWrittenLength = a3;
}

- (NSOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_payload, 0);
  objc_storeStrong((id *)&self->_transactionIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id)completionHandler
{
  return objc_getAssociatedObject(self, "completionHandler");
}

- (void)setCompletionHandler:(id)a3
{
  id v4;

  v4 = objc_retainBlock(a3);
  objc_setAssociatedObject(self, "completionHandler", v4, (void *)3);

}

@end
