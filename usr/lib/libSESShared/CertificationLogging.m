@implementation CertificationLogging

+ (id)getInstance
{
  objc_opt_self();
  if (getInstance_onceToken_1 != -1)
    dispatch_once(&getInstance_onceToken_1, &__block_literal_global_5);
  return (id)getInstance_instance_1;
}

void __35__CertificationLogging_getInstance__block_invoke()
{
  uint64_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  id v4;

  v4 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR(".GlobalPreferences"));
  if (objc_msgSend(v4, "BOOLForKey:", CFSTR("com.apple.CarKeysTests.enableCertificationLogging")))
  {
    v0 = objc_opt_new();
    v1 = (void *)getInstance_instance_1;
    getInstance_instance_1 = v0;

    v2 = os_log_create("com.apple.certification", "digitalCarKey");
    v3 = *(void **)(getInstance_instance_1 + 8);
    *(_QWORD *)(getInstance_instance_1 + 8) = v2;

  }
}

- (void)logEvent:(void *)a3 message:(void *)a4 peerUUID:
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD *v12;
  _QWORD *v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  id v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  id v32;
  _QWORD v33[4];
  id v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[4];
  _QWORD v40[4];
  _QWORD v41[4];
  _QWORD v42[4];
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  _QWORD v47[3];
  _QWORD v48[3];
  _QWORD v49[3];
  _QWORD v50[4];

  v50[3] = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (a1)
  {
    switch(a2)
    {
      case 0:
        if (v8)
        {
          v50[0] = CFSTR("event");
          v49[0] = CFSTR("log_type");
          v49[1] = CFSTR("vehicle_uuid");
          objc_msgSend(v8, "UUIDString");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v49[2] = CFSTR("payload");
          v50[1] = v10;
          v50[2] = CFSTR("connect");
          v11 = (void *)MEMORY[0x24BDBCE70];
          v12 = v50;
          v13 = v49;
          goto LABEL_9;
        }
        break;
      case 1:
        if (v8)
        {
          v48[0] = CFSTR("event");
          v47[0] = CFSTR("log_type");
          v47[1] = CFSTR("vehicle_uuid");
          objc_msgSend(v8, "UUIDString");
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v47[2] = CFSTR("payload");
          v48[1] = v10;
          v48[2] = CFSTR("disconnect");
          v11 = (void *)MEMORY[0x24BDBCE70];
          v12 = v48;
          v13 = v47;
LABEL_9:
          objc_msgSend(v11, "dictionaryWithObjects:forKeys:count:", v12, v13, 3);
          v14 = objc_claimAutoreleasedReturnValue();
          goto LABEL_23;
        }
        break;
      case 2:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v42[0] = CFSTR("dck_message");
              v41[0] = CFSTR("log_type");
              v41[1] = CFSTR("vehicle_uuid");
              objc_msgSend(v9, "UUIDString");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              v42[1] = v10;
              v42[2] = CFSTR("out");
              v41[2] = CFSTR("direction");
              v41[3] = CFSTR("payload");
              objc_msgSend(v7, "base64");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v42[3] = v18;
              v19 = (void *)MEMORY[0x24BDBCE70];
              v20 = v42;
              v21 = v41;
              goto LABEL_18;
            }
          }
          SESDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v44 = 2;
            v45 = 2112;
            v46 = v7;
            v15 = "Wrong payload for event type %lu %@";
            goto LABEL_47;
          }
          goto LABEL_49;
        }
        break;
      case 3:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v40[0] = CFSTR("dck_message");
              v39[0] = CFSTR("log_type");
              v39[1] = CFSTR("vehicle_uuid");
              objc_msgSend(v9, "UUIDString");
              v10 = (id)objc_claimAutoreleasedReturnValue();
              v40[1] = v10;
              v40[2] = CFSTR("in");
              v39[2] = CFSTR("direction");
              v39[3] = CFSTR("payload");
              objc_msgSend(v7, "base64");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v40[3] = v18;
              v19 = (void *)MEMORY[0x24BDBCE70];
              v20 = v40;
              v21 = v39;
