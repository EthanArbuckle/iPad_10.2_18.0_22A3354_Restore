@implementation VGExpressionIsNeutralFilterLegacy

- (VGExpressionIsNeutralFilterLegacy)init
{
  VGExpressionIsNeutralFilterLegacy *v2;
  vg::frame_selection::VGExpressionIsNeutralFilter *v3;
  VGExpressionIsNeutralFilter *value;
  VGExpressionIsNeutralFilterLegacy *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VGExpressionIsNeutralFilterLegacy;
  v2 = -[VGExpressionIsNeutralFilterLegacy init](&v7, sel_init);
  if (v2)
  {
    v3 = (vg::frame_selection::VGExpressionIsNeutralFilter *)operator new();
    vg::frame_selection::VGExpressionIsNeutralFilter::VGExpressionIsNeutralFilter(v3);
    value = v2->_expressionIsNeutralFilter.__ptr_.__value_;
    v2->_expressionIsNeutralFilter.__ptr_.__value_ = (VGExpressionIsNeutralFilter *)v3;
    if (value)
      (*(void (**)(VGExpressionIsNeutralFilter *))(*(_QWORD *)value + 8))(value);
    v5 = v2;
  }

  return v2;
}

- (int)rejectionReason
{
  return 18;
}

- (float)filter:(id)a3
{
  float result;

  (*(void (**)(VGExpressionIsNeutralFilter *, id))(*(_QWORD *)self->_expressionIsNeutralFilter.__ptr_.__value_
                                                            + 16))(self->_expressionIsNeutralFilter.__ptr_.__value_, a3);
  return result;
}

- (void).cxx_destruct
{
  VGExpressionIsNeutralFilter *value;

  value = self->_expressionIsNeutralFilter.__ptr_.__value_;
  self->_expressionIsNeutralFilter.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(VGExpressionIsNeutralFilter *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
