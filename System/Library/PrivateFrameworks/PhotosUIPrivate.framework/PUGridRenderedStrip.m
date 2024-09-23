@implementation PUGridRenderedStrip

- (PUGridRenderedStrip)initWithFrame:(CGRect)a3
{
  PUGridRenderedStrip *v3;
  PUGridRenderedStrip *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PUGridRenderedStrip;
  v3 = -[PUGridRenderedStrip initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PUGridRenderedStrip layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsGroupOpacity:", 0);

  }
  return v4;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t contentExtenderType;
  double v12;
  double v13;
  double v14;
  void *v15;
  objc_super v16;
  CGRect v17;
  CGRect v18;

  v16.receiver = self;
  v16.super_class = (Class)PUGridRenderedStrip;
  -[PUGridRenderedStrip layoutSubviews](&v16, sel_layoutSubviews);
  -[PUGridRenderedStrip bounds](self, "bounds");
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  contentExtenderType = self->_contentExtenderType;
  if (contentExtenderType == 1)
  {
    v13 = 3.0;
  }
  else
  {
    v12 = v3;
    if (contentExtenderType != 2)
      goto LABEL_6;
    v13 = 5.0;
  }
  v12 = v3 + CGRectGetWidth(*(CGRect *)&v3) * -2.0;
  v17.origin.x = v7;
  v17.origin.y = v8;
  v17.size.width = v9;
  v17.size.height = v10;
  v5 = CGRectGetWidth(v17) * v13;
LABEL_6:
  -[UIView setFrame:](self->__sideExtendedContentView, "setFrame:", v12, v8, v5, v10);
  if (self->_topContentView)
  {
    v18.origin.x = v7;
    v18.origin.y = v8;
    v18.size.width = v9;
    v18.size.height = v10;
    v14 = 3.0 / CGRectGetHeight(v18);
    -[UIView layer](self->_topContentView, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setContentsRect:", 0.0, 0.0, 1.0, v14);
    objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.0);
    -[UIView setFrame:](self->_topContentView, "setFrame:", v7, v8, v9, 3.0);

  }
  if (-[PUGridRenderedStrip _needsRendering](self, "_needsRendering"))
  {
    -[PUGridRenderedStrip _render](self, "_render");
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 0);
  }
}

