@implementation TSSStyleAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSSStyle");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSString)tsaxName
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSSStyleAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("name")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSSPropertySetAccessibility)tsaxProperties
{
  void *v3;
  uint64_t v4;
  TSSPropertySetAccessibility *result;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;
  char v13;

  v13 = 0;
  v3 = (void *)objc_opt_class(TSSPropertySetAccessibility);
  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22FBE4;
  v11 = sub_22FBF4;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22FC00;
  v6[3] = &unk_42BF18;
  v6[4] = self;
  v6[5] = &v7;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v8[5];
  _Block_object_dispose(&v7, 8);
  result = (TSSPropertySetAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, v4, 1, &v13);
  if (v13)
    abort();
  return result;
}

- (NSString)tsaxStyleIdentifier
{
  objc_class *v3;
  NSString *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSString);
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSSStyleAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("styleIdentifier")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxObjectForProperty:(int)a3
{
  void *v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22FBE4;
  v11 = sub_22FBF4;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22FD60;
  v5[3] = &unk_43BA40;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (int)tsaxIntValueForProperty:(int)a3
{
  int v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22FE44;
  v5[3] = &unk_43BA40;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (float)tsaxFloatValueForProperty:(int)a3
{
  float v3;
  _QWORD v5[6];
  int v6;
  uint64_t v7;
  float *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = (float *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_22FF30;
  v5[3] = &unk_43BA40;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = v8[6];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)tsaxDescriptionForObjectProperty:(int)a3
{
  uint64_t v3;
  unsigned int v5;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSNull *v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  uint64_t v22;

  v3 = *(_QWORD *)&a3;
  v5 = -[TSSStyleAccessibility _tsaxPropertyRepresentsObjectType:](self, "_tsaxPropertyRepresentsObjectType:");
  if (TSAccessibilityShouldPerformValidationChecks())
  {
    if ((v5 & 1) == 0)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Property must represent object type."), v7, v8, v9, v10, v11, v22))goto LABEL_18;
    }
  }
  if (!v5)
    return 0;
  v12 = -[TSSStyleAccessibility tsaxObjectForProperty:](self, "tsaxObjectForProperty:", v3);
  if (-[NSNull conformsToProtocol:](v12, "conformsToProtocol:", &OBJC_PROTOCOL___TSAccessibilityStyleInfoProvider))return -[NSNull tsaxStyleInfoDescription](v12, "tsaxStyleInfoDescription");
  if (v12 != +[NSNull null](NSNull, "null"))
  {
    if (!TSAccessibilityShouldPerformValidationChecks())
      return 0;
    v14 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v15 = objc_opt_class(v12);
    if (!__TSAccessibilityHandleValidationErrorWithDescription(v14, 0, (uint64_t)CFSTR("%@ does not conform to TSAccessibilityStyleInfoProvider."), v16, v17, v18, v19, v20, v15))return 0;
LABEL_18:
    abort();
  }
  switch((int)v3)
  {
    case 516:
      v21 = CFSTR("fill.none");
      break;
    case 517:
      v21 = CFSTR("stroke.none");
      break;
    case 519:
      v21 = CFSTR("reflection.none");
      break;
    case 520:
      v21 = CFSTR("shadow.none");
      break;
    default:
      v21 = CFSTR("style.property.none");
      break;
  }
  return TSAccessibilityLocalizedString((uint64_t)v21);
}

- (NSString)tsaxStyleInfoDescription
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v4 = objc_opt_class(self);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("-[TSSStyleAccessibility tsaxStyleInfoDescription] is abstract. Please implement tsaxStyleInfoDescription in %@."), v5, v6, v7, v8, v9, v4))abort();
  }
  return 0;
}

- (BOOL)_tsaxPropertyRepresentsObjectType:(int)a3
{
  return (a3 - 516) <= 4 && a3 != 518 || a3 == 212;
}

@end
