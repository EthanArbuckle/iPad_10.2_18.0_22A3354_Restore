@implementation MainWindowControlHeaderView

- (id)customBadgedButtonWithImage:(id)a3 action:(SEL)a4
{
  id v6;
  void *v7;
  _QWORD v9[5];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
  objc_msgSend(v7, "setImage:forState:", v6, 0);

  objc_msgSend(v7, "addTarget:action:forControlEvents:", self, a4, 64);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10008C70C;
  v9[3] = &unk_1001B3A80;
  v9[4] = self;
  objc_msgSend(v7, "setPointerStyleProvider:", v9);
  return v7;
}

- (void)updateInboxCount:(unint64_t)a3
{
  unint64_t inboxCount;
  int *v6;
  int *v7;
  UIBarButtonItem *v8;
  UIBarButtonItem *v9;
  UIBarButtonItem *badgedInboxBarButton;
  id v11;
  void *v12;
  void *v13;
  UIBarButtonItem *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *v16;
  void *v17;
  void *v18;
  UIBarButtonItem *v19;

  inboxCount = self->_inboxCount;
  if (inboxCount != a3)
  {
    if (inboxCount)
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
    else
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
    v19 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v6);
    if (a3)
      v7 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
    else
      v7 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
    v8 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v7);
    self->_inboxCount = a3;
    v9 = self->_inboxBarButton;
    if (self->_inboxCount)
    {
      badgedInboxBarButton = self->_badgedInboxBarButton;
      if (!badgedInboxBarButton)
      {
        v11 = objc_alloc((Class)UIBarButtonItem);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem image](self->_inboxBarButton, "image"));
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowControlHeaderView customBadgedButtonWithImage:action:](self, "customBadgedButtonWithImage:action:", v12, "inboxButtonTapped"));
        v14 = (UIBarButtonItem *)objc_msgSend(v11, "initWithCustomView:", v13);
        v15 = self->_badgedInboxBarButton;
        self->_badgedInboxBarButton = v14;

        badgedInboxBarButton = self->_badgedInboxBarButton;
      }
      v16 = badgedInboxBarButton;

      v9 = v16;
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView inboxImageForCount:selected:](MainWindowControlHeaderView, "inboxImageForCount:selected:", a3, self->_inboxSelected));
    if (v9 == self->_inboxBarButton)
    {
      -[UIBarButtonItem setImage:](v9, "setImage:", v17);
    }
    else
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIBarButtonItem customView](v9, "customView"));
      objc_msgSend(v18, "setImage:forState:", v17, 0);

    }
    -[MainWindowControlHeaderView updateToolbarItems](self, "updateToolbarItems");
    if (v19 != v8 && v8 == self->_inboxBarButton)
      -[UIBarButtonItem setSelected:](v8, "setSelected:", self->_inboxSelected);

  }
}

