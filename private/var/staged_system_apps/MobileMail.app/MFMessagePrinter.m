@implementation MFMessagePrinter

- (void)dealloc
{
  void *v3;
  MFMessagePrinter *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
  v4 = (MFMessagePrinter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "printPageRenderer"));

  if (v4 == self)
    objc_msgSend(v3, "setPrintPageRenderer:", 0);

  v5.receiver = self;
  v5.super_class = (Class)MFMessagePrinter;
  -[MFMessagePrinter dealloc](&v5, "dealloc");
}

- (MFMessagePrinter)initWithContentRequest:(id)a3
{
  id v4;
  MFMessagePrinter *v5;
  uint64_t v6;
  EMMessage *message;
  EFPromise *v8;
  EFPromise *webLoadPromise;
  MFMessageViewController *v10;
  void *v11;
  void *v12;
  MFMessageViewController *v13;
  MFMessageViewController *messageViewController;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  UIWindow *v23;
  UIWindow *window;
  UIWindow *v25;
  void *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MFMessagePrinter;
  v5 = -[MFMessagePrinter init](&v28, "init");
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "message"));
    message = v5->_message;
    v5->_message = (EMMessage *)v6;

    v8 = (EFPromise *)objc_alloc_init((Class)EFPromise);
    webLoadPromise = v5->_webLoadPromise;
    v5->_webLoadPromise = v8;

    v10 = [MFMessageViewController alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accountsController"));
    v13 = -[MFMessageViewController initWithScene:accountsController:](v10, "initWithScene:accountsController:", 0, v12);
    messageViewController = v5->_messageViewController;
    v5->_messageViewController = v13;

    -[MFMessageViewController setDelegate:](v5->_messageViewController, "setDelegate:", v5);
    -[MFMessageViewController setContentRequest:](v5->_messageViewController, "setContentRequest:", v4);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInfo printInfo](UIPrintInfo, "printInfo"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[EMMessage subject](v5->_message, "subject"));
    v17 = objc_msgSend(v16, "length");
    if (v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "subjectString"));
      v19 = v18;
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("NO_SUBJECT"), &stru_100531B00, CFSTR("Main")));
    }
    objc_msgSend(v15, "setJobName:", v18);
    if (!v17)

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIPrintInteractionController sharedPrintController](UIPrintInteractionController, "sharedPrintController"));
    objc_msgSend(v20, "setPrintPageRenderer:", v5);
    objc_msgSend(v20, "setPrintInfo:", v15);
    objc_msgSend(v20, "setDelegate:", v5);
    v21 = objc_alloc((Class)UIWindow);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v22, "bounds");
    v23 = (UIWindow *)objc_msgSend(v21, "initWithFrame:");
    window = v5->_window;
    v5->_window = v23;

    -[UIWindow setAlpha:](v5->_window, "setAlpha:", 0.01);
    -[UIWindow setHidden:](v5->_window, "setHidden:", 0);
    v25 = v5->_window;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageViewController view](v5->_messageViewController, "view"));
    -[UIWindow addSubview:](v25, "addSubview:", v26);

  }
  return v5;
}

- (void)presentPrintPopoverFromBarButtonItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EFPromise future](self->_webLoadPromise, "future"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100181F28;
  v8[3] = &unk_10051CE48;
  v8[4] = self;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "onScheduler:addSuccessBlock:", v6, v8);

}

- (void)presentPrintSheet
{
  void *v3;
  void *v4;
  _QWORD v5[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[EFPromise future](self->_webLoadPromise, "future"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100181FF0;
  v5[3] = &unk_100521DE8;
  v5[4] = self;
  objc_msgSend(v3, "onScheduler:addSuccessBlock:", v4, v5);

}

- (void)loadWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[EFPromise future](self->_webLoadPromise, "future"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001820E8;
  v8[3] = &unk_100521E10;
  v7 = v4;
  v9 = v7;
  objc_msgSend(v5, "onScheduler:addSuccessBlock:", v6, v8);

}

- (id)printInteractionControllerParentViewController:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessagePrinter delegate](self, "delegate", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "parentViewControllerForMessagePrinter:", self));

  return v5;
}

