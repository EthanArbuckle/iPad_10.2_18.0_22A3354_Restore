@implementation PKNetworkConnectivityAvailable

void __PKNetworkConnectivityAvailable_block_invoke()
{
  const __SCNetworkReachability *v0;
  const __SCNetworkReachability *v1;
  NSObject *v2;
  sockaddr v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = (sockaddr)xmmword_1904538E0;
  v0 = SCNetworkReachabilityCreateWithAddress((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &v3);
  qword_1ECF21CB8 = (uint64_t)v0;
  if (v0)
  {
    if (SCNetworkReachabilitySetCallback(v0, (SCNetworkReachabilityCallBack)PKNetworkConnectivityAvailableCallback, 0))
    {
      v1 = (const __SCNetworkReachability *)qword_1ECF21CB8;
      dispatch_get_global_queue(0, 0);
      v2 = objc_claimAutoreleasedReturnValue();
      SCNetworkReachabilitySetDispatchQueue(v1, v2);

    }
  }
}

@end
