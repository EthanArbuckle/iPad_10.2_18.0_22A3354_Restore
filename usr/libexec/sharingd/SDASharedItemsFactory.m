@implementation SDASharedItemsFactory

+ (id)sharedFactory
{
  id v2;
  void *v3;
  SDASharedItemsFactory *v4;
  void *v5;
  id v6;

  v2 = a1;
  objc_sync_enter(v2);
  v3 = (void *)qword_1007C6BF8;
  if (!qword_1007C6BF8)
  {
    v4 = objc_alloc_init(SDASharedItemsFactory);
    v5 = (void *)qword_1007C6BF8;
    qword_1007C6BF8 = (uint64_t)v4;

    v3 = (void *)qword_1007C6BF8;
  }
  v6 = v3;
  objc_sync_exit(v2);

  return v6;
}

- (SDASharedItemsFactory)init
{
  SDASharedItemsFactory *v3;
  uint64_t v4;
  NSBundle *v5;
  uint64_t v6;
  NSBundle *bundle;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v25;

  v25.receiver = self;
  v25.super_class = (Class)SDASharedItemsFactory;
  v3 = -[SDASharedItemsFactory init](&v25, "init");
  if (v3)
  {
    if (objc_msgSend(&off_10074FD00, "count") != (id)12)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FD18, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 51, CFSTR("enum and string values out of sync: %@"), v10);

    }
    if (objc_msgSend(&off_10074FD30, "count") != (id)8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FD48, "objectAtIndexedSubscript:", 2));
      objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 54, CFSTR("enum and string values out of sync: %@"), v12);

    }
    if (objc_msgSend(&off_10074FD60, "count") != (id)1)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FD78, "objectAtIndexedSubscript:", 3));
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 57, CFSTR("enum and string values out of sync: %@"), v14);

    }
    if (objc_msgSend(&off_10074FD90, "count") != (id)4)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FDA8, "objectAtIndexedSubscript:", 4));
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 60, CFSTR("enum and string values out of sync: %@"), v16);

    }
    if (objc_msgSend(&off_10074FDC0, "count") != (id)6)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FDD8, "objectAtIndexedSubscript:", 5));
      objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 63, CFSTR("enum and string values out of sync: %@"), v18);

    }
    if (objc_msgSend(&off_10074FDF0, "count") != (id)11)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FE08, "objectAtIndexedSubscript:", 6));
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 66, CFSTR("enum and string values out of sync: %@"), v20);

    }
    if (objc_msgSend(&off_10074FE20, "count") != (id)4)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FE38, "objectAtIndexedSubscript:", 7));
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 69, CFSTR("enum and string values out of sync: %@"), v22);

    }
    if (objc_msgSend(&off_10074FE50, "count") != (id)1)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_10074FE68, "objectAtIndexedSubscript:", 8));
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, v3, CFSTR("SDASharedItemsFactory.m"), 72, CFSTR("enum and string values out of sync: %@"), v24);

    }
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(v3, v4));
    v6 = objc_claimAutoreleasedReturnValue(v5);
    bundle = v3->_bundle;
    v3->_bundle = (NSBundle *)v6;

    if (!v3->_bundle)
    {

      return 0;
    }
  }
  return v3;
}

- (NSArray)calendarEvents
{
  double v2;

  LODWORD(v2) = 1.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FE80, 0, 0, CFSTR("com.apple.mobilecal"), v2);
}

- (NSArray)contacts
{
  double v2;

  LODWORD(v2) = 1.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FE98, 0, 0, CFSTR("com.apple.MobileAddressBook"), v2);
}

- (id)dataDocuments
{
  SDAItemSource *v2;
  void *v3;
  SDAItemSource *v4;
  double v5;
  void *v6;
  SDAItemSource *v8;

  v2 = [SDAItemSource alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));
  v4 = -[SDAItemSource initWithData:type:previewImage:subject:name:](v2, "initWithData:type:previewImage:subject:name:", v3, kUTTypeHTML, 0, CFSTR("My Generic Data"), 0);

  -[SDAItemSource setFakeBytes:](v4, "setFakeBytes:", 100);
  -[SDAItemSource setFakeBundleID:](v4, "setFakeBundleID:", CFSTR("com.apple.mobilemail"));
  LODWORD(v5) = 1.0;
  -[SDAItemSource setFakeDuration:](v4, "setFakeDuration:", v5);
  v8 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v6;
}

