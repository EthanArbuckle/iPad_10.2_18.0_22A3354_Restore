@implementation PLBatteryUIResponseTypeLastChargeLevel

- (id)dependencies
{
  return 0;
}

- (void)configure:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("lastChargingValue"), CFSTR("com.apple.powerlogd"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeLastChargeLevel setLastChargeValue:](self, "setLastChargeValue:", v4);

  objc_msgSend(MEMORY[0x1E0D7FFA0], "objectForKey:forApplicationID:synchronize:", CFSTR("lastChargingTimestamp"), CFSTR("com.apple.powerlogd"), 1);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[PLBatteryUIResponseTypeLastChargeLevel setLastChargeTimestamp:](self, "setLastChargeTimestamp:", v5);

}

- (void)run
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "lastChargeTimestamp");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "lastChargeValue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  v8 = 2112;
  v9 = v5;
  _os_log_error_impl(&dword_1DA9D6000, a2, OS_LOG_TYPE_ERROR, "Missing last charge info: %@ - %@%%", (uint8_t *)&v6, 0x16u);

}

- (PLBatteryUIResponderService)responderService
{
  return (PLBatteryUIResponderService *)objc_getProperty(self, a2, 8, 1);
}

- (void)setResponderService:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSNumber)lastChargeValue
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLastChargeValue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSNumber)lastChargeTimestamp
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (void)setLastChargeTimestamp:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSDictionary)resultDictionary
{
  return (NSDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setResultDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resultDictionary, 0);
  objc_storeStrong((id *)&self->_lastChargeTimestamp, 0);
  objc_storeStrong((id *)&self->_lastChargeValue, 0);
  objc_storeStrong((id *)&self->_responderService, 0);
}

@end
