@implementation NSData

- (id)describeAddr
{
  void *v3;
  int v4;
  _QWORD v6[2];
  int v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = -[NSData length](self, "length");
  if (v3)
  {
    v6[0] = 0;
    v6[1] = 0;
    v7 = 0;
    v4 = _unicast_assist_data_to_addr(self, (int *)v6);
    v3 = 0;
    if (!v4)
    {
      v9 = 0;
      memset(v8, 0, sizeof(v8));
      mDNS_snprintf(v8);
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%s"), v8));
    }
  }
  return v3;
}

@end
