@implementation THWGalleryLayout

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGalleryLayout;
  -[THWContainerLayout dealloc](&v3, "dealloc");
}

- (void)p_invalidateExternal
{
  -[THWGalleryLayout invalidateFrame](self, "invalidateFrame");
  -[THWGalleryLayout invalidateChildren](self, "invalidateChildren");
}

- (void)setDelegate:(id)a3
{
  if (self->_delegate != a3)
  {
    self->_delegate = (THWWidgetLayoutDelegate *)a3;
    -[THWGalleryLayout p_invalidateExternal](self, "p_invalidateExternal");
  }
}

- (void)wasAddedToLayoutController:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWGalleryLayout;
  -[THWGalleryLayout wasAddedToLayoutController:](&v4, "wasAddedToLayoutController:", a3);
  -[THWGalleryLayout p_invalidateExternal](self, "p_invalidateExternal");
}

- (BOOL)isExpanded
{
  THWWidgetLayoutDelegate *delegate;

  delegate = self->_delegate;
  if (delegate)
    LOBYTE(delegate) = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self) == 1;
  return (char)delegate;
}

- (BOOL)isCompactFlowPresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsCompactFlow:](-[THWGalleryLayout delegate](self, "delegate"), "widgetLayoutIsCompactFlow:", self);
}

- (BOOL)isReflowablePresentation
{
  return -[THWWidgetLayoutDelegate widgetLayoutIsReflowablePresentation:](-[THWGalleryLayout delegate](self, "delegate"), "widgetLayoutIsReflowablePresentation:", self);
}

- (CGSize)p_idealForMaxSize:(CGSize)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "stageGeometry"), "frame");
  v4 = -[THWGalleryLayout p_margin](self, "p_margin");
  v6 = v5 + v5;
  v7 = TSDScaleSizeWithinSize(v4);
  v8 = v6 + TSDRoundedSize(v7);
  v10 = v6 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (double)widgetStack:(id)a3 idealHeightForMaxSize:(CGSize)a4
{
  double v4;

  -[THWGalleryLayout p_idealForMaxSize:](self, "p_idealForMaxSize:", a3, a4.width, a4.height);
  return v4;
}

- (double)widgetStack:(id)a3 stackedControlContainer:(id)a4 minHeightForLayout:(id)a5
{
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  void *v13;
  double v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *j;
  id v27;
  id v28;
  double v29;
  double v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _BYTE v41[128];

  objc_msgSend(a5, "frame", a3);
  v9 = v8;
  v11 = v10;
  v12 = objc_opt_class(THWPLayout);
  *(_QWORD *)&v14 = TSUDynamicCast(v12, a5).n128_u64[0];
  if (v13)
  {
    v15 = v13;
    if (-[THWGalleryLayout individualCaptions](self, "individualCaptions", v14))
    {
      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v16 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "items");
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v37;
        while (2)
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v19)
              objc_enumerationMutation(v16);
            v21 = objc_msgSend(*(id *)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i), "captionStorage");
            if (v21 == objc_msgSend(v15, "info"))
            {
              if ((objc_opt_respondsToSelector(a4, "styleProviderForStorage:") & 1) != 0)
              {
                v34 = 0u;
                v35 = 0u;
                v32 = 0u;
                v33 = 0u;
                v22 = objc_msgSend(-[THWGalleryLayout info](self, "info", 0), "items");
                v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                if (v23)
                {
                  v24 = v23;
                  v25 = *(_QWORD *)v33;
                  do
                  {
                    for (j = 0; j != v24; j = (char *)j + 1)
                    {
                      if (*(_QWORD *)v33 != v25)
                        objc_enumerationMutation(v22);
                      v27 = objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)j), "captionStorage");
                      v28 = objc_msgSend(objc_alloc((Class)TSWPStorageMeasurer), "initWithStorage:", v27);
                      objc_msgSend(v28, "measuredSizeWithFlags:maxSize:layoutParent:styleProvider:", 3, a4, objc_msgSend(a4, "styleProviderForStorage:", v27), v9, 4294967300.0);
                      v30 = v29;

                      if (v11 < v30)
                        v11 = v30;
                    }
                    v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
                  }
                  while (v24);
                }
              }
              return v11;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v36, v41, 16);
          if (v18)
            continue;
          break;
        }
      }
    }
  }
  return v11;
}

- (id)widgetStackTitleChildren:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  unsigned int v7;

  v4 = +[NSMutableArray array](NSMutableArray, "array", a3);
  v5 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo");
  v6 = objc_msgSend(v5, "layoutMode");
  if (v6 <= 1)
  {
    v7 = v6;
    if (objc_msgSend(v5, "titleStorage"))
      objc_msgSend(v4, "addObject:", objc_msgSend(v5, "titleStorage"));
    if (v7 == 1 && -[THWGalleryLayout currentCaptionStorage](self, "currentCaptionStorage"))
      objc_msgSend(v4, "addObject:", -[THWGalleryLayout currentCaptionStorage](self, "currentCaptionStorage"));
  }
  return v4;
}

