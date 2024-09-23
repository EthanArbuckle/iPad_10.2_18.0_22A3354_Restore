@implementation THModelContentNodeAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THModelContentNode");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THModelNodeAccessibility, a2);
}

- (id)thaxBodyStorageForPresentationType:(id)a3
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
  v5 = (objc_class *)objc_opt_class(THWPStorage);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_255AF0;
  v13 = sub_255B00;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_255B0C;
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

- (id)thaxNodeUniqueIDForInfo:(id)a3
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
  v12 = sub_255AF0;
  v13 = sub_255B00;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_255C44;
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

- (id)thaxInfoForNodeUniqueID:(id)a3 forPresentationType:(id)a4
{
  void *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_255AF0;
  v11 = sub_255B00;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_255D3C;
  v6[3] = &unk_43B9F0;
  v6[4] = self;
  v6[5] = a3;
  v6[6] = a4;
  v6[7] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
