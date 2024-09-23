@implementation SBSHomeScreenRectangleSilhouette

- (SBSHomeScreenRectangleSilhouette)initWithFrame:(CGRect)a3 cornerRadius:(double)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  SBSHomeScreenRectangleSilhouette *result;
  objc_super v10;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)SBSHomeScreenRectangleSilhouette;
  result = -[SBSHomeScreenRectangleSilhouette init](&v10, sel_init);
  if (result)
  {
    result->_frame.origin.y = y;
    result->_frame.size.width = width;
    result->_frame.size.height = height;
    result->_cornerRadius = a4;
    result->_frame.origin.x = x;
  }
  return result;
}

- (SBSHomeScreenRectangleSilhouette)init
{
  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0.0);
}

- (BOOL)isEqual:(id)a3
{
  SBSHomeScreenRectangleSilhouette *v4;
  void *v5;
  char isKindOfClass;
  SBSHomeScreenRectangleSilhouette *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  BOOL v23;
  CGRect v25;
  CGRect v26;

  v4 = (SBSHomeScreenRectangleSilhouette *)a3;
  if (self == v4)
  {
    v23 = 1;
  }
  else
  {
    objc_opt_self();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v7 = v4;
      -[SBSHomeScreenRectangleSilhouette frame](self, "frame");
      v9 = v8;
      v11 = v10;
      v13 = v12;
      v15 = v14;
      -[SBSHomeScreenRectangleSilhouette frame](v7, "frame");
      v26.origin.x = v16;
      v26.origin.y = v17;
      v26.size.width = v18;
      v26.size.height = v19;
      v25.origin.x = v9;
      v25.origin.y = v11;
      v25.size.width = v13;
      v25.size.height = v15;
      if (CGRectEqualToRect(v25, v26))
      {
        -[SBSHomeScreenRectangleSilhouette cornerRadius](self, "cornerRadius");
        v21 = v20;
        -[SBSHomeScreenRectangleSilhouette cornerRadius](v7, "cornerRadius");
        v23 = v21 == v22;
      }
      else
      {
        v23 = 0;
      }

    }
    else
    {
      v23 = 0;
    }
  }

  return v23;
}

- (unint64_t)hash
{
  double v3;
  unint64_t v4;
  double v5;
  unint64_t v6;
  double v7;

  -[SBSHomeScreenRectangleSilhouette frame](self, "frame");
  v4 = (unint64_t)v3;
  v6 = (unint64_t)v5;
  -[SBSHomeScreenRectangleSilhouette cornerRadius](self, "cornerRadius");
  return v6 ^ (unint64_t)v7 ^ v4;
}

- (NSString)description
{
  id v3;
  id v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  void *v10;
  SBSHomeScreenRectangleSilhouette *v11;
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0D01750]);
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __47__SBSHomeScreenRectangleSilhouette_description__block_invoke;
  v10 = &unk_1E288D940;
  v11 = self;
  v12 = v3;
  v4 = v3;
  objc_msgSend(v4, "appendProem:block:", self, &v7);
  objc_msgSend(v4, "description", v7, v8, v9, v10, v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

uint64_t __47__SBSHomeScreenRectangleSilhouette_description__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendDescriptionToFormatter:", *(_QWORD *)(a1 + 40));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  -[SBSHomeScreenRectangleSilhouette frame](self, "frame");
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  objc_msgSend(v4, "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("frame"));

  -[SBSHomeScreenRectangleSilhouette cornerRadius](self, "cornerRadius");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cornerRadius"));

}

- (SBSHomeScreenRectangleSilhouette)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;

  v4 = a3;
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", v5, CFSTR("frame"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bs_CGRectValue");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
  v16 = v15;

  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", v8, v10, v12, v14, v16);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[4];

  v4 = (void *)MEMORY[0x1E0CB3B18];
  v5 = a3;
  -[SBSHomeScreenRectangleSilhouette frame](self, "frame");
  v11[0] = v6;
  v11[1] = v7;
  v11[2] = v8;
  v11[3] = v9;
  objc_msgSend(v4, "valueWithBytes:objCType:", v11, "{CGRect={CGPoint=dd}{CGSize=dd}}");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v10, CFSTR("frame"));

  -[SBSHomeScreenRectangleSilhouette cornerRadius](self, "cornerRadius");
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("cornerRadius"));

}

- (SBSHomeScreenRectangleSilhouette)initWithBSXPCCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v4 = a3;
  objc_msgSend(v4, "decodeCGRectForKey:", CFSTR("frame"));
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("cornerRadius"));
  v14 = v13;

  return -[SBSHomeScreenRectangleSilhouette initWithFrame:cornerRadius:](self, "initWithFrame:cornerRadius:", v6, v8, v10, v12, v14);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  id v4;
  id v5;
  id v6;

  v6 = a3;
  -[SBSHomeScreenRectangleSilhouette frame](self, "frame");
  v4 = (id)objc_msgSend(v6, "appendRect:withName:", CFSTR("frame"));
  -[SBSHomeScreenRectangleSilhouette cornerRadius](self, "cornerRadius");
  v5 = (id)objc_msgSend(v6, "appendFloat:withName:", CFSTR("cornerRadius"));

}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_frame.origin.x;
  y = self->_frame.origin.y;
  width = self->_frame.size.width;
  height = self->_frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)cornerRadius
{
  return self->_cornerRadius;
}

@end
