@implementation TRMessageDecoder

+ (id)decodeMessage:(id)a3 error:(id *)a4
{
  objc_class *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  _QWORD v29[2];
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v5 = (objc_class *)MEMORY[0x24BDD1620];
  v6 = a3;
  v7 = (void *)objc_msgSend([v5 alloc], "initForReadingFromData:error:", v6, 0);

  objc_msgSend(v7, "decodeTopLevelObjectOfClass:forKey:error:", objc_opt_class(), *MEMORY[0x24BDD0E88], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finishDecoding");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v9 = v8;
  }
  else
  {
    if (a4)
    {
      v10 = *MEMORY[0x24BDD0FC8];
      v30[0] = CFSTR("Message decoding failed.");
      v11 = *MEMORY[0x24BDD0FD8];
      v29[0] = v10;
      v29[1] = v11;
      v12 = (void *)MEMORY[0x24BDD17C8];
      v13 = (objc_class *)objc_opt_class();
      NSStringFromClass(v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (objc_class *)objc_opt_class();
      NSStringFromClass(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stringWithFormat:", CFSTR("Decoded class is not a subclass of %@: %@."), v14, v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v17;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("TRNearbyDeviceErrorDomain"), -9200, v18);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    else if (_TRLogEnabled == 1)
    {
      TRLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315650;
        v24 = "+[TRMessageDecoder decodeMessage:error:]";
        v25 = 2112;
        v26 = v21;
        v27 = 2112;
        v28 = v8;
        _os_log_impl(&dword_20A2BF000, v19, OS_LOG_TYPE_DEFAULT, "%s Decoded something other than a subclass of %@: %@", buf, 0x20u);

      }
    }
    v9 = 0;
  }

  return v9;
}

@end
