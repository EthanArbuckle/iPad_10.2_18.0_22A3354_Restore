@implementation _BSUIGoalsSharableTextProvider

- (_BSUIGoalsSharableTextProvider)initWithSharableImage:(id)a3 kind:(unint64_t)a4 year:(unint64_t)a5 title:(id)a6 sharingUrls:(id)a7
{
  id v13;
  id v14;
  id v15;
  _BSUIGoalsSharableTextProvider *v16;
  _BSUIGoalsSharableTextProvider *v17;
  objc_super v19;

  v13 = a3;
  v14 = a6;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)_BSUIGoalsSharableTextProvider;
  v16 = -[_BSUIGoalsSharableTextProvider init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    v16->_kind = a4;
    objc_storeStrong((id *)&v16->_sharedImage, a3);
    v17->_year = a5;
    objc_storeStrong((id *)&v17->_title, a6);
    objc_storeStrong((id *)&v17->_sharingUrls, a7);
  }

  return v17;
}

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;

  v5 = a4;
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypePostToFacebook))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateFacebookMessage](self, "_generateFacebookMessage"));
LABEL_10:
    v7 = (void *)v6;
    goto LABEL_11;
  }
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypePostToTwitter))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateTwitterMessage](self, "_generateTwitterMessage"));
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", UIActivityTypeMail))
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _buildMailHTML](self, "_buildMailHTML"));
    goto LABEL_10;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.burbn.instagram.shareextension")) & 1) == 0)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateMessageWithURLForActivityType:](self, "_generateMessageWithURLForActivityType:", v5));
    goto LABEL_10;
  }
  v7 = 0;
LABEL_11:

  return v7;
}

- (id)activityViewControllerPlaceholderItem:(id)a3
{
  return 0;
}

- (id)activityViewControllerLinkPresentationMetadata:(id)a3
{
  return -[_BSUIGoalsSharableTextProvider _generateLinkMetaData](self, "_generateLinkMetaData", a3);
}

- (id)activityViewControllerLinkMetadata:(id)a3
{
  return -[_BSUIGoalsSharableTextProvider _generateLinkMetaData](self, "_generateLinkMetaData", a3);
}

- (id)_generateLinkMetaData
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  CGFloat v8;
  UIImage *sharedImage;
  UIImage *ImageFromCurrentImageContext;
  UIImage *v11;
  id v12;
  NSData *v13;
  void *v14;
  id v15;
  CGSize v17;

  if (self->_sharedImage)
  {
    v3 = objc_alloc_init((Class)LPLinkMetadata);
    objc_msgSend(v3, "setTitle:", self->_title);
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateMessageWithURLForActivityType:](self, "_generateMessageWithURLForActivityType:", UIActivityTypeMessage));
    objc_msgSend(v3, "setSummary:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "scale");
    v7 = v6;

    v8 = v7 * 40.0;
    v17.width = v8;
    v17.height = v8;
    UIGraphicsBeginImageContext(v17);
    sharedImage = self->_sharedImage;
    CGRectMakeWithOriginSize(CGPointZero.x, CGPointZero.y, v8, v8);
    -[UIImage drawInRect:](sharedImage, "drawInRect:");
    ImageFromCurrentImageContext = UIGraphicsGetImageFromCurrentImageContext();
    v11 = (UIImage *)objc_claimAutoreleasedReturnValue(ImageFromCurrentImageContext);
    UIGraphicsEndImageContext();
    v12 = objc_alloc((Class)LPImage);
    v13 = UIImagePNGRepresentation(v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v12, "initWithData:MIMEType:", v14, CFSTR("image/png"));

    objc_msgSend(v3, "setImage:", v15);
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)activityViewController:(id)a3 subjectForActivityType:(id)a4
{
  void *v5;
  void *v6;
  uint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _mailSubjectForGoalKind](self, "_mailSubjectForGoalKind", a3, a4));
  if (self->_kind == 8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateLocalizedYear](self, "_generateLocalizedYear"));
    v7 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v6));

    v5 = (void *)v7;
  }
  return v5;
}