+ (CGImage)imageForString:(id)a3 atRect:(CGRect)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  double v7;
  double v8;
  double y;
  double x;
  id v11;
  void *v12;
  double v13;
  double v14;
  size_t v15;
  size_t v16;
  size_t AlignedBytesPerRow;
  CGColorSpace *DeviceGray;
  CGContext *v19;
  id v20;
  CGImage *Image;
  CGAffineTransform v23;
  CGRect v24;
  CGRect v25;

  height = a5.height;
  width = a5.width;
  v7 = a4.size.height;
  v8 = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v12, "scale");
  v14 = v13;

  v15 = vcvtpd_u64_f64(width * v14);
  v16 = vcvtpd_u64_f64(height * v14);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(4 * v15);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v19 = CGBitmapContextCreate(0, v15, v16, 8uLL, AlignedBytesPerRow, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v19)
  {
    UIGraphicsPushContext(v19);
    v24.size.width = (double)v15;
    v24.size.height = (double)v16;
    v24.origin.x = 0.0;
    v24.origin.y = 0.0;
    CGContextClearRect(v19, v24);
    CGContextScaleCTM(v19, v14, v14);
    CGContextGetCTM(&v23, v19);
    CGContextSetBaseCTM(v19, &v23);
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    CGContextSetFillColorWithColor(v19, (CGColorRef)objc_msgSend(v20, "CGColor"));

    v25.origin.x = 0.0;
    v25.origin.y = 0.0;
    v25.size.width = width;
    v25.size.height = height;
    CGContextFillRect(v19, v25);
    objc_msgSend(v11, "drawInRect:", x, y, v8, v7);
    Image = CGBitmapContextCreateImage(v19);
    UIGraphicsPopContext();
    CGContextRelease(v19);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

- (void)updateToolbarItems
{
  int *v3;
  uint64_t v4;
  void *v5;
  int *v6;
  uint64_t v7;
  void *v8;
  UIBarButtonItem *listViewBarButton;
  void *v10;
  UIBarButtonItem *newEventBarButton;
  void *v12;
  _QWORD v13[7];

  if (self->_hasError)
    v3 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
  else
    v3 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
  v4 = objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_spacers, "objectAtIndexedSubscript:", 0, *(Class *)((char *)&self->super.super.super.isa + *v3)));
  v5 = (void *)v4;
  if (self->_inboxCount)
    v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
  else
    v6 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
  v7 = *(uint64_t *)((char *)&self->super.super.super.isa + *v6);
  v13[1] = v4;
  v13[2] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_spacers, "objectAtIndexedSubscript:", 1));
  listViewBarButton = self->_listViewBarButton;
  v13[3] = v8;
  v13[4] = listViewBarButton;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_spacers, "objectAtIndexedSubscript:", 2));
  newEventBarButton = self->_newEventBarButton;
  v13[5] = v10;
  v13[6] = newEventBarButton;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v13, 7));
  -[UIToolbar setItems:](self->_toolbar, "setItems:", v12);

}