LABEL_18:
              objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 4);
              v14 = objc_claimAutoreleasedReturnValue();

              goto LABEL_23;
            }
          }
          SESDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_49;
          *(_DWORD *)buf = 134218242;
          v44 = 3;
          v45 = 2112;
          v46 = v7;
          v15 = "Wrong payload for event type %lu %@";
          goto LABEL_47;
        }
        break;
      case 4:
        if (v8)
        {
          if (v7)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v22 = (void *)objc_msgSend(v7, "mutableCopy");
              v33[0] = MEMORY[0x24BDAC760];
              v33[1] = 3221225472;
              v33[2] = __50__CertificationLogging_logEvent_message_peerUUID___block_invoke;
              v33[3] = &unk_251CC6278;
              v34 = v22;
              v10 = v22;
              objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v33);
              v38[0] = CFSTR("rssi");
              v37[0] = CFSTR("log_type");
              v37[1] = CFSTR("vehicle_uuid");
              objc_msgSend(v9, "UUIDString");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v37[2] = CFSTR("payload");
              v38[1] = v23;
              v38[2] = v10;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
              v14 = objc_claimAutoreleasedReturnValue();

LABEL_23:
              goto LABEL_30;
            }
          }
          SESDefaultLogObject();
          v14 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            goto LABEL_49;
          *(_DWORD *)buf = 134218242;
          v44 = 4;
          v45 = 2112;
          v46 = v7;
          v15 = "Wrong payload for event type %lu %@";
LABEL_47:
          v16 = v14;
          v17 = 22;
          goto LABEL_48;
        }
        break;
      case 5:
        if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          SESDefaultLogObject();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218242;
            v44 = 5;
            v45 = 2112;
            v46 = v7;
            _os_log_impl(&dword_24B9C8000, v24, OS_LOG_TYPE_ERROR, "Wrong payload for event type %lu %@", buf, 0x16u);
          }

        }
        v35[0] = CFSTR("log_type");
        v35[1] = CFSTR("payload");
        v36[0] = CFSTR("dck_decrypted");
        v36[1] = v7;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
        v14 = objc_claimAutoreleasedReturnValue();
LABEL_30:
        if ((objc_msgSend(MEMORY[0x24BDD1608], "isValidJSONObject:", v14) & 1) != 0)
        {
          v32 = 0;
          objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v14, 0, &v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = v32;
          if (v26)
          {
            SESDefaultLogObject();
            v27 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v44 = (uint64_t)v14;
              v45 = 2112;
              v46 = v26;
              _os_log_impl(&dword_24B9C8000, v27, OS_LOG_TYPE_ERROR, "Failed to serialize object %@ %@", buf, 0x16u);
            }
          }
          else
          {
            v29 = *(NSObject **)(a1 + 8);
            if (!os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
LABEL_40:

              goto LABEL_49;
            }
            v30 = (objc_class *)MEMORY[0x24BDD17C8];
            v27 = v29;
            v31 = (void *)objc_msgSend([v30 alloc], "initWithData:encoding:", v25, 4);
            *(_DWORD *)buf = 138412290;
            v44 = (uint64_t)v31;
            _os_log_impl(&dword_24B9C8000, v27, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);

          }
          goto LABEL_40;
        }
        SESDefaultLogObject();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v44 = (uint64_t)v14;
          _os_log_impl(&dword_24B9C8000, v28, OS_LOG_TYPE_ERROR, "Invalid JSON object %@", buf, 0xCu);
        }

LABEL_49:
        break;
      default:
        SESDefaultLogObject();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 134217984;
          v44 = a2;
          v15 = "Unknown event type %lu";
          v16 = v14;
          v17 = 12;
LABEL_48:
          _os_log_impl(&dword_24B9C8000, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
        }
        goto LABEL_49;
    }
  }

}

void __50__CertificationLogging_logEvent_message_peerUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "base64");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v7 = (void *)v6;
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v8);

    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v5, "UUIDString");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
LABEL_6:

}

+ (void)bleLogVehicleConnected:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CertificationLogging getInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v4, 0, 0, v3);

}

+ (void)bleLogVehicleDisconnected:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[CertificationLogging getInstance]();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v4, 1, 0, v3);

}

+ (void)bleLogMessageSent:(id)a3 peerUUID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CertificationLogging getInstance]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 2, v6, v5);

}

+ (void)bleLogMessageReceived:(id)a3 peerUUID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CertificationLogging getInstance]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 3, v6, v5);

}

+ (void)bleLogRSSI:(id)a3 peerUUID:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v6 = a3;
  +[CertificationLogging getInstance]();
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 4, v6, v5);

}

+ (void)logEncryptedAPDU:(id)a3 decrypted:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "length") && objc_msgSend(v5, "length"))
  {
    +[CertificationLogging getInstance]();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = CFSTR("raw_payload");
    objc_msgSend(v5, "base64");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = CFSTR("decrypted_payload");
    v12[0] = v8;
    objc_msgSend(v6, "base64");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CertificationLogging logEvent:message:peerUUID:]((uint64_t)v7, 5, v10, 0);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
}

@end
