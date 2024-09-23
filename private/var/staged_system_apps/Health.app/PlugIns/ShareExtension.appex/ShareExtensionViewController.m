@implementation ShareExtensionViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  HKLoadingShareViewController *v5;
  HKLoadingShareViewController *loadingShareViewController;
  HKDocumentPickerViewController *documentPickerController;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v12;
  HKLoadingShareViewController *v13;

  v12.receiver = self;
  v12.super_class = (Class)ShareExtensionViewController;
  -[ShareExtensionViewController viewDidLoad](&v12, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBackgroundColor](UIColor, "systemBackgroundColor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController view](self, "view"));
  objc_msgSend(v4, "setBackgroundColor:", v3);

  v5 = -[HKLoadingShareViewController initWithNibName:bundle:]([HKLoadingShareViewController alloc], "initWithNibName:bundle:", 0, 0);
  loadingShareViewController = self->_loadingShareViewController;
  self->_loadingShareViewController = v5;

  documentPickerController = self->_documentPickerController;
  self->_documentPickerController = 0;

  v13 = self->_loadingShareViewController;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
  -[ShareExtensionViewController setViewControllers:](self, "setViewControllers:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController view](self, "view"));
  v10 = HKHealthTintColor();
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  objc_msgSend(v9, "setTintColor:", v11);

  -[ShareExtensionViewController _fetchShareData](self, "_fetchShareData");
}

- (void)_fetchShareData
{
  NSMutableArray *v3;
  NSMutableArray *documentsForPreview;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  _QWORD *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  uint64_t v21;
  id v22;
  uint64_t v23;
  _QWORD v24[5];
  _QWORD v25[5];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];

  v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  documentsForPreview = self->_documentsForPreview;
  self->_documentsForPreview = v3;

  self->_providerLoadingCount = 0;
  self->_incomingDocumentCount = 0;
  self->_passwordProtectedZipCount = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController extensionContext](self, "extensionContext"));
  v6 = v5;
  if (!v5)
  {
    -[ShareExtensionViewController _logError:message:](self, "_logError:message:", 0, CFSTR("No extension context present"));
    goto LABEL_25;
  }
  v19 = v5;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "inputItems"));
  v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (!v22)
    goto LABEL_23;
  v21 = *(_QWORD *)v31;
  do
  {
    v7 = 0;
    do
    {
      if (*(_QWORD *)v31 != v21)
        objc_enumerationMutation(obj);
      v23 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v7), "attachments"));
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", CFSTR("public.zip-archive"))
              && objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", CFSTR("public.file-url")))
            {
              -[ShareExtensionViewController _shareProviderLoading](self, "_shareProviderLoading");
              v25[0] = _NSConcreteStackBlock;
              v25[1] = 3221225472;
              v25[2] = sub_10000477C;
              v25[3] = &unk_100008208;
              v25[4] = self;
              v14 = v25;
              v15 = v13;
              v16 = CFSTR("public.file-url");
LABEL_17:
              objc_msgSend(v15, "loadItemForTypeIdentifier:options:completionHandler:", v16, 0, v14);
              continue;
            }
            if (objc_msgSend(v13, "hasItemConformingToTypeIdentifier:", CFSTR("public.xml")))
            {
              -[ShareExtensionViewController _shareProviderLoading](self, "_shareProviderLoading");
              v24[0] = _NSConcreteStackBlock;
              v24[1] = 3221225472;
              v24[2] = sub_10000480C;
              v24[3] = &unk_100008230;
              v24[4] = self;
              v14 = v24;
              v15 = v13;
              v16 = CFSTR("public.xml");
              goto LABEL_17;
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "registeredTypeIdentifiers"));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unable to handle item: %@"), v17));

            -[ShareExtensionViewController _logError:message:](self, "_logError:message:", 0, v18);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
        }
        while (v10);
      }

      v7 = v23 + 1;
    }
    while ((id)(v23 + 1) != v22);
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  }
  while (v22);
LABEL_23:

  v6 = v19;
LABEL_25:

}

