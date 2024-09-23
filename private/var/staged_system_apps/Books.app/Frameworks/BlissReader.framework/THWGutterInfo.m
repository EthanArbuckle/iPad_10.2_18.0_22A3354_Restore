@implementation THWGutterInfo

- (void)dealloc
{
  objc_super v3;

  -[THWGutterInfo setAssociatedInfo:](self, "setAssociatedInfo:", 0);
  -[THWGutterInfo setStageInfo:](self, "setStageInfo:", 0);
  -[THWGutterInfo setBackgroundShape:](self, "setBackgroundShape:", 0);
  -[THWGutterInfo setTitleShape:](self, "setTitleShape:", 0);
  -[THWGutterInfo setExpandedDrawableToPresent:](self, "setExpandedDrawableToPresent:", 0);
  v3.receiver = self;
  v3.super_class = (Class)THWGutterInfo;
  -[THWGutterInfo dealloc](&v3, "dealloc");
}

- (Class)layoutClass
{
  return (Class)objc_opt_class(THWGutterLayout, a2);
}

- (CGRect)stageFrame
{
  id v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  v2 = -[TSDDrawableInfo geometry](-[THWGutterInfo stageInfo](self, "stageInfo"), "geometry");
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "position");
    v5 = v4;
    v7 = v6;
    v8 = objc_msgSend(v3, "size");
    v11 = TSDRectWithOriginAndSize(v8, v5, v7, v9, v10);
    x = TSDRoundedRectForMainScreen(v11, v12, v13, v14);
  }
  else
  {
    x = CGRectNull.origin.x;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
  }
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (Class)repClass
{
  return (Class)objc_opt_class(THWGutterRep, a2);
}

- (int64_t)gutterOrderCompare:(id)a3
{
  unint64_t v4;
  id v5;
  int64_t v6;

  v4 = -[THWGutterInfo gutterOrder](self, "gutterOrder");
  v5 = objc_msgSend(a3, "gutterOrder");
  v6 = -1;
  if (v4 >= (unint64_t)v5)
    v6 = 1;
  if ((id)v4 == v5)
    return 0;
  else
    return v6;
}

- (TSWPopUpInfo)popUpInfo
{
  return (TSWPopUpInfo *)objc_msgSend((id)TSUProtocolCast(&OBJC_PROTOCOL___TSWPopUpOwner, -[THWGutterInfo associatedInfo](self, "associatedInfo")), "popUpInfo");
}

- (TSDInfo)associatedInfo
{
  return self->mAssociatedInfo;
}

- (void)setAssociatedInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 32);
}

- (TSDInfo)expandedDrawableToPresent
{
  return self->mExpandedDrawableToPresent;
}

- (void)setExpandedDrawableToPresent:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (TSDDrawableInfo)stageInfo
{
  return self->mStageInfo;
}

- (void)setStageInfo:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 48);
}

- (TSDShapeInfo)backgroundShape
{
  return self->mBackgroundShape;
}

- (void)setBackgroundShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 56);
}

- (TSWPShapeInfo)titleShape
{
  return self->mTitleShape;
}

- (void)setTitleShape:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 64);
}

- (unint64_t)gutterOrder
{
  return self->mGutterOrder;
}

- (void)setGutterOrder:(unint64_t)a3
{
  self->mGutterOrder = a3;
}

@end