+ (id)inboxImageForCount:(unint64_t)a3 selected:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  void *v8;
  void *v9;
  __CFString *v10;
  id v11;
  const __CFString *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  double v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  uint64_t v39;
  int IsLeftToRight;
  double v41;
  CGContextRef CurrentContext;
  CGContext *v43;
  double v44;
  int v45;
  double v46;
  NSString *const **v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  id v53;
  double v54;
  double v55;
  CGImage *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  void *v61;
  CGImage *v62;
  void *v63;
  UIImage *ImageFromCurrentImageContext;
  void *v65;
  double v67;
  double v68;
  double v69;
  void *v70;
  void *v71;
  void *v72;
  id v73;
  double v74;
  double v75;
  double v76;
  _QWORD v77[3];
  _QWORD v78[3];
  CGSize v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  v4 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 17.0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("tray"), v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageFlippedForRightToLeftLayoutDirection"));

  if (a3)
  {
    if (qword_1001F6228 != -1)
      dispatch_once(&qword_1001F6228, &stru_1001B3A30);
    if (a3 <= 0x63)
    {
      v12 = CFSTR("unselected");
      if (v4)
        v12 = CFSTR("selected");
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%tu-%@"), a3, v12));
    }
    else
    {
      v10 = CFSTR("over-max");
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_1001F6220, "objectForKey:", v10));
    if (!v11)
    {
      if (a3 >= 0x63)
        v13 = 99;
      else
        v13 = a3;
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v13));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter localizedStringFromNumber:numberStyle:](NSNumberFormatter, "localizedStringFromNumber:numberStyle:", v14, 1));

      v72 = v15;
      v73 = a1;
      if (a3 <= 0x63)
      {
        v18 = v15;
        v19 = 0.0;
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("%@+"), &stru_1001B67C0, 0));
        v18 = (id)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v17, v15));

        v19 = 1.0;
      }
      v74 = v19;
      v20 = objc_alloc_init((Class)NSMutableParagraphStyle);
      objc_msgSend(v20, "setAlignment:", 1);
      v21 = objc_alloc((Class)NSAttributedString);
      v77[0] = NSFontAttributeName;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 8.0, UIFontWeightSemibold));
      v78[0] = v22;
      v78[1] = v20;
      v70 = v20;
      v77[1] = NSParagraphStyleAttributeName;
      v77[2] = NSForegroundColorAttributeName;
      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      v78[2] = v23;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v78, v77, 3));
      v71 = v18;
      v25 = objc_msgSend(v21, "initWithString:attributes:", v18, v24);

      objc_msgSend(v25, "size");
      v27 = ceil(v26 + 4.0);
      v29 = ceil(v28 + 4.0);
      if (v28 <= v26)
        v30 = v27;
      else
        v30 = v29;
      objc_msgSend(v9, "size");
      v32 = v31;
      v34 = v33;
      v35 = v31 + 6.0;
      v36 = v27 * 0.5;
      v37 = v33 + v27 * 0.5 + 2.0 + 2.0 + 2.0;
      v80.origin.x = 1.0;
      v80.origin.y = v27 * 0.5;
      v80.size.width = v32;
      v80.size.height = v34;
      v76 = v30;
      v38 = CGRectGetMaxX(v80) - v30 + 2.0;
      IsLeftToRight = CalInterfaceIsLeftToRight(v39);
      if (IsLeftToRight)
        v41 = 1.0;
      else
        v41 = 3.0;
      if (!IsLeftToRight)
        v38 = v74;
      v68 = v37;
      v69 = v35;
      v79.width = v35;
      v79.height = v37;
      UIGraphicsBeginImageContextWithOptions(v79, 0, 0.0);
      CurrentContext = UIGraphicsGetCurrentContext();
      v43 = CurrentContext;
      v44 = v38;
      v75 = v27;
      if (!v4)
      {
        v45 = CalInterfaceIsLeftToRight(CurrentContext);
        v46 = -1.0;
        if (!v45)
          v46 = 1.0;
        v44 = v38 + v46;
        v27 = v27 + 1.5;
      }
      v67 = v38;
      v47 = &EKEventStoreChangedNotification_ptr;
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v44, 0.0, v76, v27, v36));
      CGContextSaveGState(v43);
      if (v4)
        v49 = v41 + -1.0;
      else
        v49 = v41;
      if (v4)
        v50 = v36 + -2.0;
      else
        v50 = v36;
      if (v4)
        v51 = v32 + 2.0;
      else
        v51 = v32;
      if (v4)
        v52 = v34 + 4.0;
      else
        v52 = v34;
      CGContextBeginPath(v43);
      v81.origin.x = v49;
      v81.origin.y = v50;
      v81.size.width = v51;
      v81.size.height = v52;
      CGContextAddRect(v43, v81);
      v53 = objc_retainAutorelease(v48);
      CGContextAddPath(v43, (CGPathRef)objc_msgSend(v53, "CGPath"));
      CGContextEOClip(v43);
      if (v4)
      {
        v55 = v68;
        v54 = v69;
        v56 = (CGImage *)objc_msgSend(v73, "maskImageForImage:atPoint:withSize:", v9, v41, v36, v69, v68);
        v82.origin.x = 0.0;
        v82.origin.y = 0.0;
        v82.size.width = v69;
        v82.size.height = v68;
        CGContextClipToMask(v43, v82, v56);
        CGImageRelease(v56);
        v57 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v49, v50, v51, v52, 4.0));
        v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        objc_msgSend(v58, "set");

        v47 = &EKEventStoreChangedNotification_ptr;
        objc_msgSend(v57, "fill");

        v59 = v73;
      }
      else
      {
        objc_msgSend(v9, "drawInRect:", v41, v36, v32, v34);
        v59 = v73;
        v55 = v68;
        v54 = v69;
      }
      CGContextRestoreGState(v43);
      v60 = 0.0;
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v47[278], "bezierPathWithRoundedRect:cornerRadius:", v67, 0.0, v76, v75, v36));
      v62 = (CGImage *)objc_msgSend(v59, "imageForString:atRect:withSize:", v25, v67, 2.0, v76, v75 + -4.0, v54, v55);
      if (a3 >= 0x64)
        v60 = CalOnePixelInPoints() + 0.0;
      v83.origin.y = 0.0;
      v83.origin.x = v60;
      v83.size.width = v54;
      v83.size.height = v55;
      CGContextClipToMask(v43, v83, v62);
      v63 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      objc_msgSend(v63, "set");

      objc_msgSend(v61, "fill");
      ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
      v65 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "imageWithRenderingMode:", 2));

      UIGraphicsEndImageContext();
      CGImageRelease(v62);
      objc_msgSend((id)qword_1001F6220, "setObject:forKey:", v11, v10);

    }
  }
  else
  {
    v11 = v9;
  }

  return v11;
}

