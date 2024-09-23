@implementation UITextSelectionRectCustomHandleInfo

- (CGPoint)bottomLeft
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topLeft
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)bottomRight
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (CGPoint)topRight
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *MEMORY[0x1E0C9D538];
  v3 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  result.y = v3;
  result.x = v2;
  return result;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[UITextSelectionRectCustomHandleInfo topLeft](self, "topLeft");
  v5 = v4;
  -[UITextSelectionRectCustomHandleInfo topLeft](self, "topLeft");
  v7 = v6;
  -[UITextSelectionRectCustomHandleInfo topRight](self, "topRight");
  v9 = v8;
  -[UITextSelectionRectCustomHandleInfo topRight](self, "topRight");
  v11 = v10;
  -[UITextSelectionRectCustomHandleInfo bottomLeft](self, "bottomLeft");
  v13 = v12;
  -[UITextSelectionRectCustomHandleInfo bottomLeft](self, "bottomLeft");
  v15 = v14;
  -[UITextSelectionRectCustomHandleInfo bottomRight](self, "bottomRight");
  v17 = v16;
  -[UITextSelectionRectCustomHandleInfo bottomRight](self, "bottomRight");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("topLeft    : %.2f %.2f \ntopRight   : %.2f %.2f \nbottomLeft : %.2f %.2f \nbottomRight: %.2f %.2f"), v5, v7, v9, v11, v13, v15, v17, v18);
}

- (BOOL)isEqual:(id)a3
{
  UITextSelectionRectCustomHandleInfo *v4;
  UITextSelectionRectCustomHandleInfo *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  BOOL v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v4 = (UITextSelectionRectCustomHandleInfo *)a3;
  if (self == v4)
  {
    v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[UITextSelectionRectCustomHandleInfo bottomLeft](self, "bottomLeft");
      v7 = v6;
      v9 = v8;
      -[UITextSelectionRectCustomHandleInfo bottomLeft](v5, "bottomLeft");
      if (v7 == v11 && v9 == v10)
      {
        -[UITextSelectionRectCustomHandleInfo topLeft](self, "topLeft");
        v15 = v14;
        v17 = v16;
        -[UITextSelectionRectCustomHandleInfo topLeft](v5, "topLeft");
        v13 = 0;
        if (v15 == v19 && v17 == v18)
        {
          -[UITextSelectionRectCustomHandleInfo bottomRight](self, "bottomRight");
          v21 = v20;
          v23 = v22;
          -[UITextSelectionRectCustomHandleInfo bottomRight](v5, "bottomRight");
          v13 = 0;
          if (v21 == v25 && v23 == v24)
          {
            -[UITextSelectionRectCustomHandleInfo topRight](self, "topRight");
            v27 = v26;
            v29 = v28;
            -[UITextSelectionRectCustomHandleInfo topRight](v5, "topRight");
            v13 = v29 == v31 && v27 == v30;
          }
        }
      }
      else
      {
        v13 = 0;
      }

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
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unint64_t v14;

  v3 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextSelectionRectCustomHandleInfo bottomLeft](self, "bottomLeft");
  objc_msgSend(v3, "valueWithCGPoint:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  v6 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextSelectionRectCustomHandleInfo topLeft](self, "topLeft");
  objc_msgSend(v6, "valueWithCGPoint:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 257 * (257 * v5 + objc_msgSend(v7, "hash"));

  v9 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextSelectionRectCustomHandleInfo bottomRight](self, "bottomRight");
  objc_msgSend(v9, "valueWithCGPoint:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 257 * (v8 + objc_msgSend(v10, "hash"));

  v12 = (void *)MEMORY[0x1E0CB3B18];
  -[UITextSelectionRectCustomHandleInfo topRight](self, "topRight");
  objc_msgSend(v12, "valueWithCGPoint:");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v11 + objc_msgSend(v13, "hash") + 0x1050A0A0501;

  return v14;
}

@end
