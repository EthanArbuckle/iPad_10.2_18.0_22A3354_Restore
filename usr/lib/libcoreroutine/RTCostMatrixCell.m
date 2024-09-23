@implementation RTCostMatrixCell

- (RTCostMatrixCell)initWithDistance:(double)a3 cellIndex:(id)a4
{
  id v6;
  RTCostMatrixCell *v7;
  RTCostMatrixCell *v8;
  RTCostMatrixCell *v9;
  NSObject *v10;
  objc_super v12;
  uint8_t buf[16];

  v6 = a4;
  if (v6)
  {
    v12.receiver = self;
    v12.super_class = (Class)RTCostMatrixCell;
    v7 = -[RTCostMatrixCell init](&v12, sel_init);
    v8 = v7;
    if (v7)
    {
      -[RTCostMatrixCell setDistance:](v7, "setDistance:", a3);
      -[RTCostMatrixCell setCellIndex:](v8, "setCellIndex:", v6);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: cellIndex", buf, 2u);
    }

    v9 = 0;
  }

  return v9;
}

- (double)distance
{
  return self->_distance;
}

- (void)setDistance:(double)a3
{
  self->_distance = a3;
}

- (RTCellIndex)cellIndex
{
  return self->_cellIndex;
}

- (void)setCellIndex:(id)a3
{
  objc_storeStrong((id *)&self->_cellIndex, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellIndex, 0);
}

@end