- (NSArray)images
{
  double v2;

  LODWORD(v2) = 2.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FEB0, 0, 0, CFSTR("com.apple.mobileslideshow"), v2);
}

- (NSArray)svgImages
{
  double v2;

  LODWORD(v2) = 2.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FEC8, 0, 0, CFSTR("com.apple.finder"), v2);
}

- (NSArray)pages
{
  double v2;

  LODWORD(v2) = 2.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FEE0, 0, 0, CFSTR("com.apple.mobilemail"), v2);
}

- (NSArray)passes
{
  double v2;

  LODWORD(v2) = 1.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FEF8, 0, 0, CFSTR("com.apple.Passbook"), v2);
}

- (NSArray)pdfs
{
  double v2;

  LODWORD(v2) = 2.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FF10, 0, 0, CFSTR("com.apple.mobilemail"), v2);
}

- (NSArray)sharingDrawingDocuments
{
  double v2;

  LODWORD(v2) = 1.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FF28, 0, 0, CFSTR("com.apple.mobilemail"), v2);
}

- (NSArray)textDocuments
{
  double v2;

  LODWORD(v2) = 1.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FF40, 0, 0, CFSTR("com.apple.mobilemail"), v2);
}

- (NSArray)videos
{
  double v2;

  LODWORD(v2) = 10.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FF58, 0, 0, CFSTR("com.apple.mobileslideshow"), v2);
}

- (NSArray)voiceMemos
{
  double v2;

  LODWORD(v2) = 3.0;
  return (NSArray *)-[SDASharedItemsFactory itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForFileNames:previewImageBaseName:fakeItemDuration:fakeItemBytes:fakeBundleID:", &off_10074FF70, 0, 0, CFSTR("com.apple.VoiceMemos"), v2);
}

- (id)findMyFriendsLink
{
  SDAItemSource *v2;
  void *v3;
  SDAItemSource *v4;
  double v5;
  void *v6;
  SDAItemSource *v8;

  v2 = [SDAItemSource alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("fmf1://foo")));
  v4 = -[SDAItemSource initWithURL:previewImage:subject:](v2, "initWithURL:previewImage:subject:", v3, 0, CFSTR("Location"));

  -[SDAItemSource setFakeBundleID:](v4, "setFakeBundleID:", CFSTR("com.apple.findmy"));
  -[SDAItemSource setFakeBytes:](v4, "setFakeBytes:", 100);
  LODWORD(v5) = 1036831949;
  -[SDAItemSource setFakeDuration:](v4, "setFakeDuration:", v5);
  v8 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return v6;
}

- (NSArray)iLifeLinks
{
  SDAItemSource *v2;
  void *v3;
  SDAItemSource *v4;
  double v5;
  void *v6;
  SDAItemSource *v8;

  v2 = [SDAItemSource alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://www.icloud.com/journal/#1;CAEQARoQMchUru323-EAGU6rC2OZpg;3BAD3ADE-DB60-47A8-975D-17138CD396B1")));
  v4 = -[SDAItemSource initWithURL:previewImage:subject:](v2, "initWithURL:previewImage:subject:", v3, 0, CFSTR("iPhoto Journal"));

  -[SDAItemSource setFakeBundleID:](v4, "setFakeBundleID:", CFSTR("com.apple.mobileiphoto"));
  -[SDAItemSource setFakeBytes:](v4, "setFakeBytes:", 100);
  LODWORD(v5) = 1036831949;
  -[SDAItemSource setFakeDuration:](v4, "setFakeDuration:", v5);
  v8 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return (NSArray *)v6;
}

- (NSArray)iWorkLinks
{
  SDAItemSource *v2;
  void *v3;
  SDAItemSource *v4;
  double v5;
  void *v6;
  SDAItemSource *v8;

  v2 = [SDAItemSource alloc];
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("https://www.icloud.com/iw/#pages/some-hash/School%20Report")));
  v4 = -[SDAItemSource initWithURL:previewImage:subject:](v2, "initWithURL:previewImage:subject:", v3, 0, CFSTR("School Report"));

  -[SDAItemSource setFakeBundleID:](v4, "setFakeBundleID:", CFSTR("com.apple.Pages"));
  -[SDAItemSource setFakeBytes:](v4, "setFakeBytes:", 100);
  LODWORD(v5) = 1036831949;
  -[SDAItemSource setFakeDuration:](v4, "setFakeDuration:", v5);
  v8 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

  return (NSArray *)v6;
}

