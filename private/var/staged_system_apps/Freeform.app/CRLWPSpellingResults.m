@implementation CRLWPSpellingResults

- (void)addResult:(id)a3 forRange:(_NSRange)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLWPSpellingResults;
  -[CRLWPCheckingResults addResult:forRange:](&v4, "addResult:forRange:", a3, a4.location, a4.length);
}

- (_NSRange)rangeOfMisspelledWordAtCharIndex:(unint64_t)a3
{
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPCheckingResults ranges](self, "ranges"));
  v5 = objc_msgSend(v4, "rangeContainingPosition:", a3);
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

@end
