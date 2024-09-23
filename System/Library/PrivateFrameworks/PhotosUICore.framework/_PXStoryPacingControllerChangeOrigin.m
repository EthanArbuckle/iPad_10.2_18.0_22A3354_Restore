@implementation _PXStoryPacingControllerChangeOrigin

- (_PXStoryPacingControllerChangeOrigin)initWithDescription:(id)a3
{
  id v5;
  _PXStoryPacingControllerChangeOrigin *v6;
  _PXStoryPacingControllerChangeOrigin *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryPacingControllerChangeOrigin;
  v6 = -[_PXStoryPacingControllerChangeOrigin init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_description, a3);

  return v7;
}

- (id)description
{
  return self->_description;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_description, 0);
}

@end
