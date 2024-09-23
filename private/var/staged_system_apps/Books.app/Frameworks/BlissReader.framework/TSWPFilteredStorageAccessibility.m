@implementation TSWPFilteredStorageAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPFilteredStorage");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

+ (id)tsaxNewFilteredStorageWithStorage:(id)a3 subRange:(_NSRange)a4
{
  void *v4;
  _QWORD v6[7];
  _NSRange v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_241458;
  v12 = sub_241468;
  v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_241474;
  v6[3] = &unk_42A9E8;
  v6[4] = a1;
  v6[5] = a3;
  v6[6] = &v8;
  v7 = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (unint64_t)tsaxPreviousCharacterIndex:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_241564;
  v5[3] = &unk_428E60;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unint64_t)tsaxNextCharacterIndex:(unint64_t)a3
{
  unint64_t v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_241648;
  v5[3] = &unk_428E60;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

@end
