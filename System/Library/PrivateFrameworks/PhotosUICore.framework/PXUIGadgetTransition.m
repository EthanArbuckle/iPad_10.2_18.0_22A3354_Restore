@implementation PXUIGadgetTransition

- (PXUIGadgetTransition)initWithOneUpPresentation:(id)a3 gridPresentation:(id)a4
{
  id v7;
  id v8;
  PXUIGadgetTransition *v9;
  PXUIGadgetTransition *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXUIGadgetTransition;
  v9 = -[PXUIGadgetTransition init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_oneUpPresentation, a3);
    objc_storeStrong((id *)&v10->_gridPresentation, a4);
  }

  return v10;
}

- (PXOneUpPresentation)oneUpPresentation
{
  return self->_oneUpPresentation;
}

- (PXGridPresentation)gridPresentation
{
  return self->_gridPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gridPresentation, 0);
  objc_storeStrong((id *)&self->_oneUpPresentation, 0);
}

@end
