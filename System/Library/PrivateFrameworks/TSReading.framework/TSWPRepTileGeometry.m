@implementation TSWPRepTileGeometry

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPRepTileGeometry;
  -[TSWPRepTileGeometry dealloc](&v2, sel_dealloc);
}

- (unint64_t)tileGeometryCountWithLayer:(id)a3
{
  return 0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - self->_infos.__begin_) >> 3);
}

- (void)tileGeometryAddVisibileIndices:(id)a3 withLayer:(id)a4 visibleBounds:(CGRect)a5
{
  CGRect *begin;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  uint64_t v12;
  CGRect v13;

  begin = (CGRect *)self->_infos.__begin_;
  if (begin != (CGRect *)self->_infos.__end_)
  {
    height = a5.size.height;
    width = a5.size.width;
    y = a5.origin.y;
    x = a5.origin.x;
    v12 = 0;
    do
    {
      v13.origin.x = x;
      v13.origin.y = y;
      v13.size.width = width;
      v13.size.height = height;
      if (CGRectIntersectsRect(v13, *begin))
        objc_msgSend(a3, "addIndex:", v12);
      ++v12;
      begin = (CGRect *)((char *)begin + 40);
    }
    while (begin != (CGRect *)self->_infos.__end_);
  }
}

- (CGRect)tileGeometryRectWithLayer:(id)a3 atIndex:(unint64_t)a4 mask:(unsigned int *)a5
{
  Info *begin;
  CGFloat *v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MinX;
  unsigned int v21;
  double MaxX;
  double MinY;
  double MaxY;
  CGFloat v25;
  unsigned int v26;
  BOOL v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat rect;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  begin = self->_infos.__begin_;
  v7 = (CGFloat *)((char *)begin + 40 * a4);
  if (0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - begin) >> 3) <= a4)
    v7 = (CGFloat *)MEMORY[0x24BDBF090];
  v8 = v7[2];
  v9 = v7[3];
  v10 = *v7;
  v11 = v7[1];
  objc_msgSend(a3, "bounds");
  if (a5)
  {
    v16 = v12;
    v33.origin.x = v10;
    v17 = v13;
    v33.origin.y = v11;
    v18 = v14;
    v33.size.width = v8;
    v19 = v15;
    v33.size.height = v9;
    rect = v9;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = v16;
    v34.origin.y = v17;
    v34.size.width = v18;
    v34.size.height = v19;
    v21 = MinX == CGRectGetMinX(v34);
    v35.origin.x = v10;
    v35.origin.y = v11;
    v35.size.width = v8;
    v35.size.height = rect;
    MaxX = CGRectGetMaxX(v35);
    v36.origin.x = v16;
    v36.origin.y = v17;
    v36.size.width = v18;
    v36.size.height = v19;
    if (MaxX == CGRectGetMaxX(v36))
      v21 |= 2u;
    v37.origin.x = v10;
    v37.origin.y = v11;
    v37.size.width = v8;
    v37.size.height = rect;
    MinY = CGRectGetMinY(v37);
    v38.origin.x = v16;
    v38.origin.y = v17;
    v38.size.width = v18;
    v38.size.height = v19;
    if (MinY == CGRectGetMinY(v38))
      v21 |= 4u;
    v39.origin.x = v10;
    v39.origin.y = v11;
    v39.size.width = v8;
    v39.size.height = rect;
    MaxY = CGRectGetMaxY(v39);
    v40.origin.x = v16;
    v40.origin.y = v17;
    v40.size.width = v18;
    v40.size.height = v19;
    v25 = CGRectGetMaxY(v40);
    v26 = v21 | 8;
    v27 = MaxY == v25;
    v9 = rect;
    if (!v27)
      v26 = v21;
    *a5 = v26;
  }
  v28 = v10;
  v29 = v11;
  v30 = v8;
  v31 = v9;
  result.size.height = v31;
  result.size.width = v30;
  result.origin.y = v29;
  result.origin.x = v28;
  return result;
}

- (void)tileGeometryConfigureWithLayer:(id)a3 tileLayer:(id)a4 atIndex:(unint64_t)a5
{
  Info *begin;
  CGColor *v7;
  CGColor *v8;
  CGColor *CopyWithAlpha;
  _QWORD *v10;

  begin = self->_infos.__begin_;
  if (0xCCCCCCCCCCCCCCCDLL * ((self->_infos.__end_ - begin) >> 3) > a5)
  {
    v7 = CGColorRetain(*((CGColorRef *)begin + 5 * a5 + 4));
    v8 = v7;
    if (v7)
      CopyWithAlpha = CGColorCreateCopyWithAlpha(v7, 1.0);
    else
      CopyWithAlpha = 0;
    v10 = (_QWORD *)MEMORY[0x24BDE5898];
    if (CopyWithAlpha)
      v10 = (_QWORD *)MEMORY[0x24BDE5888];
    objc_msgSend(a4, "setContentsFormat:", *v10);
    objc_msgSend(a4, "setContentsMultiplyColor:", CopyWithAlpha);
    if (CopyWithAlpha)
      CGColorRelease(CopyWithAlpha);
    CGColorRelease(v8);
  }
}