- (int64_t)numberOfPages
{
  void *v3;
  objc_super v5;
  _QWORD v6[5];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1001821F0;
  v6[3] = &unk_10051AA98;
  v6[4] = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[EFScheduler mainThreadScheduler](EFScheduler, "mainThreadScheduler"));
  objc_msgSend(v3, "performSyncBlock:", v6);

  v5.receiver = self;
  v5.super_class = (Class)MFMessagePrinter;
  return -[MFMessagePrinter numberOfPages](&v5, "numberOfPages");
}

- (CGRect)_printingRectForImageableRect:(CGRect)a3
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  double MinY;
  double v22;
  double MaxY;
  double v24;
  double v25;
  double MinX;
  double v27;
  double MaxX;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  CGFloat rect;
  double rect_8;
  CGFloat rect_24;
  CGFloat height;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect result;

  rect_24 = a3.origin.y;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v7 = UIEdgeInsetsMakeWithEdges(15, a2, 54.0);
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[MFMessagePrinter paperRect](self, "paperRect");
  v15 = v9 + v14;
  v35 = v7 + v16;
  v18 = v17 - (v9 + v13);
  v20 = v19 - (v7 + v11);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MinY = CGRectGetMinY(v40);
  rect_8 = v18;
  v41.origin.x = v15;
  v41.origin.y = v35;
  v41.size.width = v18;
  v41.size.height = v20;
  v22 = fmax(MinY - CGRectGetMinY(v41), 0.0);
  v42.origin.x = v15;
  v42.origin.y = v35;
  v42.size.width = v18;
  v42.size.height = v20;
  MaxY = CGRectGetMaxY(v42);
  v43.origin.x = x;
  rect = x;
  v43.origin.y = rect_24;
  v43.size.width = width;
  v43.size.height = height;
  v24 = MaxY - CGRectGetMaxY(v43);
  if (v22 >= v24)
    v25 = v22;
  else
    v25 = v24;
  v44.origin.x = x;
  v44.origin.y = rect_24;
  v44.size.width = width;
  v44.size.height = height;
  MinX = CGRectGetMinX(v44);
  v45.origin.x = v15;
  v45.origin.y = v35;
  v45.size.width = rect_8;
  v45.size.height = v20;
  v27 = fmax(MinX - CGRectGetMinX(v45), 0.0);
  v46.origin.x = v15;
  v46.origin.y = v35;
  v46.size.width = rect_8;
  v46.size.height = v20;
  MaxX = CGRectGetMaxX(v46);
  v47.origin.x = rect;
  v47.origin.y = rect_24;
  v47.size.height = height;
  v47.size.width = width;
  v29 = MaxX - CGRectGetMaxX(v47);
  if (v27 >= v29)
    v30 = v27;
  else
    v30 = v29;
  v31 = v15 + v30;
  v32 = v35 + v25;
  v33 = rect_8 - (v30 + v30);
  v34 = v20 - (v25 + v25);
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)_setupPrintableContent
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  UIViewPrintFormatter *headerFormatter;
  void *v23;
  MFPrintMessageHeaderViewBlock *v24;
  void *v25;
  void *v26;
  UIViewPrintFormatter *v27;
  UIViewPrintFormatter *v28;
  double v29;
  double v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double headerLastPageHeight;
  UIViewPrintFormatter *bodyFormatter;
  UIViewPrintFormatter *v36;
  UIViewPrintFormatter *v37;
  id v38;

  if (!self->_isPrintableContentInitialized)
  {
    self->_isPrintableContentInitialized = 1;
    -[MFMessagePrinter printableRect](self, "printableRect");
    -[MFMessagePrinter _printingRectForImageableRect:](self, "_printingRectForImageableRect:");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v38 = (id)objc_claimAutoreleasedReturnValue(-[MFMessageViewController messageContentView](self->_messageViewController, "messageContentView"));
    objc_msgSend(v38, "setFrame:", 0.0, 0.0, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "mailboxProvider"));
    objc_msgSend(v38, "setMailboxProvider:", v12);

    objc_msgSend(v38, "layoutSubviews");
    -[MFMessagePrinter printableRect](self, "printableRect");
    -[MFMessagePrinter setHeaderHeight:](self, "setHeaderHeight:", v6 - v13);
    -[MFMessagePrinter printableRect](self, "printableRect");
    -[MFMessagePrinter setFooterHeight:](self, "setFooterHeight:", v14 + v15 - (v6 + v10));
    -[MFMessagePrinter printableRect](self, "printableRect");
    v17 = v16;
    -[MFMessagePrinter printableRect](self, "printableRect");
    v19 = v18;
    v21 = v20;
    headerFormatter = self->_headerFormatter;
    if (!headerFormatter)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "headerView"));
      objc_msgSend(v23, "removeAllHeaderBlocksAnimated:", 0);

      v24 = -[MFPrintMessageHeaderViewBlock initWithFrame:]([MFPrintMessageHeaderViewBlock alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "headerView"));
      objc_msgSend(v25, "addHeaderBlock:animated:", v24, 1);

      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "headerView"));
      v27 = (UIViewPrintFormatter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "viewPrintFormatter"));
      v28 = self->_headerFormatter;
      self->_headerFormatter = v27;

      -[MFMessagePrinter addPrintFormatter:startingAtPageAtIndex:](self, "addPrintFormatter:startingAtPageAtIndex:", self->_headerFormatter, 0);
      headerFormatter = self->_headerFormatter;
    }
    v29 = v4 - v17;
    v30 = v19 + v21 - (v4 + v8);
    -[UIViewPrintFormatter setPerPageContentInsets:](headerFormatter, "setPerPageContentInsets:", 0.0, v29, 0.0, v30);
    v31 = (uint64_t)-[UIViewPrintFormatter pageCount](self->_headerFormatter, "pageCount");
    if (v31 <= 1)
      v32 = 1;
    else
      v32 = v31;
    v33 = v32 - 1;
    -[UIViewPrintFormatter rectForPageAtIndex:](self->_headerFormatter, "rectForPageAtIndex:", v32 - 1);
    self->_headerLastPageHeight = headerLastPageHeight;
    bodyFormatter = self->_bodyFormatter;
    if (!bodyFormatter)
    {
      v36 = (UIViewPrintFormatter *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "viewPrintFormatter"));
      v37 = self->_bodyFormatter;
      self->_bodyFormatter = v36;

      -[MFMessagePrinter addPrintFormatter:startingAtPageAtIndex:](self, "addPrintFormatter:startingAtPageAtIndex:", self->_bodyFormatter, v33);
      headerLastPageHeight = self->_headerLastPageHeight;
      bodyFormatter = self->_bodyFormatter;
    }
    -[UIViewPrintFormatter setContentInsets:](bodyFormatter, "setContentInsets:", headerLastPageHeight, v29, 0.0, v30);

  }
}

