@implementation VIRegionOfInterestResult

- (VIRegionOfInterestResult)initWithNormalizedBoundingBox:(CGRect)a3 resultItems:(id)a4 searchSections:(id)a5
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v11;
  id v12;
  VIRegionOfInterestResult *v13;
  VIRegionOfInterestResult *v14;
  uint64_t v15;
  NSArray *resultItems;
  uint64_t v17;
  NSArray *searchSections;
  objc_super v20;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v11 = a4;
  v12 = a5;
  v20.receiver = self;
  v20.super_class = (Class)VIRegionOfInterestResult;
  v13 = -[VIRegionOfInterestResult init](&v20, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_normalizedBoundingBox.origin.x = x;
    v13->_normalizedBoundingBox.origin.y = y;
    v13->_normalizedBoundingBox.size.width = width;
    v13->_normalizedBoundingBox.size.height = height;
    v15 = objc_msgSend(v11, "copy");
    resultItems = v14->_resultItems;
    v14->_resultItems = (NSArray *)v15;

    v17 = objc_msgSend(v12, "copy");
    searchSections = v14->_searchSections;
    v14->_searchSections = (NSArray *)v17;

  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  VIRegionOfInterestResult *v4;
  VIRegionOfInterestResult *v5;
  VIRegionOfInterestResult *v6;
  NSArray *resultItems;
  void *v8;
  NSArray *searchSections;
  void *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  BOOL v15;
  CGRect v17;

  v4 = (VIRegionOfInterestResult *)a3;
  if (v4 == self)
  {
    v15 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    resultItems = self->_resultItems;
    -[VIRegionOfInterestResult resultItems](v6, "resultItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)resultItems, (uint64_t)v8))
    {
      searchSections = self->_searchSections;
      -[VIRegionOfInterestResult searchSections](v6, "searchSections");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (VIObjectIsEqual((unint64_t)searchSections, (uint64_t)v10))
      {
        -[VIRegionOfInterestResult normalizedBoundingBox](v6, "normalizedBoundingBox");
        v17.origin.x = v11;
        v17.origin.y = v12;
        v17.size.width = v13;
        v17.size.height = v14;
        v15 = CGRectEqualToRect(self->_normalizedBoundingBox, v17);
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      v15 = 0;
    }

  }
  return v15;
}

- (unint64_t)hash
{
  uint64_t v3;
  uint64_t v4;
  double x;
  double y;
  double height;
  double width;
  double v9;
  long double v10;
  double v11;
  double v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  double v17;
  long double v18;
  double v19;
  double v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  double v25;
  long double v26;
  double v27;
  double v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  double v33;
  long double v34;
  double v35;
  double v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v3 = -[NSArray hash](self->_resultItems, "hash");
  v4 = -[NSArray hash](self->_searchSections, "hash");
  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  v9 = -x;
  if (x >= 0.0)
    v9 = self->_normalizedBoundingBox.origin.x;
  v10 = floor(v9 + 0.5);
  v11 = (v9 - v10) * 1.84467441e19;
  v12 = fmod(v10, 1.84467441e19);
  v13 = 2654435761u * (unint64_t)v12;
  v14 = v13 + (unint64_t)v11;
  if (v11 <= 0.0)
    v14 = 2654435761u * (unint64_t)v12;
  v15 = v13 - (unint64_t)fabs(v11);
  if (v11 < 0.0)
    v16 = v15;
  else
    v16 = v14;
  if (y >= 0.0)
    v17 = y;
  else
    v17 = -y;
  v18 = floor(v17 + 0.5);
  v19 = (v17 - v18) * 1.84467441e19;
  v20 = fmod(v18, 1.84467441e19);
  v21 = 2654435761u * (unint64_t)v20;
  v22 = v21 + (unint64_t)v19;
  if (v19 <= 0.0)
    v22 = 2654435761u * (unint64_t)v20;
  v23 = v21 - (unint64_t)fabs(v19);
  if (v19 < 0.0)
    v24 = v23;
  else
    v24 = v22;
  if (width >= 0.0)
    v25 = width;
  else
    v25 = -width;
  v26 = floor(v25 + 0.5);
  v27 = (v25 - v26) * 1.84467441e19;
  v28 = fmod(v26, 1.84467441e19);
  v29 = 2654435761u * (unint64_t)v28;
  v30 = v29 + (unint64_t)v27;
  if (v27 <= 0.0)
    v30 = 2654435761u * (unint64_t)v28;
  v31 = v29 - (unint64_t)fabs(v27);
  if (v27 < 0.0)
    v32 = v31;
  else
    v32 = v30;
  if (height >= 0.0)
    v33 = height;
  else
    v33 = -height;
  v34 = floor(v33 + 0.5);
  v35 = (v33 - v34) * 1.84467441e19;
  v36 = fmod(v34, 1.84467441e19);
  v37 = 2654435761u * (unint64_t)v36;
  v38 = v37 + (unint64_t)v35;
  if (v35 <= 0.0)
    v38 = 2654435761u * (unint64_t)v36;
  v39 = v37 - (unint64_t)fabs(v35);
  if (v35 >= 0.0)
    v39 = v38;
  return v4 ^ v3 ^ v32 ^ v16 ^ v24 ^ v39;
}

- (CGRect)normalizedBoundingBox
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_normalizedBoundingBox.origin.x;
  y = self->_normalizedBoundingBox.origin.y;
  width = self->_normalizedBoundingBox.size.width;
  height = self->_normalizedBoundingBox.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)resultItems
{
  return self->_resultItems;
}

- (NSArray)searchSections
{
  return self->_searchSections;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchSections, 0);
  objc_storeStrong((id *)&self->_resultItems, 0);
}

@end
