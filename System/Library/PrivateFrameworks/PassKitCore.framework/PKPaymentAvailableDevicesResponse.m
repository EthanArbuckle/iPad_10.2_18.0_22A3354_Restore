@implementation PKPaymentAvailableDevicesResponse

- (PKPaymentAvailableDevicesResponse)initWithData:(id)a3
{
  PKPaymentAvailableDevicesResponse *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PKPaymentAvailableDevicesResponseCardItem *v14;
  void *v15;
  uint64_t v16;
  NSDictionary *devices;
  void *v19;
  PKPaymentAvailableDevicesResponse *v20;
  id obj;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  objc_super v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v32.receiver = self;
  v32.super_class = (Class)PKPaymentAvailableDevicesResponse;
  v3 = -[PKWebServiceResponse initWithData:](&v32, sel_initWithData_, a3);
  if (v3)
  {
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v20 = v3;
    -[PKWebServiceResponse JSONObject](v3, "JSONObject");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("paymentDevices"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    if (v4)
    {
      v5 = v4;
      v22 = *(_QWORD *)v29;
      do
      {
        v6 = 0;
        do
        {
          if (*(_QWORD *)v29 != v22)
            objc_enumerationMutation(obj);
          v7 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v6);
          v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v24 = 0u;
          v25 = 0u;
          v26 = 0u;
          v27 = 0u;
          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("cards"));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
          if (v10)
          {
            v11 = v10;
            v12 = *(_QWORD *)v25;
            do
            {
              v13 = 0;
              do
              {
                if (*(_QWORD *)v25 != v12)
                  objc_enumerationMutation(v9);
                v14 = -[PKPaymentAvailableDevicesResponseCardItem initWithDictionary:]([PKPaymentAvailableDevicesResponseCardItem alloc], "initWithDictionary:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13));
                objc_msgSend(v8, "safelyAddObject:", v14);

                ++v13;
              }
              while (v11 != v13);
              v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
            }
            while (v11);
          }

          objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("deviceSerialNumber"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "setObject:forKey:", v8, v15);

          ++v6;
        }
        while (v6 != v5);
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
      }
      while (v5);
    }

    v16 = objc_msgSend(v23, "copy");
    v3 = v20;
    devices = v20->_devices;
    v20->_devices = (NSDictionary *)v16;

  }
  return v3;
}

- (NSDictionary)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_devices, 0);
}

@end
