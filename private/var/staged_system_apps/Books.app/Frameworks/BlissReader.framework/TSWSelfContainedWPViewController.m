@implementation TSWSelfContainedWPViewController

- (TSWSelfContainedWPViewController)initWithStorage:(id)a3 fontSize:(float)a4 textColor:(id)a5
{
  TSWSelfContainedWPViewController *v8;
  TSWPStorage *v9;
  double v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  id v15;
  id v16;
  unint64_t v17;
  id v18;
  uint64_t v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)TSWSelfContainedWPViewController;
  v8 = -[TSWSelfContainedWPViewController initWithNibName:bundle:](&v24, "initWithNibName:bundle:", 0, 0);
  if (v8)
  {
    v9 = (TSWPStorage *)objc_msgSend(a3, "copyWithContext:", objc_msgSend(a3, "context"));
    v8->mStorage = v9;
    v10 = a4;
    v11 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithPropertiesAndValues:", 17, *(_QWORD *)&v10, 18, +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", a5), 102, 0, 87, 0, 88, 0, 85, objc_msgSend(objc_alloc((Class)TSWPLineSpacing), "initWithMode:amount:", 0, 1.0), 104, 0, 98, +[UIColor clearColor](UIColor, "clearColor"), 0);
    v12 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithPropertiesAndValues:", 17, *(_QWORD *)&v10, 18, +[TSUColor colorWithUIColor:](TSUColor, "colorWithUIColor:", a5), 0);
    objc_msgSend(a3, "range");
    if (v13)
    {
      v14 = 0;
      do
      {
        v22 = v14;
        v23 = 0;
        v15 = objc_msgSend(a3, "paragraphStyleAtCharIndex:effectiveRange:", v14, &v22);
        v16 = objc_msgSend(objc_msgSend(v15, "stylesheet"), "variationOfStyle:propertyMap:", v15, v11);
        -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](v9, "setParagraphStyle:forCharRange:undoTransaction:", v16, v22, v23, 0);
        v14 += v23;
        objc_msgSend(a3, "range");
      }
      while (v14 < v17);
    }
    v18 = -[TSWPStorage range](v9, "range");
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_4748C;
    v21[3] = &unk_427A28;
    v21[4] = v12;
    v21[5] = v9;
    -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](v9, "enumerateWithAttributeKind:inRange:usingBlock:", 3, v18, v19, v21);

  }
  return v8;
}

- (void)loadView
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = objc_alloc_init((Class)TSWPInteractiveCanvasController);
  objc_msgSend(v3, "setDelegate:", self);
  -[TSWSelfContainedWPViewController setIcc:](self, "setIcc:", v3);
  v4 = objc_alloc_init((Class)TSWPiOSCanvasViewController);
  objc_msgSend(v3, "setLayerHost:", v4);
  objc_msgSend(v4, "setInteractiveCanvasController:", v3);
  objc_msgSend(objc_msgSend(v4, "canvasView"), "setBackgroundColor:", +[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(objc_msgSend(v4, "canvasView"), "setClipsToBounds:", 0);
  -[TSWSelfContainedWPViewController setCvc:](self, "setCvc:", v4);

  v5 = objc_alloc((Class)TSKScrollView);
  objc_msgSend(objc_msgSend(v4, "canvasView"), "bounds");
  v6 = objc_msgSend(v5, "initWithFrame:");
  objc_msgSend(v6, "setUserInteractionEnabled:", 0);
  objc_msgSend(v6, "addSubview:", -[TSWPiOSCanvasViewController canvasView](-[TSWSelfContainedWPViewController cvc](self, "cvc"), "canvasView"));
  -[TSWSelfContainedWPViewController setView:](self, "setView:", v6);
  objc_msgSend(-[TSWSelfContainedWPViewController view](self, "view"), "setClipsToBounds:", 0);

}

- (void)p_cleanup
{
  -[TSWPInteractiveCanvasController teardown](-[TSWSelfContainedWPViewController icc](self, "icc"), "teardown");
  -[TSWPiOSCanvasViewController teardown](-[TSWSelfContainedWPViewController cvc](self, "cvc"), "teardown");

  self->mICC = 0;
  self->mCVC = 0;

  self->mEditorGeometry = 0;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWSelfContainedWPViewController p_cleanup](self, "p_cleanup");

  self->mStorage = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSWSelfContainedWPViewController;
  -[TSWSelfContainedWPViewController dealloc](&v3, "dealloc");
}