- (id)keynoteLiveLinks
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  void *v11;

  v10[0] = CFSTR("https://www.icloud.com/keynote-live/wGlPfel-hr529LJVgRDOm5ypCpaoC5zKs5MJSAMYYsVhIPpxvos5iZelgn7Qebu_ZLmk9hrgJWY4vveA_p4Ovp9iYthUHI6MJtlTjsHXx2yGOR4QvbdsS8esHSiSFepDDqq8WrqWPDNwnGiQ7xM-Op19zjCwILdpu77oEsjhls5Kcc-orw");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("elvis_presley-preview.jpg"), self->_bundle, CFSTR("kSDAItemSourcesURL"), CFSTR("kSDAItemSourcesPreviewImage")));
  v9[2] = CFSTR("kSDAItemSourcesSubject");
  v10[1] = v3;
  v10[2] = CFSTR("Check out this Keynote Live presentatation");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  LODWORD(v6) = 1036831949;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v5, 100, CFSTR("com.apple.Keynote"), v6));

  return v7;
}

- (NSArray)sharediCloudDocumentsLinks
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  _QWORD v11[3];

  v10[0] = CFSTR("https://www.icloud.com/pages/000r43N3H8h68IwFK1ifN23sg#PageTest");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("elvis_presley-preview.jpg"), self->_bundle, CFSTR("kSDAItemSourcesURL"), CFSTR("kSDAItemSourcesPreviewImage")));
  v9[2] = CFSTR("kSDAItemSourcesSubject");
  v10[1] = v3;
  v10[2] = CFSTR("Check out this Pages document");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  v11[0] = v4;
  v11[1] = &off_10074E648;
  v11[2] = &off_10074E670;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 3));

  LODWORD(v6) = 1036831949;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v5, 100, CFSTR("com.apple.mobilemail"), v6));

  return (NSArray *)v7;
}

- (NSArray)iTunesStoreLinks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v21[3];
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[3];
  _QWORD v25[3];
  _QWORD v26[3];
  _QWORD v27[3];
  _QWORD v28[3];
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[3];
  _QWORD v33[3];
  _QWORD v34[3];
  _QWORD v35[7];

  v34[0] = CFSTR("https://itunes.apple.com/us/book/the-monuments-men/id357655256");
  v33[0] = CFSTR("kSDAItemSourcesURL");
  v33[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("the-monuments-men-preview.jpeg"), self->_bundle));
  v33[2] = CFSTR("kSDAItemSourcesSubject");
  v34[1] = v20;
  v34[2] = CFSTR("Check out this book");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v34, v33, 3));
  v35[0] = v19;
  v32[0] = CFSTR("https://itunes.apple.com/us/podcast/hypercritical/id414920759");
  v31[0] = CFSTR("kSDAItemSourcesURL");
  v31[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("hypercritical-preview.jpeg"), self->_bundle));
  v31[2] = CFSTR("kSDAItemSourcesSubject");
  v32[1] = v18;
  v32[2] = CFSTR("Check out this podcast");
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v32, v31, 3));
  v35[1] = v17;
  v30[0] = CFSTR("https://itunes.apple.com/us/itunes-u/ipad-iphone-application-development/id480479762");
  v29[0] = CFSTR("kSDAItemSourcesURL");
  v29[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("itunesu-preview.jpeg"), self->_bundle));
  v29[2] = CFSTR("kSDAItemSourcesSubject");
  v30[1] = v16;
  v30[2] = CFSTR("Check out this itunes-u");
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
  v35[2] = v15;
  v28[0] = CFSTR("https://itunes.apple.com/us/album/complete-50s-albums-collection/id672012335");
  v27[0] = CFSTR("kSDAItemSourcesURL");
  v27[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("elvis_presley-preview.jpg"), self->_bundle));
  v27[2] = CFSTR("kSDAItemSourcesSubject");
  v28[1] = v14;
  v28[2] = CFSTR("Check out this album");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v28, v27, 3));
  v35[3] = v3;
  v26[0] = CFSTR("https://itunes.apple.com/us/movie-collection/the-lord-of-the-rings-trilogy/id365647689");
  v25[0] = CFSTR("kSDAItemSourcesURL");
  v25[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("the-lord-of-the-rings-preview.jpeg"), self->_bundle));
  v25[2] = CFSTR("kSDAItemSourcesSubject");
  v26[1] = v4;
  v26[2] = CFSTR("Check out this movie collection");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 3));
  v35[4] = v5;
  v24[0] = CFSTR("https://itunes.apple.com/us/tv-season/breaking-bad-season-1/id271383858");
  v23[0] = CFSTR("kSDAItemSourcesURL");
  v23[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("breaking-bad-preview.jpeg"), self->_bundle));
  v23[2] = CFSTR("kSDAItemSourcesSubject");
  v24[1] = v6;
  v24[2] = CFSTR("Check out this tv-season");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 3));
  v35[5] = v7;
  v22[0] = CFSTR("https://itunes.apple.com/us/audiobook/steve-jobs-unabridged/id473826062");
  v21[0] = CFSTR("kSDAItemSourcesURL");
  v21[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("steve-jobs-preview.jpeg"), self->_bundle));
  v21[2] = CFSTR("kSDAItemSourcesSubject");
  v22[1] = v8;
  v22[2] = CFSTR("Check out this audiobook");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3));
  v35[6] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v35, 7));

  LODWORD(v11) = 1036831949;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v10, 100, CFSTR("com.apple.MobileStore"), v11));

  return (NSArray *)v12;
}

