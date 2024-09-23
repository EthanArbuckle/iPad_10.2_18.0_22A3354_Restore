@implementation TSDRangeClamper

+ (_NSRange)clampSelectedRange:(_NSRange)a3 inFullString:(id)a4 toWordLimit:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  void *v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v8 = (void *)objc_msgSend(a4, "substringWithRange:");
  if (objc_msgSend(v8, "tsdWordCount") > a5)
    length = objc_msgSend(v8, "endingCharIndexForWordLimit:", a5);
  v9 = location;
  v10 = length;
  result.length = v10;
  result.location = v9;
  return result;
}

@end
