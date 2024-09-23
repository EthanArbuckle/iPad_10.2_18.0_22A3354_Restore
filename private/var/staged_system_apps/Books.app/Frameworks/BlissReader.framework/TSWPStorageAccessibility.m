@implementation TSWPStorageAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPStorage");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxString
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSWPStorageAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("string")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (_NSRange)tsaxRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPStorageAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)tsaxSelectionRangeMaxForCharIndex:(unint64_t)a3
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
  v5[2] = sub_2448E8;
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

- (id)tsaxSubstringWithRange:(_NSRange)a3
{
  void *v3;
  _QWORD v5[6];
  _NSRange v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_2449E0;
  v11 = sub_2449F0;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2449FC;
  v5[3] = &unk_43B930;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)tsaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  void *v5;
  id result;
  char v7;

  v7 = 0;
  v5 = (void *)objc_opt_class(TSWPAttachmentAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[TSWPStorageAccessibility attachmentOrFootnoteAtCharIndex:](self, "attachmentOrFootnoteAtCharIndex:", a3), 1, &v7);
  if (v7)
    abort();
  return result;
}

- (void)tsaxEnumerateAttachmentsUsingBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_244AF8;
  v3[3] = &unk_426E78;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_244C48;
  v3[3] = &unk_426E78;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (id)tsaxSmartFieldNearestToCharIndex:(unint64_t)a3 inStorageRange:(_NSRange)a4
{
  void *v4;
  Class v5;
  Class v6;
  char v8;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_2449E0;
  v14 = sub_2449F0;
  v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_244E04;
  v9[3] = &unk_43C028;
  v9[4] = &v10;
  v9[5] = a3;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, a4.location, a4.length, v9);
  v8 = 0;
  v4 = (void *)objc_opt_class(TSWPSmartFieldAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, v11[5], 1, &v8);
  if (v8)
    abort();
  v6 = v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)tsaxEnumerateSmartFieldsUsingBlock:(id)a3
{
  id v5;
  uint64_t v6;

  v5 = -[TSWPStorageAccessibility tsaxRange](self, "tsaxRange");
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v5, v6, a3);
}

- (void)tsaxEnumerateSmartFieldsWithAttributeKind:(int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  _QWORD v5[6];
  _NSRange v6;
  int v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_244EC8;
  v5[3] = &unk_43C078;
  v7 = a3;
  v6 = a4;
  v5[4] = self;
  v5[5] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
}

- (id)tsaxEditableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 outSelectionIsOnEdge:(BOOL *)a6
{
  void *v6;
  _QWORD v8[9];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = sub_2449E0;
  v14 = sub_2449F0;
  v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_245084;
  v8[3] = &unk_43C0A0;
  v8[4] = self;
  v8[5] = a3;
  v9 = a4;
  v8[6] = &v10;
  v8[7] = a5;
  v8[8] = a6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)tsaxContainsAnnotationInRange:(_NSRange)a3
{
  uint64_t v3;
  _QWORD v5[6];
  _NSRange v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3010000000;
  v11 = 0;
  v12 = 0;
  v10 = "";
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_245184;
  v5[3] = &unk_43B930;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)tsaxRangeForAnnotation:(id)a3
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
  v7[2] = sub_24527C;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
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

- (id)tsaxTargetStringForAnnotation:(id)a3
{
  id v4;
  uint64_t v5;

  v4 = -[TSWPStorageAccessibility tsaxRangeForAnnotation:](self, "tsaxRangeForAnnotation:", a3);
  return -[TSWPStorageAccessibility tsaxSubstringWithRange:](self, "tsaxSubstringWithRange:", v4, v5);
}

@end