- (id)widgetStackCaptionChildren:(id)a3
{
  id v4;
  id v5;
  unsigned int v6;
  THWPageControlLayout **p_pageControl;

  v4 = +[NSMutableArray array](NSMutableArray, "array", a3);
  v5 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo");
  v6 = objc_msgSend(v5, "layoutMode");
  if (v6)
  {
    if (v6 != 2)
      goto LABEL_7;
    if (objc_msgSend(v5, "titleStorage"))
      objc_msgSend(v4, "addObject:", objc_msgSend(v5, "titleStorage"));
  }
  if (-[THWGalleryLayout currentCaptionStorage](self, "currentCaptionStorage"))
    objc_msgSend(v4, "addObject:", -[THWGalleryLayout currentCaptionStorage](self, "currentCaptionStorage"));
LABEL_7:
  if (!-[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible")
    || (objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "isCompactWidth") & 1) != 0
    || (objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "isCompactHeight") & 1) != 0)
  {
    p_pageControl = &self->_pageControl;
    if (self->_pageControl
      && (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count") >= 2)
    {
LABEL_12:
      objc_msgSend(v4, "addObject:", *p_pageControl);
    }
  }
  else
  {
    if (self->_thumbnailTrackCanvasLayout)
      objc_msgSend(v4, "addObject:");
    p_pageControl = &self->_thumbnailPageControl;
    if (self->_thumbnailPageControl
      && -[THWGalleryLayout numberOfThumbnailTrackPages](self, "numberOfThumbnailTrackPages") > 1)
    {
      goto LABEL_12;
    }
  }
  return v4;
}

- (id)widgetStack:(id)a3 layoutGeometryForLayout:(id)a4
{
  id v7;
  id v8;

  if (self->_thumbnailPageControl == a4 || self->_pageControl == a4)
  {
    v7 = objc_alloc((Class)TSDLayoutGeometry);
    v8 = objc_msgSend(a3, "widgetStackWidth");
  }
  else
  {
    if (self->_thumbnailTrackCanvasLayout != a4)
      return 0;
    v7 = objc_alloc((Class)TSDLayoutGeometry);
    objc_msgSend(a3, "widgetStackWidth");
    v8 = -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
  }
  return objc_msgSend(v7, "initWithFrame:", TSDRectWithSize(v8));
}

- (CGSize)p_thumbnailSize
{
  unsigned int v2;
  double v3;
  double v4;
  CGSize result;

  v2 = -[THWGalleryLayout isExpanded](self, "isExpanded");
  v3 = 50.0;
  if (v2)
    v3 = 60.0;
  v4 = v3;
  result.height = v4;
  result.width = v3;
  return result;
}

- (double)p_margin
{
  double v3;
  double v4;
  unsigned __int8 v5;
  double result;
  unsigned int v7;

  objc_msgSend(-[THWGalleryLayout info](self, "info"), "contentPadding");
  v4 = v3;
  v5 = -[THWGalleryLayout isExpanded](self, "isExpanded");
  result = 10.0;
  if ((v5 & 1) == 0)
  {
    v7 = -[THWGalleryLayout isCompactFlowPresentation](self, "isCompactFlowPresentation", 10.0);
    result = 0.0;
    if (!v7)
      return v4;
  }
  return result;
}

- (double)p_internalMargin
{
  return 10.0;
}

- (id)p_itemFromChildLayout:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = objc_msgSend(a3, "info");
  if (!v4)
    return 0;
  v5 = v4;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(-[THWGalleryLayout info](self, "info", 0), "items");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v14;
LABEL_4:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v14 != v9)
      objc_enumerationMutation(v6);
    v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
    if (objc_msgSend(v11, "imageInfo") == v5 || objc_msgSend(objc_msgSend(v11, "imageInfo"), "maskInfo") == v5)
      return v11;
    if (v8 == (id)++v10)
    {
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v11 = 0;
      if (v8)
        goto LABEL_4;
      return v11;
    }
  }
}

- (unint64_t)p_indexForItem:(id)a3
{
  if (a3)
    return (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "indexOfObjectIdenticalTo:", a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)p_thumbnailsVisible
{
  return objc_msgSend(-[THWGalleryLayout info](self, "info"), "thumbnailsVisible");
}

- (BOOL)p_thumbnailsVisibleInPanel
{
  unsigned int v3;

  v3 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "thumbnailsVisible");
  if (v3)
    LOBYTE(v3) = -[THWGalleryLayout isExpanded](self, "isExpanded");
  return v3;
}

- (BOOL)p_thumbnailsVisibleOnMainCanvas
{
  _BOOL4 v3;
  BOOL v4;

  v3 = -[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible");
  if (self->_delegate)
    v4 = 1;
  else
    v4 = !v3;
  if (!v4)
    LOBYTE(v3) = objc_msgSend(0, "widgetLayoutMode:", self) != 1;
  return v3;
}

- (double)p_widgetWidth
{
  THWWidgetLayoutDelegate *delegate;
  unsigned int v4;
  double result;
  double v6;

  delegate = self->_delegate;
  if (!delegate)
    goto LABEL_5;
  v4 = -[THWWidgetLayoutDelegate widgetLayoutMode:](delegate, "widgetLayoutMode:", self);
  if (v4 - 1 < 2)
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
    return v6;
  }
  else if (v4 == 3)
  {
    objc_msgSend(objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWWidgetStackOwner), "widgetStackWidth");
  }
  else
  {
    result = 0.0;
    if (!v4)
LABEL_5:
      objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "geometry"), "size");
  }
  return result;
}

- (unint64_t)p_numberOfThumbnailPagesAndThumbnailsPerPage:(unint64_t *)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;

  if (-[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible"))
  {
    v5 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    v6 = -[THWGalleryLayout p_maxNumberOfThumbnailsPerPage](self, "p_maxNumberOfThumbnailsPerPage");
    v7 = (unint64_t)fmaxf(ceilf((float)(uint64_t)v5 / (float)v6), 1.0);
    if (!a3)
      return v7;
    goto LABEL_5;
  }
  v6 = 0;
  v7 = 0;
  if (a3)
LABEL_5:
    *a3 = v6;
  return v7;
}

- (unint64_t)p_maxNumberOfThumbnailsPerPage
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[THWGalleryLayout p_widgetWidth](self, "p_widgetWidth");
  v4 = v3;
  -[THWGalleryLayout p_margin](self, "p_margin");
  v6 = v4 + v5 * -2.0;
  -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
  if (v6 <= v7 * 2.0 + 10.0)
    return 1;
  else
    return (unint64_t)(floor((v6 - v7) / (v7 + 10.0)) + 1.0);
}

- (unint64_t)p_thumbnailPageIndexForItemIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = 0;
  -[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", &v5);
  if (v5)
    return a3 / v5;
  else
    return 0;
}

- (unint64_t)p_thumbnailCountForThumbnailPageIndex:(unint64_t)a3
{
  unint64_t v5;
  id v6;
  id v7;
  uint64_t v9;

  v9 = 0;
  -[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", &v9);
  v5 = v9 * a3;
  v6 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
  v7 = (id)(v9 + v5);
  if ((unint64_t)v6 < v9 + v5)
    v7 = v6;
  return (unint64_t)v7 - v5;
}

- (id)p_itemAtIndex:(unint64_t)a3
{
  id v4;

  v4 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "items");
  if ((unint64_t)objc_msgSend(v4, "count") <= a3)
    return 0;
  else
    return objc_msgSend(v4, "objectAtIndex:", a3);
}

