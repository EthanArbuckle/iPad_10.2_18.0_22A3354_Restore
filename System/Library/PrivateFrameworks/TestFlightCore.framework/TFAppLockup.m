@implementation TFAppLockup

- (TFAppLockup)initWithTitle:(id)a3 subtitles:(id)a4 iconArtwork:(id)a5
{
  id v8;
  id v9;
  id v10;
  TFAppLockup *v11;
  uint64_t v12;
  NSString *title;
  uint64_t v14;
  NSArray *subtitles;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v17.receiver = self;
  v17.super_class = (Class)TFAppLockup;
  v11 = -[TFAppLockup init](&v17, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    title = v11->_title;
    v11->_title = (NSString *)v12;

    v14 = objc_msgSend(v9, "copy");
    subtitles = v11->_subtitles;
    v11->_subtitles = (NSArray *)v14;

    objc_storeStrong((id *)&v11->_iconArtwork, a5);
  }

  return v11;
}

- (NSString)title
{
  return self->_title;
}

- (NSArray)subtitles
{
  return self->_subtitles;
}

- (TFIconArtwork)iconArtwork
{
  return self->_iconArtwork;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconArtwork, 0);
  objc_storeStrong((id *)&self->_subtitles, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end
