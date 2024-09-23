@implementation RWIProtocolNetworkResourceTiming

- (RWIProtocolNetworkResourceTiming)initWithStartTime:(double)a3 redirectStart:(double)a4 redirectEnd:(double)a5 fetchStart:(double)a6 domainLookupStart:(double)a7 domainLookupEnd:(double)a8 connectStart:(double)a9 connectEnd:(double)a10 secureConnectionStart:(double)a11 requestStart:(double)a12 responseStart:(double)a13 responseEnd:(double)a14
{
  RWIProtocolNetworkResourceTiming *v22;
  RWIProtocolNetworkResourceTiming *v23;
  RWIProtocolNetworkResourceTiming *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)RWIProtocolNetworkResourceTiming;
  v22 = -[RWIProtocolJSONObject init](&v26, sel_init);
  v23 = v22;
  if (v22)
  {
    -[RWIProtocolNetworkResourceTiming setStartTime:](v22, "setStartTime:", a3);
    -[RWIProtocolNetworkResourceTiming setRedirectStart:](v23, "setRedirectStart:", a4);
    -[RWIProtocolNetworkResourceTiming setRedirectEnd:](v23, "setRedirectEnd:", a5);
    -[RWIProtocolNetworkResourceTiming setFetchStart:](v23, "setFetchStart:", a6);
    -[RWIProtocolNetworkResourceTiming setDomainLookupStart:](v23, "setDomainLookupStart:", a7);
    -[RWIProtocolNetworkResourceTiming setDomainLookupEnd:](v23, "setDomainLookupEnd:", a8);
    -[RWIProtocolNetworkResourceTiming setConnectStart:](v23, "setConnectStart:", a9);
    -[RWIProtocolNetworkResourceTiming setConnectEnd:](v23, "setConnectEnd:", a10);
    -[RWIProtocolNetworkResourceTiming setSecureConnectionStart:](v23, "setSecureConnectionStart:", a11);
    -[RWIProtocolNetworkResourceTiming setRequestStart:](v23, "setRequestStart:", a12);
    -[RWIProtocolNetworkResourceTiming setResponseStart:](v23, "setResponseStart:", a13);
    -[RWIProtocolNetworkResourceTiming setResponseEnd:](v23, "setResponseEnd:", a14);
    v24 = v23;
  }

  return v23;
}

- (void)setStartTime:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("startTime"), a3);
}

- (double)startTime
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("startTime"));
  return result;
}

- (void)setRedirectStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("redirectStart"), a3);
}

- (double)redirectStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("redirectStart"));
  return result;
}

- (void)setRedirectEnd:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("redirectEnd"), a3);
}

- (double)redirectEnd
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("redirectEnd"));
  return result;
}

- (void)setFetchStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("fetchStart"), a3);
}

- (double)fetchStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("fetchStart"));
  return result;
}

- (void)setDomainLookupStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("domainLookupStart"), a3);
}

- (double)domainLookupStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("domainLookupStart"));
  return result;
}

- (void)setDomainLookupEnd:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("domainLookupEnd"), a3);
}

- (double)domainLookupEnd
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("domainLookupEnd"));
  return result;
}

- (void)setConnectStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("connectStart"), a3);
}

- (double)connectStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("connectStart"));
  return result;
}

- (void)setConnectEnd:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("connectEnd"), a3);
}

- (double)connectEnd
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("connectEnd"));
  return result;
}

- (void)setSecureConnectionStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("secureConnectionStart"), a3);
}

- (double)secureConnectionStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("secureConnectionStart"));
  return result;
}

- (void)setRequestStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("requestStart"), a3);
}

- (double)requestStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("requestStart"));
  return result;
}

- (void)setResponseStart:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("responseStart"), a3);
}

- (double)responseStart
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("responseStart"));
  return result;
}

- (void)setResponseEnd:(double)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject setDouble:forKey:](&v3, sel_setDouble_forKey_, CFSTR("responseEnd"), a3);
}

- (double)responseEnd
{
  double result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)RWIProtocolNetworkResourceTiming;
  -[RWIProtocolJSONObject doubleForKey:](&v3, sel_doubleForKey_, CFSTR("responseEnd"));
  return result;
}

@end
