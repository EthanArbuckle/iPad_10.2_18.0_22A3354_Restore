@implementation CRLBasicShapeLibraryShape

- (CRLBasicShapeLibraryShape)initWithShapeType:(int64_t)a3 position:(unint64_t)a4
{
  CRLBasicShapeLibraryShape *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *name;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLBasicShapeLibraryShape;
  v6 = -[CRLBasicShapeLibraryShape init](&v13, "init");
  if (v6)
  {
    if (a3 == 21)
    {
      +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B1F0);
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100E2FC44();
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10125B210);
      v7 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLBasicShapeLibraryShape initWithShapeType:position:]"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryShape.m"));
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 32, 0, "Basic shapes do not know about the custom shape type.");

    }
    v6->_shapeType = a3;
    v10 = objc_claimAutoreleasedReturnValue(+[CRLBasicShapeLibraryShape p_nameForShapeType:](CRLBasicShapeLibraryShape, "p_nameForShapeType:", a3));
    name = v6->_name;
    v6->_name = (NSString *)v10;

    v6->_position = a4;
  }
  return v6;
}

+ (id)baseNameForShapeType:(int64_t)a3
{
  const __CFString *v3;
  double v4;
  id v5;

  if ((unint64_t)a3 > 0x14)
    v3 = CFSTR("Shape");
  else
    v3 = off_10125B270[a3];
  *(_QWORD *)&v4 = objc_opt_class(a1, a2).n128_u64[0];
  return objc_msgSend(v5, "p_baseStringForKey:", v3, v4);
}

- (NSString)baseName
{
  double v3;
  id v4;

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  return (NSString *)objc_msgSend(v4, "baseNameForShapeType:", -[CRLBasicShapeLibraryShape shapeType](self, "shapeType", v3));
}

- (NSArray)baseKeywords
{
  double v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void **v11;
  double v12;
  id v13;
  uint64_t v14;
  double v15;
  id v16;
  double v17;
  id v18;
  void *v20;
  _QWORD v21[2];
  void *v22;
  _QWORD v23[2];
  _QWORD v24[2];

  *(_QWORD *)&v3 = objc_opt_class(self, a2).n128_u64[0];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "p_baseStringForKey:", CFSTR("shape"), v3));
  v7 = &__NSArray0__struct;
  switch(-[CRLBasicShapeLibraryShape shapeType](self, "shapeType"))
  {
    case 3:
      *(_QWORD *)&v8 = objc_opt_class(self, v6).n128_u64[0];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "p_baseStringForKey:", CFSTR("rectangle"), v8));
      v23[0] = v10;
      v23[1] = v5;
      v11 = (void **)v23;
      goto LABEL_7;
    case 4:
      *(_QWORD *)&v12 = objc_opt_class(self, v6).n128_u64[0];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "p_baseStringForKey:", CFSTR("square"), v12));
      v22 = v10;
      v11 = &v22;
      v14 = 1;
      goto LABEL_8;
    case 5:
    case 7:
    case 0xALL:
    case 0xELL:
      v20 = v5;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1));
      break;
    case 6:
      *(_QWORD *)&v15 = objc_opt_class(self, v6).n128_u64[0];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "p_baseStringForKey:", CFSTR("equilateral triangle"), v15));
      v21[0] = v10;
      v21[1] = v5;
      v11 = (void **)v21;
      goto LABEL_7;
    case 0xDLL:
      *(_QWORD *)&v17 = objc_opt_class(self, v6).n128_u64[0];
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "p_baseStringForKey:", CFSTR("polygon"), v17));
      v24[0] = v10;
      v24[1] = v5;
      v11 = (void **)v24;
LABEL_7:
      v14 = 2;
LABEL_8:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, v14));

      break;
    default:
      break;
  }

  return (NSArray *)v7;
}