- (void)setExtendsToTop:(BOOL)a3
{
  UIView *topContentView;
  UIView *v5;
  UIView *v6;
  void *v7;
  UIView *v8;

  if (self->_extendsToTop != a3)
  {
    self->_extendsToTop = a3;
    topContentView = self->_topContentView;
    if (!a3 || topContentView)
    {
      -[UIView removeFromSuperview](topContentView, "removeFromSuperview");
      v8 = self->_topContentView;
      self->_topContentView = 0;

    }
    else
    {
      v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      v6 = self->_topContentView;
      self->_topContentView = v5;

      -[UIView setClipsToBounds:](self->_topContentView, "setClipsToBounds:", 1);
      -[UIView layer](self->_topContentView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContentsGravity:", *MEMORY[0x1E0CD2F98]);

      -[PUGridRenderedStrip addSubview:](self, "addSubview:", self->_topContentView);
      -[PUGridRenderedStrip _updateExtendedContents](self, "_updateExtendedContents");
    }
  }
}

- (void)setContentExtenderType:(unint64_t)a3
{
  UIView *sideExtendedContentView;
  UIView *v5;
  UIView *v6;
  void *v7;
  UIView *v8;
  double v9;
  double v10;
  double v11;
  UIView *v12;

  if (self->_contentExtenderType != a3)
  {
    self->_contentExtenderType = a3;
    sideExtendedContentView = self->__sideExtendedContentView;
    if (a3)
    {
      if (!sideExtendedContentView)
      {
        v5 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
        v6 = self->__sideExtendedContentView;
        self->__sideExtendedContentView = v5;

        -[PUGridRenderedStrip addSubview:](self, "addSubview:", self->__sideExtendedContentView);
        -[UIView layer](self->__sideExtendedContentView, "layer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setContentsScaling:", CFSTR("repeat"));

        v8 = self->__sideExtendedContentView;
        PLPhysicalScreenScale();
        v10 = v9;
        -[PUGridRenderedStrip itemContentScale](self, "itemContentScale");
        -[UIView setContentScaleFactor:](v8, "setContentScaleFactor:", v10 * v11);
      }
      -[PUGridRenderedStrip setNeedsLayout](self, "setNeedsLayout");
      -[PUGridRenderedStrip _updateExtendedContents](self, "_updateExtendedContents");
    }
    else
    {
      -[UIView removeFromSuperview](sideExtendedContentView, "removeFromSuperview");
      v12 = self->__sideExtendedContentView;
      self->__sideExtendedContentView = 0;

    }
  }
}

- (void)setNeedsRendering
{
  -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
}

- (void)_setNeedsRendering:(BOOL)a3
{
  if (self->__needsRendering != a3)
  {
    self->__needsRendering = a3;
    if (a3)
      -[PUGridRenderedStrip setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setItemSize:(CGSize)a3
{
  if (a3.width != self->_itemSize.width || a3.height != self->_itemSize.height)
  {
    self->_itemSize = a3;
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
  }
}

- (void)setItemContentScale:(double)a3
{
  if (self->_itemContentScale != a3)
  {
    self->_itemContentScale = a3;
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
  }
}

- (void)setInterItemSpacing:(CGSize)a3
{
  if (a3.width != self->_interItemSpacing.width || a3.height != self->_interItemSpacing.height)
  {
    self->_interItemSpacing = a3;
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
  }
}

- (void)setLeftContentInset:(double)a3
{
  if (self->_leftContentInset != a3)
  {
    self->_leftContentInset = a3;
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
  }
}

- (void)setDataSource:(id)a3
{
  id WeakRetained;
  void *v5;
  id v6;
  NSUInteger length;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  v5 = obj;
  if (WeakRetained != obj)
  {
    v6 = objc_storeWeak((id *)&self->_dataSource, obj);
    if (!obj || self->_visualSectionIndex == 0x7FFFFFFFFFFFFFFFLL)
    {

LABEL_7:
      v5 = obj;
      goto LABEL_8;
    }
    length = self->_visualItemRange.length;

    v5 = obj;
    if (length)
    {
      -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (void)setVisualSectionIndex:(int64_t)a3 andVisualItemRange:(_NSRange)a4
{
  BOOL v5;
  _NSRange *p_visualItemRange;
  id WeakRetained;
  NSUInteger length;

  if (self->_visualSectionIndex != a3
    || (a4.location == self->_visualItemRange.location ? (v5 = a4.length == self->_visualItemRange.length) : (v5 = 0),
        !v5))
  {
    self->_visualSectionIndex = a3;
    p_visualItemRange = &self->_visualItemRange;
    self->_visualItemRange = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained && self->_visualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = p_visualItemRange->length;

      if (length)
        -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
    }
    else
    {

    }
  }
}

- (void)setLayout:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_layout, obj);
    -[PUGridRenderedStrip _setNeedsRendering:](self, "_setNeedsRendering:", 1);
    v5 = obj;
  }

}

- (int64_t)numberOfColumns
{
  double Width;
  double v4;
  double v5;
  id WeakRetained;
  id v7;
  int64_t v8;
  double v10;
  double v11;
  double v12;
  double v13;
  CGRect v14;

  -[PUGridRenderedStrip bounds](self, "bounds");
  Width = CGRectGetWidth(v14);
  -[PUGridRenderedStrip leftContentInset](self, "leftContentInset");
  v5 = Width - v4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_layout);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_layout);
    v8 = objc_msgSend(v7, "numberOfColumnsForWidth:", v5);

    return v8;
  }
  else
  {
    -[PUGridRenderedStrip interItemSpacing](self, "interItemSpacing");
    v11 = v10;
    v12 = v5 + v10;
    -[PUGridRenderedStrip itemSize](self, "itemSize");
    return (uint64_t)(v12 / (v11 + v13));
  }
}

