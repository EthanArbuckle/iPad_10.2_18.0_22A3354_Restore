@implementation NSString(ThreeBars)

- (id)reformatBSSID
{
  id v1;
  id v2;
  ether_addr *v3;
  void *v4;

  v1 = a1;
  if (v1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v2 = objc_retainAutorelease(v1), objc_msgSend(v2, "UTF8String"))
    && (v3 = ether_aton((const char *)objc_msgSend(objc_retainAutorelease(v2), "UTF8String"))) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02x:%02x:%02x:%02x:%02x:%02x"), v3->octet[0], v3->octet[1], v3->octet[2], v3->octet[3], v3->octet[4], v3->octet[5]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end