- (void)overrideFontColorOfSmartFields:(id)a3
{
  TSWPStorage *v5;
  id v6;
  uint64_t v7;
  _QWORD v8[5];

  v5 = -[TSWSelfContainedWPViewController storage](self, "storage");
  v6 = -[TSWPStorage range](-[TSWSelfContainedWPViewController storage](self, "storage"), "range");
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_4776C;
  v8[3] = &unk_427A50;
  v8[4] = a3;
  -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](v5, "enumerateWithAttributeKind:inRange:usingBlock:", 3, v6, v7, v8);
}

- (void)layoutWithFrame:(CGRect)a3
{
  double height;
  double width;
  id v6;
  id v7;
  id v8;

  height = a3.size.height;
  width = a3.size.width;
  objc_msgSend(-[TSWSelfContainedWPViewController view](self, "view"), "setFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!-[TSWSelfContainedWPViewController editorGeometry](self, "editorGeometry"))
  {
    v6 = objc_msgSend(objc_alloc((Class)TSDMutableInfoGeometry), "initWithPosition:size:widthValid:heightValid:horizontalFlip:verticalFlip:angle:", 1, -[TSWSelfContainedWPViewController shouldTruncateText](self, "shouldTruncateText"), 0, 0, 0.0, 0.0, width, height, 0.0);
    -[TSWSelfContainedWPViewController setEditorGeometry:](self, "setEditorGeometry:", v6);

    v7 = +[TSWPShapeStyle defaultStyleWithContext:](TSWPShapeStyle, "defaultStyleWithContext:", -[TSWPStorage context](-[TSWSelfContainedWPViewController storage](self, "storage"), "context"));
    objc_msgSend(v7, "setValue:forProperty:", +[TSDStroke emptyStroke](TSDStroke, "emptyStroke"), 517);
    v8 = objc_msgSend(objc_alloc((Class)TSWPShapeInfo), "initWithContext:geometry:style:wpStorage:", -[TSWPStorage context](-[TSWSelfContainedWPViewController storage](self, "storage"), "context"), v6, v7, -[TSWSelfContainedWPViewController storage](self, "storage"));
    objc_msgSend(v8, "setAllowsLastLineTruncation:", -[TSWSelfContainedWPViewController shouldTruncateText](self, "shouldTruncateText"));
    objc_msgSend(v8, "setTextUserEditable:", 0);
    -[TSWPInteractiveCanvasController setInfosToDisplay:](-[TSWSelfContainedWPViewController icc](self, "icc"), "setInfosToDisplay:", +[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v8));

  }
  objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "unscaledSize");
  objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "setUnscaledSize:", width, height);
  objc_msgSend(-[TSWPInteractiveCanvasController canvas](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvas"), "setUnscaledSize:", width, height);
  -[TSDMutableInfoGeometry setSize:](-[TSWSelfContainedWPViewController editorGeometry](self, "editorGeometry"), "setSize:", width, height);
  objc_msgSend(objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController repForInfo:](-[TSWSelfContainedWPViewController icc](self, "icc"), "repForInfo:", -[TSWSelfContainedWPViewController storage](self, "storage")), "layout"), "parent"), "invalidateSize");
}

- (void)setParagraphAlignment:(unsigned int)a3
{
  uint64_t v3;
  id v5;
  id v6;
  TSWPStorage *v7;
  id v8;
  uint64_t v9;
  id v10;

  v3 = *(_QWORD *)&a3;
  v5 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](-[TSWSelfContainedWPViewController storage](self, "storage"), "paragraphStyleAtCharIndex:effectiveRange:", 0, 0);
  v10 = objc_msgSend(objc_alloc((Class)TSSPropertyMap), "initWithPropertiesAndValues:", 86, v3, 0);
  v6 = objc_msgSend(objc_msgSend(v5, "stylesheet"), "variationOfStyle:propertyMap:", v5, v10);
  v7 = -[TSWSelfContainedWPViewController storage](self, "storage");
  v8 = -[TSWPStorage range](-[TSWSelfContainedWPViewController storage](self, "storage"), "range");
  -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](v7, "setParagraphStyle:forCharRange:undoTransaction:", v6, v8, v9, 0);

}