- (void)_render
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  void *v12;
  void *v13;
  char v14;
  unint64_t v15;
  int64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  int64_t v21;
  int64_t v22;
  double v23;
  double v24;
  double v25;
  int64_t v27;
  char *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  size_t v37;
  char *v38;
  char *v39;
  char *v40;
  int64_t v41;
  int64_t v42;
  size_t v43;
  uint64_t v44;
  id v45;
  void *v46;
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  size_t v51;
  int64_t v52;
  CGDataProvider *v53;
  CGColorSpace *DeviceRGB;
  CGImage *v55;
  void *v56;
  unint64_t v57;
  int64_t length;
  NSUInteger location;
  uint64_t v60;
  void *v61;
  int64_t visualSectionIndex;
  size_t size;
  int64_t v65;
  int64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t v74;
  _QWORD aBlock[4];
  id v76;
  id v77;
  PUGridRenderedStrip *v78;
  _QWORD *v79;
  uint64_t *v80;
  double v81;
  double v82;
  double v83;
  uint64_t v84;
  unint64_t v85;
  uint64_t v86;
  int64_t v87;
  char *v88;
  char *v89;
  size_t v90;
  int64_t v91;
  char v92;
  _QWORD v93[4];
  uint64_t v94;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;

  -[PUGridRenderedStrip bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  PLPhysicalScreenScale();
  v8 = v7;
  -[PUGridRenderedStrip itemContentScale](self, "itemContentScale");
  v10 = v8 * v9;
  v11 = -[PUGridRenderedStrip backgroundColorValue](self, "backgroundColorValue");
  -[PUGridRenderedStrip layout](self, "layout");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUGridRenderedStrip dataSource](self, "dataSource");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[PUGridRenderedStrip _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  v15 = llround(v4 * v10);
  v16 = llround(v6 * v10);
  -[PUGridRenderedStrip itemSize](self, "itemSize");
  v18 = v17;
  v20 = v19;
  v21 = llround(v10 * v17);
  v22 = llround(v10 * v19);
  -[PUGridRenderedStrip interItemSpacing](self, "interItemSpacing");
  v24 = v23;
  -[PUGridRenderedStrip leftContentInset](self, "leftContentInset");
  v67 = llround(v10 * v25);
  if ((uint64_t)(v15 - v67) >= v21 && v16 >= v22)
  {
    v27 = v16;
    size = 2 * v16 * v15;
    v28 = (char *)mmap(0, size, 3, 4097, 1207959552, 0);
    v94 = 0;
    v95 = &v94;
    v96 = 0x2020000000;
    v97 = 0;
    -[PUGridRenderedStrip interItemSpacing](self, "interItemSpacing");
    visualSectionIndex = self->_visualSectionIndex;
    if (visualSectionIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      length = self->_visualItemRange.length;
      if (length)
      {
        v30 = v29;
        v61 = v13;
        v31 = -[PUGridRenderedStrip numberOfColumns](self, "numberOfColumns");
        v65 = v15;
        v66 = v27;
        if (v31 < 1)
        {
          v33 = 0.0;
        }
        else
        {
          v32 = 0;
          v33 = 0.0;
          do
          {
            if (v12)
              objc_msgSend(v12, "layoutItemSizeForColumn:", v32);
            else
              -[PUGridRenderedStrip itemSize](self, "itemSize");
            v35 = v33 + v34;
            v36 = -0.0;
            if (v32 < v31 - 1)
              v36 = v30;
            v33 = v36 + v35;
            ++v32;
          }
          while (v31 != v32);
        }
        v37 = 2 * v15;
        v38 = (char *)mmap(0, 2 * v65, 3, 4097, 1207959552, 0);
        v39 = v38;
        v60 = (uint64_t)(v10 * v33);
        if (v65 >= 1)
        {
          v40 = v38 + 1;
          v41 = v65;
          do
          {
            *(_WORD *)(v40 - 1) = v11;
            v40 += 2;
            --v41;
          }
          while (v41);
        }
        v57 = llround(v10 * v24);
        if (v67 >= 1 && v66 >= 1)
        {
          v42 = v66;
          v43 = v95[3];
          do
          {
            memcpy(&v28[v43], v39, 2 * v67);
            v43 = v95[3] + v37;
            v95[3] = v43;
            --v42;
          }
          while (v42);
        }
        if (length >= v31)
          v44 = v31;
        else
          v44 = length;
        location = self->_visualItemRange.location;
        v93[0] = 0;
        v93[1] = v93;
        v93[2] = 0x2020000000;
        v93[3] = 0;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __30__PUGridRenderedStrip__render__block_invoke;
        aBlock[3] = &unk_1E589FBE0;
        v81 = v18;
        v82 = v20;
        v83 = v10;
        v76 = v12;
        v84 = (uint64_t)(v10 * v33);
        v85 = v57;
        v79 = v93;
        v80 = &v94;
        v86 = v67;
        v87 = v22;
        v88 = v28;
        v89 = v39;
        v90 = v37;
        v92 = v14 ^ 1;
        v45 = v61;
        v77 = v45;
        v78 = self;
        v91 = v66;
        v46 = _Block_copy(aBlock);
        v71 = 0;
        v72 = &v71;
        v73 = 0x2020000000;
        v74 = 0;
        v68[0] = MEMORY[0x1E0C809B0];
        v68[1] = 3221225472;
        v68[2] = __30__PUGridRenderedStrip__render__block_invoke_2;
        v68[3] = &unk_1E589FC08;
        v47 = v46;
        v69 = v47;
        v70 = &v71;
        objc_msgSend(v45, "renderedStrip:enumerateAssetsForVisualSection:inVisualItemRange:usingBlock:", self, visualSectionIndex, location, v44, v68);
        if (v72[3] != v44)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUGridRenderedStrip.m"), 388, CFSTR("Bad iteration over real items. Rendered %ld items but expected %ld"), v72[3], v44);

          v44 = v72[3];
        }
        while (v44 < v31)
        {
          (*((void (**)(id, uint64_t, _QWORD))v47 + 2))(v47, v44, 0);
          v44 = v72[3] + 1;
          v72[3] = v44;
        }
        v49 = v65 - (v60 + v67);
        if (v49 >= 1)
        {
          v50 = 2 * (v60 + v67);
          v95[3] = v50;
          if (v66 >= 1)
          {
            v51 = 2 * v49;
            v52 = v66;
            do
            {
              memset(&v28[v50], v11, v51);
              v50 = v95[3] + v37;
              v95[3] = v50;
              --v52;
            }
            while (v52);
          }
        }
        munmap(v39, v37);
        mach_vm_protect(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)v28, size, 1, 1);
        v53 = CGDataProviderCreateWithData(0, v28, size, (CGDataProviderReleaseDataCallback)_UnmapBuffer);
        v13 = v61;
        DeviceRGB = CGColorSpaceCreateDeviceRGB();
        v55 = CGImageCreate(v65, v66, 5uLL, 0x10uLL, v37, DeviceRGB, 0x1006u, v53, 0, 1, kCGRenderingIntentDefault);
        CGDataProviderRelease(v53);
        CGColorSpaceRelease(DeviceRGB);
        -[PUGridRenderedStrip layer](self, "layer");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "setContents:", v55);

        -[PUGridRenderedStrip _updateExtendedContents](self, "_updateExtendedContents");
        CGImageRelease(v55);

        _Block_object_dispose(&v71, 8);
        _Block_object_dispose(v93, 8);
      }
    }
    _Block_object_dispose(&v94, 8);
  }

}

