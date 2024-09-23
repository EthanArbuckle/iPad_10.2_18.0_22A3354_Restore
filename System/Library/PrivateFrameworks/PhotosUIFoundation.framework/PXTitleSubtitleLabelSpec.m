@implementation PXTitleSubtitleLabelSpec

- (void)setDistanceBetweenTitleBaselineAndSubtitleBaseline:(double)a3
{
  self->_distanceBetweenTitleBaselineAndSubtitleBaseline = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subtitleLabelSpec, 0);
  objc_storeStrong((id *)&self->_titleLabelSpec, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  _QWORD *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  __int128 v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXTitleSubtitleLabelSpec;
  v5 = -[PXViewSpec copyWithZone:](&v12, sel_copyWithZone_);
  v6 = -[PXLabelSpec copyWithZone:](self->_titleLabelSpec, "copyWithZone:", a3);
  v7 = (void *)v5[12];
  v5[12] = v6;

  v8 = -[PXLabelSpec copyWithZone:](self->_subtitleLabelSpec, "copyWithZone:", a3);
  v9 = (void *)v5[13];
  v5[13] = v8;

  v5[14] = *(_QWORD *)&self->_interLabelSpacing;
  v5[15] = *(_QWORD *)&self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
  v10 = *(_OWORD *)&self->_padding.bottom;
  *((_OWORD *)v5 + 8) = *(_OWORD *)&self->_padding.top;
  *((_OWORD *)v5 + 9) = v10;
  return v5;
}

- (unint64_t)hash
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PXTitleSubtitleLabelSpec;
  v3 = -[PXViewSpec hash](&v12, sel_hash);
  -[PXTitleSubtitleLabelSpec titleLabelSpec](self, "titleLabelSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "hash");

  -[PXTitleSubtitleLabelSpec subtitleLabelSpec](self, "subtitleLabelSpec");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 ^ objc_msgSend(v6, "hash") ^ v3;

  -[PXTitleSubtitleLabelSpec distanceBetweenTitleBaselineAndSubtitleBaseline](self, "distanceBetweenTitleBaselineAndSubtitleBaseline");
  v9 = (uint64_t)(v8 * 1000.0);
  -[PXTitleSubtitleLabelSpec padding](self, "padding");
  return v7 ^ (uint64_t)v10 ^ v9;
}

- (double)distanceBetweenTitleBaselineAndSubtitleBaseline
{
  return self->_distanceBetweenTitleBaselineAndSubtitleBaseline;
}

- (UIEdgeInsets)padding
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_padding.top;
  left = self->_padding.left;
  bottom = self->_padding.bottom;
  right = self->_padding.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setTitleLabelSpec:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabelSpec, a3);
}

- (void)setSubtitleLabelSpec:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabelSpec, a3);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  unsigned int v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  char v11;
  id v12;
  id v13;
  void *v14;
  char v15;
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
  double v32;
  BOOL v33;
  double v34;
  objc_super v36;

  v4 = a3;
  v36.receiver = self;
  v36.super_class = (Class)PXTitleSubtitleLabelSpec;
  v5 = -[PXViewSpec isEqual:](&v36, sel_isEqual_, v4);
  v6 = v4;
  v7 = v6;
  if (!v5)
    goto LABEL_16;
  objc_msgSend(v6, "titleLabelSpec");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleLabelSpec titleLabelSpec](self, "titleLabelSpec");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v8 == v9)
  {

  }
  else
  {
    v10 = v9;
    v11 = objc_msgSend(v8, "isEqual:", v9);

    if ((v11 & 1) == 0)
    {
LABEL_16:
      v33 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v7, "subtitleLabelSpec");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleLabelSpec subtitleLabelSpec](self, "subtitleLabelSpec");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v12 == v13)
  {

  }
  else
  {
    v14 = v13;
    v15 = objc_msgSend(v12, "isEqual:", v13);

    if ((v15 & 1) == 0)
      goto LABEL_16;
  }
  objc_msgSend(v7, "interLabelSpacing");
  v17 = v16;
  -[PXTitleSubtitleLabelSpec interLabelSpacing](self, "interLabelSpacing");
  if (v17 != v18)
    goto LABEL_16;
  objc_msgSend(v7, "distanceBetweenTitleBaselineAndSubtitleBaseline");
  v20 = v19;
  -[PXTitleSubtitleLabelSpec distanceBetweenTitleBaselineAndSubtitleBaseline](self, "distanceBetweenTitleBaselineAndSubtitleBaseline");
  if (v20 != v21)
    goto LABEL_16;
  objc_msgSend(v7, "padding");
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;
  -[PXTitleSubtitleLabelSpec padding](self, "padding");
  v33 = 0;
  if (v25 == v34 && v23 == v30 && v29 == v32)
    v33 = v27 == v31;
LABEL_17:

  return v33;
}

- (double)maximumTitleSubtitleHeight
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  const __CTFont *v7;
  double Height;
  double v9;
  const __CTFont *v10;
  double v11;
  double v12;
  CGRect BoundingBox;
  CGRect v15;

  -[PXTitleSubtitleLabelSpec titleLabelSpec](self, "titleLabelSpec");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleLabelSpec subtitleLabelSpec](self, "subtitleLabelSpec");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXTitleSubtitleLabelSpec interLabelSpacing](self, "interLabelSpacing");
  v6 = v5;
  objc_msgSend(v3, "font");
  v7 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  BoundingBox = CTFontGetBoundingBox(v7);
  Height = CGRectGetHeight(BoundingBox);
  v9 = Height * (double)(unint64_t)objc_msgSend(v3, "numberOfLines");

  objc_msgSend(v4, "font");
  v10 = (const __CTFont *)objc_claimAutoreleasedReturnValue();
  v15 = CTFontGetBoundingBox(v10);
  v11 = CGRectGetHeight(v15);
  v12 = v11 * (double)(unint64_t)objc_msgSend(v4, "numberOfLines");

  return ceil(v6 + v9 + v12) + 1.0;
}

- (PXLabelSpec)subtitleLabelSpec
{
  return self->_subtitleLabelSpec;
}

- (PXLabelSpec)titleLabelSpec
{
  return self->_titleLabelSpec;
}

- (double)interLabelSpacing
{
  return self->_interLabelSpacing;
}

- (void)setPadding:(UIEdgeInsets)a3
{
  self->_padding = a3;
}

- (void)setInterLabelSpacing:(double)a3
{
  self->_interLabelSpacing = a3;
}

@end
