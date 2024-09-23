@implementation BKEpubCFILocation

+ (id)unknownLocation
{
  if (qword_20F600 != -1)
    dispatch_once(&qword_20F600, &stru_1C1198);
  return (id)qword_20F5F8;
}

- (NSString)cfiString
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return (NSString *)v3;
}

+ (id)locationForCFI:(id)a3 error:(id *)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = objc_msgSend(objc_alloc((Class)a1), "initWithCFI:error:", v6, a4);

  return v7;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKEpubCFILocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKEpubCFILocation")))
    v5 = -[BKEpubCFILocation initWithLocationDictionary:]([BKEpubCFILocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (BKEpubCFILocation)initWithCFI:(id)a3
{
  id v5;
  BKEpubCFILocation *v6;
  BKEpubCFILocation *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BKEpubCFILocation;
  v6 = -[BKEpubCFILocation init](&v9, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_cfi, a3);
    v7->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

- (BKEpubCFILocation)initWithCFI:(id)a3 error:(id *)a4
{
  id v6;
  BKEpubCFILocation *v7;
  uint64_t v8;
  id v9;
  BCCFI *cfi;
  id v11;
  void *v12;
  uint64_t v13;
  BCCFI *v14;
  id v15;
  NSObject *v16;
  id v18;
  id v19;
  objc_super v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;

  v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)BKEpubCFILocation;
  v7 = -[BKEpubCFILocation init](&v20, "init");
  if (v7)
  {
    if (+[BCCFI isFragmentEpubCFIFunction:](BCCFI, "isFragmentEpubCFIFunction:", v6))
    {
      v19 = 0;
      v8 = objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v6, &v19));
      v9 = v19;
      cfi = v7->_cfi;
      v7->_cfi = (BCCFI *)v8;

    }
    else
    {
      v11 = objc_msgSend(v6, "rangeOfString:", CFSTR("epubcfi"));
      if (v11 == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("BKEpubCFIErrorDomain"), 1, 0));
      }
      else
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringFromIndex:", v11));
        v18 = 0;
        v13 = objc_claimAutoreleasedReturnValue(+[BCCFI cfiWithString:error:](BCCFI, "cfiWithString:error:", v12, &v18));
        v9 = v18;
        v14 = v7->_cfi;
        v7->_cfi = (BCCFI *)v13;

      }
    }
    v7->_pageOffset = 0x7FFFFFFFFFFFFFFFLL;
    if (v9)
    {
      v15 = _AELog();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v9;
        v23 = 2112;
        v24 = v6;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      if (a4)
        *a4 = objc_retainAutorelease(v9);

      v7 = 0;
    }

  }
  return v7;
}

- (BKEpubCFILocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKEpubCFILocation *v6;
  void *v7;
  BCCFI *v8;
  id v9;
  BCCFI *cfi;
  id v11;
  NSObject *v12;
  id v14;
  objc_super v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v15.receiver = self;
  v15.super_class = (Class)BKEpubCFILocation;
  v6 = -[BKLocation initWithLocationDictionary:](&v15, "initWithLocationDictionary:", v5);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("cfi")));
    v14 = 0;
    v8 = (BCCFI *)objc_msgSend(objc_alloc((Class)BCCFI), "initWithCFI:error:", v7, &v14);
    v9 = v14;
    cfi = v6->_cfi;
    v6->_cfi = v8;

    if (v9)
    {
      v11 = _AELog();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v17 = v9;
        v18 = 2112;
        v19 = v7;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      v6 = 0;
    }

  }
  return v6;
}

- (BKEpubCFILocation)initWithCoder:(id)a3
{
  id v4;
  BKEpubCFILocation *v5;
  double v6;
  uint64_t v7;
  void *v8;
  BCCFI *v9;
  id v10;
  BCCFI *cfi;
  id v12;
  NSObject *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  void *v20;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)BKEpubCFILocation;
  v5 = -[BKLocation initWithCoder:](&v16, "initWithCoder:", v4);
  if (v5)
  {
    *(_QWORD *)&v6 = objc_opt_class(NSString).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClass:forKey:", v7, CFSTR("cfi"), v6));
    v15 = 0;
    v9 = (BCCFI *)objc_msgSend(objc_alloc((Class)BCCFI), "initWithCFI:error:", v8, &v15);
    v10 = v15;
    cfi = v5->_cfi;
    v5->_cfi = v9;

    if (v10)
    {
      v12 = _AELog();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v18 = v10;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_ERROR, "Error %@ forming BCCFI from string %@", buf, 0x16u);
      }

      v5 = 0;
    }

  }
  return v5;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKEpubCFILocation;
  v3 = -[BKLocation serializeLocationToDictionary](&v8, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfiString](self, "cfiString"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v4, CFSTR("super"), CFSTR("BKEpubCFILocation"), CFSTR("class"), v5, CFSTR("cfi"), 0));

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKEpubCFILocation;
  v4 = a3;
  -[BKLocation encodeWithCoder:](&v6, "encodeWithCoder:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfiString](self, "cfiString", v6.receiver, v6.super_class));
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("cfi"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)setOrdinal:(int64_t)a3
{
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cfiWithAdjustedSpineIndex:error:", a3, 0));
  -[BKEpubCFILocation setCfi:](self, "setCfi:", v5);

}

- (int64_t)ordinal
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v3 = objc_msgSend(v2, "spineIndex");

  return (int64_t)v3;
}