- (void)_updateExtendedContents
{
  void *v3;
  void *v4;
  void *v5;
  UIView *sideExtendedContentView;
  void *v7;
  uint64_t v8;

  -[PUGridRenderedStrip layer](self, "layer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contents");
  v8 = objc_claimAutoreleasedReturnValue();

  v4 = (void *)v8;
  if (v8)
  {
    if (self->_extendsToTop)
    {
      -[UIView layer](self->_topContentView, "layer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setContents:", v8);

      v4 = (void *)v8;
    }
    sideExtendedContentView = self->__sideExtendedContentView;
    if (sideExtendedContentView)
    {
      -[UIView layer](sideExtendedContentView, "layer");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setContents:", v8);

      v4 = (void *)v8;
    }
  }

}

- (void)applyLayoutAttributes:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)PUGridRenderedStrip;
  -[PUGridRenderedStrip applyLayoutAttributes:](&v6, sel_applyLayoutAttributes_, v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v4, "extendsTopContent"))
  {
    -[PUGridRenderedStrip setExtendsToTop:](self, "setExtendsToTop:", 1);
    -[PUGridRenderedStrip topContentView](self, "topContentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAlpha:", 0.0);

  }
}

- (BOOL)_disableRasterizeInAnimations
{
  return 1;
}

- (CGSize)itemSize
{
  double width;
  double height;
  CGSize result;

  width = self->_itemSize.width;
  height = self->_itemSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)itemContentScale
{
  return self->_itemContentScale;
}

- (CGSize)interItemSpacing
{
  double width;
  double height;
  CGSize result;

  width = self->_interItemSpacing.width;
  height = self->_interItemSpacing.height;
  result.height = height;
  result.width = width;
  return result;
}

- (double)leftContentInset
{
  return self->_leftContentInset;
}

- (int)backgroundColorValue
{
  return self->_backgroundColorValue;
}

- (void)setBackgroundColorValue:(int)a3
{
  self->_backgroundColorValue = a3;
}

- (NSArray)itemIndexPaths
{
  return self->_itemIndexPaths;
}

- (void)setItemIndexPaths:(id)a3
{
  objc_storeStrong((id *)&self->_itemIndexPaths, a3);
}

- (int64_t)visualSectionIndex
{
  return self->_visualSectionIndex;
}

