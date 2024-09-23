@implementation BKPDFActionController

- (id)activityItems
{
  id v3;
  void *v4;
  BKActivityPDFLinkPresentationItemSource *v5;
  void *v6;
  BKActivityPDFLinkPresentationItemSource *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BKPDFActionController;
  v3 = -[BKActionController activityItems](&v9, "activityItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = [BKActivityPDFLinkPresentationItemSource alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
  v7 = -[BKActivityPDFLinkPresentationItemSource initWithBookInfo:](v5, "initWithBookInfo:", v6);

  objc_msgSend(v4, "addObject:", v7);
  return v4;
}

- (BOOL)_isPrintingAllowedForBook:(id)a3
{
  void *v3;
  Class v4;
  id v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "url"));
  v4 = NSClassFromString(CFSTR("UIPrintInteractionController"));
  if (v4 && -[objc_class canPrintURL:](v4, "canPrintURL:", v3))
  {
    v5 = objc_msgSend(objc_alloc((Class)NSData), "initWithContentsOfURL:options:error:", v3, 1, 0);
    v6 = v5 != 0;

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_bookHasCapability:(id)a3
{
  uint64_t v3;

  if (objc_msgSend(a3, "isManagedBook"))
    v3 = 2;
  else
    v3 = 1;
  return +[MFMailComposeViewController canSendMailSourceAccountManagement:](MFMailComposeViewController, "canSendMailSourceAccountManagement:", v3);
}

- (BOOL)_isEmailAllowedForBook:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;

  v4 = a3;
  if (-[BKPDFActionController _bookHasCapability:](self, "_bookHasCapability:", v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bookBundlePath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v5));
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v8 = v7;
    if (v6 && objc_msgSend(v7, "fileExistsAtPath:", v5))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "attributesOfItemAtPath:error:", v5, 0));
      v10 = v9;
      v13 = 0;
      if (v9)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", NSFileSize));
        v12 = objc_msgSend(v11, "unsignedLongLongValue");

        if ((unint64_t)v12 < 0x12C0001)
          v13 = 1;
      }

    }
    else
    {
      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)canPrintBook
{
  void *v3;
  _BOOL4 v4;
  objc_super v6;

  if (!-[BKPDFActionController didComputePrintingAllowed](self, "didComputePrintingAllowed"))
  {
    -[BKPDFActionController setDidComputePrintingAllowed:](self, "setDidComputePrintingAllowed:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
    -[BKPDFActionController setIsPrintingAllowed:](self, "setIsPrintingAllowed:", -[BKPDFActionController _isPrintingAllowedForBook:](self, "_isPrintingAllowedForBook:", v3));

  }
  v6.receiver = self;
  v6.super_class = (Class)BKPDFActionController;
  v4 = -[BKActionController canPrintBook](&v6, "canPrintBook");
  if (v4)
    LOBYTE(v4) = -[BKPDFActionController isPrintingAllowed](self, "isPrintingAllowed");
  return v4;
}

- (BOOL)canEmailBook
{
  void *v3;

  if (!-[BKPDFActionController didComputeMailingAllowed](self, "didComputeMailingAllowed"))
  {
    -[BKPDFActionController setDidComputeMailingAllowed:](self, "setDidComputeMailingAllowed:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
    -[BKPDFActionController setIsMailingAllowed:](self, "setIsMailingAllowed:", -[BKPDFActionController _isEmailAllowedForBook:](self, "_isEmailAllowedForBook:", v3));

  }
  return -[BKPDFActionController isMailingAllowed](self, "isMailingAllowed");
}

- (BOOL)canMarkupAsPDF
{
  return 0;
}

- (BOOL)canAirDrop
{
  void *v2;
  char v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
  v3 = objc_msgSend(v2, "isManagedBook") ^ 1;

  return v3;
}

- (void)_setActivities
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  if (-[BKPDFActionController canEmailBook](self, "canEmailBook"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v3, "addObject:", UIActivityTypeMail);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v4, "addObject:", UIActivityTypeMessage);

  }
  if (-[BKPDFActionController canPrintBook](self, "canPrintBook"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v5, "addObject:", UIActivityTypePrint);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[BCProgressKitController sharedController](BCProgressKitController, "sharedController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController bookInfo](self, "bookInfo"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "assetID"));
  v9 = objc_msgSend(v6, "isTrackingAssetID:", v8);

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v10, "addObject:", IMActivityTypeSaveToClassKitApp);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
    objc_msgSend(v11, "addObject:", IMActivityTypeShareToClassKitApp);

  }
  if (!-[BKPDFActionController canMarkupAsPDF](self, "canMarkupAsPDF"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController excludedActivityTypes](self, "excludedActivityTypes"));
    objc_msgSend(v12, "addObject:", UIActivityTypeMarkupAsPDF);

  }
  if (-[BKPDFActionController canAirDrop](self, "canAirDrop"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController includedActivityTypes](self, "includedActivityTypes"));
  else
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKActionController excludedActivityTypes](self, "excludedActivityTypes"));
  v14 = v13;
  objc_msgSend(v13, "addObject:", UIActivityTypeAirDrop);

}

- (BOOL)didComputePrintingAllowed
{
  return self->_didComputePrintingAllowed;
}

- (void)setDidComputePrintingAllowed:(BOOL)a3
{
  self->_didComputePrintingAllowed = a3;
}

- (BOOL)isPrintingAllowed
{
  return self->_isPrintingAllowed;
}

- (void)setIsPrintingAllowed:(BOOL)a3
{
  self->_isPrintingAllowed = a3;
}

- (BOOL)didComputeMailingAllowed
{
  return self->_didComputeMailingAllowed;
}

- (void)setDidComputeMailingAllowed:(BOOL)a3
{
  self->_didComputeMailingAllowed = a3;
}

- (BOOL)isMailingAllowed
{
  return self->_isMailingAllowed;
}

- (void)setIsMailingAllowed:(BOOL)a3
{
  self->_isMailingAllowed = a3;
}

@end
