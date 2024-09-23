@implementation ODIHorizontalProcess3

- (void)mapStyleFromPoint:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleForLabelName:point:shape:state:](ODIDrawable, "mapStyleForLabelName:point:shape:state:", CFSTR("node1"), a3, a4, self->super.mState);
}

- (void)mapStyleFromTransition:(id)a3 shape:(id)a4
{
  +[ODIDrawable mapStyleForLabelName:point:shape:state:](ODIDrawable, "mapStyleForLabelName:point:shape:state:", CFSTR("sibTrans2D1"), a3, a4, self->super.mState);
}

@end