- (void)messageViewController:(id)a3 didFinishRenderingWithHeight:(double)a4
{
  EFPromise *webLoadPromise;
  id v5;

  webLoadPromise = self->_webLoadPromise;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null", a3, a4));
  -[EFPromise finishWithResult:](webLoadPromise, "finishWithResult:");

}

- (void)drawContentForPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  CGContext *CurrentContext;
  CGContext *v13;
  CGContext *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  -[MFMessagePrinter _printingRectForImageableRect:](self, "_printingRectForImageableRect:", a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  CurrentContext = UIGraphicsGetCurrentContext();
  CGContextSaveGState(CurrentContext);
  CGContextTranslateCTM(CurrentContext, v7, v9);
  if (!a3 && self->_contactPhoto)
  {
    v13 = UIGraphicsGetCurrentContext();
    CGContextSaveGState(v13);
    v14 = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(v14, v11 + -27.0, 0.0);
    -[UIImage drawInRect:](self->_contactPhoto, "drawInRect:", 0.0, 0.0, 27.0, 27.0);
    v19.origin.x = 0.0;
    v19.origin.y = 0.0;
    v19.size.width = 27.0;
    v19.size.height = 27.0;
    v20 = CGRectInset(v19, -0.125, -0.125);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height, 1.0));
    objc_msgSend(v15, "setLineWidth:", 0.75);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    objc_msgSend(v16, "set");

    objc_msgSend(v15, "stroke");
    v21.origin.x = 0.0;
    v21.origin.y = 0.0;
    v21.size.width = 27.0;
    v21.size.height = 27.0;
    v22 = CGRectInset(v21, 0.125, 0.125);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height, 1.0));
    objc_msgSend(v17, "setLineWidth:", 0.25);
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.75, 1.0));
    objc_msgSend(v18, "set");

    objc_msgSend(v17, "stroke");
    CGContextRestoreGState(v13);

  }
  CGContextRestoreGState(CurrentContext);
}

