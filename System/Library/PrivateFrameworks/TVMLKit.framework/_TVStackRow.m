@implementation _TVStackRow

- (unint64_t)hash
{
  int64_t v3;
  int64_t v4;
  int64_t v5;
  int64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;

  v3 = -[_TVStackRow sectionIndex](self, "sectionIndex");
  v4 = v3 ^ -[_TVStackRow isHosted](self, "isHosted");
  v5 = v4 ^ -[_TVStackRow isBounded](self, "isBounded");
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v6 = v5 ^ v25;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v7 = v6 ^ (unint64_t)v24;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v8 = (unint64_t)v23;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v9 = v7 ^ v8 ^ (unint64_t)v22;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v10 = (unint64_t)v21;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v11 = v10 ^ (unint64_t)v20;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v12 = v9 ^ v11 ^ (unint64_t)v19;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v13 = (unint64_t)v18;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  v14 = v13 ^ (unint64_t)v17;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  return v12 ^ v14 ^ (unint64_t)v16;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  id v6;
  int v7;
  int v8;
  BOOL v9;
  int64_t v11;
  _OWORD v12[5];
  _BYTE v13[80];
  objc_super v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;
  v6 = v5;
  v14.receiver = self;
  v14.super_class = (Class)_TVStackRow;
  if (!-[_TVStackRow isEqual:](&v14, sel_isEqual_, v4))
    goto LABEL_11;
  -[_TVStackRow rowMetrics](self, "rowMetrics");
  if (v6)
    objc_msgSend(v6, "rowMetrics");
  else
    memset(v12, 0, sizeof(v12));
  if (TVRowMetricsEqualToRowMetrics((uint64_t)v13, (uint64_t)v12)
    && (v7 = -[_TVStackRow isHosted](self, "isHosted"), v7 == objc_msgSend(v6, "isHosted"))
    && (v8 = -[_TVStackRow isBounded](self, "isBounded"), v8 == objc_msgSend(v6, "isBounded")))
  {
    v11 = -[_TVStackRow sectionIndex](self, "sectionIndex");
    v9 = v11 == objc_msgSend(v6, "sectionIndex");
  }
  else
  {
LABEL_11:
    v9 = 0;
  }

  return v9;
}

- (TVRowMetrics)rowMetrics
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v3;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 v4;

  v3 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowInset.bottom;
  v4 = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowMargin.bottom;
  retstr->rowInset = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self->rowInsetAlt.bottom;
  retstr->rowInsetAlt = v4;
  retstr->rowMargin = *($3BE62F1B3D8F3BC4B4EA8287E388A583 *)&self[1].rowHeight;
  *(_OWORD *)&retstr->rowType = *(_OWORD *)&self->rowPadding.bottom;
  retstr->rowPadding = v3;
  return self;
}

- (void)setRowMetrics:(TVRowMetrics *)a3
{
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowPadding;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInset;
  $3BE62F1B3D8F3BC4B4EA8287E388A583 rowInsetAlt;

  *(_OWORD *)&self->_rowMetrics.rowType = *(_OWORD *)&a3->rowType;
  rowPadding = a3->rowPadding;
  rowInset = a3->rowInset;
  rowInsetAlt = a3->rowInsetAlt;
  self->_rowMetrics.rowMargin = a3->rowMargin;
  self->_rowMetrics.rowInsetAlt = rowInsetAlt;
  self->_rowMetrics.rowInset = rowInset;
  self->_rowMetrics.rowPadding = rowPadding;
}

- (BOOL)isHosted
{
  return self->_hosted;
}

- (void)setHosted:(BOOL)a3
{
  self->_hosted = a3;
}

- (BOOL)isBounded
{
  return self->_bounded;
}

- (void)setBounded:(BOOL)a3
{
  self->_bounded = a3;
}

- (int64_t)sectionIndex
{
  return self->_sectionIndex;
}

- (void)setSectionIndex:(int64_t)a3
{
  self->_sectionIndex = a3;
}

@end