- (MainWindowControlHeaderView)initWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  MainWindowControlHeaderView *v7;
  UIToolbar *v8;
  UIToolbar *toolbar;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  UIBarButtonItem *v15;
  UIBarButtonItem *calendarBarButton;
  id v17;
  void *v18;
  UIBarButtonItem *v19;
  UIBarButtonItem *inboxBarButton;
  id v21;
  void *v22;
  void *v23;
  UIBarButtonItem *v24;
  UIBarButtonItem *listViewBarButton;
  id v26;
  void *v27;
  UIBarButtonItem *v28;
  UIBarButtonItem *newEventBarButton;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *spacers;
  objc_super v36;
  _QWORD v37[3];

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v36.receiver = self;
  v36.super_class = (Class)MainWindowControlHeaderView;
  v7 = -[MainWindowControlHeaderView initWithFrame:](&v36, "initWithFrame:");
  if (v7)
  {
    v8 = (UIToolbar *)objc_msgSend(objc_alloc((Class)UIToolbar), "initWithFrame:", x, y, width, height);
    toolbar = v7->_toolbar;
    v7->_toolbar = v8;

    -[UIToolbar setAutoresizingMask:](v7->_toolbar, "setAutoresizingMask:", 18);
    v10 = objc_alloc_init((Class)UIView);
    -[UIToolbar _setBackgroundView:](v7->_toolbar, "_setBackgroundView:", v10);

    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 17.0));
    v12 = objc_alloc((Class)UIBarButtonItem);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("calendar"), v11));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageFlippedForRightToLeftLayoutDirection"));
    v15 = (UIBarButtonItem *)objc_msgSend(v12, "initWithImage:style:target:action:", v14, 0, v7, "calendarButtonTapped");
    calendarBarButton = v7->_calendarBarButton;
    v7->_calendarBarButton = v15;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_calendarBarButton, "_setAdditionalSelectionInsets:", 5.0, 2.5, 5.5, 2.5);
    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_calendarBarButton, "setAccessibilityIdentifier:", CFSTR("calendars-button"));
    v17 = objc_alloc((Class)UIBarButtonItem);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView inboxImageForCount:selected:](MainWindowControlHeaderView, "inboxImageForCount:selected:", 0, 0));
    v19 = (UIBarButtonItem *)objc_msgSend(v17, "initWithImage:style:target:action:", v18, 0, v7, "inboxButtonTapped");
    inboxBarButton = v7->_inboxBarButton;
    v7->_inboxBarButton = v19;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_inboxBarButton, "_setAdditionalSelectionInsets:", 4.0, 3.0, 5.0, 3.0);
    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_inboxBarButton, "setAccessibilityIdentifier:", CFSTR("inbox-button"));
    v21 = objc_alloc((Class)UIBarButtonItem);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("list.bullet"), v11));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageFlippedForRightToLeftLayoutDirection"));
    v24 = (UIBarButtonItem *)objc_msgSend(v21, "initWithImage:style:target:action:", v23, 0, v7, "listButtonTapped");
    listViewBarButton = v7->_listViewBarButton;
    v7->_listViewBarButton = v24;

    -[UIBarButtonItem _setAdditionalSelectionInsets:](v7->_listViewBarButton, "_setAdditionalSelectionInsets:", 3.0, 2.5, 3.0, 2.5);
    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_listViewBarButton, "setAccessibilityIdentifier:", CFSTR("listview-button"));
    v26 = objc_alloc((Class)UIBarButtonItem);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("plus"), v11));
    v28 = (UIBarButtonItem *)objc_msgSend(v26, "initWithImage:style:target:action:", v27, 0, v7, "newEventButtonTapped");
    newEventBarButton = v7->_newEventBarButton;
    v7->_newEventBarButton = v28;

    -[UIBarButtonItem setAccessibilityIdentifier:](v7->_newEventBarButton, "setAccessibilityIdentifier:", CFSTR("addevent-button"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView spacer](MainWindowControlHeaderView, "spacer"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView spacer](MainWindowControlHeaderView, "spacer"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView spacer](MainWindowControlHeaderView, "spacer"));
    v37[0] = v30;
    v37[1] = v31;
    v37[2] = v32;
    v33 = objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 3));
    spacers = v7->_spacers;
    v7->_spacers = (NSArray *)v33;

    -[MainWindowControlHeaderView updateToolbarItems](v7, "updateToolbarItems");
    -[MainWindowControlHeaderView addSubview:](v7, "addSubview:", v7->_toolbar);

  }
  return v7;
}

