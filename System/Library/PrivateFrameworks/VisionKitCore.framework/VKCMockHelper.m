@implementation VKCMockHelper

+ (id)plistFromRange:(_NSRange)a3
{
  NSUInteger length;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  length = a3.length;
  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = VKCMockResultRangeLocationKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3.location);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = VKCMockResultRangeLengthKey;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", length);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (_NSRange)rangeFromPlistDictionary:(id)a3
{
  __CFString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v3 = VKCMockResultRangeLocationKey;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultRangeLengthKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedLongValue");
  v9 = v6;
  v10 = v8;
  result.length = v10;
  result.location = v9;
  return result;
}

+ (id)plistFromSize:(CGSize)a3
{
  double height;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];
  _QWORD v9[3];

  height = a3.height;
  v9[2] = *MEMORY[0x1E0C80C00];
  v8[0] = VKCMockResultSizeWidthKey;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3.width);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = VKCMockResultSizeHeightKey;
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", height);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (CGSize)sizeFromPlistDictionary:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  v3 = VKCMockResultSizeWidthKey;
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (double)(unint64_t)objc_msgSend(v5, "unsignedLongValue");

  objc_msgSend(v4, "objectForKeyedSubscript:", VKCMockResultSizeHeightKey);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (double)(unint64_t)objc_msgSend(v7, "unsignedLongValue");
  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

@end