- (NSArray)mapsLinks
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  void *v11;

  v10[0] = CFSTR("http://maps.apple.com/?lsp=9902&auid=10582173481701573620&sll=37.331848,-122.030296&q=Apple%2C%20Inc.&hnear=1%20Infinite%20Loop%20Cupertino%20CA%2095014%20United%20States");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_inc-preview.png"), self->_bundle, CFSTR("kSDAItemSourcesURL"), CFSTR("kSDAItemSourcesPreviewImage")));
  v9[2] = CFSTR("kSDAItemSourcesSubject");
  v10[1] = v3;
  v10[2] = CFSTR("Apple Inc.");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  LODWORD(v6) = 1036831949;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v5, 100, CFSTR("com.apple.Maps"), v6));

  return (NSArray *)v7;
}

- (NSArray)telephoneLinks
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[3];
  void *v11;

  v10[0] = CFSTR("tel://+18000391010");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_inc-preview.png"), self->_bundle, CFSTR("kSDAItemSourcesURL"), CFSTR("kSDAItemSourcesPreviewImage")));
  v9[2] = CFSTR("kSDAItemSourcesSubject");
  v10[1] = v3;
  v10[2] = CFSTR("Apple Inc.");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  v11 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v11, 1));

  LODWORD(v6) = 1036831949;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v5, 100, CFSTR("com.apple.mobilemail"), v6));

  return (NSArray *)v7;
}

- (NSArray)webLinks
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[3];
  _QWORD v15[3];
  _QWORD v16[3];
  _QWORD v17[3];
  _QWORD v18[3];
  _QWORD v19[3];

  v18[0] = CFSTR("http://www.apple.com");
  v17[0] = CFSTR("kSDAItemSourcesURL");
  v17[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_com-preview.png"), self->_bundle));
  v17[2] = CFSTR("kSDAItemSourcesSubject");
  v18[1] = v3;
  v18[2] = CFSTR("Please go check out apple.com");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v18, v17, 3));
  v19[0] = v4;
  v16[0] = CFSTR("http://www.yahoo.com");
  v15[0] = CFSTR("kSDAItemSourcesURL");
  v15[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_com-preview.png"), self->_bundle));
  v15[2] = CFSTR("kSDAItemSourcesSubject");
  v16[1] = v5;
  v16[2] = CFSTR("Please go check out yahoo.com");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v16, v15, 3));
  v19[1] = v6;
  v14[0] = CFSTR("http://www.cnn.com");
  v13[0] = CFSTR("kSDAItemSourcesURL");
  v13[1] = CFSTR("kSDAItemSourcesPreviewImage");
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_com-preview.png"), self->_bundle));
  v13[2] = CFSTR("kSDAItemSourcesSubject");
  v14[1] = v7;
  v14[2] = CFSTR("Please go check out cnn.com");
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 3));
  v19[2] = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v19, 3));

  LODWORD(v10) = 1036831949;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDASharedItemsFactory itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:](self, "itemSourcesForNonFileURLDictionaries:fakeItemDuration:fakeItemBytes:fakeBundleID:", v9, 100, CFSTR("com.apple.mobilemail"), v10));

  return (NSArray *)v11;
}

