@implementation CRTableCellGroupRegion

- (CRTableCellGroupRegion)initWithBoundingQuad:(id)a3 layoutDirection:(unint64_t)a4 subregions:(id)a5 rows:(_NSRange)a6 columns:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  CRTableCellGroupRegion *result;
  objc_super v10;

  length = a6.length;
  location = a6.location;
  v10.receiver = self;
  v10.super_class = (Class)CRTableCellGroupRegion;
  result = -[CRGroupRegion initWithBoundingQuad:layoutDirection:subregions:](&v10, sel_initWithBoundingQuad_layoutDirection_subregions_, a3, a4, a5);
  if (result)
  {
    result->_rows.location = location;
    result->_rows.length = length;
    result->_columns = a7;
  }
  return result;
}

- (_NSRange)rows
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_rows, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (_NSRange)columns
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_columns, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

@end