- (id)_readingGoalsURLForActivityType:(id)a3
{
  void *v3;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  dispatch_semaphore_t v15;
  void *v16;
  void *v17;
  dispatch_time_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  id v24;
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  id *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  v6 = a3;
  v29 = 0;
  v30 = (id *)&v29;
  v31 = 0x3032000000;
  v32 = sub_90D8;
  v33 = sub_90E8;
  v34 = 0;
  if (self->_sharingUrls)
  {
    v7 = objc_opt_class(NSString, v5);
    v8 = objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_sharingUrls, "objectForKeyedSubscript:", v6));
    v9 = BUDynamicCast(v7, v8);
    v11 = objc_claimAutoreleasedReturnValue(v9);
    v12 = v11;
    if (!v11)
    {
      v13 = objc_opt_class(NSString, v10);
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSDictionary objectForKeyedSubscript:](self->_sharingUrls, "objectForKeyedSubscript:", CFSTR("default")));
      v14 = BUDynamicCast(v13, v3);
      v12 = objc_claimAutoreleasedReturnValue(v14);
    }
    objc_storeStrong(v30 + 5, v12);
    if (!v11)
    {

    }
  }
  else
  {
    v15 = dispatch_semaphore_create(0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[BUBag defaultBag](BUBag, "defaultBag"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "readingGoalShareURL"));
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_90F0;
    v26[3] = &unk_2E4118;
    v28 = &v29;
    v8 = v15;
    v27 = v8;
    objc_msgSend(v17, "valueWithCompletion:", v26);

    v18 = dispatch_time(0, 300000000);
    if (!dispatch_semaphore_wait(v8, v18))
    {
      v22 = BSUIGoalsSharableImageRendererLog(0, v19, v20, v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_238288(v23);

    }
    v11 = v27;
  }

  v24 = v30[5];
  _Block_object_dispose(&v29, 8);

  return v24;
}

- (id)_buildMailHTML
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSData *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v22;

  v3 = BSUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Set your own reading goals on %@Apple Books%@."), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _mailMessageForGoalKind](self, "_mailMessageForGoalKind"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _readingGoalsURLForActivityType:](self, "_readingGoalsURLForActivityType:", UIActivityTypeMail));
  v8 = objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _escapeHTMLCharactersInString:](self, "_escapeHTMLCharactersInString:", v5));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _escapeHTMLCharactersInString:](self, "_escapeHTMLCharactersInString:", v6));
  if (self->_kind == 8)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateLocalizedYear](self, "_generateLocalizedYear"));
    v11 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v9, v10));

    v9 = (void *)v11;
  }
  v12 = UIImagePNGRepresentation(self->_sharedImage);
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "base64EncodedStringWithOptions:", 0));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("data:image/png;base64,%@"),
                    v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<img width='100%%' src='%@'/>"), v15));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<a href='%@'>"), v7));
  v22 = (void *)v8;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v8, v17, CFSTR("</a>")));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<p>%@<br/>%@<br/>%@</p>"), v9, v16, v18));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<html><body>%@</body></html>"), v19));

  return v20;
}

- (id)_escapeHTMLCharactersInString:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("&"), CFSTR("&amp;")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("<"), CFSTR("&lt;")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR(">"), CFSTR("&gt;")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\"), CFSTR("&quot;")));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("'"), CFSTR("&#39;")));
  return v7;
}

- (id)_baseMessageForGoalKind
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress for today.");
      goto LABEL_11;
    case 2uLL:
      v7 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v4 = v3;
      v5 = CFSTR("I’ve reached my daily reading goal!");
      goto LABEL_11;
    case 3uLL:
      v8 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress so far this year.");
      goto LABEL_11;
    case 4uLL:
      v9 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v4 = v3;
      v5 = CFSTR("I’ve reached my yearly reading goal!");
      goto LABEL_11;
    case 5uLL:
      v10 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v4 = v3;
      v5 = CFSTR("Here’s my current reading streak.");
      goto LABEL_11;
    case 6uLL:
      v11 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v4 = v3;
      v5 = CFSTR("I’ve achieved my longest reading streak.");
      goto LABEL_11;
    case 7uLL:
      v12 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v4 = v3;
      v5 = CFSTR("Here’s my longest reading streak.");
      goto LABEL_11;
    case 8uLL:
      v13 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v4 = v3;
      v5 = CFSTR("Here’s what I read in %@.");
LABEL_11:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

      break;
    default:
      v6 = &stru_2F6710;
      break;
  }
  return v6;
}

