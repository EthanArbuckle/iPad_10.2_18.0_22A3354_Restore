@implementation CRLEditorControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLEditorController");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLEditorControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLSelectionPathAccessibility)crlaxSelectionPath
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selectionPath"));

  objc_opt_class(CRLSelectionPathAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLSelectionPathAccessibility *)v8;
}

- (void)crlaxSetSelectionPath:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1002EBA40;
  v4[3] = &unk_10122D3D8;
  v4[4] = self;
  v3 = a3;
  v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();

}

- (void)crlaxSetSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  id v5;
  _QWORD v6[5];
  id v7;
  unint64_t v8;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1002EBAD0;
  v6[3] = &unk_10122EC90;
  v6[4] = self;
  v5 = a3;
  v7 = v5;
  v8 = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();

}

- (id)crlaxTextInputEditor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputEditor"));

  return v3;
}

- (NSArray)crlaxCurrentEditors
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLEditorControllerAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentEditors"));

  objc_opt_class(NSArray, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (NSArray *)v8;
}

- (id)crlaxEditorForEditAction:(SEL)a3 withSender:(id)a4
{
  id v4;
  id v5;
  _QWORD v7[5];
  id v8;
  uint64_t *v9;
  SEL v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1002EBC88;
  v15 = sub_1002EBC98;
  v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002EBCA0;
  v7[3] = &unk_10124EFC8;
  v9 = &v11;
  v10 = a3;
  v7[4] = self;
  v4 = a4;
  v8 = v4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();

  v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

@end