- (id)p_captionStorageForItemIndex:(unint64_t)a3
{
  id v4;
  id v5;

  v4 = -[THWGalleryLayout p_itemAtIndex:](self, "p_itemAtIndex:", a3);
  if (!v4 || (v5 = objc_msgSend(v4, "captionStorage")) == 0)
    v5 = -[THWGalleryLayout p_sharedCaptionStorage](self, "p_sharedCaptionStorage");
  if (objc_msgSend(v5, "length"))
    return v5;
  else
    return 0;
}

- (id)p_sharedCaptionStorage
{
  id v2;

  v2 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "caption"), "containedStorage");
  if (objc_msgSend(v2, "length"))
    return v2;
  else
    return 0;
}

- (id)thumbnailBorderColor
{
  if (-[THWGalleryLayout isExpanded](self, "isExpanded"))
    return +[TSUColor colorWithWhite:alpha:](TSUColor, "colorWithWhite:alpha:", 1.0, 0.8);
  else
    return objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "titleColor"), "colorWithAlphaComponent:", 0.5);
}

- (void)updateCurrentItemIndex:(unint64_t)a3
{
  -[THWGalleryCaptionLayout captionStorageUpdated](self->_captionLayout, "captionStorageUpdated");
  -[THWPageControlLayout setCurrentPage:](self->_pageControl, "setCurrentPage:", a3);
  if (-[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self) == 3)
    objc_msgSend(objc_msgSend(-[THWGalleryLayout layoutController](self, "layoutController"), "ancestorLayoutOfLayout:orDelegateConformingToProtocol:", self, &OBJC_PROTOCOL___THWWidgetStackOwner), "widgetStackInvalidateChildren");
}

- (CGSize)zoomableCanvasSizeForItem:(id)a3
{
  double width;
  double height;
  CGSize result;

  if (a3)
  {
    objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
  }
  else
  {
    width = CGSizeZero.width;
    height = CGSizeZero.height;
  }
  result.height = height;
  result.width = width;
  return result;
}

- (double)zoomableItemMinimumViewScaleForItem:(id)a3
{
  double v4;
  double v5;
  double result;
  CGFloat v7;

  if (!a3)
    return 1.0;
  objc_msgSend(objc_msgSend(a3, "imageInfo"), "naturalSize");
  if (v4 <= 0.0)
    v4 = 1.0;
  if (v5 <= 0.0)
    v5 = 1.0;
  result = self->_stageFrame.size.width / v4;
  v7 = self->_stageFrame.size.height / v5;
  if (result >= v7)
    result = v7;
  if (result > 1.0)
    return 1.0;
  return result;
}

- (id)currentCaptionStorage
{
  return -[THWGalleryLayout p_captionStorageForItemIndex:](self, "p_captionStorageForItemIndex:", -[THWPageControlLayout currentPage](self->_pageControl, "currentPage"));
}

- (id)captionStorageForItemIndex:(unint64_t)a3
{
  return -[THWGalleryLayout p_captionStorageForItemIndex:](self, "p_captionStorageForItemIndex:", a3);
}

- (id)sharedCaptionStorage
{
  if (self->_captionLayout)
    return 0;
  else
    return -[THWGalleryLayout p_sharedCaptionStorage](self, "p_sharedCaptionStorage");
}

- (double)expandedLeftRightInsetForCaption
{
  unint64_t v3;
  double v4;
  double v5;
  double v6;

  v3 = -[THWGalleryLayout p_maxNumberOfThumbnailsPerPage](self, "p_maxNumberOfThumbnailsPerPage");
  -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
  v5 = v4;
  -[THWGalleryLayout p_widgetWidth](self, "p_widgetWidth");
  return (v6 - v5 * (double)v3 - (double)(10 * v3 - 10)) * 0.5 + -8.0;
}

- (BOOL)expandedHasContentForPanel:(int)a3
{
  id v4;

  if (a3 == 2)
    return -[THWGalleryLayout thumbnailsVisibleInPanel](self, "thumbnailsVisibleInPanel");
  if (a3 == 1)
  {
    if (-[THWGalleryLayout individualCaptions](self, "individualCaptions"))
      return 1;
    v4 = -[THWGalleryLayout sharedCaptionStorage](self, "sharedCaptionStorage");
  }
  else
  {
    if (a3)
      return 0;
    v4 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "title");
  }
  return v4 != 0;
}

- (unint64_t)thumbnailPageIndexForItemIndex:(unint64_t)a3
{
  unint64_t v5;

  v5 = 0;
  -[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", &v5);
  if (v5)
    return a3 / v5;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (CGSize)thumbnailTrackSizeWithPanelWidth:(double)a3
{
  double v4;
  double v5;
  CGSize result;

  -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
  v5 = a3;
  result.height = v4;
  result.width = v5;
  return result;
}

- (double)thumbnailTrackVerticalPadding
{
  return 12.0;
}

- (id)thumbnailTrackAdditionalLayoutsInExpandedPanel:(int)a3
{
  NSArray *v6;
  THWPageControlLayout *thumbnailPageControl;
  THWPagedCanvasControlLayout *thumbnailTrackCanvasLayout;
  THWGalleryCaptionLayout *captionLayout;

  -[THWGalleryLayout p_updatePagesAndThumbnailLayouts](self, "p_updatePagesAndThumbnailLayouts");
  -[THWGalleryLayout p_updateCaption](self, "p_updateCaption");
  if (a3 == 2)
  {
    if (self->_thumbnailTrackCanvasLayout)
    {
      thumbnailTrackCanvasLayout = self->_thumbnailTrackCanvasLayout;
      v6 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &thumbnailTrackCanvasLayout, 1);
    }
    else
    {
      v6 = 0;
    }
    thumbnailPageControl = self->_thumbnailPageControl;
    if (thumbnailPageControl && -[THWPageControlLayout numberOfPages](thumbnailPageControl, "numberOfPages") >= 2)
      return -[NSArray arrayByAddingObject:](v6, "arrayByAddingObject:", self->_thumbnailPageControl);
  }
  else
  {
    if (a3 == 1 && self->_captionLayout)
    {
      captionLayout = self->_captionLayout;
      return +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &captionLayout, 1);
    }
    return 0;
  }
  return v6;
}

