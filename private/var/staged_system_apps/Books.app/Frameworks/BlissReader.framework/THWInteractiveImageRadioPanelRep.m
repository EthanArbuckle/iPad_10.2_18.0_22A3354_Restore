@implementation THWInteractiveImageRadioPanelRep

- (BOOL)directlyManagesLayerContent
{
  return 1;
}

- (void)setSelectedCallout:(unint64_t)a3
{
  objc_msgSend(objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout"), "pageControl"), "setCurrentPage:", a3);
}

- (void)buttonControlWasPressed:(id)a3
{
  id v5;
  char *v6;
  char *v7;

  v5 = objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout"), "pageControl");
  v6 = (char *)objc_msgSend(v5, "currentPage");
  v7 = (char *)objc_msgSend(objc_msgSend(a3, "layout"), "tag");
  if (v7)
  {
    if (v7 == (_BYTE *)&dword_0 + 1)
    {
      if (v6 < (char *)objc_msgSend(v5, "numberOfPages") - 1)
        ++v6;
      else
        v6 = 0;
    }
  }
  else
  {
    if (!v6)
      v6 = (char *)objc_msgSend(v5, "numberOfPages");
    --v6;
  }
  -[THWInteractiveImageTransportControlDelegate transportControl:calloutOptionSelected:](-[THWInteractiveImageRadioPanelRep transportControlDelegate](self, "transportControlDelegate"), "transportControl:calloutOptionSelected:", self, v6);
}

- (id)buttonControl:(id)a3 imageForState:(int)a4 highlighted:(BOOL)a5
{
  id v7;
  char *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;

  v7 = objc_msgSend(a3, "layout");
  v8 = (char *)objc_msgSend(v7, "tag");
  if (!v8)
  {
    objc_msgSend(v7, "frame");
    v21 = v20;
    v23 = v22;
    v13 = objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout"), "primaryColor");
    v14 = objc_msgSend(a3, "highlighted");
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    v16 = v24;
    v17 = v21;
    v18 = v23;
    v19 = 4;
    return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v19, v13, v14, v17, v18, v16);
  }
  if (v8 == (_BYTE *)&dword_0 + 1)
  {
    objc_msgSend(v7, "frame");
    v10 = v9;
    v12 = v11;
    v13 = objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout"), "primaryColor");
    v14 = objc_msgSend(a3, "highlighted");
    objc_msgSend(objc_msgSend(a3, "canvas"), "contentsScale");
    v16 = v15;
    v17 = v10;
    v18 = v12;
    v19 = 2;
    return +[THWButtonUtilities navigationArrowImageWithSize:direction:color:highlighted:contentsScale:](THWButtonUtilities, "navigationArrowImageWithSize:direction:color:highlighted:contentsScale:", v19, v13, v14, v17, v18, v16);
  }
  return 0;
}

- (BOOL)buttonControlUseContentsScaleForImageCache:(id)a3
{
  return 1;
}

- (BOOL)control:(id)a3 isInteractionEnabledForRep:(id)a4
{
  return -[THWInteractiveImageTransportControlDelegate transportControl:isInteractionEnabledForRep:](-[THWInteractiveImageRadioPanelRep transportControlDelegate](self, "transportControlDelegate", a3), "transportControl:isInteractionEnabledForRep:", self, a4);
}

- (void)control:(id)a3 repWasAdded:(id)a4
{
  char *v6;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  THWPageControlRep *v14;

  v6 = (char *)objc_msgSend(a3, "tag");
  if (!v6)
  {
    v11 = objc_opt_class(THWButtonControlRep);
    v9 = TSUDynamicCast(v11, a4).n128_u64[0];
    v10 = 304;
LABEL_6:
    *(_QWORD *)&self->super.TSDContainerRep_opaque[v10] = v8;
    objc_msgSend(v8, "setDelegate:", self, *(double *)&v9);
    return;
  }
  if (v6 != (_BYTE *)&dword_0 + 2)
  {
    if (v6 != (_BYTE *)&dword_0 + 1)
      return;
    v7 = objc_opt_class(THWButtonControlRep);
    v9 = TSUDynamicCast(v7, a4).n128_u64[0];
    v10 = 312;
    goto LABEL_6;
  }
  v12 = objc_opt_class(THWPageControlRep);
  *(_QWORD *)&v13 = TSUDynamicCast(v12, a4).n128_u64[0];
  self->_pageControlRep = v14;
  -[THWPageControlRep setDelegate:](v14, "setDelegate:", self, v13);
  -[THWPageControlRep setPageDirectlyToIndex:](self->_pageControlRep, "setPageDirectlyToIndex:", 1);
}

