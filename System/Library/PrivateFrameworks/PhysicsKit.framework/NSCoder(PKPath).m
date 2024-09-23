@implementation NSCoder(PKPath)

- (void)encodeCGPoint:()PKPath forKey:
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g}"), *(_QWORD *)&a2, *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v9);

}

- (void)encodeCGVector:()PKPath forKey:
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g}"), *(_QWORD *)&a2, *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v9);

}

- (void)encodeCGSize:()PKPath forKey:
{
  void *v8;
  id v9;

  v9 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("{%g, %g}"), *(_QWORD *)&a2, *(_QWORD *)&a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "encodeObject:forKey:", v8, v9);

}

- (double)decodeCGPointForKey:()PKPath
{
  id v4;
  void *v5;
  void *v6;
  double v7;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    v7 = PKCGPointFromString(v5);
  else
    v7 = *MEMORY[0x24BDBEFB0];

  return v7;
}

- (double)decodeCGVectorForKey:()PKPath
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  double DoubleValue;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v12;
  CFStringRef str;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    if ((unint64_t)-[__CFString length](v7, "length") < 5)
    {
      DoubleValue = 0.0;
    }
    else
    {
      v12 = 0;
      str = 0;
      DoubleValue = 0.0;
      if (PKSplitBracesAndComma(v7, &str, &v12))
      {
        v9 = str;
        DoubleValue = CFStringGetDoubleValue(str);
        v10 = v12;
        CFStringGetDoubleValue(v12);
        CFRelease(v9);
        CFRelease(v10);
      }
    }

  }
  else
  {
    DoubleValue = 0.0;
  }

  return DoubleValue;
}

- (double)decodeCGSizeForKey:()PKPath
{
  id v4;
  void *v5;
  void *v6;
  __CFString *v7;
  double DoubleValue;
  CFStringRef v9;
  CFStringRef v10;
  CFStringRef v12;
  CFStringRef str;

  v4 = a3;
  objc_msgSend(a1, "decodeObjectOfClass:forKey:", objc_opt_class(), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    DoubleValue = *MEMORY[0x24BDBF148];
    if ((unint64_t)-[__CFString length](v7, "length") >= 5)
    {
      v12 = 0;
      str = 0;
      if (PKSplitBracesAndComma(v7, &str, &v12))
      {
        v9 = str;
        DoubleValue = CFStringGetDoubleValue(str);
        v10 = v12;
        CFStringGetDoubleValue(v12);
        CFRelease(v9);
        CFRelease(v10);
      }
    }

  }
  else
  {
    DoubleValue = *MEMORY[0x24BDBF148];
  }

  return DoubleValue;
}

@end
