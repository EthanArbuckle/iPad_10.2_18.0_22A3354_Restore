@implementation BKPDFSnapshotMetadata

- (BKPDFSnapshotMetadata)initWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  id v6;
  BKPDFSnapshotMetadata *v7;
  id v8;
  unint64_t v9;
  unint64_t *p_leftPageIndex;
  unint64_t v11;
  unint64_t v12;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)BKPDFSnapshotMetadata;
  v7 = -[BKPDFSnapshotMetadata init](&v14, "init");
  if (!v7)
    goto LABEL_12;
  v8 = objc_msgSend(v6, "pageCount");
  v9 = (unint64_t)v8;
  if ((unint64_t)v8 <= a4)
  {
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/PDF/BKPDFSnapshotMetadata.m", 23, "-[BKPDFSnapshotMetadata initWithPDFDocument:currentPageIndex:]", "currentPageIndex < pageCount", CFSTR("Invalid page index."));
    *(int64x2_t *)&v7->_leftPageIndex = vdupq_n_s64(0x7FFFFFFFFFFFFFFFuLL);
    p_leftPageIndex = &v7->_leftPageIndex;
    goto LABEL_14;
  }
  v7->_leftPageIndex = a4;
  v7->_rightPageIndex = 0x7FFFFFFFFFFFFFFFLL;
  p_leftPageIndex = &v7->_leftPageIndex;
  if ((a4 & 1) != 0)
  {
    v12 = a4 - 1;
    *p_leftPageIndex = a4 - 1;
    v11 = a4;
    goto LABEL_7;
  }
  v11 = a4 + 1;
  v12 = a4;
  if (a4 + 1 < (unint64_t)v8)
LABEL_7:
    v7->_rightPageIndex = v11;
  if (v12 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_14:
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/PDF/BKPDFSnapshotMetadata.m", 47, "-[BKPDFSnapshotMetadata initWithPDFDocument:currentPageIndex:]", "_leftPageIndex != NSNotFound", CFSTR("Expecting at least one page index."));
    v12 = *p_leftPageIndex;
  }
  if (v12 >= v9)
    BCReportAssertionFailureWithMessage("/Library/Caches/com.apple.xbs/Sources/Alder/ios/AEBookPlugins/AssetTypes/PDF/BKPDFSnapshotMetadata.m", 48, "-[BKPDFSnapshotMetadata initWithPDFDocument:currentPageIndex:]", "_leftPageIndex < pageCount", CFSTR("Invalid page index."));
  -[BKPDFSnapshotMetadata _cleanupPageIndicesIfNecessaryWithDocument:currentPageIndex:](v7, "_cleanupPageIndicesIfNecessaryWithDocument:currentPageIndex:", v6, a4);
LABEL_12:

  return v7;
}

- (BOOL)hasLeftPage
{
  return -[BKPDFSnapshotMetadata leftPageIndex](self, "leftPageIndex") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasRightPage
{
  return -[BKPDFSnapshotMetadata rightPageIndex](self, "rightPageIndex") != 0x7FFFFFFFFFFFFFFFLL;
}

- (CGSize)_pageSize:(id)a3
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  CGSize result;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "boundsForBox:", 1);
    v6 = v5;
    width = v7;
    if (fabs((double)((uint64_t)objc_msgSend(v4, "rotation") % 180)) >= 0.00999999978)
    {
      height = v6;
    }
    else
    {
      height = width;
      width = v6;
    }
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }

  v10 = width;
  v11 = height;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)_cleanupPageIndicesIfNecessaryWithDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  unint64_t rightPageIndex;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  unint64_t leftPageIndex;
  double width;
  double height;
  _BOOL4 v21;
  BOOL v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int16 v30[8];
  uint8_t buf[16];

  v6 = a3;
  v7 = v6;
  if (self->_leftPageIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
    goto LABEL_3;
  }
  rightPageIndex = self->_rightPageIndex;
  v6 = objc_claimAutoreleasedReturnValue(-[NSObject pageAtIndex:](v6, "pageAtIndex:"));
  v8 = v6;
  if (rightPageIndex == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      v6 = -[BKPDFSnapshotMetadata _pageSize:](self, "_pageSize:", v6);
      self->_leftPageSize.width = v12;
      self->_leftPageSize.height = v13;
      goto LABEL_40;
    }
    self->_leftPageSize = CGSizeZero;
    goto LABEL_3;
  }
  v10 = objc_claimAutoreleasedReturnValue(-[NSObject pageAtIndex:](v7, "pageAtIndex:", self->_rightPageIndex));
  -[BKPDFSnapshotMetadata _pageSize:](self, "_pageSize:", v8);
  self->_leftPageSize.width = v14;
  self->_leftPageSize.height = v15;
  v6 = -[BKPDFSnapshotMetadata _pageSize:](self, "_pageSize:", v10);
  self->_rightPageSize.width = v16;
  self->_rightPageSize.height = v17;
  leftPageIndex = self->_leftPageIndex;
  if (leftPageIndex == a4)
    width = self->_leftPageSize.width;
  else
    width = v16;
  if (leftPageIndex == a4)
    height = self->_leftPageSize.height;
  else
    height = v17;
  v21 = self->_leftPageSize.width != v16;
  if (self->_leftPageSize.height != v17)
    v21 = 1;
  if (!v10 || (height >= width ? (v22 = !v21) : (v22 = 0), !v22))
  {
    if (height >= width)
    {
      if (v21)
      {
        v27 = BKModernPDFLog(v6);
        v26 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_11CA04();
      }
      else
      {
        if (v10)
          goto LABEL_39;
        v28 = BKModernPDFLog(v6);
        v26 = objc_claimAutoreleasedReturnValue(v28);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          sub_11CA30();
      }
    }
    else
    {
      v25 = BKModernPDFLog(v6);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_11C9D8();
    }

LABEL_39:
    self->_leftPageSize.width = width;
    self->_leftPageSize.height = height;
    self->_leftPageIndex = a4;
    self->_rightPageIndex = 0x7FFFFFFFFFFFFFFFLL;
    self->_rightPageSize = CGSizeZero;

    if (v8)
    {
LABEL_40:
      v29 = BKModernPDFLog(v6);
      v10 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v30[0] = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Configured for one page spread image.", (uint8_t *)v30, 2u);
      }
      goto LABEL_5;
    }
LABEL_3:
    v9 = BKModernPDFLog(v6);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_11C9AC();
    goto LABEL_5;
  }
  if (!v8)
  {
    v8 = v10;
    goto LABEL_3;
  }
  v23 = BKModernPDFLog(v6);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Configured for two page spread image.", buf, 2u);
  }

LABEL_5:
}

+ (id)snapshotHelperWithPDFDocument:(id)a3 currentPageIndex:(unint64_t)a4
{
  id v5;
  BKPDFSnapshotMetadata *v6;

  v5 = a3;
  v6 = -[BKPDFSnapshotMetadata initWithPDFDocument:currentPageIndex:]([BKPDFSnapshotMetadata alloc], "initWithPDFDocument:currentPageIndex:", v5, a4);

  return v6;
}

- (unint64_t)leftPageIndex
{
  return self->_leftPageIndex;
}

- (unint64_t)rightPageIndex
{
  return self->_rightPageIndex;
}

- (CGSize)leftPageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_leftPageSize.width;
  height = self->_leftPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (CGSize)rightPageSize
{
  double width;
  double height;
  CGSize result;

  width = self->_rightPageSize.width;
  height = self->_rightPageSize.height;
  result.height = height;
  result.width = width;
  return result;
}

@end