- (id)zoomableCanvasControlLayoutForItemIndex:(unint64_t)a3
{
  if (-[NSArray count](self->_zoomableCanvasControls, "count") <= a3)
    return 0;
  else
    return -[NSArray objectAtIndex:](self->_zoomableCanvasControls, "objectAtIndex:", a3);
}

- (BOOL)individualCaptions
{
  return self->_captionLayout != 0;
}

- (id)layoutGeometryFromProvider
{
  double v3;
  double v4;
  double v5;
  double v6;
  objc_super v8;

  if (-[THWGalleryLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
    return objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v3, v4, v5, v6);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)THWGalleryLayout;
    return -[THWGalleryLayout layoutGeometryFromProvider](&v8, "layoutGeometryFromProvider");
  }
}

- (id)computeLayoutGeometry
{
  id v3;
  double v4;
  CGFloat v5;
  unsigned int v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  id v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  CGFloat y;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  objc_super v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;
  CGRect v34;

  v30.receiver = self;
  v30.super_class = (Class)THWGalleryLayout;
  v3 = -[THWGalleryLayout computeLayoutGeometry](&v30, "computeLayoutGeometry");
  -[THWGalleryLayout p_margin](self, "p_margin");
  v5 = v4;
  v6 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self);
  if (v6 == 3)
  {
    objc_msgSend(v3, "size");
    v12 = TSDRectWithSize(-[THWGalleryLayout p_idealForMaxSize:](self, "p_idealForMaxSize:"));
    TSDRectWithSize(objc_msgSend(v3, "size"));
    self->_stageFrame.origin.x = TSDCenterRectOverRect(v12);
    self->_stageFrame.origin.y = v13;
    self->_stageFrame.size.width = v14;
    self->_stageFrame.size.height = v15;
    v16 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "stageGeometry");
LABEL_6:
    objc_msgSend(v16, "cornerRadius");
    goto LABEL_7;
  }
  if (v6 != 1)
  {
    v17 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "stageGeometry");
    objc_msgSend(v17, "frame");
    self->_stageFrame.origin.x = v18;
    self->_stageFrame.origin.y = v19;
    self->_stageFrame.size.width = v20;
    self->_stageFrame.size.height = v21;
    v16 = v17;
    goto LABEL_6;
  }
  -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
  self->_stageFrame.origin.x = v7;
  self->_stageFrame.origin.y = v8;
  self->_stageFrame.size.width = v9;
  self->_stageFrame.size.height = v10;
  v11 = 0.0;
LABEL_7:
  self->_stageCornerRadius = v11;
  -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
  v23 = v22;
  y = CGPointZero.y;
  objc_msgSend(v3, "size");
  v26 = v25;
  v28 = v27;
  if (-[THWGalleryLayout p_thumbnailsVisibleOnMainCanvas](self, "p_thumbnailsVisibleOnMainCanvas"))
  {
    v31.origin.x = CGPointZero.x;
    v31.origin.y = y;
    v31.size.width = v26;
    v31.size.height = v28;
    v32 = CGRectInset(v31, 0.0, v5);
    self->_thumbnailTrackFrame.origin.x = v32.origin.x;
    self->_thumbnailTrackFrame.origin.y = v32.origin.y + v32.size.height - v23;
    self->_thumbnailTrackFrame.size.width = v32.size.width;
    self->_thumbnailTrackFrame.size.height = v23;
    if (-[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", 0) >= 2)self->_thumbnailTrackFrame.origin.y = self->_thumbnailTrackFrame.origin.y + -15.0;
  }
  v33.origin.x = CGPointZero.x;
  v33.origin.y = y;
  v33.size.width = v26;
  v33.size.height = v28;
  v34 = CGRectInset(v33, v5, v5);
  self->_pageControlFrame.size.width = v34.size.width;
  self->_pageControlFrame.origin.x = v34.origin.x;
  self->_pageControlFrame.origin.y = v34.origin.y + v34.size.height + -15.0;
  self->_pageControlFrame.size.height = 25.0;
  -[THWGalleryLayout p_updatePagesAndThumbnailLayouts](self, "p_updatePagesAndThumbnailLayouts");
  return v3;
}

- (void)updateChildrenFromInfo
{
  THWPageControlLayout *v3;
  THWPageControlLayout *v4;
  THWPagedCanvasControlLayout *v5;
  objc_super v6;

  if (!self->_pageControl)
  {
    v3 = -[THWControlLayout initWithTag:]([THWPageControlLayout alloc], "initWithTag:", 3);
    self->_pageControl = v3;
    -[THWPageControlLayout setCurrentPage:](v3, "setCurrentPage:", 0);
  }
  if (!self->_thumbnailPageControl)
  {
    v4 = -[THWControlLayout initWithTag:]([THWPageControlLayout alloc], "initWithTag:", 4);
    self->_thumbnailPageControl = v4;
    -[THWPageControlLayout setCurrentPage:](v4, "setCurrentPage:", 0);
  }
  if (!self->_stageCanvasLayout)
    self->_stageCanvasLayout = -[THWControlLayout initWithTag:]([THWPagedCanvasControlLayout alloc], "initWithTag:", 0);
  if (!self->_thumbnailTrackCanvasLayout && -[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible"))
  {
    v5 = -[THWControlLayout initWithTag:]([THWPagedCanvasControlLayout alloc], "initWithTag:", 1);
    self->_thumbnailTrackCanvasLayout = v5;
    -[THWPagedCanvasControlLayout setDelegate:](v5, "setDelegate:", self);
  }
  -[THWGalleryLayout p_updatePagesAndThumbnailLayouts](self, "p_updatePagesAndThumbnailLayouts");
  -[THWGalleryLayout p_updateCaption](self, "p_updateCaption");
  v6.receiver = self;
  v6.super_class = (Class)THWGalleryLayout;
  -[THWContainerLayout updateChildrenFromInfo](&v6, "updateChildrenFromInfo");
}

- (BOOL)p_hasIndividualCaptions
{
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];

  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(-[THWGalleryLayout info](self, "info", 0), "items");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        if (objc_msgSend(objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6), "captionStorage"), "length"))
        {
          LOBYTE(v3) = 1;
          return (char)v3;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = v3;
      if (v3)
        continue;
      break;
    }
  }
  return (char)v3;
}

