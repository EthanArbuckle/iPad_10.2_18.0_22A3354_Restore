@implementation VIImageRegion

- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domainInfo:(id)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  VIImageRegion *v10;
  VIImageRegion *v11;
  uint64_t v12;
  NSArray *domainInfo;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)VIImageRegion;
  v10 = -[VIImageRegion init](&v15, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_regionOfInterest.origin.x = x;
    v10->_regionOfInterest.origin.y = y;
    v10->_regionOfInterest.size.width = width;
    v10->_regionOfInterest.size.height = height;
    v12 = objc_msgSend(v9, "copy");
    domainInfo = v11->_domainInfo;
    v11->_domainInfo = (NSArray *)v12;

  }
  return v11;
}

- (VIImageRegion)initWithRegionOfInterest:(CGRect)a3 domains:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v9;
  VIImageRegion *v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  VIImageDomainInfoFromKeys(a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](self, "initWithRegionOfInterest:domainInfo:", v9, x, y, width, height);

  return v10;
}

+ (id)regionForEntireImageWithDomains:(id)a3
{
  void *v3;
  VIImageRegion *v4;
  VIImageRegion *v5;

  VIImageDomainInfoFromKeys(a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [VIImageRegion alloc];
  v5 = -[VIImageRegion initWithRegionOfInterest:domainInfo:](v4, "initWithRegionOfInterest:domainInfo:", v3, *(double *)&VIIdentityRect, unk_1EFEA9B60, *(double *)&qword_1EFEA9B68, unk_1EFEA9B70);

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  VIImageRegion *v4;
  VIImageRegion *v5;
  VIImageRegion *v6;
  NSArray *domainInfo;
  void *v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  BOOL v13;
  CGRect v15;

  v4 = (VIImageRegion *)a3;
  if (v4 == self)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    domainInfo = self->_domainInfo;
    -[VIImageRegion domainInfo](v6, "domainInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (VIObjectIsEqual((unint64_t)domainInfo, (uint64_t)v8))
    {
      -[VIImageRegion regionOfInterest](v6, "regionOfInterest");
      v15.origin.x = v9;
      v15.origin.y = v10;
      v15.size.width = v11;
      v15.size.height = v12;
      v13 = CGRectEqualToRect(self->_regionOfInterest, v15);
    }
    else
    {
      v13 = 0;
    }

  }
  return v13;
}

- (unint64_t)hash
{
  uint64_t v3;
  double x;
  double y;
  double height;
  double width;
  double v8;
  long double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  double v16;
  long double v17;
  double v18;
  double v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  double v24;
  long double v25;
  double v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  long double v33;
  double v34;
  double v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;

  v3 = -[NSArray hash](self->_domainInfo, "hash");
  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  v8 = -x;
  if (x >= 0.0)
    v8 = self->_regionOfInterest.origin.x;
  v9 = floor(v8 + 0.5);
  v10 = (v8 - v9) * 1.84467441e19;
  v11 = fmod(v9, 1.84467441e19);
  v12 = 2654435761u * (unint64_t)v11;
  v13 = v12 + (unint64_t)v10;
  if (v10 <= 0.0)
    v13 = 2654435761u * (unint64_t)v11;
  v14 = v12 - (unint64_t)fabs(v10);
  if (v10 < 0.0)
    v15 = v14;
  else
    v15 = v13;
  if (y >= 0.0)
    v16 = y;
  else
    v16 = -y;
  v17 = floor(v16 + 0.5);
  v18 = (v16 - v17) * 1.84467441e19;
  v19 = fmod(v17, 1.84467441e19);
  v20 = 2654435761u * (unint64_t)v19;
  v21 = v20 + (unint64_t)v18;
  if (v18 <= 0.0)
    v21 = 2654435761u * (unint64_t)v19;
  v22 = v20 - (unint64_t)fabs(v18);
  if (v18 < 0.0)
    v23 = v22;
  else
    v23 = v21;
  if (width >= 0.0)
    v24 = width;
  else
    v24 = -width;
  v25 = floor(v24 + 0.5);
  v26 = (v24 - v25) * 1.84467441e19;
  v27 = fmod(v25, 1.84467441e19);
  v28 = 2654435761u * (unint64_t)v27;
  v29 = v28 + (unint64_t)v26;
  if (v26 <= 0.0)
    v29 = 2654435761u * (unint64_t)v27;
  v30 = v28 - (unint64_t)fabs(v26);
  if (v26 < 0.0)
    v31 = v30;
  else
    v31 = v29;
  if (height >= 0.0)
    v32 = height;
  else
    v32 = -height;
  v33 = floor(v32 + 0.5);
  v34 = (v32 - v33) * 1.84467441e19;
  v35 = fmod(v33, 1.84467441e19);
  v36 = 2654435761u * (unint64_t)v35;
  v37 = v36 + (unint64_t)v34;
  if (v34 <= 0.0)
    v37 = 2654435761u * (unint64_t)v35;
  v38 = v36 - (unint64_t)fabs(v34);
  if (v34 >= 0.0)
    v38 = v37;
  return v15 ^ v3 ^ v23 ^ v31 ^ v38;
}

- (CGRect)regionOfInterest
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_regionOfInterest.origin.x;
  y = self->_regionOfInterest.origin.y;
  width = self->_regionOfInterest.size.width;
  height = self->_regionOfInterest.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (NSArray)domainInfo
{
  return self->_domainInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainInfo, 0);
}

@end