- (NSArray)webLinkStrings
{
  void *v2;
  SDAItemSource *v3;
  double v4;
  void *v5;
  SDAItemSource *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_com-preview.png"), self->_bundle));
  v3 = -[SDAItemSource initWithString:previewImage:subject:]([SDAItemSource alloc], "initWithString:previewImage:subject:", CFSTR("http://www.apple.com"), v2, CFSTR("Please go check out apple.com"));
  -[SDAItemSource setFakeBundleID:](v3, "setFakeBundleID:", CFSTR("com.apple.mobilemail"));
  -[SDAItemSource setFakeBytes:](v3, "setFakeBytes:", 100);
  LODWORD(v4) = 1036831949;
  -[SDAItemSource setFakeDuration:](v3, "setFakeDuration:", v4);
  v7 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return (NSArray *)v5;
}

- (NSArray)webLinkStringBlocks
{
  void *v2;
  SDAItemSource *v3;
  double v4;
  void *v5;
  SDAItemSource *v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("apple_com-preview.png"), self->_bundle));
  v3 = -[SDAItemSource initWithString:previewImage:subject:]([SDAItemSource alloc], "initWithString:previewImage:subject:", CFSTR("Come check out the amazing new stuff at http://www.apple.com/ . Special discounts this week"), v2, CFSTR("Please go check out apple.com"));
  -[SDAItemSource setFakeBundleID:](v3, "setFakeBundleID:", CFSTR("com.apple.mobilemail"));
  -[SDAItemSource setFakeBytes:](v3, "setFakeBytes:", 100);
  LODWORD(v4) = 1036831949;
  -[SDAItemSource setFakeDuration:](v3, "setFakeDuration:", v4);
  v7 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  return (NSArray *)v5;
}

- (NSArray)yelpLinks
{
  void *v3;
  void *v4;
  SDAItemSource *v5;
  double v6;
  void *v7;
  SDAItemSource *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL URLWithString:](NSURL, "URLWithString:", CFSTR("yelp://biz/the-sentinel-san-francisco")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("the_sentinel_san_francisco-preview.jpg"), self->_bundle));
  v5 = -[SDAItemSource initWithURL:previewImage:subject:]([SDAItemSource alloc], "initWithURL:previewImage:subject:", v3, v4, CFSTR("The Sentinel Restaurant"));
  -[SDAItemSource setFakeBundleID:](v5, "setFakeBundleID:", CFSTR("com.apple.mobilemail"));
  -[SDAItemSource setFakeBytes:](v5, "setFakeBytes:", 100);
  LODWORD(v6) = 1036831949;
  -[SDAItemSource setFakeDuration:](v5, "setFakeDuration:", v6);
  v9 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));

  return (NSArray *)v7;
}

- (NSArray)attributedStrings
{
  NSMutableAttributedString *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  NSMutableAttributedString *v13;

  v2 = objc_opt_new(NSMutableAttributedString);
  v3 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR("Hello. This is a test attributed string."));
  -[NSMutableAttributedString appendAttributedString:](v2, "appendAttributedString:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor yellowColor](UIColor, "yellowColor"));
  -[NSMutableAttributedString addAttribute:value:range:](v2, "addAttribute:value:range:", NSBackgroundColorAttributeName, v4, 3, 5);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor greenColor](UIColor, "greenColor"));
  -[NSMutableAttributedString addAttribute:value:range:](v2, "addAttribute:value:range:", NSForegroundColorAttributeName, v5, 10, 7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 20.0));
  -[NSMutableAttributedString addAttribute:value:range:](v2, "addAttribute:value:range:", NSFontAttributeName, v6, 20, 10);

  v13 = v2;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001A0004;
  v11[3] = &unk_100719CD0;
  v12 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v7, "count")));
  v8 = v12;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v11);
  v9 = objc_msgSend(v8, "copy");

  return (NSArray *)v9;
}

