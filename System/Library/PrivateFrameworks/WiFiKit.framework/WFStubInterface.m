@implementation WFStubInterface

- (id)interfaceName
{
  return CFSTR("en0");
}

- (void)setCurrentNetwork:(id)a3
{
  id v5;
  WFNetworkScanRecord **p_currentNetwork;
  WFNetworkScanRecord *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  p_currentNetwork = &self->_currentNetwork;
  if ((objc_msgSend(v5, "isEqual:", self->_currentNetwork) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentNetwork, a3);
    v7 = *p_currentNetwork;
    if (*p_currentNetwork)
    {
      v10 = CFSTR("WFInterfaceNetworkKey");
      v11[0] = v7;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "postNotificationName:object:userInfo:", CFSTR("WFInterfaceNetworkChangedNotification"), self, v8);

  }
}

- (id)currentNetwork
{
  return self->_currentNetwork;
}

- (BOOL)currentNetworkIsDirected
{
  return self->_currentNetworkIsDirected;
}

- (void)setCurrentNetworkIsDirected:(BOOL)a3
{
  self->_currentNetworkIsDirected = a3;
}

- (BOOL)ipv4SelfAssigned
{
  return self->_ipv4SelfAssigned;
}

- (void)setIpv4SelfAssigned:(BOOL)a3
{
  self->_ipv4SelfAssigned = a3;
}

- (BOOL)hasNoGatewayIP
{
  return self->_hasNoGatewayIP;
}

- (void)setHasNoGatewayIP:(BOOL)a3
{
  self->_hasNoGatewayIP = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentNetwork, 0);
}

@end