- (void)p_updateCaption
{
  unsigned int v3;
  THWGalleryCaptionLayout *captionLayout;
  THWGalleryCaptionLayout *v5;

  v3 = -[THWGalleryLayout p_hasIndividualCaptions](self, "p_hasIndividualCaptions");
  captionLayout = self->_captionLayout;
  if (v3)
  {
    if (captionLayout)
      return;
    v5 = -[THWGalleryCaptionLayout initWithDelegate:]([THWGalleryCaptionLayout alloc], "initWithDelegate:", self);
  }
  else
  {
    if (!captionLayout)
      return;

    v5 = 0;
  }
  self->_captionLayout = v5;
}

- (void)p_updatePagesAndThumbnailLayouts
{
  NSArray *zoomableCanvasPages;
  id v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *j;
  void *v10;
  id v11;
  id v12;
  char *v13;
  char *v14;
  char *i;
  THWControlContainer *v16;
  THWZoomableCanvasControlLayout *v17;
  unint64_t v18;
  NSUInteger v19;
  id v20;
  uint64_t k;
  THWControlContainer *v22;
  char *v23;
  id v24;
  char *m;
  THWButtonControlLayout *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];

  -[THWPageControlLayout setNumberOfPages:](self->_pageControl, "setNumberOfPages:", objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count"));
  -[THWPageControlLayout setNumberOfPages:](self->_thumbnailPageControl, "setNumberOfPages:", -[THWGalleryLayout numberOfThumbnailTrackPages](self, "numberOfThumbnailTrackPages"));
  if (-[THWGalleryLayout useZoom](self, "useZoom"))
  {
    zoomableCanvasPages = self->_zoomableCanvasPages;
    if (!zoomableCanvasPages)
    {
      if (self->_zoomableCanvasControls)
      {
        zoomableCanvasPages = 0;
      }
      else
      {
        v11 = objc_alloc_init((Class)NSMutableArray);
        v12 = objc_alloc_init((Class)NSMutableArray);
        v13 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
        if (v13)
        {
          v14 = v13;
          for (i = 0; i != v14; ++i)
          {
            v16 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
            -[THWControlContainer setTag:](v16, "setTag:", 6);
            -[THWControlContainer setIndex:](v16, "setIndex:", i);
            objc_msgSend(v11, "addObject:", v16);

            v17 = -[THWControlLayout initWithTag:index:]([THWZoomableCanvasControlLayout alloc], "initWithTag:index:", 7, i);
            objc_msgSend(v12, "addObject:", v17);

          }
        }
        self->_zoomableCanvasPages = (NSArray *)objc_msgSend(v11, "copy");

        self->_zoomableCanvasControls = (NSArray *)objc_msgSend(v12, "copy");
        zoomableCanvasPages = self->_zoomableCanvasPages;
      }
    }
  }
  else
  {
    zoomableCanvasPages = self->_imageInfos;
    if (!zoomableCanvasPages)
    {
      v4 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "items");
      v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v28;
        do
        {
          for (j = 0; j != v7; j = (char *)j + 1)
          {
            if (*(_QWORD *)v28 != v8)
              objc_enumerationMutation(v4);
            v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)j);
            if (objc_msgSend(v10, "imageInfo"))
              objc_msgSend(v5, "addObject:", objc_msgSend(v10, "imageInfo"));
          }
          v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v7);
      }
      self->_imageInfos = (NSArray *)objc_msgSend(v5, "copy");

      zoomableCanvasPages = self->_imageInfos;
    }
  }
  -[THWGalleryLayout setStageInfos:](self, "setStageInfos:", zoomableCanvasPages);
  if (-[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible"))
  {
    v18 = -[THWPageControlLayout numberOfPages](self->_thumbnailPageControl, "numberOfPages");
    v19 = -[NSArray count](self->_thumbnailControlPages, "count");
    if (v19 != v18)
    {

      self->_thumbnailControlPages = 0;
      if (v18)
      {
        v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v18);
        for (k = 0; k != v18; ++k)
        {
          v22 = -[THWControlContainer initWithDelegate:]([THWControlContainer alloc], "initWithDelegate:", self);
          -[THWControlContainer setTag:](v22, "setTag:", 2);
          -[THWControlContainer setIndex:](v22, "setIndex:", k);
          objc_msgSend(v20, "addObject:", v22);

        }
        self->_thumbnailControlPages = (NSArray *)objc_msgSend(v20, "copy");

      }
    }
    v23 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    if (v19 != v18 || v23 != (char *)-[NSArray count](self->_thumbnailButtons, "count"))
    {

      self->_thumbnailButtons = 0;
      if (v23)
      {
        v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v23);
        for (m = 0; m != v23; ++m)
        {
          v26 = objc_alloc_init(THWButtonControlLayout);
          -[THWControlLayout setTag:](v26, "setTag:", 5);
          -[THWControlLayout setIndex:](v26, "setIndex:", m);
          objc_msgSend(v24, "addObject:", v26);

        }
        self->_thumbnailButtons = (NSArray *)objc_msgSend(v24, "copy");

      }
    }
  }
  else
  {

    self->_thumbnailControlPages = 0;
    self->_thumbnailButtons = 0;
  }
}

- (id)dependentLayouts
{
  id v3;
  THWGalleryCaptionLayout *captionLayout;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWGalleryLayout;
  v3 = objc_msgSend(-[THWGalleryLayout dependentLayouts](&v6, "dependentLayouts"), "mutableCopy");
  if (!v3)
    v3 = +[NSMutableArray array](NSMutableArray, "array");
  objc_msgSend(v3, "addObjectsFromArray:", -[THWGalleryLayout children](self, "children"));
  if (-[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self) != 3)
  {
    captionLayout = self->_captionLayout;
    if (captionLayout)
      -[THWGalleryCaptionLayout addDescendentLayoutsToArray:](captionLayout, "addDescendentLayoutsToArray:", v3);
  }
  return v3;
}