- (NSArray)strings
{
  id v2;
  id v3;
  _QWORD v5[4];
  id v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1001A0140;
  v5[3] = &unk_100719CF8;
  v6 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(&off_10074FF88, "count")));
  v2 = v6;
  objc_msgSend(&off_10074FF88, "enumerateObjectsUsingBlock:", v5);
  v3 = objc_msgSend(v2, "copy");

  return (NSArray *)v3;
}

- (id)itemSourcesForNonFileURLDictionaries:(id)a3 fakeItemDuration:(float)a4 fakeItemBytes:(int64_t)a5 fakeBundleID:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void **v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;
  int64_t v21;
  float v22;

  v9 = a6;
  v10 = a3;
  v15 = _NSConcreteStackBlock;
  v16 = 3221225472;
  v17 = sub_1001A02C0;
  v18 = &unk_100719D20;
  v20 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v10, "count")));
  v21 = a5;
  v22 = a4;
  v19 = v9;
  v11 = v20;
  v12 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", &v15);

  v13 = objc_msgSend(v11, "copy", v15, v16, v17, v18);
  return v13;
}

- (id)itemSourcesForFileNames:(id)a3 previewImageBaseName:(id)a4 fakeItemDuration:(float)a5 fakeItemBytes:(int64_t)a6 fakeBundleID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void **v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  SDASharedItemsFactory *v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  float v29;

  v12 = a4;
  v13 = a7;
  v14 = a3;
  v20 = _NSConcreteStackBlock;
  v21 = 3221225472;
  v22 = sub_1001A0518;
  v23 = &unk_100719D48;
  v24 = self;
  v25 = v12;
  v27 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));
  v28 = a6;
  v29 = a5;
  v26 = v13;
  v15 = v27;
  v16 = v13;
  v17 = v12;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", &v20);

  v18 = objc_msgSend(v15, "copy", v20, v21, v22, v23, v24);
  return v18;
}

+ (id)plainItemsFromItemSources:(id)a3
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1001A07CC;
  v7[3] = &unk_100719D70;
  v8 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));
  v4 = v8;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  v5 = objc_msgSend(v4, "copy");
  return v5;
}

+ (id)sharedItemsInCategory:(int64_t)a3 ofType:(int64_t)a4
{
  void *v8;
  void *v9;
  void *v10;
  void **v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v20;
  _QWORD v21[2];
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[2];
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[2];
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  _QWORD v51[3];
  void *v52;
  void *v53;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "sharedFactory"));
  if (!v8)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSAssertionHandler currentHandler](NSAssertionHandler, "currentHandler"));
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SDASharedItemsFactory.m"), 567, CFSTR("factory is nil."));

  }
  switch(a3)
  {
    case 0:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "images"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v53 = v10;
          v11 = &v53;
          goto LABEL_59;
        case 1:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "images"));
          goto LABEL_62;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "videos"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v52 = v10;
          v11 = &v52;
          goto LABEL_59;
        case 3:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "images"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v51[0] = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "images"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
          v51[1] = v14;
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "videos"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
          v51[2] = v18;
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v51, 3));

          goto LABEL_41;
        case 4:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "svgImages"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v50 = v10;
          v11 = &v50;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 1:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v49 = v10;
          v11 = &v49;
          goto LABEL_59;
        case 1:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
          v48 = v10;
          v11 = &v48;
          goto LABEL_59;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 2));
          v47 = v10;
          v11 = &v47;
          goto LABEL_59;
        case 3:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "contacts"));
          goto LABEL_62;
        case 4:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarEvents"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v46 = v10;
          v11 = &v46;
          goto LABEL_59;
        case 5:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "calendarEvents"));
          goto LABEL_62;
        case 6:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "passes"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v45 = v10;
          v11 = &v45;
          goto LABEL_59;
        case 7:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "passes"));
          goto LABEL_62;
        case 8:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "voiceMemos"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v44 = v10;
          v11 = &v44;
          goto LABEL_59;
        case 9:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "voiceMemos"));
          goto LABEL_62;
        case 10:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textDocuments"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v43 = v10;
          v11 = &v43;
          goto LABEL_59;
        case 11:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "textDocuments"));
          goto LABEL_62;
        default:
          goto LABEL_20;
      }
    case 2:
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iTunesStoreLinks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", a4));
      v42 = v10;
      v11 = &v42;
      goto LABEL_59;
    case 3:
      if (a4)
        goto LABEL_20;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "mapsLinks"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      v41 = v10;
      v11 = &v41;
