@implementation SecureElement

- (id)transceive:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  _QWORD v8[4];
  SecureElement *v9;
  id v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10004F568;
  v23 = sub_10004F578;
  v24 = 0;
  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_10004F568;
  v17 = sub_10004F578;
  v18 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10004F580;
  v8[3] = &unk_100304C10;
  v11 = &v19;
  v9 = self;
  v5 = a3;
  v10 = v5;
  v12 = &v13;
  -[SecureElement sync:](v9, "sync:", v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v14[5]);
  v6 = (id)v20[5];

  _Block_object_dispose(&v13, 8);
  _Block_object_dispose(&v19, 8);

  return v6;
}

- (void)log:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  id v8;

  v3 = a3;
  v5 = SESDefaultLogObject(v3, v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = 138412290;
    v8 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[SLAM] %@", (uint8_t *)&v7, 0xCu);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_info, 0);
  objc_storeStrong((id *)&self->_transceiver, 0);
  objc_storeStrong((id *)&self->_currentSelectedAIDRapdu, 0);
  objc_storeStrong((id *)&self->_currentSelectedAID, 0);
}

- (BOOL)getStatusModulesWithFilterAID:(id)a3 tags:(id)a4 error:(id *)a5 closure:(id)a6
{
  void *v9;
  id v10;
  SecureElement *v11;
  id v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[6];

  v9 = _Block_copy(a6);
  v10 = a4;
  v11 = self;
  if (a3)
  {
    v12 = a3;
    a3 = (id)static Data._unconditionallyBridgeFromObjectiveC(_:)(a3);
    v14 = v13;

  }
  else
  {
    v14 = 0xF000000000000000;
  }
  v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)(a4, &type metadata for UInt8);

  __chkstk_darwin(v16, v17);
  v19[2] = v9;
  sub_100071864((uint64_t)a3, v14, v15, (uint64_t)sub_100071BB8, (uint64_t)v19);

  _Block_release(v9);
  swift_bridgeObjectRelease(v15);
  sub_10006B9B4((uint64_t)a3, v14);
  return 1;
}

+ (void)setQueueKey:(id)a3
{
  uint64_t v3;
  id v4;
  char v5[16];

  v3 = qword_1003447A8;
  v4 = a3;
  if (v3 != -1)
    swift_once(&qword_1003447A8, sub_1001EEDF8);
  strcpy(v5, "ERUCESOS");
  OS_dispatch_queue.setSpecific<A>(key:value:)(qword_10034A718, v5);

}

- (void)sync:(id)a3
{
  void *v4;
  SecureElement *v5;

  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1001EEE38((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);

}

@end
