@implementation THWPHighlightControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPHighlightController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (NSDictionary)thaxAnnotationCache
{
  objc_class *v3;
  NSDictionary *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSDictionary);
  result = (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWPHighlightControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("annotationCache")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (void)thaxShowEditorForHighlight:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_265CBC;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (id)thaxHighlightAtCanvasPoint:(CGPoint)a3
{
  void *v3;
  _QWORD v5[6];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_265D8C;
  v11 = sub_265D9C;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_265DA8;
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

- (id)thaxAnnotationForRange:(_NSRange)a3
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
  v10 = sub_265D8C;
  v11 = sub_265D9C;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_265EA0;
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

- (id)thaxAnnotationsForRange:(_NSRange)a3
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
  v10 = sub_265D8C;
  v11 = sub_265D9C;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_265F98;
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

- (void)updateCachedAnnotations
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility updateCachedAnnotations](&v3, "updateCachedAnnotations");
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
    -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_addHighlight:forCachedAnnotation:](&v5, "p_addHighlight:forCachedAnnotation:", a3, a4);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_clearAnnotationCache
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_clearAnnotationCache](&v3, "p_clearAnnotationCache");
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_removeCachedAnnotation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_removeCachedAnnotation:](&v4, "p_removeCachedAnnotation:", a3);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_removeHighlightForCachedAnnotation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_removeHighlightForCachedAnnotation:](&v4, "p_removeHighlightForCachedAnnotation:", a3);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_removeNoteForCachedAnnotation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_removeNoteForCachedAnnotation:](&v4, "p_removeNoteForCachedAnnotation:", a3);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5
{
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWPHighlightControllerAccessibility;
  v6 = -[THWPHighlightControllerAccessibility p_setLineProperties:fromRange:isUnderline:](&v8, "p_setLineProperties:fromRange:isUnderline:", a3, a4.location, a4.length, a5);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
  return v6;
}

- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5
{
  BOOL v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)THWPHighlightControllerAccessibility;
  v6 = -[THWPHighlightControllerAccessibility p_updateHighlight:toRange:rect:](&v8, "p_updateHighlight:toRange:rect:", a3, a4.location, a4.length, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
  return v6;
}

- (void)p_updateMarginNoteForCachedAnnotation:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_updateMarginNoteForCachedAnnotation:](&v4, "p_updateMarginNoteForCachedAnnotation:", a3);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)p_updateMarginNoteForHighlight:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  -[THWPHighlightControllerAccessibility p_updateMarginNoteForHighlight:](&v4, "p_updateMarginNoteForHighlight:", a3);
  -[THWPHighlightControllerAccessibility _thaxAnnotationsDidChange](self, "_thaxAnnotationsDidChange");
}

- (void)_thaxAnnotationsDidChange
{
  void *v3;
  Class v4;

  v3 = (void *)objc_opt_class(THWPRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[THWPHighlightControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("parentRep")), 0, 0);
  -[objc_class thaxHighlightsDidChange](v4, "thaxHighlightsDidChange");
}

- (unint64_t)thaxAnnotationCacheVersion
{
  return self->_thaxAnnotationCacheVersion;
}

@end
