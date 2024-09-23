@implementation TSAccessibilityGroupButtonElement

- (TSAccessibilityGroupButtonElement)initWithChildren:(id)a3 andParent:(id)a4
{
  TSAccessibilityGroupButtonElement *v5;
  TSAccessibilityGroupButtonElement *v6;

  v5 = -[TSAccessibilityElement initWithAccessibilityParent:](self, "initWithAccessibilityParent:", a4);
  v6 = v5;
  if (v5)
    -[TSAccessibilityGroupButtonElement setChildren:](v5, "setChildren:", a3);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[TSAccessibilityGroupButtonElement setChildren:](self, "setChildren:", 0);
  -[TSAccessibilityGroupButtonElement setAccessibilityDescription:](self, "setAccessibilityDescription:", 0);
  -[TSAccessibilityGroupButtonElement setAccessibilityHelp:](self, "setAccessibilityHelp:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSAccessibilityGroupButtonElement;
  -[TSAccessibilityGroupButtonElement dealloc](&v3, "dealloc");
}

- (CGRect)boundingFrameInScreenCoordinates
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[TSAccessibilityElement parent](self, "parent");
  -[TSAccessibilityGroupButtonElement _boundingFrame](self, "_boundingFrame");
  objc_msgSend(v3, "tsaxFrameFromBounds:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (CGRect)_boundingFrame
{
  CGFloat y;
  CGFloat x;
  CGFloat height;
  CGFloat width;
  NSArray *v6;
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
  v6 = -[TSAccessibilityGroupButtonElement children](self, "children", 0);
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), "tsaxCGRectValueForKey:", CFSTR("frame"));
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
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
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

- (NSString)accessibilityDescription
{
  return self->_accessibilityDescription;
}

- (void)setAccessibilityDescription:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)accessibilityHelp
{
  return self->_accessibilityHelp;
}

- (void)setAccessibilityHelp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (id)childRespondingToPress
{
  return self->_childRespondingToPress;
}

- (void)setChildRespondingToPress:(id)a3
{
  self->_childRespondingToPress = a3;
}

@end