- (void)_extractZipContent:(id)a3
{
  void *v4;
  id v5;
  unsigned __int8 v6;
  id v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "path"));
  v5 = objc_msgSend(objc_alloc((Class)_HKZipArchiveExtractor), "initWithPathname:", v4);
  v9[4] = self;
  v10 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100004980;
  v9[3] = &unk_100008258;
  v6 = objc_msgSend(v5, "enumerateEntriesWithError:block:", &v10, v9);
  v7 = v10;
  if ((v6 & 1) == 0)
  {
    _HKInitializeLogging();
    v8 = HKLogWellnessDashboard;
    if (os_log_type_enabled(HKLogWellnessDashboard, OS_LOG_TYPE_ERROR))
      sub_100005F00((uint64_t)v5, (uint64_t)v7, v8);
  }

}

- (BOOL)_containsPasswordProtectedData:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "subdataWithRange:", 0, 50));
    v6 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
    v7 = v6;
    if (v6 && objc_msgSend(v6, "length"))
    {
      v8 = 0;
      while (!objc_msgSend(v7, "characterAtIndex:", v8))
      {
        if (++v8 >= (unint64_t)objc_msgSend(v7, "length"))
          goto LABEL_7;
      }
      v9 = 0;
    }
    else
    {
LABEL_7:
      v9 = 1;
    }

  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (void)_prepareXMLData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = a3;
  if (-[ShareExtensionViewController _preflightForCDA:](self, "_preflightForCDA:", v4))
  {
    -[ShareExtensionViewController _incomingDocument](self, "_incomingDocument");
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v8 = 0;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[HKCDADocumentSample CDADocumentSampleWithData:startDate:endDate:metadata:validationError:](HKCDADocumentSample, "CDADocumentSampleWithData:startDate:endDate:metadata:validationError:", v4, v5, v5, 0, &v8));
    v7 = v8;
    if (v6)
      -[ShareExtensionViewController _addDocumentForPreview:](self, "_addDocumentForPreview:", v6);
    else
      -[ShareExtensionViewController _logError:message:](self, "_logError:message:", v7, CFSTR("Document did not pass validation"));

  }
  else
  {
    -[ShareExtensionViewController _logError:message:](self, "_logError:message:", 0, CFSTR("Document did not pass preflight checks"));
  }

}

- (BOOL)_preflightForCDA:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;

  v4 = a3;
  v5 = objc_alloc_init((Class)_HKXMLExtractor);
  objc_msgSend(v5, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/title"));
  objc_msgSend(v5, "addTagSpecificationForExtraction:", CFSTR("ClinicalDocument/component/structuredBody/component/section/templateId/@root"));
  objc_msgSend(v5, "parseWithData:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController _extractFirstOccurrenceOfTagRule:extactor:](self, "_extractFirstOccurrenceOfTagRule:extactor:", CFSTR("ClinicalDocument/title"), v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController _extractFirstOccurrenceOfTagRule:extactor:](self, "_extractFirstOccurrenceOfTagRule:extactor:", CFSTR("ClinicalDocument/component/structuredBody/component/section/templateId/@root"), v5));
  v8 = objc_msgSend(v4, "length");

  v9 = 0;
  if ((unint64_t)v8 <= 0x4C4B3E)
  {
    if (v6)
    {
      v9 = 0;
      if (objc_msgSend(v6, "length"))
      {
        if (v7)
          v9 = objc_msgSend(v7, "length") != 0;
      }
    }
  }

  return v9;
}

- (id)_extractFirstOccurrenceOfTagRule:(id)a3 extactor:(id)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "getDataForTagSpecification:", a3));
  if (objc_msgSend(v4, "count"))
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndex:", 0));
  else
    v5 = 0;

  return v5;
}

