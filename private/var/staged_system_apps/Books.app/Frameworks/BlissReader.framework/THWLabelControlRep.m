@implementation THWLabelControlRep

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWLabelControlRep;
  -[THWLabelControlRep dealloc](&v3, "dealloc");
}

- (THWLabelControlDelegate)delegate
{
  if (self->_delegate)
    return self->_delegate;
  else
    return (THWLabelControlDelegate *)TSUProtocolCast(&OBJC_PROTOCOL___THWLabelControlDelegate, -[THWLabelControlRep parentRep](self, "parentRep"));
}

- (void)updateLayerGeometryFromLayout:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THWLabelControlRep;
  -[THWLabelControlRep updateLayerGeometryFromLayout:](&v3, "updateLayerGeometryFromLayout:", a3);
}

- (void)updateFromLayout
{
  double v3;
  double v4;
  double v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)THWLabelControlRep;
  -[THWLabelControlRep updateFromLayout](&v6, "updateFromLayout");
  if (!self->_labelLayer)
  {
    self->_labelLayer = objc_alloc_init(THWLabelLayer);
    -[THWLabelLayer setDelegate:](self->_labelLayer, "setDelegate:", +[THNoAnimationLayerDelegate sharedInstance](THNoAnimationLayerDelegate, "sharedInstance"));
    objc_msgSend(-[THWLabelControlRep canvas](self, "canvas"), "contentsScale");
    -[THWLabelLayer setContentsScale:](self->_labelLayer, "setContentsScale:");
  }
  -[THWLabelLayer setString:](self->_labelLayer, "setString:", -[THWLabelControlDelegate stringForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "stringForLabelControl:", self));
  -[THWLabelLayer setTextColor:](self->_labelLayer, "setTextColor:", -[THWLabelControlDelegate textColorForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "textColorForLabelControl:", self));
  -[THWLabelControlDelegate fontSizeForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "fontSizeForLabelControl:", self);
  v4 = v3;
  objc_msgSend(-[THWLabelControlRep canvas](self, "canvas"), "viewScale");
  -[THWLabelLayer setFontSize:](self->_labelLayer, "setFontSize:", v4 * v5);
  -[THWLabelLayer setFontName:](self->_labelLayer, "setFontName:", -[THWLabelControlDelegate fontNameForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "fontNameForLabelControl:", self));
  -[THWLabelLayer setHorizontalAlignment:](self->_labelLayer, "setHorizontalAlignment:", -[THWLabelControlDelegate horizontaAlignmentForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "horizontaAlignmentForLabelControl:", self));
  -[THWLabelLayer setVerticalAlignment:](self->_labelLayer, "setVerticalAlignment:", -[THWLabelControlDelegate verticalAlignmentForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "verticalAlignmentForLabelControl:", self));
  -[THWLabelLayer setShadow:](self->_labelLayer, "setShadow:", -[THWLabelControlDelegate shadowForLabelControl:](-[THWLabelControlRep delegate](self, "delegate"), "shadowForLabelControl:", self));
  objc_msgSend(-[THWLabelControlRep canvas](self, "canvas"), "viewScale");
  -[THWLabelLayer setShadowScale:](self->_labelLayer, "setShadowScale:");
}

- (void)addAdditionalChildLayersToArray:(id)a3
{
  if (self->_labelLayer)
  {
    -[THWLabelControlRep convertNaturalRectToLayerRelative:](self, "convertNaturalRectToLayerRelative:", TSDRectWithSize(objc_msgSend(-[THWLabelControlRep layout](self, "layout"), "frame")));
    -[THWLabelLayer setFrame:](self->_labelLayer, "setFrame:");
    objc_msgSend(a3, "addObject:", self->_labelLayer);
  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWLabelControlDelegate *)a3;
}

- (THWLabelLayer)labelLayer
{
  return self->_labelLayer;
}

- (void)setLabelLayer:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 280);
}

@end