- (id)layoutGeometryForLayout:(id)a3
{
  id v5;
  unint64_t v6;
  id result;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;
  id v18;
  CGFloat y;
  double x;
  double v21;
  double *v22;
  double v23;
  double v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  unint64_t v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  CGRect *p_stageFrame;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  id v57;
  id v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  unint64_t v62;
  float v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double width;
  double height;
  double v70;
  id v71;
  id v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  unint64_t v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v5 = -[THWGalleryLayout p_itemFromChildLayout:](self, "p_itemFromChildLayout:");
  v6 = -[THWGalleryLayout p_indexForItem:](self, "p_indexForItem:", v5);
  result = (id)TSUProtocolCast(&OBJC_PROTOCOL___THWControl, a3);
  if (!result)
  {
    if (!v5 || v6 == 0x7FFFFFFFFFFFFFFFLL)
      return result;
    v11 = objc_msgSend(v5, "imageInfo");
    if (v11 == objc_msgSend(a3, "info")
      || (v12 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo"), v12 == objc_msgSend(a3, "info")))
    {
      if (-[THWGalleryLayout isExpanded](self, "isExpanded") && !-[THWGalleryLayout useZoom](self, "useZoom"))
      {
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        width = self->_stageFrame.size.width;
        height = self->_stageFrame.size.height;
        if (v66 <= 0.0)
          v66 = 1.0;
        if (v67 <= 0.0)
          v67 = 1.0;
        v14 = TSDShrinkSizeToFitInSize(v66, v67, self->_stageFrame.size.width, self->_stageFrame.size.height);
        v16 = v70;
        v71 = objc_msgSend(v5, "imageInfo");
        if (v71 == objc_msgSend(a3, "info"))
        {
          v74 = (width - v14) * 0.5;
          v75 = width * (double)v6;
          v76 = (height - v16) * 0.5 + 0.0;
          v77 = v75 + v74;
          v9 = objc_alloc((Class)TSDLayoutGeometry);
          x = v77;
          v21 = v76;
          goto LABEL_49;
        }
        v72 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo");
        if (v72 == objc_msgSend(a3, "info"))
        {
          v9 = objc_alloc((Class)TSDLayoutGeometry);
          x = 0.0;
          v21 = 0.0;
          goto LABEL_49;
        }
      }
      else if (-[THWGalleryLayout isExpanded](self, "isExpanded") && -[THWGalleryLayout useZoom](self, "useZoom"))
      {
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        v14 = v13;
        v16 = v15;
        v17 = objc_msgSend(v5, "imageInfo");
        if (v17 == objc_msgSend(a3, "info")
          || (v18 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo"), v18 == objc_msgSend(a3, "info")))
        {
          y = CGPointZero.y;
          v9 = objc_alloc((Class)TSDLayoutGeometry);
          x = CGPointZero.x;
          v21 = y;
LABEL_49:
          v23 = v14;
          v24 = v16;
          return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
        }
      }
      else
      {
        objc_msgSend(v5, "cropRect");
        v39 = v38;
        v41 = v40;
        v43 = v42;
        v45 = v44;
        objc_msgSend(objc_msgSend(v5, "imageInfo"), "naturalSize");
        v80 = v47;
        v81 = v46;
        if (v43 <= 0.0)
          v48 = 1.0;
        else
          v48 = v43;
        if (v45 <= 0.0)
          v49 = 1.0;
        else
          v49 = v45;
        p_stageFrame = &self->_stageFrame;
        v79 = CGRectGetWidth(self->_stageFrame);
        v83.origin.x = v39;
        v83.origin.y = v41;
        v83.size.width = v48;
        v83.size.height = v49;
        v78 = CGRectGetWidth(v83);
        v51 = CGRectGetHeight(self->_stageFrame);
        v84.origin.x = v39;
        v84.origin.y = v41;
        v84.size.width = v48;
        v84.size.height = v49;
        v52 = CGRectGetHeight(v84);
        v53 = CGRectGetWidth(self->_stageFrame);
        v85.origin.x = v39;
        v85.origin.y = v41;
        v85.size.width = v48;
        v85.size.height = v49;
        v54 = v39 * (v53 / CGRectGetWidth(v85));
        v55 = CGRectGetHeight(self->_stageFrame);
        v86.origin.x = v39;
        v86.origin.y = v41;
        v86.size.width = v48;
        v86.size.height = v49;
        v56 = v41 * (v55 / CGRectGetHeight(v86));
        v57 = objc_msgSend(v5, "imageInfo");
        if (v57 == objc_msgSend(a3, "info"))
        {
          v37 = v80 * (v51 / v52);
          v73 = -(v54 - (double)v6 * p_stageFrame->size.width);
          v9 = objc_alloc((Class)TSDLayoutGeometry);
          x = v73;
          v21 = -v56;
          v23 = v81 * (v79 / v78);
LABEL_46:
          v24 = v37;
          return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
        }
        v58 = objc_msgSend(objc_msgSend(v5, "imageInfo"), "maskInfo");
        if (v58 == objc_msgSend(a3, "info"))
        {
          v59 = p_stageFrame->size.width;
          v60 = p_stageFrame->size.height;
          v9 = objc_alloc((Class)TSDLayoutGeometry);
          x = v54;
          v21 = v56;
          v23 = v59;
          v24 = v60;
          return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
        }
      }
    }
    return 0;
  }
  v8 = result;
  switch((unint64_t)objc_msgSend(result, "tag"))
  {
    case 0uLL:
      v9 = objc_alloc((Class)TSDLayoutGeometry);
      v10 = 384;
      goto LABEL_18;
    case 1uLL:
      if (!-[THWGalleryLayout p_thumbnailsVisibleOnMainCanvas](self, "p_thumbnailsVisibleOnMainCanvas"))
        return 0;
      v9 = objc_alloc((Class)TSDLayoutGeometry);
      v10 = 416;
      goto LABEL_18;
    case 2uLL:
      v25 = objc_alloc((Class)TSDLayoutGeometry);
      v26 = self->_thumbnailTrackFrame.size.width;
      x = v26 * (double)(unint64_t)objc_msgSend(v8, "index");
      v23 = self->_thumbnailTrackFrame.size.width;
      v24 = self->_thumbnailTrackFrame.size.height;
      v21 = 0.0;
      v9 = v25;
      return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
    case 3uLL:
    case 4uLL:
      v9 = objc_alloc((Class)TSDLayoutGeometry);
      v10 = 448;
LABEL_18:
      v22 = (double *)&self->super.TSDContainerLayout_opaque[v10];
      x = *v22;
      v21 = v22[1];
      v23 = v22[2];
      v24 = v22[3];
      return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
    case 5uLL:
      -[THWGalleryLayout p_thumbnailSize](self, "p_thumbnailSize");
      v28 = v27;
      v30 = v29;
      v82 = 1;
      if ((char *)-[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", &v82) == (char *)&dword_0 + 1)
      {
        v31 = (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
        v82 = v31;
        if (v31)
          goto LABEL_36;
      }
      else
      {
        v31 = v82;
        if (v82)
          goto LABEL_36;
      }
      v31 = 1;
      v82 = 1;
LABEL_36:
      v61 = (self->_thumbnailTrackFrame.size.width - v28 * (double)v31 - (double)(10 * v31 - 10)) * 0.5 + 0.0;
      v62 = (unint64_t)objc_msgSend(v8, "index");
      v63 = v61 + (double)(v62 % v82) * (v28 + 10.0);
      v64 = floorf(v63);
      -[THWGalleryLayout thumbnailTrackVerticalPadding](self, "thumbnailTrackVerticalPadding");
      result = objc_msgSend(objc_alloc((Class)TSDLayoutGeometry), "initWithFrame:", v64, v65, v28, v30);
      break;
    case 6uLL:
      v32 = self->_stageFrame.size.width;
      v33 = v32 * (double)(unint64_t)objc_msgSend(v8, "index");
      v34 = self->_stageFrame.size.width;
      v35 = self->_stageFrame.size.height;
      v9 = objc_alloc((Class)TSDLayoutGeometry);
      v21 = 0.0;
      x = v33;
      v23 = v34;
      v24 = v35;
      return objc_msgSend(v9, "initWithFrame:", x, v21, v23, v24);
    case 7uLL:
      v36 = self->_stageFrame.size.width;
      v37 = self->_stageFrame.size.height;
      v9 = objc_alloc((Class)TSDLayoutGeometry);
      x = 0.0;
      v21 = 0.0;
      v23 = v36;
      goto LABEL_46;
    default:
      return 0;
  }
  return result;
}

- (id)childrenForLayout
{
  id v3;
  unsigned int v4;
  id v5;
  id v6;
  THWPageControlLayout *thumbnailPageControl;
  id v9;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[THWWidgetLayoutDelegate widgetLayoutMode:](self->_delegate, "widgetLayoutMode:", self);
  if (!v4)
  {
    v5 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "childInfos");
    if (objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"))
      v5 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "interleavedInfosWithInfos:", v5);
    if (-[THWGalleryLayout individualCaptions](self, "individualCaptions"))
    {
      v6 = objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "caption");
      if (v6)
      {
        v9 = v6;
        v5 = objc_msgSend(v5, "tsu_arrayByRemovingObjectsIdenticalToObjectsInArray:", +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
      }
    }
    objc_msgSend(v3, "addObjectsFromArray:", v5);
  }
  if (self->_stageCanvasLayout)
    objc_msgSend(v3, "addObject:");
  if (!v4)
  {
    if (-[THWGalleryLayout p_thumbnailsVisibleOnMainCanvas](self, "p_thumbnailsVisibleOnMainCanvas"))
    {
      if (self->_thumbnailTrackCanvasLayout)
        objc_msgSend(v3, "addObject:");
      if (-[THWGalleryLayout numberOfThumbnailTrackPages](self, "numberOfThumbnailTrackPages") < 2)
        goto LABEL_19;
      thumbnailPageControl = self->_thumbnailPageControl;
    }
    else if ((unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count") < 2
           || (thumbnailPageControl = self->_pageControl) == 0)
    {
LABEL_19:
      if (self->_captionLayout)
        objc_msgSend(v3, "addObject:");
      return v3;
    }
    objc_msgSend(v3, "addObject:", thumbnailPageControl);
    goto LABEL_19;
  }
  return v3;
}

- (unint64_t)numberOfStagePages
{
  return (unint64_t)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
}

- (unint64_t)numberOfThumbnailTrackPages
{
  return -[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", 0);
}

- (id)infosForThumbnailTrackPages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (-[THWGalleryLayout p_thumbnailsVisible](self, "p_thumbnailsVisible")
    && location + length <= -[NSArray count](self->_thumbnailControlPages, "count"))
  {
    return -[NSArray subarrayWithRange:](self->_thumbnailControlPages, "subarrayWithRange:", location, length);
  }
  else
  {
    return 0;
  }
}

- (id)infosForStagePages:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length <= -[NSArray count](self->_stageInfos, "count"))
    return -[NSArray subarrayWithRange:](self->_stageInfos, "subarrayWithRange:", location, length);
  else
    return 0;
}

- (id)pageIndexesFromStageReps:(id)a3
{
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  id v10;
  NSArray *stageInfos;
  BOOL v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = +[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(a3);
        v10 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i), "info");
        stageInfos = self->_stageInfos;
        if (stageInfos)
          v12 = v10 == 0;
        else
          v12 = 1;
        if (!v12)
        {
          v13 = -[NSArray indexOfObjectIdenticalTo:](stageInfos, "indexOfObjectIdenticalTo:");
          if (v13 != (id)0x7FFFFFFFFFFFFFFFLL)
            objc_msgSend(v5, "addIndex:", v13);
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }
  return v5;
}

- (id)p_nonEmptyCaptionStorage
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = objc_msgSend(objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "caption"), "containedStorage");
  if (!objc_msgSend(v3, "length"))
  {
    v4 = objc_msgSend(-[THWGalleryLayout info](self, "info"), "items");
    v5 = objc_msgSend(v4, "count");
    if (v5)
      v5 = objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = objc_msgSend(v5, "captionStorage");
    if (objc_msgSend(v6, "length"))
      return v6;
    else
      return 0;
  }
  return v3;
}

- (__CTFont)createFontFromCaption
{
  __CTFont *result;

  result = -[THWGalleryLayout p_nonEmptyCaptionStorage](self, "p_nonEmptyCaptionStorage");
  if (result)
    return (__CTFont *)TSWPFastCreateFontForStyle(-[__CTFont characterStyleAtCharIndex:effectiveRange:](result, "characterStyleAtCharIndex:effectiveRange:", 0, 0), -[__CTFont paragraphStyleAtCharIndex:effectiveRange:](result, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0), 100);
  return result;
}

- (id)colorFromCaption
{
  id result;

  result = -[THWGalleryLayout p_nonEmptyCaptionStorage](self, "p_nonEmptyCaptionStorage");
  if (result)
    return (id)TSWPResolveColorForStyles(objc_msgSend(result, "characterStyleAtCharIndex:effectiveRange:", 0, 0), objc_msgSend(result, "paragraphStyleAtCharIndex:effectiveRange:", 0, 0));
  return result;
}

- (id)colorFromTitle
{
  return objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "adornmentInfo"), "titleColor");
}

