@implementation ODITitlePoint

- (ODITitlePoint)initWithTitlePointPresentationName:(id)a3 state:(id)a4
{
  id v7;
  ODITitlePoint *v8;
  ODITitlePoint *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ODITitlePoint;
  v8 = -[ODIHorizonalList3 initWithState:](&v11, sel_initWithState_, a4);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->mTitlePointPresentationName, a3);

  return v9;
}

- (void)mapRoofStyleFromPoint:(id)a3 shape:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", self->mTitlePointPresentationName, 2);
  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v7, v6, self->super.mState);

}

- (void)mapOnePillarStyleFromPoint:(id)a3 shape:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", self->mTitlePointPresentationName, 2);
  objc_msgSend(v9, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v8, v6, self->super.mState);
}

- (void)mapBaseStyleFromPoint:(id)a3 shape:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[ODIState setPresentationName:forPointType:](self->super.mState, "setPresentationName:forPointType:", self->mTitlePointPresentationName, 2);
  objc_msgSend(v9, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectAtIndex:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v8, v6, self->super.mState);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mTitlePointPresentationName, 0);
}

@end
