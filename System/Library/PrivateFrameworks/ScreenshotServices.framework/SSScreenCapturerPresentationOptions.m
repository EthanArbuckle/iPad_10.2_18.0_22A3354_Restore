@implementation SSScreenCapturerPresentationOptions

- (id)description
{
  void *v3;
  void *v4;
  const __CFString *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SSScreenCapturerPresentationOptions;
  -[SSScreenCapturerPresentationOptions description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendString:", CFSTR(" presentationMode: "));
  if (-[SSScreenCapturerPresentationOptions presentationMode](self, "presentationMode"))
  {
    if (-[SSScreenCapturerPresentationOptions presentationMode](self, "presentationMode") == 2)
      v5 = CFSTR("InteractiveGestureFullscreen");
    else
      v5 = CFSTR("Fullscreen");
  }
  else
  {
    v5 = CFSTR("PictureInPicture");
  }
  objc_msgSend(v3, "appendString:", v5);
  return v3;
}

- (unint64_t)presentationMode
{
  return self->_presentationMode;
}

- (void)setPresentationMode:(unint64_t)a3
{
  self->_presentationMode = a3;
}

@end