+ (id)spacer
{
  id v2;

  v2 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:primaryAction:", 6, 0);
  objc_msgSend(v2, "setWidth:", 15.0);
  return v2;
}

- (void)layoutForWidth:(double)a3
{
  double v4;
  double v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  +[MainWindowControlHeaderView spacerWidthForWindowWidth:](MainWindowControlHeaderView, "spacerWidthForWindowWidth:", a3);
  v5 = v4;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = self->_spacers;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setWidth:", v5, (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

- (void)updateErrorState:(BOOL)a3
{
  _BOOL4 v3;
  int *v5;
  int *v6;
  UIBarButtonItem *v7;
  id v8;
  void *v9;
  void *v10;
  UIBarButtonItem *v11;
  UIBarButtonItem *badgedCalendarBarButton;
  UIBarButtonItem *v13;

  if (self->_hasError != a3)
  {
    v3 = a3;
    if (self->_hasError)
      v5 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
    else
      v5 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
    v13 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v5);
    if (v3)
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
    else
      v6 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
    v7 = (UIBarButtonItem *)*(id *)((char *)&self->super.super.super.isa + *v6);
    self->_hasError = v3;
    if (v3 && !self->_badgedCalendarBarButton)
    {
      v8 = objc_alloc((Class)UIBarButtonItem);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MainWindowControlHeaderView badgedCalendarIcon:](MainWindowControlHeaderView, "badgedCalendarIcon:", self->_calendarSelected));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[MainWindowControlHeaderView customBadgedButtonWithImage:action:](self, "customBadgedButtonWithImage:action:", v9, "calendarButtonTapped"));
      v11 = (UIBarButtonItem *)objc_msgSend(v8, "initWithCustomView:", v10);
      badgedCalendarBarButton = self->_badgedCalendarBarButton;
      self->_badgedCalendarBarButton = v11;

    }
    -[MainWindowControlHeaderView updateToolbarItems](self, "updateToolbarItems");
    if (v13 != v7 && v7 == self->_calendarBarButton)
      -[UIBarButtonItem setSelected:](v7, "setSelected:", self->_calendarSelected);

  }
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MainWindowControlHeaderDelegate *)a3;
}

- (id)newEventBarButtonItem
{
  return self->_newEventBarButton;
}

+ (double)spacerWidthForWindowWidth:(double)a3
{
  double v4;
  BOOL v5;
  double result;

  +[MainWindowRootViewController minimumStandardWindowWidth](MainWindowRootViewController, "minimumStandardWindowWidth");
  v5 = v4 <= a3;
  result = 15.0;
  if (!v5)
    return 5.0;
  return result;
}

