@implementation TSDEditorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDEditorController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)tsaxTextInputEditor
{
  return -[TSDEditorControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("textInputEditor"));
}

- (NSArray)tsaxCurrentEditors
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDEditorControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("currentEditors")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxEditorForEditAction:(SEL)a3 withSender:(id)a4
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
  v10 = sub_23AE3C;
  v11 = sub_23AE4C;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_23AE58;
  v6[3] = &unk_43BE10;
  v6[6] = &v7;
  v6[7] = a3;
  v6[4] = self;
  v6[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end