- (BOOL)stageVisible
{
  return 1;
}

- (id)controlContainerAdditionalChildLayouts:(id)a3
{
  id v5;
  char *v6;
  unint64_t v7;
  uint64_t v8;
  char *v9;
  NSUInteger v10;
  id result;
  unint64_t v12;
  id v13;
  uint64_t v14;

  if (objc_msgSend(a3, "tag") == (char *)&dword_0 + 2)
  {
    v5 = objc_msgSend(a3, "index");
    v14 = 0;
    -[THWGalleryLayout p_numberOfThumbnailPagesAndThumbnailsPerPage:](self, "p_numberOfThumbnailPagesAndThumbnailsPerPage:", &v14);
    v6 = (char *)objc_msgSend(objc_msgSend(-[THWGalleryLayout info](self, "info"), "items"), "count");
    v7 = (unint64_t)v6;
    v8 = v14;
    if ((unint64_t)v6 >= v8 + v8 * (uint64_t)v5)
      v9 = (char *)(v14 + v14 * (_QWORD)v5);
    else
      v9 = v6;
    v10 = -[NSArray count](self->_thumbnailButtons, "count");
    result = 0;
    if ((unint64_t)v9 <= v10)
    {
      if (v7 >= v8 * (uint64_t)v5)
        v12 = v8 * (_QWORD)v5;
      else
        v12 = v7;
      return -[NSArray subarrayWithRange:](self->_thumbnailButtons, "subarrayWithRange:", v12, &v9[-v12]);
    }
  }
  else if (objc_msgSend(a3, "tag") == (char *)&dword_4 + 2
         && (v13 = objc_msgSend(a3, "index"), v13 < (id)-[NSArray count](self->_zoomableCanvasControls, "count")))
  {
    result = -[NSArray objectAtIndex:](self->_zoomableCanvasControls, "objectAtIndex:", v13);
    if (result)
      return +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", result);
  }
  else
  {
    return 0;
  }
  return result;
}