- (_NSRange)visualItemRange
{
  _NSRange *p_visualItemRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_visualItemRange = &self->_visualItemRange;
  location = self->_visualItemRange.location;
  length = p_visualItemRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (PUGridRenderedStripDataSource)dataSource
{
  return (PUGridRenderedStripDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (PUSectionedGridLayout)layout
{
  return (PUSectionedGridLayout *)objc_loadWeakRetained((id *)&self->_layout);
}

- (unint64_t)contentExtenderType
{
  return self->_contentExtenderType;
}

- (BOOL)extendsToTop
{
  return self->_extendsToTop;
}

- (UIView)topContentView
{
  return self->_topContentView;
}

- (BOOL)_needsRendering
{
  return self->__needsRendering;
}

- (UIView)_sideExtendedContentView
{
  return self->__sideExtendedContentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__sideExtendedContentView, 0);
  objc_storeStrong((id *)&self->_topContentView, 0);
  objc_destroyWeak((id *)&self->_layout);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_itemIndexPaths, 0);
}

void __30__PUGridRenderedStrip__render__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  int64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v5 = a3;
  v6 = *(void **)(a1 + 32);
  if (v6)
  {
    objc_msgSend(v6, "layoutItemSizeForColumn:", a2);
    v9 = v8;
  }
  else
  {
    v7 = *(double *)(a1 + 72);
    v9 = *(double *)(a1 + 80);
  }
  v10 = *(double *)(a1 + 88);
  v11 = llround(v7 * v10);
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (*(_QWORD *)(a1 + 96) - v12 >= v11)
    v13 = v11;
  else
    v13 = *(_QWORD *)(a1 + 96) - v12;
  if (a2 >= 1)
  {
    v14 = *(_QWORD *)(a1 + 104);
    if (v14)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2 * (v12 + v14 * (a2 - 1) + *(_QWORD *)(a1 + 112));
      if (*(uint64_t *)(a1 + 120) >= 1)
      {
        v15 = 0;
        do
        {
          memcpy((void *)(*(_QWORD *)(a1 + 128) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)), *(const void **)(a1 + 136), 2 * *(_QWORD *)(a1 + 104));
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(a1 + 144);
          ++v15;
        }
        while (v15 < *(_QWORD *)(a1 + 120));
      }
    }
  }
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) + *(_QWORD *)(a1 + 104) * a2 + *(_QWORD *)(a1 + 112);
  if (!*(_BYTE *)(a1 + 160))
    v16 = *(_QWORD *)(a1 + 96) - (v16 + v13);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 2 * v16;
  if (v5)
  {
    v31 = 0;
    v32 = 0;
    v30 = 0;
    objc_msgSend(*(id *)(a1 + 40), "renderedStrip:imageDataForAsset:imageWidth:imageHeight:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", *(_QWORD *)(a1 + 48), v5, (char *)&v32 + 4, &v32, (char *)&v31 + 4, &v31, (char *)&v30 + 4, &v30);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v18 = llround(v9 * v10);
      v19 = SHIDWORD(v32) <= v13 ? 0 : (SHIDWORD(v32) - v13 + (SHIDWORD(v32) - v13 < 0)) & 0xFFFFFFFFFFFFFFFELL;
      v21 = __OFSUB__((int)v32, v18);
      v22 = (int)v32 - v18;
      v23 = ((v22 < 0) ^ v21) | (v22 == 0) ? 0 : v22 / 2;
      v24 = *(_QWORD *)(a1 + 152);
      if (v24 >= 1)
      {
        v25 = 0;
        v26 = v23 * SHIDWORD(v31);
        do
        {
          v27 = (int)v32;
          if (v24 > (int)v32 || v13 > SHIDWORD(v32))
          {
            bzero((void *)(*(_QWORD *)(a1 + 128) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)), 2 * v13);
            v27 = (int)v32;
          }
          if (v23 + v25 < v27)
          {
            v29 = SHIDWORD(v32);
            if (v13 < SHIDWORD(v32))
              v29 = v13;
            memcpy((void *)(*(_QWORD *)(a1 + 128) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)), (const void *)(objc_msgSend(objc_retainAutorelease(v17), "bytes") + v26 + v19), 2 * v29);
          }
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(a1 + 144);
          v26 += SHIDWORD(v31);
          ++v25;
          v24 = *(_QWORD *)(a1 + 152);
        }
        while (v25 < v24);
      }
    }

  }
  else if (*(uint64_t *)(a1 + 152) >= 1)
  {
    v20 = 0;
    do
    {
      memcpy((void *)(*(_QWORD *)(a1 + 128) + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24)), *(const void **)(a1 + 136), 2 * v13);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(a1 + 144);
      ++v20;
    }
    while (v20 < *(_QWORD *)(a1 + 152));
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) += v13;

}

uint64_t __30__PUGridRenderedStrip__render__block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

@end
