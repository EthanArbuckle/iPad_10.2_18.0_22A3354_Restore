@implementation AEAnnotationSocialActivityItemProvider

- (id)supportedActivityTypes
{
  _QWORD v3[3];

  v3[0] = UIActivityTypePostToFacebook;
  v3[1] = UIActivityTypePostToTwitter;
  v3[2] = UIActivityTypePostToWeibo;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 3));
}

- (unint64_t)characterLimit
{
  return -1;
}

- (id)text
{
  unint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v3 = -[AEAnnotationSocialActivityItemProvider characterLimit](self, "characterLimit");
  v12.receiver = self;
  v12.super_class = (Class)AEAnnotationSocialActivityItemProvider;
  v4 = -[AEAnnotationActivityItemProviderSource text](&v12, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = IMCommonCoreBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("\\U2026"), &stru_296430, CFSTR("BCCommonCoreLocalizable")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByTruncatingToLength:options:truncationString:", v3, 3, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByEnclosingInQuotes"));
  return v10;
}

@end
