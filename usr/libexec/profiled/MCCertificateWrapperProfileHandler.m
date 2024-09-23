@implementation MCCertificateWrapperProfileHandler

- (BOOL)installWithInstaller:(id)a3 options:(id)a4 interactionClient:(id)a5 outError:(id *)a6
{
  _BOOL4 v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  __SecCertificate *v15;
  __SecCertificate *v16;
  __CFString *v17;
  void *v18;
  objc_super v20;
  __SecCertificate *v21;

  v20.receiver = self;
  v20.super_class = (Class)MCCertificateWrapperProfileHandler;
  v7 = -[MCConfigurationProfileHandler installWithInstaller:options:interactionClient:outError:](&v20, "installWithInstaller:options:interactionClient:outError:", a3, a4, a5, a6);
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MCProfileHandler profile](self, "profile"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloads"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "payloads"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", 0));

      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "type"));
      v14 = objc_msgSend(v13, "isEqualToString:", kMCCPPKCS12Type);

      if (v14)
      {
        v15 = (__SecCertificate *)objc_msgSend(v12, "copyCertificate");
        if (v15)
        {
          v16 = v15;
          v17 = (__CFString *)SecCertificateCopySubjectSummary(v15);
          objc_msgSend(v8, "setDisplayName:", v17);
          v21 = v16;
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
          objc_msgSend(v8, "setSignerCertificates:", v18);

          CFRelease(v16);
        }
      }

    }
  }
  return v7;
}

@end
