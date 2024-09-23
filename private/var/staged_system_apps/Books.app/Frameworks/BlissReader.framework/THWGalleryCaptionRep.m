@implementation THWGalleryCaptionRep

- (void)didCreateLayer:(id)a3
{
  self->_currentCaptionStorage = (TSWPStorage *)objc_msgSend(objc_msgSend(-[THWGalleryCaptionRep layout](self, "layout", a3), "delegate"), "galleryCaptionStorage");
}

- (void)didUpdateLayer:(id)a3
{
  TSWPStorage *v5;
  TSWPStorage *v6;
  TSWPStorage *currentCaptionStorage;
  BOOL v8;
  id v9;

  v5 = (TSWPStorage *)objc_msgSend(objc_msgSend(-[THWGalleryCaptionRep layout](self, "layout"), "delegate"), "galleryCaptionStorage");
  v6 = v5;
  currentCaptionStorage = self->_currentCaptionStorage;
  if (currentCaptionStorage)
    v8 = v5 == currentCaptionStorage;
  else
    v8 = 1;
  if (!v8)
  {
    v9 = +[CATransition animation](CATransition, "animation");
    objc_msgSend(v9, "setType:", kCATransitionFade);
    objc_msgSend(v9, "setDuration:", 0.15);
    objc_msgSend(a3, "addAnimation:forKey:", v9, CFSTR("fadeAnimation"));
  }
  self->_currentCaptionStorage = v6;
}

- (TSWPStorage)currentCaptionStorage
{
  return self->_currentCaptionStorage;
}

@end
