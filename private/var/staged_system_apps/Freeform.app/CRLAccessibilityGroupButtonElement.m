@implementation CRLAccessibilityGroupButtonElement

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[CRLAccessibilityGroupButtonElement boundingFrameInScreenCoordinates](self, "boundingFrameInScreenCoordinates");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)CRLAccessibilityGroupButtonElement;
  v3 = -[CRLAccessibilityGroupButtonElement accessibilityTraits](&v14, "accessibilityTraits");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement children](self, "children", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v3 |= (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v8), "accessibilityTraits");
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)accessibilityHint
{
  return -[CRLAccessibilityGroupButtonElement hint](self, "hint");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement childRespondingToPress](self, "childRespondingToPress"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement childRespondingToPress](self, "childRespondingToPress"));
    v5 = objc_msgSend(v4, "accessibilityActivate");
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement children](self, "children"));
    v7 = objc_msgSend(v6, "count");

    if (!v7)
      return 0;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement children](self, "children"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", 0));
    v5 = objc_msgSend(v8, "accessibilityActivate");

  }
  return v5;
}

- (CRLAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4
{
  id v6;
  CRLAccessibilityGroupButtonElement *v7;
  CRLAccessibilityGroupButtonElement *v8;

  v6 = a3;
  v7 = -[CRLAccessibilityElement initWithAccessibilityParent:](self, "initWithAccessibilityParent:", a4);
  v8 = v7;
  if (v7)
    -[CRLAccessibilityGroupButtonElement setChildren:](v7, "setChildren:", v6);

  return v8;
}

- (CGRect)boundingFrameInScreenCoordinates
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityElement parent](self, "parent"));
  -[CRLAccessibilityGroupButtonElement _boundingFrame](self, "_boundingFrame");
  objc_msgSend(v3, "crlaxFrameFromBounds:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)_boundingFrame
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  CGRect v24;
  CGRect v25;
  CGRect result;
  CGRect v27;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLAccessibilityGroupButtonElement children](self, "children", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "crlaxCGRectValueForKey:", CFSTR("frame"));
        v27.origin.x = v11;
        v27.origin.y = v12;
        v27.size.width = v13;
        v27.size.height = v14;
        v24.origin.x = x;
        v24.origin.y = y;
        v24.size.width = width;
        v24.size.height = height;
        v25 = CGRectUnion(v24, v27);
        x = v25.origin.x;
        y = v25.origin.y;
        width = v25.size.width;
        height = v25.size.height;
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  v15 = x;
  v16 = y;
  v17 = width;
  v18 = height;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)hint
{
  return self->_hint;
}

- (void)setHint:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)childRespondingToPress
{
  return objc_loadWeakRetained(&self->_childRespondingToPress);
}

- (void)setChildRespondingToPress:(id)a3
{
  objc_storeWeak(&self->_childRespondingToPress, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_childRespondingToPress);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_hint, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end