- (void)drawPageAtIndex:(int64_t)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGSize v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  CGRect v24;
  CGRect remainder;
  CGRect slice;
  _BYTE v27[128];
  CGRect v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10.width = NAN;
  v10.height = NAN;
  slice.origin = (CGPoint)v10;
  slice.size = v10;
  remainder.origin = (CGPoint)v10;
  remainder.size = v10;
  v24.origin = (CGPoint)v10;
  v24.size = v10;
  -[MFMessagePrinter headerHeight](self, "headerHeight");
  v12 = v11;
  v28.origin.x = x;
  v28.origin.y = y;
  v28.size.width = width;
  v28.size.height = height;
  CGRectDivide(v28, &slice, &remainder, v12, CGRectMinYEdge);
  -[MFMessagePrinter footerHeight](self, "footerHeight");
  CGRectDivide(remainder, &v24, &remainder, v13, CGRectMaxYEdge);
  if (!CGRectIsEmpty(slice))
    -[MFMessagePrinter drawHeaderForPageAtIndex:inRect:](self, "drawHeaderForPageAtIndex:inRect:", a3, slice.origin.x, slice.origin.y, slice.size.width, slice.size.height);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessagePrinter printFormatters](self, "printFormatters", 0));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v14);
        v18 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        if ((uint64_t)objc_msgSend(v18, "startPage") <= a3)
        {
          v19 = objc_msgSend(v18, "startPage");
          if ((uint64_t)v19 + (uint64_t)objc_msgSend(v18, "pageCount") > a3)
            -[MFMessagePrinter drawPrintFormatter:forPageAtIndex:](self, "drawPrintFormatter:forPageAtIndex:", v18, a3);
        }
      }
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v20, v27, 16);
    }
    while (v15);
  }

  if (!CGRectIsEmpty(remainder))
    -[MFMessagePrinter drawContentForPageAtIndex:inRect:](self, "drawContentForPageAtIndex:inRect:", a3, remainder.origin.x, remainder.origin.y, remainder.size.width, remainder.size.height);
  if (!CGRectIsEmpty(v24))
    -[MFMessagePrinter drawFooterForPageAtIndex:inRect:](self, "drawFooterForPageAtIndex:inRect:", a3, v24.origin.x, v24.origin.y, v24.size.width, v24.size.height);
}

- (MFMessagePrinterDelegate)delegate
{
  return (MFMessagePrinterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (EMMessage)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (MFMailMessage)legacyMessage
{
  return self->_legacyMessage;
}

- (void)setLegacyMessage:(id)a3
{
  objc_storeStrong((id *)&self->_legacyMessage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legacyMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contactPhoto, 0);
  objc_storeStrong((id *)&self->_bodyFormatter, 0);
  objc_storeStrong((id *)&self->_headerFormatter, 0);
  objc_storeStrong((id *)&self->_webLoadPromise, 0);
  objc_storeStrong((id *)&self->_messageViewController, 0);
  objc_storeStrong((id *)&self->_window, 0);
}

@end
