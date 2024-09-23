@implementation LipMovementData

- (LipMovementData)initWithBlendshape:(id)a3 andTime:(unint64_t)a4
{
  id v7;
  LipMovementData *v8;
  LipMovementData *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)LipMovementData;
  v8 = -[LipMovementData init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_blendshapes, a3);
    v9->_absMachTime = a4;
  }

  return v9;
}

- (NSArray)blendshapes
{
  return self->_blendshapes;
}

- (unint64_t)absMachTime
{
  return self->_absMachTime;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blendshapes, 0);
}

@end
