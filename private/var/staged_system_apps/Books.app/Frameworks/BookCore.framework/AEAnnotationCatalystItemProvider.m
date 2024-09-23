@implementation AEAnnotationCatalystItemProvider

+ (id)writableTypeIdentifiersForItemProvider
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeUTF8PlainText, "identifier"));
  v6[0] = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(UTTypeHTML, "identifier"));
  v6[1] = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v6, 2));

  return v4;
}

- (id)writableTypeIdentifiersForItemProvider
{
  void *v2;

  v2 = (void *)objc_opt_class(self, a2);
  return _objc_msgSend(v2, "writableTypeIdentifiersForItemProvider");
}

@end
