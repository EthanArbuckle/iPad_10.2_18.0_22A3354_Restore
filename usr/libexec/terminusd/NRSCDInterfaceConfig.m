@implementation NRSCDInterfaceConfig

- (id)description
{
  id v3;
  NSString *interfaceName;
  uint64_t interfaceIndex;
  NSMutableArray *v6;
  id v7;
  const char *v8;

  v3 = objc_msgSend(objc_alloc((Class)NSMutableString), "initWithString:", CFSTR("NRSCDInterfaceConfig["));
  interfaceName = self->_interfaceName;
  interfaceIndex = self->_interfaceIndex;
  if (!(_DWORD)interfaceIndex || !self->_isLinkActive)
    goto LABEL_7;
  v6 = self->_ipv4Addresses;
  if (!-[NSMutableArray count](v6, "count"))
  {
    v7 = -[NSMutableArray count](self->_ipv6Addresses, "count");

    if (v7)
      goto LABEL_6;
LABEL_7:
    v8 = "!";
    goto LABEL_8;
  }

LABEL_6:
  v8 = "";
LABEL_8:
  objc_msgSend(v3, "appendFormat:", CFSTR("%@(%u), %savailable, v4:[%@], v6:[%@]"), interfaceName, interfaceIndex, v8, self->_ipv4Addresses, self->_ipv6Addresses);
  objc_msgSend(v3, "appendString:", CFSTR("]"));
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_peerEndpointDictionary, 0);
  objc_storeStrong((id *)&self->_ipv6Addresses, 0);
  objc_storeStrong((id *)&self->_ipv4Addresses, 0);
  objc_storeStrong((id *)&self->_scdKeyLink, 0);
  objc_storeStrong((id *)&self->_scdKeyIPv6, 0);
  objc_storeStrong((id *)&self->_scdKeyIPv4, 0);
  objc_storeStrong((id *)&self->_interfaceName, 0);
}

@end
