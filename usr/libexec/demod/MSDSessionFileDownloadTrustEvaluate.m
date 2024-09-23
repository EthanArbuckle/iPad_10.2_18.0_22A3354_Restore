@implementation MSDSessionFileDownloadTrustEvaluate

- (BOOL)trustServer:(__SecTrust *)a3 isRedirect:(BOOL)a4
{
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDSessionFileDownloadTrustEvaluate;
  if (-[MSDSessionBaseTrustEvaluate trustServer:isRedirect:](&v6, "trustServer:isRedirect:", a3, a4))
    return 1;
  else
    return !-[MSDSessionBaseTrustEvaluate isDone](self, "isDone");
}

@end
