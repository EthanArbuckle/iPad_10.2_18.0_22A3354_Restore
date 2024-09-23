@implementation MPMediaChapter

- (NSString)bk_UTF8Title
{
  void *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPMediaChapter title](self, "title"));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MPMediaChapter title](self, "title")));
  v5 = objc_msgSend(v4, "cStringUsingEncoding:", 30);

  if (v5)
  {
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithCString:encoding:", v5, 4);
    v7 = v6;
    if (v6)
    {
      v8 = v6;

      v3 = v8;
    }

  }
  return (NSString *)v3;
}

@end
