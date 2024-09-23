@implementation THWInteractiveImageWidgetController

- (THWInteractiveImageWidgetController)initWithLayout:(id)a3
{
  THWInteractiveImageWidgetController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageWidgetController;
  result = -[THWInteractiveImageWidgetController init](&v5, "init");
  if (result)
    result->_layout = (THWInteractiveImageWidgetLayout *)a3;
  return result;
}

- (void)dealloc
{
  objc_super v3;

  self->_layout = 0;

  self->_transportControlsRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetController;
  -[THWInteractiveImageWidgetController dealloc](&v3, "dealloc");
}

- (void)selectOption:(unint64_t)a3
{
  -[THWInteractiveImageWidgetController selectOption:force:animated:](self, "selectOption:force:animated:", a3, 0, 1);
}

- (void)selectOption:(unint64_t)a3 force:(BOOL)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  unint64_t v8;
  THWInteractiveImageWidgetLayout *layout;
  unint64_t calloutIndex;
  unint64_t v11;

  v5 = a5;
  v6 = a4;
  if (a4)
    v8 = a3;
  else
    v8 = 0;
  calloutIndex = self->_calloutIndex;
  layout = self->_layout;
  if (calloutIndex == a3)
    v11 = v8;
  else
    v11 = a3;
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](layout, "info"), "calloutAtIndex:", v11), "contentOffset");
  -[THWInteractiveImageWidgetController selectOption:contentOffset:force:animated:](self, "selectOption:contentOffset:force:animated:", v11, v6, v5);
}

- (void)selectOption:(unint64_t)a3 contentOffset:(CGPoint)a4 force:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  double y;
  double x;
  THWInteractiveImageWidgetLayout *layout;
  unint64_t calloutIndex;

  v6 = a6;
  y = a4.y;
  x = a4.x;
  if (!+[NSThread isMainThread](NSThread, "isMainThread"))
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetController selectOption:contentOffset:force:animated:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m"), 2481, CFSTR("This operation must only be performed on the main thread."));
  if (a5
    || -[THWInteractiveImageWidgetControllerDelegate userInteractionEnabled](self->_delegate, "userInteractionEnabled"))
  {
    -[THWInteractiveImageWidgetControllerDelegate setUserInteractionEnabled:](self->_delegate, "setUserInteractionEnabled:", 0);
    calloutIndex = self->_calloutIndex;
    layout = self->_layout;
    self->_calloutIndex = a3;
    -[THWInteractiveImageWidgetLayout setSelectedCalloutIndex:](layout, "setSelectedCalloutIndex:", a3);
    -[THWInteractiveImageWidgetControllerDelegate selectedCalloutIndexUpdatedAnimated:](self->_delegate, "selectedCalloutIndexUpdatedAnimated:", v6);
    -[THWInteractiveImageWidgetControllerDelegate changeToViewport:previousCalloutIndex:contentOffset:animated:](self->_delegate, "changeToViewport:previousCalloutIndex:contentOffset:animated:", a3, calloutIndex, v6, x, y);
    -[THWInteractiveImageRadioPanelRep setSelectedCallout:](self->_transportControlsRep, "setSelectedCallout:", a3);
  }
}

- (void)transportControl:(id)a3 calloutOptionSelected:(unint64_t)a4
{
  -[THWInteractiveImageWidgetController selectOption:](self, "selectOption:", a4);
}

- (BOOL)transportControl:(id)a3 isInteractionEnabledForRep:(id)a4
{
  return -[THWInteractiveImageWidgetControllerDelegate userInteractionEnabled](self->_delegate, "userInteractionEnabled", a3, a4);
}

- (THWInteractiveImageWidgetControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWInteractiveImageWidgetControllerDelegate *)a3;
}

- (THWInteractiveImageRadioPanelRep)transportControlsRep
{
  return self->_transportControlsRep;
}

- (void)setTransportControlsRep:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (unint64_t)calloutIndex
{
  return self->_calloutIndex;
}

- (void)setCalloutIndex:(unint64_t)a3
{
  self->_calloutIndex = a3;
}

- (THWInteractiveImageWidgetLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (THWInteractiveImageWidgetLayout *)a3;
}

@end
