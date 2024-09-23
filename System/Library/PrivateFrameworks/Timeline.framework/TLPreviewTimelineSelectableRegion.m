@implementation TLPreviewTimelineSelectableRegion

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (TLPreviewTimelineSelectableRegion)initWithPath:(id)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v9;
  TLPreviewTimelineSelectableRegion *v10;
  uint64_t v11;
  NSString *path;
  objc_super v14;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TLPreviewTimelineSelectableRegion;
  v10 = -[TLPreviewTimelineSelectableRegion init](&v14, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v9, "copy");
    path = v10->_path;
    v10->_path = (NSString *)v11;

    v10->_rect.origin.x = x;
    v10->_rect.origin.y = y;
    v10->_rect.size.width = width;
    v10->_rect.size.height = height;
  }

  return v10;
}

- (TLPreviewTimelineSelectableRegion)initWithCoder:(id)a3
{
  id v4;
  TLPreviewTimelineSelectableRegion *v5;
  uint64_t v6;
  NSString *path;

  v4 = a3;
  v5 = -[TLPreviewTimelineSelectableRegion init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("path"));
    v6 = objc_claimAutoreleasedReturnValue();
    path = v5->_path;
    v5->_path = (NSString *)v6;

    v5->_rect.origin = 0u;
    v5->_rect.size = 0u;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  -[TLPreviewTimelineSelectableRegion path](self, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLPreviewTimelineSelectableRegion rect](self, "rect");
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("path"), v6, v7, v8, v9);
  objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", &v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v10, CFSTR("rect"));

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[TLPreviewTimelineSelectableRegion path](self, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TLPreviewTimelineSelectableRegion path](self, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5 == v6)
    {
      v9 = 1;
    }
    else
    {
      objc_msgSend(v4, "path");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[TLPreviewTimelineSelectableRegion path](self, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqual:", v8);

    }
    -[TLPreviewTimelineSelectableRegion rect](self, "rect");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    objc_msgSend(v4, "rect");
    if (v22 == v12)
    {
      v23 = v20 == v16;
      if (v21 != v18)
        v23 = 0;
      if (v19 != v14)
        v23 = 0;
    }
    else
    {
      v23 = 0;
    }
    v10 = v9 & v23;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  TLPreviewTimelineSelectableRegion *v9;

  -[TLPreviewTimelineSelectableRegion path](self, "path", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLPreviewTimelineSelectableRegion rect](self, "rect");
  v9 = -[TLPreviewTimelineSelectableRegion initWithPath:rect:]([TLPreviewTimelineSelectableRegion alloc], "initWithPath:rect:", v4, v5, v6, v7, v8);

  return v9;
}

- (NSString)path
{
  return self->_path;
}

- (CGRect)rect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_rect.origin.x;
  y = self->_rect.origin.y;
  width = self->_rect.size.width;
  height = self->_rect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
