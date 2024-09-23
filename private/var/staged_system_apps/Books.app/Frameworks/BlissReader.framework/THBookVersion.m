@implementation THBookVersion

+ (THBookVersion)bookVersionWithVersionString:(id)a3
{
  return -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", a3);
}

+ (id)newUnversionedBookVersion
{
  return -[THBookVersion initWithString:]([THBookVersion alloc], "initWithString:", &stru_43D7D8);
}

+ (id)unversionedBookVersion
{
  id result;

  result = (id)qword_543298;
  if (!qword_543298)
  {
    result = +[THBookVersion newUnversionedBookVersion](THBookVersion, "newUnversionedBookVersion");
    qword_543298 = (uint64_t)result;
  }
  return result;
}

- (THBookVersion)initWithString:(id)a3
{
  THBookVersion *v4;
  THBookVersion *v5;
  const __CFString *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THBookVersion;
  v4 = -[THBookVersion init](&v8, "init");
  v5 = v4;
  if (v4)
  {
    if (a3)
      v6 = (const __CFString *)a3;
    else
      v6 = &stru_43D7D8;
    -[THBookVersion setVersionString:](v4, "setVersionString:", v6);
    -[THBookVersion p_parseString](v5, "p_parseString");
  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[THBookVersion setVersionString:](self, "setVersionString:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THBookVersion;
  -[THBookVersion dealloc](&v3, "dealloc");
}

- (void)p_parseString
{
  _BOOL8 v3;
  NSArray *v4;
  NSUInteger v5;
  unint64_t v6;

  if (!-[THBookVersion versionString](self, "versionString"))
    goto LABEL_14;
  if (-[NSString isEqualToString:](-[THBookVersion versionString](self, "versionString"), "isEqualToString:", &stru_43D7D8))
  {
    -[THBookVersion setMajorVersion:](self, "setMajorVersion:", 0);
    -[THBookVersion setMinorVersion:](self, "setMinorVersion:", 0);
    -[THBookVersion setSubMinorVersion:](self, "setSubMinorVersion:", 0);
    v3 = 1;
    -[THBookVersion setIsUnversioned:](self, "setIsUnversioned:", 1);
    goto LABEL_15;
  }
  v4 = -[NSString componentsSeparatedByString:](-[THBookVersion versionString](self, "versionString"), "componentsSeparatedByString:", CFSTR("."));
  v5 = -[NSArray count](v4, "count");
  if (v5 >= 4)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookVersion p_parseString]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THBookVersion.m"), 93, CFSTR("Error, version string %@ contains too many dot-separated components"), -[THBookVersion versionString](self, "versionString"));
LABEL_14:
    v3 = 0;
    goto LABEL_15;
  }
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THBookVersion p_parseString]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Model/THBookVersion.m"), 98, CFSTR("Error, version string %@ contains zero dot-separated components"), -[THBookVersion versionString](self, "versionString"));
    goto LABEL_14;
  }
  -[THBookVersion setMajorVersion:](self, "setMajorVersion:", objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 0), "integerValue"));
  v3 = -[THBookVersion p_componentIsValid:](self, "p_componentIsValid:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", 0));
  if (v6 != 1)
  {
    -[THBookVersion setMinorVersion:](self, "setMinorVersion:", objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 1), "integerValue"));
    if (v3)
      v3 = -[THBookVersion p_componentIsValid:](self, "p_componentIsValid:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", 1));
    if (v6 >= 3)
    {
      -[THBookVersion setSubMinorVersion:](self, "setSubMinorVersion:", objc_msgSend(-[NSArray objectAtIndex:](v4, "objectAtIndex:", 2), "integerValue"));
      if (v3)
        v3 = -[THBookVersion p_componentIsValid:](self, "p_componentIsValid:", -[NSArray objectAtIndex:](v4, "objectAtIndex:", 2));
    }
  }
LABEL_15:
  -[THBookVersion setIsValid:](self, "setIsValid:", v3);
}