- (BOOL)updateWithLayer:(id)a3 scale:(double)a4 columns:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t ***v12;
  uint64_t **v13;
  uint64_t *j;
  uint64_t v15;
  CGColor *v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  Info *v21;
  Info *v22;
  unint64_t v23;
  Info *begin;
  Info *end;
  uint64_t v26;
  unint64_t v27;
  Info *v28;
  Info *v29;
  CGColor *v30;
  CGColor *v31;
  BOOL v32;
  Info *value;
  id v35;
  Info *v36;
  Info *v37;
  Info *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43[3];
  Info **v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "bounds");
  TSWPRepBoundsAnalyzer::TSWPRepBoundsAnalyzer((TSWPRepBoundsAnalyzer *)v43, v47);
  v35 = a3;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v40 != v10)
          objc_enumerationMutation(a5);
        v12 = (uint64_t ***)objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "lineFragmentArray");
        v13 = *v12;
        for (j = **v12; j != v13[1]; j += 2)
        {
          v15 = *j;
          if ((*(_DWORD *)(*j + 24) & 0x8000020) == 0x8000000)
          {
            v16 = (CGColor *)TSWPLineFragment::singleColor((TSWPLineFragment *)v15);
            v48.origin.x = TSDMultiplyRectScalar(*(double *)(*j + 80), *(CGFloat *)(*j + 88), *(CGFloat *)(*j + 96), *(CGFloat *)(*j + 104), a4);
            TSWPRepBoundsAnalyzer::addSingleColorBounds((TSWPRepBoundsAnalyzer *)v43, v16, v48);
          }
          else
          {
            v49.origin.x = TSDMultiplyRectScalar(*(double *)(v15 + 80), *(CGFloat *)(v15 + 88), *(CGFloat *)(v15 + 96), *(CGFloat *)(v15 + 104), a4);
            TSWPRepBoundsAnalyzer::addMultipleColorBounds((TSWPRepBoundsAnalyzer *)v43, v49);
          }
          v13 = *v12;
        }
      }
      v9 = objc_msgSend(a5, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v9);
  }
  v36 = 0;
  v37 = 0;
  v38 = 0;
  objc_msgSend(v35, "bounds");
  TSWPRepBoundsAnalyzer::finalize((uint64_t)v43, (uint64_t)&v36, v17, v18, v19, v20, self->_maxTileSize.width, self->_maxTileSize.height);
  v22 = v36;
  v21 = v37;
  v23 = 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 3);
  begin = self->_infos.__begin_;
  end = self->_infos.__end_;
  if (v23 != 0xCCCCCCCCCCCCCCCDLL * ((end - begin) >> 3))
  {
LABEL_25:
    self->_infos.__begin_ = v22;
    self->_infos.__end_ = v21;
    v36 = begin;
    v37 = end;
    value = self->_infos.__end_cap_.__value_;
    self->_infos.__end_cap_.__value_ = v38;
    v38 = value;
    v32 = 1;
    self->_tileGeometryDirty = 1;
    goto LABEL_26;
  }
  if (v37 != v36)
  {
    v26 = 0;
    if (v23 <= 1)
      v27 = 1;
    else
      v27 = 0xCCCCCCCCCCCCCCCDLL * ((v37 - v36) >> 3);
    while (1)
    {
      v28 = self->_infos.__begin_;
      v29 = v36;
      if (!CGRectEqualToRect(*(CGRect *)((char *)v28 + v26), *(CGRect *)((char *)v36 + v26)))
        break;
      v30 = *(CGColor **)((char *)v28 + v26 + 32);
      v31 = *(CGColor **)((char *)v29 + v26 + 32);
      if (v30 != v31 && !CGColorEqualToColor(v30, v31))
        break;
      v26 += 40;
      if (!--v27)
        goto LABEL_23;
    }
    begin = self->_infos.__begin_;
    end = self->_infos.__end_;
    v22 = v36;
    v21 = v37;
    goto LABEL_25;
  }
LABEL_23:
  v32 = 0;
LABEL_26:
  v44 = &v36;
  std::vector<TSWPRepBoundsAnalyzer::Info>::__destroy_vector::operator()[abi:nn180100]((void ***)&v44);
  std::__list_imp<TSWPRepBoundsAnalyzer::Span>::clear(v43);
  return v32;
}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  Info *begin;
  uint64_t v7;

  v3 = (void *)MEMORY[0x24BDD16A8];
  v4 = (objc_class *)objc_opt_class();
  v5 = (NSString *)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p"), NSStringFromClass(v4), self);
  begin = self->_infos.__begin_;
  if (begin != self->_infos.__end_)
  {
    v7 = 0;
    do
    {
      -[NSString appendFormat:](v5, "appendFormat:", CFSTR(" %lu:%@ %@"), v7++, NSStringFromCGRect(*(CGRect *)begin), *((_QWORD *)begin + 4));
      begin = (Info *)((char *)begin + 40);
    }
    while (begin != self->_infos.__end_);
  }
  -[NSString appendString:](v5, "appendString:", CFSTR(">"));
  return v5;
}

- (BOOL)tileGeometryDirty
{
  return self->_tileGeometryDirty;
}

- (void)setTileGeometryDirty:(BOOL)a3
{
  self->_tileGeometryDirty = a3;
}

- (CGSize)maxTileSize
{
  double width;
  double height;
  CGSize result;

  width = self->_maxTileSize.width;
  height = self->_maxTileSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setMaxTileSize:(CGSize)a3
{
  self->_maxTileSize = a3;
}

- (void).cxx_destruct
{
  vector<TSWPRepBoundsAnalyzer::Info, std::allocator<TSWPRepBoundsAnalyzer::Info>> *p_infos;

  p_infos = &self->_infos;
  std::vector<TSWPRepBoundsAnalyzer::Info>::__destroy_vector::operator()[abi:nn180100]((void ***)&p_infos);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
