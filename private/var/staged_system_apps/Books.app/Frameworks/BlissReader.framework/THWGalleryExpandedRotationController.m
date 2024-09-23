@implementation THWGalleryExpandedRotationController

- (THWGalleryExpandedRotationController)initWithRep:(id)a3 pagedCanvasController:(id)a4 zoomableCanvasController:(id)a5
{
  THWGalleryExpandedRotationController *v8;
  CGFloat v9;
  CGFloat v10;
  double v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)THWGalleryExpandedRotationController;
  v8 = -[THWGalleryExpandedRotationController init](&v13, "init");
  if (v8)
  {
    v8->_rep = (THWGalleryRep *)a3;
    v8->_pagedCanvasController = (THWPagedCanvasController *)a4;
    v8->_zoomableCanvasController = (THWZoomableCanvasController *)a5;
    if (a5)
    {
      objc_msgSend(a5, "contentOffsetForAnchor:", 0.5, 0.5);
      v8->_contentCenterOffset.x = v9;
      v8->_contentCenterOffset.y = v10;
      objc_msgSend(objc_msgSend(a5, "interactiveCanvasController"), "viewScale");
    }
    else
    {
      v8->_contentCenterOffset = CGPointZero;
      v11 = 1.0;
    }
    v8->_targetViewScale = v11;
    v8->_scale = 1.0;
    v8->_translate = CGPointZero;
    v8->_pageIndex = -[THWPagedCanvasController pageIndex](v8->_pagedCanvasController, "pageIndex");
  }
  return v8;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWGalleryExpandedRotationController;
  -[THWGalleryExpandedRotationController dealloc](&v3, "dealloc");
}

- (void)p_updateOtherItemLayers:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v3 = a3;
  v5 = -[THWGalleryRep currentItem](self->_rep, "currentItem");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = objc_msgSend(-[THWGalleryRep info](self->_rep, "info", 0), "items");
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10) != v5)
          objc_msgSend(-[THWGalleryRep p_layerForItem:](self->_rep, "p_layerForItem:"), "setHidden:", v3);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }
}

- (int)autoRotationMode
{
  return 3;
}

- (double)scaleForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  return self->_scale;
}

- (CGPoint)translateForCenteredAutoRotateFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double x;
  double y;
  CGPoint result;

  x = self->_translate.x;
  y = self->_translate.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)expandedWillRotateTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  -[THWGalleryExpandedRotationController p_updateOtherItemLayers:](self, "p_updateOtherItemLayers:", 1, a3.width, a3.height, a4.width, a4.height);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 0);
  -[THScrollView setClipsToBounds:](-[THWPagedCanvasController scrollView](self->_pagedCanvasController, "scrollView"), "setClipsToBounds:", 0);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWZoomableCanvasController interactiveCanvasController](self->_zoomableCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 0);
  -[TSKScrollView setClipsToBounds:](-[THWZoomableCanvasController scrollView](self->_zoomableCanvasController, "scrollView"), "setClipsToBounds:", 0);
}

- (void)expandedDidRotateTransitionToSize:(CGSize)a3
{
  -[THWGalleryExpandedRotationController p_layoutWithSize:](self, "p_layoutWithSize:", a3.width, a3.height);
  objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "setClipsToBounds:", 1);
  -[THScrollView setClipsToBounds:](-[THWPagedCanvasController scrollView](self->_pagedCanvasController, "scrollView"), "setClipsToBounds:", 1);
  objc_msgSend(objc_msgSend(objc_msgSend(-[TSDInteractiveCanvasController layerHost](-[THWZoomableCanvasController interactiveCanvasController](self->_zoomableCanvasController, "interactiveCanvasController"), "layerHost"), "canvasView"), "layer"), "setMasksToBounds:", 1);
  objc_msgSend(-[TSKScrollView layer](-[THWZoomableCanvasController scrollView](self->_zoomableCanvasController, "scrollView"), "layer"), "setMasksToBounds:", 1);
}

- (void)expandedWillAnimateRotationFromSize:(CGSize)a3 toSize:(CGSize)a4 duration:(double)a5
{
  CGFloat height;
  double width;
  double v7;
  double v8;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  THWZoomableCanvasController *zoomableCanvasController;
  unsigned int v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  double v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  double v32;
  double v33;
  double v34;
  double v35;
  __n128 v36;
  __n128 v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;

  height = a4.height;
  width = a4.width;
  v7 = a3.height;
  v8 = a3.width;
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWGalleryRep thumbnailTrackCanvasController](self->_rep, "thumbnailTrackCanvasController", a3.width, a3.height, a4.width, a4.height, a5), "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](-[THWGalleryRep thumbnailTrackCanvasController](self->_rep, "thumbnailTrackCanvasController"), "interactiveCanvasController"), "layoutIfNeeded");
  v10 = -[THWGalleryRep currentItem](self->_rep, "currentItem");
  if (v10)
  {
    v41 = height;
    objc_msgSend(objc_msgSend(v10, "imageInfo"), "naturalSize");
    v13 = v11;
    v14 = v12;
    zoomableCanvasController = self->_zoomableCanvasController;
    if (zoomableCanvasController)
    {
      v16 = !-[THWZoomableCanvasController isZoomedOut](self->_zoomableCanvasController, "isZoomedOut");
      -[TSDInteractiveCanvasController viewScale](-[THWZoomableCanvasController interactiveCanvasController](zoomableCanvasController, "interactiveCanvasController"), "viewScale");
      v18 = v17;
      v19 = TSDMultiplySizeScalar(v13, v14, v17);
      v20 = v8;
      v21 = v7;
      v23 = v22;
    }
    else
    {
      v19 = TSDShrinkSizeToFitInSize(v11, v12, v8, v7);
      v20 = v8;
      v21 = v7;
      v23 = v24;
      v16 = 0;
      v18 = 1.0;
    }
    v25 = TSDShrinkSizeToFitInSize(v13, v14, width, v41);
    v26 = v19 > width;
    if (v23 > v41)
      v26 = 1;
    if ((v16 & v26) != 0)
      v25 = v19;
    v27 = v25 / v19;
    self->_targetViewScale = v18 * v27;
    self->_scale = v27;
    -[THWZoomableCanvasController clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:](zoomableCanvasController, "clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:", self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5, v18, v20, v21);
    v29 = v28;
    v31 = v30;
    -[THWZoomableCanvasController clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:](zoomableCanvasController, "clampedUnscaledContentOffset:anchor:viewScale:scrollViewBoundsSize:", self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5, v18 * self->_scale, width, v41);
    v33 = v32;
    v35 = v34;
    v36.n128_u64[0] = v29;
    v37.n128_u64[0] = v31;
    v38 = TSDSubtractPoints(v36, v37, v33, v35);
    self->_translate.x = TSDMultiplyPointScalar(v38, v39, v18);
    self->_translate.y = v40;
  }
}

