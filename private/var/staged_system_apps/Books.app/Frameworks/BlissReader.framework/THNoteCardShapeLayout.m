@implementation THNoteCardShapeLayout

- (unsigned)textLayoutShouldIgnoreEquationAlignment:(id)a3
{
  uint64_t v4;

  v4 = objc_opt_class(THNoteCardShapeInfo);
  return objc_msgSend((id)TSUCheckedDynamicCast(v4, -[THNoteCardShapeLayout info](self, "info")), "ignoreEquationAlignment");
}

- (CGRect)frameForCulling
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  objc_super v24;
  _BYTE v25[128];
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  v24.receiver = self;
  v24.super_class = (Class)THNoteCardShapeLayout;
  -[THNoteCardShapeLayout frameForCulling](&v24, "frameForCulling");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  v11 = objc_msgSend(-[THNoteCardShapeLayout containedLayout](self, "containedLayout"), "children");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), "frameForCulling");
        v29.origin.x = x;
        v29.origin.y = y;
        v29.size.width = width;
        v29.size.height = height;
        v27 = CGRectUnion(v26, v29);
        x = v27.origin.x;
        y = v27.origin.y;
        width = v27.size.width;
        height = v27.size.height;
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v13);
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (unsigned)naturalAlignmentForTextLayout:(id)a3
{
  return (char *)-[UIApplication userInterfaceLayoutDirection](+[UIApplication sharedApplication](UIApplication, "sharedApplication", a3), "userInterfaceLayoutDirection") == (char *)&dword_0 + 1;
}

@end
