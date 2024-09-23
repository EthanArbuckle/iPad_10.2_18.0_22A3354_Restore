@implementation CRLAccessibilitySummaryContainerElement

- (CRLAccessibilitySummaryContainerElement)initWithAccessibilityContainer:(id)a3 containedElements:(id)a4
{
  id v6;
  CRLAccessibilitySummaryContainerElement *v7;
  NSArray *v8;
  NSArray *containedElements;
  NSArray *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)CRLAccessibilitySummaryContainerElement;
  v7 = -[CRLAccessibilitySummaryContainerElement initWithAccessibilityContainer:](&v20, "initWithAccessibilityContainer:", a3);
  if (v7)
  {
    v8 = (NSArray *)objc_msgSend(v6, "copy");
    containedElements = v7->_containedElements;
    v7->_containedElements = v8;

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v10 = v7->_containedElements;
    v11 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v14), "setIsAccessibilityElement:", 0, (_QWORD)v16);
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = -[NSArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v12);
    }

  }
  return v7;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityElements
{
  return 0;
}

- (CGRect)accessibilityFrame
{
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat x;
  void *i;
  void *v14;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect result;
  CGRect v46;
  CGRect v47;

  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilitySummaryContainerElement containedElements](self, "containedElements"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v38;
    v36 = CGRectZero.origin.y;
    v34 = CGRectZero.size.height;
    v35 = CGRectZero.size.width;
    v9 = height;
    v10 = width;
    v11 = y;
    x = CGRectNull.origin.x;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v38 != v8)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)i);
        if (CRLAccessibilityShouldPerformValidationChecks())
        {
          objc_msgSend(v14, "accessibilityFrame");
          v46.origin.y = v36;
          v46.origin.x = CGRectZero.origin.x;
          v46.size.height = v34;
          v46.size.width = v35;
          if (CGRectEqualToRect(v42, v46))
          {
            ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
            if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Found CGRectZero AX frame for contained element, this is probably a bug"), v16, v17, v18, v19, v20, *(uint64_t *)&v34))abort();
          }
        }
        v43.origin.x = x;
        v43.origin.y = v11;
        v43.size.width = v10;
        v43.size.height = v9;
        v47.origin.x = CGRectNull.origin.x;
        v47.origin.y = y;
        v47.size.width = width;
        v47.size.height = height;
        v21 = CGRectEqualToRect(v43, v47);
        objc_msgSend(v14, "accessibilityFrame");
        v26 = v22;
        v27 = v23;
        v28 = v24;
        v29 = v25;
        if (!v21)
        {
          v44.origin.x = x;
          v44.origin.y = v11;
          v44.size.width = v10;
          v44.size.height = v9;
          *(CGRect *)&v22 = CGRectUnion(v44, *(CGRect *)&v26);
        }
        x = v22;
        v11 = v23;
        v10 = v24;
        v9 = v25;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
    }
    while (v7);
  }
  else
  {
    v9 = height;
    v10 = width;
    v11 = y;
    x = CGRectNull.origin.x;
  }

  v30 = x;
  v31 = v11;
  v32 = v10;
  v33 = v9;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilitySummaryContainerElement containedElements](self, "containedElements"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v21 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v8), "accessibilityLabel"));
        objc_msgSend(v3, "crlaxAddObjectIfNotNil:", v9);

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  v17 = __CRLAccessibilityStringForArraysAndVariables(v3, v10, v11, v12, v13, v14, v15, v16, (uint64_t)CFSTR("__CRLAccessibilityStringForArraysAndVariablesSentinel"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);

  return v18;
}

- (NSArray)containedElements
{
  return self->_containedElements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containedElements, 0);
}

@end