- (void)expandedWillTransitionFromSize:(CGSize)a3 toSize:(CGSize)a4
{
  double height;
  double width;
  THWZoomableCanvasController *zoomableCanvasController;
  id v8;
  double v9;
  double v10;
  double v11;
  double v12;

  height = a4.height;
  width = a4.width;
  zoomableCanvasController = self->_zoomableCanvasController;
  if (!zoomableCanvasController
    || -[THWZoomableCanvasController isZoomedOut](zoomableCanvasController, "isZoomedOut", a3.width, a3.height))
  {
    v8 = -[THWGalleryRep currentItem](self->_rep, "currentItem", a3.width, a3.height);
    if (v8)
    {
      objc_msgSend(objc_msgSend(v8, "imageInfo"), "naturalSize");
      v10 = width / v9;
      v12 = height / v11;
      if (v12 < v10)
        v10 = v12;
      self->_targetViewScale = fmin(v10, 1.0);
    }
  }
}

- (void)expandedDidTransitionToSize:(CGSize)a3
{
  -[THWGalleryExpandedRotationController p_layoutWithSize:](self, "p_layoutWithSize:", a3.width, a3.height);
  -[THWPagedCanvasController invalidateLayoutsAndFrames](-[THWGalleryRep thumbnailTrackCanvasController](self->_rep, "thumbnailTrackCanvasController"), "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](-[THWGalleryRep thumbnailTrackCanvasController](self->_rep, "thumbnailTrackCanvasController"), "interactiveCanvasController"), "layoutIfNeeded");
}

- (void)p_layoutWithSize:(CGSize)a3
{
  id v4;
  THWZoomableCanvasController *zoomableCanvasController;
  id v6;

  v4 = -[THWGalleryRep layout](self->_rep, "layout", a3.width, a3.height);
  objc_msgSend(v4, "invalidateFrame");
  objc_msgSend(v4, "invalidateChildren");
  objc_msgSend(-[THWGalleryRep interactiveCanvasController](self->_rep, "interactiveCanvasController"), "layoutIfNeeded");
  -[THWPagedCanvasController setPageIndex:animated:](self->_pagedCanvasController, "setPageIndex:animated:", self->_pageIndex, 0);
  -[THWPagedCanvasController invalidateLayoutsAndFrames](self->_pagedCanvasController, "invalidateLayoutsAndFrames");
  -[TSDInteractiveCanvasController layoutIfNeeded](-[THWPagedCanvasController interactiveCanvasController](self->_pagedCanvasController, "interactiveCanvasController"), "layoutIfNeeded");
  zoomableCanvasController = self->_zoomableCanvasController;
  v6 = -[THWGalleryRep currentItem](self->_rep, "currentItem");
  if (zoomableCanvasController)
  {
    -[THWGalleryRep p_updateMinMaxViewScaleForItem:forceMinScale:](self->_rep, "p_updateMinMaxViewScaleForItem:forceMinScale:", v6, 0);
    -[THWZoomableCanvasController setViewScale:contentOffset:anchor:](self->_zoomableCanvasController, "setViewScale:contentOffset:anchor:", self->_targetViewScale, self->_contentCenterOffset.x, self->_contentCenterOffset.y, 0.5, 0.5);
  }
  -[THWGalleryRep p_resetViewScaleForItemsExcept:](self->_rep, "p_resetViewScaleForItemsExcept:", v6);
  -[THWGalleryExpandedRotationController p_updateOtherItemLayers:](self, "p_updateOtherItemLayers:", 0);
}

- (THWGalleryRep)rep
{
  return self->_rep;
}

- (CGPoint)contentCenterOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_contentCenterOffset.x;
  y = self->_contentCenterOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (double)targetViewScale
{
  return self->_targetViewScale;
}

- (double)scale
{
  return self->_scale;
}

- (CGPoint)translate
{
  double x;
  double y;
  CGPoint result;

  x = self->_translate.x;
  y = self->_translate.y;
  result.y = y;
  result.x = x;
  return result;
}

- (THWPagedCanvasController)pagedCanvasController
{
  return self->_pagedCanvasController;
}

- (THWZoomableCanvasController)zoomableCanvasController
{
  return self->_zoomableCanvasController;
}

- (unint64_t)pageIndex
{
  return self->_pageIndex;
}

@end
