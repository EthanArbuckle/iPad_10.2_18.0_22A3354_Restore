@implementation TSWPColumnAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPColumn");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (_NSRange)tsaxRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPColumnAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)tsaxCountLines
{
  return (unint64_t)-[TSWPColumnAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("countLines"));
}

- (CGRect)tsaxColumnRectForRange:(_NSRange)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  _NSRange v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = "";
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_24A5D4;
  v11[3] = &unk_43B930;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)tsaxGlyphRectForRange:(_NSRange)a3 includingLabel:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  _QWORD v12[6];
  _NSRange v13;
  BOOL v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  const char *v18;
  __int128 v19;
  __int128 v20;
  CGRect result;

  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x4010000000;
  v18 = "";
  v19 = 0u;
  v20 = 0u;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_24A6F0;
  v12[3] = &unk_43C288;
  v12[4] = self;
  v12[5] = &v15;
  v13 = a3;
  v14 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v12))
    abort();
  v4 = v16[4];
  v5 = v16[5];
  v6 = v16[6];
  v7 = v16[7];
  _Block_object_dispose(&v15, 8);
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (_NSRange)tsaxRangeOfLineFragmentAtIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_24A7EC;
  v7[3] = &unk_428E60;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (CGRect)tsaxBoundsOfLineFragmentAtIndex:(unint64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[7];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  const char *v15;
  __int128 v16;
  __int128 v17;
  CGRect result;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x4010000000;
  v15 = "";
  v16 = 0u;
  v17 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_24A900;
  v11[3] = &unk_428E60;
  v11[4] = self;
  v11[5] = &v12;
  v11[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v13[4];
  v4 = v13[5];
  v5 = v13[6];
  v6 = v13[7];
  _Block_object_dispose(&v12, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (unint64_t)tsaxLineIndexForCharIndex:(unint64_t)a3 eol:(BOOL)a4
{
  unint64_t v4;
  _QWORD v6[7];
  BOOL v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_24A9EC;
  v6[3] = &unk_43C2B0;
  v6[4] = self;
  v6[5] = &v8;
  v6[6] = a3;
  v7 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v4;
}

@end
