@implementation NSString

- (BOOL)bk_isPlaylistExtension
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](self, "lowercaseString"));
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("m3u8"));

  return v3;
}

- (BOOL)bk_isAudioFileExtension
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSString lowercaseString](self, "lowercaseString"));
  if ((objc_msgSend(v2, "isEqualToString:", CFSTR("aac")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("ts")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("mp4")) & 1) != 0
    || (objc_msgSend(v2, "isEqualToString:", CFSTR("m4b")) & 1) != 0)
  {
    v3 = 1;
  }
  else
  {
    v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("m4s"));
  }

  return v3;
}

- (id)bk_titleByStrippingAudiobookTitle:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  NSString *v8;

  v4 = a3;
  if (qword_44EB0 != -1)
    dispatch_once(&qword_44EB0, &stru_39080);
  v5 = self;
  if (objc_msgSend(v4, "length") && -[NSString hasPrefix:](v5, "hasPrefix:", v4))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSString substringFromIndex:](v5, "substringFromIndex:", objc_msgSend(v4, "length")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByTrimmingCharactersInSet:", qword_44EA8));

    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;

      v5 = v8;
    }

  }
  return v5;
}

@end