LABEL_59:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v11, 1));
      goto LABEL_60;
    case 4:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v40 = v10;
          v11 = &v40;
          goto LABEL_59;
        case 1:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webLinks"));
          goto LABEL_62;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webLinkStrings"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v39 = v10;
          v11 = &v39;
          goto LABEL_59;
        case 3:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webLinkStringBlocks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v38 = v10;
          v11 = &v38;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 5:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pdfs"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v37 = v10;
          v11 = &v37;
          goto LABEL_59;
        case 1:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pdfs"));
          goto LABEL_62;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pages"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v36 = v10;
          v11 = &v36;
          goto LABEL_59;
        case 3:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pages"));
          goto LABEL_62;
        case 4:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pdfs"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v35[0] = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "pages"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
          v35[1] = v14;
          v15 = v35;
          goto LABEL_40;
        case 5:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharingDrawingDocuments"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v34 = v10;
          v11 = &v34;
          goto LABEL_59;
        default:
          goto LABEL_20;
      }
    case 6:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "telephoneLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v33 = v10;
          v11 = &v33;
          goto LABEL_59;
        case 1:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "findMyFriendsLink"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v32 = v10;
          v11 = &v32;
          goto LABEL_59;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "yelpLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v31 = v10;
          v11 = &v31;
          goto LABEL_59;
        case 3:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "webLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v30[0] = v10;
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "yelpLinks"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
          v30[1] = v14;
          v15 = v30;
          goto LABEL_40;
        case 4:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iLifeLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v29 = v10;
          v11 = &v29;
          goto LABEL_59;
        case 5:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "iWorkLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v28 = v10;
          v11 = &v28;
          goto LABEL_59;
        case 6:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "keynoteLiveLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v27 = v10;
          v11 = &v27;
          goto LABEL_59;
        case 7:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharediCloudDocumentsLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v26 = v10;
          v11 = &v26;
          goto LABEL_59;
        case 8:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharediCloudDocumentsLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
          v25 = v10;
          v11 = &v25;
          goto LABEL_59;
        case 9:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharediCloudDocumentsLinks"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 2));
          v24 = v10;
          v11 = &v24;
          goto LABEL_59;
        case 10:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "sharediCloudDocumentsLinks"));
          goto LABEL_62;
        default:
          goto LABEL_20;
      }
    case 7:
      switch(a4)
      {
        case 0:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strings"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v23 = v10;
          v11 = &v23;
          goto LABEL_59;
        case 1:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strings"));
          break;
        case 2:
          v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributedStrings"));
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
          v22 = v10;
          v11 = &v22;
          goto LABEL_59;
        case 3:
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataDocuments"));
          break;
        default:
          goto LABEL_20;
      }
LABEL_62:
      v12 = (void *)v16;
      break;
    case 8:
      if (a4)
        goto LABEL_20;
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "strings"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      v21[0] = v10;
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "images"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
      v21[1] = v14;
      v15 = v21;
LABEL_40:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
LABEL_41:

LABEL_60:
      break;
    default:
LABEL_20:
      v12 = 0;
      break;
  }

  return v12;
}

- (void)setCalendarEvents:(id)a3
{
  objc_storeStrong((id *)&self->_calendarEvents, a3);
}

- (void)setContacts:(id)a3
{
  objc_storeStrong((id *)&self->_contacts, a3);
}

- (void)setImages:(id)a3
{
  objc_storeStrong((id *)&self->_images, a3);
}

- (void)setSvgImages:(id)a3
{
  objc_storeStrong((id *)&self->_svgImages, a3);
}

- (NSArray)genericDataDocuments
{
  return self->_genericDataDocuments;
}

- (void)setGenericDataDocuments:(id)a3
{
  objc_storeStrong((id *)&self->_genericDataDocuments, a3);
}

