@implementation RAPWebBundleDownloadManager

+ (id)sharedInstance
{
  if (qword_1014D3D98 != -1)
    dispatch_once(&qword_1014D3D98, &stru_1011E0EA0);
  return (id)qword_1014D3DA0;
}

- (RAPWebBundleDownloadManager)initWithConfiguration:(id)a3
{
  RAPWebBundleDownloadManager *v3;
  RAPWebBundleDownloadManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)RAPWebBundleDownloadManager;
  v3 = -[WebBundleDownloadManager initWithConfiguration:](&v6, "initWithConfiguration:", a3);
  v4 = v3;
  if (v3)
    -[WebBundleDownloadManager downloadWebBundle](v3, "downloadWebBundle");
  return v4;
}

+ (int64_t)creationPreference
{
  return 1;
}

@end