- (void)updateOrdinalForBookInfo:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_BEA38;
  v8[3] = &unk_1C11C0;
  v9 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "cfiWithSpineIndexAdjustedUsingAssertionBlock:", v8));
  -[BKEpubCFILocation setCfi:](self, "setCfi:", v7);

}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  objc_opt_class(self);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0
    && (v10.receiver = self,
        v10.super_class = (Class)BKEpubCFILocation,
        -[BKLocation isEqual:](&v10, "isEqual:", v4)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfi"));
    v8 = objc_msgSend(v6, "compare:", v7) == 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (int64_t)compare:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfi"));

  v7 = objc_msgSend(v5, "compare:", v6);
  return (int64_t)v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  double v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  *(_QWORD *)&v5 = objc_opt_class(self).n128_u64[0];
  v7 = objc_msgSend(objc_msgSend(v6, "allocWithZone:", a3, v5), "init");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v9 = objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setCfi:", v9);

  return v7;
}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "redactedString"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p %@ pageOffset:%lu>"), v5, self, v7, -[BKEpubCFILocation pageOffset](self, "pageOffset")));

  return (NSString *)v8;
}

- (NSString)debugDescription
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class(self);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "debugDescription"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p %@ pageOffset:%lu>"), v5, self, v7, -[BKEpubCFILocation pageOffset](self, "pageOffset")));

  return (NSString *)v8;
}

- (id)intersectWithRangeFromHeadOf:(id)a3 toTailOf:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BKEpubCFILocation *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cfi"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cfi"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "intersectWithRangeFromHeadOf:toTailOf:", v9, v10));

  if (v11)
    v12 = -[BKEpubCFILocation initWithCFI:]([BKEpubCFILocation alloc], "initWithCFI:", v11);
  else
    v12 = 0;

  return v12;
}

- (id)rebaseCFIWithHead:(id)a3
{
  BCCFI *cfi;
  void *v4;
  void *v5;
  BKEpubCFILocation *v6;

  cfi = self->_cfi;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "cfi"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI rebaseCFIWithHead:](cfi, "rebaseCFIWithHead:", v4));

  if (v5)
    v6 = -[BKEpubCFILocation initWithCFI:]([BKEpubCFILocation alloc], "initWithCFI:", v5);
  else
    v6 = 0;

  return v6;
}

- (id)unionWithCFI:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BKEpubCFILocation *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubCFILocation cfi](self, "cfi"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "cfi"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "unionWithCFI:", v6));
  if (v7)
    v8 = -[BKEpubCFILocation initWithCFI:]([BKEpubCFILocation alloc], "initWithCFI:", v7);
  else
    v8 = 0;

  return v8;
}

- (id)ensureRange
{
  void *v2;
  BKEpubCFILocation *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI ensureRange](self->_cfi, "ensureRange"));
  if (v2)
    v3 = -[BKEpubCFILocation initWithCFI:]([BKEpubCFILocation alloc], "initWithCFI:", v2);
  else
    v3 = 0;

  return v3;
}

- (id)head
{
  BKEpubCFILocation *v3;
  void *v4;
  BKEpubCFILocation *v5;

  if ((-[BCCFI isRange](self->_cfi, "isRange") & 1) != 0)
  {
    v3 = [BKEpubCFILocation alloc];
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI headCFI](self->_cfi, "headCFI"));
    v5 = -[BKEpubCFILocation initWithCFI:](v3, "initWithCFI:", v4);

  }
  else
  {
    v5 = self;
  }
  return v5;
}

+ (id)stringByEscapingString:(id)a3
{
  return +[BCCFI stringByEscapingString:](BCCFI, "stringByEscapingString:", a3);
}

- (BKEpubCFILocation)locationWithAdjustedSpineIndex:(int64_t)a3 error:(id *)a4
{
  void *v4;
  BKEpubCFILocation *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BCCFI cfiWithAdjustedSpineIndex:error:](self->_cfi, "cfiWithAdjustedSpineIndex:error:", a3, a4));
  if (v4)
    v5 = -[BKEpubCFILocation initWithCFI:]([BKEpubCFILocation alloc], "initWithCFI:", v4);
  else
    v5 = 0;

  return v5;
}

- (BCCFI)cfi
{
  return self->_cfi;
}

- (void)setCfi:(id)a3
{
  objc_storeStrong((id *)&self->_cfi, a3);
}

- (BKEpubLocation)wk1EpubLocation
{
  return self->_wk1EpubLocation;
}

- (void)setWk1EpubLocation:(id)a3
{
  objc_storeStrong((id *)&self->_wk1EpubLocation, a3);
}

- (BOOL)isPageLocation
{
  return self->_isPageLocation;
}

- (void)setIsPageLocation:(BOOL)a3
{
  self->_isPageLocation = a3;
}

- (unint64_t)pageOffset
{
  return self->_pageOffset;
}

- (void)setPageOffset:(unint64_t)a3
{
  self->_pageOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wk1EpubLocation, 0);
  objc_storeStrong((id *)&self->_cfi, 0);
}

@end