- (void)control:(id)a3 repWillBeRemoved:(id)a4
{
  if ((unint64_t)objc_msgSend(a3, "tag") <= 2)
    self->_nextButtonRep = 0;
}

- (void)pageControl:(id)a3 didChangeInteractivelyFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
    -[THWInteractiveImageTransportControlDelegate transportControl:calloutOptionSelected:](-[THWInteractiveImageRadioPanelRep transportControlDelegate](self, "transportControlDelegate", a3, a4), "transportControl:calloutOptionSelected:", self, a5);
}

- (__CTFont)pageControlCreateFont:(id)a3
{
  return (__CTFont *)TSWPCreateFontWithFamilyName(objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", a3, 17.0), "familyName"), 1, 0, 17.0);
}

- (id)pageControlTextColor:(id)a3
{
  return objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout", a3), "primaryColor");
}

- (id)pageControl:(id)a3 layerForState:(int)a4
{
  uint64_t v4;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout", a3), "controlButtonSize");
  return -[THWInteractiveImageRadioPanelRep p_calloutOptionLayerWithSize:index:state:](self, "p_calloutOptionLayerWithSize:index:state:", 0, v4);
}

- (id)pageControl:(id)a3 layerForState:(int)a4 pageIndex:(unint64_t)a5
{
  uint64_t v6;

  v6 = *(_QWORD *)&a4;
  objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout", a3), "controlButtonSize");
  return -[THWInteractiveImageRadioPanelRep p_calloutOptionLayerWithSize:index:state:](self, "p_calloutOptionLayerWithSize:index:state:", a5, v6);
}

- (void)pageControl:(id)a3 didChangeHighlightedFromPageIndex:(unint64_t)a4 toPageIndex:(unint64_t)a5
{
  objc_msgSend(-[THWInteractiveImageRadioPanelRep interactiveCanvasController](self, "interactiveCanvasController", a3, a4, a5), "invalidateLayers");
}

- (void)pageControl:(id)a3 updateLayer:(id)a4 forHighlight:(BOOL)a5
{
  double v5;

  LODWORD(v5) = 1.0;
  if (a5)
    *(float *)&v5 = 0.5;
  objc_msgSend(a4, "setOpacity:", a3, v5);
}

- (id)p_colorFromColor:(id)a3 withAlpha:(double)a4
{
  CGColor *CopyWithAlpha;
  TSUColor *v5;

  CopyWithAlpha = CGColorCreateCopyWithAlpha((CGColorRef)objc_msgSend(a3, "CGColor"), a4);
  v5 = +[TSUColor colorWithCGColor:](TSUColor, "colorWithCGColor:", CopyWithAlpha);
  CGColorRelease(CopyWithAlpha);
  return v5;
}

- (id)p_simpleButtonLayerWithSize:(CGSize)a3 fillColor:(id)a4 borderColor:(id)a5
{
  double height;
  double width;
  id v10;
  double v11;

  height = a3.height;
  width = a3.width;
  v10 = +[TSDNoDefaultImplicitActionLayer layer](TSDNoDefaultImplicitActionLayer, "layer");
  objc_msgSend(v10, "setDelegate:", -[THWInteractiveImageRadioPanelRep interactiveCanvasController](self, "interactiveCanvasController"));
  v11 = 0.0;
  objc_msgSend(v10, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v10, "setCornerRadius:", width * 0.5);
  objc_msgSend(-[THWInteractiveImageRadioPanelRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(v10, "setContentsScale:");
  if (a5)
  {
    objc_msgSend(v10, "setBorderColor:", objc_msgSend(a5, "CGColor"));
    v11 = 1.0;
  }
  objc_msgSend(v10, "setBorderWidth:", v11);
  if (a4)
    objc_msgSend(v10, "setBackgroundColor:", objc_msgSend(a4, "CGColor"));
  return v10;
}

- (id)p_dotOptionLayerWithColor:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  CGPath *Mutable;
  CGRect v10;

  height = a4.height;
  width = a4.width;
  v7 = +[CAShapeLayer layer](CAShapeLayer, "layer");
  objc_msgSend(v7, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(v7, "setBorderWidth:", 0.0);
  objc_msgSend(v7, "setFillColor:", objc_msgSend(a3, "CGColor"));
  Mutable = CGPathCreateMutable();
  v10.origin.x = (width + -7.0) * 0.5;
  v10.origin.y = (height + -7.0) * 0.5;
  v10.size.width = 7.0;
  v10.size.height = 7.0;
  CGPathAddEllipseInRect(Mutable, 0, v10);
  objc_msgSend(v7, "setPath:", Mutable);
  CGPathRelease(Mutable);
  return v7;
}

- (id)p_textOptionWithColor:(id)a3 size:(CGSize)a4 index:(unint64_t)a5
{
  double height;
  double width;
  THWLabelLayer *v10;

  height = a4.height;
  width = a4.width;
  v10 = objc_alloc_init(THWLabelLayer);
  -[THWLabelLayer setFrame:](v10, "setFrame:", 0.0, 0.0, width, height);
  objc_msgSend(-[THWInteractiveImageRadioPanelRep canvas](self, "canvas"), "contentsScale");
  -[THWLabelLayer setContentsScale:](v10, "setContentsScale:");
  -[THWLabelLayer setDelegate:](v10, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
  -[THWLabelLayer setTextColor:](v10, "setTextColor:", a3);
  -[THWLabelLayer setVerticalAlignment:](v10, "setVerticalAlignment:", 1);
  -[THWLabelLayer setHorizontalAlignment:](v10, "setHorizontalAlignment:", 1);
  -[THWLabelLayer setVerticalAlignmentRule:](v10, "setVerticalAlignmentRule:", 0);
  -[THWLabelLayer setFontSize:](v10, "setFontSize:", 17.0);
  -[THWLabelLayer setFontName:](v10, "setFontName:", objc_msgSend(+[TSUFont systemFontOfSize:](TSUFont, "systemFontOfSize:", 17.0), "fontName"));
  -[THWLabelLayer setString:](v10, "setString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), a5));
  return v10;
}

- (id)p_calloutOptionLayerWithSize:(CGSize)a3 index:(unint64_t)a4 state:(int)a5
{
  double height;
  double width;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;

  height = a3.height;
  width = a3.width;
  v10 = objc_msgSend(-[THWInteractiveImageRadioPanelRep layout](self, "layout"), "primaryColor");
  v11 = v10;
  if (a5 == 1)
  {
    v12 = -[THWInteractiveImageRadioPanelRep p_colorFromColor:withAlpha:](self, "p_colorFromColor:withAlpha:", v10, 0.2);
    v13 = -[THWInteractiveImageRadioPanelRep p_colorFromColor:withAlpha:](self, "p_colorFromColor:withAlpha:", v11, 0.7);
  }
  else
  {
    v11 = objc_msgSend(v10, "colorWithAlphaComponent:", 0.4);
    v12 = 0;
    v13 = 0;
  }
  if (a4)
    v14 = -[THWInteractiveImageRadioPanelRep p_textOptionWithColor:size:index:](self, "p_textOptionWithColor:size:index:", v11, a4, width, height);
  else
    v14 = -[THWInteractiveImageRadioPanelRep p_dotOptionLayerWithColor:size:](self, "p_dotOptionLayerWithColor:size:", v11, width, height);
  v15 = v14;
  objc_msgSend(-[THWInteractiveImageRadioPanelRep canvas](self, "canvas"), "contentsScale");
  objc_msgSend(v15, "setContentsScale:");
  v16 = -[THWInteractiveImageRadioPanelRep p_simpleButtonLayerWithSize:fillColor:borderColor:](self, "p_simpleButtonLayerWithSize:fillColor:borderColor:", v12, v13, width, height);
  objc_msgSend(v16, "addSublayer:", v15);
  return v16;
}

- (THWInteractiveImageTransportControlDelegate)transportControlDelegate
{
  return self->_transportControlDelegate;
}

- (void)setTransportControlDelegate:(id)a3
{
  self->_transportControlDelegate = (THWInteractiveImageTransportControlDelegate *)a3;
}

- (THWButtonControlRep)previousButtonRep
{
  return self->_previousButtonRep;
}

- (void)setPreviousButtonRep:(id)a3
{
  self->_previousButtonRep = (THWButtonControlRep *)a3;
}

- (THWButtonControlRep)nextButtonRep
{
  return self->_nextButtonRep;
}

- (void)setNextButtonRep:(id)a3
{
  self->_nextButtonRep = (THWButtonControlRep *)a3;
}

- (THWPageControlRep)pageControlRep
{
  return self->_pageControlRep;
}

- (void)setPageControlRep:(id)a3
{
  self->_pageControlRep = (THWPageControlRep *)a3;
}

@end
