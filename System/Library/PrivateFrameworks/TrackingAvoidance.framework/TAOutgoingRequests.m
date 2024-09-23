@implementation TAOutgoingRequests

- (TAOutgoingRequests)initWithRequestKey:(id)a3 additionalInformation:(id)a4 date:(id)a5
{
  id v8;
  id v9;
  id v10;
  TAOutgoingRequests *v11;
  TAOutgoingRequests *v12;
  uint64_t v13;
  NSString *key;
  uint64_t v15;
  NSDictionary *additionalInformation;
  uint64_t v17;
  NSDate *date;
  objc_super v20;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)TAOutgoingRequests;
  v11 = -[TAOutgoingRequests init](&v20, sel_init);
  if (!v11)
  {
LABEL_8:
    v12 = v11;
    goto LABEL_9;
  }
  v12 = 0;
  if (v8 && v10)
  {
    v13 = objc_msgSend(v8, "copy");
    key = v11->_key;
    v11->_key = (NSString *)v13;

    if (v9)
    {
      v15 = objc_msgSend(v9, "copy");
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
      v15 = objc_claimAutoreleasedReturnValue();
    }
    additionalInformation = v11->_additionalInformation;
    v11->_additionalInformation = (NSDictionary *)v15;

    v17 = objc_msgSend(v10, "copy");
    date = v11->_date;
    v11->_date = (NSDate *)v17;

    goto LABEL_8;
  }
LABEL_9:

  return v12;
}

- (id)descriptionDictionary
{
  NSDictionary *additionalInformation;
  NSString *key;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x24BDAC8D0];
  key = self->_key;
  additionalInformation = self->_additionalInformation;
  v10[0] = key;
  v9[0] = CFSTR("Key");
  v9[1] = CFSTR("AdditionalInformation");
  -[NSDictionary description](additionalInformation, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v5;
  v9[2] = CFSTR("Date");
  -[NSDate getDateString](self->_date, "getDateString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)description
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v10;

  -[TAOutgoingRequests descriptionDictionary](self, "descriptionDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  objc_msgSend(MEMORY[0x24BDD1608], "JSONStringFromNSDictionary:error:", v3, &v10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v10;
  if (v5)
  {
    v6 = (void *)TAStatusLog;
    if (os_log_type_enabled((os_log_t)TAStatusLog, OS_LOG_TYPE_ERROR))
      -[TAOutgoingRequests description].cold.1(v6, (uint64_t)self, (uint64_t)v5);
    objc_msgSend(MEMORY[0x24BDD17C8], "string");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = v4;
  }
  v8 = v7;

  return v8;
}

- (NSString)key
{
  return self->_key;
}

- (NSDictionary)additionalInformation
{
  return self->_additionalInformation;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_additionalInformation, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

- (void)description
{
  NSObject *v4;
  objc_class *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v6;
  v9 = 2112;
  v10 = a3;
  _os_log_error_impl(&dword_217877000, v4, OS_LOG_TYPE_ERROR, "%@ instance failed to create description:%@", (uint8_t *)&v7, 0x16u);

}

@end