+ (CGImage)maskImageForImage:(id)a3 atPoint:(CGPoint)a4 withSize:(CGSize)a5
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  void *v10;
  double v11;
  double v12;
  size_t v13;
  size_t v14;
  size_t AlignedBytesPerRow;
  CGColorSpace *DeviceGray;
  CGContext *v17;
  id v18;
  CGImage *Image;
  CGAffineTransform v21;
  CGRect v22;
  CGRect v23;

  height = a5.height;
  width = a5.width;
  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v10, "scale");
  v12 = v11;

  v13 = vcvtpd_u64_f64(width * v12);
  v14 = vcvtpd_u64_f64(height * v12);
  AlignedBytesPerRow = CGBitmapGetAlignedBytesPerRow(4 * v13);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v17 = CGBitmapContextCreate(0, v13, v14, 8uLL, AlignedBytesPerRow, DeviceGray, 0);
  CGColorSpaceRelease(DeviceGray);
  if (v17)
  {
    UIGraphicsPushContext(v17);
    v22.size.width = (double)v13;
    v22.size.height = (double)v14;
    v22.origin.x = 0.0;
    v22.origin.y = 0.0;
    CGContextClearRect(v17, v22);
    CGContextScaleCTM(v17, v12, v12);
    CGContextGetCTM(&v21, v17);
    CGContextSetBaseCTM(v17, &v21);
    v18 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    CGContextSetFillColorWithColor(v17, (CGColorRef)objc_msgSend(v18, "CGColor"));

    v23.origin.x = 0.0;
    v23.origin.y = 0.0;
    v23.size.width = width;
    v23.size.height = height;
    CGContextFillRect(v17, v23);
    objc_msgSend(v9, "drawAtPoint:", x, y);
    Image = CGBitmapContextCreateImage(v17);
    UIGraphicsPopContext();
    CGContextRelease(v17);
  }
  else
  {
    Image = 0;
  }

  return Image;
}