- (void)setPages:(id)a3
{
  objc_storeStrong((id *)&self->_pages, a3);
}

- (void)setPasses:(id)a3
{
  objc_storeStrong((id *)&self->_passes, a3);
}

- (void)setPdfs:(id)a3
{
  objc_storeStrong((id *)&self->_pdfs, a3);
}

- (void)setSharingDrawingDocuments:(id)a3
{
  objc_storeStrong((id *)&self->_sharingDrawingDocuments, a3);
}

- (void)setTextDocuments:(id)a3
{
  objc_storeStrong((id *)&self->_textDocuments, a3);
}

- (void)setVideos:(id)a3
{
  objc_storeStrong((id *)&self->_videos, a3);
}

- (void)setVoiceMemos:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMemos, a3);
}

- (void)setILifeLinks:(id)a3
{
  objc_storeStrong((id *)&self->_iLifeLinks, a3);
}

- (void)setITunesStoreLinks:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStoreLinks, a3);
}

- (void)setIWorkLinks:(id)a3
{
  objc_storeStrong((id *)&self->_iWorkLinks, a3);
}

- (void)setMapsLinks:(id)a3
{
  objc_storeStrong((id *)&self->_mapsLinks, a3);
}

- (NSArray)sharedKeynoteLiveLinks
{
  return self->_sharedKeynoteLiveLinks;
}

- (void)setSharedKeynoteLiveLinks:(id)a3
{
  objc_storeStrong((id *)&self->_sharedKeynoteLiveLinks, a3);
}

- (void)setSharediCloudDocumentsLinks:(id)a3
{
  objc_storeStrong((id *)&self->_sharediCloudDocumentsLinks, a3);
}

- (void)setTelephoneLinks:(id)a3
{
  objc_storeStrong((id *)&self->_telephoneLinks, a3);
}

- (void)setWebLinks:(id)a3
{
  objc_storeStrong((id *)&self->_webLinks, a3);
}

- (void)setWebLinkStrings:(id)a3
{
  objc_storeStrong((id *)&self->_webLinkStrings, a3);
}

- (void)setWebLinkStringBlocks:(id)a3
{
  objc_storeStrong((id *)&self->_webLinkStringBlocks, a3);
}

- (void)setYelpLinks:(id)a3
{
  objc_storeStrong((id *)&self->_yelpLinks, a3);
}

- (void)setAttributedStrings:(id)a3
{
  objc_storeStrong((id *)&self->_attributedStrings, a3);
}

- (void)setStrings:(id)a3
{
  objc_storeStrong((id *)&self->_strings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strings, 0);
  objc_storeStrong((id *)&self->_attributedStrings, 0);
  objc_storeStrong((id *)&self->_yelpLinks, 0);
  objc_storeStrong((id *)&self->_webLinkStringBlocks, 0);
  objc_storeStrong((id *)&self->_webLinkStrings, 0);
  objc_storeStrong((id *)&self->_webLinks, 0);
  objc_storeStrong((id *)&self->_telephoneLinks, 0);
  objc_storeStrong((id *)&self->_sharediCloudDocumentsLinks, 0);
  objc_storeStrong((id *)&self->_sharedKeynoteLiveLinks, 0);
  objc_storeStrong((id *)&self->_mapsLinks, 0);
  objc_storeStrong((id *)&self->_iWorkLinks, 0);
  objc_storeStrong((id *)&self->_iTunesStoreLinks, 0);
  objc_storeStrong((id *)&self->_iLifeLinks, 0);
  objc_storeStrong((id *)&self->_voiceMemos, 0);
  objc_storeStrong((id *)&self->_videos, 0);
  objc_storeStrong((id *)&self->_textDocuments, 0);
  objc_storeStrong((id *)&self->_sharingDrawingDocuments, 0);
  objc_storeStrong((id *)&self->_pdfs, 0);
  objc_storeStrong((id *)&self->_passes, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_genericDataDocuments, 0);
  objc_storeStrong((id *)&self->_svgImages, 0);
  objc_storeStrong((id *)&self->_images, 0);
  objc_storeStrong((id *)&self->_contacts, 0);
  objc_storeStrong((id *)&self->_calendarEvents, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
