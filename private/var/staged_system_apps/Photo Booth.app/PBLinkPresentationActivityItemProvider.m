@implementation PBLinkPresentationActivityItemProvider

- (PBLinkPresentationActivityItemProvider)initWithAsset:(id)a3
{
  PBLinkPresentationActivityItemProvider *v4;
  PLDateRangeFormatter *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PBLinkPresentationActivityItemProvider;
  v4 = -[PBLinkPresentationActivityItemProvider init](&v7, "init");
  if (v4)
  {
    v4->_asset = (PHAsset *)a3;
    v5 = (PLDateRangeFormatter *)objc_msgSend(objc_alloc((Class)PLDateRangeFormatter), "initWithPreset:", 2);
    v4->__dayFormatter = v5;
    -[PLDateRangeFormatter setUseLocalDates:](v5, "setUseLocalDates:", 1);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PBLinkPresentationActivityItemProvider;
  -[PBLinkPresentationActivityItemProvider dealloc](&v3, "dealloc");
}

- (id)_linkMetadata
{
  id v3;
  objc_class *v4;
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  uint64_t v9;
  objc_class *v10;
  _QWORD v12[5];
  void **v13;
  uint64_t v14;
  Class (*v15)(uint64_t);
  void *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;

  v3 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", -[PLDateRangeFormatter stringFromDate:](-[PBLinkPresentationActivityItemProvider _dayFormatter](self, "_dayFormatter"), "stringFromDate:", -[PHAsset creationDate](-[PBLinkPresentationActivityItemProvider asset](self, "asset"), "creationDate")));
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_1000094AC;
  v22 = sub_1000094BC;
  v4 = (objc_class *)qword_1000434E0;
  v23 = qword_1000434E0;
  if (!qword_1000434E0)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000094C8;
    v16 = &unk_100034BA8;
    v17 = &v18;
    sub_1000094C8((uint64_t)&v13);
    v4 = (objc_class *)v19[5];
  }
  _Block_object_dispose(&v18, 8);
  v5 = objc_alloc_init(v4);
  objc_msgSend(v5, "setStatus:", v3);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_1000094AC;
  v22 = sub_1000094BC;
  v6 = (objc_class *)qword_1000434F0;
  v23 = qword_1000434F0;
  if (!qword_1000434F0)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_1000095C0;
    v16 = &unk_100034BA8;
    v17 = &v18;
    sub_1000095C0((uint64_t)&v13);
    v6 = (objc_class *)v19[5];
  }
  _Block_object_dispose(&v18, 8);
  v7 = objc_alloc_init(v6);
  objc_msgSend(v7, "setTitle:", -[NSBundle localizedStringForKey:value:table:](+[NSBundle mainBundle](NSBundle, "mainBundle"), "localizedStringForKey:value:table:", CFSTR("SHARE_SINGLE_PHOTO_TITLE"), &stru_100035390, CFSTR("PhotoBooth")));
  objc_msgSend(v7, "setSpecialization:", v5);
  v8 = objc_alloc_init((Class)NSItemProvider);
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000092FC;
  v12[3] = &unk_100034B80;
  v12[4] = self;
  objc_msgSend(v8, "registerObjectOfClass:visibility:loadHandler:", objc_opt_class(UIImage, v9), 0, v12);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_1000094AC;
  v22 = sub_1000094BC;
  v10 = (objc_class *)qword_1000434F8;
  v23 = qword_1000434F8;
  if (!qword_1000434F8)
  {
    v13 = _NSConcreteStackBlock;
    v14 = 3221225472;
    v15 = sub_100009614;
    v16 = &unk_100034BA8;
    v17 = &v18;
    sub_100009614((uint64_t)&v13);
    v10 = (objc_class *)v19[5];
  }
  _Block_object_dispose(&v18, 8);
  objc_msgSend(v7, "setImage:", objc_msgSend([v10 alloc], "initWithItemProvider:properties:placeholderImage:", v8, 0, 0));
  return v7;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  return -[PBLinkPresentationActivityItemProvider _linkMetadata](self, "_linkMetadata", a3);
}

- (PHAsset)asset
{
  return self->_asset;
}

- (PLDateRangeFormatter)_dayFormatter
{
  return self->__dayFormatter;
}

@end