+ (id)badgedCalendarIcon:(BOOL)a3
{
  _BOOL4 v3;
  id *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int IsLeftToRight;
  double v12;
  double v13;
  id v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGContext *CurrentContext;
  CGContext *v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  id v29;
  double v30;
  double v31;
  int v32;
  double v33;
  void *v34;
  id v35;
  uint64_t v36;
  double v37;
  CGImage *v38;
  void *v39;
  void *v40;
  id v41;
  id *v42;
  UIImage *ImageFromCurrentImageContext;
  void *v44;
  double v46;
  CGSize v47;
  CGRect v48;
  CGRect v49;

  v3 = a3;
  v5 = (id *)&unk_1001F6230;
  if (a3)
    v5 = (id *)&unk_1001F6238;
  v6 = *v5;
  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, 17.0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("calendar.badge.exclamationmark"), v7));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageFlippedForRightToLeftLayoutDirection"));

    IsLeftToRight = CalInterfaceIsLeftToRight(v10);
    v12 = 0.0;
    if (IsLeftToRight)
      v13 = 1.0;
    else
      v13 = 0.0;
    v14 = objc_msgSend(v9, "size");
    v16 = v15 + 1.0;
    v18 = v17 + 2.0;
    if (!CalInterfaceIsLeftToRight(v14))
      v16 = v16 + 1.0;
    v47.width = v16;
    v47.height = v18;
    UIGraphicsBeginImageContextWithOptions(v47, 0, 0.0);
    CurrentContext = UIGraphicsGetCurrentContext();
    if (v3)
    {
      v20 = CurrentContext;
      if (IsLeftToRight)
        v21 = 0.0;
      else
        v21 = 1.0;
      CGContextSaveGState(CurrentContext);
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("calendar"), v7));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "imageFlippedForRightToLeftLayoutDirection"));

      objc_msgSend(v23, "size");
      v46 = v21 + v13 + v24;
      objc_msgSend(v23, "size");
      v26 = v25 + 1.0 + 1.0;
      objc_msgSend(v9, "size");
      v28 = v13 + v27 + -13.0 + -0.5;
      v29 = objc_msgSend(v9, "size");
      v31 = v30 + 1.0 + -13.0 + -2.0;
      v32 = CalInterfaceIsLeftToRight(v29);
      v33 = v13 + 0.5;
      if (v32)
        v33 = v28;
      else
        v12 = 3.75;
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v33, v31, 13.0, 13.0, 7.0));
      CGContextBeginPath(v20);
      v48.origin.y = 0.0;
      v48.origin.x = v12;
      v48.size.width = v46;
      v48.size.height = v26;
      CGContextAddRect(v20, v48);
      v35 = objc_retainAutorelease(v34);
      CGContextAddPath(v20, (CGPathRef)objc_msgSend(v35, "CGPath"));
      CGContextEOClip(v20);
      if (CalInterfaceIsLeftToRight(v36))
        v37 = v13;
      else
        v37 = 3.75;
      v38 = (CGImage *)objc_msgSend(a1, "maskImageForImage:atPoint:withSize:", v23, v37, 1.0, v16, v18);
      v49.origin.x = 0.0;
      v49.origin.y = 0.0;
      v49.size.width = v16;
      v49.size.height = v18;
      CGContextClipToMask(v20, v49, v38);
      CGImageRelease(v38);
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v12, 0.0, v46, v26, 4.0));
      v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
      objc_msgSend(v40, "set");

      objc_msgSend(v39, "fill");
      CGContextRestoreGState(v20);
      CGContextBeginPath(v20);
      v41 = objc_retainAutorelease(v35);
      CGContextAddPath(v20, (CGPathRef)objc_msgSend(v41, "CGPath"));
      CGContextClip(v20);
      objc_msgSend(v9, "drawAtPoint:", v13, 1.0);

      v42 = (id *)&unk_1001F6238;
    }
    else
    {
      objc_msgSend(v9, "drawAtPoint:", v13, 1.0);
      v42 = (id *)&unk_1001F6230;
    }
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v44 = (void *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "imageWithRenderingMode:", 2));

    UIGraphicsEndImageContext();
    objc_storeStrong(v42, v6);

  }
  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  -[UIToolbar sizeThatFits:](self->_toolbar, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)updateButtonStateForSidebar:(unint64_t)a3
{
  int *v5;
  id v6;
  int *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  MainWindowControlHeaderView *v14;
  id v15;
  unint64_t v16;
  _QWORD v17[3];

  if (self->_hasError)
    v5 = &OBJC_IVAR___MainWindowControlHeaderView__badgedCalendarBarButton;
  else
    v5 = &OBJC_IVAR___MainWindowControlHeaderView__calendarBarButton;
  v6 = *(id *)((char *)&self->super.super.super.isa + *v5);
  if (self->_inboxCount)
    v7 = &OBJC_IVAR___MainWindowControlHeaderView__badgedInboxBarButton;
  else
    v7 = &OBJC_IVAR___MainWindowControlHeaderView__inboxBarButton;
  v8 = *(id *)((char *)&self->super.super.super.isa + *v7);
  v17[0] = v6;
  v17[1] = v8;
  v17[2] = self->_listViewBarButton;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 3));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10008C45C;
  v12[3] = &unk_1001B3A58;
  v13 = v8;
  v14 = self;
  v15 = v6;
  v16 = a3;
  v10 = v6;
  v11 = v8;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);

}

- (void)calendarButtonTapped
{
  -[MainWindowControlHeaderDelegate calendarButtonTapped](self->_delegate, "calendarButtonTapped");
}

- (void)inboxButtonTapped
{
  -[MainWindowControlHeaderDelegate inboxButtonTapped](self->_delegate, "inboxButtonTapped");
}

- (void)listButtonTapped
{
  -[MainWindowControlHeaderDelegate listButtonTapped](self->_delegate, "listButtonTapped");
}

- (void)newEventButtonTapped
{
  -[MainWindowControlHeaderDelegate newEventButtonTapped:](self->_delegate, "newEventButtonTapped:", self->_newEventBarButton);
}

- (MainWindowControlHeaderDelegate)delegate
{
  return self->_delegate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spacers, 0);
  objc_storeStrong((id *)&self->_newEventBarButton, 0);
  objc_storeStrong((id *)&self->_listViewBarButton, 0);
  objc_storeStrong((id *)&self->_badgedInboxBarButton, 0);
  objc_storeStrong((id *)&self->_inboxBarButton, 0);
  objc_storeStrong((id *)&self->_badgedCalendarBarButton, 0);
  objc_storeStrong((id *)&self->_calendarBarButton, 0);
  objc_storeStrong((id *)&self->_toolbar, 0);
}

@end