- (BOOL)p_componentIsValid:(id)a3
{
  if (!objc_msgSend(a3, "length") || ((unint64_t)objc_msgSend(a3, "integerValue") & 0x8000000000000000) != 0)
    return 0;
  else
    return objc_msgSend(a3, "isEqualToString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), objc_msgSend(a3, "integerValue")));
}

- (id)description
{
  if (-[NSString isEqualToString:](-[THBookVersion versionString](self, "versionString"), "isEqualToString:", &stru_43D7D8))
  {
    return CFSTR("(unversioned)");
  }
  else
  {
    return -[THBookVersion versionString](self, "versionString");
  }
}

- (BOOL)isStrictlyNewerThanBookVersion:(id)a3
{
  unsigned int v5;
  unint64_t v6;
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;

  if (-[THBookVersion isValid](self, "isValid") && objc_msgSend(a3, "isValid"))
  {
    if (!objc_msgSend(a3, "isUnversioned") || -[THBookVersion isUnversioned](self, "isUnversioned"))
    {
      if (-[THBookVersion isUnversioned](self, "isUnversioned"))
      {
LABEL_6:
        LOBYTE(v5) = 0;
        return v5;
      }
      v6 = -[THBookVersion majorVersion](self, "majorVersion");
      if (v6 <= (unint64_t)objc_msgSend(a3, "majorVersion"))
      {
        v7 = -[THBookVersion majorVersion](self, "majorVersion");
        if (v7 != objc_msgSend(a3, "majorVersion"))
          goto LABEL_6;
        v8 = -[THBookVersion minorVersion](self, "minorVersion");
        if (v8 <= (unint64_t)objc_msgSend(a3, "minorVersion"))
        {
          v9 = -[THBookVersion minorVersion](self, "minorVersion");
          if (v9 == objc_msgSend(a3, "minorVersion"))
          {
            v10 = -[THBookVersion subMinorVersion](self, "subMinorVersion");
            LOBYTE(v5) = v10 > (unint64_t)objc_msgSend(a3, "subMinorVersion");
            return v5;
          }
          goto LABEL_6;
        }
      }
    }
    LOBYTE(v5) = 1;
    return v5;
  }
  v5 = -[THBookVersion isValid](self, "isValid");
  if (v5)
    LOBYTE(v5) = objc_msgSend(a3, "isValid") ^ 1;
  return v5;
}

- (BOOL)isEqualToBookVersion:(id)a3
{
  unsigned int v5;
  unsigned int v6;
  id v7;
  id v8;
  id v9;

  v5 = -[THBookVersion isValid](self, "isValid");
  if (v5 == objc_msgSend(a3, "isValid")
    && (v6 = -[THBookVersion isUnversioned](self, "isUnversioned"), v6 == objc_msgSend(a3, "isUnversioned"))&& (v7 = -[THBookVersion majorVersion](self, "majorVersion"), v7 == objc_msgSend(a3, "majorVersion"))&& (v8 = -[THBookVersion minorVersion](self, "minorVersion"), v8 == objc_msgSend(a3, "minorVersion"))&& (v9 = -[THBookVersion subMinorVersion](self, "subMinorVersion"), v9 == objc_msgSend(a3, "subMinorVersion")))
  {
    return -[NSString isEqualToString:](-[THBookVersion versionString](self, "versionString"), "isEqualToString:", objc_msgSend(a3, "versionString"));
  }
  else
  {
    return 0;
  }
}

- (NSString)versionString
{
  return self->_versionString;
}

- (void)setVersionString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)majorVersion
{
  return self->_majorVersion;
}

- (void)setMajorVersion:(unint64_t)a3
{
  self->_majorVersion = a3;
}

- (unint64_t)minorVersion
{
  return self->_minorVersion;
}

- (void)setMinorVersion:(unint64_t)a3
{
  self->_minorVersion = a3;
}

- (unint64_t)subMinorVersion
{
  return self->_subMinorVersion;
}

- (void)setSubMinorVersion:(unint64_t)a3
{
  self->_subMinorVersion = a3;
}

- (BOOL)isValid
{
  return self->_isValid;
}

- (void)setIsValid:(BOOL)a3
{
  self->_isValid = a3;
}

- (BOOL)isUnversioned
{
  return self->_isUnversioned;
}

- (void)setIsUnversioned:(BOOL)a3
{
  self->_isUnversioned = a3;
}

@end
