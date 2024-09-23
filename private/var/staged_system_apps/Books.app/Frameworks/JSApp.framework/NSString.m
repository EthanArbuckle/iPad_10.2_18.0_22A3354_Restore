@implementation NSString

- (id)jsa_normalizedArtworkURLOfSize:(CGSize)a3 withFormat:(id)a4
{
  double height;
  double width;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v8 = -[NSString mutableCopy](self, "mutableCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(width)));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringValue"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{w}"), v10, 2, 0, objc_msgSend(v8, "length"));

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", llround(height)));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringValue"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{h}"), v12, 2, 0, objc_msgSend(v8, "length"));

  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{c}"), &stru_A2730, 2, 0, objc_msgSend(v8, "length"));
  objc_msgSend(v8, "replaceOccurrencesOfString:withString:options:range:", CFSTR("{f}"), v7, 2, 0, objc_msgSend(v8, "length"));

  v13 = objc_msgSend(v8, "copy");
  return v13;
}

@end
