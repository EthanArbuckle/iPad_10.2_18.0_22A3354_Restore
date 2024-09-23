@implementation UIPeripheralHostState

+ (id)stateWithGeometry:(UIPeripheralAnimationGeometry *)a3 inPositionIsDestination:(BOOL)a4
{
  _BOOL8 v4;
  UIPeripheralHostState *v6;
  __int128 v7;
  CGPoint inPosition;
  CGSize size;
  _OWORD v11[7];
  double targetFrameHeightDelta;

  v4 = a4;
  v6 = objc_alloc_init(UIPeripheralHostState);
  v7 = *(_OWORD *)&a3->transform.c;
  v11[4] = *(_OWORD *)&a3->transform.a;
  v11[5] = v7;
  v11[6] = *(_OWORD *)&a3->transform.tx;
  targetFrameHeightDelta = a3->targetFrameHeightDelta;
  inPosition = a3->inPosition;
  v11[0] = a3->outPosition;
  v11[1] = inPosition;
  size = a3->bounds.size;
  v11[2] = a3->bounds.origin;
  v11[3] = size;
  -[UIPeripheralHostState setGeometry:](v6, "setGeometry:", v11);
  -[UIPeripheralHostState setInPositionIsDestination:](v6, "setInPositionIsDestination:", v4);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  -[UIPeripheralHostState setScreenGeometry:](self, "setScreenGeometry:", 0);
  v3.receiver = self;
  v3.super_class = (Class)UIPeripheralHostState;
  -[UIPeripheralHostState dealloc](&v3, sel_dealloc);
}

- (UIPeripheralAnimationGeometry)geometry
{
  __int128 v3;
  CGPoint v4;
  CGSize v5;

  v3 = *(_OWORD *)&self->transform.d;
  *(_OWORD *)&retstr->transform.a = *(_OWORD *)&self->transform.b;
  *(_OWORD *)&retstr->transform.c = v3;
  *(_OWORD *)&retstr->transform.tx = *(_OWORD *)&self->transform.ty;
  retstr->targetFrameHeightDelta = self[1].outPosition.x;
  v4 = *(CGPoint *)&self->inPosition.y;
  retstr->outPosition = *(CGPoint *)&self->outPosition.y;
  retstr->inPosition = v4;
  v5 = *(CGSize *)&self->bounds.size.height;
  retstr->bounds.origin = *(CGPoint *)&self->bounds.origin.y;
  retstr->bounds.size = v5;
  return self;
}

- (void)setGeometry:(UIPeripheralAnimationGeometry *)a3
{
  CGPoint outPosition;
  CGPoint inPosition;
  CGPoint origin;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  outPosition = a3->outPosition;
  inPosition = a3->inPosition;
  origin = a3->bounds.origin;
  self->_geometry.bounds.size = a3->bounds.size;
  self->_geometry.bounds.origin = origin;
  self->_geometry.inPosition = inPosition;
  self->_geometry.outPosition = outPosition;
  v6 = *(_OWORD *)&a3->transform.a;
  v7 = *(_OWORD *)&a3->transform.c;
  v8 = *(_OWORD *)&a3->transform.tx;
  self->_geometry.targetFrameHeightDelta = a3->targetFrameHeightDelta;
  *(_OWORD *)&self->_geometry.transform.tx = v8;
  *(_OWORD *)&self->_geometry.transform.c = v7;
  *(_OWORD *)&self->_geometry.transform.a = v6;
}

- (NSDictionary)screenGeometry
{
  return self->_screenGeometry;
}

- (void)setScreenGeometry:(id)a3
{
  objc_storeStrong((id *)&self->_screenGeometry, a3);
}

- (BOOL)inPositionIsDestination
{
  return self->_inPositionIsDestination;
}

- (void)setInPositionIsDestination:(BOOL)a3
{
  self->_inPositionIsDestination = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_screenGeometry, 0);
}

@end
