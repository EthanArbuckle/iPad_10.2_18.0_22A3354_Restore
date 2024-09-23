@implementation IMCoverUtilities

+ (BOOL)isUndesirableImageData:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  char v7;
  CGImageSource *v8;
  CGImageSource *v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "hash");
  v7 = v6 == (id)254731557 || v6 == (id)153495661;
  if (v6 == (id)254731557 || v6 == (id)153495661)
  {
    if (a4)
      *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kIMCoverUtilitiesErrorDomain"), -1000, 0));
  }
  else
  {
    v8 = CGImageSourceCreateWithData((CFDataRef)v5, 0);
    if (v8)
    {
      v9 = v8;
      if (BKGenericBookCoverIsLegacyGenericBookCoverImageSource(v8))
      {
        if (a4)
          *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("kIMCoverUtilitiesErrorDomain"), -1001, 0));
        v7 = 1;
      }
      CFRelease(v9);
    }
  }

  return v7;
}

@end