- (void)_allShareProvidersFinished
{
  uint64_t v3;
  int64_t incomingDocumentCount;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int64_t passwordProtectedZipCount;
  void *v21;
  _QWORD *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[6];

  v3 = (uint64_t)-[NSMutableArray count](self->_documentsForPreview, "count");
  incomingDocumentCount = self->_incomingDocumentCount;
  if (v3 >= 1)
  {
    v5 = incomingDocumentCount - v3;
    if (incomingDocumentCount <= v3)
    {
      -[ShareExtensionViewController _postDocumentPreview](self, "_postDocumentPreview", v5);
      return;
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v5));
    v7 = HKLocalizedStringForNumberWithTemplate(v6, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", self->_incomingDocumentCount));
    v10 = HKLocalizedStringForNumberWithTemplate(v9, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_SOME_INVALID_DOCUMENTS %@ %@"), &stru_100008528, CFSTR("HealthUI-Localizable")));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v8, v11));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_ALERT_TITLE"), &stru_100008528, CFSTR("HealthUI-Localizable")));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10000512C;
    v26[3] = &unk_100008280;
    v26[4] = self;
    -[ShareExtensionViewController _importAlertWithTitle:message:doneHandler:](self, "_importAlertWithTitle:message:doneHandler:", v16, v14, v26);

    goto LABEL_11;
  }
  if (incomingDocumentCount < 1)
  {
    passwordProtectedZipCount = self->_passwordProtectedZipCount;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_ALERT_TITLE"), &stru_100008528, CFSTR("HealthUI-Localizable")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
    v14 = v21;
    if (passwordProtectedZipCount < 1)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_NO_DOCUMENTS"), &stru_100008528, CFSTR("HealthUI-Localizable")));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100005144;
      v23[3] = &unk_100008280;
      v23[4] = self;
      v22 = v23;
    }
    else
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_PASSWORD_PROTECTED"), &stru_100008528, CFSTR("HealthUI-Localizable")));
      v24[0] = _NSConcreteStackBlock;
      v24[1] = 3221225472;
      v24[2] = sub_10000513C;
      v24[3] = &unk_100008280;
      v24[4] = self;
      v22 = v24;
    }
    -[ShareExtensionViewController _importAlertWithTitle:message:doneHandler:](self, "_importAlertWithTitle:message:doneHandler:", v11, v15, v22);
LABEL_11:

    goto LABEL_12;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_ALERT_TITLE"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_NO_VALID_DOCUMENTS"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100005134;
  v25[3] = &unk_100008280;
  v25[4] = self;
  -[ShareExtensionViewController _importAlertWithTitle:message:doneHandler:](self, "_importAlertWithTitle:message:doneHandler:", v17, v19, v25);

LABEL_12:
}

- (void)_postDocumentPreview
{
  HKDocumentPickerViewController *v3;
  HKDocumentPickerViewController *documentPickerController;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  _BOOL8 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  void *v18;
  id v19;
  _QWORD v20[5];
  CGAffineTransform v21;
  CGAffineTransform v22;
  HKDocumentPickerViewController *v23;

  v3 = (HKDocumentPickerViewController *)objc_msgSend(objc_alloc((Class)HKDocumentPickerViewController), "initWithDocuments:presentationStyle:", self->_documentsForPreview, 2);
  documentPickerController = self->_documentPickerController;
  self->_documentPickerController = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[HKSource defaultSource](HKSource, "defaultSource"));
  -[HKDocumentPickerViewController setSource:](self->_documentPickerController, "setSource:", v5);

  v19 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "_dismissShareExtension");
  v6 = objc_alloc((Class)UIBarButtonItem);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_DOCUMENT_IMPORT"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  v9 = objc_msgSend(v6, "initWithTitle:style:target:action:", v8, 0, self, "_saveDocumentsAction:");

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[HKDocumentPickerViewController navigationItem](self->_documentPickerController, "navigationItem"));
  objc_msgSend(v10, "setLeftBarButtonItem:", v19);
  objc_msgSend(v10, "setRightBarButtonItem:", v9);
  v11 = -[NSMutableArray count](self->_documentsForPreview, "count") == (id)1;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "rightBarButtonItem"));
  objc_msgSend(v12, "setEnabled:", v11);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("CDA_SHARE_DOCUMENT_TITLE"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  objc_msgSend(v10, "setTitle:", v14);

  v23 = self->_documentPickerController;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v23, 1));
  -[ShareExtensionViewController setViewControllers:](self, "setViewControllers:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController view](self, "view"));
  objc_msgSend(v16, "frame");
  CGAffineTransformMakeTranslation(&v22, 0.0, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[ShareExtensionViewController view](self, "view"));
  v21 = v22;
  objc_msgSend(v18, "setTransform:", &v21);

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100005438;
  v20[3] = &unk_100008280;
  v20[4] = self;
  +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v20, 0.2);

}