- (NSArray)keywords
{
  void *v3;
  void *v4;
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void **v9;
  uint64_t v10;
  void *v12;
  _QWORD v13[2];
  void *v14;
  _QWORD v15[2];
  _QWORD v16[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("shape"), 0, 0));

  v5 = -[CRLBasicShapeLibraryShape shapeType](self, "shapeType");
  v6 = &__NSArray0__struct;
  switch(v5)
  {
    case 3:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("rectangle"), 0, 0));
      v15[0] = v8;
      v15[1] = v4;
      v9 = (void **)v15;
      goto LABEL_7;
    case 4:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("square"), 0, 0));
      v14 = v8;
      v9 = &v14;
      v10 = 1;
      goto LABEL_8;
    case 5:
    case 7:
    case 10:
    case 14:
      v12 = v4;
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      break;
    case 6:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("equilateral triangle"), 0, 0));
      v13[0] = v8;
      v13[1] = v4;
      v9 = (void **)v13;
      goto LABEL_7;
    case 13:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("polygon"), 0, 0));
      v16[0] = v8;
      v16[1] = v4;
      v9 = (void **)v16;
LABEL_7:
      v10 = 2;
LABEL_8:
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v9, v10));

      break;
    default:
      break;
  }

  return (NSArray *)v6;
}

- (id)pathSourceWithSize:(CGSize)a3
{
  return +[CRLPathSource pathSourceForShapeType:naturalSize:](CRLPathSource, "pathSourceForShapeType:naturalSize:", -[CRLBasicShapeLibraryShape shapeType](self, "shapeType"), a3.width, a3.height);
}

- (unint64_t)positionInCategoryWithID:(id)a3
{
  return -[CRLBasicShapeLibraryShape p_position](self, "p_position", a3);
}

- (NSString)accessibilityName
{
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibraryShape name](self, "name"));
  if ((id)-[CRLBasicShapeLibraryShape shapeType](self, "shapeType") == (id)9)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Double arrow");
LABEL_7:
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", v6, 0, 0));

    v3 = (void *)v7;
    return (NSString *)v3;
  }
  if ((id)-[CRLBasicShapeLibraryShape shapeType](self, "shapeType") == (id)6)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Equilateral triangle");
    goto LABEL_7;
  }
  if ((id)-[CRLBasicShapeLibraryShape shapeType](self, "shapeType") == (id)7)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = v4;
    v6 = CFSTR("Right triangle");
    goto LABEL_7;
  }
  return (NSString *)v3;
}

+ (id)p_baseStringForKey:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:localization:", v3, 0, 0, CFSTR("en")));

  v6 = v5;
  if (!v5)
  {
    +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B230);
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100E2FCE0();
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10125B250);
    v7 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "+[CRLBasicShapeLibraryShape p_baseStringForKey:]"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLCanvas/CRLBasicShapeLibraryShape.m"));
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v8, v9, 174, 0, "invalid nil value for '%{public}s'", "englishString");

    v6 = v3;
  }
  v10 = v6;

  return v10;
}

+ (id)p_nameForShapeType:(int64_t)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  switch(a3)
  {
    case 0:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Text");
      break;
    case 1:
    case 20:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Line");
      break;
    case 2:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Connection Line");
      break;
    case 3:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Square");
      break;
    case 4:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Rounded Rectangle");
      break;
    case 5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Circle");
      break;
    case 6:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Triangle");
      break;
    case 7:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Right Triangle");
      break;
    case 8:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Arrow");
      break;
    case 9:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Double Arrow");
      break;
    case 10:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Diamond");
      break;
    case 11:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Quote Bubble");
      break;
    case 12:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Callout");
      break;
    case 13:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Pentagon");
      break;
    case 14:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Star");
      break;
    case 16:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Line Arrow");
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v4 = v3;
      v5 = CFSTR("Shape");
      break;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, 0, 0));

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  BOOL v10;

  v4 = a3;
  objc_opt_class(CRLBasicShapeLibraryShape, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = -[CRLBasicShapeLibraryShape shapeType](self, "shapeType");
    v10 = v9 == objc_msgSend(v8, "shapeType");
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CRLBasicShapeLibraryShape shapeType](self, "shapeType")));
  v3 = objc_msgSend(v2, "hash");

  return (unint64_t)v3;
}

- (NSString)description
{
  Class v3;
  NSString *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_opt_class(self, a2);
  v4 = NSStringFromClass(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLBasicShapeLibraryShape name](self, "name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p name=%@>"), v5, self, v6));

  return (NSString *)v7;
}

- (NSString)name
{
  return self->_name;
}

- (int64_t)shapeType
{
  return self->_shapeType;
}

- (unint64_t)p_position
{
  return self->_position;
}

- (void)setP_position:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end
