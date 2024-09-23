@implementation APSigningQueue

- (APSigningQueue)init
{
  APSigningQueue *v2;
  APQueue *v3;
  APQueue *queue;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APSigningQueue;
  v2 = -[APSigningQueue init](&v6, "init");
  if (v2)
  {
    v3 = objc_alloc_init(APQueue);
    queue = v2->_queue;
    v2->_queue = v3;

  }
  return v2;
}

- (void)processWithFPDISigningAuthorityPoolManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  id v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  NSObject *v34;
  char *v35;
  os_signpost_id_t v36;
  const char *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  APSigningQueue *v48;
  uint64_t v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  _QWORD v54[3];
  _QWORD v55[3];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  __CFString *v59;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APSigningQueue queue](self, "queue"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "dequeue"));

  if (v6)
  {
    v7 = (char *)&unk_10025C000;
    v48 = self;
    v50 = v4;
    do
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsonBody"));
      v53 = 0;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "signatureForData:error:", v8, &v53));
      v10 = v53;

      v11 = APLogForCategory(4);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      v13 = v12;
      v51 = v10;
      v52 = v9;
      if (v10)
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v57 = (const char *)v10;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Signing: Processing queue with FPDI but signing failed: %{public}@. Fallback to Mescal.", buf, 0xCu);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestTimestamp"));
        v16 = objc_msgSend(v6, "intervalId");
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "jsonBody"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deliveryStartDate"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
        LOBYTE(v47) = 1;
        +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v14, v15, v16, v17, v18, v19, v47, v20);
      }
      else
      {
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Signing: Signing item using FPDI.", buf, 2u);
        }

        v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "base64EncodedStringWithOptions:", 32));
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestTimestamp"));
        objc_msgSend(v21, "timeIntervalSinceDate:", _daemonStartTime);
        v23 = v22;

        v24 = objc_msgSend(v7 + 3904, "findBucketForDaemonRunningTime:", v23);
        v25 = objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
        v17 = CFSTR("NONE");
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
        v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "storefront"));

        if (v27)
        {
          v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "storefront"));
          v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7 + 3904, "storefrontCountryOnly:", v29));

          v17 = (__CFString *)v30;
        }
        else
        {
          v31 = APLogForCategory(4);
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136642819;
            v57 = "-[APSigningQueue processWithFPDISigningAuthorityPoolManager:]";
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "%{sensitive}s, Storefront is nil", buf, 0xCu);
          }

          CreateDiagnosticReport(CFSTR("Sign Payload for Attribution: Error Storefront is nil"), 0, CFSTR("Attributtion"));
        }
        v33 = APPerfLogForCategory(4);
        v34 = objc_claimAutoreleasedReturnValue(v33);
        v35 = (char *)objc_msgSend(v6, "intervalId");
        if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v36 = (os_signpost_id_t)v35;
          if (os_signpost_enabled(v34))
          {
            v37 = (const char *)objc_msgSend(v6, "intervalId");
            *(_DWORD *)buf = 134349314;
            v57 = v37;
            v58 = 2114;
            v59 = v17;
            _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v34, OS_SIGNPOST_INTERVAL_END, v36, "Payload Signing", "id=%{public, name=id}lld storefront=%{public, name=storefront}@", buf, 0x16u);
          }
        }

        v54[0] = CFSTR("daemonRunningTime");
        v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v24));
        v55[0] = v38;
        v55[1] = v17;
        v54[1] = CFSTR("storeFront");
        v54[2] = CFSTR("signingType");
        v55[2] = &off_100228DA8;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v55, v54, 3));

        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startDate"));
        objc_msgSend(v7 + 3904, "sendTimingAnalytics:startDate:endDate:additionalFields:", CFSTR("payloadSigningTime"), v39, v25, v18);

        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
        v14 = (void *)v49;
        objc_msgSend(v40, "setFpdiSignature:", v49);

        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "request"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestTimestamp"));
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "deliveryStartDate"));
        v42 = objc_msgSend(v6, "intervalId");
        v43 = (void *)v25;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handler"));
        +[APAttributionServer _serverPost:requestTimestamp:payloadDeliveryStartDate:interval:completionHandler:](APAttributionServer, "_serverPost:requestTimestamp:payloadDeliveryStartDate:interval:completionHandler:", v19, v20, v41, v42, v44);

        v15 = v43;
        self = v48;
      }
      v4 = v50;

      v45 = (void *)objc_claimAutoreleasedReturnValue(-[APSigningQueue queue](self, "queue"));
      v46 = objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "dequeue"));

      v6 = (void *)v46;
      v7 = (_BYTE *)&unk_10025C000;
    }
    while (v46);
  }

}

- (void)processWithMescal
{
  void *v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint8_t buf[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[APSigningQueue queue](self, "queue"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dequeue"));

  if (v4)
  {
    do
    {
      v5 = APLogForCategory(4);
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Signing: Signing item using Mescal.", buf, 2u);
      }

      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "request"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "requestTimestamp"));
      v9 = objc_msgSend(v4, "intervalId");
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "jsonBody"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "startDate"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deliveryStartDate"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handler"));
      LOBYTE(v16) = 1;
      +[APAttributionServer signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:](APAttributionServer, "signPayloadWithMescal:requestTimestamp:interval:jsonBody:startDate:deliveryStartDate:isFallback:completionHandler:", v7, v8, v9, v10, v11, v12, v16, v13);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[APSigningQueue queue](self, "queue"));
      v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "dequeue"));

      v4 = (void *)v15;
    }
    while (v15);
  }
}

- (void)add:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[APSigningQueue queue](self, "queue"));
  objc_msgSend(v5, "enqueue:", v4);

}

- (APQueue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