- (void)p_alignScrollViewForHeight:(double)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  float v13;

  objc_msgSend(-[TSWSelfContainedWPViewController view](self, "view"), "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[TSWSelfContainedWPViewController maximumHeight](self, "maximumHeight");
  if (v11 != 0.0)
  {
    -[TSWSelfContainedWPViewController maximumHeight](self, "maximumHeight");
    *(float *)&v12 = v12;
    v13 = a3;
    a3 = fminf(fminf(*(float *)&v12, INFINITY), v13);
  }
  -[TSWSelfContainedWPViewControllerDelegate selfContainedWPViewController:didChangeSize:](-[TSWSelfContainedWPViewController delegate](self, "delegate"), "selfContainedWPViewController:didChangeSize:", self, v10, a3);
  objc_msgSend(-[TSWSelfContainedWPViewController view](self, "view"), "setFrame:", v6, v8, v10, a3);
}

- (TSKDocumentRoot)documentRoot
{
  return (TSKDocumentRoot *)objc_msgSend(-[TSWPStorage context](self->mStorage, "context"), "documentRoot");
}

- (BOOL)isCanvasInteractive
{
  return 1;
}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  objc_msgSend(-[TSWSelfContainedWPViewController view](self, "view", a3), "frame");
  v5 = v4;
  objc_msgSend(-[TSWPInteractiveCanvasController layoutController](-[TSWSelfContainedWPViewController icc](self, "icc"), "layoutController"), "rectOfTopLevelLayouts");
  v7 = v6;
  if (v6 != self->mLastLayoutHeight || v5 != self->mLastLayoutWidth)
  {
    objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController canvasView](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvasView"), "canvasLayer"), "setUnscaledSize:", v5 + -2.0, v6);
    objc_msgSend(-[TSWPInteractiveCanvasController canvas](-[TSWSelfContainedWPViewController icc](self, "icc"), "canvas"), "setUnscaledSize:", v5 + -2.0, v7);
    -[TSWSelfContainedWPViewController minimumHeight](self, "minimumHeight");
    *(float *)&v8 = v8;
    -[TSDMutableInfoGeometry setSize:](-[TSWSelfContainedWPViewController editorGeometry](self, "editorGeometry"), "setSize:", v5 + -2.0, fmaxf(*(float *)&v8, 20.0));
    if (v5 != self->mLastLayoutWidth)
      objc_msgSend(objc_msgSend(objc_msgSend(-[TSWPInteractiveCanvasController repForInfo:](-[TSWSelfContainedWPViewController icc](self, "icc"), "repForInfo:", -[TSWSelfContainedWPViewController storage](self, "storage")), "layout"), "parent"), "invalidateSize");
    -[TSWSelfContainedWPViewController p_alignScrollViewForHeight:](self, "p_alignScrollViewForHeight:", v7);
    self->mLastLayoutHeight = v7;
    self->mLastLayoutWidth = v5;
  }
}

- (BOOL)spellCheckingSuppressed
{
  return 1;
}

- (BOOL)editorAllowsMagnifier
{
  return 0;
}

- (BOOL)editorAllowsCaret
{
  return 0;
}

- (Class)wpEditorClassOverride
{
  return (Class)objc_opt_class(THWPEditingController, a2);
}

- (TSWPInteractiveCanvasController)icc
{
  return self->mICC;
}

- (void)setIcc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 8);
}

- (TSWPiOSCanvasViewController)cvc
{
  return self->mCVC;
}

- (void)setCvc:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSDMutableInfoGeometry)editorGeometry
{
  return self->mEditorGeometry;
}

- (void)setEditorGeometry:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSWSelfContainedWPViewControllerDelegate)delegate
{
  return self->mDelegate;
}

- (void)setDelegate:(id)a3
{
  self->mDelegate = (TSWSelfContainedWPViewControllerDelegate *)a3;
}

- (double)minimumHeight
{
  return self->mMinimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->mMinimumHeight = a3;
}

- (double)maximumHeight
{
  return self->mMaximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->mMaximumHeight = a3;
}

- (TSWPStorage)storage
{
  return self->mStorage;
}

- (BOOL)shouldTruncateText
{
  return self->mShouldTruncateText;
}

- (void)setShouldTruncateText:(BOOL)a3
{
  self->mShouldTruncateText = a3;
}

@end
