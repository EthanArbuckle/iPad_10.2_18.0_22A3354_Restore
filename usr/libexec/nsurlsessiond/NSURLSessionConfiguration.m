@implementation NSURLSessionConfiguration

- (BOOL)_nsurlsessionproxy_requiresBackgroundSession
{
  if (-[NSURLSessionConfiguration isDiscretionary](self, "isDiscretionary")
    || (-[NSURLSessionConfiguration _allowsRetryForBackgroundDataTasks](self, "_allowsRetryForBackgroundDataTasks") & 1) != 0|| (-[NSURLSessionConfiguration _prefersInfraWiFi](self, "_prefersInfraWiFi") & 1) != 0)
  {
    return 1;
  }
  if ((objc_opt_respondsToSelector(self, "_shouldPreserveBackgroundSessionDisposition") & 1) != 0)
    return -[NSURLSessionConfiguration _shouldPreserveBackgroundSessionDisposition](self, "_shouldPreserveBackgroundSessionDisposition");
  return 0;
}

@end