- (void)pagedCanvasControlLayoutDidValidate:(id)a3
{
  CGFloat v5;
  CGFloat v6;

  if (self->_thumbnailTrackCanvasLayout == a3)
  {
    if (-[THWGalleryLayout p_thumbnailsVisibleInPanel](self, "p_thumbnailsVisibleInPanel"))
    {
      objc_msgSend(objc_msgSend(a3, "geometry"), "size");
      self->_thumbnailTrackFrame.origin = CGPointZero;
      self->_thumbnailTrackFrame.size.width = v5;
      self->_thumbnailTrackFrame.size.height = v6;
      -[THWGalleryLayout p_updatePagesAndThumbnailLayouts](self, "p_updatePagesAndThumbnailLayouts");
    }
  }
}

- (CGPoint)galleryCaptionPosition
{
  double v2;
  double v3;
  CGPoint result;

  objc_msgSend(-[THWGalleryLayout info](self, "info"), "captionPosition");
  result.y = v3;
  result.x = v2;
  return result;
}

- (double)galleryCaptionWidth
{
  double v3;
  double result;

  if (-[THWGalleryLayout isExpanded](self, "isExpanded"))
  {
    -[THWWidgetLayoutDelegate widgetLayoutBounds](self->_delegate, "widgetLayoutBounds");
    return v3;
  }
  else
  {
    objc_msgSend(-[THWGalleryLayout geometry](self, "geometry"), "size");
  }
  return result;
}

- (THWWidgetLayoutDelegate)delegate
{
  return self->_delegate;
}

- (CGRect)stageFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_stageFrame.origin.x;
  y = self->_stageFrame.origin.y;
  width = self->_stageFrame.size.width;
  height = self->_stageFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)thumbnailTrackFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_thumbnailTrackFrame.origin.x;
  y = self->_thumbnailTrackFrame.origin.y;
  width = self->_thumbnailTrackFrame.size.width;
  height = self->_thumbnailTrackFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)pageControlFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_pageControlFrame.origin.x;
  y = self->_pageControlFrame.origin.y;
  width = self->_pageControlFrame.size.width;
  height = self->_pageControlFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (double)stageCornerRadius
{
  return self->_stageCornerRadius;
}

- (THWPageControlLayout)pageControl
{
  return self->_pageControl;
}

- (THWPageControlLayout)thumbnailPageControl
{
  return self->_thumbnailPageControl;
}

- (THWPagedCanvasControlLayout)thumbnailTrackCanvasLayout
{
  return self->_thumbnailTrackCanvasLayout;
}

- (NSArray)stageInfos
{
  return self->_stageInfos;
}

- (void)setStageInfos:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 320);
}

- (NSArray)imageInfos
{
  return self->_imageInfos;
}

- (NSArray)thumbnailControlPages
{
  return self->_thumbnailControlPages;
}

- (NSArray)thumbnailButtons
{
  return self->_thumbnailButtons;
}

- (THWPagedCanvasControlLayout)stageCanvasLayout
{
  return self->_stageCanvasLayout;
}

- (NSArray)zoomableCanvasPages
{
  return self->_zoomableCanvasPages;
}

- (NSArray)zoomableCanvasControls
{
  return self->_zoomableCanvasControls;
}

- (THWGalleryCaptionLayout)captionLayout
{
  return self->_captionLayout;
}

@end
