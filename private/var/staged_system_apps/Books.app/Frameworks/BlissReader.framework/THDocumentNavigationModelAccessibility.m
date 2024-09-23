@implementation THDocumentNavigationModelAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THDocumentNavigationModel");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)thaxPageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4
{
  uint64_t v4;
  objc_class *v5;
  id result;
  _QWORD v7[8];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_269390;
  v12 = sub_2693A0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2693AC;
  v7[3] = &unk_43BE10;
  v7[6] = &v8;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v5 = (objc_class *)objc_opt_class(NSString);
  result = (id)__TSAccessibilityCastAsClass(v5, v4, 1, &v8);
  if ((_BYTE)v8)
    abort();
  return result;
}

- (id)thaxMajorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  uint64_t v5;
  objc_class *v6;
  id result;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_269390;
  v13 = sub_2693A0;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2694D4;
  v8[3] = &unk_43C830;
  v8[7] = &v9;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v6 = (objc_class *)objc_opt_class(NSString);
  result = (id)__TSAccessibilityCastAsClass(v6, v5, 1, &v9);
  if ((_BYTE)v9)
    abort();
  return result;
}

- (id)thaxMinorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  uint64_t v5;
  objc_class *v6;
  id result;
  _QWORD v8[9];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_269390;
  v13 = sub_2693A0;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_2695FC;
  v8[3] = &unk_43C830;
  v8[7] = &v9;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v6 = (objc_class *)objc_opt_class(NSString);
  result = (id)__TSAccessibilityCastAsClass(v6, v5, 1, &v9);
  if ((_BYTE)v9)
    abort();
  return result;
}

- (id)thaxLessonNodeForContentNode:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_269390;
  v12 = sub_2693A0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_269770;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_269390;
  v12 = sub_2693A0;
  v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2697A4;
  v6[3] = &unk_42BF18;
  v6[4] = v3;
  v6[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)thaxChapterNodeForContentNode:(id)a3
{
  uint64_t v3;
  void *v4;
  _QWORD v6[6];
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_269390;
  v12 = sub_2693A0;
  v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2698F0;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = sub_269390;
  v12 = sub_2693A0;
  v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_269924;
  v6[3] = &unk_42BF18;
  v6[4] = v3;
  v6[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)thaxNavigationUnitContainingContentNode:(id)a3
{
  void *v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = sub_269390;
  v10 = sub_2693A0;
  v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2699F8;
  v5[3] = &unk_427D68;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)thaxChapterAndNumberStringForNavigationUnit:(id)a3
{
  objc_class *v5;
  uint64_t v6;
  id result;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  char v15;

  v15 = 0;
  v5 = (objc_class *)objc_opt_class(NSString);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_269390;
  v13 = sub_2693A0;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_269B30;
  v8[3] = &unk_427D68;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  result = (id)__TSAccessibilityCastAsClass(v5, v6, 1, &v15);
  if (v15)
    abort();
  return result;
}

@end
