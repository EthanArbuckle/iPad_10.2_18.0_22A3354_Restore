@implementation PDRConnectivityStatus

+ (unint64_t)currentConnectivity
{
  return objc_msgSend((id)objc_opt_class(), "currentConnectivity");
}

+ (BOOL)isConnected:(unint64_t)a3
{
  return a3 >> 63;
}

+ (unint64_t)dropoutCount:(unint64_t)a3
{
  return a3 & 0x7FFFFFFFFFFFFFFFLL;
}

+ (BOOL)getDropoutCounter:(unint64_t *)a3
{
  unint64_t v4;

  v4 = objc_msgSend((id)objc_opt_class(), "currentConnectivity");
  if (a3)
    *a3 = v4 & 0x7FFFFFFFFFFFFFFFLL;
  return v4 >> 63;
}

@end
