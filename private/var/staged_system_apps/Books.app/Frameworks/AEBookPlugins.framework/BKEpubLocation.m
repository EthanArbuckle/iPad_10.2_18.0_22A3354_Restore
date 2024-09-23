@implementation BKEpubLocation

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v4 = a3;
  objc_opt_class(BKEpubLocation);
  if ((objc_opt_isKindOfClass(v4, v5) & 1) != 0)
  {
    v14.receiver = self;
    v14.super_class = (Class)BKEpubLocation;
    if (-[BKLocation isEqual:](&v14, "isEqual:", v4))
    {
      v6 = v4;
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "startPath"));
      if (objc_msgSend(v7, "count"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation startPath](self, "startPath"));
        objc_msgSend(v8, "count");
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endPath"));
        objc_msgSend(v9, "count");

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endPath"));
      if (objc_msgSend(v10, "count"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation endPath](self, "endPath"));
        objc_msgSend(v11, "count");
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "endPath"));
        objc_msgSend(v12, "count");

      }
    }
  }

  return 0;
}

- (id)serializeLocationToDictionary
{
  id v3;
  void *v4;
  id v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)BKEpubLocation;
  v3 = -[BKLocation serializeLocationToDictionary](&v15, "serializeLocationToDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("super"));
  *(float *)&v6 = (float)-[BKEpubLocation startOffset](self, "startOffset");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v6));
  objc_msgSend(v5, "setObject:forKey:", v7, CFSTR("startOffset"));

  *(float *)&v8 = (float)-[BKEpubLocation endOffset](self, "endOffset");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v8));
  objc_msgSend(v5, "setObject:forKey:", v9, CFSTR("endOffset"));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation startPath](self, "startPath"));
  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation startPath](self, "startPath"));
    objc_msgSend(v5, "setObject:forKey:", v11, CFSTR("startPath"));

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation endPath](self, "endPath"));

  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation endPath](self, "endPath"));
    objc_msgSend(v5, "setObject:forKey:", v13, CFSTR("endPath"));

  }
  objc_msgSend(v5, "setObject:forKey:", CFSTR("BKEpubLocation"), CFSTR("class"));

  return v5;
}

- (BKEpubLocation)initWithLocationDictionary:(id)a3
{
  id v4;
  void *v5;
  BKEpubLocation *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("super")));
  v12.receiver = self;
  v12.super_class = (Class)BKEpubLocation;
  v6 = -[BKLocation initWithLocationDictionary:](&v12, "initWithLocationDictionary:", v5);
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("startPath")));
    -[BKEpubLocation setStartPath:](v6, "setStartPath:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("startOffset")));
    -[BKEpubLocation setStartOffset:](v6, "setStartOffset:", objc_msgSend(v8, "unsignedIntValue"));

    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("endPath")));
    -[BKEpubLocation setEndPath:](v6, "setEndPath:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("endOffset")));
    -[BKEpubLocation setEndOffset:](v6, "setEndOffset:", objc_msgSend(v10, "unsignedIntValue"));

  }
  return v6;
}

+ (id)deserializeLocationFromDictionary:(id)a3
{
  id v3;
  void *v4;
  BKEpubLocation *v5;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("class")));
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("BKEpubLocation")))
    v5 = -[BKEpubLocation initWithLocationDictionary:]([BKEpubLocation alloc], "initWithLocationDictionary:", v3);
  else
    v5 = 0;

  return v5;
}

- (BKEpubLocation)initWithCoder:(id)a3
{
  id v4;
  BKEpubLocation *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)BKEpubLocation;
  v5 = -[BKLocation initWithCoder:](&v18, "initWithCoder:", v4);
  if (v5)
  {
    objc_opt_class(NSArray);
    v7 = v6;
    objc_opt_class(NSDictionary);
    v9 = v8;
    objc_opt_class(NSString);
    v11 = v10;
    *(_QWORD *)&v12 = objc_opt_class(NSNumber).n128_u64[0];
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", v7, v12, v9, v11, v13, 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("startPath")));
    -[BKEpubLocation setStartPath:](v5, "setStartPath:", v15);

    -[BKEpubLocation setStartOffset:](v5, "setStartOffset:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("startOffset")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v14, CFSTR("endPath")));
    -[BKEpubLocation setEndPath:](v5, "setEndPath:", v16);

    -[BKEpubLocation setEndOffset:](v5, "setEndOffset:", objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("endOffset")));
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKEpubLocation;
  v4 = a3;
  -[BKLocation encodeWithCoder:](&v5, "encodeWithCoder:", v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_startPath, CFSTR("startPath"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_startOffset, CFSTR("startOffset"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_endPath, CFSTR("endPath"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_endOffset, CFSTR("endOffset"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_NSRange)adjustRangeForSinglePageMode:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v5 = -[BKEpubLocation singlePage](self, "singlePage");
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v6 = length + location - 1;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    v7 = length;
  else
    v7 = 1;
  if (length < 2)
  {
    v6 = location;
    v7 = length;
  }
  v8 = v5 == 0;
  if (v5)
    v9 = v6;
  else
    v9 = location;
  if (v8)
    v10 = length;
  else
    v10 = v7;
  result.length = v10;
  result.location = v9;
  return result;
}

- (unint64_t)pageOffset
{
  return 0;
}

- (id)stringValue
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKEpubLocation;
  v3 = -[BKLocation stringValue](&v7, "stringValue");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("{ %@, singlePage: %d, startOffset:%lu, endOffset:%lu, startPath:%@, endPath:%@ }"), v4, self->_singlePage, self->_startOffset, self->_endOffset, self->_startPath, self->_endPath));

  return v5;
}

- (NSDictionary)jsonObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  _QWORD v13[4];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation startPath](self, "startPath"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation endPath](self, "endPath"));
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v12[0] = CFSTR("startPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation startPath](self, "startPath"));
      v13[0] = v6;
      v12[1] = CFSTR("startOffset");
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKEpubLocation startOffset](self, "startOffset")));
      v13[1] = v7;
      v12[2] = CFSTR("endPath");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKEpubLocation endPath](self, "endPath"));
      v13[2] = v8;
      v12[3] = CFSTR("endOffset");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[BKEpubLocation endOffset](self, "endOffset")));
      v13[3] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 4));

      return (NSDictionary *)v10;
    }
  }
  else
  {

  }
  return (NSDictionary *)0;
}

- (NSArray)startPath
{
  return self->_startPath;
}

- (void)setStartPath:(id)a3
{
  objc_storeStrong((id *)&self->_startPath, a3);
}

- (unint64_t)startOffset
{
  return self->_startOffset;
}

- (void)setStartOffset:(unint64_t)a3
{
  self->_startOffset = a3;
}

- (NSArray)endPath
{
  return self->_endPath;
}

- (void)setEndPath:(id)a3
{
  objc_storeStrong((id *)&self->_endPath, a3);
}

- (unint64_t)endOffset
{
  return self->_endOffset;
}

- (void)setEndOffset:(unint64_t)a3
{
  self->_endOffset = a3;
}

- (BOOL)singlePage
{
  return self->_singlePage;
}

- (void)setSinglePage:(BOOL)a3
{
  self->_singlePage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endPath, 0);
  objc_storeStrong((id *)&self->_startPath, 0);
}

@end
