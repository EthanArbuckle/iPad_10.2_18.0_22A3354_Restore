@implementation ODIAccentedImageLinear

- (void)mapPoint:(id)a3 bounds:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v16.receiver = self;
  v16.super_class = (Class)ODIAccentedImageLinear;
  -[ODIImageLinear mapPoint:bounds:](&v16, sel_mapPoint_bounds_, v9, x, y, width, height);
  if (!-[ODIState pointIndex](self->super.super.mState, "pointIndex"))
  {
    -[ODIState group](self->super.super.mState, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "childCount");

    if (v11 >= 2)
    {
      -[ODIState group](self->super.super.mState, "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[ODIState group](self->super.super.mState, "group");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "childAtIndex:", objc_msgSend(v13, "childCount") - 2);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "siblingTransition");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[ODIDrawable mapStyleFromPoint:shape:state:](ODIDrawable, "mapStyleFromPoint:shape:state:", v15, v14, self->super.super.mState);

    }
  }

}

@end
