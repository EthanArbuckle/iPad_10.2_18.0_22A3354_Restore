@implementation _LookAroundFloatingButtonsView

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10074B118;
  v21 = sub_10074B128;
  v22 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_LookAroundFloatingButtonsView subviews](self, "subviews"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10074B130;
  v12[3] = &unk_1011C56D0;
  v15 = x;
  v16 = y;
  v12[4] = self;
  v9 = v7;
  v13 = v9;
  v14 = &v17;
  objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v12);

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

@end
