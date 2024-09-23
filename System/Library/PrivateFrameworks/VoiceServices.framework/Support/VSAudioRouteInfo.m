@implementation VSAudioRouteInfo

- (VSAudioRouteInfo)initWithRouteAttributes:(id)a3
{
  id v5;
  VSAudioRouteInfo *v6;
  VSAudioRouteInfo *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VSAudioRouteInfo;
  v6 = -[VSAudioRouteInfo init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_routeInfo, a3);

  return v7;
}

- (id)audioRouteName
{
  return -[NSDictionary objectForKeyedSubscript:](self->_routeInfo, "objectForKeyedSubscript:", *MEMORY[0x24BE648C0]);
}

- (BOOL)isBluetoothRoute
{
  void *v2;
  void *v3;
  char v4;

  -[NSDictionary objectForKeyedSubscript:](self->_routeInfo, "objectForKeyedSubscript:", *MEMORY[0x24BE648D0]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)isAppleProduct
{
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("hdft"), CFSTR("Hdft"), CFSTR("usbD"), CFSTR("hx90"), CFSTR("wx90"), CFSTR("rhac"), CFSTR("wdef"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_routeInfo, "objectForKeyedSubscript:", *MEMORY[0x24BE648E8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = objc_msgSend(v3, "containsObject:", v4) ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (NSDictionary)routeInfo
{
  return self->_routeInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routeInfo, 0);
}

@end