- (void)_saveDocumentsAction:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[HKDocumentPickerViewController enabledSamples](self->_documentPickerController, "enabledSamples", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));

  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc_init((Class)HKHealthStore);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10000554C;
    v7[3] = &unk_1000082D0;
    v7[4] = self;
    objc_msgSend(v6, "saveObjects:withCompletion:", v5, v7);

  }
  else
  {
    -[ShareExtensionViewController _dismissShareExtension](self, "_dismissShareExtension");
  }

}

- (void)_dismissShareExtension
{
  _QWORD v2[5];
  _QWORD v3[5];

  v2[4] = self;
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100005784;
  v3[3] = &unk_100008280;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1000057FC;
  v2[3] = &unk_1000082F8;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, v2, 0.2);
}

- (void)_importAlertWithTitle:(id)a3 message:(id)a4 doneHandler:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.HealthUI")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SHARE_ALERT_OK"), &stru_100008528, CFSTR("HealthUI-Localizable")));
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100005970;
  v14[3] = &unk_100008320;
  v15 = v8;
  v12 = v8;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIAlertAction actionWithTitle:style:handler:](UIAlertAction, "actionWithTitle:style:handler:", v11, 0, v14));

  objc_msgSend(v9, "addAction:", v13);
  -[ShareExtensionViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);

}

- (void)_logError:(id)a3 message:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;

  v5 = a3;
  v6 = a4;
  _HKInitializeLogging();
  v7 = HKLogWellnessDashboard;
  v8 = os_log_type_enabled(HKLogWellnessDashboard, OS_LOG_TYPE_ERROR);
  if (v5 && v6)
  {
    if (v8)
      sub_100005F7C((uint64_t)v6, v7, v5);
  }
  else if (v5)
  {
    if (v8)
      sub_100006030(v7, v5);
  }
  else if (v8)
  {
    sub_1000060CC((uint64_t)v6, v7, v9);
  }

}

- (void)_shareProviderLoading
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005A80;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_shareProviderFinished
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005AF4;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_addDocumentForPreview:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100005BA0;
  v4[3] = &unk_100008348;
  v4[4] = self;
  v5 = a3;
  v3 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

}

- (void)_incomingDocument
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C0C;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)_passwordProtectedZip
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005C80;
  block[3] = &unk_100008280;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (HKLoadingShareViewController)loadingShareViewController
{
  return self->_loadingShareViewController;
}

- (void)setLoadingShareViewController:(id)a3
{
  objc_storeStrong((id *)&self->_loadingShareViewController, a3);
}

- (NSMutableArray)documentsForPreview
{
  return self->_documentsForPreview;
}

- (void)setDocumentsForPreview:(id)a3
{
  objc_storeStrong((id *)&self->_documentsForPreview, a3);
}

- (int64_t)providerLoadingCount
{
  return self->_providerLoadingCount;
}

- (void)setProviderLoadingCount:(int64_t)a3
{
  self->_providerLoadingCount = a3;
}

- (int64_t)incomingDocumentCount
{
  return self->_incomingDocumentCount;
}

- (void)setIncomingDocumentCount:(int64_t)a3
{
  self->_incomingDocumentCount = a3;
}

- (int64_t)passwordProtectedZipCount
{
  return self->_passwordProtectedZipCount;
}

- (void)setPasswordProtectedZipCount:(int64_t)a3
{
  self->_passwordProtectedZipCount = a3;
}

- (HKDocumentPickerViewController)documentPickerController
{
  return self->_documentPickerController;
}

- (void)setDocumentPickerController:(id)a3
{
  objc_storeStrong((id *)&self->_documentPickerController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentPickerController, 0);
  objc_storeStrong((id *)&self->_documentsForPreview, 0);
  objc_storeStrong((id *)&self->_loadingShareViewController, 0);
}

@end
