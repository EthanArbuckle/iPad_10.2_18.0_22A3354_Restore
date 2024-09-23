@implementation MFSendAsEMLTriageInteraction

+ (id)log
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001A80A8;
  block[3] = &unk_10051A7D0;
  block[4] = a1;
  if (qword_1005AA3B0 != -1)
    dispatch_once(&qword_1005AA3B0, block);
  return (id)qword_1005AA3A8;
}

- (void)_performInteraction_Internal
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id location;

  v3 = objc_msgSend(objc_alloc((Class)_MFMailCompositionContext), "initWithComposeType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MFMessageCompositionTriageInteraction emailMessage](self, "emailMessage"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[EMContentRequestOptions optionsWithRequestedRepresentationType:networkUsage:](EMContentRequestOptions, "optionsWithRequestedRepresentationType:networkUsage:", EMContentRepresentationTypeRaw, 2));
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001A828C;
  v9[3] = &unk_100522AF0;
  objc_copyWeak(&v12, &location);
  v6 = v3;
  v10 = v6;
  v7 = v4;
  v11 = v7;
  v8 = objc_msgSend(v7, "requestRepresentationWithOptions:completionHandler:", v5, v9);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (id)title
{
  unsigned int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = -[MFSendAsEMLTriageInteraction forTriageTeam](self, "forTriageTeam");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = v3;
  if (v2)
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SEND_EML_TRIAGE"), &stru_100531B00, CFSTR("Main")));
  else
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("SEND_EML"), &stru_100531B00, CFSTR("Main")));
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityIdentifer
{
  return MSAccessibilityIdentifierActionsViewControllerSendAsEml;
}

- (id)_iconImageName
{
  return MFImageGlyphFiles;
}

- (id)_previewImageName
{
  return MFImageGlyphFiles;
}

- (BOOL)forTriageTeam
{
  return self->_forTriageTeam;
}

- (void)setForTriageTeam:(BOOL)a3
{
  self->_forTriageTeam = a3;
}

@end