- (id)_messageForGoalKind
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress for today. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 2uLL:
      v7 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v4 = v3;
      v5 = CFSTR("I’ve reached my daily reading goal. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 3uLL:
      v8 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress so far this year. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 4uLL:
      v9 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v4 = v3;
      v5 = CFSTR("I’ve reached my yearly reading goal! Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 5uLL:
      v10 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v4 = v3;
      v5 = CFSTR("Here’s my current reading streak. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 6uLL:
      v11 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v4 = v3;
      v5 = CFSTR("I’ve achieved my longest reading streak. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 7uLL:
      v12 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v4 = v3;
      v5 = CFSTR("Here’s my longest reading streak. Set your own reading goals on Apple Books: ");
      goto LABEL_11;
    case 8uLL:
      v13 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v4 = v3;
      v5 = CFSTR("Here’s what I read in %@. Set your own reading goals on Apple Books: ");
LABEL_11:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

      break;
    default:
      v6 = &stru_2F6710;
      break;
  }
  return v6;
}

- (id)_mailMessageForGoalKind
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  switch(self->_kind)
  {
    case 1uLL:
      v2 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress for today:");
      goto LABEL_11;
    case 2uLL:
      v7 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v4 = v3;
      v5 = CFSTR("I’ve reached my daily reading goal.");
      goto LABEL_11;
    case 3uLL:
      v8 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v4 = v3;
      v5 = CFSTR("Here’s my reading progress so far this year:");
      goto LABEL_11;
    case 4uLL:
      v9 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v4 = v3;
      v5 = CFSTR("I’ve reached my yearly reading goal!");
      goto LABEL_11;
    case 5uLL:
      v10 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v4 = v3;
      v5 = CFSTR("Here’s my current reading streak:");
      goto LABEL_11;
    case 6uLL:
      v11 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v4 = v3;
      v5 = CFSTR("I’ve achieved my longest reading streak.");
      goto LABEL_11;
    case 7uLL:
      v12 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v4 = v3;
      v5 = CFSTR("Here’s my longest reading streak:");
      goto LABEL_11;
    case 8uLL:
      v13 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v4 = v3;
      v5 = CFSTR("Here’s what I read in %@:");
LABEL_11:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

      break;
    default:
      v6 = &stru_2F6710;
      break;
  }
  return v6;
}

- (id)_mailSubjectForGoalKind
{
  id v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  __CFString *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  switch(self->_kind)
  {
    case 1uLL:
      v7 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v7);
      v4 = v3;
      v5 = CFSTR("My Daily Reading Progress");
      goto LABEL_10;
    case 2uLL:
      v8 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v8);
      v4 = v3;
      v5 = CFSTR("My Daily Reading Goal Achieved");
      goto LABEL_10;
    case 3uLL:
      v9 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v9);
      v4 = v3;
      v5 = CFSTR("My Yearly Reading Goal");
      goto LABEL_10;
    case 4uLL:
      v10 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v4 = v3;
      v5 = CFSTR("My Yearly Reading Goal Achieved");
      goto LABEL_10;
    case 5uLL:
      v11 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v4 = v3;
      v5 = CFSTR("My Reading Streak");
      goto LABEL_10;
    case 6uLL:
    case 7uLL:
      v2 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
      v4 = v3;
      v5 = CFSTR("My Reading Streak Record");
      goto LABEL_10;
    case 8uLL:
      v12 = BSUIBundle();
      v3 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v4 = v3;
      v5 = CFSTR("Books Read in %@");
LABEL_10:
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_2F6710, CFSTR("BookStoreUILocalizable")));

      break;
    default:
      v6 = &stru_2F6710;
      break;
  }
  return v6;
}

- (id)_generateFacebookMessage
{
  return CFSTR("#AppleBooks");
}

- (id)_generateTwitterMessage
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _baseMessageForGoalKind](self, "_baseMessageForGoalKind"));
  v3 = BSUIBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("Set your own #ReadingGoals on @AppleBooks. apple.co/ReadingGoals"), &stru_2F6710, CFSTR("BookStoreUILocalizable")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingFormat:", CFSTR(" %@"), v5));
  return v6;
}

- (id)_generateMessageWithURLForActivityType:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _messageForGoalKind](self, "_messageForGoalKind"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _readingGoalsURLForActivityType:](self, "_readingGoalsURLForActivityType:", v4));

  if (self->_kind == 8)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[_BSUIGoalsSharableTextProvider _generateLocalizedYear](self, "_generateLocalizedYear"));
    v8 = objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v5, v7));

    v5 = (void *)v8;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%@"), v5, v6));

  return v9;
}

- (id)_generateLocalizedYear
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  v3 = objc_alloc_init((Class)NSDateComponents);
  objc_msgSend(v3, "setDay:", 31);
  objc_msgSend(v3, "setMonth:", 12);
  objc_msgSend(v3, "setYear:", self->_year);
  v4 = objc_msgSend(objc_alloc((Class)NSCalendar), "initWithCalendarIdentifier:", NSCalendarIdentifierGregorian);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dateFromComponents:", v3));
  v6 = objc_alloc_init((Class)NSDateFormatter);
  objc_msgSend(v6, "setDateStyle:", 2);
  objc_msgSend(v6, "setLocalizedDateFormatFromTemplate:", CFSTR("y"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringFromDate:", v5));

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingUrls, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_sharedImage, 0);
}

@end
